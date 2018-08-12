function widget:GetInfo()
  return {
    name      = "cmd_discharge_helper",
    desc      = "helper widget to discharge emp weapon",
    author    = "nixtux",
    date      = "Apr 24, 2018",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

local empID = 105
local dischargeID = UnitDefNames["tlldischarge"].id
local pressed = false
local pos = {}
local dischargeSelected = false
local empAOE = WeaponDefs[UnitDefs[dischargeID].weapons[2].weaponDef].damageAreaOfEffect
local empEE = WeaponDefs[UnitDefs[dischargeID].weapons[2].weaponDef].edgeEffectiveness
local numAoECircles = 9
local aoeColor = {1, 0, 0, 1}
local mouseDistance = 1000
local secondPart = 0
local circleList
local circleDivs = 64

local function GetSecondPart(offset)
  local result = secondPart + (offset or 0)
  return result - math.floor(result)
end

local function GetMouseTargetPosition()
  local mx, my = Spring.GetMouseState()
  local mouseTargetType, mouseTarget = Spring.TraceScreenRay(mx, my)
  
  if (mouseTargetType == "ground") then
    return mouseTarget[1], mouseTarget[2], mouseTarget[3]
  elseif (mouseTargetType == "unit") then
    return GetUnitPosition(mouseTarget)
  elseif (mouseTargetType == "feature") then
    return GetFeaturePosition(mouseTarget)
  else
    return nil
  end
end

local function GetMouseDistance()
  local cx, cy, cz = Spring.GetCameraPosition()
  local mx, my, mz = GetMouseTargetPosition()
  if (not mx) then return nil end
  local dx = cx - mx
  local dy = cy - my
  local dz = cz - mz
  return math.sqrt(dx*dx + dy*dy + dz*dz)
end

local function DrawCircle(x, y, z, radius)
  gl.PushMatrix()
  gl.Translate(x, y, z)
  gl.Scale(radius, radius, radius)
  
  gl.CallList(circleList)
  
  gl.PopMatrix()
end

local function UnitCircleVertices()
  for i = 1, circleDivs do
    local theta = 2 * math.pi * i / circleDivs
    gl.Vertex(math.cos(theta), 0, math.sin(theta))
  end
end

local function DrawUnitCircle()
  gl.BeginEnd(GL.LINE_LOOP, UnitCircleVertices)
end

local function SetupDisplayLists()
  circleList = gl.CreateList(DrawUnitCircle)
end

local function DeleteDisplayLists()
  gl.DeleteList(circleList)
end

function widget:Initialize()
  SetupDisplayLists()
end

function widget:Shutdown()
  DeleteDisplayLists()
end

function widget:KeyPress(key)
    --Spring.Echo(key)
    if key == 101 then   -- 101 is key e
        pressed = true
    end
end

function widget:KeyRelease(key)
    if dischargeSelected and key == 101 then
        Spring.GiveOrderToUnit(selectedunitID, empID, pos, {})
    end
    pressed = false
end

function widget:Update(dt)
    secondPart = secondPart + dt
    secondPart = secondPart - math.floor(secondPart)
    if pressed then
        local selectedUnits = Spring.GetSelectedUnits()
        if #selectedUnits == 1 and pressed then
            selectedunitID = selectedUnits[1]
            if Spring.GetUnitDefID(selectedUnits[1]) == dischargeID then
                dischargeSelected = true
                local mx,my = Spring.GetMouseState()
                _, pos = Spring.TraceScreenRay(mx,my,true)
                mouseDistance = GetMouseDistance() or 1000
            else
                dischargeSelected = false
            end
        else
            dischargeSelected = false
        end
    else
        dischargeSelected = false
    end
end

function widget:DrawWorld()
    if dischargeSelected then
        gl.LineWidth(64 * empAOE / mouseDistance)

        for i=1,numAoECircles do
            local proportion = i / (numAoECircles + 1)
            local radius = empAOE * proportion
            local alpha = aoeColor[4] * (1 - proportion) / (1 - proportion * empEE) * (1 - GetSecondPart(offset or 0)) * (1)
            gl.Color(aoeColor[1], aoeColor[2], aoeColor[3], alpha)
            DrawCircle(pos[1], pos[2], pos[3], radius)
        end

        gl.Color(1,1,1,1)
        gl.LineWidth(1)
    end
end