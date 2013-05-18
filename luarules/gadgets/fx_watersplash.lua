
function gadget:GetInfo()
  return {
    name      = "Watereffects",
    desc      = "Spawns splash effect",
    version   = "1.1",
    author    = "Jools ,Nixtux",
    date      = "April,2012",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true,  --  loaded by default?
  }
end

LUAUI_DIRNAME= 'LuaUI/'
local random  = math.random
local abs = math.abs
local SpGetGroundHeight = Spring.GetGroundHeight
local GetGroundBlocked = Spring.GetGroundBlocked
local SpSpawnCEG = Spring.SpawnCEG

local nonexplosiveWeapons = {
	LaserCannon = true,
	BeamLaser = true,
	EmgCannon = true,
	Flame = true,
	LightningCannon = true,
}

local BlackList = {  --todo move to config file it will get big
     ["armrock_arm_kbot_rocket"] = true,
     ["armrock1_arm_kbot_rocket1"] = true,
     ["corstorm_core_kbot_rocket"] = true,
     ["corstorm1_core_kbot_rocket1"] = true,
     ["gladiator_armkbot_missile3"] = true,
     ["tllfireraiser_tll_kbot_rocket"] = true,
     
     ["armrock1_arm_kbot_rocket1"] = true,
     ["corstorm1_core_kbot_rocket1"] = true,
     
     ["armrottweiler_armrottweiler_cannon"] = true,
     
     ["armcrack_lightartmiss"] = true,
     ["corrock_lightartmiss"] = true,
     ["tlldmc_tlldmc"] = true,
     
     ["armbanth_bantha_rocket"] = true,
     ["armbanth1_bantha_rocket1"] = true,
     ["armmerl_armtruck_rocket"] = true,
     ["armorco_corkrog_rocket"] = true,
     ["armtigre2_corkrog_rocket"] = true,
     ["corhrk_corhrk_rocket"] = true,
     ["corkrog_corkrog_rocket"] = true,
     ["corkrog1_corkrog_rocket1"] = true,
     ["corvroc_cortruck_rocket"] = true,
     ["shiva_shiva_rocket"] = true,
     ["tllconvincer_armtruck_rocket"] = true,
     ["tllhrk_corhrk_rocket"] = true,
     ["tllvisitor_visitor_vpulse"] = true,

   }
   
if not gadgetHandler:IsSyncedCode() then
	-------------------
	-- UNSYNCED PART --
	-------------------
	
else
	-----------------
	-- SYNCED PART --Explosion_Medium_VLight
	-----------------
	
  	local splashCEG1					= "Watersplash_Extrasmall"
	local splashCEG2					= "Watersplash_Small"
	local splashCEG3					= "Watersplash_Large"
	local splashCEG4					= "Watersplash_Extralarge"

	
	function gadget:Explosion(weaponID, px, py, pz, ownerID)
		local isWater = SpGetGroundHeight(px,pz) < 0
		local aoe = WeaponDefs[weaponID]["damageAreaOfEffect"] / 2
		local wType = WeaponDefs[weaponID].type
		local wdName = WeaponDefs[weaponID].name
		if not (nonexplosiveWeapons[wType]) and not (BlackList[wdName]) and isWater and (abs(py) <= aoe) and (not GetGroundBlocked(px, pz)) then
		        if aoe >= 8 and aoe < 16 then
				SpSpawnCEG(splashCEG1, px, 0, pz)
			elseif aoe >= 16 and aoe < 48 then
				SpSpawnCEG(splashCEG2, px, 0, pz)
			elseif aoe >= 48 and aoe < 64 then
				SpSpawnCEG(splashCEG3, px, 0, pz)
			elseif aoe >= 64 and aoe < 300 then
				SpSpawnCEG(splashCEG4, px, 0, pz)
			end
		end
		return false
	end
	
	function gadget:Initialize()
	
		for id,Def in pairs(WeaponDefs) do
			local weaponID
			if Def.damageAreaOfEffect ~= nil and Def.damageAreaOfEffect > 8 and not nonexplosiveWeapons[Def.type] then
				Script.SetWatchWeapon(Def.id, true)
			end
		end
	end
end