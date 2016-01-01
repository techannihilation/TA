-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "Water platform rundry vontrol",
    desc      = "Explodes Water platform's that exceed there min waterline",
    author    = "Nixtux",
    date      = "April 29, 20012",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

if (not gadgetHandler:IsSyncedCode()) then
	return false
end

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

local tideDefs = {
  [ UnitDefNames['csubpen'].id ] = true,
  [ UnitDefNames['asubpen'].id ] = true,
  [ UnitDefNames['corfhlt'].id ] = true,
  [ UnitDefNames['armtl'].id ] = true,
  [ UnitDefNames['coruwlightfus'].id ] = true,
  [ UnitDefNames['tlluwmstorage'].id ] = true,
  [ UnitDefNames['armuwfus1'].id ] = true,
  [ UnitDefNames['cahpns'].id ] = true,
  [ UnitDefNames['aahpns'].id ] = true,
  [ UnitDefNames['tllsonar'].id ] = true,
  [ UnitDefNames['armason'].id ] = true,
  [ UnitDefNames['corfrt'].id ] = true,
  [ UnitDefNames['armatidal'].id ] = true,
  [ UnitDefNames['armfhlt'].id ] = true,
  [ UnitDefNames['armhevsenan'].id ] = true,
  [ UnitDefNames['tllwmconv'].id ] = true,
  [ UnitDefNames['corenaa'].id ] = true,
  [ UnitDefNames['corasy'].id ] = true,
  [ UnitDefNames['tlluwmex'].id ] = true,
  [ UnitDefNames['tlluwjam'].id ] = true,
  [ UnitDefNames['tlluwfusion'].id ] = true,
  [ UnitDefNames['tlluwestorage'].id ] = true,
  [ UnitDefNames['tlltide'].id ] = true,
  [ UnitDefNames['armatl'].id ] = true,
  [ UnitDefNames['coratidal'].id ] = true,
  [ UnitDefNames['tllsy'].id ] = true,
  [ UnitDefNames['tllsubpen'].id ] = true,
  [ UnitDefNames['coruwms'].id ] = true,
  [ UnitDefNames['armfrad'].id ] = true,
  [ UnitDefNames['tllasonar'].id ] = true,
  [ UnitDefNames['armtide'].id ] = true,
  [ UnitDefNames['armfmine3'].id ] = true,
  [ UnitDefNames['coratl'].id ] = true,
  [ UnitDefNames['armuwlightfus'].id ] = true,
  [ UnitDefNames['corason'].id ] = true,
  [ UnitDefNames['tllnssam'].id ] = true,
  [ UnitDefNames['coruwmmm'].id ] = true,
  [ UnitDefNames['coruwfus'].id ] = true,
  [ UnitDefNames['tlllmtns'].id ] = true,
  [ UnitDefNames['armesy'].id ] = true,
  [ UnitDefNames['tllhltns'].id ] = true,
  [ UnitDefNames['armuwmme'].id ] = true,
  [ UnitDefNames['corfdrag'].id ] = true,
  [ UnitDefNames['corfmkr'].id ] = true,
  [ UnitDefNames['armfrt'].id ] = true,
  [ UnitDefNames['armasy'].id ] = true,
  [ UnitDefNames['armflosh'].id ] = true,
  [ UnitDefNames['corfrad'].id ] = true,
  [ UnitDefNames['crnns'].id ] = true,
  [ UnitDefNames['armuwmex'].id ] = true,
  [ UnitDefNames['corfmine3'].id ] = true,
  [ UnitDefNames['corplat'].id ] = true,
  [ UnitDefNames['tllasy'].id ] = true,
  [ UnitDefNames['tllatorp'].id ] = true,
  [ UnitDefNames['tllauwmex'].id ] = true,
  [ UnitDefNames['tllatidal'].id ] = true,
  [ UnitDefNames['tllaspns'].id ] = true,
  [ UnitDefNames['armfmkr'].id ] = true,
  [ UnitDefNames['coruwmme'].id ] = true,
  [ UnitDefNames['armsy'].id ] = true,
  [ UnitDefNames['tlldtns'].id ] = true,
  [ UnitDefNames['tlltorp'].id ] = true,
  [ UnitDefNames['armfdrag'].id ] = true,
  [ UnitDefNames['tllplat'].id ] = true,
  [ UnitDefNames['cortl'].id ] = true,
  [ UnitDefNames['armuwmmm'].id ] = true,
  [ UnitDefNames['coruwes'].id ] = true,
  [ UnitDefNames['armfflak'].id ] = true,
  [ UnitDefNames['armfatf'].id ] = true,
  [ UnitDefNames['coruwmex'].id ] = true,
  [ UnitDefNames['corsy'].id ] = true,
  [ UnitDefNames['cortide'].id ] = true,
  [ UnitDefNames['coresy'].id ] = true,
  [ UnitDefNames['tllsolarns'].id ] = true,
  [ UnitDefNames['armsonar'].id ] = true,
  [ UnitDefNames['armhevsenan'].id ] = true,
  [ UnitDefNames['corfhp'].id ] = true,
  [ UnitDefNames['corhevsenan'].id ] = true,
  [ UnitDefNames['tllhpns'].id ] = true,
  [ UnitDefNames['corsonar'].id ] = true,
  [ UnitDefNames['armuwms'].id ] = true,
  [ UnitDefNames['armuwfus'].id ] = true,
  [ UnitDefNames['armplat'].id ] = true,
  [ UnitDefNames['tlldcsta'].id ] = true,
  [ UnitDefNames['corfatf'].id ] = true,
  [ UnitDefNames['armuwes'].id ] = true,
  [ UnitDefNames['armfhp'].id ] = true,
  [ UnitDefNames['corflshd'].id ] = true,

}

local tidals = {}

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

-- Speed-ups

local uDefs = UnitDefs
local GetUnitDefID         = Spring.GetUnitDefID
local GetUnitBasePosition  = Spring.GetUnitBasePosition
local GetUnitPosition      = Spring.GetUnitPosition
local GetGroundHeight      = Spring.GetGroundHeight
local SpSpawnCEG           = Spring.SpawnCEG
local SpDestroyUnit        = Spring.DestroyUnit
local SpGetAllUnits        = Spring.GetAllUnits

local ipairs = ipairs
local pairs = pairs

local Buffer = 2
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------


function gadget:GameFrame(n)
  if (((n+18) % 32) < 0.1) then
    for unitID, _ in pairs(tidals) do
	  local minwater = tidals[unitID].minwaterdepth
	  local mass = tidals[unitID].mass
	  local x, y, z = GetUnitBasePosition(unitID)
	  local groundy = GetGroundHeight(x, z)
	--  Spring.Echo("minlwaterline:- " .. minwater)
	--  Spring.Echo("Height:- " ..  groundy)
	--  Spring.Echo("Sum:- " .. minwater + groundy)
	  if (minwater + groundy ) > ( 0 + Buffer) then 
	    local rx, ry, rz = GetUnitPosition(unitID)
	    if mass < 601 then
	      SpSpawnCEG("Death_Explosion_Tidal_Small", rx, 0, rz)
	    elseif mass >= 601 and mass <= 4000 then
	      SpSpawnCEG("Death_Explosion_Tidal", rx, 0, rz)
	    else
	      SpSpawnCEG("Death_Explosion_Tidal_Large", rx, 0, rz)
	    end
	    SpDestroyUnit(unitID, true, false)
	  end
    end
  end
end

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

local function SetupUnit(unitID)
  local uDefID = GetUnitDefID(unitID) ; if not uDefID then return end
  local uDef = uDefs[uDefID]
  tidals[unitID] = {minwaterdepth = uDef.minWaterDepth,mass = uDef.mass}
end


function gadget:Initialize()
  for i=1,#UnitDefs do
  local unitDefID = UnitDefs[i]
    if (unitDefID.minWaterDepth and unitDefID.minWaterDepth> 0) and unitDefID.waterline then
      tideDefs[i] = true
    end
  end
  for _, unitID in ipairs(SpGetAllUnits()) do
    local unitDefID = GetUnitDefID(unitID)
    if (tideDefs[unitDefID]) then
      SetupUnit(unitID)
    end
  end
end


function gadget:UnitCreated(unitID, unitDefID, unitTeam)
    if (tideDefs[unitDefID]) then
    SetupUnit(unitID)
  end
end


function gadget:UnitTaken(unitID, unitDefID, unitTeam)
	if (tideDefs[unitDefID]) then 
		SetupUnit(unitID)
	end
end


function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
	if (tideDefs[unitDefID]) then 
		tidals[unitID] = nil
	end
end


-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------