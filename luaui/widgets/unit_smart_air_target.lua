function widget:GetInfo()
    return {
        name    = "Air Smart Targeting",
        version = "2.6",
        date    = "18.11.2025",
        author  = "[ur]uncle",
        license = "GNU GPL, v2 or later",
        layer   = 0,
        enabled = true
    }
end

-- === CONFIGURABLE CONSTANTS ===
local SCAN_RANGE_MULTIPLIER = 1.4            -- Scan slightly beyond weapon range for early detection
local BATCH_SIZE = 15                        -- Number of units processed per coroutine batch
local LOW_CLASS_AA_COST = 400                -- Threshold for low-class AA unit (metal cost)
local UPDATE_RATE = 5                        -- How often (in game frames) the widget updates

-- Visauals
local DEFENDER_MARK_RADIUS = 35              -- Visual radius around AA defenders
local ROTATION_PERIOD = 3                    -- Seconds required for one full rotation of the visual mark

-- Special bomber units by name (not flagged as bombers in UnitDefs)
local SPECIAL_BOMBER = { ["armcybr"] = true, ["armliche"] = true }

-- Custom command IDs for Spring engine
local CMD_UNIT_SET_TARGET = 34923
local CMD_UNIT_CANCEL_TARGET = 34924
local ENEMY_UNITS = Spring.ENEMY_UNITS

-- === SPRING API SHORTCUTS ===
local GetUnitDefID = Spring.GetUnitDefID
local GetUnitIsDead = Spring.GetUnitIsDead
local GetUnitPosition = Spring.GetUnitPosition
local GetUnitSeparation = Spring.GetUnitSeparation
local GetUnitsInSphere = Spring.GetUnitsInSphere
local GetUnitViewPosition = Spring.GetUnitViewPosition
local GetUnitWeaponState = Spring.GetUnitWeaponState
local GiveOrderToUnit = Spring.GiveOrderToUnit
local GetMyTeamID = Spring.GetMyTeamID
local GetGameFrame = Spring.GetGameFrame
local IsReplay = Spring.IsReplay
local GetSpectatingState = Spring.GetSpectatingState
local GetViewGeometry = Spring.GetViewGeometry
local GetTeamUnits = Spring.GetTeamUnits
local GetTimer = Spring.GetTimer
local DiffTimers = Spring.DiffTimers

-- === OPENGL SHORTCUTS (for UI/visual feedback) ===
local glColor = gl.Color
local glRect = gl.Rect
local glText = gl.Text
local glLineWidth = gl.LineWidth
local glDrawGroundCircle = gl.DrawGroundCircle
local glBeginEnd = gl.BeginEnd
local glLineStipple = gl.LineStipple
local GL_LINE_STRIP = GL.LINE_STRIP
local glVertex = gl.Vertex
local TWO_PI = math.pi * 2
local rotationAngle = 0
local lastRotationTimer = GetTimer()
local rotationSpeed = TWO_PI / ROTATION_PERIOD

-- === DATA STRUCTURES ===
local allowedWeapons = {}        -- [unitDefID] = {maxWeaponRange, lowClassWeapon, name, damage}
local unitDefsCached = {}        -- [unitDefID] = {power, name}
local ghostedEnemyData = {}      -- [enemyID] = {power, name} for unseen/ghosted units
local targetData = {}            -- [defenderUnitID] = targetEnemyID
local targetPerEnemy = {}        -- [enemyID] = {isLowClass (bool), assignedCount, damage}
local myDefenders = {}           -- [unitID] = allowedWeapons[unitDefID]
local splitTargetEnabled = false -- Main toggle for widget activity
local desiredSplitTargetState = false
local widgetInitComplete = false

-- === GUI STATE ===
local guiX, guiY = 1000, 500     -- Position of the split-target toggle button
local guiW, guiH = 180, 30       -- Size of the button
local dragging = false
local dragOffsetX, dragOffsetY = 0, 0
local vsx, vsy = 0, 0
local gameStarted = false

local function maybeRemoveSelf()
    if GetSpectatingState() and (GetGameFrame() > 0 or gameStarted) then
        widgetHandler:RemoveWidget()
    end
end


local function ClampGuiToScreen()
    if vsx <= 0 or vsy <= 0 then return end
    local maxX = math.max(0, vsx - guiW)
    local maxY = math.max(0, vsy - guiH)
    if guiX < 0 then
        guiX = 0
    elseif guiX > maxX then
        guiX = maxX
    end
    if guiY < 0 then
        guiY = 0
    elseif guiY > maxY then
        guiY = maxY
    end
end

-- === COROUTINE-BASED TARGET ASSIGNMENT ===
local function PopulateDefenders()
    myDefenders = {}
    local teamUnits = GetTeamUnits(GetMyTeamID())
    if not teamUnits then
        return
    end
    for i = 1, #teamUnits do
        local unitID = teamUnits[i]
        local defID = GetUnitDefID(unitID)
        if allowedWeapons[defID] then
            myDefenders[unitID] = allowedWeapons[defID]
        end
    end
end

local function DisableSplitTargeting()
    for unitID in pairs(myDefenders) do
        GiveOrderToUnit(unitID, CMD_UNIT_CANCEL_TARGET, {}, {})
    end
    myDefenders = {}
    splitTargetEnabled = false
end

local function EnableSplitTargeting()
    splitTargetEnabled = true
    PopulateDefenders()
end

SetSplitTargetState = function(shouldEnable, fromExternal)
    desiredSplitTargetState = shouldEnable and true or false
    local isExternal = fromExternal and true or false

    if shouldEnable then
        if not splitTargetEnabled then
            EnableSplitTargeting()
       end
        if not isExternal and WG and WG.AAPriorityTargeting and WG.AAPriorityTargeting.setState then
            WG.AAPriorityTargeting.setState(false, true)
        end
    else
        if splitTargetEnabled then
            DisableSplitTargeting()
        end
    end

end

function widget:Initialize()
    if IsReplay() or GetGameFrame() > 0 then
        maybeRemoveSelf()
    end
 
    for _, ud in pairs(UnitDefs) do
        local isShield
        local wpRange

        if ud.weapons[1] and ud.weapontype ~= "Shield" then
            for wdefName, value in ud.wDefs[1]:pairs() do
                if wdefName == "isShield" then
                    isShield = value
                end

                if wdefName == "range" then
                    wpRange = value
                end
            end
        end

        if not ud.customParams.iscommander and not ud.canFly and not isShield and ud.weapons[1] and ud.weapons[ud.primaryWeapon] and ud.weapons[ud.primaryWeapon].onlyTargets and ud.weapons[ud.primaryWeapon].onlyTargets.vtol then
            local isLowClass = ud.metalCost < LOW_CLASS_AA_COST
            local mainWeapon = ud.weapons[ud.primaryWeapon]
            local mainWeaponDef = mainWeapon and WeaponDefs[mainWeapon.weaponDef]

            allowedWeapons[ud.id] = {
                maxWeaponRange = wpRange,
                lowClassWeapon = isLowClass,
                name = ud.name,
                damage = mainWeaponDef and mainWeaponDef.damages and mainWeaponDef.damages[1] or 0
            }
        end
    end

    for id, ud in pairs(UnitDefs) do
        if ud.isBomberAirUnit or SPECIAL_BOMBER[ud.name] then
            local cost = ud.metalCost
            local power = math.log(1 + cost / 100, 10) -- Logarithmic scaling of threat

            unitDefsCached[ud.id] = {
                power = power,
                name = ud.name
            }
        end
    end



    local screenW, screenH = GetViewGeometry()

    if screenW and screenH then
        vsx, vsy = screenW, screenH
        ClampGuiToScreen()
    end

    if not WG then
        WG = {}
    end

    WG.SmartAirTarget = {
        setState = function(active, fromExternal)
            SetSplitTargetState(active, fromExternal)
        end,
        getState = function() return splitTargetEnabled end
    }

    widgetInitComplete = true
    SetSplitTargetState(desiredSplitTargetState, true)

    if splitTargetEnabled and WG.AAPriorityTargeting and WG.AAPriorityTargeting.getState and WG.AAPriorityTargeting.getState() then
        SetSplitTargetState(false, true)
    end

end

function widget:GameStart()
    gameStarted = true
    maybeRemoveSelf()
end

function widget:PlayerChanged(playerID)
    maybeRemoveSelf()
end


-- Save GUI position to config
function widget:GetConfigData()
    return { guiX = guiX, guiY = guiY, splitTargetEnabled = splitTargetEnabled }

end

-- Restore GUI position from config
function widget:SetConfigData(data)
    if data.guiX then guiX = data.guiX end
    if data.guiY then guiY = data.guiY end
    if data.splitTargetEnabled ~= nil then
        desiredSplitTargetState = data.splitTargetEnabled and true or false
        if widgetInitComplete then
            SetSplitTargetState(desiredSplitTargetState, true)
        else
           splitTargetEnabled = false
        end
    end
    ClampGuiToScreen()
end



local coroutineCounter = 0 -- Used for batching in coroutine

-- Main function to assign split targets among defenders
local function checkTargets()
    for unitID, def in pairs(myDefenders) do
        -- Yield periodically to avoid lag
        if coroutineCounter % BATCH_SIZE == 0 then
            coroutine.yield()
            coroutineCounter = 0
        end
        coroutineCounter = coroutineCounter + 1

        -- Always clear previous target
        GiveOrderToUnit(unitID, CMD_UNIT_CANCEL_TARGET, {}, {})

        -- Only assign target if weapon is loaded
        local _, isLoaded = GetUnitWeaponState(unitID, 1)
        if isLoaded then
            local range = def.maxWeaponRange * SCAN_RANGE_MULTIPLIER
            local x, y, z = GetUnitPosition(unitID, true, false)
            if x then
                local enemies = {}
                -- Scan for enemy air units in extended range
                for _, enemyID in ipairs(GetUnitsInSphere(x, y, z, range, ENEMY_UNITS)) do
                    local separation = GetUnitSeparation(unitID, enemyID, true)
                    local ud = unitDefsCached[GetUnitDefID(enemyID)]
                    local power = ud and ud.power or (ghostedEnemyData[enemyID] and ghostedEnemyData[enemyID].power or 0)
                    if power > 0 then
                        table.insert(enemies, {power / separation, enemyID, unitID})
                    end
                end

                -- Prioritize most "dangerous and closest" air units
                if #enemies > 0 then
                    table.sort(enemies, function(a, b) return a[1] > b[1] end)
                    for _, entry in ipairs(enemies) do
                        local enemyID = entry[2]
                        local enemyHP = 0
                        if Spring.GetUnitHealth then
                            enemyHP = select(1, Spring.GetUnitHealth(enemyID)) or 0
                        end
                        local declaredDamage = 0
                        if targetPerEnemy[enemyID] then
                            declaredDamage = targetPerEnemy[enemyID].damage or 0
                        end
                        -- Avoid overkill: only assign if enemy isn't already "overkilled"
                        if declaredDamage < enemyHP then
                            if not targetPerEnemy[enemyID] then
                                targetPerEnemy[enemyID] = {def.lowClassWeapon, 1, damage = def.damage}
                            else
                                targetPerEnemy[enemyID][2] = targetPerEnemy[enemyID][2] + 1
                                targetPerEnemy[enemyID].damage = (targetPerEnemy[enemyID].damage or 0) + def.damage
                            end
                            targetData[unitID] = enemyID
                            break
                        end
                    end

                    -- Assign the selected target to this defender
                    if targetData[unitID] then
                        GiveOrderToUnit(unitID, CMD_UNIT_SET_TARGET, {targetData[unitID]}, {})
                    end
                end
            end
        end
    end
    coroutine.yield()
end


-- Coroutine task handle
local myTask = coroutine.create(checkTargets)

-- === SPRING CALLBACKS ===

-- Main update: run coroutine every UPDATE_RATE frames if enabled
function widget:GameFrame(frame)

    if splitTargetEnabled and frame % UPDATE_RATE == 0 then
        coroutine.resume(myTask)
        if coroutine.status(myTask) == "dead" then
            -- Reset state for next round of targeting
            targetPerEnemy = {}
            targetData = {}
            myTask = coroutine.create(checkTargets)
        end
    end
end

-- Remove ghosted enemy data for destroyed units
function widget:Update()
    local now = GetTimer()
    local delta = DiffTimers(now, lastRotationTimer)
    if delta > 0 then
        rotationAngle = (rotationAngle + delta * rotationSpeed) % TWO_PI
        lastRotationTimer = now
    end
    for enemyID in pairs(ghostedEnemyData) do
        if GetUnitIsDead(enemyID) then
            ghostedEnemyData[enemyID] = nil
        end
    end
end

function widget:UnitDestroyed(unitID)
    myDefenders[unitID] = nil
    targetData[unitID] = nil
end

function widget:UnitTaken(unitID)
    myDefenders[unitID] = nil
end

function widget:UnitCreated(unitID, unitDefID, teamID)
    if teamID == GetMyTeamID() and allowedWeapons[unitDefID] and splitTargetEnabled then
        myDefenders[unitID] = allowedWeapons[unitDefID]
    end
end

function widget:UnitGiven(unitID, unitDefID, newTeam, oldTeam)
    if newTeam == GetMyTeamID() and allowedWeapons[unitDefID] and splitTargetEnabled then
        myDefenders[unitID] = allowedWeapons[unitDefID]
    end
end

function widget:DrawScreen()
    -- Draw background and button
    glColor(0, 0, 0, 1)
    glRect(guiX-1, guiY-1, guiX + guiW + 1, guiY + guiH + 1)
    local r, g, b, a =  0.4, 0.1, 0.1, 0.8
    if splitTargetEnabled then r, g, b, a = 0, 0.5, 0, 0.7 end
    glColor(r, g, b, a)
    glRect(guiX, guiY, guiX + guiW, guiY + guiH)
    glColor(1, 1, 1, 0.9)
    glText("Smart Air Targeting: " .. (splitTargetEnabled and "ON" or "OFF"), guiX + 5, guiY + guiH / 2 - 6, 14, "on")
end

-- Handle mouse interaction with the toggle button
function widget:MousePress(x, y, button)
    if x >= guiX and x <= guiX + guiW and y >= guiY and y <= guiY + guiH then
        if button == 2 then
            -- Start dragging the button
            dragging = true
            dragOffsetX = x - guiX
            dragOffsetY = y - guiY
            return true
        elseif button == 1 then
            -- Toggle split targeting
            SetSplitTargetState(not splitTargetEnabled, false)
            return true
        end
    end
end

-- Handle dragging of the GUI button
function widget:MouseMove(x, y, dx, dy, button)
    if dragging then
        guiX = x - dragOffsetX
        guiY = y - dragOffsetY
        ClampGuiToScreen()
    end
end

-- Stop dragging on mouse release
function widget:MouseRelease(x, y, button)
    if button == 2 then dragging = false end
end

function widget:ViewResize(newVsx, newVsy)
    vsx, vsy = newVsx, newVsy
    ClampGuiToScreen()
end

local function Line(a, b)
    glVertex(a[1], a[2], a[3])
    glVertex(b[1], b[2], b[3])
end

local function DrawLine(a, b)
    glLineStipple(false)
    glBeginEnd(GL_LINE_STRIP, Line, a, b)
end

function widget:DrawWorld()
    if not splitTargetEnabled then return end
    local sinRot = math.sin(rotationAngle)
    local cosRot = math.cos(rotationAngle)
    for unitID in pairs(myDefenders) do
        local ux, uy, uz = GetUnitViewPosition(unitID)
        if ux then
            glLineWidth(1)
            glColor(0, 1, 0, 0.4)
            glDrawGroundCircle(ux, uy, uz, DEFENDER_MARK_RADIUS, 6)
            local spinnerHeight = uy + 5
            local innerRadius = DEFENDER_MARK_RADIUS - 8
            local outerRadius = DEFENDER_MARK_RADIUS + 4
            local startX = ux + cosRot * innerRadius
            local startZ = uz + sinRot * innerRadius
            local endX = ux + cosRot * outerRadius
            local endZ = uz + sinRot * outerRadius
            glLineWidth(2)
            glColor(0.6, 1, 0.2, 0.8)
            DrawLine({startX, spinnerHeight, startZ}, {endX, spinnerHeight, endZ})
            -- Mirror side for a balanced spinner
            local oppStartX = ux - cosRot * innerRadius
            local oppStartZ = uz - sinRot * innerRadius
            local oppEndX = ux - cosRot * outerRadius
            local oppEndZ = uz - sinRot * outerRadius
            DrawLine({oppStartX, spinnerHeight, oppStartZ}, {oppEndX, spinnerHeight, oppEndZ})
            if targetData[unitID] then
                local ex, ey, ez = GetUnitViewPosition(targetData[unitID])
                if ex and ey and ez then
                    glLineWidth(3)
                    glColor(1.0, 0.2, 0.0, 0.5)
                    DrawLine({ux, uy, uz}, {ex, ey, ez})
                end
            end
        end
    end
    glLineWidth(1)
    glColor(1, 1, 1, 1)
end

function widget:Shutdown()
    if splitTargetEnabled then
        DisableSplitTargeting()
    else
        myDefenders = {}
    end
    if WG then
        WG.SmartAirTarget = nil
    end
end
