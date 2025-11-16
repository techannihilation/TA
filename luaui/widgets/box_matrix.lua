--------------------------------------------------------------------------------
-- Widget Info
--------------------------------------------------------------------------------
function widget:GetInfo()
    return {
        name    = "Matrix units v1.5",
        desc    = "Randomly distributes selected units in a box formation\nKEY: Left Mouse + '.'",
        author  = "Silver",
        date    = "10.2025",
        license = "GNU GPL, v2 or later",
        layer   = 0,
        enabled = true,
    }
end

--------------------------------------------------------------------------------
-- Config / Vars
--------------------------------------------------------------------------------

-- Local variable for the box key ('.')
local BOX_KEY       = 46

local boxActive     = false
local startPoint    = nil
local endPoint      = nil

-- Table to track positions and idle states of units that were last distributed
--   Format: unitsPositions[unitID] = { x = x, y = y, z = z, idle = false }
local unitsPositions = {}

-- Flag to ensure we only refine once per distribution
local refined = false

--------------------------------------------------------------------------------
-- Utilities
--------------------------------------------------------------------------------

-- Fisher-Yates shuffle to randomize the array of selected units
local function shuffle(t)
    for i = #t, 2, -1 do
        local j = math.random(i)
        t[i], t[j] = t[j], t[i]
    end
end

local function allUnitsIdle()
    for _, data in pairs(unitsPositions) do
        if not data.idle then
            return false
        end
    end
    return true
end

--------------------------------------------------------------------------------
-- Distribute + Refine
--------------------------------------------------------------------------------

-- Called after user draws the box (MouseRelease).
-- This is the initial move order. We also initialize the tracking table.
function distributeUnits(startPos, endPos)
    local units = Spring.GetSelectedUnits()
    local unitCount = #units
    if unitCount == 0 then
        return
    end

    -- 1) Randomize the order of units so that the matrix is mixed
    shuffle(units)

    -- 2) Calculate grid dimensions
    local columns = math.ceil(math.sqrt(unitCount))
    local rows    = math.ceil(unitCount / columns)

    -- 3) Prepare to track each unit's target position (for refine pass)
    unitsPositions = {}
    refined = false  -- reset refine flag each time we distribute

    -- 4) Calculate step sizes (dx, dz)
    local dx, dz
    if columns > 1 then
        dx = (endPos[1] - startPos[1]) / (columns - 1)
    else
        dx = 0
    end

    if rows > 1 then
        dz = (endPos[3] - startPos[3]) / (rows - 1)
    else
        dz = 0
    end

    -- 5) Issue the initial move orders
    local k = 1
    for i = 0, rows - 1 do
        for j = 0, columns - 1 do
            if k <= unitCount then
                local unitID = units[k]
                local x = (columns > 1)
                          and (startPos[1] + dx * j)
                          or  (startPos[1] + endPos[1]) * 0.5
                local z = (rows > 1)
                          and (startPos[3] + dz * i)
                          or  (startPos[3] + endPos[3]) * 0.5
                local y = Spring.GetGroundHeight(x, z)

                -- Save target formation positions
                unitsPositions[unitID] = { x = x, y = y, z = z, idle = false }

                -- Move the unit
                Spring.GiveOrderToUnit(unitID, CMD.MOVE, { x, y, z }, {})
                k = k + 1
            end
        end
    end
end

-- Once all units from the last distribution are idle, do one final "refine" pass with small offset
local function refinePositions()
    for unitID, posData in pairs(unitsPositions) do
        Spring.GiveOrderToUnit(unitID, CMD.MOVE, { posData.x + 2, posData.y, posData.z + 2 }, {"shift"})
    end
end

--------------------------------------------------------------------------------
-- Callins
--------------------------------------------------------------------------------

function widget:KeyPress(key, mods, isRepeat)
    if key == BOX_KEY then
        boxActive = true
        return true
    end
    return false
end

function widget:KeyRelease(key)
    if key == BOX_KEY then
        boxActive   = false
        startPoint  = nil
        endPoint    = nil
        return true
    end
    return false
end

function widget:MousePress(mx, my, button)
    if boxActive and (button == 1 or button == 3) then
        local _, pos = Spring.TraceScreenRay(mx, my, true)
        if pos then
            startPoint = pos
            return true
        end
    end
    return false
end

function widget:MouseMove(mx, my, dx, dy, button)
    if boxActive and (button == 1 or button == 3) then
        local _, pos = Spring.TraceScreenRay(mx, my, true)
        if pos then
            endPoint = pos
            return true
        end
    end
    return false
end

function widget:MouseRelease(mx, my, button)
    if boxActive and (button == 1 or button == 3)  then
        distributeUnits(startPoint, endPoint)
        startPoint = nil
        endPoint   = nil
        return true
    end
    return false
end

-- Called when a unit becomes Idle (finished its CMD)
function widget:UnitIdle(unitID, unitDefID, teamID)
    local posData = unitsPositions[unitID]
    -- If this unit is part of the last distribution, mark it idle
    if posData and (not posData.idle) then
        posData.idle = true
        -- If all are idle and we haven't refined yet, do a one-time refine pass
        if (not refined) and allUnitsIdle() then
            refinePositions()
            refined = true
        end
    end
end

function widget:DrawWorld()
    if boxActive and startPoint and endPoint then
        local x1, z1 = startPoint[1], startPoint[3]
        local x2, z2 = endPoint[1], endPoint[3]

        -- Ensure (x1, z1) is top-left, (x2, z2) bottom-right
        if x1 > x2 then x1, x2 = x2, x1 end
        if z1 > z2 then z1, z2 = z2, z1 end

        gl.Color(0, 1, 0, 0.5) -- Green with half transparency
        gl.DrawGroundQuad(x1, z1, x2, z2)
        gl.Color(1, 1, 1, 1)   -- Reset color
    end
end
