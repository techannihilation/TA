--------------------------------------------------------------------------------
-- Default Engine Weapon Definitions Post-processing
--------------------------------------------------------------------------------

local function isbool(x)   return (type(x) == 'boolean') end
local function istable(x)  return (type(x) == 'table')   end
local function isnumber(x) return (type(x) == 'number')  end
local function isstring(x) return (type(x) == 'string')  end

local function tobool(val)
  local t = type(val)
  if (t == 'nil') then
    return false
  elseif (t == 'boolean') then
    return val
  elseif (t == 'number') then
    return (val ~= 0)
  elseif (t == 'string') then
    return ((val ~= '0') and (val ~= 'false'))
  end
  return false
end

local function ProcessWeaponDef(wdName,wd)
  -- weapon reloadTime and stockpileTime were seperated in 77b1
  if (tobool(wd.stockpile) and (wd.stockpiletime==nil)) then
    wd.stockpiletime = wd.reloadtime
    wd.reloadtime    = 2             -- 2 seconds
  end

  -- auto detect ota weapontypes
  if (wd.weapontype==nil) then
    local rendertype = tonumber(wd.rendertype) or 0
    if (tobool(wd.dropped)) then
      wd.weapontype = "AircraftBomb";
    elseif (tobool(wd.vlaunch)) then
      wd.weapontype = "StarburstLauncher";
    elseif (tobool(wd.beamlaser)) then
      wd.weapontype = "BeamLaser";
    elseif (tobool(wd.isshield)) then
      wd.weapontype = "Shield";
    elseif (tobool(wd.waterweapon)) then
      wd.weapontype = "TorpedoLauncher";
    elseif (wdName:lower():find("disintegrator",1,true)) then
      wd.weaponType = "DGun"
    elseif (tobool(wd.lineofsight)) then
      if (rendertype==7) then
        wd.weapontype = "LightningCannon";

      -- swta fix (outdated?)
      elseif (wd.model and wd.model:lower():find("laser",1,true)) then
        wd.weapontype = "LaserCannon";

      elseif (tobool(wd.beamweapon)) then
        wd.weapontype = "LaserCannon";
      elseif (tobool(wd.smoketrail)) then
        wd.weapontype = "MissileLauncher";
      elseif (rendertype==4 and tonumber(wd.color)==2) then
        wd.weapontype = "EmgCannon";
      elseif (rendertype==5) then
        wd.weapontype = "Flame";
      --elseif(rendertype==1) then
      --  wd.weapontype = "MissileLauncher";
      else
        wd.weapontype = "Cannon";
      end
    else
      wd.weapontype = "Cannon";
    end

    if (wd.weapontype == "LightingCannon") then
      wd.weapontype = "LightningCannon";
    end
  end

  -- 
  if (tobool(wd.ballistic) or tobool(wd.dropped)) then
    wd.gravityaffected = true
  end
end

for wdName, wd in pairs(WeaponDefs) do
  if (isstring(wdName) and istable(wd)) then
    ProcessWeaponDef(wdName, wd)
  end
end


--------------------------------------------------------------------------------
-- BA Weapon Definitions Post-processing
--------------------------------------------------------------------------------
local explosiveWeapons = {
	MissileLauncher = true,
	StarburstLauncher = true,
	TorpedoLauncher = true,
	Cannon = true,
	AircraftBomb = true,
}
local inertialessWeapons = {
	LaserCannon = true,
	BeamLaser = true,
	EmgCannon = true,
	Flame = true,
	LightningCannon = true,
}

local modOptions = Spring.GetModOptions()

-- Adjustment of terrain damage, area of effect, kinetic force of weapons and cannon trajectory height
for id in pairs(WeaponDefs) do
	WeaponDefs[id].soundhitwet = ""
	if WeaponDefs[id].range and tonumber(WeaponDefs[id].range) < 550 or explosiveWeapons[WeaponDefs[id].weapontype] then
		WeaponDefs[id].avoidfeature = false
	end
	if explosiveWeapons[WeaponDefs[id].weapontype] then
		if WeaponDefs[id].weapontype == "TorpedoLauncher" then
			WeaponDefs[id].soundhitwet = WeaponDefs[id].soundhitdry
		else
			local AoE = tonumber(WeaponDefs[id].areaofeffect) or 0
			if AoE<50 then
				WeaponDefs[id].soundhitwet = "splshbig"
			elseif AoE<88 then
				WeaponDefs[id].soundhitwet = "splssml"
			elseif AoE<145 then
				WeaponDefs[id].soundhitwet = "splsmed"
			elseif AoE>450 then
				WeaponDefs[id].soundhitwet = WeaponDefs[id].soundhitdry
			else
				WeaponDefs[id].soundhitwet = "splslrg"
			end
		end
	else
		WeaponDefs[id].soundhitwet = "sizzle"		
	end	
	if inertialessWeapons[WeaponDefs[id].weapontype] then
		WeaponDefs[id].impulseboost = 0
		WeaponDefs[id].impulsefactor = 0
	end
	if WeaponDefs[id].cratermult then 
		WeaponDefs[id].cratermult = WeaponDefs[id].cratermult * 0.4
	else
		WeaponDefs[id].cratermult = 0.4
	end
	if WeaponDefs[id].craterboost then
		WeaponDefs[id].craterboost = WeaponDefs[id].craterboost * 0.4
	else
		WeaponDefs[id].craterboost = 0
	end
	if WeaponDefs[id].weapontype == "BeamLaser" then
		WeaponDefs[id].soundhitdry = ""
		WeaponDefs[id].soundtrigger = 1
	end
end