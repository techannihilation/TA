
function widget:GetInfo()
	return {
		name      = 'Anti Range',
		desc      = '',
		author    = 'Niobium',
		date      = 'May 2011',
		license   = 'GNU GPL, v2 or later',
		layer     = 0,
		enabled   = true,
	}
end

--------------------------------------------------------------------------------
-- Globals
--------------------------------------------------------------------------------
local arm_anti = UnitDefNames.armamd.id
local core_anti = UnitDefNames.corfmd.id
local arm_anti1 = UnitDefNames.armamd1.id
local core_anti1 = UnitDefNames.corfmd1.id
local arm_anti2 = UnitDefNames.armamd2.id
local core_anti2 = UnitDefNames.corfmd2.id
local tllantinuke = UnitDefNames.tllantinuke.id

--------------------------------------------------------------------------------
-- Speedups
--------------------------------------------------------------------------------
local spGetActiveCommand = Spring.GetActiveCommand
local spGetMouseState = Spring.GetMouseState
local spTraceScreenRay = Spring.TraceScreenRay
local spPos2BuildPos = Spring.Pos2BuildPos

local glColor = gl.Color
local glDepthTest = gl.DepthTest
local glDrawGroundCircle = gl.DrawGroundCircle

--------------------------------------------------------------------------------
-- Callins
--------------------------------------------------------------------------------
function widget:DrawWorld()
    local _, cmdID = spGetActiveCommand()
    if cmdID == -arm_anti or cmdID == -core_anti or cmdID == -arm_anti1 or cmdID == -core_anti1 or cmdID == -arm_anti2 or cmdID == -core_anti2 or cmdID == -tllantinuke then
        local mx, my = spGetMouseState()
        local _, pos = spTraceScreenRay(mx, my, true)
        if pos then
            local bx, by, bz = spPos2BuildPos(-cmdID, pos[1], pos[2], pos[3])
            glColor(1, 1, 1, 1)
            glDepthTest(true)
            glDrawGroundCircle(bx, by, bz, 2000, 256)
        end
    end
end
