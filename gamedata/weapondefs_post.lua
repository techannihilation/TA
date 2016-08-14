-- $Id: weapondefs_post.lua 3171 2008-11-06 09:06:29Z det $
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    weapondefs_post.lua
--  brief:   weaponDef post processing
--  author:  Dave Rodgers
--
--  Copyright (C) 2008.
--  Licensed under the terms of the GNU GPL, v2 or later.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  Per-unitDef weaponDefs
--

local function isbool(x)   return (type(x) == 'boolean') end
local function istable(x)  return (type(x) == 'table')   end
local function isnumber(x) return (type(x) == 'number')  end
local function isstring(x) return (type(x) == 'string')  end


--------------------------------------------------------------------------------

local function ProcessUnitDef(udName, ud)

  local wds = ud.weapondefs
  if (not istable(wds)) then
    return
  end

  -- add this unitDef's weaponDefs
  for wdName, wd in pairs(wds) do
    if (isstring(wdName) and istable(wd)) then
      local fullName = udName .. '_' .. wdName
      WeaponDefs[fullName] = wd
      wd.filename = ud.filename
    end
  end

  -- convert the weapon names
  local weapons = ud.weapons
  if (istable(weapons)) then
    for i = 1, 16 do
      local w = weapons[i]
      if (istable(w)) then
        if (isstring(w.def)) then
          local ldef = string.lower(w.def)
          local fullName = udName .. '_' .. ldef
          local wd = WeaponDefs[fullName]
          if (istable(wd)) then
            w.name = fullName
          end
        end
        w.def = nil
      end
    end
  end

  -- convert the death explosions
  if (isstring(ud.explodeas)) then
    local fullName = ud.explodeas
    if (WeaponDefs[fullName]) then
      --Spring.Echo(fullName)
      ud.explodeas = fullName
    end
  end
  if (isstring(ud.selfdestructas)) then
    local fullName = ud.selfdestructas
    if (WeaponDefs[fullName]) then
      --Spring.Echo(fullName)
      ud.selfdestructas = fullName
    end
  end

end


--------------------------------------------------------------------------------

-- Process the unitDefs

local UnitDefs = DEFS.unitDefs

for udName, ud in pairs(UnitDefs) do
  if (isstring(udName) and istable(ud)) then
    ProcessUnitDef(udName, ud)
  end
end

--------------------------------------------------------------------------------
-- TechA Weapon Definitions Post-processing
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

-- Adjustment of terrain damage, kinetic force of weapons, avoidfeature==false for short range and explosive weapons, and add water hit sounds
for id in pairs(WeaponDefs) do
	WeaponDefs[id].soundhitwet = ""
	if WeaponDefs[id].range and tonumber(WeaponDefs[id].range) < 50 or explosiveWeapons[WeaponDefs[id].weapontype] then
		WeaponDefs[id].avoidfeature = false
	end
	if explosiveWeapons[WeaponDefs[id].weapontype] then
		if WeaponDefs[id].weapontype == "TorpedoLauncher" then
			WeaponDefs[id].soundhitwet = WeaponDefs[id].soundhitdry
		else
			local AoE = tonumber(WeaponDefs[id].areaofeffect) or 0
			if AoE<50 then
				WeaponDefs[id].soundhitwet = "splshbig"
				WeaponDefs[id].soundhitwetvolume = 0.6
			elseif AoE<88 then
				WeaponDefs[id].soundhitwet = "splssml"
				WeaponDefs[id].soundhitwetvolume = 0.6
			elseif AoE<145 then
				WeaponDefs[id].soundhitwet = "splsmed"
				WeaponDefs[id].soundhitwetvolume = 0.6
			elseif AoE>450 then
				WeaponDefs[id].soundhitwet = WeaponDefs[id].soundhitd
			else
				WeaponDefs[id].soundhitwet = "splslrg"
				WeaponDefs[id].soundhitwetvolume = 0.6
			end
		end
	else
		WeaponDefs[id].soundhitwet = "sizzle"
		WeaponDefs[id].soundhitwetvolume = 0.5
	end
	if inertialessWeapons[WeaponDefs[id].weapontype] then
		WeaponDefs[id].impulseboost = 0
		WeaponDefs[id].impulsefactor = 0
	end
	if WeaponDefs[id].cratermult and tonumber(WeaponDefs[id].cratermult) > 0 then
		--Spring.Echo("crater mult " .. id,WeaponDefs[id].cratermult)
		WeaponDefs[id].cratermult = WeaponDefs[id].cratermult * 0.12
	else
		WeaponDefs[id].cratermult = 0.0
	end
	if WeaponDefs[id].craterboost and tonumber(WeaponDefs[id].craterboost) > 0 then
		--Spring.Echo("crater boost " .. id,WeaponDefs[id].craterboost)
		WeaponDefs[id].craterboost = WeaponDefs[id].craterboost * 0.12
	else
		WeaponDefs[id].craterboost = 0
	end
	
	if not WeaponDefs[id].craterareaofeffect then
		WeaponDefs[id].craterareaofeffect = tonumber((WeaponDefs[id].areaofeffect) or 0)*1.5
	end
	
	-- don't affect ground for tiny explosions (-> don't cause PFS updates pointlessly)
	if WeaponDefs[id].craterareaofeffect and tonumber(WeaponDefs[id].craterareaofeffect) <= 256 then
		WeaponDefs[id].craterareaofeffect = 0
		WeaponDefs[id].cratermult = 0
	end
    
	if WeaponDefs[id].weapontype == "BeamLaser" then
		WeaponDefs[id].soundhitdry = ""
		WeaponDefs[id].soundtrigger = 1
		WeaponDefs[id].sweepfire = false
	end
	if WeaponDefs[id].weapontype == "Cannon" and WeaponDefs[id].cegtag == "Trail_cannon" and WeaponDefs[id].size then
	  if WeaponDefs[id].size > 1.81 and WeaponDefs[id].size < 3.2 then
	    WeaponDefs[id].cegtag = "Trail_cannon_med"
	  elseif WeaponDefs[id].size > 3.20 then
	    WeaponDefs[id].cegtag = "Trail_cannon_large"
	  end
	end
end