-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "Stun Metal Storage",
    desc      = "Makes stunned storage drop capactiy",
    author    = "Nixtux",
    date      = "June 15, 2014",
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

local storageDefs = {
  --Arm
  [ UnitDefNames['armmstor'].id ] = true,
  [ UnitDefNames['armuwadvms'].id ] = true,
  [ UnitDefNames['arm_emstor'].id ] = true,
  ---Core
  [ UnitDefNames['cormstor'].id ] = true,
  [ UnitDefNames['coruwadvms'].id ] = true,
  [ UnitDefNames['corsms'].id ] = true,
  --The Lost Legacy
  [ UnitDefNames['tllmstor'].id ] = true,
  [ UnitDefNames['tllemstor'].id ] = true,
  [ UnitDefNames['tllemstor1'].id ] = true,
  --Talon
  [ UnitDefNames['talon_mstor'].id ] = true,
  [ UnitDefNames['talon_amstor'].id ] = true,
  [ UnitDefNames['talon_emstor'].id ] = true,
  --Gok
  [ UnitDefNames['gok_mstor'].id ] = true,
  [ UnitDefNames['gok_amstor'].id ] = true,
  [ UnitDefNames['gok_emstor'].id ] = true,
  --Rumad
  [ UnitDefNames['rumad_mstor'].id ] = true,
  [ UnitDefNames['rumad_amstor'].id ] = true,
  [ UnitDefNames['rumad_emstor'].id ] = true,
 }

local storageunits = {}
local stunnedstorage = {}
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

-- Speed-ups

local uDefs = UnitDefs
local GetUnitDefID         = Spring.GetUnitDefID
local SpGetAllUnits        = Spring.GetAllUnits

local ipairs = ipairs
local pairs = pairs

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------


function gadget:GameFrame(n)
    if (((n+18) % 30) < 0.1) then
        for unitID, _ in pairs(storageunits) do
          local uDefID = GetUnitDefID(unitID) ; if not uDefID then break end
          local uDef = uDefs[uDefID]
          local storage = storageunits[unitID].storage
          local _,stunned = Spring.GetUnitIsStunned(unitID)
          local teamID = storageunits[unitID].teamID
          if teamID == nil then return end

          if stunned and (storageunits[unitID].isEMPed == false) then
            local currentLevel,totalstorage = Spring.GetTeamResources(teamID,"metal")
            local newstoragetotal = totalstorage - storage
            --Spring.Echo("current storage level " .. currentLevel .. "   total storage " .. totalstorage .. "   new storage level " ..newstoragetotal)
              Spring.SetTeamResource(teamID, "ms", newstoragetotal)
            if currentLevel > (newstoragetotal) then
            local x,y,z = Spring.GetUnitPosition(unitID)
            local height = storageunits[unitID].height
            Spring.SpawnCEG("METAL_STORAGE_LEAK",x,y+height,z,0,0,0)
            end
            storageunits[unitID].isEMPed = true
            stunnedstorage[unitID] = true
          end
        end

        for unitID,_ in pairs(stunnedstorage) do
          local _,stunned = Spring.GetUnitIsStunned(unitID)
          local storage = storageunits[unitID].storage
          if not stunned then
          	  local teamID = storageunits[unitID].teamID
        	  if teamID == nil then return end
              local _,totalstorage = Spring.GetTeamResources(teamID,"metal")
              Spring.SetTeamResource(teamID, "ms", totalstorage+storage)
              stunnedstorage[unitID] = nil
              storageunits[unitID].isEMPed = false
          end
      end
    end
end
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

local function SetupUnit(unitID, unitDefID, unitTeam)
    local ud = UnitDefs[unitDefID]
    if (ud == nil)or(ud.height == nil) then return nil end
    storageunits[unitID] = {
    isEMPed = false,
    height = (ud.height * 0.70),
    storage = ud.metalStorage,
    teamID = unitTeam
}
end

--testing only
--[[
function gadget:Initialize() --testing only
    for _, unitID in ipairs(SpGetAllUnits()) do
    local unitDefID = GetUnitDefID(unitID)
        if (storageDefs[unitDefID]) then
            local unitTeam = Spring.GetUnitTeam(unitID)
            SetupUnit(unitID, unitDefID, unitTeam)
        end
    end
end
--]]

function gadget:UnitFinished(unitID, unitDefID, unitTeam)
    if (storageDefs[unitDefID]) then
        SetupUnit(unitID, unitDefID, unitTeam)
    end
end

function gadget:UnitGiven(unitID, unitDefID, newTeam, oldTeam)
  if (storageunits[unitID]) and storageunits[unitID].isEMPed == true then
  	storageunits[unitID].teamID = newTeam
    local storage = storageunits[unitID].storage
    local _,totalstorage = Spring.GetTeamResources(oldTeam,"metal")
    Spring.SetTeamResource(oldTeam, "ms", totalstorage + storage)
        _, totalstorage = Spring.GetTeamResources(newTeam,"metal")
    local newstoragetotal = totalstorage - storage
      Spring.SetTeamResource(newTeam, "ms", newstoragetotal)
  end
end

function gadget:UnitPreDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponID, projectileID, attackerID, attackerDefID, attackerTeam) --we use UnitPreDamaged so as we get in before unit_transportfix has its effect
    if (storageDefs[unitDefID]) then
        local hp = Spring.GetUnitHealth(unitID)
        if damage > hp and not paralyzer then  --unit's can have 0 health
            if storageunits[unitID] and storageunits[unitID].isEMPed == true then
                local _,totalstorage = Spring.GetTeamResources(unitTeam,"metal")
                Spring.SetTeamResource(unitTeam, "ms", totalstorage + storageunits[unitID].storage) --Add back before unit is destoryed
            end
            storageunits[unitID] = nil
            stunnedstorage[unitID] = nil
        end
    end
end

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
