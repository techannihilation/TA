function widget:GetInfo()
    return {
        name      = "Nano Range",
        desc      = "Draws range for nanos if placing buildings/units",
        author    = "Nixtux", --based on rings widget by Niobium
        date      = "06/07/2014",
        license   = "Public Domain",
        layer     = 0,
        enabled   = true  --  loaded by default?
     }
end

local pairs = pairs
local SpGetAllUnits = Spring.GetAllUnits
local SpGetUnitDefID = Spring.GetUnitDefID
local SpIsUnitAllied = Spring.IsUnitAllied
local SpIsUnitSelected = Spring.IsUnitSelected
local SpGetUnitPosition = Spring.GetUnitPosition
local SpGetActiveCommand = Spring.GetActiveCommand

local glLineWidth = gl.LineWidth
local glColor = gl.Color
local glDrawGroundCircle = gl.DrawGroundCircle

local ringsDefs = {}

local ringedUnits = {}

-- opacity control 
local darkOpacity = 0.5
local lightOpacity = 0.5

function SetOpacity(dark, light) 
    darkOpacity = dark 
    lightOpacity = light 
end 

function widget:Initialize()
    widgetHandler:RegisterGlobal('SetOpacity_Nanorings', SetOpacity) 
    for uDefId, ud in ipairs(UnitDefs) do
	if ud.isBuilder and not ud.canMove and not ud.isFactory then
	    ringsDefs[uDefId] = { r = ud.nanoColorR, g = ud.nanoColorG, b = ud.nanoColorB, radius = ud.buildDistance }
	end
    end
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
    local _, cmdID = SpGetActiveCommand()
    if cmdID and cmdID < 0 then
        for uId, rings in pairs(ringedUnits) do
	local ux, uy, uz = SpGetUnitPosition(uId)
	    if ux then
	        local r,g,b = rings.r,rings.g,rings.b
	        --Spring.Echo(r,g,b,lightOpacity)
	        glColor(r,g,b,lightOpacity)
                glLineWidth(1)
	        glDrawGroundCircle(ux, uy, uz, rings.radius, 24)
	    else
	        ringedUnits[uId] = nil
	    end
         end
    end
    glLineWidth(1)
    glColor(1, 1, 1, 1)
end

function widget:GameOver() 
    widgetHandler:DeregisterGlobal('SetOpacity_Nanorings', SetOpacity) 
    widgetHandler:RemoveWidget(self) 
end 
 