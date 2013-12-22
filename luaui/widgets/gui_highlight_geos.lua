
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

local tll_geo = UnitDefNames.tllgeo.id
local tll_mohogeo = UnitDefNames.tllmohogeo.id
local am_geo = UnitDefNames.amgeo.id
local arm_for = UnitDefNames.armfor.id
local arm_geo = UnitDefNames.armgeo.id
local cm_geo = UnitDefNames.cmgeo.id
local corbhmth_geo = UnitDefNames.corbhmth.id
local corbhmth1_geo = UnitDefNames.corbhmth1.id
local cor_geo = UnitDefNames.corgeo.id






----------------------------------------------------------------
-- Functions
----------------------------------------------------------------
local function PillarVerts(x, y, z)
	glColor(1, 1, 0, 1)
	glVertex(x, y, z)
	glColor(1, 1, 0, 0)
	glVertex(x, y + 1000, z)
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
function widget:Shutdown()
	if geoDisplayList then
		gl.DeleteList(geoDisplayList)
	end
end

function widget:DrawWorld()
    local _, cmdID = Spring.GetActiveCommand()
	if spGetMapDrawMode() == 'metal' or cmdID == -tll_geo or cmdID == -tll_mohogeo or cmdID == -am_geo or cmdID == -arm_for or cmdID == -arm_geo or cmdID == -cm_geo
	or cmdID == -corbhmth_geo or cmdID == -corbhmth1_geo or cmdID == -cor_geo then
		
		if not geoDisplayList then
			geoDisplayList = gl.CreateList(HighlightGeos)
		end
		
		glLineWidth(20)
		glDepthTest(true)
		glCallList(geoDisplayList)
        glColor(1, 1, 1, 1)
		glLineWidth(1)
	end
end
