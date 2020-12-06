function gadget:GetInfo()
    return {
        name = 'Units Targetting Prioritie',
        desc = 'Adds a priority command/button to set the wanted target priritizing',
        author = 'Doo', -- added only bombers and no scouts option by Silver v1.2
        version = 'v1.0',
        date = 'May 2018',
        license = 'GNU GPL, v2 or later',
        layer = -1, --must run before game_initial_spawn, because game_initial_spawn must control the return of GameSteup
        enabled = false
    }
end

--synced
if gadgetHandler:IsSyncedCode() then
    local EditUnitCmdDesc = Spring.EditUnitCmdDesc
    local FindUnitCmdDesc = Spring.FindUnitCmdDesc
    local GetUnitDefID = Spring.GetUnitDefID
    local InsertUnitCmdDesc = Spring.InsertUnitCmdDesc
    local SetUnitRulesParam = Spring.SetUnitRulesParam
    local GetUnitRulesParam = Spring.GetUnitRulesParam
    local GetUnitTeam = Spring.GetUnitTeam
    local SendMessageToTeam = Spring.SendMessageToTeam
    local CMD_SET_PRIORITY = 34567
    local redcolor = "\255\255\64\64"
    local PRIORITY_GOOD = 0.001
    local PRIORITY_BAD = 100
    local PRIORITY_INDIFFERENT = 1
    local PRIORITY_MUST_NOT = -1

    local NO_PRIORITY_INDEX = 0

    local unitToPriorityMap = {}
    local playerPriorityCount = {}
    local PLAYER_PRIORITY_LIMIT
    -- maybe the modoptions should be available as a global table
    -- which also uses the modoption keys as keys
    for _, v in pairs(VFS.Include("modoptions.lua")) do
        if v.key == "mo_priority_unit_limit" then
            PLAYER_PRIORITY_LIMIT = v.def
            break
        end
    end
    local limitOption = Spring.GetModOptions().mo_priority_unit_limit
    PLAYER_PRIORITY_LIMIT = limitOption and tonumber(limitOption) or PLAYER_PRIORITY_LIMIT

    local setPriorityAirNone = {
        id = CMD_SET_PRIORITY,
        type = CMDTYPE.ICON_MODE,
        name = 'Set Priority',
        action = 'setpriority',
        tooltip = 'Toggle for target type priority\nNo current priority set for AA',
        queueing = false,
        params = {'0', 'No priority', '', '', '', ''}
    }

    local setPriorityAirFighter = {
        id = CMD_SET_PRIORITY,
        type = CMDTYPE.ICON_MODE,
        name = 'Set Priority',
        action = 'setpriority',
        tooltip = 'Toggle for target type priority\nCurrent AA priority set to fighters',
        queueing = false,
        params = {'1', '', 'Fighters', '', '', ''}
    }

    local setPriorityAirBomber = {
        id = CMD_SET_PRIORITY,
        type = CMDTYPE.ICON_MODE,
        name = 'Set Priority',
        action = 'setpriority',
        tooltip = 'Toggle for target type priority\nCurrent AA priority set to bombers',
        queueing = false,
        params = {'2', '', '', 'Bombers', '', ''}
    }

    local setPriorityAirOnlyBomber = {
        id = CMD_SET_PRIORITY,
        type = CMDTYPE.ICON_MODE,
        name = 'Set Priority',
        action = 'setpriority',
        tooltip = 'Toggle for target type priority\nCurrent AA priority set to \255\255\64\64only bombers',
        queueing = false,
        params = {'3', '', '', '', '\255\255\64\64Only\n Bombers', ''}
    }

    local setPriorityAirNoScouts = {
        id = CMD_SET_PRIORITY,
        type = CMDTYPE.ICON_MODE,
        name = 'Set Priority',
        action = 'setpriority',
        tooltip = 'Toggle for target type priority\nCurrent AA priority set to \255\64\170\255no scouts',
        queueing = false,
        params = {'4', '', '', '', '', '\255\64\170\255No Scouts'}
    }

    local noPriority = {
        key = "id",
        map = {
            ["_default"] = PRIORITY_INDIFFERENT
        }
    }

    local fighter = {
        key = "id",
        map = {
            ["_default"] = PRIORITY_BAD,
            [UnitDefNames["airwolf3g"].id] = PRIORITY_GOOD,
            [UnitDefNames["armfig"].id] = PRIORITY_GOOD,
            [UnitDefNames["armhawk"].id] = PRIORITY_GOOD,
            [UnitDefNames["corvamp"].id] = PRIORITY_GOOD,
            [UnitDefNames["corveng"].id] = PRIORITY_GOOD,
            [UnitDefNames["shrike"].id] = PRIORITY_GOOD,
            [UnitDefNames["tlladvfight"].id] = PRIORITY_GOOD,
            [UnitDefNames["tllfight"].id] = PRIORITY_GOOD,
            [UnitDefNames["tllshu"].id] = PRIORITY_GOOD,
            [UnitDefNames["armstratus"].id] = PRIORITY_GOOD,
            [UnitDefNames["tllcondor"].id] = PRIORITY_GOOD,
            [UnitDefNames["corshock"].id] = PRIORITY_GOOD,
            [UnitDefNames["talon_token"].id] = PRIORITY_GOOD,
            [UnitDefNames["talon_echelon"].id] = PRIORITY_GOOD,
            [UnitDefNames["talon_hornet"].id] = PRIORITY_GOOD
        }
    }

    local bomber = {
        key = "id",
        map = {
            ["_default"] = PRIORITY_BAD,
            [UnitDefNames["armatlas"].id] = PRIORITY_GOOD,
            [UnitDefNames["armdfly"].id] = PRIORITY_GOOD,
            [UnitDefNames["talon_wyvern"].id] = PRIORITY_GOOD,
            [UnitDefNames["talon_rukh"].id] = PRIORITY_GOOD,
            [UnitDefNames["talon_tau"].id] = PRIORITY_GOOD,
            [UnitDefNames["corvalk"].id] = PRIORITY_GOOD,
            [UnitDefNames["tllrobber"].id] = PRIORITY_GOOD,
            [UnitDefNames["tlltplane"].id] = PRIORITY_GOOD,
            [UnitDefNames["armor"].id] = PRIORITY_GOOD,
            [UnitDefNames["tllbtrans"].id] = PRIORITY_GOOD,
            [UnitDefNames["cormuat"].id] = PRIORITY_GOOD,
            [UnitDefNames["talon_shade"].id] = PRIORITY_GOOD,
            [UnitDefNames["talon_eclipse"].id] = PRIORITY_GOOD,
            [UnitDefNames["talon_handgod"].id] = PRIORITY_GOOD,
            [UnitDefNames["talon_trident"].id] = PRIORITY_GOOD,
            [UnitDefNames["armcybr"].id] = PRIORITY_GOOD,
            [UnitDefNames["armlance"].id] = PRIORITY_GOOD,
            [UnitDefNames["armpnix"].id] = PRIORITY_GOOD,
            [UnitDefNames["armthund"].id] = PRIORITY_GOOD,
            [UnitDefNames["armcyclone"].id] = PRIORITY_GOOD,
            [UnitDefNames["corgripn"].id] = PRIORITY_GOOD,
            [UnitDefNames["corhurc"].id] = PRIORITY_GOOD,
            [UnitDefNames["corshad"].id] = PRIORITY_GOOD,
            [UnitDefNames["cortitan"].id] = PRIORITY_GOOD,
            [UnitDefNames["tllabomber"].id] = PRIORITY_GOOD,
            [UnitDefNames["tllbomber"].id] = PRIORITY_GOOD,
            [UnitDefNames["tlltorpp"].id] = PRIORITY_GOOD,
            [UnitDefNames["coreclipse"].id] = PRIORITY_GOOD,
            [UnitDefNames["corsbomb"].id] = PRIORITY_GOOD,
            [UnitDefNames["armorion"].id] = PRIORITY_GOOD,
            [UnitDefNames["tllanhur"].id] = PRIORITY_GOOD,
            [UnitDefNames["tllaether"].id] = PRIORITY_GOOD
        }
    }

    local bomberOnly = {
        key = "id",
        map = {
            ["_default"] = PRIORITY_MUST_NOT,
            [UnitDefNames["armatlas"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["armdfly"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["talon_wyvern"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["talon_rukh"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["talon_tau"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["corvalk"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["tllrobber"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["tlltplane"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["armor"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["tllbtrans"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["cormuat"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["talon_shade"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["talon_eclipse"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["talon_handgod"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["talon_trident"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["armcybr"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["armlance"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["armpnix"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["armthund"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["armcyclone"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["corgripn"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["corhurc"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["corshad"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["cortitan"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["tllabomber"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["tllbomber"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["tlltorpp"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["coreclipse"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["corsbomb"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["armorion"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["tllanhur"].id] = PRIORITY_INDIFFERENT,
            [UnitDefNames["tllaether"].id] = PRIORITY_INDIFFERENT
        }
    }

    local noScouts = {
        key = "id",
        map = {
            ["_default"] = PRIORITY_INDIFFERENT,
            [UnitDefNames["armpeep"].id] = PRIORITY_MUST_NOT,
            [UnitDefNames["armawac"].id] = PRIORITY_MUST_NOT,
            [UnitDefNames["corfink"].id] = PRIORITY_MUST_NOT,
            [UnitDefNames["corawac"].id] = PRIORITY_MUST_NOT,
            [UnitDefNames["tllprob"].id] = PRIORITY_MUST_NOT,
            [UnitDefNames["tllrsplane"].id] = PRIORITY_MUST_NOT,
            [UnitDefNames["talon_recon"].id] = PRIORITY_MUST_NOT,
            [UnitDefNames["talon_vigilante"].id] = PRIORITY_MUST_NOT
        }
    }

    local airPriorities = {
        [NO_PRIORITY_INDEX] = {
            cmdDesc = setPriorityAirNone,
            map = noPriority
        },
        [1] = {
            cmdDesc = setPriorityAirFighter,
            map = fighter
        },
        [2] = {
            cmdDesc = setPriorityAirBomber,
            map = bomber
        },
        [3] = {
            cmdDesc = setPriorityAirOnlyBomber,
            map = bomberOnly
        },
        [4] = {
            cmdDesc = setPriorityAirNoScouts,
            map = noScouts
        }
    }

    local setPriorityGeneralNone = {
        id = CMD_SET_PRIORITY,
        type = CMDTYPE.ICON_MODE,
        name = 'Set Priority',
        action = 'setpriority',
        tooltip = 'Toggle for target priority\nNo current priority set',
        queueing = false,
        params = {'0', 'No priority', '', '', '', ''}
    }

    local setPriorityGeneralStrongest = {
        id = CMD_SET_PRIORITY,
        type = CMDTYPE.ICON_MODE,
        name = 'Set Priority',
        action = 'setpriority',
        tooltip = 'Toggle for target priority\nCurrent priority set to most max health',
        queueing = false,
        params = {'1', '', 'Strongest', '', '', ''}
    }

    local setPriorityGeneralAtLeast1k = {
        id = CMD_SET_PRIORITY,
        type = CMDTYPE.ICON_MODE,
        name = 'Set Priority',
        action = 'setpriority',
        tooltip = 'Toggle for target priority\nCurrent priority set to only max health greater than 1000',
        queueing = false,
        params = {'2', '', '', 'At Least\n1k', '', ''}
    }

    local setPriorityGeneralAtLeast10k = {
        id = CMD_SET_PRIORITY,
        type = CMDTYPE.ICON_MODE,
        name = 'Set Priority',
        action = 'setpriority',
        tooltip = 'Toggle for target priority\nCurrent priority set to only max health greater than 10000',
        queueing = false,
        params = {'3', '', '', '', 'At Least\n10k', ''}
    }

    local setPriorityGeneralAtLeast100k = {
        id = CMD_SET_PRIORITY,
        type = CMDTYPE.ICON_MODE,
        name = 'Set Priority',
        action = 'setpriority',
        tooltip = 'Toggle for target priority\nCurrent priority set to only max health greater than 100000',
        queueing = false,
        params = {'4', '', '', '', '', 'At Least\n100k'}
    }

    local healthDescending = {
        key = "health",
        map = {} -- empty to trigger __index calls in metatable
    }
    local healthDescendingMT = {
        __index = function (t, k)
            return 1/k
        end
    }
    setmetatable(healthDescending.map, healthDescendingMT)

    local healthAtLeast1k = {
        key = "health",
        map = {} -- empty to trigger __index calls in metatable
    }
    local healthAtLeast1kMT = {
        __index = function (t, k)
            return (k < 1000) and PRIORITY_MUST_NOT or PRIORITY_INDIFFERENT
        end
    }
    setmetatable(healthAtLeast1k.map, healthAtLeast1kMT)

    local healthAtLeast10k = {
        key = "health",
        map = {} -- empty to trigger __index calls in metatable
    }
    local healthAtLeast10kMT = {
        __index = function (t, k)
            return (k < 10000) and PRIORITY_MUST_NOT or PRIORITY_INDIFFERENT
        end
    }
    setmetatable(healthAtLeast10k.map, healthAtLeast10kMT)

    local healthAtLeast100k = {
        key = "health",
        map = {} -- empty to trigger __index calls in metatable
    }
    local healthAtLeast100kMT = {
        __index = function (t, k)
            return (k < 100000) and PRIORITY_MUST_NOT or PRIORITY_INDIFFERENT
        end
    }
    setmetatable(healthAtLeast100k.map, healthAtLeast100kMT)

    local generalPriorities = {
        [NO_PRIORITY_INDEX] = {
            cmdDesc = setPriorityGeneralNone,
            map = noPriority
        },
        [1] = {
            cmdDesc = setPriorityGeneralStrongest,
            map = healthDescending
        },
        [2] = {
            cmdDesc = setPriorityGeneralAtLeast1k,
            map = healthAtLeast1k
        },
        [3] = {
            cmdDesc = setPriorityGeneralAtLeast10k,
            map = healthAtLeast10k
        },
        [4] = {
            cmdDesc = setPriorityGeneralAtLeast100k,
            map = healthAtLeast100k
        }
    }

    -- prioritytarget in unit definition customParams can be set to the keys in this map
    --
    -- index 0 in priority maps MUST be no priority, to enforce limit on prioritising units
    local priorityTypes = {
        air = airPriorities,
        general = generalPriorities
    }

    function gadget:UnitCreated(unitID, unitDefID)
        local prioTarget = UnitDefs[unitDefID].customParams.prioritytarget
        local priorityType = priorityTypes[prioTarget]
        if priorityType then
            unitToPriorityMap[unitID] = priorityType[NO_PRIORITY_INDEX].map
            InsertUnitCmdDesc(unitID, CMD_SET_PRIORITY, priorityType[NO_PRIORITY_INDEX].cmdDesc)
            SetUnitRulesParam(unitID, "priorityEnabled", 0)
        end
    end

    function gadget:UnitDestroyed(unitID, unitDefID)
        if unitToPriorityMap[unitID] then
            if GetUnitRulesParam(unitID, "priorityEnabled") == 1 then -- removed from prioritising
                local team = GetUnitTeam(unitID)
                playerPriorityCount[team] = playerPriorityCount[team] - 1
            end
            unitToPriorityMap[unitID] = nil
        end
    end

    function gadget:AllowCommand(unitID, unitDefID, unitTeam, cmdID, cmdParams, cmdOptions, cmdTag, synced)
        if cmdID == CMD_SET_PRIORITY then
            local team = GetUnitTeam(unitID)
            if not playerPriorityCount[team] then
                playerPriorityCount[team] = 0
            end
            if GetUnitRulesParam(unitID, "priorityEnabled") == 0 and cmdParams and cmdParams[1] ~= NO_PRIORITY_INDEX then -- change to prioritising
                if playerPriorityCount[team] >= PLAYER_PRIORITY_LIMIT then
                    SendMessageToTeam(team, redcolor .. "Warning: Can not set priority, limit ("..PLAYER_PRIORITY_LIMIT..") reached")
                    return false
                end
                playerPriorityCount[team] = playerPriorityCount[team] + 1
            end
        end
        return true
    end

    function gadget:UnitCommand(unitID, unitDefID, unitTeam, cmdID, cmdParams, cmdOpts, cmdTag)
        if cmdID == CMD_SET_PRIORITY then
            local prioTarget = UnitDefs[unitDefID].customParams.prioritytarget
            local priorityType = priorityTypes[prioTarget]
            local cmdDescId = FindUnitCmdDesc(unitID, CMD_SET_PRIORITY)
            if cmdParams and cmdParams[1] and cmdDescId and priorityType then
                local i = cmdParams[1]
                if i == NO_PRIORITY_INDEX and GetUnitRulesParam(unitID, "priorityEnabled") == 1 then -- change to none prioritising
                    local team = GetUnitTeam(unitID)
                    playerPriorityCount[team] = playerPriorityCount[team] - 1
                end
                unitToPriorityMap[unitID] = priorityType[i].map
                EditUnitCmdDesc(unitID, cmdDescId, priorityType[i].cmdDesc)
                SetUnitRulesParam(unitID, "priorityEnabled", (i == NO_PRIORITY_INDEX) and 0 or 1) -- enable calls to AllowWeaponTarget from gadgets.lua
            end
        end
    end

    -- defPriority can be negative or even nil. I suspect engine bugs or faulty unit definitions
    function gadget:AllowWeaponTarget(unitID, targetID, attackerWeaponNum, attackerWeaponDefID, defPriority)
        local targetDef = UnitDefs[GetUnitDefID(targetID)]
        local prioritydict = unitToPriorityMap[unitID]
        if not prioritydict or not targetDef then
            return true, defPriority or 1
        end
        local priority = prioritydict.map[targetDef[prioritydict.key]] or prioritydict.map["_default"]
        return (priority ~= PRIORITY_MUST_NOT), priority * (defPriority or 1)
    end
end
