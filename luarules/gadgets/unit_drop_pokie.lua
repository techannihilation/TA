-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "drop_pokie",
    desc      = "drop_pokie",
    author    = "Nixtux",
    date      = "Jun 3, 2017",
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
local dropperID = UnitDefNames['corpokie'].id
local unitsToDrop = UnitDefNames['cormonsta'].id
local holding = {}
local holdingID = {}
local isloadedID = {}
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

-- Speed-ups

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
function gadget:UnitFinished(unitID, unitDefID, unitTeam)
  if dropperID == unitDefID then
	  local pieceMap = Spring.GetUnitPieceMap(unitID)
    local count = 1
    holdingID[unitID] = {}
    holdingID[unitID].frame = nil
   	for pieceName, pieceNum in pairs(pieceMap) do
		if pieceName:find("basket") then
		local x, y, z = Spring.GetUnitPiecePosDir(unitID,pieceNum)
        local heading = Spring.GetUnitHeading(unitID)
        local face = math.floor((heading + 8192) / 16384) % 4
		local newUnitID = Spring.CreateUnit(unitsToDrop, x, y, z, face, unitTeam)
        Spring.SetUnitStealth(newUnitID, true)
        Spring.SetUnitSonarStealth(newUnitID, true)
        Spring.SetUnitNoSelect(newUnitID, true)
        Spring.SetUnitLoadingTransport(newUnitID, unitID)

        Spring.UnitAttach(unitID, newUnitID, pieceNum)
        --Spring.Echo("Loading ", unitID," with ", newUnitID, "at piece ", pieceNum)
        holdingID[unitID][count] = {newUnitID,pieceNum}
        --holdingID[unitID].frame = Spring.GetGameFrame()
        holdingID[unitID].canAnimate = true
        isloadedID[newUnitID] = true
        holding[unitID] = true
        count = count + 1
      end
    end
	end
end

function gadget:GameFrame(f)
  if f%90==0 then
    for unitID ,_  in pairs(holdingID) do
      holdingID[unitID].canAnimate = true
    end
  end
end

function gadget:UnitPreDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponID, projectileID, attackerID, attackerDefID, attackerTeam)
  if isloadedID[unitID] then
    --Spring.Echo(unitID, " Damage reduced")
    return 0, 1
  else
    return damage, 1
  end
end

function gadget:UnitDestroyed(unitID, unitDefID)
	isloadedID[unitID] = nil
  holdingID[unitID] = nil
end

function gadget:UnitDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponDefID, projectileID, attackerID, attackerDefID, attackerTeam)
  if (unitDefID == dropperID) and holding[unitID] then
    local currentHP, maxHP = Spring.GetUnitHealth(unitID)
    if currentHP <= (math.random(maxHP*.15,maxHP*.75)) then
      local passangers = holdingID[unitID]
      if passangers == nil then return end
      for i = 1, #passangers do
        passIDs = passangers[i][1]
        Spring.UnitDetach(passIDs)
        Spring.SetUnitStealth(passIDs, false)
        Spring.SetUnitSonarStealth(passIDs, false)
        Spring.SetUnitNoSelect(passIDs, false)
        isloadedID[passIDs] = false
        --Spring.Echo("UnLoading ", passangers," with ", passIDs)
        if attackerID and passIDs then
          local x,y,z = Spring.GetUnitPosition(unitID)
          local ax,ay,az = Spring.GetUnitPosition(attackerID)
          local facing = Spring.GetUnitBuildFacing(unitDefID)
          z=z+math.random(-128,128)
          x=x+math.random(-128,128)
          Spring.GiveOrderToUnit(passIDs, CMD.MOVE, {x,y,z}, {"shift"})
          Spring.GiveOrderToUnit(passIDs, CMD.FIGHT, {ax,ay,az}, {"shift"})
          --Spring.Echo("Fight Command Given to ", passIDs)
        end
        passIDs = nil
      end
      holding[unitID] = nil
    elseif damage > 125 and holdingID[unitID].canAnimate then
      holdingID[unitID].canAnimate = false
      local passangers = holdingID[unitID]
      if passangers == nil then return end
      for i = 1, #passangers do
        passIDs = passangers[i][1]
        Spring.CallCOBScript(passIDs, "wriggle", 0, 1)
      end
    end
  end
end
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
