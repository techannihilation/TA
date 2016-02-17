function gadget:GetInfo()
   return {
      name      = "Airbase Repair Command",
      desc      = "Add command to return to airbase for repairs",
      author    = "ashdnazg",
      date      = "12 February 2016",
      license   = "GNU GPL, v2 or later",
      layer     = 1,
      enabled   = true  --  loaded by default?
   }
end

---------------------------------------------------------------------------------
local FORCE_LAND_CMD_ID = 35430
local LAND_CMD_ID = 35431

if (gadgetHandler:IsSyncedCode()) then

--------------------------------------------------------------------------------
-- Synced
--------------------------------------------------------------------------------

local airbaseDefIDs = {}

local planes = {}
local airbases = {} -- airbaseID = { int pieceNum = unitID reservedFor }
local pendingLanders = {}
local landingPlanes = {}
local landedPlanes = {}

local forceLandCmd = {
   id      = FORCE_LAND_CMD_ID,
   name    = "ForceLand",
   action  = "forceland",
   type    = CMDTYPE.ICON,
   tooltip = "Return to base: Force the plane to return to base immediately",
}

local landCmd = {
   id      = LAND_CMD_ID,
   name    = "Land",
   action  = "land",
   cursor  = 'Repair',
   type    = CMDTYPE.ICON_UNIT,
   tooltip = "Land at a specific airbase",
   hidden  = true,
}


-- add logic for deciding which pad to use here
function AddAirBase(unitID)
   local airBasePads = {}
   local pieceMap = Spring.GetUnitPieceMap(unitID)
   for pieceName, pieceNum in pairs(pieceMap) do
      if pieceName:find("airstrip") then
         airBasePads[pieceNum] = false
      end
   end
   airbases[unitID] = airBasePads
end


-- returns either false or the piece number of the free pad
function CanLandAt(unitID, airbaseID)
   local airbasePads = airbases[airbaseID]
   if not airbasePads then
      return false
   end

   local unitTeamID = Spring.GetUnitTeam(unitID)
   local airbaseTeamID = Spring.GetUnitTeam(airbaseID)
   if not Spring.AreTeamsAllied(unitTeamID, airbaseTeamID) then
      return false
   end

   local padPieceNum = false

   for pieceNum, reservedBy in pairs(airbasePads) do
      -- if somehow no pad expects you, find a vacant one
      if not reservedBy then
         padPieceNum = pieceNum
      end
      if reservedBy == unitID then
         padPieceNum = pieceNum
         break
      end
   end
   return padPieceNum
end


function FindAirBase(unitID)
   local minDist = math.huge
   local closestAirbaseID
   local closestPieceNum
   for airbaseID, _ in pairs(airbases) do
      local pieceNum = CanLandAt(unitID, airbaseID)
      if pieceNum then
         local dist = Spring.GetUnitSeparation(unitID, airbaseID)
         if dist < minDist then
            minDist = dist
            closestAirbaseID = airbaseID
            closestPieceNum = pieceNum
         end
      end
   end

   return closestAirbaseID, closestPieceNum
end

function RemoveLander(unitID)
   if landingPlanes[unitID] then
      local airbaseID, pieceNum = landingPlanes[unitID][1], landingPlanes[unitID][2]
      local airbasePads = airbases[airBaseID]
      if airbasePads then
         airbasePads[pieceNum] = false
      end
      landingPlanes[unitID] = nil
      return
   end
end

function NeedsRepair(unitID)
   local health, maxHealth = Spring.GetUnitHealth(unitID)
   local landAtState = Spring.GetUnitStates(unitID).autorepairlevel
   Spring.Echo(health < maxHealth * landAtState,health , maxHealth ,landAtState)
   return health < maxHealth * landAtState
end


function gadget:UnitCreated(unitID, unitDefID, unitTeam, builderID)
   if UnitDefs[unitDefID].canFly then
      Spring.InsertUnitCmdDesc(unitID, landCmd)
      Spring.InsertUnitCmdDesc(unitID, forceLandCmd)
   end

   local _, _, _, _, buildProgress = Spring.GetUnitHealth(unitID)
   if buildProgress == 1.0 then
      gadget:UnitFinished(unitID, unitDefID, unitTeam)
   end
end

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
   RemoveLander(unitID)
   planes[unitID] = nil
   airbases[unitID] = nil
   landingPlanes[unitID] = nil
   landedPlanes[unitID] = nil
   pendingLanders[unitID] = nil
end

function gadget:UnitFinished(unitID, unitDefID, unitTeam)
   if airbaseDefIDs[unitDefID] then
      AddAirBase(unitID)
   end
   if UnitDefs[unitDefID].canFly then
      planes[unitID] = true
   end
end

function gadget:AllowCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions)
   if cmdID == LAND_CMD_ID then
      local airbaseID = cmdParams[1]
      return CanLandAt(unitID, airbaseID)
   end
   return true
end

function gadget:CommandFallback(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions)
   if cmdID == LAND_CMD_ID then
      -- clear old pad
      RemoveLander(unitID)
      -- stop if we've landed
      if landedPlanes[unitID] then
         return true, true
      end

      local airbaseID = cmdParams[1]

      local padPieceNum = CanLandAt(unitID, airbaseID)

      -- failed to land
      if not padPieceNum then
         return true, true
      end

      -- update new pad
      airbases[airbaseID][padPieceNum] = unitID
      landingPlanes[unitID] = {airbaseID, padPieceNum}
      return true, false
   end
   if cmdID == FORCE_LAND_CMD_ID then
      pendingLanders[unitID] = true
      return true, true
   end

   return false
end

function gadget:UnitCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions)
   if not planes[unitID] then
      return
   end
   landedPlanes[unitID] = nil
   RemoveLander(unitID)
   local airBaseID = Spring.GetUnitTransporter(unitID)
   if not airBaseID then
      return
   end
   local airbasePads = airbases[airBaseID]
   if not airbasePads then
      return
   end
   Spring.UnitDetach(unitID)

   for pieceNum, reservedBy in pairs(airbasePads) do
      if reservedBy == unitID then
         airbasePads[pieceNum] = false
      end
   end
end

function gadget:GameFrame()
   for unitID, _ in pairs(planes) do
      if not landingPlanes[unitID] and not landedPlanes[unitID] and NeedsRepair(unitID) then
         pendingLanders[unitID] = true
      end
   end

   for unitID, t in pairs(landingPlanes) do
      local airbaseID, padPieceNum = t[1], t[2]
      local px, py, pz = Spring.GetUnitPiecePosDir(airbaseID, padPieceNum)
      local ux, uy, uz = Spring.GetUnitPosition(unitID)
      local dx, dy ,dz = ux - px, uy - py, uz - pz
      if ux or uy or uz == nil then return end --fix nil error on unit death
      local r = Spring.GetUnitRadius(unitID)
      local dist = dx * dx + dy * dy + dz * dz
      -- check if we're close enough
      if dist < 4 * r * r then
         Spring.GiveOrderToUnit(unitID, CMD.STOP,{},{})
         Spring.UnitAttach(airbaseID, unitID, padPieceNum)
         Spring.GiveOrderToUnit(airbaseID,CMD.INSERT,{1,CMD.REPAIR,CMD.OPT_SHIFT,unitID},{"alt"})
         landingPlanes[unitID] = nil
         landedPlanes[unitID] = true
      else
         Spring.SetUnitLandGoal(unitID, px, py, pz, r)
      end
   end


   for unitID, _ in pairs(pendingLanders) do
      local closestAirbaseID, closestPieceNum = FindAirBase(unitID)
      if closestAirbaseID then
         Spring.GiveOrderToUnit(unitID, CMD.INSERT,{0, LAND_CMD_ID, 0, closestAirbaseID},{"alt"})
         landingPlanes[unitID] = {closestAirbaseID, closestPieceNum}
         pendingLanders[unitID] = nil
      end
   end
end

function gadget:Initialize()
   for unitDefID, unitDef in pairs(UnitDefs) do
      if unitDef.isAirBase then
         airbaseDefIDs[unitDefID] = true
         Spring.Echo(unitDef.name)
      end
   end

   -- Fake UnitCreated events for existing units. (for '/luarules reload')
   local allUnits = Spring.GetAllUnits()
   for i=1,#allUnits do
      local unitID = allUnits[i]
      gadget:UnitCreated(unitID, Spring.GetUnitDefID(unitID))
   end
end

function gadget:UnitLoaded(unitID, unitDefID, unitTeam, transportID, transportTeam)
    if (planes[unitID]) then
        Spring.SetUnitNoDraw(unitID, false)
        Spring.SetUnitStealth(unitID, false)
        Spring.SetUnitSonarStealth(unitID, false)
    end
end

--------------------------------------------------------------------------------
-- Unsynced
--------------------------------------------------------------------------------
else

function gadget:Initialize()
   Spring.AssignMouseCursor("Land for repairs", "cursorrepair", false, false)
   Spring.SetCustomCommandDrawData(LAND_CMD_ID, "Land for repairs", {1,0.5,0,.8}, false)
end

function gadget:DefaultCommand()
   local mx, my = Spring.GetMouseState()
   local s, targetID = Spring.TraceScreenRay(mx, my)
   if s ~= "unit" then
      return false
   end

   if not Spring.AreTeamsAllied(Spring.GetMyTeamID(), Spring.GetUnitTeam(targetID)) then
      return false
   end

   if not UnitDefs[Spring.GetUnitDefID(targetID)].isAirBase then
      return false
   end


   for _, unitID in pairs(Spring.GetSelectedUnits()) do
      if UnitDefs[Spring.GetUnitDefID(unitID)].canFly then
         return LAND_CMD_ID
      end
   end
   return false
end

end