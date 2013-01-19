function widget:GetInfo()
  return {
    name      = "Nano Unit Rings",
    desc      = "Draws rings showing nano build range",
    author    = "Original - CarRepairer, Revamped - Regret, This Version - Niobium",
    date      = "04/05/2012",
    license   = "Public Domain",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

--[[Comments section (using block style comment for attention getter...ness]]--

--[[

	You can have as many rings as you like.
		
		color = {0.5,0,1,0.3}, --R,G,B,A on a scale from 0 - 1. A is the opacity with 1 being fully opaque to 0 being fully transparent. Easy and quick color picker here: http://www.dematte.at/colorPicker/  Take 255 divided by the color value you want, and that is it's value on a scale from 0 - 1. 
			 
		radius = 500, --How large of a radius the ring will cover.

		linewidth = 1, --1 is basically 1 pixel thick. It will scale as you zoom in and out. Maximum value seems to be 32.
            
]]--

local pairs = pairs
local SpGetAllUnits = Spring.GetAllUnits
local SpGetUnitDefID = Spring.GetUnitDefID
local SpIsUnitAllied = Spring.IsUnitAllied
local SpIsUnitSelected = Spring.IsUnitSelected
local SpGetUnitPosition = Spring.GetUnitPosition

local glLineWidth = gl.LineWidth
local glColor = gl.Color
local glDrawGroundCircle = gl.DrawGroundCircle

local ringsDefs = {
    --Arm nanos
	[UnitDefNames.armnanotc.id] = {
        { color = {0.2, 0.6, 0.2, 1.0}, lineWidth = 2, radius = 450 },
    },
	[UnitDefNames.armnanotc1.id] = {
        { color = {0.25, 0.65, 0.25, 1.0}, lineWidth = 2.2, radius = 600 },
    },
        [UnitDefNames.armnanotc2.id] = {
        { color = {0.42, 0.81, 0.42, 1.0}, lineWidth = 2.5, radius = 900 },
    },
        [UnitDefNames.armnanotc3.id] = {
        { color = {0.68, 0.95, 0.68, 1.0}, lineWidth = 3, radius = 1200 },
    },
       [UnitDefNames.ananotower.id] = {
        { color = {0.34, 0.74, 0.34, 1.0}, lineWidth = 2.2, radius = 750 },
    },
    --Core nanos
	[UnitDefNames.cornanotc.id] = {
        { color = {0.21, 0.56, 0.56, 1.0}, lineWidth = 2, radius = 400 },
    },
	[UnitDefNames.cornanotc1.id] = {
        { color = {0.34, 0.65, 0.65, 1.0}, lineWidth = 2.2, radius = 450 },
    },
        [UnitDefNames.cornanotc2.id] = {
        { color = {0.56, 0.87, 0.87, 1.0}, lineWidth = 2.5, radius = 680 },
    },
        [UnitDefNames.cornanotc3.id] = {
        { color = {0.8, 1.0, 1.0, 1.0}, lineWidth = 3, radius = 900 },
    },
       [UnitDefNames.cnanotower.id] = {
        { color = {0.46, 0.81, 0.81, 1.0}, lineWidth = 2,2, radius = 575 },
    },
    --Tll nanos
    	[UnitDefNames.tllnanotc.id] = {
        { color = {0.55, 0.55, 0.21, 1.0}, lineWidth = 2, radius = 450 },
    },
	[UnitDefNames.tllnanotc1.id] = {
        { color = {0.68, 0.68, 0.34, 1.0}, lineWidth = 2.2, radius = 600 },
    },
        [UnitDefNames.tllnanotc2.id] = {
        { color = {0.87, 0.87, 0.56, 1.0}, lineWidth = 3, radius = 900 },
    },
}

local ringedUnits = {}

function widget:Initialize()
    for _, uId in pairs(SpGetAllUnits()) do
        widget:UnitEnteredLos(uId)
    end
end

function widget:UnitEnteredLos(uId)
    local uDefId = SpGetUnitDefID(uId)
    if uDefId then
        widget:UnitCreated(uId, uDefId)
    end
end

function widget:UnitCreated(uId, uDefId)
    local rings = ringsDefs[uDefId]
    if rings then
        ringedUnits[uId] = rings
    end
end

function widget:DrawWorld()
    for uId, rings in pairs(ringedUnits) do
		if (SpIsUnitAllied(uId)and SpIsUnitSelected(uId)) then
			local ux, uy, uz = SpGetUnitPosition(uId)
			if ux then
				for _, ring in pairs(rings) do
					glColor(ring.color)
					glLineWidth(ring.lineWidth or 1)
					glDrawGroundCircle(ux, uy, uz, ring.radius, ring.divs or 24)
				end
			else
				ringedUnits[uId] = nil
			end
		end
	end
    
    glLineWidth(1)
    glColor(1, 1, 1, 1)
end