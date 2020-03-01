
function widget:GetInfo()
	return {
		name      = 'Highlight Geos',
		desc      = 'Highlights geothermal spots when in metal map view',
		author    = 'Niobium',
		version   = '1.0',
		date      = 'Mar, 2011',
		license   = 'GNU GPL, v2 or later',
		layer     = 0,
		enabled   = true,  --  loaded by default?
	}
end

----------------------------------------------------------------
-- Globals
----------------------------------------------------------------
local geoDisplayList

----------------------------------------------------------------
-- Speedups
----------------------------------------------------------------
local glLineWidth = gl.LineWidth
local glDepthTest = gl.DepthTest
local glCallList = gl.CallList
local glColor = gl.Color
local glVertex = gl.Vertex
local glBeginEnd = gl.BeginEnd
local spGetMapDrawMode = Spring.GetMapDrawMode
local SpGetSelectedUnits = Spring.GetSelectedUnits

local isGeo = {}

for uDefID, uDef in pairs(UnitDefs) do
  if uDef.needGeo then --Should only seletect real radar units
    isGeo[uDefID] = true
  end
end

----------------------------------------------------------------
-- Functions
----------------------------------------------------------------
local function PillarVerts(x, y, z)
	glColor(1, 1, 0, 1)
	glVertex(x, y +500, z)
	glColor(1, 1, 0, 0)
	glVertex(x, y +1000, z)
	glColor(1, 1, 0, 1)
	glVertex(x, y +500 , z)
	glColor(1, 1, 0, 0)
	glVertex(x, y, z)
end

local function HighlightGeos()
	local features = Spring.GetAllFeatures()
	for i = 1, #features do
		local fID = features[i]
		if FeatureDefs[Spring.GetFeatureDefID(fID)].geoThermal then
			local fx, fy, fz = Spring.GetFeaturePosition(fID)
			glBeginEnd(GL.LINE_STRIP, PillarVerts, fx, fy, fz)
		end
	end
end

----------------------------------------------------------------
-- Callins
----------------------------------------------------------------

function widget:DrawWorld()

	local _, cmdID = Spring.GetActiveCommand()
	if spGetMapDrawMode() == 'metal' or (cmdID and isGeo[-cmdID]) then
		if not geoDisplayList then
			geoDisplayList = gl.CreateList(HighlightGeos)
		end
	glLineWidth(20)
	glDepthTest(true)
	glCallList(geoDisplayList)
	glColor(1, 1, 1, 1)
	glLineWidth(1)
	else
		gl.DeleteList(geoDisplayList)
		geoDisplayList = nil
	end
end

function widget:Shutdown()
	if geoDisplayList then
		gl.DeleteList(geoDisplayList)
	end
end