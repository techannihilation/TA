--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
    return {
        name = "Prevent outside-of-map hax",
        desc = "Prevent outside-of-map hax",
        author = "Beherith", -- imporved performance by Silver
        date = "3 27 2011",
        license = "GNU GPL, v2 or later",
        layer = 0,
        enabled = true --  loaded by default?
    }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local DestroyUnit = Spring.DestroyUnit
local GetUnitsInRectangle = Spring.GetUnitsInRectangle

if (not gadgetHandler:IsSyncedCode()) then
    return false
end

local mapX = Game.mapSizeX
local mapZ = Game.mapSizeZ
local minDist = 2000
local checkRange = 10000
function gadget:GameFrame(f)
    if (f % 60 == 0) then

        left_side_units = GetUnitsInRectangle(-checkRange, -checkRange, -minDist, mapZ + checkRange)
        right_side_units = GetUnitsInRectangle(mapX + minDist, -checkRange, mapX + checkRange, mapZ + checkRange)
        bottom_side_units = GetUnitsInRectangle(-checkRange, mapZ + minDist, mapX + checkRange, mapZ + checkRange)
        top_side_units = GetUnitsInRectangle(-checkRange, -checkRange, mapX + checkRange, -minDist)
        for i = 1, #left_side_units do
            DestroyUnit(left_side_units[i])
        end
        for i = 1, #right_side_units do
            DestroyUnit(right_side_units[i])
        end
        for i = 1, #bottom_side_units do
            DestroyUnit(bottom_side_units[i])
        end
        for i = 1, #top_side_units do
            DestroyUnit(top_side_units[i])
        end
    end
end
