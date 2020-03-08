--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
    return {
        name = "Prevent outside-of-map hax",
        desc = "Prevent outside-of-map hax",
        author = "Beherith", -- imporved performance by Silver
        date = "3 27 2011",
        license = "CC BY SA",
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
local maxDist = 1500
local checkDist = 10000
function gadget:GameFrame(f)
    if (f % 31 == 0) then
        left_side_units = GetUnitsInRectangle(-checkDist, -checkDist, -maxDist, mapZ + checkDist)
        right_side_units = GetUnitsInRectangle(mapX + maxDist, -checkDist, mapX + checkDist, mapZ + checkDist)
        bottom_side_units = GetUnitsInRectangle(-checkDist, mapZ + maxDist, mapX + checkDist, mapZ + checkDist)
        top_side_units = GetUnitsInRectangle(-checkDist, -checkDist, mapX + checkDist, -maxDist)
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
