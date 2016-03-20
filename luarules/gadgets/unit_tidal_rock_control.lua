-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "COB Tidal Speed Control",
    desc      = "Sends Tidal speed to scripts",
    author    = "Nixtux",
    date      = "Aug 13, 2013",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = false    --  loaded by default?
  }
end

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

if (not gadgetHandler:IsSyncedCode()) then
	return false
end

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

local rockideDefs = {
    [UnitDefNames['tlluwjam'].id ] = true,
    [UnitDefNames['tllsolarns'].id ] = true,
    [UnitDefNames['tllsy'].id ] = true,
    [UnitDefNames['tllasy'].id ] = true,
    [UnitDefNames['tllplat'].id ] = true,
    [UnitDefNames['tllhpns'].id ] = true,
    [UnitDefNames['tllwmconv'].id ] = true,
    [UnitDefNames['tlluwjam'].id ] = true,
    [UnitDefNames['tlltorp'].id ] = true,
    [UnitDefNames['tlltide'].id ] = true,
    [UnitDefNames['tllsonar'].id ] = true,
    [UnitDefNames['tllnssam'].id ] = true,
    [UnitDefNames['tllasonar'].id ] = true,
    [UnitDefNames['tlllmtns'].id ] = true,
    [UnitDefNames['tllhltns'].id ] = true,
    [UnitDefNames['tlldcsta'].id ] = true,
    [UnitDefNames['tllatorp'].id ] = true,
    [UnitDefNames['tllfgate'].id ] = true,
    [UnitDefNames['tllfflak'].id ] = true,
    [UnitDefNames['tllwmmohoconv'].id ] = true,
    [UnitDefNames['tlltrid'].id ] = true,
    [UnitDefNames['tllkrak'].id ] = true,
}

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

-- Speed-ups
local SetUnitCOBValue      = Spring.SetUnitCOBValue
local GetTide              = Game.tidal/10

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

function gadget:UnitCreated(unitID, unitDefID, unitTeam)
	if rockideDefs[unitDefID] then
		--Spring.Echo("TIDAL SPEED :" .. GetTide)
		SetUnitCOBValue(unitID,1030,GetTide)
	end
end

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------