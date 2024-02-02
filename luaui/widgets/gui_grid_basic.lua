function widget:GetInfo()
  return {
    name = "Building Grid 1.1",
    desc = "Draws a grid on the map to assist with building placement",
    author = "TechA",
    date = "2024-02-02",
    license = "GNU GPL, v2 or later",
    layer = 0,
    enabled = true,
  }
end

local drawRadius = 1000
local gridSizeX = 15 * 16
local gridSizeZ = 15 * 16
local drawGrid = false
local gridBounds = { startX = 0, endX = 0, startZ = 0, endZ = 0 }
local mainGridList, fineGridList = 0, 0

local ceil = math.ceil
local GetActiveCommand = Spring.GetActiveCommand
local GetMouseState = Spring.GetMouseState
local TraceScreenRay = Spring.TraceScreenRay
local GetGroundHeight = Spring.GetGroundHeight
local glColor = gl.Color
local glDepthTest = gl.DepthTest
local glVertex = gl.Vertex
local glCreateList = gl.CreateList
local glCallList = gl.CallList
local glDeleteList = gl.DeleteList
local glLineWidth = gl.LineWidth

local function getUnitFootprint(unitDefID)
    local unitDef = UnitDefs[unitDefID]
    if unitDef then
        return unitDef.xsize, unitDef.zsize
    else
        return nil, nil
    end
end

local function logisticQuantile(y, a)
    return -math.log((1 / y) - 1) / a + 0.5
end

local function calculateAlpha(x, z, mouseX, mouseZ)
  local distance = math.sqrt((x - mouseX) ^ 2 + (z - mouseZ) ^ 2)
  local alpha = 1 - (distance / drawRadius)
  alpha = math.max(alpha, 0) * 0.2
  return alpha
end

local function createGridList(lineWidth, mouseX, mouseZ, gridX, gridZ)
    return glCreateList(function()
        glLineWidth(lineWidth)
        gl.BeginEnd(GL.LINES, function()
            for x = 0, gridBounds.endX, gridX do
                if x >= (mouseX - drawRadius) and x <= (mouseX + drawRadius) then
                    for z = 0, gridBounds.endZ, gridZ do
                        if z >= (mouseZ - drawRadius) and z <= (mouseZ + drawRadius) then
                            local alphaStart = calculateAlpha(x, z, mouseX, mouseZ)
                            local alphaEnd = calculateAlpha(x, z + gridZ, mouseX, mouseZ)
                            glColor(0.5, 1, 0.5, alphaStart)
                            glVertex(x, GetGroundHeight(x, z), z)
                            glColor(0.5, 1, 0.5, alphaEnd)
                            glVertex(x, GetGroundHeight(x, z + gridZ), z + gridZ)
                        end
                    end
                end
            end
            for z = 0, gridBounds.endZ, gridZ do
                if z >= (mouseZ - drawRadius) and z <= (mouseZ + drawRadius) then
                    for x = 0, gridBounds.endX, gridX do
                        if x >= (mouseX - drawRadius) and x <= (mouseX + drawRadius) then
                            local alphaStart = calculateAlpha(x, z, mouseX, mouseZ)
                            local alphaEnd = calculateAlpha(x + gridX, z, mouseX, mouseZ)
                            glColor(0.5, 1, 0.5, alphaStart)
                            glVertex(x, GetGroundHeight(x, z), z)
                            glColor(0.5, 1, 0.5, alphaEnd)
                            glVertex(x + gridX, GetGroundHeight(x + gridX, z), z)
                        end
                    end
                end
            end
        end)
    end)
end

local function updateGridBounds(mx, my)
  local pos = select(2, TraceScreenRay(mx, my, true))
  if not pos then return false end
  local mouseX, mouseZ = pos[1], pos[3]
  local newBounds = {
    startX = 0,
    startZ = 0,
    endX = ceil((mouseX + drawRadius) / gridSizeX) * gridSizeX,
    endZ = ceil((mouseZ + drawRadius) / gridSizeZ) * gridSizeZ,
  }
  for key, value in pairs(newBounds) do
    if gridBounds[key] ~= value then
      gridBounds = newBounds
      return true
    end
  end
  return false
end

function widget:Update()
    local _, activeCmdID = GetActiveCommand()
    drawGrid = (activeCmdID and activeCmdID < 0)
    if not drawGrid then return end
    local mx, my = GetMouseState()
    local pos = select(2, TraceScreenRay(mx, my, true))
    if pos then
        local mouseX, mouseZ = pos[1], pos[3]
        local unitFootprintX, unitFootprintZ
        if activeCmdID then
            local unitDefID = -activeCmdID
            unitFootprintX, unitFootprintZ = getUnitFootprint(unitDefID)
            if unitFootprintX * unitFootprintZ < 64 then glDeleteList(mainGridList) return end
        end
        local gridX = unitFootprintX * 8 or gridSizeX
        local gridZ = unitFootprintZ * 8 or gridSizeZ
        if updateGridBounds(mx, my, gridX, gridZ) then
            glDeleteList(mainGridList)
            mainGridList = createGridList(2, mouseX, mouseZ, gridX, gridZ)
        end
    end
end

function widget:DrawWorldPreUnit()
  if drawGrid then
    glDepthTest(false)
    glCallList(mainGridList)
    glCallList(fineGridList)
    glColor(1, 1, 1, 1)
  end
end

function widget:Shutdown()
  glDeleteList(mainGridList)
  glDeleteList(fineGridList)
end
