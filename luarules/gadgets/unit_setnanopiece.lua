--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "Set Nano Piece",
    desc      = "Sets nano piece positions for COB-scripted units",
    author    = "KingRaptor",
    date      = "2013-2-2",
    license   = "Public Domain",
    layer     = 0,
    enabled   = not (Game.version:find('91.0') and (Game.version:find('91.0.1') == nil))
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

if (not gadgetHandler:IsSyncedCode()) then
  return false  --  silent removal
end

local spGetUnitPieceMap     = Spring.GetUnitPieceMap
local spGetUnitPiecePosDir  = Spring.GetUnitPiecePosDir
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local units = {
  [UnitDefNames.tllcom.id] = {"nano"},
  [UnitDefNames.armcom.id] = {"nanolath"},
}

function gadget:UnitCreated(unitID, unitDefID, unitTeam)
  if units[unitDefID] then
    local pieceMap = spGetUnitPieceMap(unitID)
    local nanoPieces = {}
    for i=1,#units[unitDefID] do
      local pieceName = units[unitDefID][i]
      local pieceNum = pieceMap[pieceName]
      --local pieceNumAlt = Spring.GetUnitScriptPiece(unitID, pieceNum)
      --Spring.Echo("Nanopiece nums (input)", i, UnitDefs[unitDefID].name, pieceNum, pieceNumAlt)
      nanoPieces[#nanoPieces+1] = pieceNum
    end
    Spring.SetUnitNanoPieces(unitID, nanoPieces)
  end
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
