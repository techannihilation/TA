function widget:GetInfo()
  return {
    name      = "Avoid Projectiles",
    desc      = "Select units and press alt+n to enable, alt+m to disable. Have fun :)",
    author    = "[KING]Silver",
    version   = "v1.01",
    date      = "2017",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = false,
  }
end

----Speedups
local echo                     = Spring.Echo
local GetKeyCode               = Spring.GetKeyCode
local GetAllyTeamList          = Spring.GetAllyTeamList
local GetTeamList              = Spring.GetTeamList
local GetSelectedUnits         = Spring.GetSelectedUnits
local GetUnitViewPosition      = Spring.GetUnitViewPosition
local GetUnitPosition          = Spring.GetUnitPosition
local GetMyPlayerID            = Spring.GetMyPlayerID
local GetPlayerInfo            = Spring.GetPlayerInfo
local GiveOrderToUnit          = Spring.GiveOrderToUnit
local GetProjectileDirection   = Spring.GetProjectileDirection 
local GetProjectileTarget      = Spring.GetProjectileTarget
local GetVisibleProjectiles     = Spring.GetVisibleProjectiles
local GetProjectileTeamID      = Spring.GetProjectileTeamID
local glColor                  = gl.Color
local glLineWidth              = gl.LineWidth
local glDrawGroundCircle       = gl.DrawGroundCircle

---Config
local minDistFromProjectile = 80
local KeyShortcut1 = "n"
local KeyShortcut2 = "m"
local KeyModifier = "alt"
 
----Globals
local UnitList = {}
local Allies
local Enemies
local Gaia
local cospi2 = math.cos(math.pi/2)
local sinpi2 = math.sin(math.pi/2)
local changeDir = 1

function widget:Initialize()
  local playerID = GetMyPlayerID()
  local _, _, spectator = GetPlayerInfo(playerID)
  if spectator then
     widgetHandler:RemoveWidget()
  end
  GetTeams()
end

function GetTeams()
  local allyList = GetAllyTeamList()
  for n,allyID in ipairs(allyList) do
    local teamList = GetTeamList(allyID)
    if n == 1 then Allies = teamList end
    if n == 2 then Enemies = teamList end
    if n == 3 then Gaia = teamList end
  end
end

function widget:GameFrame(frame)
  if (frame%1<1) then
    for i=1, #UnitList do
      unitID = UnitList[i]
      if unitID then
        local ax,ay,az = GetUnitViewPosition(unitID)
        local projectiles = GetVisibleProjectiles(-1,false,true,false)
        if #projectiles == 0 or nil then return end
        for _,proID in pairs(projectiles) do
          tx,ty,tz = GetProjectileTargets(proID)
          tx = tx or 0
          tz = tz or 0
          tz = tz or 0
          distFromUnit = math.sqrt( (ax-tx)*(ax-tx) + (az-tz)*(az-tz) )
          if distFromUnit < minDistFromProjectile then
            pdx,pdy,pdz = GetProjectileDirection(proID)
            pdx = pdx or 0
            pdy = pdy or 0
            pdz = pdz or 0
            local projectileTeamId = GetProjectileTeamID(proID)
            for _,enemyID in pairs(Enemies) do
              if projectileTeamId == enemyID or Gaia then
                isEnemyProjectile = true
              else
                isEnemyProjectile = false
              end
            end
            if isEnemyProjectile == true then
              if (oldtx ~=tx or oldtz ~=tz ) then
                moveDist = math.random(30,80)
                if (frame%90<1) then
                  changeDir = -1*changeDir
                end
                xMove = (pdx* moveDist)*cospi2 + (pdz * moveDist)*sinpi2
                zMove = -(pdx* moveDist)*sinpi2 + (pdz * moveDist)*cospi2
                oldtx = tx
                oldtz = tz
              end
              GiveOrderToUnit( unitID , CMD.MOVE, {ax-xMove*changeDir, ay, az-zMove*changeDir } ,{} )
            end
          end
        end
      end
    end
  end
end

function GetProjectileTargets(proID)
  local targetType, targetID = GetProjectileTarget(proID)
  if targetType then
    if targetType == string.byte('u') then -- unit
      tx, ty, tz = Spring.GetUnitPosition(targetID)
    elseif targetType == string.byte('f') then -- feature
      tx, ty, tz = Spring.GetFeaturePosition(targetID)
    elseif targetType == string.byte('p') then --projectile
      tx, ty, tz = Spring.GetProjectilePosition(targetID)
    elseif targetType == string.byte('g') then -- ground
      tx, ty, tz = unpack(targetID)
    end
  return tx, ty, tz
  end
end

function widget:DrawWorld()
  for _, unitID in pairs(UnitList) do
    if unitID then
      local ux, uy, uz = GetUnitViewPosition(unitID)
      if ux ~= nil and uy ~=nil and uz ~= nil  then
        glLineWidth(4)
        glColor(0.0, 0.1, 0.7, 0.25)
        glDrawGroundCircle(ux, uy, uz, 30, 3)
      end
    end
  end
glLineWidth(1)
glColor(1, 1, 1, 1)
end

local function AddUnitsToList(selectedUnits)
  for _, unitID in pairs(selectedUnits) do
    local unitExist = false
    for _,v in pairs(UnitList) do
      if unitID == v then
        unitExist = true
      end
    end
    if not unitExist then
      UnitList[#UnitList+1] = unitID
    end
  end
end

local function RemoveUnitsFromList(selectedUnits)
  local newUnitList = {}
  for _, unitID in pairs(UnitList) do
    local unitExist = false
    for _,v in pairs(selectedUnits) do
      if unitID == v then
        unitExist = true
      end
    end
    if not unitExist then
      newUnitList[#newUnitList+1] = unitID
    end
  end
UnitList = newUnitList
end

function widget:KeyPress(key, modifier, isRepeat)
  if (key == GetKeyCode(KeyShortcut1) and modifier[KeyModifier] and not isRepeat)  then
    AddUnitsToList(GetSelectedUnits())
  end
  
  if (key == GetKeyCode(KeyShortcut2) and modifier[KeyModifier] and not isRepeat)  then
    RemoveUnitsFromList(GetSelectedUnits())
  end
end

function widget:UnitDestroyed(unitID, unitDefID, unitTeam)
  local destrUnit = {unitID}
  RemoveUnitsFromList(destrUnit)
end
