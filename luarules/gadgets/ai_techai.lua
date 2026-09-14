--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    ai_techai.lua
--  brief:   Tech Annihilation Fog of War AI for Recoil Engine
--  author:  Antigravity
--
--  Supports all 6 factions: ARM, CORE, TLL, TALON, GOK, RUMAD
--  Features:
--   - Strict Fog of War (FOW) compliance via Line of Sight (LOS) and radar.
--   - Active reconnaissance, sector exploration, and scout dispatching.
--   - Intel memory tracking enemy bases, factories, and metal extractors.
--   - Experience-based unit morphing: monitors battle XP, verifies requirements,
--     sets aside reserved metal/energy budgets, and protects morphing units.
--   - Full Tech Level 1 to 5 structure and economy progression:
--       T1: Basic Labs, Solar/Wind, T1 Mex, Light Laser Turrets.
--       T2: Advanced Labs, Moho Mexes, Fusions, T2 Nanotowers, Flak AA.
--       T3: T3 Shipyards/Gantries, T3 Nanotowers, Heavy Plasma, Makers.
--       T4: Experimental/Ultimate Labs, T4 Nanotowers, Mega Fusions, Titans.
--       T5: T5 Cruisers/Builders, T5 192K-210K Metal Makers, Ultimate Fusions,
--           T5 Nanotowers (nanotc4), and Doomsday Superweapons (Vulcan/Buzzsaw/Planetkiller).
--   - BARb Advanced Tactical Systems:
--       * Frontline estimation and staging rally points behind the frontline.
--       * Dynamic energy converter throttling (on at >= 82% E, off at < 35% E).
--       * Field hospital retreat & repair for damaged combat forces.
--       * Raider flanking and kiting targeting enemy mexes and energy.
--       * Stand-off artillery kiting micro against approaching hostiles.
--       * Resurrector unit salvage: revives fallen combat units and commanders.
--   - Coordinated wave assaults and tactical Commander D-Gun micro.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
	return {
		name    = "TechAI",
		desc    = "Fog of War AI with demand-driven economy, T1-T6 units, T5 factories and adaptive armies",
		author  = "TechA Milisandia",
		date    = "2026",
		layer   = -90,
		enabled = true,
	}
end

--------------------------------------------------------------------------------
-- Synced Execution Only
--------------------------------------------------------------------------------
if not gadgetHandler:IsSyncedCode() then
	return
end

--------------------------------------------------------------------------------
-- Speedups & Constants
--------------------------------------------------------------------------------
local spGetTeamResources      = Spring.GetTeamResources
local spAddTeamResource       = Spring.AddTeamResource
local spSetTeamResource       = Spring.SetTeamResource
local spGetTeamUnits          = Spring.GetTeamUnits
local spGetUnitDefID          = Spring.GetUnitDefID
local spGetUnitTeam           = Spring.GetUnitTeam
local spGetUnitIsBuilding     = Spring.GetUnitIsBuilding
local spGetUnitPosition       = Spring.GetUnitPosition
local spGetUnitHealth         = Spring.GetUnitHealth
local spGetUnitExperience     = Spring.GetUnitExperience
local spGetUnitNearestEnemy   = Spring.GetUnitNearestEnemy
local spGetUnitsInCylinder    = Spring.GetUnitsInCylinder
local spGetCommandQueue       = Spring.GetCommandQueue
local spGetUnitCommandCount   = Spring.GetUnitCommandCount
local spGetFullBuildQueue     = Spring.GetFullBuildQueue
local spGiveOrderToUnit       = Spring.GiveOrderToUnit
local spTestBuildOrder        = Spring.TestBuildOrder
local spGetGroundHeight       = Spring.GetGroundHeight
local spIsPosInLos            = Spring.IsPosInLos
local spIsPosInRadar          = Spring.IsPosInRadar
local spGetUnitLosState       = Spring.GetUnitLosState
local spGetTeamInfo           = Spring.GetTeamInfo
local spAreTeamsAllied        = Spring.AreTeamsAllied
local spGetUnitRulesParam     = Spring.GetUnitRulesParam
local spGetFeaturesInCylinder = Spring.GetFeaturesInCylinder
local spGetFeatureDefID       = Spring.GetFeatureDefID
local spGetFeaturePosition    = Spring.GetFeaturePosition
local spGetFeatureResurrect   = Spring.GetFeatureResurrect
local FeatureDefs             = FeatureDefs

local CMD_MOVE        = CMD.MOVE
local CMD_FIGHT       = CMD.FIGHT
local CMD_ATTACK      = CMD.ATTACK
local CMD_PATROL      = CMD.PATROL
local CMD_REPAIR      = CMD.REPAIR
local CMD_RECLAIM     = CMD.RECLAIM
local CMD_RESURRECT   = CMD.RESURRECT or 125
local CMD_DGUN        = CMD.DGUN
local CMD_GUARD       = CMD.GUARD
local CMD_STOP        = CMD.STOP
local CMD_ONOFF       = CMD.ONOFF or 27
local CMD_MORPH       = 31410 -- Base generic morph command ID from unit_morph.lua

local MAP_SIZE_X = Game.mapSizeX
local MAP_SIZE_Z = Game.mapSizeZ
local SECTOR_SIZE = 512
local SECTORS_X = math.max(1, math.ceil(MAP_SIZE_X / SECTOR_SIZE))
local SECTORS_Z = math.max(1, math.ceil(MAP_SIZE_Z / SECTOR_SIZE))

local aiTeams = {}
local aiTeamList = {}
local aiTeamCount = 0

-- Keep strategic orders stable: replacing identical orders restarts pathfinding.
local function GiveTacticalOrder(ai, unitID, command, params, frame)
	frame = frame or Spring.GetGameFrame()
	ai.tacticalOrders = ai.tacticalOrders or {}
	local old = ai.tacticalOrders[unitID]
	if old and old.command == command and frame - old.frame < 150 then
		local same = #params == #old.params
		for i = 1, #params do
			if math.abs(params[i] - (old.params[i] or 0)) > (#params == 1 and 0 or 96) then same = false; break end
		end
		if same and (spGetUnitCommandCount(unitID) or 0) > 0 then return false end
	end
	spGiveOrderToUnit(unitID, command, params, 0)
	ai.tacticalOrders[unitID] = { command = command, params = params, frame = frame }
	return true
end

local function IsUnitReady(unitID)
	local hp, _, _, _, progress = spGetUnitHealth(unitID)
	return hp and hp > 0 and (not progress or progress >= 1)
end

-- Faction keys
local FACTIONS = {
	ARM   = "arm",
	CORE  = "core",
	TLL   = "tll",
	TALON = "talon",
	GOK   = "gok",
	RUMAD = "rumad",
}

-- Difficulty settings
local DIFFICULTY = {
	EASY = {
		name = "Easy",
		orderDelay = 45,           -- frames between AI management cycles
		squadSize = 14,            -- units before launching assault
		scoutFrequency = 900,      -- frames between scout sweeps
		t2Threshold = 24,          -- metal income needed for T2
		t3Threshold = 55,          -- metal income needed for T3
		t4Threshold = 100,         -- metal income needed for T4
		t5Threshold = 180,         -- metal income needed for T5
		maxBuilders = 5,
		cheatScale = 0.0,          -- No resource cheating
	},
	NORMAL = {
		name = "Medium",
		orderDelay = 30,
		squadSize = 10,
		scoutFrequency = 600,
		t2Threshold = 18,
		t3Threshold = 45,
		t4Threshold = 80,
		t5Threshold = 140,
		maxBuilders = 8,
		cheatScale = 1.0,          -- Medium cheat
		cheatIncomePctStart = 0.15, -- +15% income bonus early
		cheatIncomePctMax   = 0.75, -- scales up to +75% income bonus late
		cheatFlatMetalStart = 1.5,  -- +1.5 M/s early
		cheatFlatMetalMax   = 22.0, -- scales up to +22 M/s late
		cheatFlatEnergyStart= 20,   -- +20 E/s early
		cheatFlatEnergyMax  = 350,  -- scales up to +350 E/s late
		storageBonusMax     = 6000, -- dynamic storage expansion
	},
	HARD = {
		name = "Hard",
		orderDelay = 20,
		squadSize = 8,
		scoutFrequency = 450,
		t2Threshold = 15,
		t3Threshold = 38,
		t4Threshold = 65,
		t5Threshold = 110,
		maxBuilders = 12,
		cheatScale = 2.0,          -- Hard cheat
		cheatIncomePctStart = 0.30, -- +30% income bonus early
		cheatIncomePctMax   = 1.60, -- scales up to +160% income bonus late
		cheatFlatMetalStart = 4.0,  -- +4.0 M/s early
		cheatFlatMetalMax   = 60.0, -- scales up to +60 M/s late
		cheatFlatEnergyStart= 60,   -- +60 E/s early
		cheatFlatEnergyMax  = 1200, -- scales up to +1200 E/s late
		storageBonusMax     = 20000,-- dynamic storage expansion
	},
}
DIFFICULTY.MEDIUM = DIFFICULTY.NORMAL

--------------------------------------------------------------------------------
-- Multi-Tier 6-Faction Cataloging (Tech Level 1 to 5)
--------------------------------------------------------------------------------
local function CreateFactionCatalog()
	return {
		commanders = {},
		-- Metal extractors across Tech Levels 1 to 5
		t1mex = {},
		t2mex = {},
		t3mex = {},
		t4mex = {},
		t5mex = {},
		-- Factories across Tech Levels 1 to 5
		t1factories = {},
		t1kbot_fac = {},
		t1veh_fac = {},
		t1air_fac = {},
		t1sea_fac = {},
		t1hov_fac = {},
		t2factories = {},
		t3factories = {},
		t4factories = {},
		t5factories = {},
		-- Constructors across Tech Levels 1 to 5
		t1con = {},
		t2con = {},
		t3con = {},
		t4con = {},
		t5con = {},
		-- Energy Generators across Tech Levels 1 to 5
		t1energy = {},
		t2energy = {},
		t3energy = {},
		t4energy = {},
		t5energy = {},
		wind = {},
		solar = {},
		tidal = {},
		geo = {},
		-- Metal Makers across Tech Levels 1 to 5
		t1makers = {},
		t2makers = {},
		t3makers = {},
		t4makers = {},
		t5makers = {},
		-- Nanotowers across Tech Levels 1 to 5
		t1nanotc = {},
		t2nanotc = {},
		t3nanotc = {},
		t4nanotc = {},
		t5nanotc = {},
		-- Defenses across Tech Levels 1 to 5
		t1defenses = {},
		t2defenses = {},
		t3defenses = {},
		t4defenses = {},
		t5defenses = {},
		radar = {},
		aa = {},
		scouts = {},
		raiders = {},
		combat = {},
		artillery = {},
		t4combat = {},
		t5combat = {},
		rezUnits = {},
	}
end

local FactionUnitCatalog = {
	arm   = CreateFactionCatalog(),
	core  = CreateFactionCatalog(),
	tll   = CreateFactionCatalog(),
	talon = CreateFactionCatalog(),
	gok   = CreateFactionCatalog(),
	rumad = CreateFactionCatalog(),
}

local Metadata = VFS.Include('LuaRules/Configs/techai_metadata.lua')
local MakerDefs = VFS.FileExists('LuaRules/Configs/maker_defs.lua') and VFS.Include('LuaRules/Configs/maker_defs.lua') or {}
local UnitMetadata = {} -- [unitDefID] = { faction = "...", role = "...", tech = 1..5, isWater = bool }

local MetalScanner = VFS.Include('LuaRules/Configs/techai_metal.lua')
local discoveredMetalSpots
local function GetMetalSpots()
	if discoveredMetalSpots then return discoveredMetalSpots end
	local spots=GG.metalSpots or _G.metalSpots
	return type(spots)=='table' and spots or {}
end
-- Geothermal vents are enumerated as features (see geo_spot_finder.lua) before
-- game start and re-merged shortly after, so this getter stays live and never
-- caches — late-scan vents already land in GG.geoSpots.
local function GetGeoSpots()
	local spots=GG.geoSpots or _G.geoSpots
	return type(spots)=='table' and spots or {}
end
local BaseLayout = VFS.Include('LuaRules/Configs/techai_layout.lua').Create(UnitMetadata,aiTeams,GetMetalSpots,GetGeoSpots)
local rawGiveOrderToUnit=spGiveOrderToUnit
spGiveOrderToUnit=function(unitID,command,params,options)
	local result=rawGiveOrderToUnit(unitID,command,params,options)
	if result~=false and command<0 and params and params[1] and params[3] then
		local ai=aiTeams[spGetUnitTeam(unitID)]
		if ai then BaseLayout.Reserve(ai,unitID,-command,params[1],params[3],params[4] or 0) end
	end
	return result
end

-- Some maps create their start deposits in GameStart, after the shared metal
-- finder populated GG.metalSpots. Re-read each spawn area once the commanders
-- are known, then retry any opening that could not find local mexes.
local metalRescanDone
local nextMetalScanFrame

local function InferFaction(name, customParams)
	-- Priority 1: Check unit name prefix, which is always authoritative in TA/BA/TechA!
	if name:find("^rumad_") or name:find("^rumad") then
		return "rumad"
	elseif name:find("^gok_") or name:find("^gok") then
		return "gok"
	elseif name:find("^talon_") or name:find("^talon") then
		return "talon"
	elseif name:find("^tll") then
		return "tll"
	elseif name:find("^core_") or name:find("^cor") or (name:find("^c") and not name:find("^cl")) then
		return "core"
	elseif name:find("^arm_") or name:find("^arm") or (name:find("^a") and not name:find("^ant")) then
		return "arm"
	end

	-- Priority 2: Fallback to customParams.faction if name has no standard prefix
	if customParams and customParams.faction then
		local f = string.lower(customParams.faction)
		if FactionUnitCatalog[f] then
			return f
		end
	end
	return nil
end

local function DetermineTechLevel(name, cost, isBuilding)
	if name:find("lvl5") or name:find("nanotc4") or name:find("ufus") or name:find("_ulab") or name:find("_usy") or name:find("mas") or name:find("spid") or name:find("crab") or name:find("marmelade") or name:find("uch") or name:find("ucv") or name:find("uck") or name:find("vulc") or name:find("buzz") or name:find("planetkiller") or name:find("antarion") then
		return 5
	elseif name:find("lvl4") or name:find("nanotc3") or name:find("_elab") or name:find("_evp") or name:find("_eap") or name:find("emex") or name:find("gorg") or name:find("krog") or name:find("banth") then
		return 4
	elseif name:find("lvl3") or name:find("nanotc2") or name:find("shipyardlvl3") or name:find("yard") or name:find("moho") or name:find("brtha") or name:find("int") then
		return 3
	elseif name:find("lvl2") or name:find("nanotc1") or name:find("alab") or name:find("avp") or name:find("aap") or name:find("asy") or name:find("mex1") or name:find("advsolar") then
		return 2
	end

	if isBuilding then
		if cost >= 40000 then return 5
		elseif cost >= 15000 then return 4
		elseif cost >= 4000 then return 3
		elseif cost >= 1200 then return 2
		else return 1 end
	else
		if cost >= 35000 then return 5
		elseif cost >= 12000 then return 4
		elseif cost >= 3000 then return 3
		elseif cost >= 750 then return 2
		else return 1 end
	end
end

local function CatalogUnits()
	for unitDefID, udef in pairs(UnitDefs) do
		local name = string.lower(udef.name)
		local faction = InferFaction(name, udef.customParams)
		if faction and FactionUnitCatalog[faction] then
			local cat = FactionUnitCatalog[faction]
			local isBuilding = udef.isBuilding or not udef.canMove
			local isFactory = udef.isFactory
			local hasBuildOptions = udef.buildOptions and #udef.buildOptions > 0
			local isCommander = ((name:find("com") and not name:find("comb") and not name:find("decomp")) or (udef.customParams and udef.customParams.iscommander) or (udef.category and udef.category:find("COMMANDER"))) and hasBuildOptions
			local metalCost = udef.metalCost or 100
			local tech = DetermineTechLevel(name, metalCost, isBuilding)
			local isWater = udef.minWaterDepth and udef.minWaterDepth > 0
			local role = "unknown"
			local maxRange = 0
			local speed = udef.speed or 0

			if isCommander then
				role = "commander"
				table.insert(cat.commanders, unitDefID)
			elseif (udef.extractsMetal and udef.extractsMetal > 0) or (udef.customParams and udef.customParams.metal_extractor) then
				role = "mex"
				if tech == 5 or name:find("lvl5") or name:find("mas") then
					table.insert(cat.t5mex, unitDefID)
				elseif tech == 4 or name:find("lvl4") or name:find("emex") then
					table.insert(cat.t4mex, unitDefID)
				elseif tech == 3 or name:find("lvl3") or name:find("moho") then
					table.insert(cat.t3mex, unitDefID)
				elseif tech == 2 or name:find("lvl2") or name:find("mex1") then
					table.insert(cat.t2mex, unitDefID)
				else
					table.insert(cat.t1mex, unitDefID)
				end
			elseif isFactory and hasBuildOptions then
				role = "factory"
				if tech == 5 or name:find("_ulab") or name:find("_usy") then
					table.insert(cat.t5factories, unitDefID)
				elseif tech == 4 or name:find("_elab") or name:find("_evp") or name:find("_eap") then
					table.insert(cat.t4factories, unitDefID)
				elseif tech == 3 or name:find("shipyardlvl3") or name:find("yard") then
					table.insert(cat.t3factories, unitDefID)
				elseif tech == 2 or name:find("alab") or name:find("avp") or name:find("aap") or name:find("asy") then
					table.insert(cat.t2factories, unitDefID)
				else
					table.insert(cat.t1factories, unitDefID)
					if name:find("lab") or name:find("kbot") then
						table.insert(cat.t1kbot_fac, unitDefID)
					elseif name:find("vp") or name:find("veh") or name:find("avp") then
						table.insert(cat.t1veh_fac, unitDefID)
					elseif name:find("ap") or name:find("air") then
						table.insert(cat.t1air_fac, unitDefID)
					elseif name:find("sy") or name:find("boat") or name:find("ship") then
						table.insert(cat.t1sea_fac, unitDefID)
					elseif name:find("hp") or name:find("plat") then
						table.insert(cat.t1hov_fac, unitDefID)
					end
				end
			elseif udef.isBuilder and udef.canMove and hasBuildOptions and not isFactory then
				role = "constructor"
				if tech == 5 or name:find("builderlvl5") or name:find("builderlvl3") then
					table.insert(cat.t5con, unitDefID)
				elseif tech == 4 then
					table.insert(cat.t4con, unitDefID)
				elseif tech == 3 then
					table.insert(cat.t3con, unitDefID)
				elseif tech == 2 then
					table.insert(cat.t2con, unitDefID)
				else
					table.insert(cat.t1con, unitDefID)
				end
			elseif udef.canMove and (udef.canResurrect or name:find("necro") or name:find("rectr") or name:find("rez") or name:find("sham")) and not isFactory then
				role = "rezzer"
				table.insert(cat.rezUnits, unitDefID)
			elseif (isBuilding or name:find("nanotc")) and udef.isBuilder and not isFactory then
				-- Nanotowers
				role = "nanotower"
				if tech == 5 or name:find("nanotc4") then
					table.insert(cat.t5nanotc, unitDefID)
				elseif tech == 4 or name:find("nanotc3") then
					table.insert(cat.t4nanotc, unitDefID)
				elseif tech == 3 or name:find("nanotc2") then
					table.insert(cat.t3nanotc, unitDefID)
				elseif tech == 2 or name:find("nanotc1") then
					table.insert(cat.t2nanotc, unitDefID)
				else
					table.insert(cat.t1nanotc, unitDefID)
				end
			elseif (isBuilding or name:find("solar") or name:find("win") or name:find("fus")) and (udef.windGenerator > 0 or udef.energyMake > 10 or udef.tidalGenerator > 0 or udef.needGeo or name:find("solar") or name:find("win") or name:find("fus")) and not isCommander and not isFactory then
				role = "energy"
				if udef.windGenerator > 0 or (name:find("win") and not name:find("wing")) then
					table.insert(cat.wind, unitDefID)
				elseif udef.tidalGenerator > 0 or name:find("tide") then
					table.insert(cat.tidal, unitDefID)
				elseif udef.needGeo or name:find("geo") then
					table.insert(cat.geo, unitDefID)
				end

				if tech == 5 or name:find("ufus") then
					table.insert(cat.t5energy, unitDefID)
				elseif tech == 4 then
					table.insert(cat.t4energy, unitDefID)
				elseif tech == 3 or (udef.energyMake and udef.energyMake >= 500) then
					table.insert(cat.t3energy, unitDefID)
				elseif tech == 2 or (udef.energyMake and udef.energyMake >= 50) then
					table.insert(cat.t2energy, unitDefID)
				else
					table.insert(cat.t1energy, unitDefID)
					if name:find("solar") then
						table.insert(cat.solar, unitDefID)
					end
				end
			elseif (isBuilding or name:find("metalmaker")) and (name:find("makr") or name:find("maker") or name:find("mmkr") or name:find("wmconv") or name:find("fmkr") or (udef.customParams and udef.customParams.energy_conversion)) and not isFactory then
				role = "converter"
				if tech == 5 or name:find("lvl4") or name:find("lvl5") then
					table.insert(cat.t5makers, unitDefID)
				elseif tech == 4 then
					table.insert(cat.t4makers, unitDefID)
				elseif tech == 3 then
					table.insert(cat.t3makers, unitDefID)
				elseif tech == 2 then
					table.insert(cat.t2makers, unitDefID)
				else
					table.insert(cat.t1makers, unitDefID)
				end
			elseif isBuilding and udef.weapons and #udef.weapons > 0 then
				role = "defense"
				local hasAA = false
				for _, w in ipairs(udef.weapons) do
					local wdef = WeaponDefs[w.weaponDef]
					if wdef and (wdef.canAttackAir or (wdef.onlyTargetCategory and type(wdef.onlyTargetCategory) == "string" and wdef.onlyTargetCategory:find("VTOL"))) then
						hasAA = true
						break
					end
				end
				if hasAA then
					table.insert(cat.aa, unitDefID)
				elseif tech == 5 or name:find("vulc") or name:find("buzz") or name:find("planetkiller") then
					table.insert(cat.t5defenses, unitDefID)
				elseif tech == 4 then
					table.insert(cat.t4defenses, unitDefID)
				elseif tech == 3 then
					table.insert(cat.t3defenses, unitDefID)
				elseif tech == 2 then
					table.insert(cat.t2defenses, unitDefID)
				else
					table.insert(cat.t1defenses, unitDefID)
				end
			elseif isBuilding and ((udef.metalStorage or 0) > 0 or (udef.energyStorage or 0) > 0) then
				role = "storage"
			elseif isBuilding and (udef.radarRadius > 300 or udef.sonarRadius > 300) then
				role = "radar"
				table.insert(cat.radar, unitDefID)
			elseif udef.canMove and (not udef.isBuilder or not hasBuildOptions) then
				-- Mobile combat units
				-- UnitDefs.speed is elmos/second, not the source file's maxVelocity.
				local isScout = (#(udef.weapons or {}) == 0 and (udef.speed or 0) > 84) or name:find("peep") or name:find("fink") or name:find("scout") or name:find("vision")
				maxRange = 0
				local hasAA = false
				for _, w in ipairs(udef.weapons or {}) do
					local wdef = WeaponDefs[w.weaponDef]
					if wdef then
						if wdef.range and wdef.range > maxRange then
							maxRange = wdef.range
						end
						if wdef.canAttackAir or (wdef.onlyTargetCategory and type(wdef.onlyTargetCategory) == "string" and wdef.onlyTargetCategory:find("VTOL")) then
							hasAA = true
						end
					end
				end

				speed = udef.speed or 0
				local isRaider = (speed >= 63 and metalCost <= 350) or name:find("flea") or name:find("peewee") or name:find("pw") or name:find("ak") or name:find("zipper") or name:find("fav") or name:find("gator") or name:find("flash") or name:find("pyro") or name:find("rover") or name:find("puppy") or name:find("tack")

				if isScout then
					role = "scout"
					table.insert(cat.scouts, unitDefID)
				elseif tech == 5 then
					role = "combat"
					table.insert(cat.t5combat, unitDefID)
				elseif tech == 4 then
					role = "combat"
					table.insert(cat.t4combat, unitDefID)
				elseif hasAA and maxRange > 500 and #udef.weapons <= 2 then
					role = "aa"
					table.insert(cat.aa, unitDefID)
				elseif maxRange >= 650 then
					role = "artillery"
					table.insert(cat.artillery, unitDefID)
				elseif isRaider then
					role = "raider"
					table.insert(cat.raiders, unitDefID)
				else
					role = "combat"
					table.insert(cat.combat, unitDefID)
				end
			end

			-- ALWAYS POPULATE UNITMETADATA FOR ALL UNITS REGARDLESS OF ROLE!
			local metaEntry = {
				faction = faction,
				role = role,
				tech = tech,
				isWater = isWater,
				metalCost = metalCost,
				maxRange = maxRange,
				speed = speed,
				canResurrect = (udef.canResurrect or role == "rezzer") or false,
				isCommander = (role == "commander"),
			}
			if role == "storage" then
				metaEntry.storageKind = (udef.metalStorage or 0) > 0 and "metal" or "energy"
				metaEntry.storageAmount = metaEntry.storageKind == "metal" and (udef.metalStorage or 0) or (udef.energyStorage or 0)
			end
			Metadata.Enrich(unitDefID,udef,metaEntry,WeaponDefs,MakerDefs)
			UnitMetadata[unitDefID] = metaEntry
			if udef.id then
				UnitMetadata[udef.id] = metaEntry
			end
			UnitMetadata[name] = metaEntry
			if udef.name then
				UnitMetadata[string.lower(udef.name)] = metaEntry
			end
		end
	end
	-- Rebuild catalog buckets from authoritative enriched metadata. Legacy name
	-- guesses above must not override declared tiers or maker/weapon definitions.
	for _,cat in pairs(FactionUnitCatalog) do
		for key in pairs(cat) do cat[key]={} end
		for _,suffix in ipairs({'mex','con','energy','makers','nanotc','defenses','combat'}) do cat['t6'..suffix]={} end
	end
	local suffixes={mex='mex',factory='factories',constructor='con',energy='energy',converter='makers',nanotower='nanotc',defense='defenses'}
	for defID,ud in pairs(UnitDefs) do
		local meta=UnitMetadata[defID]
		local cat=meta and FactionUnitCatalog[meta.faction]
		if cat then
			local tier=meta.tech or 1
			local suffix=suffixes[meta.role]
			local bucket=suffix and ('t'..math.min(tier,meta.role=='factory' and 5 or 6)..suffix)
			if meta.role=='commander' then bucket='commanders'
			elseif meta.role=='combat' then bucket=tier>=4 and ('t'..tier..'combat') or 'combat'
			elseif meta.role=='raider' then bucket='raiders'
			elseif meta.role=='scout' then bucket='scouts'
			elseif meta.role=='rezzer' then bucket='rezUnits'
			elseif meta.role=='aa' or meta.role=='artillery' or meta.role=='radar' then bucket=meta.role end
			if bucket then cat[bucket]=cat[bucket] or {}; table.insert(cat[bucket],defID) end
			if meta.role=='energy' then
				local kind=(ud.windGenerator or 0)>0 and 'wind' or ((ud.tidalGenerator or 0)>0 and 'tidal' or (ud.needGeo and 'geo' or (tier==1 and 'solar')))
				if kind then table.insert(cat[kind],defID) end
			end
			if meta.role=='factory' and tier==1 then
				local name=ud.name:lower()
				local kind=(name:find('lab') and 'kbot') or (name:find('vp') and 'veh') or (name:find('ap') and 'air') or (name:find('sy') and 'sea') or 'hov'
				table.insert(cat['t1'..kind..'_fac'],defID)
			end
		end
	end
	for _,cat in pairs(FactionUnitCatalog) do for _,bucket in pairs(cat) do table.sort(bucket) end end

end

-- Initialize once in gadget:Initialize, before registering any teams.

--------------------------------------------------------------------------------
-- Experience-Based Morph System Integration
--------------------------------------------------------------------------------
local RawMorphDefs = VFS.FileExists("LuaRules/Configs/morph_defs_techa.lua") and VFS.Include("LuaRules/Configs/morph_defs_techa.lua") or {}
local UnitMorphTable = {} -- [srcDefID] = { {into = dstDefID, xp = num, metal = num, energy = num, time = num, tech = num} }

local function InitMorphTable()
	for srcName, mData in pairs(RawMorphDefs) do
		local srcDef = UnitDefNames[string.lower(srcName)] or UnitDefNames[srcName]
		if srcDef then
			local options = {}
			local morphArray = (mData.into ~= nil) and { mData } or mData
			for _, morphEntry in ipairs(morphArray) do
				if morphEntry.into then
					local dstDef = UnitDefNames[string.lower(morphEntry.into)] or UnitDefNames[morphEntry.into]
					if dstDef then
						local costM = morphEntry.metal or math.max(50, (dstDef.metalCost - srcDef.metalCost) * 1.25)
						local costE = morphEntry.energy or math.max(200, (dstDef.energyCost - srcDef.energyCost) * 1.25)
						table.insert(options, {
							into = dstDef.id,
							intoName = dstDef.name,
							xp = morphEntry.xp or 0,
							metal = costM,
							energy = costE,
							tech = morphEntry.tech or 0,
							time = morphEntry.time or 30,
						})
					end
				end
			end
			if #options > 0 then
				UnitMorphTable[srcDef.id] = options
			end
		end
	end
end


--------------------------------------------------------------------------------
-- Sector Grid & Reconnaissance Memory
--------------------------------------------------------------------------------
local SectorGrid = {}
for sx = 1, SECTORS_X do
	SectorGrid[sx] = {}
	for sz = 1, SECTORS_Z do
		SectorGrid[sx][sz] = {
			x = (sx - 0.5) * SECTOR_SIZE,
			z = (sz - 0.5) * SECTOR_SIZE,
			lastSeenFrame = 0,
			metalSpots = 0,
		}
	end
end

local function InitMetalMap()
	for sx = 1, SECTORS_X do
		for sz = 1, SECTORS_Z do SectorGrid[sx][sz].metalSpots = 0 end
	end
	local metalSpots = GetMetalSpots()
	if metalSpots then
		for _, spot in ipairs(metalSpots) do
			local sx = math.min(SECTORS_X, math.max(1, math.ceil(spot.x / SECTOR_SIZE)))
			local sz = math.min(SECTORS_Z, math.max(1, math.ceil(spot.z / SECTOR_SIZE)))
			if SectorGrid[sx] and SectorGrid[sx][sz] then
				SectorGrid[sx][sz].metalSpots = SectorGrid[sx][sz].metalSpots + 1
			end
		end
	end
end

--------------------------------------------------------------------------------
-- Morph & Commander Assistance Guards
--------------------------------------------------------------------------------
local function IsMorphingCommander(unitID, ai)
	if not Spring.ValidUnitID(unitID) then return false end
	local isMorphing = (spGetUnitRulesParam(unitID, "Morphing") == 1)
	if isMorphing then return true end
	if ai and ai.activeMorphTarget and ai.activeMorphTarget.unitID == unitID then return true end
	local udefID = spGetUnitDefID(unitID)
	if not udefID then return false end
	local meta = UnitMetadata[udefID]
	if meta and meta.isCommander and isMorphing then
		return true
	end
	return false
end

--------------------------------------------------------------------------------
-- FOW Intel Management
--------------------------------------------------------------------------------
local function RecordEnemyBuildingInLOS(ai, enemyUnitID, unitDefID)
	local udef = UnitDefs[unitDefID]
	if not udef or not udef.isBuilding then return end
	local ex, ey, ez = spGetUnitPosition(enemyUnitID)
	if not ex then return end

	local category = "general"
	if udef.isFactory then
		category = "factory"
	elseif udef.extractsMetal > 0 or (udef.customParams and udef.customParams.metal_extractor) then
		category = "mex"
	elseif udef.weapons and #udef.weapons > 0 then
		category = "defense"
	elseif udef.energyMake and udef.energyMake > 20 then
		category = "energy"
	end

	ai.intel.knownBuildings[enemyUnitID] = {
		unitDefID = unitDefID,
		x = ex,
		y = ey,
		z = ez,
		category = category,
		frame = Spring.GetGameFrame(),
	}

	if category == "factory" or not ai.intel.enemyBaseCentroid then
		ai.intel.enemyBaseCentroid = { x = ex, z = ez }
	end

	local hints = ai.intel.hints or { tech = 0, kinds = {}, seen = {} }
	hints.kinds[category] = (hints.kinds[category] or 0) + 1
	hints.seen[unitDefID] = true
	local meta = UnitMetadata[unitDefID]
	if meta then hints.tech = math.max(hints.tech or 0, meta.tech or 1) end
	ai.intel.hints = hints
end

local function PurgeIntelIfMissing(ai, allyTeamID)
	local frame = Spring.GetGameFrame()
	if frame - (ai.lastIntelPurgeFrame or -90) < 90 then return end
	ai.lastIntelPurgeFrame = frame
	for key, blip in pairs(ai.intel.radarBlips) do
		if frame - blip.frame > 300 then ai.intel.radarBlips[key] = nil end
	end
	for enemyID, data in pairs(ai.intel.knownBuildings) do
		if spIsPosInLos(data.x, data.y, data.z, allyTeamID) then
			local unitsAtPos = spGetUnitsInCylinder(data.x, data.z, 90)
			local found = false
			for _, uid in ipairs(unitsAtPos) do
				if uid == enemyID then
					found = true
					break
				end
			end
			if not found then
				ai.intel.knownBuildings[enemyID] = nil
			end
		end
	end
end

local function PickBestReconTarget(ai, allyTeamID, currentFrame)
	local bestSector = nil
	local bestScore = -math.huge
	ai.scoutedSectors = ai.scoutedSectors or {}

	-- 1. Radar blips in fog are top recon candidates
	for key, blip in pairs(ai.intel.radarBlips) do
		if currentFrame - blip.frame < 1800 then
			local inLos = spIsPosInLos(blip.x, spGetGroundHeight(blip.x, blip.z), blip.z, allyTeamID)
			if not inLos then
				return { x = blip.x, z = blip.z }
			end
		else
			ai.intel.radarBlips[key] = nil
		end
	end

	-- 2. Find least recently scouted sectors, prioritizing metal spots and enemy direction
	local comPos = ai.rallyPoint or { x = MAP_SIZE_X / 2, z = MAP_SIZE_Z / 2 }
	for sx = 1, SECTORS_X do
		for sz = 1, SECTORS_Z do
			local sector = SectorGrid[sx][sz]
			local dx = sector.x - comPos.x
			local dz = sector.z - comPos.z
			local dist = math.sqrt(dx * dx + dz * dz)
			local sectorKey = (sx - 1) * SECTORS_Z + sz
			local framesSinceLastSeen = currentFrame - (ai.scoutedSectors[sectorKey] or 0)

			local score = (framesSinceLastSeen / 30) + (sector.metalSpots * 300) - (dist * 0.1)
			if ai.intel.enemyBaseCentroid then
				local ex = sector.x - ai.intel.enemyBaseCentroid.x
				local ez = sector.z - ai.intel.enemyBaseCentroid.z
				local distToEnemy = math.sqrt(ex * ex + ez * ez)
				if distToEnemy < 1500 then
					score = score + 400
				end
			end

			if score > bestScore then
				bestScore = score
				bestSector = sector
			end
		end
	end

	if bestSector then
		local sx = math.floor(bestSector.x / SECTOR_SIZE) + 1
		local sz = math.floor(bestSector.z / SECTOR_SIZE) + 1
		ai.scoutedSectors[(sx - 1) * SECTORS_Z + sz] = currentFrame
		return { x = bestSector.x, z = bestSector.z }
	end
	return { x = MAP_SIZE_X / 2, z = MAP_SIZE_Z / 2 }
end

--------------------------------------------------------------------------------
-- Placement & Pathfinding Helpers
--------------------------------------------------------------------------------
local function FindSafeBuildPosition(unitDefID, cx, cz, searchRadius, spacing, ai)
	if ai then return BaseLayout.Find(ai,unitDefID) end
	local udef = UnitDefs[unitDefID]
	if not udef then return nil end
	local footX = (udef.xsize or 4) * 8
	local footZ = (udef.zsize or 4) * 8
	local footRadius = math.max(footX, footZ)

	local minRad = math.max(64, footRadius + 32)
	local maxRad = math.max(minRad + 64, searchRadius or 400)

	for radius = minRad, maxRad, 48 do
		local steps = math.max(8, math.floor((2 * math.pi * radius) / 64))
		for s = 0, steps - 1 do
			local angle = (s / steps) * 2 * math.pi
			local testX = math.floor((cx + math.cos(angle) * radius) / 16) * 16 + 8
			local testZ = math.floor((cz + math.sin(angle) * radius) / 16) * 16 + 8
			local testY = spGetGroundHeight(testX, testZ)

			for facing = 0, 3 do
				local test = spTestBuildOrder(unitDefID, testX, testY, testZ, facing)
				if test == 2 or test == 1 then
					local blocked = false
					local nearby = spGetUnitsInCylinder(testX, testZ, footRadius + 24)
					for _, uid in ipairs(nearby) do
						local oDefID = spGetUnitDefID(uid)
						if oDefID then
							local odef = UnitDefs[oDefID]
							local meta = UnitMetadata[oDefID]
							local isStructure = (odef and odef.isBuilding and not odef.canMove) or
								(meta and (meta.role == "factory" or meta.role == "energy" or meta.role == "converter" or meta.role == "defense" or meta.role == "mex" or meta.role == "radar" or meta.role == "nanotower" or meta.role == "storage"))
							if isStructure then
								local ox, _, oz = spGetUnitPosition(uid)
								if ox then
									local oRad = math.max((odef.xsize or 4) * 8, (odef.zsize or 4) * 8)
									local minDist = footRadius + oRad + 12
									local dsq = (testX - ox) * (testX - ox) + (testZ - oz) * (testZ - oz)
									if dsq < minDist * minDist then
										blocked = true
										break
									end
								end
							end
						end
					end

					if not blocked then
						return testX, testY, testZ, facing
					end
				end
			end
		end
	end
	return nil
end

local function FindBaseExpansionBuildPosition(unitDefID, ai, searchSpacing)
	return BaseLayout.Find(ai,unitDefID)
end

local function FindSafeCoreBuildPosition(unitDefID, ai, spacing)
	return BaseLayout.Find(ai,unitDefID)
end

local function GetClosestFreeMexSpot(ai, ux, uz, maxDist, centerPos, defID)
	local metalSpots = GetMetalSpots()
	if not metalSpots or #metalSpots == 0 then return nil end

	local bestSpot = nil
	local bestDist = (maxDist and (maxDist * maxDist)) or math.huge
	local refX = centerPos and centerPos.x or ux
	local refZ = centerPos and centerPos.z or uz
	local frame = Spring.GetGameFrame()

	for i = 1, #metalSpots do
		local spot = metalSpots[i]
		local key = math.floor(spot.x / 32) .. "_" .. math.floor(spot.z / 32)
		local expiry = ai.claimedSpots[key]
		if type(expiry) == 'number' and expiry <= frame then ai.claimedSpots[key] = nil end
		if not ai.claimedSpots[key] then
			local dx = refX - spot.x
			local dz = refZ - spot.z
			local dist = dx * dx + dz * dz
			if dist < bestDist then
				local units = spGetUnitsInCylinder(spot.x, spot.z, 64)
				if #units == 0 and (not defID or BaseLayout.Allowed(ai,defID,spot.x,spot.z,0)) then
					bestDist = dist
					bestSpot = spot
				end
			end
		end
	end
	return bestSpot
end

--------------------------------------------------------------------------------
-- BARb Competitive Multi-Order Opening Builder (Recoil Shift-Queuing)
--------------------------------------------------------------------------------
local function ExecuteCommanderOpeningQueue(ai, builderID, udef, teamID)
	if #GetMetalSpots()==0 then return false end
	if not ai or not builderID or not udef then return false end
	if ai.openingSequenceQueued or ai.factoryCount > 0 then return false end

	local bx, by, bz = spGetUnitPosition(builderID)
	if not bx then return false end

	local cx = ai.spawnPos and ai.spawnPos.x or bx
	local cy = ai.spawnPos and ai.spawnPos.y or by
	local cz = ai.spawnPos and ai.spawnPos.z or bz

	local cat = FactionUnitCatalog[ai.faction]
	if not cat then return false end

	-- 1. Identify T1 Mex Def
	local mexDef = nil
	for _, bopt in ipairs(udef.buildOptions or {}) do
		local bmeta = UnitMetadata[bopt]
		if bmeta and bmeta.role == "mex" and bmeta.tech == 1 then
			mexDef = bopt
			break
		end
	end
	if not mexDef then
		for _, bopt in ipairs(udef.buildOptions or {}) do
			local bdef = UnitDefs[bopt]
			local bname = bdef and string.lower(bdef.name) or ""
			if (bdef and bdef.extractsMetal and bdef.extractsMetal > 0) or bname:find("mex") or (bdef and bdef.customParams and bdef.customParams.metal_extractor) then
				mexDef = bopt
				break
			end
		end
	end

	-- 2. Identify T1 Energy Def (Wind vs Solar based on map wind speeds)
	local avgWind = ((Game.windMin or 0) + (Game.windMax or 0)) / 2
	local preferWind = (avgWind >= 8) or ((Game.windMax or 0) >= 12)
	local energyDef = nil

	if preferWind then
		for _, bopt in ipairs(udef.buildOptions or {}) do
			local bdef = UnitDefs[bopt]
			if bdef and bdef.windGenerator and bdef.windGenerator > 0 then
				energyDef = bopt
				break
			end
		end
	end
	if not energyDef then
		for _, bopt in ipairs(udef.buildOptions or {}) do
			local bdef = UnitDefs[bopt]
			local bname = bdef and string.lower(bdef.name) or ""
			if bdef and (bname:find("solar") or (bdef.customParams and bdef.customParams.solar)) then
				energyDef = bopt
				break
			end
		end
	end
	if not energyDef then
		for _, bopt in ipairs(udef.buildOptions or {}) do
			local bmeta = UnitMetadata[bopt]
			if bmeta and bmeta.role == "energy" and bmeta.tech == 1 then
				energyDef = bopt
				break
			end
		end
	end

	-- 3. Identify T1 Factory Def (Prefer Kbot 70% / Veh 30% for fastest opening ground army deployment)
	if not ai.openingFactoryType then
		local r = math.random(1, 100)
		ai.openingFactoryType = (r <= 70) and "kbot" or "veh"
	end

	local facDef = nil
	for _, bopt in ipairs(udef.buildOptions or {}) do
		local bmeta = UnitMetadata[bopt]
		if bmeta and bmeta.role == "factory" and bmeta.tech == 1 then
			local bdef = UnitDefs[bopt]
			local bname = bdef and string.lower(bdef.name) or ""
			if ai.openingFactoryType == "kbot" and (bname:find("lab") or bname:find("kbot")) then
				facDef = bopt
				break
			elseif ai.openingFactoryType == "veh" and (bname:find("vp") or bname:find("veh") or bname:find("avp")) then
				facDef = bopt
				break
			end
		end
	end
	if not facDef then
		for _, bopt in ipairs(udef.buildOptions or {}) do
			local bmeta = UnitMetadata[bopt]
			if bmeta and bmeta.role == "factory" and bmeta.tech == 1 then
				facDef = bopt
				break
			end
		end
	end

	if not mexDef or not energyDef or not facDef then
		return false
	end

	-- 4. Find Local Base Metal Spots (Strictly within 420 elmos to avoid cross-map wandering)
	local spots = {}
	local spot1 = GetClosestFreeMexSpot(ai, cx, cz, 400, ai.spawnPos, mexDef)
	if spot1 then
		table.insert(spots, spot1)
		local k1 = math.floor(spot1.x / 32) .. "_" .. math.floor(spot1.z / 32)
		ai.claimedSpots[k1] = Spring.GetGameFrame() + 1800

		local spot2 = GetClosestFreeMexSpot(ai, cx, cz, 450, ai.spawnPos, mexDef)
		if spot2 then
			table.insert(spots, spot2)
			local k2 = math.floor(spot2.x / 32) .. "_" .. math.floor(spot2.z / 32)
			ai.claimedSpots[k2] = Spring.GetGameFrame() + 1800
		end
	end

	local isFirst = true
	local function QueueOrder(defID, x, y, z, facing)
		local opt = isFirst and {} or { "shift" }
		isFirst = false
		spGiveOrderToUnit(builderID, -defID, { x, y, z, facing or 0 }, opt)
	end

	if #spots > 0 then
		-- Order 1: Mex 1
		local s1 = spots[1]
		local s1y = s1.y or spGetGroundHeight(s1.x, s1.z)
		QueueOrder(mexDef, s1.x, s1y, s1.z, 0)
		ai.commanderMexCount = 1

		-- Order 2: Energy 1 (Adjacent to Mex 1 or Spawn)
		local e1x, e1y, e1z, e1f = FindSafeBuildPosition(energyDef, s1.x, s1.z, 200, 36, ai)
		if not e1x then e1x, e1y, e1z, e1f = FindSafeBuildPosition(energyDef, cx, cz, 260, 36, ai) end
		if e1x then
			QueueOrder(energyDef, e1x, e1y, e1z, e1f)
			ai.commanderEnergyCount = 1
		end

		-- Order 3: Mex 2 (if present within base radius)
		if #spots >= 2 then
			local s2 = spots[2]
			local s2y = s2.y or spGetGroundHeight(s2.x, s2.z)
			QueueOrder(mexDef, s2.x, s2y, s2.z, 0)
			ai.commanderMexCount = 2
		else
			-- If only 1 mex nearby, add second energy structure to power lab
			local e2x, e2y, e2z, e2f = FindSafeBuildPosition(energyDef, cx, cz, 300, 36, ai)
			if e2x then
				QueueOrder(energyDef, e2x, e2y, e2z, e2f)
				ai.commanderEnergyCount = (ai.commanderEnergyCount or 0) + 1
			end
		end

		-- Order 4: Second energy if solar (solar needs 2 for lab stability)
		if not preferWind and (ai.commanderEnergyCount or 0) < 2 then
			local e2x, e2y, e2z, e2f = FindSafeBuildPosition(energyDef, cx, cz, 320, 36, ai)
			if e2x then
				QueueOrder(energyDef, e2x, e2y, e2z, e2f)
				ai.commanderEnergyCount = (ai.commanderEnergyCount or 0) + 1
			end
		end

		-- Order 5: T1 Factory (Placed compactly in base perimeter)
		local fx, fy, fz, ff = FindSafeBuildPosition(facDef, cx, cz, 340, 64, ai)
		if fx then
			QueueOrder(facDef, fx, fy, fz, ff)
			ai.openingFactoryOrdered = true
		end
	else
		-- No local deposits: begin with power and production. Expansion builders
		-- can seek distant deposits, or use conversion as demand permits.
		for step=1,2 do
			local x,y,z,f=FindSafeBuildPosition(energyDef,cx+step*80,cz,220,36, ai)
			if x then QueueOrder(energyDef,x,y,z,f); ai.commanderEnergyCount=(ai.commanderEnergyCount or 0)+1 end
		end
		local x,y,z,f=FindSafeBuildPosition(facDef,cx,cz,340,64, ai)
		if x then QueueOrder(facDef,x,y,z,f);ai.openingFactoryOrdered=true end

	end

	ai.openingSequenceQueued = true
	return true
end

--------------------------------------------------------------------------------
-- BARb Advanced Tactical Systems & Combined Arms Micro
--------------------------------------------------------------------------------

local function GetThreatAtPosition(ai, px, pz)
	local totalThreat = 0
	for uID, bData in pairs(ai.intel.knownBuildings) do
		if bData.category == "defense" then
			local dx, dz = bData.x - px, bData.z - pz
			local dist = math.sqrt(dx * dx + dz * dz)
			if dist < 850 then
				totalThreat = totalThreat + math.max(10, 850 - dist)
			end
		end
	end
	for _, blip in pairs(ai.intel.radarBlips) do
		local dx, dz = blip.x - px, blip.z - pz
		local dist = math.sqrt(dx * dx + dz * dz)
		if dist < 600 then
			totalThreat = totalThreat + 50
		end
	end
	return totalThreat
end

local function UpdateFrontline(ai)
	local myX, myZ = MAP_SIZE_X / 2, MAP_SIZE_Z / 2
	if ai.spawnPos then
		myX, myZ = ai.spawnPos.x, ai.spawnPos.z
	elseif ai.commanderID then
		local cx, _, cz = spGetUnitPosition(ai.commanderID)
		if cx then myX, myZ = cx, cz end
	end

	local enemyX, enemyZ = nil, nil
	if ai.intel.enemyBaseCentroid then
		enemyX, enemyZ = ai.intel.enemyBaseCentroid.x, ai.intel.enemyBaseCentroid.z
	else
		for _, bData in pairs(ai.intel.knownBuildings) do
			enemyX, enemyZ = bData.x, bData.z
			break
		end
	end

	if not enemyX then
		for _, blip in pairs(ai.intel.radarBlips) do
			enemyX, enemyZ = blip.x, blip.z
			break
		end
	end

	if not enemyX then
		enemyX, enemyZ = MAP_SIZE_X - myX, MAP_SIZE_Z - myZ
	end

	local fx = (myX + enemyX) / 2
	local fz = (myZ + enemyZ) / 2
	ai.frontline = { x = fx, z = fz }

	local dirX, dirZ = myX - fx, myZ - fz
	local dLen = math.sqrt(dirX * dirX + dirZ * dirZ)
	if dLen > 0 then
		ai.rallyPoint = {
			x = math.max(100, math.min(MAP_SIZE_X - 100, fx + (dirX / dLen) * math.min(350, dLen * 0.4))),
			z = math.max(100, math.min(MAP_SIZE_Z - 100, fz + (dirZ / dLen) * math.min(350, dLen * 0.4))),
		}
	else
		ai.rallyPoint = { x = myX, z = myZ }
	end
end

local function ManageEnergyConverters(ai, teamID, currentFrame)
	if currentFrame - (ai.lastConverterCheckFrame or -30) < 30 then return end
	ai.lastConverterCheckFrame = currentFrame
	-- TechA's conversion gadget controls makers through a team energy reserve,
	-- not CMD.ONOFF. Leave the actual conversion and efficiency ordering to it.
	if not Spring.SetTeamRulesParam then return end
	local energy, storage, _, income, expense = spGetTeamResources(teamID, 'energy')
	if not energy or not storage or storage <= 0 then return end
	local metal, metalStorage = spGetTeamResources(teamID, 'metal')
	local net = (income or 0) - (expense or 0)
	local emergency = energy < storage * 0.20 or (net < 0 and energy / -net < 12)
	local reserve = emergency and 0.95 or 0.70
	if not emergency and net >= 0 and metal and metalStorage and metal < metalStorage * 0.30 then reserve=0.55 end
	if not ai.converterReserve or math.abs(ai.converterReserve-reserve)>0.01 then
		Spring.SetTeamRulesParam(teamID,'mmLevel',reserve)
		ai.converterReserve=reserve
	end
end

local function ManageRetreatAndRepair(ai, teamID, currentFrame)
	if currentFrame - (ai.lastRetreatCheckFrame or 0) < 45 then return end
	ai.lastRetreatCheckFrame = currentFrame

	local retreatDestX, retreatDestZ = MAP_SIZE_X / 2, MAP_SIZE_Z / 2
	if ai.spawnPos then
		retreatDestX, retreatDestZ = ai.spawnPos.x, ai.spawnPos.z
	end

	local checkList = { ai.combatUnits }
	for _, list in ipairs(checkList) do
		for _, uID in ipairs(list) do
			if Spring.ValidUnitID(uID) then
				local hp, maxhp = spGetUnitHealth(uID)
				if hp and maxhp and maxhp > 0 then
					local ratio = hp / maxhp
					if ratio < 0.35 and not ai.retreatingUnits[uID] then
						ai.retreatingUnits[uID] = true
						local ry = spGetGroundHeight(retreatDestX, retreatDestZ)
						spGiveOrderToUnit(uID, CMD_MOVE, { retreatDestX + math.random(-100, 100), ry, retreatDestZ + math.random(-100, 100) }, 0)
					elseif ratio >= 0.85 and ai.retreatingUnits[uID] then
						ai.retreatingUnits[uID] = nil
						if ai.rallyPoint then
							local rpy = spGetGroundHeight(ai.rallyPoint.x, ai.rallyPoint.z)
							spGiveOrderToUnit(uID, CMD_FIGHT, { ai.rallyPoint.x, rpy, ai.rallyPoint.z }, 0)
						end
					end
				end
			end
		end
	end
end

local function ManageRaiders(ai, teamID, allyTeamID, currentFrame)
	if #ai.raiderUnits == 0 then return end
	if currentFrame - (ai.lastRaidFrame or 0) < 60 then return end
	ai.lastRaidFrame = currentFrame

	local bestTarget = nil
	local bestScore = -math.huge

	for uID, bData in pairs(ai.intel.knownBuildings) do
		if bData.category == "mex" or bData.category == "energy" then
			local threat = GetThreatAtPosition(ai, bData.x, bData.z)
			if threat < 250 then
				local sx = ai.spawnPos and ai.spawnPos.x or 0
				local sz = ai.spawnPos and ai.spawnPos.z or 0
				local distance = math.sqrt((bData.x - sx)^2 + (bData.z - sz)^2)
				local score = (bData.category == "mex" and 200 or 120) - threat - distance * 0.025
				if score > bestScore then
					bestScore = score
					bestTarget = { x = bData.x, y = bData.y, z = bData.z }
				end
			end
		end
	end

	if not bestTarget then
		for _, blip in pairs(ai.intel.radarBlips) do
			local threat = GetThreatAtPosition(ai, blip.x, blip.z)
			if threat < 200 then
				bestTarget = { x = blip.x, y = spGetGroundHeight(blip.x, blip.z), z = blip.z }
				break
			end
		end
	end

	if not bestTarget then
		-- Early Game Fallback: Probe towards enemy map quadrant or unvisited metal sectors!
		local comX = ai.spawnPos and ai.spawnPos.x or (MAP_SIZE_X / 2)
		local comZ = ai.spawnPos and ai.spawnPos.z or (MAP_SIZE_Z / 2)
		local enemyX = ai.intel.enemyBaseCentroid and ai.intel.enemyBaseCentroid.x or (MAP_SIZE_X - comX)
		local enemyZ = ai.intel.enemyBaseCentroid and ai.intel.enemyBaseCentroid.z or (MAP_SIZE_Z - comZ)
		bestTarget = { x = enemyX + math.random(-300, 300), y = spGetGroundHeight(enemyX, enemyZ), z = enemyZ + math.random(-300, 300) }
	end

	if bestTarget then
		for _, rID in ipairs(ai.raiderUnits) do
			if not ai.retreatingUnits[rID] and IsUnitReady(rID) then
				local q = spGetUnitCommandCount(rID)
				if q and q <= 1 then
					GiveTacticalOrder(ai, rID, CMD_FIGHT, { bestTarget.x, bestTarget.y, bestTarget.z }, currentFrame)
				end
			end
		end
	end
end

local function ManageArtillery(ai, teamID, currentFrame)
	if #ai.artilleryUnits == 0 then return end
	for _, artID in ipairs(ai.artilleryUnits) do
		if not ai.retreatingUnits[artID] and IsUnitReady(artID) then
			local udefID = spGetUnitDefID(artID)
			local meta = UnitMetadata[udefID]
			local maxRange = (meta and meta.maxRange and meta.maxRange > 0) and meta.maxRange or 750

			local enemy = spGetUnitNearestEnemy(artID, maxRange + 150, true)
			if enemy and Spring.ValidUnitID(enemy) then
				local ax, ay, az = spGetUnitPosition(artID)
				local ex, ey, ez = spGetUnitPosition(enemy)
				if ax and ex then
					local dx, dz = ax - ex, az - ez
					local dist = math.sqrt(dx * dx + dz * dz)
					if dist < (maxRange * 0.65) and dist > 10 then
						local nx, nz = dx / dist, dz / dist
						local kx = math.max(50, math.min(MAP_SIZE_X - 50, ax + nx * 160))
						local kz = math.max(50, math.min(MAP_SIZE_Z - 50, az + nz * 160))
						local ky = spGetGroundHeight(kx, kz)
						ai.microUntil = ai.microUntil or {}
						ai.microUntil[artID] = currentFrame + 90
						GiveTacticalOrder(ai, artID, CMD_MOVE, { kx, ky, kz }, currentFrame)
					else
						local q = spGetUnitCommandCount(artID)
						if q and q <= 1 then
							ai.microUntil = ai.microUntil or {}
							ai.microUntil[artID] = currentFrame + 90
							GiveTacticalOrder(ai, artID, CMD_ATTACK, { enemy }, currentFrame)
						end
					end
				end
			end
		end
	end
end

local function FindNearbyRezUnit(ai, x, z, maxDist)
	if not ai.rezUnits or #ai.rezUnits == 0 then return nil end
	local maxDistSq = (maxDist or 1500) * (maxDist or 1500)
	local bestUnit = nil
	local bestDistSq = maxDistSq
	for _, uid in ipairs(ai.rezUnits) do
		if Spring.ValidUnitID(uid) then
			local ux, _, uz = spGetUnitPosition(uid)
			if ux then
				local dsq = (ux - x) * (ux - x) + (uz - z) * (uz - z)
				if dsq < bestDistSq then
					local q = spGetUnitCommandCount(uid)
					if q and q <= 2 then
						bestDistSq = dsq
						bestUnit = uid
					end
				end
			end
		end
	end
	return bestUnit
end

--------------------------------------------------------------------------------
-- Battle Experience Morphing & Resource Reservation Manager
--------------------------------------------------------------------------------
local function ManageUnitMorphs(ai, teamID, currentFrame)
	if currentFrame - (ai.lastMorphCheckFrame or 0) < 60 then return end
	ai.lastMorphCheckFrame = currentFrame

	local mcur, mstor, _, minc = spGetTeamResources(teamID, "metal")
	local ecur, estor, _, einc = spGetTeamResources(teamID, "energy")

	if ai.activeMorphTarget then
		local isStillMorphing = spGetUnitRulesParam(ai.activeMorphTarget.unitID, "Morphing") == 1
		if not isStillMorphing then
			ai.activeMorphTarget = nil
			ai.reservedMetal = 0
			ai.reservedEnergy = 0
		end
	end

	if ai.activeMorphTarget then return end
	local demand=ai.demand
	if demand then
		if demand.energy.current<demand.energy.storage*0.4 or demand.energy.income<demand.energy.expense then return end
		mcur=math.max(0,mcur-demand.committedMetal)
		ecur=math.max(0,ecur-demand.committedEnergy)
	end

	-- A morph is only worth it when the remaining storage and income still cover
	-- the ongoing build plan after paying. Units cannot be assisted while morphing,
	-- so workers are only surrendered while other construction remains.
	local function goodCost(opt)
		return mcur >= opt.metal + minc * 30 and ecur >= opt.energy + einc * 30
			and (mcur - opt.metal) >= mstor * 0.10 and (ecur - opt.energy) >= estor * 0.10
	end
	local maxTier = demand and demand.maxFactoryTier or 99
	local function techOk(opt)
		return (opt.tech or 0) == 0 or (opt.tech or 0) <= maxTier
	end

	local candidates = {}
	if ai.commanderID then table.insert(candidates, ai.commanderID) end
	for _, uid in ipairs(ai.combatUnits) do table.insert(candidates, uid) end
	for _, uid in ipairs(ai.nanotowers or {}) do table.insert(candidates, uid) end
	for _, uid in ipairs(ai.builders) do
		if uid ~= ai.commanderID then table.insert(candidates, uid) end
	end

	local supportCount = (ai.builderCount or 0) + #(ai.nanotowers or {})

	for _, unitID in ipairs(candidates) do
		local uDefID = spGetUnitDefID(unitID)
		local morphOptions = UnitMorphTable[uDefID]
		if morphOptions and #morphOptions > 0 then
			local xp = spGetUnitExperience(unitID) or 0
			local isCom = (unitID == ai.commanderID)
			local unitMeta = UnitMetadata[uDefID] or {}
			local isNano = (unitMeta.role == "nanotower")
			local isCon = (unitMeta.role == "constructor" or unitMeta.role == "rezzer")
			local queueCount = spGetUnitCommandCount(unitID) or 0

			for _, opt in ipairs(morphOptions) do
				local canMorph = false

				if isCom then
					local hasArmy = (ai.builderCount >= 1) and (ai.factoryCount >= 1)
					local hasSafeEco = (queueCount == 0) and (mcur >= opt.metal) and (ecur >= opt.energy) and (minc >= 8) and (einc >= 60)
					canMorph = hasArmy and hasSafeEco
				elseif isNano then
					-- Nano turrets must not morph while a stall-recovery project is
					-- the reason they exist, and only while another worker remains.
					local noOpenStall = not demand or (demand.energy.current >= demand.energy.storage * 0.5
						and demand.metal.current >= demand.metal.storage * 0.35)
					canMorph = noOpenStall and (supportCount - 1 >= 1) and (queueCount <= 1)
				elseif isCon then
					-- Constructors are sacrificed last; keep construction staffed.
					canMorph = (supportCount - 1 >= 1) and (queueCount <= 1)
						and not (ai.builderTasks and ai.builderTasks[unitID])
				else
					-- Combat units morph only when fully idle so the front line is
					-- not cut while a fight or retreat is in progress.
					canMorph = (queueCount == 0)
				end

				if canMorph and (xp >= opt.xp) and goodCost(opt) and techOk(opt) then
					ai.reservedMetal = opt.metal
					ai.reservedEnergy = opt.energy
					ai.demand = nil
					ai.activeMorphTarget = {
						unitID = unitID,
						targetDef = opt.into,
						startedFrame = currentFrame,
					}

					local morphCmdID = (GG.MorphInfo and GG.MorphInfo[uDefID] and GG.MorphInfo[uDefID][opt.into])
						or (CMD_MORPH + (opt.tech or 1))
					spGiveOrderToUnit(unitID, morphCmdID, {}, 0)

					-- Builders and nano turrets must NOT assist the morph as units cannot obtain external support
					return
				end
			end
		end
	end
end

--------------------------------------------------------------------------------
-- Unit Creation & Team Registration Core Handlers
--------------------------------------------------------------------------------
local function HandleUnitCreated(unitID, unitDefID, unitTeam, builderID)
	local currentFrame = Spring.GetGameFrame()
	local ai = aiTeams[unitTeam]
	if not ai then return end
	ai.registeredUnits = ai.registeredUnits or {}
	if ai.registeredUnits[unitID] then return end

	local udef = UnitDefs[unitDefID]
	local uname = udef and string.lower(udef.name) or ""
	local meta = UnitMetadata[unitDefID] or (udef and UnitMetadata[udef.id]) or UnitMetadata[uname]

	if not meta and udef then
		local faction = InferFaction(uname, udef.customParams) or ai.faction or "arm"
		local hasBuildOptions = udef.buildOptions and #udef.buildOptions > 0
		local isCommander = ((uname:find("com") and not uname:find("comb") and not uname:find("decomp"))
			or (udef.customParams and udef.customParams.iscommander)
			or (udef.category and udef.category:find("COMMANDER")))
			and hasBuildOptions
		local role = "unknown"
		if isCommander then
			role = "commander"
		elseif (udef.extractsMetal and udef.extractsMetal > 0) or (udef.customParams and udef.customParams.metal_extractor) then
			role = "mex"
		elseif udef.isFactory and hasBuildOptions then
			role = "factory"
		elseif udef.isBuilder and udef.canMove and hasBuildOptions then
			role = "constructor"
		elseif udef.isBuilding and ((udef.metalStorage or 0) > 0 or (udef.energyStorage or 0) > 0) then
			role = "storage"
		elseif udef.canMove then
			role = "combat"
		end
		meta = {
			faction = faction,
			role = role,
			tech = 1,
			isWater = (udef.minWaterDepth and udef.minWaterDepth > 0) or false,
			metalCost = udef.metalCost or 100,
			canResurrect = udef.canResurrect or false,
			isCommander = isCommander,
		}
		if role == "storage" then
			meta.storageKind = (udef.metalStorage or 0) > 0 and "metal" or "energy"
			meta.storageAmount = meta.storageKind == "metal" and (udef.metalStorage or 0) or (udef.energyStorage or 0)
		end
		UnitMetadata[unitDefID] = meta
		if udef.id then UnitMetadata[udef.id] = meta end
		UnitMetadata[uname] = meta
	end

	if not meta then return end
	ai.registeredUnits[unitID] = true
	local task = ai.builderTasks and builderID and ai.builderTasks[builderID]
	if task and task.defID == unitDefID then task.unitID = unitID end

	local hasBuildOptions = udef and udef.buildOptions and (#udef.buildOptions > 0)
	local isCom = (meta.role == "commander" or meta.isCommander or (uname:find("com") and not uname:find("comb") and not uname:find("decomp"))) and hasBuildOptions
	if isCom then
		local isNewCom = (ai.commanderID ~= unitID)
		ai.commanderID = unitID
		if meta.faction and FactionUnitCatalog[meta.faction] then
			ai.faction = meta.faction
		end
		-- Add to builders list if not already present
		local alreadyIn = false
		for _, bID in ipairs(ai.builders) do
			if bID == unitID then alreadyIn = true; break end
		end
		if not alreadyIn then
			table.insert(ai.builders, unitID)
			ai.builderCount = ai.builderCount + 1
		end

local cx, cy, cz = spGetUnitPosition(unitID)
		if cx and cz and not ai.spawnPos then
			ai.spawnPos = { x = cx, y = cy, z = cz }
			local scanAt = currentFrame + 90
			ai.metalScanFrame = scanAt
			if not nextMetalScanFrame or scanAt < nextMetalScanFrame then nextMetalScanFrame = scanAt end
		end
		if cy and cy < 0 then
			ai.isWaterMap = true
		end
		if isNewCom then
			ExecuteCommanderOpeningQueue(ai, unitID, udef, unitTeam)
		end
	elseif meta.role == "factory" then
		table.insert(ai.factories, unitID)
		ai.factoryCount = ai.factoryCount + 1
		local fx, fy, fz = spGetUnitPosition(unitID)
		if fx then
			if not ai.rallyPoint then
				local toCenterX = (MAP_SIZE_X / 2) - fx
				local toCenterZ = (MAP_SIZE_Z / 2) - fz
				local dist = math.sqrt(toCenterX * toCenterX + toCenterZ * toCenterZ)
				if dist > 0 then
					ai.rallyPoint = {
						x = fx + (toCenterX / dist) * 550,
						z = fz + (toCenterZ / dist) * 550,
					}
				end
			end
			if ai.rallyPoint then
				local ry = spGetGroundHeight(ai.rallyPoint.x, ai.rallyPoint.z)
				GiveTacticalOrder(ai, unitID, CMD_FIGHT, { ai.rallyPoint.x, ry, ai.rallyPoint.z }, currentFrame)
			end
		end
		-- Commander must NOT linger at or guard a factory; Commander remains free for base expansion
	elseif meta.role == "constructor" then
		table.insert(ai.builders, unitID)
		ai.builderCount = ai.builderCount + 1

		-- Associate builder with its producing factory for neighbourhood-aware
		-- assignment; the constructor pool itself is budget/income-driven.
		local sourceFac = builderID
		if not sourceFac or not Spring.ValidUnitID(sourceFac) or not (ai.factoryBuilders and ai.factoryBuilders[sourceFac]) then
			local ux, _, uz = spGetUnitPosition(unitID)
			local bestDistSq = 450 * 450
			for _, facID in ipairs(ai.factories) do
				if Spring.ValidUnitID(facID) then
					local fx, _, fz = spGetUnitPosition(facID)
					if fx and ux then
						local dsq = (ux - fx)^2 + (uz - fz)^2
						if dsq < bestDistSq then
							bestDistSq = dsq
							sourceFac = facID
						end
					end
				end
			end
		end
		if sourceFac and Spring.ValidUnitID(sourceFac) then
			if not ai.factoryBuilders then ai.factoryBuilders = {} end
			if not ai.factoryBuilders[sourceFac] then ai.factoryBuilders[sourceFac] = {} end
			ai.factoryBuilders[sourceFac][unitID] = true
			ai.builderSourceFactory[unitID] = sourceFac
		end


	elseif meta.role == "rezzer" then
		table.insert(ai.rezUnits, unitID)
		table.insert(ai.builders, unitID)
		ai.builderCount = ai.builderCount + 1
	elseif meta.role == "mex" then
		table.insert(ai.mexes, unitID)
		local mx, _, mz = spGetUnitPosition(unitID)
		if mx then
			local key = math.floor(mx / 32) .. "_" .. math.floor(mz / 32)
			ai.claimedSpots[key] = true
			ai.mexPositions[unitID] = { x = mx, z = mz }
		end
	elseif meta.role == "scout" then
		table.insert(ai.scoutUnits, unitID)
		ai.scoutCount = ai.scoutCount + 1
		local tInfo = spGetTeamInfo(unitTeam)
		local allyTeam = (type(tInfo) == "table") and tInfo.allyTeam or select(6, spGetTeamInfo(unitTeam))
		local target = PickBestReconTarget(ai, allyTeam, Spring.GetGameFrame())
		if target then
			local ty = spGetGroundHeight(target.x, target.z)
			GiveTacticalOrder(ai, unitID, CMD_FIGHT, { target.x, ty, target.z }, currentFrame)
		end
	elseif meta.role == "raider" then
		table.insert(ai.raiderUnits, unitID)
		table.insert(ai.combatUnits, unitID)
		ai.combatCount = ai.combatCount + 1
		-- Early Raider Dispatch (BARb aggressive flanking)
		if ai.combatCount <= 4 then
			local comX = ai.spawnPos and ai.spawnPos.x or (MAP_SIZE_X / 2)
			local comZ = ai.spawnPos and ai.spawnPos.z or (MAP_SIZE_Z / 2)
			local enemyX = ai.intel.enemyBaseCentroid and ai.intel.enemyBaseCentroid.x or (MAP_SIZE_X - comX)
			local enemyZ = ai.intel.enemyBaseCentroid and ai.intel.enemyBaseCentroid.z or (MAP_SIZE_Z - comZ)
			local ty = spGetGroundHeight(enemyX, enemyZ)
			GiveTacticalOrder(ai, unitID, CMD_FIGHT, { enemyX + math.random(-250, 250), ty, enemyZ + math.random(-250, 250) }, currentFrame)
		end
	elseif meta.role == "artillery" then
		table.insert(ai.artilleryUnits, unitID)
		table.insert(ai.combatUnits, unitID)
		ai.combatCount = ai.combatCount + 1
	elseif meta.role == "aa" then
		table.insert(ai.aaUnits, unitID)
		table.insert(ai.combatUnits, unitID)
		ai.combatCount = ai.combatCount + 1
	elseif meta.role == "combat" then
		table.insert(ai.combatUnits, unitID)
		ai.combatCount = ai.combatCount + 1
		if meta.tech <= 2 then
			table.insert(ai.assaultUnits, unitID)
		end
	elseif meta.role == "converter" then
		ai.converters[unitID] = true
	elseif meta.role == "nanotower" then
		table.insert(ai.nanotowers, unitID)
		-- Nanotowers boost nearby factories and must NOT assist the commander's morph
		if #ai.factories > 0 then
			local bestFac = ai.factories[1]
			local bestDistSq = math.huge
			local nx, _, nz = spGetUnitPosition(unitID)
			if nx then
				for _, facID in ipairs(ai.factories) do
					if Spring.ValidUnitID(facID) then
						local fx, _, fz = spGetUnitPosition(facID)
						if fx then
							local dsq = (nx - fx)^2 + (nz - fz)^2
							if dsq < bestDistSq then
								bestDistSq = dsq
								bestFac = facID
							end
						end
					end
				end
			end
			if bestFac then
				spGiveOrderToUnit(unitID, CMD_GUARD, { bestFac }, 0)
			end
		end
	end

	local udef = UnitDefs[unitDefID]
	local isBaseStruct = (udef and not udef.canMove) or
		(meta.role == "factory" or meta.role == "energy" or meta.role == "converter" or meta.role == "defense" or meta.role == "radar" or meta.role == "nanotower")
	if isBaseStruct and meta.role ~= "mex" then
		local sx, _, sz = spGetUnitPosition(unitID)
		if sx then
			ai.baseStructures[unitID] = { x = sx, z = sz }
		end
		-- RUMAD Special Rule: Mobile structures park at construction location with CMD_STOP
		if udef and udef.canMove and meta.role ~= "constructor" and meta.role ~= "rezzer" and meta.role ~= "commander" and meta.role ~= "combat" and meta.role ~= "scout" and meta.role ~= "raider" and meta.role ~= "artillery" and meta.role ~= "aa" then
			spGiveOrderToUnit(unitID, CMD_STOP, {}, 0)
		end
	end
end

local function RegisterAITeam(teamID, aiTypeStr)
	if aiTeams[teamID] then return end
	local lowerAI = string.lower(aiTypeStr or "")
	if string.find(lowerAI, "null") then return end

	local diff = DIFFICULTY.NORMAL
	if string.find(lowerAI, "easy") then
		diff = DIFFICULTY.EASY
	elseif string.find(lowerAI, "hard") or string.find(lowerAI, "cheater") or string.find(lowerAI, "brutal") then
		diff = DIFFICULTY.HARD
	elseif string.find(lowerAI, "med") or string.find(lowerAI, "normal") then
		diff = DIFFICULTY.NORMAL
	end

	if not aiTeams[teamID] then
		local initFaction = nil
		local tInfo = spGetTeamInfo(teamID)
		local sideStr
		if type(tInfo) == "table" then
			sideStr = tInfo.side
		else
			local _, _, _, _, s = spGetTeamInfo(teamID)
			sideStr = s
		end
		if sideStr and sideStr ~= "" and FactionUnitCatalog[string.lower(sideStr)] then
			initFaction = string.lower(sideStr)
		end

		aiTeamCount = aiTeamCount + 1
		aiTeamList[aiTeamCount] = teamID
		aiTeams[teamID] = {
			teamID = teamID,
			difficulty = diff,
			faction = initFaction,
			commanderID = nil,
			spawnPos = nil,
			commanderMexCount = 0,
			commanderEnergyCount = 0,
			commanderTargetEnergy = math.random(2, 3),
			openingSequenceQueued = false,
			openingFactoryOrdered = false,
			openingFactoryType = nil,
			factoryRallySet = {},
			mexBuilders = {},
			maxCommanderDist = 1100,
			baseStructures = {},
			factories = {},
			factoryCount = 0,
			factoryBuilders = {},
			builderSourceFactory = {},
			threatProfile = {
				air = 0,
				heavy = 0,
				raider = 0,
				artillery = 0,
				sea = 0,
				lastScanFrame = 0,
			},
			builders = {},
			builderCount = 0,
			nanotowers = {},
			combatUnits = {},
			combatCount = 0,
			raiderUnits = {},
			assaultUnits = {},
			artilleryUnits = {},
			aaUnits = {},
			rezUnits = {},
			scoutUnits = {},
			scoutCount = 0,
			retreatingUnits = {},
			converters = {},
			convertersOn = false,
			frontline = nil,
			claimedSpots = {},
			mexes = {},
			mexPositions = {},
			reservedMetal = 0,
			reservedEnergy = 0,
			activeMorphTarget = nil,
			pendingMorphUnits = {},
			intel = {
				knownBuildings = {},
				radarBlips = {},
				lastScoutPos = nil,
				enemyBaseCentroid = nil,
				threatZones = {},
				hints = { tech = 0, kinds = {}, seen = {} },
			},
			rallyPoint = nil,
			lastAssaultFrame = 0,
			lastRaidFrame = 0,
			lastScoutSweepFrame = 0,
			lastMorphCheckFrame = 0,
			lastConverterCheckFrame = 0,
			lastRetreatCheckFrame = 0,
			lastReclaimScanFrame = 0,
			isWaterMap = false,
		}
	end

	-- Scan all pre-existing units on this team
	local units = spGetTeamUnits(teamID)
	if units then
		for _, uid in ipairs(units) do
			local udefID = spGetUnitDefID(uid)
			if udefID then
				HandleUnitCreated(uid, udefID, teamID)
			end
		end
	end
end

local function GetAITypeForTeam(teamID)
	if teamID == Spring.GetGaiaTeamID() then
		return nil
	end
	local luaAI = Spring.GetTeamLuaAI(teamID)
	if luaAI and luaAI ~= "" then
		if string.find(string.lower(luaAI), "null") then
			return nil
		end
		return luaAI
	end
	if Spring.GetAIInfo then
		local info = { Spring.GetAIInfo(teamID) }
		if #info > 0 then
			for _, val in ipairs(info) do
				if type(val) == "string" and val ~= "" then
					local lower = string.lower(val)
					if string.find(lower, "null") then return nil end
					if string.find(lower, "tech") or string.find(lower, "barb") or string.find(lower, "hard") or string.find(lower, "easy") or string.find(lower, "normal") or string.find(lower, "bot") then
						return val
					end
				end
			end
			return "TechAI: Hard"
		end
	end
	local tInfo = spGetTeamInfo(teamID)
	if type(tInfo) == "table" then
		if tInfo.isAI then return "TechAI: Hard" end
	else
		local _, _, _, isAI = spGetTeamInfo(teamID)
		if isAI then return "TechAI: Hard" end
	end
	return nil
end

local function ScanAndRegisterAITeams()
	local teams = Spring.GetTeamList()
	if not teams then return end
	for i = 1, #teams do
		local teamID = teams[i]
		local aiType = GetAITypeForTeam(teamID)
		if aiType then
			RegisterAITeam(teamID, aiType)
		end
	end
end

--------------------------------------------------------------------------------
-- Builder Execution Logic (Tech Levels 1 through 5)
--------------------------------------------------------------------------------
local BuilderPlanner = VFS.Include('LuaRules/Configs/techai_builder.lua').Create({
	metadata=UnitMetadata, threat=GetThreatAtPosition, layout=BaseLayout, metalSpots=GetMetalSpots,
	basePosition=FindBaseExpansionBuildPosition, safePosition=FindSafeBuildPosition,
})

local function ManageBuilder(ai, builderID, bDefID, teamID, allyTeamID, currentFrame)
	local q = spGetUnitCommandCount(builderID)
	-- Factories pass their combat rally command to constructors too. Treat this
	-- inherited FIGHT order as replaceable, otherwise builders march to the front.
	if q and q > 0 then
		local commands = spGetCommandQueue(builderID, 1)
		if commands and commands[1] and commands[1].id == CMD_FIGHT then q = 0 end
	end
	if q and q > 1 and builderID ~= ai.commanderID then return end

	local mcur, mstor, _, minc = spGetTeamResources(teamID, "metal")
	local ecur, estor, _, einc = spGetTeamResources(teamID, "energy")
	local bx, by, bz = spGetUnitPosition(builderID)
	if not bx then return end

	-- Resource Budget: Respect resources set aside for morphing!
	local usableMetal = mcur - (ai.reservedMetal or 0)
	local usableEnergy = ecur - (ai.reservedEnergy or 0)

	local cat = FactionUnitCatalog[ai.faction]
	if not cat then return end

	local udef = UnitDefs[bDefID]
	if not udef then return end
	local meta = UnitMetadata[bDefID] or { tech = 1 }
	local builderTech = meta.tech
	local isCommander = (builderID == ai.commanderID) or (udef.customParams and udef.customParams.iscommander) or (meta.role == "commander")


	if isCommander and not ai.spawnPos then
		ai.spawnPos = { x = bx, y = by, z = bz }
	end

	-- Commander Tether Enforcement: ONLY enforce when completely idle (q == 0) so active build tasks are NEVER interrupted!
	if isCommander and ai.spawnPos and (q == 0) then
		local distSq = (bx - ai.spawnPos.x) * (bx - ai.spawnPos.x) + (bz - ai.spawnPos.z) * (bz - ai.spawnPos.z)
		local inRange = (distSq <= (ai.maxCommanderDist or 1100) * (ai.maxCommanderDist or 1100))
		if not inRange and ai.baseStructures then
			for _, pos in pairs(ai.baseStructures) do
				local sdx = bx - pos.x
				local sdz = bz - pos.z
				if (sdx * sdx + sdz * sdz) <= 280 * 280 then
					inRange = true
					break
				end
			end
		end

		if not inRange then
			spGiveOrderToUnit(builderID, CMD_MOVE, { ai.spawnPos.x, ai.spawnPos.y, ai.spawnPos.z }, 0)
			return
		end
	end

	-- 1. Commander Emergency Self-Preservation & D-GUN Micro (BARb Style)
	if isCommander then
		local hp, maxhp = spGetUnitHealth(builderID)
		if hp and maxhp and (hp / maxhp < 0.50) then
			if ai.spawnPos then
				spGiveOrderToUnit(builderID, CMD_MOVE, { ai.spawnPos.x, ai.spawnPos.y, ai.spawnPos.z }, 0)
				for _, otherBID in ipairs(ai.builders) do
					if otherBID ~= builderID and Spring.ValidUnitID(otherBID) then
						local oq = spGetUnitCommandCount(otherBID)
						if oq == 0 then
							spGiveOrderToUnit(otherBID, CMD_REPAIR, { builderID }, 0)
						end
					end
				end
				return
			end
		end

		local nearestEnemy = spGetUnitNearestEnemy(builderID, 320, true)
		if nearestEnemy and ecur >= 500 then
			spGiveOrderToUnit(builderID, CMD_DGUN, { nearestEnemy }, 0)
			return
		end
	end

	-- Dedicated Rezzer Unit Behavior: Revive fallen combat units, repair allies, or follow frontline
	if meta.role == "rezzer" and not isCommander then
		if q == 0 then
			-- A. Resurrect nearby wrecks (both friendly and enemy) to bolster AI army
			if spGetFeaturesInCylinder then
				local nearbyFeatures = spGetFeaturesInCylinder(bx, bz, 1200)
				if nearbyFeatures and #nearbyFeatures > 0 then
					local bestWreck = nil
					local bestMetal = 15
					for _, featID in ipairs(nearbyFeatures) do
						local fDefID = spGetFeatureDefID(featID)
						local fDef = fDefID and FeatureDefs[fDefID]
						local isRez = false
						if spGetFeatureResurrect and spGetFeatureResurrect(featID) then
							isRez = true
						elseif fDef and fDef.resurrectable and fDef.resurrectable ~= 0 then
							isRez = true
						end
						if isRez and fDef and fDef.metal and fDef.metal >= bestMetal then
							bestMetal = fDef.metal
							bestWreck = featID
						end
					end
					if bestWreck and spGetFeaturePosition then
						local fx, fy, fz = spGetFeaturePosition(bestWreck)
						if fx then
							spGiveOrderToUnit(builderID, CMD_RESURRECT, { fx, fy, fz, 80 }, 0)
							return
						end
					end
				end
			end

			-- B. Repair damaged friendly units nearby
			local nearbyDamaged = spGetUnitsInCylinder(bx, bz, 750, teamID)
			for _, uid in ipairs(nearbyDamaged) do
				local hp, maxhp = spGetUnitHealth(uid)
				if hp and maxhp and hp < maxhp * 0.90 then
					spGiveOrderToUnit(builderID, CMD_REPAIR, { uid }, 0)
					return
				end
			end

			-- C. If idle and no casualties nearby, follow frontline / rally point
			if ai.frontline then
				local fx, fz = ai.frontline.x, ai.frontline.z
				local fy = spGetGroundHeight(fx, fz)
				spGiveOrderToUnit(builderID, CMD_PATROL, { fx + math.random(-150, 150), fy, fz + math.random(-150, 150) }, 0)
				return
			end
		end
		return
	end

	if q and q > 0 then
		local command = spGetCommandQueue(builderID, 1)
		local id = command and command[1] and command[1].id
		local task = ai.builderTasks and ai.builderTasks[builderID]
		if id and id ~= CMD_GUARD and id ~= CMD_PATROL
			and not (id == CMD_REPAIR and task and task.role == 'assist') then return end
	end


	local orderOpt = (q and q > 0) and { "shift" } or {}
	if q and q > 0 then
		local topCmd = spGetCommandQueue(builderID, 1)
		if topCmd and #topCmd > 0 and (topCmd[1].id == CMD_GUARD or topCmd[1].id == CMD_PATROL) then
			orderOpt = {}
		end
	end

	-- 3. Commander Opening Sequence (BARb Style Shift-Queuing)
	if #GetMetalSpots()==0 then
		BuilderPlanner.Manage(ai,builderID,bDefID,teamID,allyTeamID,currentFrame)
		return
	end
	if isCommander and ai.factoryCount == 0 then
		if not ai.openingSequenceQueued then
			if ExecuteCommanderOpeningQueue(ai, builderID, udef, teamID) then
				return
			end
		end

		if q and q > 0 then
			return
		end

		-- If opening sequence finished but factory not completed yet (still constructing)
		if ai.openingFactoryOrdered then
			local nearbyFac = nil
			local baseRefX = ai.spawnPos and ai.spawnPos.x or bx
			local baseRefZ = ai.spawnPos and ai.spawnPos.z or bz
			local unitsNear = spGetUnitsInCylinder(baseRefX, baseRefZ, 550, teamID)
			for _, uid in ipairs(unitsNear) do
				local udefID = spGetUnitDefID(uid)
				local bmeta = UnitMetadata[udefID]
				if bmeta and bmeta.role == "factory" then
					nearbyFac = uid
					break
				end
			end
			if nearbyFac then
				spGiveOrderToUnit(builderID, CMD_REPAIR, { nearbyFac }, 0)
				return
			end
		end

		-- Fallback Phase A: Build up to 2 local mexes within 450 elmos of spawn
		if (ai.commanderMexCount or 0) < 2 then
			local targetMexDef = nil
			for _, bopt in ipairs(udef.buildOptions or {}) do
				local bmeta = UnitMetadata[bopt]
				if bmeta and bmeta.role == "mex" and bmeta.tech == 1 then
					targetMexDef = bopt
					break
				end
			end
			if not targetMexDef then
				for _, bopt in ipairs(udef.buildOptions or {}) do
					local bdef = UnitDefs[bopt]
					local bname = bdef and string.lower(bdef.name) or ""
					if (bdef and bdef.extractsMetal and bdef.extractsMetal > 0) or bname:find("mex") or (bdef and bdef.customParams and bdef.customParams.metal_extractor) then
						targetMexDef = bopt
						break
					end
				end
			end

			if targetMexDef then
				local spot = GetClosestFreeMexSpot(ai, bx, bz, 450, ai.spawnPos, targetMexDef)
				if spot then
					local key = math.floor(spot.x / 32) .. "_" .. math.floor(spot.z / 32)
					ai.claimedSpots[key] = currentFrame + 1800
					ai.commanderMexCount = (ai.commanderMexCount or 0) + 1
					local sy = spot.y or spGetGroundHeight(spot.x, spot.z)
					spGiveOrderToUnit(builderID, -targetMexDef, { spot.x, sy, spot.z, 0 }, orderOpt)
					return
				else
					ai.commanderMexCount = 2
				end
			else
				ai.commanderMexCount = 2
			end
		end

		-- Fallback Phase B: Initial base energy (1-2 Solar or Wind) before building the factory
		local targetEnergy = ai.commanderTargetEnergy or 2
		if (ai.commanderEnergyCount or 0) < targetEnergy then
			local energyDef = nil
			if Game.windMax and Game.windMax >= 10 then
				for _, bopt in ipairs(udef.buildOptions or {}) do
					local bdef = UnitDefs[bopt]
					if bdef and bdef.windGenerator and bdef.windGenerator > 0 then
						energyDef = bopt
						break
					end
				end
			end
			if not energyDef then
				for _, bopt in ipairs(udef.buildOptions or {}) do
					local bdef = UnitDefs[bopt]
					if bdef and (bdef.name:find("solar") or (bdef.customParams and bdef.customParams.solar)) then
						energyDef = bopt
						break
					end
				end
			end
			if not energyDef then
				for _, bopt in ipairs(udef.buildOptions or {}) do
					local bmeta = UnitMetadata[bopt]
					if bmeta and bmeta.role == "energy" and bmeta.tech == 1 then
						energyDef = bopt
						break
					end
				end
			end

			if energyDef then
				local px, py, pz, facing = FindBaseExpansionBuildPosition(energyDef, ai, 36)
				if not px then
					px, py, pz, facing = FindSafeBuildPosition(energyDef, bx, bz, 350, 36, ai)
				end
				if px then
					ai.commanderEnergyCount = (ai.commanderEnergyCount or 0) + 1
					spGiveOrderToUnit(builderID, -energyDef, { px, py, pz, facing }, orderOpt)
					return
				end
			end
		end

		-- Fallback Phase C: Primary T1 Factory (Kbot 70% / Veh 30%)
		if not ai.openingFactoryType then
			local r = math.random(1, 100)
			ai.openingFactoryType = (r <= 70) and "kbot" or "veh"
		end

		local facDef = nil
		for _, bopt in ipairs(udef.buildOptions or {}) do
			local bmeta = UnitMetadata[bopt]
			if bmeta and bmeta.role == "factory" and bmeta.tech == 1 then
				local bdef = UnitDefs[bopt]
				local bname = bdef and bdef.name or ""
				if ai.openingFactoryType == "kbot" and (bname:find("lab") or bname:find("kbot")) then
					facDef = bopt
					break
				elseif ai.openingFactoryType == "veh" and (bname:find("vp") or bname:find("veh") or bname:find("avp")) then
					facDef = bopt
					break
				end
			end
		end

		if not facDef then
			for _, bopt in ipairs(udef.buildOptions or {}) do
				local bmeta = UnitMetadata[bopt]
				if bmeta and bmeta.role == "factory" and bmeta.tech == 1 then
					facDef = bopt
					break
				end
			end
		end

		if facDef then
			local fx, fy, fz, ffacing = FindBaseExpansionBuildPosition(facDef, ai, 64)
			if not fx then
				fx, fy, fz, ffacing = FindSafeBuildPosition(facDef, bx, bz, 450, 64, ai)
			end
			if fx then
				ai.openingFactoryOrdered = true
				spGiveOrderToUnit(builderID, -facDef, { fx, fy, fz, ffacing }, orderOpt)
				return
			end
		end
	end

	BuilderPlanner.Manage(ai,builderID,bDefID,teamID,allyTeamID,currentFrame)
end

--------------------------------------------------------------------------------
-- Factory Production Logic (Tech Levels 1 through 5)
--------------------------------------------------------------------------------
local function UpdateIncomingThreatProfile(ai, teamID, currentFrame)
	if currentFrame - (ai.threatProfile.lastScanFrame or -90) < 90 then return end
	local profile = {air=0,heavy=0,raider=0,artillery=0,sea=0,lastScanFrame=currentFrame}
	local enemy = {air=0,ground=0,heavy=0,raider=0,artillery=0,defense=0,sea=0}
	local allyTeamID = select(6,spGetTeamInfo(teamID))
	local bx = ai.spawnPos and ai.spawnPos.x or MAP_SIZE_X/2
	local bz = ai.spawnPos and ai.spawnPos.z or MAP_SIZE_Z/2
	ai.intel.contacts = ai.intel.contacts or {}
	for _, id in ipairs(spGetUnitsInCylinder(bx,bz,2600) or {}) do
		local team=Spring.GetUnitTeam(id)
		local los=spGetUnitLosState(id,allyTeamID)
		if team and not spAreTeamsAllied(teamID,team) and los and los.los then
			local x,_,z=spGetUnitPosition(id)
			if x then ai.intel.contacts[id]={defID=spGetUnitDefID(id),x=x,z=z,frame=currentFrame} end
		end
	end
	for id,contact in pairs(ai.intel.contacts) do
		local los=spGetUnitLosState(id,allyTeamID)
		if los and los.los then
			local x,_,z=spGetUnitPosition(id)
			if x then contact.x,contact.z,contact.frame=x,z,currentFrame end
		end
		local age=currentFrame-contact.frame
		local meta=UnitMetadata[contact.defID]
		if age>900 or not meta then ai.intel.contacts[id]=nil
		else
			local role=meta.canFly and 'air' or (meta.isWater and 'sea') or (meta.role=='defense' and 'defense'
				or (meta.role=='artillery' and 'artillery' or (meta.role=='raider' and 'raider' or 'heavy')))
			local weight=math.min(12,math.max(1,math.sqrt((meta.metalCost or 100)/200))) * (1-age/1200)
			if meta.isArmed then
				enemy[role]=enemy[role]+weight
				if role~='air' and role~='defense' then enemy.ground=enemy.ground+weight end
				if role~='defense' and (contact.x-bx)^2+(contact.z-bz)^2<2600^2 then profile[role]=profile[role]+1 end
			end
		end
	end
	-- Enemies hint at their army mix before their units are seen: a known enemy
	-- factory's producible roster preloads the production profile so the AI can
	-- field AA/anti-heavy/sea counters while those factories are still building.
	for id,data in pairs(ai.intel.knownBuildings) do
		if data.category=='factory' and currentFrame-(data.frame or 0)<1800 then
			local udef=UnitDefs[data.unitDefID]
			if udef then
				for _,productID in ipairs(udef.buildOptions or {}) do
					local meta=UnitMetadata[productID]
					if meta then
						local kind=meta.canFly and 'air' or (meta.isWater and 'sea')
							or (meta.role=='defense' and 'defense' or (meta.role=='artillery' and 'artillery' or (meta.role=='raider' and 'raider' or 'ground')))
						enemy[kind]=enemy[kind]+0.5
						if kind~='air' and kind~='defense' then enemy.ground=enemy.ground+0.5 end
					end
				end
			end
		end
	end
	-- Accumulate the remembered enemy unit-mix and best tier so later decision
	-- layers can prepare (tech rush, counters) without needing one visible unit.
	local hints=ai.intel.hints or {tech=0,kinds={},seen={}}
	for id,contact in pairs(ai.intel.contacts) do
		local meta=UnitMetadata[contact.defID]
		if meta then
			hints.tech=math.max(hints.tech,meta.tech or 1)
			local kind=meta.canFly and 'air' or (meta.isWater and 'sea')
				or (meta.role=='defense' and 'defense' or (meta.role=='artillery' and 'artillery' or (meta.role=='raider' and 'raider' or 'ground')))
			hints.kinds[kind]=(hints.kinds[kind] or 0)+1
			hints.seen[contact.defID]=true
		end
	end
	hints.frame=currentFrame
	ai.intel.hints=hints
	ai.threatProfile,ai.productionEnemy=profile,enemy
end

local ProductionPlanner = VFS.Include('LuaRules/Configs/techai_production.lua')

-- Count completed units plus every queued unit exactly once across factories.
local function GetProductionSnapshot(ai)
	local pending, depths, counts, unitCounts, strength = {}, {}, {}, {}, {}
	local highestBuilderTech=0
	for id in pairs(ai.registeredUnits or {}) do
		local defID=spGetUnitDefID(id)
		local meta=UnitMetadata[defID]
		if meta and IsUnitReady(id) then
			counts[meta.role]=(counts[meta.role] or 0)+1
			strength[meta.role]=(strength[meta.role] or 0)+math.min(12,math.max(1,math.sqrt((meta.metalCost or 100)/200)))
			unitCounts[defID]=(unitCounts[defID] or 0)+1
			if meta.role=='constructor' then highestBuilderTech=math.max(highestBuilderTech,meta.tech or 1) end
		end
	end
	for _,factoryID in ipairs(ai.factories) do
		local depth=0
		for _,item in ipairs(spGetFullBuildQueue(factoryID) or {}) do
			for defID,count in pairs(item) do
				pending[defID]=(pending[defID] or 0)+count
				unitCounts[defID]=(unitCounts[defID] or 0)+count
				local meta=UnitMetadata[defID]
				if meta then
					counts[meta.role]=(counts[meta.role] or 0)+count
					strength[meta.role]=(strength[meta.role] or 0)+count*math.min(12,math.max(1,math.sqrt((meta.metalCost or 100)/200)))
					if meta.role=='constructor' then highestBuilderTech=math.max(highestBuilderTech,meta.tech or 1) end
				end
				depth=depth+count
			end
		end
		depths[factoryID]=depth
	end
	ai.production={pending=pending,depths=depths,counts=counts,unitCounts=unitCounts,strength=strength,highestBuilderTech=highestBuilderTech,frame=Spring.GetGameFrame()}
end

local function ManageFactory(ai,factoryID,fDefID,teamID)
	local production=ai.production
	local depth=production.depths[factoryID] or 0
	local limit=(UnitMetadata[fDefID].tech or 1)>=3 and 1 or 3
	if depth>=limit then return end
	local frame=Spring.GetGameFrame()
	local demand=BuilderPlanner.Refresh(ai,teamID,frame)
	local def=UnitDefs[fDefID]
	if not def or not def.buildOptions then return end
	local threat=ai.threatProfile
	local state={counts=production.counts,unitCounts=production.unitCounts,strength=production.strength,isWaterMap=ai.isWaterMap,
		enemy=ai.productionEnemy or threat,underAttack=(threat.air+threat.heavy+threat.raider+threat.artillery)>0,
		-- Judgement-based constructor count: every builder above the income floor
	-- and unfinished-project pressure must justify its metal/energy upkeep.
	builderTarget=math.max(2,math.min(ai.difficulty.maxBuilders*3,
		2+math.floor(demand.metal.income/12)+math.floor(#(demand.unfinished or {})/4))),
		scoutTarget=math.min(3,1+math.floor(#ai.combatUnits/25)),
		highestBuilderTech=production.highestBuilderTech,desiredTier=UnitMetadata[fDefID].tech,
		factoryCount=#ai.factories,factoryBuildSpeed=def.buildSpeed,
		resources={metalCurrent=math.max(0,demand.metal.current-demand.committedMetal),metalIncome=demand.metal.income,
			energyCurrent=math.max(0,demand.energy.current-demand.committedEnergy),energyIncome=demand.energy.income,
			metalExpense=demand.metal.expense,energyExpense=demand.energy.expense}}
	while depth<limit do
		local project,reason=ProductionPlanner.Choose(def.buildOptions,UnitMetadata,state)
		if not project then break end
		-- Append production so a live nanoframe is never cancelled.
		spGiveOrderToUnit(factoryID,-project,{}, {'shift'})
		local meta=UnitMetadata[project]
		production.pending[project]=(production.pending[project] or 0)+1
		production.unitCounts[project]=(production.unitCounts[project] or 0)+1
		production.counts[meta.role]=(production.counts[meta.role] or 0)+1
		production.strength[meta.role]=(production.strength[meta.role] or 0)+math.min(12,math.max(1,math.sqrt((meta.metalCost or 100)/200)))
		if meta.role=='constructor' then
			production.highestBuilderTech=math.max(production.highestBuilderTech,meta.tech or 1)
			state.highestBuilderTech=production.highestBuilderTech
		end
		ai.factoryChoices=ai.factoryChoices or {}
		ai.factoryChoices[factoryID]={defID=project,reason=reason,frame=frame}
		depth=depth+1
	end
	production.depths[factoryID]=depth
end

--------------------------------------------------------------------------------
-- Military & Wave Assault Manager
--------------------------------------------------------------------------------
local function ManageMilitaryForces(ai, teamID, allyTeamID, currentFrame)
	local readyCombat = {}
	for _, uID in ipairs(ai.combatUnits) do
		local meta = UnitMetadata[spGetUnitDefID(uID)]
		if meta and meta.role ~= 'raider' and not ai.retreatingUnits[uID] and IsUnitReady(uID)
			and (not ai.activeMorphTarget or ai.activeMorphTarget.unitID ~= uID)
			and not (ai.microUntil and (ai.microUntil[uID] or 0) > currentFrame) then
			table.insert(readyCombat, uID)
		end
	end

	-- 1. Protect Active Morphing Units (Screen paralyzed units undergoing metamorphosis)
	if ai.activeMorphTarget and Spring.ValidUnitID(ai.activeMorphTarget.unitID) then
		local mx, my, mz = spGetUnitPosition(ai.activeMorphTarget.unitID)
		if mx then
			local threat = spGetUnitNearestEnemy(ai.activeMorphTarget.unitID, 900, true)
			if threat then
				local tx, ty, tz = spGetUnitPosition(threat)
				if tx then
					for _, unitID in ipairs(readyCombat) do
						local q = spGetUnitCommandCount(unitID)
						if q and q <= 1 then
							GiveTacticalOrder(ai, unitID, CMD_FIGHT, { tx, ty, tz }, currentFrame)
						end
					end
					return
				end
			end
		end
	end

	-- 2. Base Defense Reflex (Intercept visible enemies threatening base perimeter)
	local comX = ai.spawnPos and ai.spawnPos.x or MAP_SIZE_X / 2
	local comZ = ai.spawnPos and ai.spawnPos.z or MAP_SIZE_Z / 2
	if ai.commanderID then
		local cx, _, cz = spGetUnitPosition(ai.commanderID)
		if cx then comX, comZ = cx, cz end
	end

	local baseThreat = spGetUnitNearestEnemy(ai.commanderID or readyCombat[1] or 0, 1600, true)
	if baseThreat then
		local tx, ty, tz = spGetUnitPosition(baseThreat)
		if tx and (tx - comX)^2 + (tz - comZ)^2 < 1600^2 then
			-- A lone raider must not pull the entire attacking army home.
			local distances = {}
			for _, id in ipairs(readyCombat) do
				local x, _, z = spGetUnitPosition(id)
				distances[id] = x and ((x-tx)^2 + (z-tz)^2) or math.huge
			end
			table.sort(readyCombat, function(a,b)
				if distances[a] == distances[b] then return a < b end
				return distances[a] < distances[b]
			end)
			local threats = ai.threatProfile
			local defenders = math.min(#readyCombat, math.max(3, 2 * (threats.heavy + threats.raider + threats.artillery)))
			for index = 1, defenders do
				local unitID = readyCombat[index]
				local q = spGetUnitCommandCount(unitID)
				if q and q <= 1 then
					GiveTacticalOrder(ai, unitID, CMD_FIGHT, { tx, ty, tz }, currentFrame)
				end
			end
			for index = defenders, 1, -1 do table.remove(readyCombat, index) end
		end
	end

	-- 3. Staged Push / Coordinated Wave Assault against Scouted Intel Targets
	if #readyCombat >= ai.difficulty.squadSize and (currentFrame - ai.lastAssaultFrame > 450) then
		ai.lastAssaultFrame = currentFrame

		local targetX, targetY, targetZ = nil, nil, nil

		-- Prefer valuable, nearby, lightly defended objectives over arbitrary IDs.
		local bestScore = -math.huge
		local bestID = math.huge
		for id, data in pairs(ai.intel.knownBuildings) do
			local value = data.category == 'factory' and 800 or
				(data.category == 'mex' and 450 or (data.category == 'energy' and 350 or 100))
			local distance = math.sqrt((data.x-comX)^2 + (data.z-comZ)^2)
			local score = value - distance * 0.05 - GetThreatAtPosition(ai, data.x, data.z)
			if score > bestScore or (score == bestScore and id < bestID) then
				bestScore, bestID = score, id
				targetX, targetY, targetZ = data.x, data.y, data.z
			end
		end

		-- Priority B: Known enemy metal extractors / outposts
		if not targetX then
			for _, data in pairs(ai.intel.knownBuildings) do
				if data.category == "mex" or data.category == "energy" then
					targetX, targetY, targetZ = data.x, data.y, data.z
					break
				end
			end
		end

		-- Priority C: Known radar blips in the fog
		if not targetX then
			for _, blip in pairs(ai.intel.radarBlips) do
				targetX = blip.x
				targetZ = blip.z
				targetY = spGetGroundHeight(blip.x, blip.z)
				break
			end
		end

		-- Priority D: Enemy base centroid or opposite map quadrant
		if not targetX then
			if ai.intel.enemyBaseCentroid then
				targetX = ai.intel.enemyBaseCentroid.x
				targetZ = ai.intel.enemyBaseCentroid.z
				targetY = spGetGroundHeight(targetX, targetZ)
			else
				targetX = MAP_SIZE_X - comX
				targetZ = MAP_SIZE_Z - comZ
				targetY = spGetGroundHeight(targetX, targetZ)
			end
		end

		if targetX then
			for _, unitID in ipairs(readyCombat) do
				GiveTacticalOrder(ai, unitID, CMD_FIGHT, { targetX + math.random(-120, 120), targetY, targetZ + math.random(-120, 120) }, currentFrame)
			end

		end
	elseif #readyCombat < ai.difficulty.squadSize and ai.rallyPoint then
		local ry = spGetGroundHeight(ai.rallyPoint.x, ai.rallyPoint.z)
		for _, unitID in ipairs(readyCombat) do
			local q = spGetUnitCommandCount(unitID)
			if q and q == 0 then
				GiveTacticalOrder(ai, unitID, CMD_FIGHT, { ai.rallyPoint.x + math.random(-100, 100), ry, ai.rallyPoint.z + math.random(-100, 100) }, currentFrame)
			end
		end
	end

	-- 4. Scout Recon Dispatcher
	if (currentFrame - ai.lastScoutSweepFrame > ai.difficulty.scoutFrequency) and #ai.scoutUnits > 0 then
		ai.lastScoutSweepFrame = currentFrame
		for _, scoutID in ipairs(ai.scoutUnits) do
			local target = PickBestReconTarget(ai, allyTeamID, currentFrame)
			if target then
				local ty = spGetGroundHeight(target.x, target.z)
				spGiveOrderToUnit(scoutID, CMD_FIGHT, { target.x, ty, target.z }, 0)
			end
		end
	end
end

--------------------------------------------------------------------------------
-- Dynamic Resource Cheating Manager (Medium and Hard Difficulties)
--------------------------------------------------------------------------------
local function ManageResourceCheating(ai, teamID, currentFrame)
	local diff = ai.difficulty
	if not diff or (diff.cheatScale or 0) <= 0 then return end

	-- Cheat evaluates every 30 frames (exactly once per second) staggered by team
	if currentFrame % 30 ~= (teamID % 30) then return end

	local tInfo = spGetTeamInfo(teamID)
	local isDead = false
	if type(tInfo) == "table" then
		isDead = tInfo.isDead
	else
		local _, _, d = spGetTeamInfo(teamID)
		isDead = d
	end
	if isDead then return end

	-- Grace period: First 45 seconds (1350 frames) allow natural opening
	if currentFrame < 1350 then return end

	-- Temporal scaling ramp: 0.0 at 1350 frames (45s) to 1.0 at 45000 frames (25 minutes)
	local rampTime = math.min(1.0, math.max(0.0, (currentFrame - 1350) / (25 * 60 * 30)))
	-- Smoothstep curve for natural progressive ramp
	local ramp = rampTime * rampTime * (3 - 2 * rampTime)

	-- Base resources & income
	local mcur, mstor, _, minc = spGetTeamResources(teamID, "metal")
	local ecur, estor, _, einc = spGetTeamResources(teamID, "energy")
	if not mcur then return end

	minc = math.max(0, minc or 0)
	einc = math.max(0, einc or 0)

	-- Multiplier based on ramp progress
	local incPct = diff.cheatIncomePctStart + (diff.cheatIncomePctMax - diff.cheatIncomePctStart) * ramp
	local flatM = diff.cheatFlatMetalStart + (diff.cheatFlatMetalMax - diff.cheatFlatMetalStart) * ramp
	local flatE = diff.cheatFlatEnergyStart + (diff.cheatFlatEnergyMax - diff.cheatFlatEnergyStart) * ramp

	-- Factory & tech scale multiplier (increases cheat as AI expands infrastructure)
	local techBoost = 1.0 + (ai.factoryCount * 0.10) + (ai.builderCount * 0.03)
	local bonusMetal = ((minc * incPct) + flatM) * techBoost
	local bonusEnergy = ((einc * incPct) + flatE) * techBoost

	-- Dynamic Storage Expansion: If AI is approaching storage limits, expand capacity so cheat resources aren't wasted
	if diff.storageBonusMax and diff.storageBonusMax > 0 then
		local desiredExtraStorage = math.floor(diff.storageBonusMax * ramp)
		if desiredExtraStorage > (ai.lastCheatStorageBonus or 0) then
			local addedM = desiredExtraStorage - (ai.lastCheatStorageBonus or 0)
			ai.lastCheatStorageBonus = desiredExtraStorage
			if spSetTeamResource then
				spSetTeamResource(teamID, "ms", mstor + addedM)
				spSetTeamResource(teamID, "es", estor + (addedM * 5))
			end
		end
	end

	-- Inject cheated resources
	if bonusMetal > 0 and spAddTeamResource then
		spAddTeamResource(teamID, "metal", bonusMetal)
	end
	if bonusEnergy > 0 and spAddTeamResource then
		spAddTeamResource(teamID, "energy", bonusEnergy)
	end
end

--------------------------------------------------------------------------------
-- Main Engine Callins
--------------------------------------------------------------------------------
function gadget:Initialize()
	CatalogUnits()
	InitMorphTable()
	InitMetalMap()
	ScanAndRegisterAITeams()
end

function gadget:GameStart()
	InitMetalMap()
	ScanAndRegisterAITeams()
end

function gadget:GameFrame(n)
	-- Periodic fail-safe scanner to guarantee all AI commanders and builders are registered
	if (n <= 30 and n % 5 == 1) or (n % 60 == 0) then
		ScanAndRegisterAITeams()
		for i = 1, aiTeamCount do
			local tID = aiTeamList[i]
			local ai = aiTeams[tID]
			if ai and (not ai.commanderID or #ai.builders == 0) then
				local teamUnits = spGetTeamUnits(tID)
				if teamUnits then
					for _, uid in ipairs(teamUnits) do
						local udefID = spGetUnitDefID(uid)
						if udefID then
							HandleUnitCreated(uid, udefID, tID)
						end
					end
				end
			end
		end
	end

	-- Immediate Frame 1 Trigger to guarantee BARb opening shift-queue is applied on game start
	if n == 1 then
		for i = 1, aiTeamCount do
			local tID = aiTeamList[i]
			local a = aiTeams[tID]
			if a and a.commanderID and not a.openingSequenceQueued and a.factoryCount == 0 then
				local cDefID = spGetUnitDefID(a.commanderID)
				if cDefID then
					ExecuteCommanderOpeningQueue(a, a.commanderID, UnitDefs[cDefID], tID)
				end
			end
		end
	end

	-- Maps that write start deposits in GameStart surface them after the shared
	-- metal finder ran. Re-read each spawn area once (90 frames after the first
	-- commander registers), then retry an opening that previously found no mexes.
	if not metalRescanDone and nextMetalScanFrame and n >= nextMetalScanFrame then
		local centers = {}
		for i = 1, aiTeamCount do
			local a = aiTeams[aiTeamList[i]]
			if a and a.spawnPos then centers[#centers + 1] = a.spawnPos end
		end
		if #centers > 0 then
			discoveredMetalSpots = MetalScanner.Scan(centers, GG.metalSpots or _G.metalSpots or {})
			InitMetalMap()
			metalRescanDone = true
			for i = 1, aiTeamCount do
				local a = aiTeams[aiTeamList[i]]
				if a and a.commanderID and not a.openingSequenceQueued and a.factoryCount == 0 then
					local cDefID = spGetUnitDefID(a.commanderID)
					if cDefID then
						ExecuteCommanderOpeningQueue(a, a.commanderID, UnitDefs[cDefID], a.teamID)
					end
				end
			end
		end
	end

	for i = 1, aiTeamCount do
		local teamID = aiTeamList[i]
		local ai = aiTeams[teamID]
		if ai then
			-- Dynamic Resource Cheating (Medium and Hard Difficulties)
			ManageResourceCheating(ai, teamID, n)

			if (n % ai.difficulty.orderDelay == (i * 3) % ai.difficulty.orderDelay) then
			local isDead, factionStr, allyTeamID
			local tInfo = spGetTeamInfo(teamID)
			if type(tInfo) == "table" then
				isDead = tInfo.isDead
				factionStr = tInfo.side
				allyTeamID = tInfo.allyTeam
			else
				local _, _, d, _, s, a = spGetTeamInfo(teamID)
				isDead = d
				factionStr = s
				allyTeamID = a
			end
			if not isDead then
				if not ai.faction then
					if ai.commanderID then
						local cdef = spGetUnitDefID(ai.commanderID)
						local meta = UnitMetadata[cdef]
						if meta and meta.faction and FactionUnitCatalog[meta.faction] then
							ai.faction = meta.faction
						end
					end
					if not ai.faction and factionStr and factionStr ~= "" and FactionUnitCatalog[string.lower(factionStr)] then
						ai.faction = string.lower(factionStr)
					end
					if not ai.faction then
						ai.faction = "arm"
					end
				end

				PurgeIntelIfMissing(ai, allyTeamID)
				UpdateIncomingThreatProfile(ai, teamID, n)
				GetProductionSnapshot(ai)
				BuilderPlanner.Refresh(ai, teamID, n)
				ManageUnitMorphs(ai, teamID, n)

				for _, bID in ipairs(ai.builders) do
					local bDef = spGetUnitDefID(bID)
					if bDef and IsUnitReady(bID) then
						ManageBuilder(ai, bID, bDef, teamID, allyTeamID, n)
					end
				end

				for _, fID in ipairs(ai.factories) do
					local fDef = spGetUnitDefID(fID)
					if fDef and IsUnitReady(fID) then
						ManageFactory(ai, fID, fDef, teamID)
					end
				end

				UpdateFrontline(ai)
				ManageEnergyConverters(ai, teamID, n)
				ManageRetreatAndRepair(ai, teamID, n)
				ManageRaiders(ai, teamID, allyTeamID, n)
				ManageArtillery(ai, teamID, n)
				ManageMilitaryForces(ai, teamID, allyTeamID, n)
			end
		end
	end
end
end

function gadget:UnitCreated(unitID, unitDefID, unitTeam, builderID)
	if not aiTeams[unitTeam] then
		local aiType = GetAITypeForTeam(unitTeam)
		if aiType then
			RegisterAITeam(unitTeam, aiType)
		end
	end
	HandleUnitCreated(unitID, unitDefID, unitTeam, builderID)
end

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam, attackerID, attackerDefID, attackerTeam)
	local ai = aiTeams[unitTeam]
	if ai then
		if ai.registeredUnits then ai.registeredUnits[unitID] = nil end
		if ai.builderTasks then ai.builderTasks[unitID] = nil end
		if ai.tacticalOrders then ai.tacticalOrders[unitID] = nil end
		if ai.factoryRallySet then ai.factoryRallySet[unitID] = nil end
		if unitID == ai.commanderID then
			ai.commanderID = nil
		end
		if ai.baseStructures then
			ai.baseStructures[unitID] = nil
		end
		if ai.converters then
			ai.converters[unitID] = nil
		end
		if ai.retreatingUnits then
			ai.retreatingUnits[unitID] = nil
		end
		for idx, uid in ipairs(ai.factories) do
			if uid == unitID then
				table.remove(ai.factories, idx)
				ai.factoryCount = ai.factoryCount - 1
				if ai.factoryBuilders then
					ai.factoryBuilders[unitID] = nil
				end
				break
			end
		end
		for idx, uid in ipairs(ai.builders) do
			if uid == unitID then
				table.remove(ai.builders, idx)
				ai.builderCount = ai.builderCount - 1
				if ai.builderSourceFactory and ai.builderSourceFactory[unitID] then
					local facID = ai.builderSourceFactory[unitID]
					if ai.factoryBuilders and ai.factoryBuilders[facID] then
						ai.factoryBuilders[facID][unitID] = nil
					end
					ai.builderSourceFactory[unitID] = nil
				end
				break
			end
		end
		if ai.mexBuilders and ai.mexBuilders[unitID] then
			ai.mexBuilders[unitID] = nil
		end
		for idx, uid in ipairs(ai.combatUnits) do
			if uid == unitID then table.remove(ai.combatUnits, idx); ai.combatCount = ai.combatCount - 1; break end
		end
		for idx, uid in ipairs(ai.raiderUnits) do
			if uid == unitID then table.remove(ai.raiderUnits, idx); break end
		end
		for idx, uid in ipairs(ai.artilleryUnits) do
			if uid == unitID then table.remove(ai.artilleryUnits, idx); break end
		end
		for idx, uid in ipairs(ai.assaultUnits) do
			if uid == unitID then table.remove(ai.assaultUnits, idx); break end
		end
		for idx, uid in ipairs(ai.aaUnits) do
			if uid == unitID then table.remove(ai.aaUnits, idx); break end
		end
		for idx, uid in ipairs(ai.rezUnits) do
			if uid == unitID then table.remove(ai.rezUnits, idx); break end
		end
		for idx, uid in ipairs(ai.scoutUnits) do
			if uid == unitID then table.remove(ai.scoutUnits, idx); ai.scoutCount = ai.scoutCount - 1; break end
		end
		for idx, uid in ipairs(ai.mexes) do
			if uid == unitID then table.remove(ai.mexes, idx); break end
		end
		for idx, uid in ipairs(ai.nanotowers) do
			if uid == unitID then table.remove(ai.nanotowers, idx); break end
		end
		if ai.mexPositions[unitID] then
			local pos = ai.mexPositions[unitID]
			local key = math.floor(pos.x / 32) .. "_" .. math.floor(pos.z / 32)
			ai.claimedSpots[key] = nil
			ai.mexPositions[unitID] = nil
		end

		if ai.activeMorphTarget and ai.activeMorphTarget.unitID == unitID then
			ai.activeMorphTarget = nil
			ai.reservedMetal = 0
			ai.reservedEnergy = 0
		end
	end

	for _, teamAI in pairs(aiTeams) do
		teamAI.intel.knownBuildings[unitID] = nil
	end
end

function gadget:UnitDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponDefID, projectileID, attackerID, attackerDefID, attackerTeam)
	local ai=aiTeams[unitTeam]
	if not ai or not attackerID or not attackerTeam or spAreTeamsAllied(unitTeam,attackerTeam) then return end
	local los=spGetUnitLosState(attackerID,select(6,spGetTeamInfo(unitTeam)))
	if los and los.los then
		local x,_,z=spGetUnitPosition(attackerID)
		if x then
			ai.intel.contacts=ai.intel.contacts or {}
			ai.intel.contacts[attackerID]={defID=attackerDefID,x=x,z=z,frame=Spring.GetGameFrame()}
		end
	end
end

function gadget:UnitGiven(unitID, unitDefID, newTeam, oldTeam)
	gadget:UnitDestroyed(unitID, unitDefID, oldTeam)
	gadget:UnitCreated(unitID, unitDefID, newTeam)
end

function gadget:UnitTaken(unitID, unitDefID, oldTeam, newTeam)
	gadget:UnitDestroyed(unitID, unitDefID, oldTeam)
end

function gadget:UnitEnteredLos(unitID, unitTeam, allyTeam, unitDefID)
	for _,ai in pairs(aiTeams) do
		if select(6,spGetTeamInfo(ai.teamID))==allyTeam and not spAreTeamsAllied(ai.teamID,unitTeam) then
			RecordEnemyBuildingInLOS(ai,unitID,unitDefID)
			local x,_,z=spGetUnitPosition(unitID)
			if x then
				ai.intel.contacts=ai.intel.contacts or {}
				ai.intel.contacts[unitID]={defID=unitDefID,x=x,z=z,frame=Spring.GetGameFrame()}
			end
		end
	end
end

function gadget:UnitEnteredRadar(unitID, unitTeam, allyTeam, unitDefID)
	for _, ai in pairs(aiTeams) do
		local _, _, _, _, _, myAllyTeamID = spGetTeamInfo(ai.teamID)
		if myAllyTeamID == allyTeam and not spAreTeamsAllied(ai.teamID, unitTeam) then
			local rx, _, rz = spGetUnitPosition(unitID)
			if rx then
				local blipKey = math.floor(rx / 64) .. "_" .. math.floor(rz / 64)
				ai.intel.radarBlips[blipKey] = {
					x = rx,
					z = rz,
					frame = Spring.GetGameFrame(),
				}
			end
		end
	end
end

function gadget:GameOver()
	gadgetHandler:RemoveGadget(self)
end
