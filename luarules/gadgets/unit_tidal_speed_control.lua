-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "COB Tidal Speed Control",
    desc      = "Sends Tidal speed to COB scripts",
    author    = "Nixtux",
    date      = "Aug 9, 2018",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true    --  loaded by default?
  }
end

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

if (not gadgetHandler:IsSyncedCode()) then
	return false
end

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

local tidalDefs = {
    [UnitDefNames['armatidal'].id ] = true,
    [UnitDefNames['armtide'].id ] = true,
    [UnitDefNames['coratidal'].id ] = true,
    [UnitDefNames['cortide'].id ] = true,
    [UnitDefNames['tllatidal'].id ] = true,
    [UnitDefNames['tlltide'].id ] = true,
    [UnitDefNames['talon_tide1'].id ] = true,
    [UnitDefNames['gok_tide'].id ] = true,
    [UnitDefNames['gok_tide1'].id ] = true,
}

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

-- Speed-ups
local SetUnitCOBValue      = Spring.SetUnitCOBValue
local GetTide              = Game.tidal*1.5

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

function gadget:UnitCreated(unitID, unitDefID, unitTeam)
	if tidalDefs[unitDefID] then
    	local uDef = UnitDefs[unitDefID]
    	local mult = 1.25
    	if uDef.customParams and uDef.customParams.energymultiplier then
       		mult = uDef.customParams.energymultiplier*.5 or 1.25
    	end
		--Spring.Echo("TIDAL SPEED :" .. GetTide*mult)
		Spring.CallCOBScript(unitID, "TidalSpeed", 0, GetTide*mult)
	end
end

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
