function widget:GetInfo()
    return {
        name = "Split air target manager",
        desc = "To enable select AA and press Alt+Space, to disable deselect any unit and press Alt+Space two times",
        author = "[MOL]Silver",
        version = "1.4",
        date = "25.08.2022",
        license = "GNU GPL, v2 or later",
        layer = 0,
        enabled = false
    }
end

local maxTargetsPerEnemy = 2 -- if "weak" AA
local minPower = 0.040 -- skip t1 air scouts
local rangeMultiplier = 1.25
local CMD_UNIT_SET_TARGET = 34923
local CMD_UNIT_CANCEL_TARGET = 34924
local ENEMY_UNITS = Spring.ENEMY_UNITS
local GetKeyCode = Spring.GetKeyCode
local GetSelectedUnits = Spring.GetSelectedUnits
local GetUnitDefID = Spring.GetUnitDefID
local GetUnitPosition = Spring.GetUnitPosition
local GetUnitSeparation = Spring.GetUnitSeparation
local GetUnitsInSphere = Spring.GetUnitsInSphere
local GetUnitViewPosition = Spring.GetUnitViewPosition
local GetUnitWeaponTestTarget = Spring.GetUnitWeaponTestTarget
local GiveOrderToUnit = Spring.GiveOrderToUnit
local GL_LINE_STRIP = GL.LINE_STRIP
local glBeginEnd = gl.BeginEnd
local glColor = gl.Color
local glDrawGroundCircle = gl.DrawGroundCircle
local glLineStipple = gl.LineStipple
local glLineWidth = gl.LineWidth
local glVertex = gl.Vertex
local allowedWeapons = {}
local ghostedEnemyData = {}
local targetData = {}
local targetPerEnemy = {}
local unitDefsCached = {}
local unitDefsCachedAA = {}
local PriorityTargets


local ArmorDefs = VFS.Include("gamedata/armordefs.lua")
if ArmorDefs.priority_air then
    PriorityTargets = ArmorDefs.priority_air
else
    if ArmorDefs.bombers then
        PriorityTargets = ArmorDefs.bombers
    end
end

function widget:Initialize()
    for index, udefs in pairs(UnitDefs) do
        if udefs.weapons[1] and udefs.weapontype ~= "Shield" then
            local isShield
            for wdefName, value in udefs.wDefs[1]:pairs() do
                if wdefName == "isShield" then
                    isShield = value
                end
            end
            local wNumber = udefs.primaryWeapon
            if udefs.weapons[wNumber].onlyTargets.vtol == true and not isShield and not udefs.isMobileBuilder then
                local isWeak = false
                if udefs.metalCost < 400 then
                    isWeak = true
                end
                allowedWeapons[udefs.id] = {
                    maxWeaponRange = udefs.maxWeaponRange,
                    weakWeapon = isWeak,
                    name = udefs.name
                }
            end
        end
    end
    for id, udefs in ipairs(UnitDefs) do
        if udefs.canFly then
            local cost = udefs.metalCost
            local power = cost / 1000
            for i, name in ipairs(PriorityTargets) do
                if name == udefs.name then
                    power = math.pow(cost / 10, 5)

                end
            end
            unitDefsCached[udefs.id] = {
                power = power
            }
        end
    end
end

local function compare(a, b)
    return a[1] > b[1]
end

local n = 0
function widget:KeyPress(key, modifier, isRepeat)
    if not modifier["alt"] and not isRepeat then
        n = 0
    end
    if key == GetKeyCode("space") and modifier["alt"] and not modifier["shift"] and not modifier["ctrl"] and not isRepeat then
        local SelectedUnits = GetSelectedUnits()
        if #SelectedUnits == 0 then
            n = n + 1
            if n > 1 then
                unitDefsCachedAA = {}
                n = 0
            end
        end
        for _, unitID in pairs(SelectedUnits) do
            local udefid = GetUnitDefID(unitID)
            if not unitDefsCachedAA[unitID] and allowedWeapons[udefid] then
                unitDefsCachedAA[unitID] = allowedWeapons[udefid]
            end
        end
    end
end

function widget:GameFrame(f)
    if f % 12 == 0 then
        targetPerEnemy = {}
        targetData = {}
        checkTargets()
    end
end

function checkTargets()
    for unitID, def in pairs(unitDefsCachedAA) do
        GiveOrderToUnit(unitID, CMD_UNIT_CANCEL_TARGET, {}, {})
        local range = def.maxWeaponRange * rangeMultiplier
        local x, y, z = GetUnitPosition(unitID, true, false)
        local enemyData = {}
        local j = 0
        local k = 0
        if x and y and z then
            local EnemyUnitsInRange = GetUnitsInSphere(x, y, z, range, ENEMY_UNITS)
            for i = 1, #EnemyUnitsInRange do
                local EnemyUnitID = EnemyUnitsInRange[i]
                if targetData[unitID] ~= EnemyUnitID then
                    k = k + 1
                end
                local uidid = GetUnitDefID(EnemyUnitID)
                local udefs = unitDefsCached[uidid]
                if udefs then
                    local power = udefs.power
                    if minPower < power then
                        j = j + 1
                        local separation = GetUnitSeparation(unitID, EnemyUnitID, true)
                        local priority = power / separation
                        enemyData[j] = {priority, EnemyUnitID, unitID}
                        ghostedEnemyData[EnemyUnitID] = {
                            power = power,
                        }
                    end
                else
                    if ghostedEnemyData[EnemyUnitID] then
                        j = j + 1
                        local power = ghostedEnemyData[EnemyUnitID].power
                        local separation = GetUnitSeparation(unitID, EnemyUnitID, true)
                        local priority = power / separation
                        enemyData[j] = {priority, EnemyUnitID, unitID}
                    else
                        local TestTarget = GetUnitWeaponTestTarget(unitID, 1, EnemyUnitID)
                        if TestTarget == true then
                            j = j + 1
                            local separation = GetUnitSeparation(unitID, EnemyUnitID, true)
                            local power = minPower
                            local priority = power / separation
                            enemyData[j] = {priority, EnemyUnitID, unitID}
                        end
                    end
                end
            end
        end
        if j == k then
            targetData[unitID] = nil
        end
        if #enemyData > 0 then
            table.sort(enemyData, compare)
            if def.weakWeapon == false then
                for i, v in pairs(enemyData) do
                    if not targetPerEnemy[v[2]] or targetPerEnemy[v[2]][1] == 0 then
                        targetPerEnemy[v[2]] = {1, 0}
                        if v[3] then
                            targetData[v[3]] = v[2]
                        end
                        break
                    end
                end
            end
            if def.weakWeapon == true then
                for i, v in pairs(enemyData) do
                    if targetPerEnemy[v[2]] == nil then
                        targetPerEnemy[v[2]] = {0, 0}
                    end
                    if targetPerEnemy[v[2]][2] <= maxTargetsPerEnemy then
                        targetPerEnemy[v[2]][2] = targetPerEnemy[v[2]][2] + 1
                        --if not targetData[v[3]] then
                        targetData[v[3]] = v[2]
                        --end
                        break
                    end
                end
            end
            if tonumber(targetData[unitID]) ~= nil then
                GiveOrderToUnit(unitID, CMD_UNIT_SET_TARGET, {targetData[unitID]}, {})
            end
        end
    end
end

function widget:UnitDestroyed(unitID, unitDefID, unitTeam)
    if unitDefsCachedAA[unitID] then
        unitDefsCachedAA[unitID] = nil
        targetData[unitID] = nil
    end

    if ghostedEnemyData[unitID] then
        ghostedEnemyData[unitID] = nil
    end
end

function widget:UnitCreated(unitID, allyTeam)
    if ghostedEnemyData[unitID] then
        ghostedEnemyData[unitID] = nil
    end
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
    for unitID in pairs(unitDefsCachedAA) do
        if unitID then
            local ux, uy, uz = GetUnitViewPosition(unitID)
            if ux and uy and uz then
                glLineWidth(2)
                glColor(1.0, 0.2, 0.0, 0.5)
                glDrawGroundCircle(ux, uy, uz, 50, 3)
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
    end
    glLineWidth(1)
    glColor(1, 1, 1, 1)
end