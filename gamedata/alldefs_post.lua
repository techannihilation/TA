--------------------------
-- DOCUMENTATION
-------------------------

-- TA contains weapondefs in its unitdef files
-- Standalone weapondefs are only loaded by Spring after unitdefs are loaded
-- So, if we want to do post processing and include all the unit+weapon defs, and have the ability to bake these changes into files, we must do it after both have been loaded
-- That means, ALL UNIT AND WEAPON DEF POST PROCESSING IS DONE HERE

-- What happens:
-- unitdefs_post.lua calls the _Post functions for unitDefs and any weaponDefs that are contained in the unitdef files
-- unitdefs_post.lua writes the corresponding unitDefs to customparams (if wanted)
-- weapondefs_post.lua fetches any weapondefs from the unitdefs, 
-- weapondefs_post.lua fetches the standlaone weapondefs, calls the _post functions for them, writes them to customparams (if wanted)
-- strictly speaking, alldefs.lua is a misnomer since this file does not handle armordefs, featuredefs or movedefs

-- Switch for when we want to save defs into customparams as strings (so as a widget can then write them to file)
-- The widget to do so can be found in 'etc/Lua/bake_unitdefs_post'

--Configs for TA alldefs
--VFS.Include("gamedata/alldefs_config.lua")
iswater, WTimeUnits, Nanos, cons, turninplacebots, pplants, unitheight = VFS.Include("gamedata/alldefs_config.lua")

SaveDefsToCustomParams = false
FixUnitStats = false
FixWeaponStats = false
RandomCosts = false
-------------------------
-- DEFS POST PROCESSING
-------------------------


local usable = {}

-- process unitdef
function UnitDef_Post(name, uDef)
-- Batch Processing of unitdefs leave alone
	if FixUnitStats == true then
		--Adjust los/radar emit heights
		if unitheight[name] then
			if uDef.canfly and (uDef.radardistance and uDef.radardistance>0) then
				uDef.radaremitheight = unitheight[name]*0.5
			elseif (uDef.radardistance and uDef.radardistance>0) then
				local radarheight = unitheight[name]
				if radarheight < 25 then radarheight = 25 end
				uDef.radaremitheight = (math.floor(radarheight*.90))
			end
			if uDef.canfly and (uDef.sightdistance and uDef.sightdistance>0) then
				uDef.losemitheight = unitheight[name]*.5
			elseif (uDef.sightdistance and uDef.sightdistance>0) then
				local losheight = unitheight[name]
				if losheight < 25 then losheight = 25 end
				uDef.losemitheight = (math.floor(losheight*.90))
			end
			Spring.Echo(name,uDef.losemitheight,uDef.radaremitheight,unitheight[name])
		end

		--Randomize Cost
		if uDef.buildcostmetal and RandomCosts then
			if string.match(uDef.buildcostmetal,"[0]$") and uDef.buildcostmetal>99 then
				buildcostmetal = uDef.buildcostmetal + math.floor(uDef.buildcostmetal*(math.random()*math.random(-1,1))*0.01)
				if buildcostmetal == uDef.buildcostmetal then
					buildcostmetal = uDef.buildcostmetal + math.floor(5*math.random()*math.random(-1,1))
				end
				uDef.buildcostmetal = buildcostmetal
			end
		end

		if uDef.buildcostenergy and RandomCosts then
			if string.match(uDef.buildcostenergy,"[0]$") and uDef.buildcostenergy>99 then
				buildcostenergy = uDef.buildcostenergy + math.floor(uDef.buildcostenergy*(math.random()*math.random(-1,1))*0.01)
				if buildcostenergy == uDef.buildcostenergy then
					buildcostenergy = uDef.buildcostenergy + math.floor(5*math.random()*math.random(-1,1))
					end
				uDef.buildcostenergy = buildcostenergy
			end
		end

		--Fix unit mass
		if (not uDef.customparams.iscommander) then
			uDef.mass = math.max(uDef.maxdamage / 6.0, uDef.buildcostmetal)
		end
		--Fix unit movement
		if (uDef.maxvelocity) then 
			uDef.turninplacespeedlimit = (uDef.maxvelocity*0.66) or 0
			uDef.turninplaceanglelimit = 140
		end
			--todo: build these into the unitdefs
		if (uDef.hoverattack) then
			uDef.turninplaceanglelimit = 360
		end
		if uDef.movementclass and (uDef.movementclass:find("TANK",1,true) or uDef.movementclass:find("HOVER",1,true)) then
			--Spring.Echo('tank or hover:',uDef.name,uDef.movementclass)
			if cons[name] then
				--Spring.Echo('tank or hover con:',uDef.name,uDef.moveData)
				uDef.turninplace=1
				uDef.turninplaceanglelimit=60
			elseif (uDef.maxvelocity) then
				--Spring.Echo('tank or hover:',uDef.name,uDef.movementclass,uDef.turninplacespeedlimit)
				uDef.turninplace = 0
				uDef.turninplacespeedlimit = (uDef.maxvelocity*0.66) or 0
			end
		elseif uDef.movementclass and (uDef.movementclass:find("KBOT",1,true)) then
			if turninplacebots[name] then
				--Spring.Echo('turninplacekbot:',uDef.name)
				uDef.turninplace=1
				uDef.turninplaceanglelimit=60
			elseif (uDef.maxvelocity) then 
				uDef.turninplaceanglelimit = 140
			end
		end
		--For unit wiki
		if uDef.buildpic then
			uDef.customparams.buildpic = uDef.buildpic
		end

		-- Processing piece explosions
		if (uDef.sfxtypes == nil) then
			uDef.sfxtypes = {}
		end
		uDef.sfxtypes["pieceexplosiongenerators"] = {}
		if (pplants[uDef.unitname]) then
			--Spring.Echo("energy unit ",uDef.unitname)
			uDef.sfxtypes["pieceexplosiongenerators"][1] = [[piecetrail5]]
			uDef.sfxtypes["pieceexplosiongenerators"][2] = [[piecetrail5]]
			uDef.sfxtypes["pieceexplosiongenerators"][3] = [[piecetrail4]]
			uDef.sfxtypes["pieceexplosiongenerators"][4] = [[piecetrail6]]
		else
			--Spring.Echo("others unit ",uDef.unitname)
			uDef.sfxtypes["pieceexplosiongenerators"][1] = [[piecetrail0]]
			uDef.sfxtypes["pieceexplosiongenerators"][2] = [[piecetrail1]]
			uDef.sfxtypes["pieceexplosiongenerators"][3] = [[piecetrail2]]
			uDef.sfxtypes["pieceexplosiongenerators"][4] = [[piecetrail3]]
			uDef.sfxtypes["pieceexplosiongenerators"][5] = [[piecetrail4]]
			uDef.sfxtypes["pieceexplosiongenerators"][6] = [[piecetrail5]]
			uDef.sfxtypes["pieceexplosiongenerators"][6] = [[piecetrail6]]
		end
		--Uncomment to clean piece explosions
		--uDef.sfxtypes.pieceexplosiongenerators = nil

		--Fix planes blocking
		if uDef.canfly then
			uDef.blocking = false
		end
	end
end

local Armtrails = {
   ["armrock_arm_kbot_rocket"] = true,
   ["armrock1_arm_kbot_rocket1"] = true,
   ["armsam_armtruck_missile"] = true,
   ["armsam1_armtruck_missile1"] = true,
   ["armcrack_lightartmissarm"] = true,
   }

-- process weapondef
function WeaponDef_Post(wname, wd , name)
	if FixWeaponStats == true then
		local lower = string.lower
		--Use this Area for WeaponDef changes
	
		--Bake deferred rendering custom params
		--Spring.Echo(" wname, wd ", wname, WeaponDefs)
		for i,v in pairs(wd) do
			--Spring.Echo(i,v)
		end
		if wd.weapontype and wd.weapontype == "LightningCannon" then
			wd.customparams = {}
			wd.customparams.light_mult = 1.2
			wd.customparams.light_radius_mult = 0.9
		end
		if wd.weapontype and wd.weapontype == "BeamLaser" then
			wd.customparams = {}
			wd.customparams.light_mult = 1.8
			wd.customparams.light_radius_mult = 1.2
		end
		if wd.weapontype and wd.weapontype == "DGun" then
			Spring.Echo("dgun detected ", wname)
			wd.customparams = {}
			wd.customparams.light_color = "1 0.45 0.45"
			wd.customparams.light_mult = 1.2
			wd.customparams.light_radius_mult = 1.55
			wd.customparams.expl_light_color = "1 0.45 0.45"
			wd.customparams.expl_light_mult = 1.2
			wd.customparams.expl_light_radius_mult = 1.75
			wd.customparams.expl_light_heat_radius_mult = 2.2
			wd.customparams.expl_light_heat_strength_mult = 0.66
		end
		if wd.weapontype and wd.weapontype == "MissileLauncher" then
			if wd.cegtag and lower(wd.cegtag) == "arm_trail_rocket" then
				Spring.Echo(name, wname, wd.size)
				wd.customparams = {}
				wd.customparams.light_color = "0.3 0.3 1.0"
				wd.customparams.light_mult = 3
				wd.customparams.light_radius_mult = 0.7
           		--wd.customparams.expl_light_color = "1 0.5 0.05"
           		--wd.customparams.expl_light_radius_mult = 1.05
           	end
           	if wd.cegtag and lower(wd.cegtag) == "cor_trail_rocket" then
				Spring.Echo(name, wname, wd.size)
				wd.customparams = {}
				wd.customparams.light_color = "1.0 0.3 0.3"
				wd.customparams.light_mult = 3
				wd.customparams.light_radius_mult = 0.7
           		--wd.customparams.expl_light_color = "1 0.5 0.05"
           		--wd.customparams.expl_light_radius_mult = 1.05
           	end
           	if wd.cegtag and lower(wd.cegtag) == "tll_trail_rocket" then
				Spring.Echo(name, wname, wd.size)
				wd.customparams = {}
				wd.customparams.light_color = "0.3 0.3 1.0"
				wd.customparams.light_mult = 3
				wd.customparams.light_radius_mult = 0.7
           		--wd.customparams.expl_light_color = "1 0.5 0.05"
           		--wd.customparams.expl_light_radius_mult = 1.05
           	end
		end
		if wd.weapontype and wd.weapontype == "StarburstLauncher" then
			if wd.cegtag and (lower(wd.cegtag) == "corraventrail" or lower(wd.cegtag) == "armraventrail" or lower(wd.cegtag) == "tllraventrail" ) then
				Spring.Echo(name, wname, wd.size)
				wd.customparams = {}
				wd.customparams.light_color = "1 0.6 0.15"
				wd.customparams.light_mult = 3.3
				wd.customparams.light_radius_mult = 1.9
           	end
		end
	end
end


--------------------------
-- MODOPTIONS
-------------------------

-- process modoptions (last, because they should not get baked)

function ModOptions_Post(UnitDefs, WeaponDefs)
	if (Spring.GetModOptions) then
	local modOptions = Spring.GetModOptions()

	-- transporting enemy coms
		if (modOptions.mo_transportenemy == "notcoms") then
			for name,ud in pairs(UnitDefs) do  
				if Commanders[ud.unitname] then
					ud.transportbyenemy = false
				end
			end
		elseif (modOptions.mo_transportenemy == "none") then
			for name, ud in pairs(UnitDefs) do  
				ud.transportbyenemy = false
			end
		end
		
		if (modOptions.mo_storageowner == "com") then
			for name, ud in pairs(UnitDefs) do  
				if (name == "armcom" or name == "corcom" or name =="tllcom") then
					ud.energyStorage = modOptions.startenergy or 1000
					ud.metalStorage = modOptions.startmetal or 1000
				end
			end
		end
		if (modOptions.mo_noenergyshields == "1") then
			for name, wd in pairs(WeaponDefs) do
				if wd.shieldenergyuse then
					wd.shieldenergyuse = 0
				end
			end
		end
	end
end
