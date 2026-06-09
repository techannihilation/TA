function gadget:GetInfo()
    return {
        name = "Tornado Spawner",
        desc = "Spawns drifting tornadoes when the tornados modoption is enabled",
        author = "[ur]uncle",
        date = "2026",
        license = "GNU GPL, v2 or later",
        layer = 0,
        enabled = true,
    }
end

local modOptions = (Spring.GetModOptions and Spring.GetModOptions()) or {}
local tornadoOption = modOptions.tornados

local function IsEnabledOption(value)
    if value == true then
        return true
    end
    if value == false or value == nil then
        return false
    end

    local valueType = type(value)
    if valueType == "number" then
        return value ~= 0
    end
    if valueType == "string" then
        local lowerValue = value:lower()
        return lowerValue == "1" or lowerValue == "true" or lowerValue == "yes" or lowerValue == "on"
    end

    return false
end

local tornadoEnabled = IsEnabledOption(tornadoOption)

if not tornadoEnabled then
    return false
end

local FPS = 30
local TORNADO_RADIUS = 960
local TORNADO_MIN_SEPARATION = TORNADO_RADIUS * 2.05
local TORNADO_SPAWN_ATTEMPTS = 64
local TORNADO_SPAWN_EDGE_PADDING = 16
local START_BOX_FULL_MAP_TOLERANCE = TORNADO_SPAWN_EDGE_PADDING
local START_POSITION_SPAWN_CLEARANCE = 1000
local TORNADO_HEIGHT = 4000
local TORNADO_LIFETIME = 45 * FPS
local TORNADO_FUNNEL_TOUCHDOWN = 5 * FPS
local TORNADO_FUNNEL_GROUND_EXPAND = 4 * FPS
local TORNADO_SHRINK_START = 0.60
local TORNADO_MIN_SCALE = 0.25
local SPAWN_INTERVAL = 18 * FPS
local INITIAL_DELAY = 5 * FPS
local MAX_ACTIVE = 3
local TORNADO_DRIFT_MIN_SPEED = 1.5
local TORNADO_DRIFT_MAX_SPEED = 3.0
local TORNADO_DRIFT_MIN_TURN = 5 * FPS
local TORNADO_DRIFT_MAX_TURN = 10 * FPS
local TORNADO_SOUND_VOLUME = 0.85
local UNIT_SCAN_INTERVAL = 5
local UNIT_LIFT_TIME = 5 * FPS
local UNIT_THROW_SPEED = 18
local UNIT_THROW_UP_SPEED = 5
local UNIT_THROW_CLEARANCE = 450
local UNIT_THROW_DISTANCE = TORNADO_RADIUS + UNIT_THROW_CLEARANCE
local UNIT_FALL_GRAVITY = 1.76
local UNIT_GROUND_RELEASE_HEIGHT = 45
local FEATURE_LIFT_TIME = 3 * FPS
local FEATURE_LIFT_HEIGHT_MULT = 1.25
local FEATURE_THROW_SPEED = 30
local FEATURE_THROW_UP_SPEED = 10
local FEATURE_THROW_CLEARANCE = 900
local FEATURE_THROW_DISTANCE = TORNADO_RADIUS + FEATURE_THROW_CLEARANCE
local FEATURE_FALL_GRAVITY = 1.55
local FEATURE_GROUND_RELEASE_HEIGHT = 20
local TORNADO_MOVECTRL_TAG = 27027

local MSG_SPAWN = "map_tornado:spawn"
local MSG_REMOVE = "map_tornado:remove"

local mapX = Game.mapSizeX
local mapZ = Game.mapSizeZ
local minX = TORNADO_SPAWN_EDGE_PADDING
local maxX = math.max(mapX - TORNADO_SPAWN_EDGE_PADDING, minX)
local minZ = TORNADO_SPAWN_EDGE_PADDING
local maxZ = math.max(mapZ - TORNADO_SPAWN_EDGE_PADDING, minZ)

local function GetTornadoScale(tornado, frame)
    local lifetime = math.max((tornado.deathFrame or 0) - (tornado.birthFrame or 0), 1)
    local age = math.min(math.max((frame - (tornado.birthFrame or frame)) / lifetime, 0), 1)
    if age <= TORNADO_SHRINK_START then
        return 1
    end

    local shrinkProgress = (age - TORNADO_SHRINK_START) / math.max(1 - TORNADO_SHRINK_START, 0.001)
    local easedProgress = shrinkProgress * shrinkProgress * (3 - (2 * shrinkProgress))
    return 1 - ((1 - TORNADO_MIN_SCALE) * easedProgress)
end

local function SmoothStep(progress)
    progress = math.min(math.max(progress, 0), 1)
    return progress * progress * (3 - (2 * progress))
end

local function GetTornadoGroundScale(tornado, frame)
    local birthFrame = tornado.birthFrame or frame
    local age = math.max(frame - birthFrame, 0)
    if age <= TORNADO_FUNNEL_TOUCHDOWN then
        return 0
    end
    return SmoothStep((age - TORNADO_FUNNEL_TOUCHDOWN) / TORNADO_FUNNEL_GROUND_EXPAND)
end

local function GetTornadoCaptureRadius(tornado, frame)
    return TORNADO_RADIUS * GetTornadoScale(tornado, frame) * GetTornadoGroundScale(tornado, frame)
end

if gadgetHandler:IsSyncedCode() then
    local DestroyFeature = Spring.DestroyFeature
    local DestroyUnit = Spring.DestroyUnit
    local GetFeatureBlocking = Spring.GetFeatureBlocking
    local GetFeatureDefID = Spring.GetFeatureDefID
    local GetFeaturePosition = Spring.GetFeaturePosition
    local GetFeatureResurrect = Spring.GetFeatureResurrect
    local GetFeaturesInCylinder = Spring.GetFeaturesInCylinder
    local GetAllyTeamList = Spring.GetAllyTeamList
    local GetAllyTeamStartBox = Spring.GetAllyTeamStartBox
    local GetGaiaTeamID = Spring.GetGaiaTeamID
    local GetGroundHeight = Spring.GetGroundHeight
    local GetTeamInfo = Spring.GetTeamInfo
    local GetTeamList = Spring.GetTeamList
    local GetTeamResources = Spring.GetTeamResources
    local GetTeamStartPosition = Spring.GetTeamStartPosition
    local GetUnitDefID = Spring.GetUnitDefID
    local GetUnitIsDead = Spring.GetUnitIsDead
    local GetUnitMetalExtraction = Spring.GetUnitMetalExtraction
    local GetUnitPosition = Spring.GetUnitPosition
    local GetUnitsInCylinder = Spring.GetUnitsInCylinder
    local GiveOrderToUnit = Spring.GiveOrderToUnit
    local SetFeatureBlocking = Spring.SetFeatureBlocking
    local SetFeatureMoveCtrl = Spring.SetFeatureMoveCtrl
    local SetFeaturePosition = Spring.SetFeaturePosition
    local SetFeatureRotation = Spring.SetFeatureRotation
    local SetFeatureVelocity = Spring.SetFeatureVelocity
    local SetUnitRotation = Spring.SetUnitRotation
    local SetUnitVelocity = Spring.SetUnitVelocity
    local ValidFeatureID = Spring.ValidFeatureID
    local ValidUnitID = Spring.ValidUnitID
    local MoveCtrl = Spring.MoveCtrl
    local MoveCtrlDisable = MoveCtrl.Disable
    local MoveCtrlEnable = MoveCtrl.Enable
    local MoveCtrlGetTag = MoveCtrl.GetTag
    local MoveCtrlIsEnabled = MoveCtrl.IsEnabled
    local MoveCtrlSetNoBlocking = MoveCtrl.SetNoBlocking
    local MoveCtrlSetPosition = MoveCtrl.SetPosition
    local MoveCtrlSetRotation = MoveCtrl.SetRotation
    local MoveCtrlSetTag = MoveCtrl.SetTag
    local MoveCtrlSetVelocity = MoveCtrl.SetVelocity

    local atan2 = math.atan2 or function(y, x)
        if x > 0 then
            return math.atan(y / x)
        elseif x < 0 then
            return math.atan(y / x) + ((y >= 0) and math.pi or -math.pi)
        elseif y > 0 then
            return math.pi * 0.5
        elseif y < 0 then
            return -math.pi * 0.5
        end
        return 0
    end

    local sin = math.sin
    local cos = math.cos
    local random = math.random
    local sqrt = math.sqrt
    local min = math.min
    local max = math.max
    local floor = math.floor
    local sort = table.sort
    local pi = math.pi
    local twopi = pi * 2
    local tornadoMinSeparationSq = TORNADO_MIN_SEPARATION * TORNADO_MIN_SEPARATION
    local startPositionSpawnClearance = TORNADO_RADIUS + START_POSITION_SPAWN_CLEARANCE
    local startPositionSpawnClearanceSq = startPositionSpawnClearance * startPositionSpawnClearance

    local activeTornadoes = {}
    local capturedUnits = {}
    local capturedFeatures = {}
    local startBoxes = {}
    local startBoxesByAllyTeam = {}
    local startPositions = {}
    local RESOURCE_ENERGY = "energy"
    local RESOURCE_METAL = "metal"
    local ENERGY_INCOME_WEIGHT = 1.5
    local maxSpawnScoreDistance = sqrt((mapX * mapX) + (mapZ * mapZ))
    local nextTornadoID = 0
    local nextSpawnFrame = INITIAL_DELAY

    local function Random01()
        return random()
    end

    local function ClampToMap(x, z)
        return min(max(x, 16), mapX - 16), min(max(z, 16), mapZ - 16)
    end

    local function Normalize2D(x, z)
        local length = sqrt((x * x) + (z * z))
        if length <= 0 then
            return 1, 0
        end
        return x / length, z / length
    end

    local function FindThrowTarget(tornado, dirX, dirZ, tangentX, tangentZ, throwDistance)
        local bestX, bestZ, bestDistSq, bestDirX, bestDirZ
        throwDistance = throwDistance or UNIT_THROW_DISTANCE
        local candidates = {
            {dirX, dirZ},
            {dirX + tangentX * 0.45, dirZ + tangentZ * 0.45},
            {-dirX, -dirZ},
            {tangentX, tangentZ},
            {-tangentX, -tangentZ},
            {1, 0},
            {-1, 0},
            {0, 1},
            {0, -1},
        }

        for i = 1, #candidates do
            local candidate = candidates[i]
            local nx, nz = Normalize2D(candidate[1], candidate[2])
            local x, z = ClampToMap(tornado.x + nx * throwDistance, tornado.z + nz * throwDistance)
            local dx, dz = x - tornado.x, z - tornado.z
            local distSq = (dx * dx) + (dz * dz)
            if not bestDistSq or distSq > bestDistSq then
                bestX, bestZ, bestDistSq = x, z, distSq
                bestDirX, bestDirZ = Normalize2D(dx, dz)
            end
        end

        return bestX, bestZ, bestDirX, bestDirZ
    end

    local function ActiveCount()
        local count = 0
        for _ in pairs(activeTornadoes) do
            count = count + 1
        end
        return count
    end

    local function IsSeparatedFromActiveTornadoes(x, z)
        for _, tornado in pairs(activeTornadoes) do
            local dx = x - tornado.x
            local dz = z - tornado.z
            if ((dx * dx) + (dz * dz)) < tornadoMinSeparationSq then
                return false
            end
        end
        return true
    end

    local function IsValidStartBoxBounds(xMin, zMin, xMax, zMax)
        return xMin and zMin and xMax and zMax and xMin < xMax and zMin < zMax
    end

    local function IsFullMapStartBox(xMin, zMin, xMax, zMax)
        return xMin <= START_BOX_FULL_MAP_TOLERANCE
            and zMin <= START_BOX_FULL_MAP_TOLERANCE
            and xMax >= (mapX - START_BOX_FULL_MAP_TOLERANCE)
            and zMax >= (mapZ - START_BOX_FULL_MAP_TOLERANCE)
    end

    local function GetValidTeamStartPosition(teamID)
        local x, _, z = GetTeamStartPosition(teamID)
        if x and z and x >= 0 and z >= 0 and x <= mapX and z <= mapZ then
            return x, z
        end
    end

    local function BuildStartPositions()
        startPositions = {}

        local gaiaTeamID = GetGaiaTeamID()
        local teamList = GetTeamList() or {}
        for i = 1, #teamList do
            local teamID = teamList[i]
            if teamID ~= gaiaTeamID then
                local _, _, isDead = GetTeamInfo(teamID, false)
                if isDead ~= true and isDead ~= 1 then
                    local x, z = GetValidTeamStartPosition(teamID)
                    if x and z then
                        startPositions[#startPositions + 1] = {x = x, z = z}
                    end
                end
            end
        end
    end

    local function AllyTeamHasNonGaiaTeam(allyTeamID)
        local gaiaTeamID = GetGaiaTeamID()
        local teamList = GetTeamList(allyTeamID) or {}

        for i = 1, #teamList do
            if teamList[i] ~= gaiaTeamID then
                return true
            end
        end
        return false
    end

    local function BuildStartBoxes()
        startBoxes = {}
        startBoxesByAllyTeam = {}
        BuildStartPositions()

        if not GetAllyTeamList or not GetAllyTeamStartBox then
            return
        end

        local allyTeamList = GetAllyTeamList() or {}
        for i = 1, #allyTeamList do
            local allyTeamID = allyTeamList[i]
            if AllyTeamHasNonGaiaTeam(allyTeamID) then
                local xMin, zMin, xMax, zMax = GetAllyTeamStartBox(allyTeamID)
                if IsValidStartBoxBounds(xMin, zMin, xMax, zMax) and not IsFullMapStartBox(xMin, zMin, xMax, zMax) then
                    local box = {
                        xMin = xMin,
                        zMin = zMin,
                        xMax = xMax,
                        zMax = zMax,
                    }
                    startBoxes[#startBoxes + 1] = box
                    startBoxesByAllyTeam[allyTeamID] = box
                end
            end
        end
    end

    local function RefreshUnboxedStartProtection()
        if #startBoxes == 0 then
            BuildStartBoxes()
        end
    end

    local function DoesTornadoOverlapStartBox(x, z)
        local radiusSq = TORNADO_RADIUS * TORNADO_RADIUS
        for i = 1, #startBoxes do
            local box = startBoxes[i]
            local closestX = min(max(x, box.xMin), box.xMax)
            local closestZ = min(max(z, box.zMin), box.zMax)
            local dx = x - closestX
            local dz = z - closestZ
            if ((dx * dx) + (dz * dz)) <= radiusSq then
                return true
            end
        end
        return false
    end

    local function IsTooCloseToUnboxedStartPosition(x, z)
        if #startBoxes > 0 then
            return false
        end

        for i = 1, #startPositions do
            local startPosition = startPositions[i]
            local dx = x - startPosition.x
            local dz = z - startPosition.z
            if ((dx * dx) + (dz * dz)) <= startPositionSpawnClearanceSq then
                return true
            end
        end
        return false
    end

    local function GetTeamTargetPosition(teamID, allyTeamID)
        local x, z = GetValidTeamStartPosition(teamID)
        if x and z then
            return x, z
        end

        local box = allyTeamID and startBoxesByAllyTeam[allyTeamID]
        if box then
            return (box.xMin + box.xMax) * 0.5, (box.zMin + box.zMax) * 0.5
        end
    end

    local function BuildIncomeTargets()
        local targets = {}
        local totalEnergy = 0
        local totalMetal = 0
        local totalWeight = 0
        local teamList = GetTeamList()
        local gaiaTeamID = GetGaiaTeamID()

        for i = 1, #teamList do
            local teamID = teamList[i]
            if teamID ~= gaiaTeamID then
                local _, _, isDead, _, _, allyTeamID = GetTeamInfo(teamID, false)
                if isDead ~= true and isDead ~= 1 then
                    local x, z = GetTeamTargetPosition(teamID, allyTeamID)
                    if x and z then
                        local _, _, _, energyIncome = GetTeamResources(teamID, RESOURCE_ENERGY)
                        local _, _, _, metalIncome = GetTeamResources(teamID, RESOURCE_METAL)
                        energyIncome = max(tonumber(energyIncome) or 0, 0)
                        metalIncome = max(tonumber(metalIncome) or 0, 0)

                        targets[#targets + 1] = {
                            x = x,
                            z = z,
                            energyIncome = energyIncome,
                            metalIncome = metalIncome,
                        }
                        totalEnergy = totalEnergy + energyIncome
                        totalMetal = totalMetal + metalIncome
                    end
                end
            end
        end

        for i = 1, #targets do
            local target = targets[i]
            local weight = 0
            if totalMetal > 0 then
                weight = weight + (target.metalIncome / totalMetal)
            end
            if totalEnergy > 0 then
                weight = weight + ((target.energyIncome / totalEnergy) * ENERGY_INCOME_WEIGHT)
            end
            target.weight = weight
            totalWeight = totalWeight + weight
        end

        return targets, totalWeight
    end

    local function ScoreSpawnPosition(x, z, targets, totalWeight)
        if totalWeight <= 0 then
            return Random01() * 0.001
        end

        local score = 0
        for i = 1, #targets do
            local target = targets[i]
            if target.weight and target.weight > 0 then
                local dx = x - target.x
                local dz = z - target.z
                local distance = sqrt((dx * dx) + (dz * dz))
                local closeness = 1 - min(distance / maxSpawnScoreDistance, 1)
                score = score + (target.weight * closeness * closeness)
            end
        end

        return score
    end

    local function IsValidSpawnPoint(x, z)
        return not DoesTornadoOverlapStartBox(x, z)
            and not IsTooCloseToUnboxedStartPosition(x, z)
            and IsSeparatedFromActiveTornadoes(x, z)
    end

    local function PickAdaptiveSpawnPosition()
        local targets, totalWeight = BuildIncomeTargets()
        local bestX, bestZ, bestScore

        for _ = 1, TORNADO_SPAWN_ATTEMPTS do
            local x = minX + (Random01() * (maxX - minX))
            local z = minZ + (Random01() * (maxZ - minZ))
            if IsValidSpawnPoint(x, z) then
                local score = ScoreSpawnPosition(x, z, targets, totalWeight) + (Random01() * 0.001)
                if not bestScore or score > bestScore then
                    bestX = x
                    bestZ = z
                    bestScore = score
                end
            end
        end

        return bestX, bestZ
    end

    local function ClampToTornadoBand(x, z)
        return min(max(x, minX), maxX), min(max(z, minZ), maxZ)
    end

    local function SetTornadoDrift(tornado, frame)
        local angle = Random01() * twopi
        local dirX = cos(angle)
        local dirZ = sin(angle)
        local edgePadding = TORNADO_RADIUS * 0.3

        if tornado.x <= minX + edgePadding and dirX < 0 then
            dirX = -dirX
        elseif tornado.x >= maxX - edgePadding and dirX > 0 then
            dirX = -dirX
        end

        if tornado.z <= minZ + edgePadding and dirZ < 0 then
            dirZ = -dirZ
        elseif tornado.z >= maxZ - edgePadding and dirZ > 0 then
            dirZ = -dirZ
        end

        local speed = TORNADO_DRIFT_MIN_SPEED + (Random01() * (TORNADO_DRIFT_MAX_SPEED - TORNADO_DRIFT_MIN_SPEED))
        tornado.velX = dirX * speed
        tornado.velZ = dirZ * speed
        tornado.nextDriftTurnFrame = frame + TORNADO_DRIFT_MIN_TURN + floor(Random01() * (TORNADO_DRIFT_MAX_TURN - TORNADO_DRIFT_MIN_TURN))
    end

    local function NudgeTornadoVelocityApart(tornadoA, tornadoB, sepX, sepZ)
        local nudgeSpeed = TORNADO_DRIFT_MIN_SPEED * 0.5
        local velAX = tornadoA.velX or 0
        local velAZ = tornadoA.velZ or 0
        local velBX = tornadoB.velX or 0
        local velBZ = tornadoB.velZ or 0
        local dotA = (velAX * sepX) + (velAZ * sepZ)
        local dotB = (velBX * sepX) + (velBZ * sepZ)

        if dotA > -nudgeSpeed then
            tornadoA.velX = velAX - (sepX * (dotA + nudgeSpeed))
            tornadoA.velZ = velAZ - (sepZ * (dotA + nudgeSpeed))
        end
        if dotB < nudgeSpeed then
            tornadoB.velX = velBX + (sepX * (nudgeSpeed - dotB))
            tornadoB.velZ = velBZ + (sepZ * (nudgeSpeed - dotB))
        end
    end

    local function SeparateActiveTornadoes()
        local tornadoIDs = {}
        for tornadoID in pairs(activeTornadoes) do
            tornadoIDs[#tornadoIDs + 1] = tornadoID
        end
        sort(tornadoIDs)

        for i = 1, #tornadoIDs - 1 do
            local tornadoA = activeTornadoes[tornadoIDs[i]]
            for j = i + 1, #tornadoIDs do
                local tornadoB = activeTornadoes[tornadoIDs[j]]
                if tornadoA and tornadoB then
                    local dx = tornadoB.x - tornadoA.x
                    local dz = tornadoB.z - tornadoA.z
                    local distSq = (dx * dx) + (dz * dz)

                    if distSq < tornadoMinSeparationSq then
                        local sepX, sepZ, dist
                        if distSq > 0.001 then
                            dist = sqrt(distSq)
                            sepX = dx / dist
                            sepZ = dz / dist
                        else
                            local angle = ((tornadoA.id * 37 + tornadoB.id * 53) % 360) * pi / 180
                            sepX = cos(angle)
                            sepZ = sin(angle)
                            dist = 0
                        end

                        local push = (TORNADO_MIN_SEPARATION - dist) * 0.5
                        tornadoA.x, tornadoA.z = ClampToTornadoBand(tornadoA.x - (sepX * push), tornadoA.z - (sepZ * push))
                        tornadoB.x, tornadoB.z = ClampToTornadoBand(tornadoB.x + (sepX * push), tornadoB.z + (sepZ * push))
                        tornadoA.y = GetGroundHeight(tornadoA.x, tornadoA.z) or tornadoA.y
                        tornadoB.y = GetGroundHeight(tornadoB.x, tornadoB.z) or tornadoB.y
                        NudgeTornadoVelocityApart(tornadoA, tornadoB, sepX, sepZ)
                    end
                end
            end
        end
    end

    local function UpdateTornadoDrift(frame)
        for _, tornado in pairs(activeTornadoes) do
            if frame >= (tornado.nextDriftTurnFrame or 0) then
                SetTornadoDrift(tornado, frame)
            end

            local x = tornado.x + (tornado.velX or 0)
            local z = tornado.z + (tornado.velZ or 0)

            if x < minX then
                x = minX
                tornado.velX = max(-(tornado.velX or 0), TORNADO_DRIFT_MIN_SPEED)
            elseif x > maxX then
                x = maxX
                tornado.velX = min(-(tornado.velX or 0), -TORNADO_DRIFT_MIN_SPEED)
            end

            if z < minZ then
                z = minZ
                tornado.velZ = max(-(tornado.velZ or 0), TORNADO_DRIFT_MIN_SPEED)
            elseif z > maxZ then
                z = maxZ
                tornado.velZ = min(-(tornado.velZ or 0), -TORNADO_DRIFT_MIN_SPEED)
            end

            tornado.x = x
            tornado.z = z
            tornado.y = GetGroundHeight(x, z) or tornado.y
        end

        SeparateActiveTornadoes()

        _G.mapTornadoes = activeTornadoes
    end

    local function CanCaptureUnit(unitID, frame)
        if capturedUnits[unitID] then
            return false
        end
        if ValidUnitID and not ValidUnitID(unitID) then
            return false
        end
        if GetUnitIsDead(unitID) then
            return false
        end
        if MoveCtrlIsEnabled and MoveCtrlIsEnabled(unitID) then
            local tag = MoveCtrlGetTag and MoveCtrlGetTag(unitID)
            return tag == TORNADO_MOVECTRL_TAG
        end
        return true
    end

    local function CanCaptureFeature(featureID)
        if capturedFeatures[featureID] then
            return false
        end
        if ValidFeatureID and not ValidFeatureID(featureID) then
            return false
        end
        return true
    end

    local function IsUnitWreckFeature(featureID)
        if GetFeatureResurrect then
            local resurrectName = GetFeatureResurrect(featureID)
            if resurrectName and resurrectName ~= "" then
                return true
            end
        end

        local featureDefID = GetFeatureDefID and GetFeatureDefID(featureID)
        local featureDef = featureDefID and FeatureDefs and FeatureDefs[featureDefID]
        if not featureDef then
            return false
        end

        local name = (featureDef.name or featureDef.object or ""):lower()
        local description = (featureDef.description or featureDef.tooltip or ""):lower()
        return name:find("wreck", 1, true) ~= nil
            or name:find("heap", 1, true) ~= nil
            or name:find("debris", 1, true) ~= nil
            or name:find("_dead", 1, true) ~= nil
            or name:find("dead_", 1, true) ~= nil
            or description:find("wreck", 1, true) ~= nil
            or description:find("heap", 1, true) ~= nil
            or description:find("debris", 1, true) ~= nil
    end

    local function DisableTornadoMoveCtrl(unitID)
        if MoveCtrlSetNoBlocking then
            MoveCtrlSetNoBlocking(unitID, false)
        end
        MoveCtrlSetTag(unitID, 0)
        MoveCtrlDisable(unitID)
    end

    local function AbortCapturedUnit(unitID)
        local data = capturedUnits[unitID]
        if not data then
            return
        end

        capturedUnits[unitID] = nil

        if ValidUnitID and not ValidUnitID(unitID) then
            return
        end
        if GetUnitIsDead(unitID) then
            return
        end

        DisableTornadoMoveCtrl(unitID)
    end

    local function RestoreFeatureBlocking(featureID, data)
        if not SetFeatureBlocking or not data or not data.blocking then
            return
        end

        local blocking = data.blocking
        SetFeatureBlocking(
            featureID,
            blocking[1],
            blocking[2],
            blocking[3],
            blocking[4],
            blocking[5],
            blocking[6],
            blocking[7]
        )
    end

    local function DisableFeatureMove(featureID, data)
        if SetFeatureMoveCtrl then
            SetFeatureMoveCtrl(featureID, false, 1, 1, 1, 1, 1, 1, 1, 1, 1)
        end
        RestoreFeatureBlocking(featureID, data)
    end

    local function ShouldDestroyUnitAfterFall(unitID)
        local unitDefID = GetUnitDefID and GetUnitDefID(unitID)
        local unitDef = unitDefID and UnitDefs and UnitDefs[unitDefID]
        if unitDef and unitDef.needGeo then
            return true
        end
        if unitDef and (unitDef.extractsMetal or 0) > 0 then
            return true
        end
        if GetUnitMetalExtraction then
            local metalExtraction = GetUnitMetalExtraction(unitID)
            return metalExtraction and metalExtraction > 0
        end
        return false
    end

    local function AbortCapturedFeature(featureID)
        local data = capturedFeatures[featureID]
        if not data then
            return
        end

        capturedFeatures[featureID] = nil

        if ValidFeatureID and not ValidFeatureID(featureID) then
            return
        end

        DisableFeatureMove(featureID, data)
    end

    local function FinishFallingUnit(unitID, data, frame)
        capturedUnits[unitID] = nil

        if ValidUnitID and not ValidUnitID(unitID) then
            return
        end
        if GetUnitIsDead(unitID) then
            return
        end

        local x = data.currentX
        local z = data.currentZ
        local groundY = (x and z and GetGroundHeight(x, z)) or data.currentY or 0
        local y = max(data.currentY or groundY, groundY + UNIT_GROUND_RELEASE_HEIGHT)
        local velX = data.velX or 0
        local velY = min(data.velY or -1, -1)
        local velZ = data.velZ or 0

        if x and z then
            x, z = ClampToMap(x, z)
            MoveCtrlSetPosition(unitID, x, y, z)
        end

        MoveCtrlSetVelocity(unitID, velX, velY, velZ)
        if MoveCtrlSetRotation then
            MoveCtrlSetRotation(unitID, data.rotPitch or 0, data.rotYaw or 0, data.rotRoll or 0)
        end
        DisableTornadoMoveCtrl(unitID)
        if SetUnitRotation then
            SetUnitRotation(unitID, data.rotPitch or 0, data.rotYaw or 0, data.rotRoll or 0)
        end
        if SetUnitVelocity then
            SetUnitVelocity(unitID, velX, velY, velZ)
        end

        if DestroyUnit and ShouldDestroyUnitAfterFall(unitID) then
            DestroyUnit(unitID, true, false)
        end
    end

    local function FinishFallingFeature(featureID, data)
        capturedFeatures[featureID] = nil

        if ValidFeatureID and not ValidFeatureID(featureID) then
            return
        end

        local x = data.currentX
        local z = data.currentZ
        local groundY = (x and z and GetGroundHeight(x, z)) or data.currentY or 0
        local y = max(data.currentY or groundY, groundY + FEATURE_GROUND_RELEASE_HEIGHT)
        local velX = data.velX or 0
        local velY = min(data.velY or -1, -1)
        local velZ = data.velZ or 0

        if x and z and SetFeaturePosition then
            x, z = ClampToMap(x, z)
            SetFeaturePosition(featureID, x, y, z, false)
        end

        DisableFeatureMove(featureID, data)
        if SetFeatureVelocity then
            SetFeatureVelocity(featureID, velX, velY, velZ)
        end

        if DestroyFeature and not IsUnitWreckFeature(featureID) then
            DestroyFeature(featureID)
        end
    end

    local function StartThrownFall(unitID, data, tornado)
        if ValidUnitID and not ValidUnitID(unitID) then
            capturedUnits[unitID] = nil
            return
        end
        if GetUnitIsDead(unitID) then
            capturedUnits[unitID] = nil
            return
        end

        local dirX = data.throwDirX or cos(data.angle or 0)
        local dirZ = data.throwDirZ or sin(data.angle or 0)
        local tangentX = data.tangentX or -dirZ
        local tangentZ = data.tangentZ or dirX
        local targetX, targetZ
        if tornado then
            targetX, targetZ, dirX, dirZ = FindThrowTarget(tornado, dirX, dirZ, tangentX, tangentZ)
            tangentX, tangentZ = -dirZ, dirX
        else
            dirX, dirZ = Normalize2D(dirX, dirZ)
            targetX, targetZ = ClampToMap(
                (data.currentX or 0) + (dirX * UNIT_THROW_DISTANCE),
                (data.currentZ or 0) + (dirZ * UNIT_THROW_DISTANCE)
            )
        end

        local x = data.currentX
        local y = data.currentY
        local z = data.currentZ
        if not x or not y or not z or not targetX or not targetZ then
            FinishFallingUnit(unitID, data)
            return
        end

        local groundY = GetGroundHeight(targetX, targetZ) or GetGroundHeight(x, z) or 0
        local fallDistance = max(y - groundY, 200)
        local fallFrames = max(45, sqrt((2 * fallDistance) / UNIT_FALL_GRAVITY))
        local velX = (targetX - x) / fallFrames
        local velZ = (targetZ - z) / fallFrames
        local horizontalSpeed = sqrt((velX * velX) + (velZ * velZ))
        if horizontalSpeed < UNIT_THROW_SPEED then
            local speedScale = UNIT_THROW_SPEED / max(horizontalSpeed, 0.001)
            velX = velX * speedScale
            velZ = velZ * speedScale
        end
        local velY = UNIT_THROW_UP_SPEED + ((data.lastProgress or 1) * 2)

        if x and y and z then
            x, z = ClampToMap(x, z)
            MoveCtrlSetPosition(unitID, x, y, z)
        end

        data.state = "fall"
        data.currentX = x
        data.currentY = y
        data.currentZ = z
        data.velX = velX
        data.velY = velY
        data.velZ = velZ
        data.fallFrame = 0

        MoveCtrlSetVelocity(unitID, velX, velY, velZ)
    end

    local function StartThrownFeatureFall(featureID, data, tornado)
        if ValidFeatureID and not ValidFeatureID(featureID) then
            capturedFeatures[featureID] = nil
            return
        end

        local dirX = data.throwDirX or cos(data.angle or 0)
        local dirZ = data.throwDirZ or sin(data.angle or 0)
        local tangentX = data.tangentX or -dirZ
        local tangentZ = data.tangentZ or dirX
        local targetX, targetZ
        if tornado then
            targetX, targetZ, dirX, dirZ = FindThrowTarget(tornado, dirX, dirZ, tangentX, tangentZ, FEATURE_THROW_DISTANCE)
            tangentX, tangentZ = -dirZ, dirX
        else
            dirX, dirZ = Normalize2D(dirX, dirZ)
            targetX, targetZ = ClampToMap(
                (data.currentX or 0) + (dirX * FEATURE_THROW_DISTANCE),
                (data.currentZ or 0) + (dirZ * FEATURE_THROW_DISTANCE)
            )
        end

        local x = data.currentX
        local y = data.currentY
        local z = data.currentZ
        if not x or not y or not z or not targetX or not targetZ then
            FinishFallingFeature(featureID, data)
            return
        end

        local groundY = GetGroundHeight(targetX, targetZ) or GetGroundHeight(x, z) or 0
        local fallDistance = max(y - groundY, 200)
        local fallFrames = max(35, sqrt((2 * fallDistance) / FEATURE_FALL_GRAVITY))
        local velX = (targetX - x) / fallFrames
        local velZ = (targetZ - z) / fallFrames
        local horizontalSpeed = sqrt((velX * velX) + (velZ * velZ))
        if horizontalSpeed < FEATURE_THROW_SPEED then
            local speedScale = FEATURE_THROW_SPEED / max(horizontalSpeed, 0.001)
            velX = velX * speedScale
            velZ = velZ * speedScale
        end
        local velY = FEATURE_THROW_UP_SPEED + ((data.lastProgress or 1) * 4)

        if x and y and z and SetFeaturePosition then
            x, z = ClampToMap(x, z)
            SetFeaturePosition(featureID, x, y, z, false)
        end

        data.state = "fall"
        data.currentX = x
        data.currentY = y
        data.currentZ = z
        data.velX = velX
        data.velY = velY
        data.velZ = velZ
        data.fallFrame = 0

        if SetFeatureVelocity then
            SetFeatureVelocity(featureID, velX, velY, velZ)
        end
    end

    local function UpdateThrownFall(unitID, data)
        data.fallFrame = (data.fallFrame or 0) + 1
        data.velY = (data.velY or 0) - UNIT_FALL_GRAVITY

        local x = (data.currentX or 0) + (data.velX or 0)
        local y = (data.currentY or 0) + data.velY
        local z = (data.currentZ or 0) + (data.velZ or 0)
        x, z = ClampToMap(x, z)

        local groundY = GetGroundHeight(x, z) or 0
        data.currentX = x
        data.currentY = y
        data.currentZ = z
        local rotation = (data.fallFrame or 0) * 0.22
        data.rotPitch = sin(rotation) * 1.2
        data.rotYaw = rotation
        data.rotRoll = cos(rotation) * 1.2

        if y <= groundY + UNIT_GROUND_RELEASE_HEIGHT and data.velY <= 0 then
            data.currentY = groundY + UNIT_GROUND_RELEASE_HEIGHT
            FinishFallingUnit(unitID, data, frame)
            return
        end

        MoveCtrlSetPosition(unitID, x, y, z)
        MoveCtrlSetVelocity(unitID, data.velX or 0, data.velY or 0, data.velZ or 0)
        if MoveCtrlSetRotation then
            MoveCtrlSetRotation(unitID, data.rotPitch, data.rotYaw, data.rotRoll)
        end
    end

    local function UpdateThrownFeatureFall(featureID, data)
        data.fallFrame = (data.fallFrame or 0) + 1
        data.velY = (data.velY or 0) - FEATURE_FALL_GRAVITY

        local x = (data.currentX or 0) + (data.velX or 0)
        local y = (data.currentY or 0) + data.velY
        local z = (data.currentZ or 0) + (data.velZ or 0)
        x, z = ClampToMap(x, z)

        local groundY = GetGroundHeight(x, z) or 0
        data.currentX = x
        data.currentY = y
        data.currentZ = z

        if y <= groundY + FEATURE_GROUND_RELEASE_HEIGHT and data.velY <= 0 then
            data.currentY = groundY + FEATURE_GROUND_RELEASE_HEIGHT
            FinishFallingFeature(featureID, data)
            return
        end

        if SetFeaturePosition then
            SetFeaturePosition(featureID, x, y, z, false)
        end
        if SetFeatureVelocity then
            SetFeatureVelocity(featureID, data.velX or 0, data.velY or 0, data.velZ or 0)
        end
        if SetFeatureRotation then
            local roll = (data.fallFrame or 0) * 0.34
            SetFeatureRotation(featureID, sin(roll) * 1.4, roll, cos(roll) * 1.4)
        end
    end

    local function ReleaseCapturedUnitsForTornado(tornadoID, frame)
        for unitID, data in pairs(capturedUnits) do
            if data.tornadoID == tornadoID and data.state ~= "fall" then
                StartThrownFall(unitID, data, activeTornadoes[tornadoID])
            end
        end
    end

    local function ReleaseCapturedFeaturesForTornado(tornadoID, frame)
        for featureID, data in pairs(capturedFeatures) do
            if data.tornadoID == tornadoID and data.state ~= "fall" then
                StartThrownFeatureFall(featureID, data, activeTornadoes[tornadoID])
            end
        end
    end

    local function RemoveExpired(frame)
        for tornadoID, data in pairs(activeTornadoes) do
            if frame >= data.deathFrame then
                ReleaseCapturedUnitsForTornado(tornadoID, frame)
                ReleaseCapturedFeaturesForTornado(tornadoID, frame)
                activeTornadoes[tornadoID] = nil
                SendToUnsynced(MSG_REMOVE, tornadoID)
            end
        end
        _G.mapTornadoes = activeTornadoes
    end

    local function SpawnTornado(frame)
        RefreshUnboxedStartProtection()

        local x, z = PickAdaptiveSpawnPosition()
        if not x or not z then
            return
        end

        nextTornadoID = nextTornadoID + 1

        local y = GetGroundHeight(x, z) or 0
        local deathFrame = frame + TORNADO_LIFETIME
        local phase = Random01() * math.pi * 2

        local tornadoData = {
            id = nextTornadoID,
            x = x,
            y = y,
            z = z,
            birthFrame = frame,
            deathFrame = deathFrame,
            phase = phase,
        }
        SetTornadoDrift(tornadoData, frame)

        activeTornadoes[nextTornadoID] = tornadoData
        _G.mapTornadoes = activeTornadoes

        SendToUnsynced(MSG_SPAWN, tornadoData)
    end

    local function CaptureUnit(unitID, tornado, frame)
        if not CanCaptureUnit(unitID, frame) then
            return
        end

        local ux, uy, uz = GetUnitPosition(unitID)
        if not ux or not uz then
            return
        end

        local dx = ux - tornado.x
        local dz = uz - tornado.z
        local dist = sqrt((dx * dx) + (dz * dz))
        local tornadoScale = GetTornadoScale(tornado, frame)
        local activeRadius = GetTornadoCaptureRadius(tornado, frame)
        if dist > activeRadius then
            return
        end

        local angle = (dist > 1) and atan2(dz, dx) or (Random01() * twopi)
        local groundY = GetGroundHeight(ux, uz) or uy or tornado.y
        local orbitRadius = min(max(dist, activeRadius * 0.22), activeRadius * 0.74)
        local spinSpeed = 0.085 + (Random01() * 0.03)

        MoveCtrlEnable(unitID)
        MoveCtrlSetTag(unitID, TORNADO_MOVECTRL_TAG)
        if MoveCtrlSetNoBlocking then
            MoveCtrlSetNoBlocking(unitID, true)
        end
        MoveCtrlSetVelocity(unitID, 0, 0, 0)

        capturedUnits[unitID] = {
            tornadoID = tornado.id,
            startFrame = frame,
            baseAngle = angle,
            angle = angle,
            orbitRadius = orbitRadius,
            spinSpeed = spinSpeed,
            groundY = groundY,
            currentX = ux,
            currentY = uy or groundY,
            currentZ = uz,
            lastProgress = 0,
        }
    end

    local function CaptureFeature(featureID, tornado, frame)
        if not CanCaptureFeature(featureID) then
            return
        end

        local fx, fy, fz = GetFeaturePosition(featureID)
        if not fx or not fz then
            return
        end

        local dx = fx - tornado.x
        local dz = fz - tornado.z
        local dist = sqrt((dx * dx) + (dz * dz))
        local tornadoScale = GetTornadoScale(tornado, frame)
        local activeRadius = GetTornadoCaptureRadius(tornado, frame)
        if dist > activeRadius then
            return
        end

        local angle = (dist > 1) and atan2(dz, dx) or (Random01() * twopi)
        local groundY = GetGroundHeight(fx, fz) or fy or tornado.y
        local orbitRadius = min(max(dist, activeRadius * 0.16), activeRadius * 0.86)
        local spinSpeed = 0.13 + (Random01() * 0.05)
        local blocking = nil

        if GetFeatureBlocking then
            blocking = {GetFeatureBlocking(featureID)}
        end
        if SetFeatureMoveCtrl then
            SetFeatureMoveCtrl(featureID, true, 0, 0, 0, 0, 0, 0)
        end
        if SetFeatureBlocking then
            SetFeatureBlocking(featureID, false, false, false, false, nil, nil, nil)
        end
        if SetFeatureVelocity then
            SetFeatureVelocity(featureID, 0, 0, 0)
        end

        capturedFeatures[featureID] = {
            tornadoID = tornado.id,
            startFrame = frame,
            baseAngle = angle,
            angle = angle,
            orbitRadius = orbitRadius,
            spinSpeed = spinSpeed,
            groundY = groundY,
            currentX = fx,
            currentY = fy or groundY,
            currentZ = fz,
            lastProgress = 0,
            blocking = blocking,
        }
    end

    local function ScanTornadoUnits(frame)
        if (frame % UNIT_SCAN_INTERVAL) ~= 0 then
            return
        end

        for _, tornado in pairs(activeTornadoes) do
            local activeRadius = GetTornadoCaptureRadius(tornado, frame)
            if activeRadius > 0 then
                local units = GetUnitsInCylinder(tornado.x, tornado.z, activeRadius)
                for i = 1, #units do
                    CaptureUnit(units[i], tornado, frame)
                end
            end
        end
    end

    local function ScanTornadoFeatures(frame)
        if (frame % UNIT_SCAN_INTERVAL) ~= 0 then
            return
        end

        for _, tornado in pairs(activeTornadoes) do
            local activeRadius = GetTornadoCaptureRadius(tornado, frame)
            if activeRadius > 0 then
                local features = GetFeaturesInCylinder(tornado.x, tornado.z, activeRadius)
                for i = 1, #features do
                    CaptureFeature(features[i], tornado, frame)
                end
            end
        end
    end

    local function UpdateCapturedUnits(frame)
        for unitID, data in pairs(capturedUnits) do
            local tornado = activeTornadoes[data.tornadoID]
            if (ValidUnitID and not ValidUnitID(unitID)) or GetUnitIsDead(unitID) then
                AbortCapturedUnit(unitID)
            elseif data.state == "fall" then
                UpdateThrownFall(unitID, data)
            elseif not tornado then
                StartThrownFall(unitID, data, nil)
            else
                local tornadoScale = GetTornadoScale(tornado, frame)
                local activeHeight = TORNADO_HEIGHT * tornadoScale
                local progress = min((frame - data.startFrame) / UNIT_LIFT_TIME, 1)
                local easedProgress = progress * progress * (3 - (2 * progress))
                local angle = data.baseAngle + ((frame - data.startFrame) * data.spinSpeed)
                local radius = data.orbitRadius * (1 - (easedProgress * 0.38))
                local wobble = sin((frame * 0.21) + unitID) * (TORNADO_RADIUS * tornadoScale * 0.025)
                local x = tornado.x + (cos(angle) * (radius + wobble))
                local y = data.groundY + (activeHeight * easedProgress)
                local z = tornado.z + (sin(angle) * (radius + wobble))
                local dirX = cos(angle)
                local dirZ = sin(angle)

                x, z = ClampToMap(x, z)
                data.currentX = x
                data.currentY = y
                data.currentZ = z
                data.angle = angle
                data.lastProgress = progress
                data.throwDirX = dirX
                data.throwDirZ = dirZ
                data.tangentX = -dirZ
                data.tangentZ = dirX

                MoveCtrlSetPosition(unitID, x, y, z)
                MoveCtrlSetVelocity(unitID, 0, 0, 0)
                if MoveCtrlSetRotation then
                    MoveCtrlSetRotation(unitID, sin(angle) * 0.9, angle, cos(angle) * 0.9)
                end

                if progress >= 1 then
                    StartThrownFall(unitID, data, tornado)
                end
            end
        end
    end

    local function UpdateCapturedFeatures(frame)
        for featureID, data in pairs(capturedFeatures) do
            local tornado = activeTornadoes[data.tornadoID]
            if ValidFeatureID and not ValidFeatureID(featureID) then
                AbortCapturedFeature(featureID)
            elseif data.state == "fall" then
                UpdateThrownFeatureFall(featureID, data)
            elseif not tornado then
                StartThrownFeatureFall(featureID, data, nil)
            else
                local tornadoScale = GetTornadoScale(tornado, frame)
                local activeHeight = TORNADO_HEIGHT * tornadoScale * FEATURE_LIFT_HEIGHT_MULT
                local progress = min((frame - data.startFrame) / FEATURE_LIFT_TIME, 1)
                local easedProgress = progress * progress * (3 - (2 * progress))
                local angle = data.baseAngle + ((frame - data.startFrame) * data.spinSpeed)
                local radius = data.orbitRadius * (1 - (easedProgress * 0.48))
                local wobble = sin((frame * 0.29) + featureID) * (TORNADO_RADIUS * tornadoScale * 0.04)
                local x = tornado.x + (cos(angle) * (radius + wobble))
                local y = data.groundY + (activeHeight * easedProgress)
                local z = tornado.z + (sin(angle) * (radius + wobble))
                local dirX = cos(angle)
                local dirZ = sin(angle)

                x, z = ClampToMap(x, z)
                data.currentX = x
                data.currentY = y
                data.currentZ = z
                data.angle = angle
                data.lastProgress = progress
                data.throwDirX = dirX
                data.throwDirZ = dirZ
                data.tangentX = -dirZ
                data.tangentZ = dirX

                if SetFeaturePosition then
                    SetFeaturePosition(featureID, x, y, z, false)
                end
                if SetFeatureVelocity then
                    SetFeatureVelocity(featureID, 0, 0, 0)
                end
                if SetFeatureRotation then
                    SetFeatureRotation(featureID, sin(angle) * 1.2, angle, cos(angle) * 1.2)
                end

                if progress >= 1 then
                    StartThrownFeatureFall(featureID, data, tornado)
                end
            end
        end
    end

    function gadget:Initialize()
        activeTornadoes = {}
        capturedUnits = {}
        capturedFeatures = {}
        BuildStartBoxes()
        _G.mapTornadoes = activeTornadoes
    end

    function gadget:GameFrame(frame)
        RemoveExpired(frame)
        UpdateTornadoDrift(frame)
        UpdateCapturedUnits(frame)
        UpdateCapturedFeatures(frame)
        ScanTornadoUnits(frame)
        ScanTornadoFeatures(frame)

        if frame >= nextSpawnFrame then
            if ActiveCount() < MAX_ACTIVE then
                SpawnTornado(frame)
            end
            nextSpawnFrame = frame + SPAWN_INTERVAL
        end
    end

    function gadget:UnitDestroyed(unitID)
        capturedUnits[unitID] = nil
    end

    function gadget:FeatureDestroyed(featureID)
        capturedFeatures[featureID] = nil
    end

    function gadget:Shutdown()
        for unitID in pairs(capturedUnits) do
            if ValidUnitID and ValidUnitID(unitID) and not GetUnitIsDead(unitID) then
                if MoveCtrlSetNoBlocking then
                    MoveCtrlSetNoBlocking(unitID, false)
                end
                MoveCtrlSetTag(unitID, 0)
                MoveCtrlDisable(unitID)
            end
        end
        for featureID, data in pairs(capturedFeatures) do
            if ValidFeatureID and ValidFeatureID(featureID) then
                DisableFeatureMove(featureID, data)
            end
        end
    end

else
    local GetGameFrame = Spring.GetGameFrame
    local GetGroundHeight = Spring.GetGroundHeight
    local PlaySoundFile = Spring.PlaySoundFile

    local glBlending = gl.Blending
    local glCreateShader = gl.CreateShader
    local glCulling = gl.Culling
    local glDeleteShader = gl.DeleteShader
    local glDepthMask = gl.DepthMask
    local glDepthTest = gl.DepthTest
    local glGetShaderLog = gl.GetShaderLog
    local glGetUniformLocation = gl.GetUniformLocation
    local glGetVAO = gl.GetVAO
    local glGetVBO = gl.GetVBO
    local glUniform = gl.Uniform
    local glUniformMatrix = gl.UniformMatrix
    local glUseShader = gl.UseShader

    local floor = math.floor

    local TORNADO_BODY_BANDS = 6
    local TORNADO_BODY_SEGMENTS = 44
    local TORNADO_STREAK_COUNT = 22
    local TORNADO_STREAK_SEGMENTS = 6
    local TORNADO_GROUND_SEGMENTS = 48

    local tornadoes = {}
    local tornadoShader = nil
    local tornadoVAO = nil
    local tornadoVertexVBO = nil
    local tornadoInstanceVBO = nil
    local tornadoVertexCount = 0
    local tornadoLocViewProjection = nil
    local tornadoLocNowFrame = nil
    local tornadoInstanceData = {}
    local tornadoRendererInitFailed = false
    local windSounds = {
        "sounds/tornado_roar_1.wav",
        "sounds/tornado_roar_2.wav",
    }
    local gustSounds = {
        "sounds/tornado_gust_1.wav",
        "sounds/tornado_gust_2.wav",
        "sounds/tornado_thunder.wav",
    }

    local function Hash01(seed)
        local value = (seed * 1103515245 + 12345) % 2147483647
        return value / 2147483647
    end

    local function GetLifeFade(tornado, nowFrame)
        local age = (nowFrame - tornado.birthFrame) / TORNADO_LIFETIME
        return math.min(age * 4, (1 - age) * 4, 1)
    end

    local function PlayTornadoSound(soundFile, volume, tornado, heightOffset)
        if not PlaySoundFile then
            return
        end

        PlaySoundFile(
            soundFile,
            volume,
            tornado.x,
            tornado.y + (heightOffset or 45),
            tornado.z,
            0, 0, 0,
            "battle"
        )
    end

    local function AddTornado(data)
        if not data or not data.id then
            return
        end

        data.y = data.y or (GetGroundHeight(data.x, data.z) or 0)
        data.phase = data.phase or 0
        data.nextWindSoundFrame = data.birthFrame
        data.nextGustSoundFrame = data.birthFrame + 45 + floor(Hash01(data.id * 83) * 90)
        tornadoes[data.id] = data

        PlayTornadoSound("sounds/tornado_thunder.wav", TORNADO_SOUND_VOLUME, data, TORNADO_HEIGHT * 0.75)
    end

    local function RemoveTornado(tornadoID)
        tornadoes[tornadoID] = nil
    end

    local function LoadSyncedTornadoes()
        local syncedTornadoes = SYNCED.mapTornadoes or {}
        for _, data in pairs(syncedTornadoes) do
            AddTornado(data)
        end
    end

    local function SyncTornadoPosition(tornadoID, tornado)
        local syncedTornadoes = SYNCED.mapTornadoes
        local syncedTornado = syncedTornadoes and syncedTornadoes[tornadoID]
        if not syncedTornado then
            return
        end

        tornado.x = syncedTornado.x or tornado.x
        tornado.y = syncedTornado.y or tornado.y
        tornado.z = syncedTornado.z or tornado.z
    end

    local tornadoVertexShaderSource = string.format([[
#version 330 core

layout(location = 0) in vec4 vertexParams;
layout(location = 1) in vec4 instPosScale;
layout(location = 2) in vec4 instPhaseFade;

uniform mat4 viewprojection;
uniform float nowFrame;

out vec4 vColor;

const float TWO_PI = 6.283185307179586;
const float SHADER_TORNADO_RADIUS = %.1f;
const float SHADER_TORNADO_HEIGHT = %.1f;
const float SHADER_FUNNEL_TOUCHDOWN_FRAMES = %.1f;
const float SHADER_FUNNEL_GROUND_EXPAND_FRAMES = %.1f;

float hash01(float seed)
{
    return fract(sin(seed) * 43758.5453123);
}

vec3 spiralOffset(float radius, float angle, float side, float width)
{
    vec2 normal = vec2(-sin(angle), cos(angle));
    vec2 center = vec2(cos(angle) * radius, sin(angle) * radius);
    vec2 xz = center + normal * side * width;
    return vec3(xz.x, 0.0, xz.y);
}

void main()
{
    float kind = vertexParams.x;
    vec3 origin = instPosScale.xyz;
    float scale = instPosScale.w;
    float phase = instPhaseFade.x;
    float fade = instPhaseFade.y;
    float tornadoID = instPhaseFade.z;
    float birthFrame = instPhaseFade.w;
    float birthAge = max(nowFrame - birthFrame, 0.0);
    float touchdown = smoothstep(0.0, SHADER_FUNNEL_TOUCHDOWN_FRAMES, birthAge);
    float groundExpand = smoothstep(0.0, SHADER_FUNNEL_GROUND_EXPAND_FRAMES, max(birthAge - SHADER_FUNNEL_TOUCHDOWN_FRAMES, 0.0));
    float bottomH = 0.82 * (1.0 - touchdown);
    vec3 pos = origin;
    vec4 color = vec4(0.0);

    if (kind < 0.5) {
        float band = vertexParams.y;
        float h = vertexParams.z;
        float side = vertexParams.w;
        float bandPhase = phase + band * TWO_PI / 6.0;
        float spin = nowFrame * 0.065;
        float radiusJitter = (9.0 + hash01(tornadoID * 31.0 + band * 17.0) * 22.0) * scale;
        float visible = smoothstep(bottomH, min(bottomH + 0.07, 1.0), h);
        float localH = clamp((h - bottomH) / max(1.0 - bottomH, 0.001), 0.0, 1.0);
        float normalRadius = SHADER_TORNADO_RADIUS * scale * (1.0 - h * 0.52) + sin(h * 7.5 + spin + bandPhase) * radiusJitter;
        float skyConeRadius = SHADER_TORNADO_RADIUS * scale * (0.04 + localH * 0.58) + sin(h * 7.5 + spin + bandPhase) * radiusJitter * 0.35;
        float radius = mix(skyConeRadius, normalRadius, groundExpand);
        float angle = bandPhase + spin + h * TWO_PI * 3.4;
        float width = (16.0 + (1.0 - h) * 16.0) * scale;

        pos += spiralOffset(radius, angle, side, width);
        pos.y += h * SHADER_TORNADO_HEIGHT * scale;
        color = vec4(0.72, 0.80, 0.86, (0.08 + h * 0.18) * fade * visible);
    } else if (kind < 1.5) {
        float streak = vertexParams.y;
        float t = vertexParams.z;
        float side = vertexParams.w;
        float seed = tornadoID * 53.0 + (streak + 1.0) * 97.0;
        float h0 = hash01(seed);
        float length = 0.08 + hash01(seed + 11.0) * 0.16;
        float h = min(h0 + length * t, 1.0);
        float basePhase = hash01(seed + 23.0) * TWO_PI;
        float speed = 0.07 + hash01(seed + 37.0) * 0.035;
        float visible = smoothstep(bottomH, min(bottomH + 0.07, 1.0), h);
        float localH = clamp((h - bottomH) / max(1.0 - bottomH, 0.001), 0.0, 1.0);
        float normalRadius = SHADER_TORNADO_RADIUS * scale * (0.72 - h * 0.34);
        float skyConeRadius = SHADER_TORNADO_RADIUS * scale * (0.03 + localH * 0.46);
        float radius = mix(skyConeRadius, normalRadius, groundExpand);
        float angle = basePhase + nowFrame * speed + phase * 0.35 + h * TWO_PI * 4.8;
        float width = (7.0 + (1.0 - t) * 8.0) * scale;

        pos += spiralOffset(radius, angle, side, width);
        pos.y += h * SHADER_TORNADO_HEIGHT * scale;
        color = vec4(0.92, 0.96, 1.0, (0.18 - t * 0.15) * fade * visible);
    } else if (kind < 2.5) {
        float angle = vertexParams.y * TWO_PI + phase + nowFrame * 0.0466667;
        float radiusNorm = vertexParams.z;
        float radius = SHADER_TORNADO_RADIUS * scale * 0.95 * radiusNorm * groundExpand;
        pos.xz += vec2(cos(angle), sin(angle)) * radius;
        pos.y += 3.0;
        color = vec4(mix(vec3(0.55, 0.50, 0.43), vec3(0.42, 0.46, 0.50), radiusNorm), (1.0 - radiusNorm) * 0.22 * fade * groundExpand);
    } else {
        float angle = vertexParams.y * TWO_PI;
        float side = vertexParams.z;
        float layer = vertexParams.w;
        float baseRadius = layer < 0.5 ? 1.0 : 0.55 + 0.08 * sin(nowFrame * 0.0733333);
        float radius = SHADER_TORNADO_RADIUS * scale * (baseRadius + side * 0.012) * groundExpand;
        pos.xz += vec2(cos(angle), sin(angle)) * radius;
        pos.y += 2.0;
        color = layer < 0.5
            ? vec4(0.78, 0.82, 0.86, 0.24 * fade * groundExpand)
            : vec4(0.50, 0.54, 0.58, 0.16 * fade * groundExpand);
    }

    vColor = color;
    gl_Position = viewprojection * vec4(pos, 1.0);
}
]], TORNADO_RADIUS, TORNADO_HEIGHT, TORNADO_FUNNEL_TOUCHDOWN, TORNADO_FUNNEL_GROUND_EXPAND)

    local tornadoFragmentShaderSource = [[
#version 330 core

in vec4 vColor;
out vec4 fragColor;

void main()
{
    if (vColor.a <= 0.003) {
        discard;
    }
    fragColor = vColor;
}
]]

    local function AddTornadoVertex(data, kind, a, b, c)
        local index = #data
        data[index + 1] = kind
        data[index + 2] = a
        data[index + 3] = b
        data[index + 4] = c
    end

    local function AddTornadoRibbonQuad(data, kind, a, b0, b1)
        AddTornadoVertex(data, kind, a, b0, -1)
        AddTornadoVertex(data, kind, a, b1, -1)
        AddTornadoVertex(data, kind, a, b1, 1)
        AddTornadoVertex(data, kind, a, b0, -1)
        AddTornadoVertex(data, kind, a, b1, 1)
        AddTornadoVertex(data, kind, a, b0, 1)
    end

    local function BuildTornadoVertexData()
        local data = {}

        for band = 0, TORNADO_BODY_BANDS - 1 do
            for segment = 0, TORNADO_BODY_SEGMENTS - 1 do
                AddTornadoRibbonQuad(
                    data,
                    0,
                    band,
                    segment / TORNADO_BODY_SEGMENTS,
                    (segment + 1) / TORNADO_BODY_SEGMENTS
                )
            end
        end

        for streak = 0, TORNADO_STREAK_COUNT - 1 do
            for segment = 0, TORNADO_STREAK_SEGMENTS - 1 do
                AddTornadoRibbonQuad(
                    data,
                    1,
                    streak,
                    segment / TORNADO_STREAK_SEGMENTS,
                    (segment + 1) / TORNADO_STREAK_SEGMENTS
                )
            end
        end

        for segment = 0, TORNADO_GROUND_SEGMENTS - 1 do
            local angle0 = segment / TORNADO_GROUND_SEGMENTS
            local angle1 = (segment + 1) / TORNADO_GROUND_SEGMENTS
            AddTornadoVertex(data, 2, 0, 0, 0)
            AddTornadoVertex(data, 2, angle1, 1, 0)
            AddTornadoVertex(data, 2, angle0, 1, 0)
        end

        for layer = 0, 1 do
            for segment = 0, TORNADO_GROUND_SEGMENTS - 1 do
                local angle0 = segment / TORNADO_GROUND_SEGMENTS
                local angle1 = (segment + 1) / TORNADO_GROUND_SEGMENTS
                AddTornadoVertex(data, 3, angle0, -1, layer)
                AddTornadoVertex(data, 3, angle1, -1, layer)
                AddTornadoVertex(data, 3, angle1, 1, layer)
                AddTornadoVertex(data, 3, angle0, -1, layer)
                AddTornadoVertex(data, 3, angle1, 1, layer)
                AddTornadoVertex(data, 3, angle0, 1, layer)
            end
        end

        return data, #data / 4
    end

    local function InitTornadoRenderer()
        if tornadoShader and tornadoVAO and tornadoVertexVBO and tornadoInstanceVBO then
            return true
        end
        if tornadoRendererInitFailed then
            return false
        end
        if not glCreateShader or not glGetVAO or not glGetVBO or not glUniform or not glUniformMatrix or not glUseShader then
            tornadoRendererInitFailed = true
            return false
        end

        tornadoShader = glCreateShader({
            vertex = tornadoVertexShaderSource,
            fragment = tornadoFragmentShaderSource,
        })
        if not tornadoShader or tornadoShader == 0 then
            tornadoRendererInitFailed = true
            return false
        end

        tornadoVAO = glGetVAO()
        tornadoVertexVBO = glGetVBO(GL.ARRAY_BUFFER, false)
        tornadoInstanceVBO = glGetVBO(GL.ARRAY_BUFFER, true)
        if not tornadoVAO or not tornadoVertexVBO or not tornadoInstanceVBO then
            tornadoRendererInitFailed = true
            return false
        end

        local vertexData
        vertexData, tornadoVertexCount = BuildTornadoVertexData()

        tornadoVertexVBO:Define(tornadoVertexCount, {
            {id = 0, name = "vertexParams", size = 4},
        })
        tornadoInstanceVBO:Define(MAX_ACTIVE, {
            {id = 1, name = "instPosScale", size = 4},
            {id = 2, name = "instPhaseFade", size = 4},
        })
        tornadoVertexVBO:Upload(vertexData)

        tornadoVAO:AttachVertexBuffer(tornadoVertexVBO)
        tornadoVAO:AttachInstanceBuffer(tornadoInstanceVBO)

        tornadoLocViewProjection = (glGetUniformLocation and glGetUniformLocation(tornadoShader, "viewprojection")) or "viewprojection"
        tornadoLocNowFrame = (glGetUniformLocation and glGetUniformLocation(tornadoShader, "nowFrame")) or "nowFrame"
        return true
    end

    local function UploadTornadoInstances(instanceCount)
        if instanceCount <= 0 or not tornadoInstanceVBO then
            return false
        end

        tornadoInstanceVBO:Upload(tornadoInstanceData)
        return true
    end

    local function UpdateTornadoSound(tornado, nowFrame)
        local fade = GetLifeFade(tornado, nowFrame)
        if fade <= 0 then
            return
        end
        local volume = TORNADO_SOUND_VOLUME * fade

        if nowFrame >= tornado.nextWindSoundFrame then
            local soundIndex = 1 + floor(Hash01(tornado.id * 131 + nowFrame) * #windSounds)
            PlayTornadoSound(windSounds[soundIndex], volume, tornado, TORNADO_HEIGHT * GetTornadoScale(tornado, nowFrame) * 0.45)
            tornado.nextWindSoundFrame = nowFrame + 38 + floor(Hash01(tornado.id * 191 + nowFrame) * 18)
        end

        if nowFrame >= tornado.nextGustSoundFrame then
            local soundIndex = 1 + floor(Hash01(tornado.id * 211 + nowFrame) * #gustSounds)
            PlayTornadoSound(gustSounds[soundIndex], volume, tornado, TORNADO_HEIGHT * GetTornadoScale(tornado, nowFrame) * 0.7)
            tornado.nextGustSoundFrame = nowFrame + 170 + floor(Hash01(tornado.id * 251 + nowFrame) * 150)
        end
    end

    local function BuildTornadoInstances(nowFrame)
        local instanceCount = 0
        local dataIndex = 0

        for tornadoID, tornado in pairs(tornadoes) do
            SyncTornadoPosition(tornadoID, tornado)
            if nowFrame >= tornado.deathFrame then
                tornadoes[tornadoID] = nil
            else
                local fade = GetLifeFade(tornado, nowFrame)
                if fade > 0 then
                    local scale = GetTornadoScale(tornado, nowFrame)
                    instanceCount = instanceCount + 1

                    dataIndex = dataIndex + 1
                    tornadoInstanceData[dataIndex] = tornado.x
                    dataIndex = dataIndex + 1
                    tornadoInstanceData[dataIndex] = tornado.y
                    dataIndex = dataIndex + 1
                    tornadoInstanceData[dataIndex] = tornado.z
                    dataIndex = dataIndex + 1
                    tornadoInstanceData[dataIndex] = scale

                    dataIndex = dataIndex + 1
                    tornadoInstanceData[dataIndex] = tornado.phase
                    dataIndex = dataIndex + 1
                    tornadoInstanceData[dataIndex] = fade
                    dataIndex = dataIndex + 1
                    tornadoInstanceData[dataIndex] = tornado.id
                    dataIndex = dataIndex + 1
                    tornadoInstanceData[dataIndex] = tornado.birthFrame or nowFrame
                end

                UpdateTornadoSound(tornado, nowFrame)
            end
        end

        for i = dataIndex + 1, #tornadoInstanceData do
            tornadoInstanceData[i] = nil
        end

        return instanceCount
    end

    function gadget:Initialize()
        LoadSyncedTornadoes()
    end

    function gadget:RecvFromSynced(msg, data)
        if msg == MSG_SPAWN then
            AddTornado(data)
        elseif msg == MSG_REMOVE then
            RemoveTornado(data)
        end
    end

    function gadget:DrawWorldPreUnit()
        local nowFrame = floor(GetGameFrame() or 0)
        local instanceCount = BuildTornadoInstances(nowFrame)

        if instanceCount <= 0 then
            return
        end
        if not InitTornadoRenderer() or not UploadTornadoInstances(instanceCount) then
            return
        end

        glDepthTest(true)
        glDepthMask(false)
        glBlending("alpha")
        glCulling(false)

        if glUseShader(tornadoShader) then
            glUniformMatrix(tornadoLocViewProjection, "viewprojection")
            glUniform(tornadoLocNowFrame, nowFrame)
            tornadoVAO:DrawArrays(GL.TRIANGLES, tornadoVertexCount, 0, instanceCount)
        end
        glUseShader(0)

        glBlending("reset")
        glCulling(false)
        glDepthMask(true)
        glDepthTest(false)
    end

    function gadget:Shutdown()
        if tornadoShader and glDeleteShader then
            glDeleteShader(tornadoShader)
        end
        if tornadoVAO then
            tornadoVAO:Delete()
        end
        if tornadoVertexVBO then
            tornadoVertexVBO:Delete()
        end
        if tornadoInstanceVBO then
            tornadoInstanceVBO:Delete()
        end

        tornadoShader = nil
        tornadoVAO = nil
        tornadoVertexVBO = nil
        tornadoInstanceVBO = nil
    end
end
