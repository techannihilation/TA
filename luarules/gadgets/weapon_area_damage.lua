function gadget:GetInfo()
	return {
		name = "Area Denial",
		desc = "Lets a weapon's damage persist in an area",
		author = "KDR_11k (David Becker), Google Frog",
		date = "2007-08-26",
		license = "Public domain",
		layer = 21,
		enabled = true
	}
end

if (gadgetHandler:IsSyncedCode()) then

--SYNCED

local frameNum
local explosionList = {}
local DAMAGE_PERIOD ,weaponInfo = include("LuaRules/Configs/area_damage_defs.lua")
local SpAddUnitDamage = Spring.AddUnitDamage
local SpGetUnitsInSphere = Spring.GetUnitsInSphere
local SpGetUnitPosition = Spring.GetUnitPosition
local SpGetUnitTeam = Spring.GetUnitTeam
local SpGetUnitAllyTeam = Spring.GetUnitAllyTeam
local SpValidUnitID = Spring.ValidUnitID
local SpEcho = Spring.Echo
local sqrt = math.sqrt
local pairs = pairs
local ipairs = ipairs

local scouts = {

	--Scouts
  [UnitDefNames["armflea"].id] = true,
  [UnitDefNames["armfav"].id] = true,
  [UnitDefNames["corpunk"].id] = true,
  [UnitDefNames["corfav"].id] = true,
  [UnitDefNames["tllbug"].id] = true,
  [UnitDefNames["tllgladius"].id] = true,
	[UnitDefNames["gok_cut"].id] = true,
	[UnitDefNames["gok_negator"].id] = true,
	[UnitDefNames["rumad_meyes"].id] = true,
	[UnitDefNames["talon_topaz"].id] = true,

	--Infantry Talon
  [UnitDefNames["talon_infantry"].id] = true,
	[UnitDefNames["talon_rebel"].id] = true,
	[UnitDefNames["talon_sniper"].id] = true,
	[UnitDefNames["talon_mercenary"].id] = true,

	-- Rez Bot
	--[UnitDefNames["armrectr"].id] = true,
	--[UnitDefNames["cornecro"].id] = true,
	--[UnitDefNames["tllsham"].id] = true,
	--[UnitDefNames["talon_fox"].id] = true,

	-- Scout Planes
	[UnitDefNames["talon_recon"].id] = true,
	[UnitDefNames["armpeep"].id] = true,
	[UnitDefNames["corfink"].id] = true,
	[UnitDefNames["tllprob"].id] = true,
	[UnitDefNames["gok_vision"].id] = true,
	[UnitDefNames["rumad_ascout_lvl1"].id] = true,

	--Mines Layer
	[UnitDefNames["armmin"].id] = true,
	[UnitDefNames["cormin"].id] = true,
	[UnitDefNames["tlltsetse"].id] = true,
	[UnitDefNames["talon_carbon"].id] = true,
	[UnitDefNames["gok_min"].id] = true,
	[UnitDefNames["rumad_min"].id] = true,

	[UnitDefNames["armmlv"].id] = true,
	[UnitDefNames["cormlv"].id] = true,
	[UnitDefNames["tllmlv"].id] = true,
	[UnitDefNames["talon_mlv"].id] = true,
	[UnitDefNames["gok_mlv"].id] = true,

	--T1 Radar
	[UnitDefNames["armrad"].id] = true,
	[UnitDefNames["corrad"].id] = true,
	[UnitDefNames["tllradar"].id] = true,
	[UnitDefNames["talon_rad"].id] = true,
	[UnitDefNames["gok_rad"].id] = true,

	--T2 Radar
	[UnitDefNames["armarad"].id] = true,
	[UnitDefNames["corarad"].id] = true,
	[UnitDefNames["tllarad"].id] = true,
	[UnitDefNames["talon_arad"].id] = true,
	[UnitDefNames["gok_arad"].id] = true,

	--T3 Jammer
	[UnitDefNames["armomni"].id] = true,
	[UnitDefNames["coromni"].id] = true,
	[UnitDefNames["tllomni"].id] = true,
	[UnitDefNames["talon_conspiracy2"].id] = true,
	[UnitDefNames["gok_ejam"].id] = true,

	--T2 Jammer
	[UnitDefNames["armveil"].id] = true,
	[UnitDefNames["corshroud"].id] = true,
	[UnitDefNames["tllajam"].id] = true,
	[UnitDefNames["talon_conspiracy1"].id] = true,
	[UnitDefNames["gok_jam"].id] = true,

	--T1 Jammer
	[UnitDefNames["armjamt"].id] = true,
	[UnitDefNames["corjamt"].id] = true,
	[UnitDefNames["tlljam"].id] = true,
	[UnitDefNames["talon_conspiracy"].id] = true,
	[UnitDefNames["gok_jam1"].id] = true,

	-- Eyes Perimeter & watch Tower
	[UnitDefNames["armeyes"].id] = true,
	[UnitDefNames["coreyes"].id] = true,
	[UnitDefNames["gok_eyes"].id] = true,
	[UnitDefNames["rumad_eyes"].id] = true,
	[UnitDefNames["tlltower"].id] = true,
	[UnitDefNames["talon_eye"].id] = true,

}

function gadget:Explosion(weaponID, px, py, pz, ownerID)
	if ownerID==nil then return end
	if (weaponInfo[weaponID]) then
		local w = {
			radius = weaponInfo[weaponID].radius,
			damage = weaponInfo[weaponID].damage,
			expiry = frameNum + weaponInfo[weaponID].duration,
			rangeFall = weaponInfo[weaponID].rangeFall,
			timeLoss = weaponInfo[weaponID].timeLoss,
			id = weaponID,
			pos = {x = px, y = py, z = pz},
			owner=ownerID,
			teamID=SpGetUnitTeam(ownerID),
			allyID=SpGetUnitAllyTeam(ownerID),
			allyScale=weaponInfo[weaponID].allyScale or 1.0,
			teamScale=weaponInfo[weaponID].teamScale or 1.0,
			scoutDmg=weaponInfo[weaponID].scoutDmg or 1.0
		}
		explosionList[#explosionList+1] = w
	end
	return false
end

local totalDamage = 0

function gadget:GameFrame(f)
	frameNum=f
	if (f%DAMAGE_PERIOD == 0) then
		for i,w in pairs(explosionList) do
			local ulist = SpGetUnitsInSphere(w.pos.x, w.pos.y, w.pos.z, w.radius)
			if (ulist) then
				for _,u in ipairs(ulist) do
					local ux, uy, uz = SpGetUnitPosition(u)
					local damage = w.damage
					local allyScale = w.allyScale
					local teamScale = w.teamScale
					local scoutDmg = w.scoutDmg

					if w.rangeFall ~= 0 then
						damage = damage - damage*w.rangeFall*sqrt((ux-w.pos.x)^2 + (uy-w.pos.y)^2 + (uz-w.pos.z)^2)/w.radius
					end
					-- Scale team and allyteam damage
					if (SpGetUnitTeam(u) == SpGetUnitTeam(w.owner)) then
				   		damage = damage * teamScale
					elseif (SpGetUnitAllyTeam(u) == w.allyID) then
				   		damage = damage * allyScale
					end
					-- Avoid damage to self altogether
					if (u ~= nil and w.owner ~= nil and u ~= w.owner) then
						if scouts[Spring.GetUnitDefID(u)] then
							SpAddUnitDamage(u, scoutDmg, 0, w.owner, w.id, 0, 0, 0)
						else
							if damage > 0 then
							SpAddUnitDamage(u, damage, 0, w.owner, w.id, 0, 0, 0)
							end
						end
					end
				end
			end
			w.damage = w.damage - w.timeLoss
			if f >= w.expiry then
				explosionList[i] = nil
			end
		end
	end
end

function gadget:Initialize()
	for w,_ in pairs(weaponInfo) do
		Script.SetWatchWeapon(w, true)
	end
end

end
