function gadget:GetInfo()
  return {
    name      = "NoAirNuke",
    desc      = "Disables the custom nuke effect, if the nuke is shoot in the air.",
    author    = "jK",
    date      = "Dec, 2007",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true
  }
end

local EXPLOSION = "ANTI_LASER_EXPLOSION"
local GetGroundHeight = Spring.GetGroundHeight

local nux = {}
local inter = {}

if (not gadgetHandler:IsSyncedCode()) then
  return false
end

local wantedList = {}

--// find nukes
for i=1,#WeaponDefs do
  local wd = WeaponDefs[i]
  --note that area of effect is radius, not diameter here!
  if (wd.targetable and wd.targetable ~= 0) then
    if (wd.damageAreaOfEffect >= 600) then
      nux[wd.id] = true
   else
     inter[wd.id] = true
   end
   wantedList[#wantedList + 1] = wd.id
   Script.SetWatchWeapon(wd.id, true)
  end
end

function gadget:Explosion_GetWantedWeaponDef()
	return wantedList
end

function gadget:Explosion(weaponID, px, py, pz, ownerID)
  if (nux[weaponID] and py-GetGroundHeight(px,pz)>100) then
    return true
  elseif (inter[weaponID] and py-GetGroundHeight(px,pz)>60) then
    Spring.SpawnCEG(EXPLOSION, px,py,pz, 0,0,0, 0, 0) --spawn CEG, cause no damage
    return true
  end
  return false
end
