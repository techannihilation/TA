function gadget:GetInfo()
  return {
    name      = "Debris Damage",
    desc      = "Controls damage done by flying unit debris",
    author    = "Bluestone",
    date      = "May 2014",
    license   = "Horses",
    layer     = 0,
    enabled   = true
  }
end

if (not gadgetHandler:IsSyncedCode()) then return end

local groundScouts = {
    [UnitDefNames["corfav"].id] = true,
    [UnitDefNames["armfav"].id] = true,
    [UnitDefNames["corak"].id] = true,
    [UnitDefNames["corak1"].id] = true,
    [UnitDefNames["armpw"].id] = true,
    [UnitDefNames["armpw1"].id] = true,
    [UnitDefNames["armflea"].id] = true,
    [UnitDefNames["corpunk"].id] = true,
    [UnitDefNames["tllprivate"].id] = true,
    [UnitDefNames["tllgladius"].id] = true,
}

local min = math.min
local random = math.random

function gadget:UnitPreDamaged(_, unitDefID, _, damage, _, weaponDefID, _, _, _, _)
	-- debris damage occurs when weaponDefID == -1
	-- in this case attackerID and attackerDefID are nil
	if weaponDefID == -1 then
        if groundScouts[unitDefID] then
            return random(45,65), nil
        else
            return min(damage, random(15,35)), nil
        end
    end
	return damage, nil
end