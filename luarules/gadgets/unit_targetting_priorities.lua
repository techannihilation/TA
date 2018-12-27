function gadget:GetInfo()
    return {
        name = 'Units Targetting Prioritie',
        desc = 'Adds a priority command/button to set the wanted target priritizing',
        author = 'Doo', -- added only bombers and no scouts option by Silver v1.2
        version = 'v1.0',
        date = 'May 2018',
        license = 'GNU GPL, v2 or later',
        layer = -1, --must run before game_initial_spawn, because game_initial_spawn must control the return of GameSteup
        enabled = true
    }
end

--synced
if gadgetHandler:IsSyncedCode() then
    local EditUnitCmdDesc = Spring.EditUnitCmdDesc
    local FindUnitCmdDesc = Spring.FindUnitCmdDesc
    local GetUnitDefID = Spring.GetUnitDefID
    local GetUnitRulesParam = Spring.GetUnitRulesParam
    local InsertUnitCmdDesc = Spring.InsertUnitCmdDesc
    local SetUnitRulesParam = Spring.SetUnitRulesParam
    local CMD_SET_PRIORITY = 34567

    local setPriorityAirn = {
        id = CMD_SET_PRIORITY,
        type = CMDTYPE.ICON_MODE,
        name = 'Set Priority',
        action = 'setpriority',
        tooltip = 'Toggle for target type priority\nNo current priority set for AA',
        queueing = false,
        params = {'0', 'No priority', '', '', '', ''}
    }

    local setPriorityAirf = {
        id = CMD_SET_PRIORITY,
        type = CMDTYPE.ICON_MODE,
        name = 'Set Priority',
        action = 'setpriority',
        tooltip = 'Toggle for target type priority\nCurrent AA priority set to fighters',
        queueing = false,
        params = {'1', '', 'Fighters', '', '', ''}
    }

    local setPriorityAirb = {
        id = CMD_SET_PRIORITY,
        type = CMDTYPE.ICON_MODE,
        name = 'Set Priority',
        action = 'setpriority',
        tooltip = 'Toggle for target type priority\nCurrent AA priority set to bombers',
        queueing = false,
        params = {'2', '', '', 'Bombers', '', ''}
    }

    local setPriorityAirOb = {
        id = CMD_SET_PRIORITY,
        type = CMDTYPE.ICON_MODE,
        name = 'Set Priority',
        action = 'setpriority',
        tooltip = 'Toggle for target type priority\nCurrent AA priority set to \255\255\64\64only bombers',
        queueing = false,
        params = {'3', '', '', '', '\255\255\64\64Only\n Bombers', ''}
    }

    local setPriorityAirNs = {
        id = CMD_SET_PRIORITY,
        type = CMDTYPE.ICON_MODE,
        name = 'Set Priority',
        action = 'setpriority',
        tooltip = 'Toggle for target type priority\nCurrent AA priority set to \255\64\170\255no scouts',
        queueing = false,
        params = {'4', '', '', '', '', '\255\64\170\255No Scouts'}
    }

    local AAunits = {}

    airCategories = {
        --Transporters
        [UnitDefNames["armatlas"].id] = "Bombers",
        [UnitDefNames["armdfly"].id] = "Bombers",
        [UnitDefNames["armdragf"].id] = "Bombers",
        [UnitDefNames["armsl"].id] = "Bombers",
        [UnitDefNames["corfalc"].id] = "Bombers",
        [UnitDefNames["corvalk"].id] = "Bombers",
        [UnitDefNames["tllrobber"].id] = "Bombers",
        [UnitDefNames["tlltplane"].id] = "Bombers",
        [UnitDefNames["armor"].id] = "Bombers",
        [UnitDefNames["corbtrans"].id] = "Bombers",
        --Bombers
        [UnitDefNames["armblz"].id] = "Bombers",
        [UnitDefNames["corfiend"].id] = "Bombers",
        [UnitDefNames["armcybr"].id] = "Bombers",
        [UnitDefNames["armlance"].id] = "Bombers",
        [UnitDefNames["armpnix"].id] = "Bombers",
        [UnitDefNames["armsb"].id] = "Bombers",
        [UnitDefNames["armthund"].id] = "Bombers",
        [UnitDefNames["armcyclone"].id] = "Bombers",
        [UnitDefNames["corgripn"].id] = "Bombers",
        [UnitDefNames["corhurc"].id] = "Bombers",
        [UnitDefNames["corsb"].id] = "Bombers",
        [UnitDefNames["corshad"].id] = "Bombers",
        [UnitDefNames["cortitan"].id] = "Bombers",
        [UnitDefNames["tllabomber"].id] = "Bombers",
        [UnitDefNames["tllbomber"].id] = "Bombers",
        [UnitDefNames["tlltorpp"].id] = "Bombers",
        [UnitDefNames["coreclipse"].id] = "Bombers",
        [UnitDefNames["tllseab"].id] = "Bombers",
        [UnitDefNames["corseap"].id] = "Bombers",
        [UnitDefNames["armseap"].id] = "Bombers",
        [UnitDefNames["corsbomb"].id] = "Bombers",
        [UnitDefNames["armorion"].id] = "Bombers",
        [UnitDefNames["tllanhur"].id] = "Bombers",
        [UnitDefNames["tllaether"].id] = "Bombers",
        [UnitDefNames["airwolf3g"].id] = "Fighters",
        [UnitDefNames["armfig"].id] = "Fighters",
        [UnitDefNames["armhawk"].id] = "Fighters",
        [UnitDefNames["armsfig"].id] = "Fighters",
        [UnitDefNames["corsfig"].id] = "Fighters",
        [UnitDefNames["corvamp"].id] = "Fighters",
        [UnitDefNames["corveng"].id] = "Fighters",
        [UnitDefNames["shrike"].id] = "Fighters",
        [UnitDefNames["tlladvfight"].id] = "Fighters",
        [UnitDefNames["tllfight"].id] = "Fighters",
        [UnitDefNames["tllseaf"].id] = "Fighters",
        [UnitDefNames["tllshu"].id] = "Fighters",
        [UnitDefNames["armstratus"].id] = "Fighters",
        [UnitDefNames["tllcondor"].id] = "Fighters",
        --Scouts
        [UnitDefNames["armpeep"].id] = "Scouts",
        [UnitDefNames["armawac"].id] = "Scouts",
        [UnitDefNames["armsehak"].id] = "Scouts",
        [UnitDefNames["corfink"].id] = "Scouts",
        [UnitDefNames["corawac"].id] = "Scouts",
        [UnitDefNames["corhunt"].id] = "Scouts",
        [UnitDefNames["tllprob"].id] = "Scouts",
        [UnitDefNames["tllrsplane"].id] = "Scouts",
        [UnitDefNames["tllsonpl"].id] = "Scouts"
    }

    local function shallow_copy(t)
        local tmp = {}

        for k, v in pairs(t) do
            tmp[k] = v
        end

        return tmp
    end

    local airCategoriesCached = {}

    function gadget:Initialize()
        airCategoriesCached = shallow_copy(airCategories)
    end

    function gadget:UnitCreated(unitID, unitDefID)
        local uDef = UnitDefs[unitDefID]

        if uDef.customParams.prioritytarget and uDef.customParams.prioritytarget == "air" then
            AAunits[unitID] = true
            InsertUnitCmdDesc(unitID, CMD_SET_PRIORITY, setPriorityAirn)
            SetUnitRulesParam(unitID, "priorityEnabled", 0)
        end
    end

    function gadget:UnitDestroyed(unitID, unitDefID)
        if AAunits[unitID] then
            AAunits[unitID] = nil
        end
    end

    function gadget:AllowCommand(unitID, unitDefID, unitTeam, cmdID, cmdParams, cmdOptions, cmdTag, synced)
        if cmdID == CMD_SET_PRIORITY then
            cmdDescId = FindUnitCmdDesc(unitID, CMD_SET_PRIORITY)

            if cmdParams and cmdParams[1] and cmdDescId then
                if cmdParams[1] == 0 then
                    EditUnitCmdDesc(unitID, cmdDescId, setPriorityAirn)
                elseif cmdParams[1] == 1 then
                    EditUnitCmdDesc(unitID, cmdDescId, setPriorityAirf)
                elseif cmdParams[1] == 2 then
                    EditUnitCmdDesc(unitID, cmdDescId, setPriorityAirb)
                elseif cmdParams[1] == 3 then
                    EditUnitCmdDesc(unitID, cmdDescId, setPriorityAirOb)
                elseif cmdParams[1] == 4 then
                    EditUnitCmdDesc(unitID, cmdDescId, setPriorityAirNs)
                end
            end
        end

        return true
    end

    function gadget:UnitCommand(unitID, unitDefID, unitTeam, cmdID, cmdParams, cmdOpts, cmdTag)
        if cmdID == CMD_SET_PRIORITY then
            if cmdParams and cmdParams[1] then
                if cmdParams[1] == 0 then
                    SetUnitRulesParam(unitID, "priorityEnabled", 0)
                elseif cmdParams[1] == 1 then
                    SetUnitRulesParam(unitID, "priorityEnabled", 1)
                    SetUnitRulesParam(unitID, "targetPriorityFighters", 0.0001)
                    SetUnitRulesParam(unitID, "targetPriorityBombers", 1)
                    SetUnitRulesParam(unitID, "targetPriorityOnlyBombers", 0)
                    SetUnitRulesParam(unitID, "targetPriorityNoSouts", 0)
                elseif cmdParams[1] == 2 then
                    SetUnitRulesParam(unitID, "priorityEnabled", 1)
                    SetUnitRulesParam(unitID, "targetPriorityFighters", 1)
                    SetUnitRulesParam(unitID, "targetPriorityBombers", 0.0001)
                    SetUnitRulesParam(unitID, "targetPriorityOnlyBombers", 0)
                    SetUnitRulesParam(unitID, "targetPriorityNoSouts", 0)
                elseif cmdParams[1] == 3 then
                    SetUnitRulesParam(unitID, "priorityEnabled", 1)
                    SetUnitRulesParam(unitID, "targetPriorityOnlyBombers", 1)
                    SetUnitRulesParam(unitID, "targetPriorityNoSouts", 0)
                elseif cmdParams[1] == 4 then
                    SetUnitRulesParam(unitID, "priorityEnabled", 1)
                    SetUnitRulesParam(unitID, "targetPriorityFighters", 1)
                    SetUnitRulesParam(unitID, "targetPriorityBombers", 0.0001)
                    SetUnitRulesParam(unitID, "targetPriorityOnlyBombers", 0)
                    SetUnitRulesParam(unitID, "targetPriorityNoSouts", 1)
                end
            end
        end
    end

    function gadget:AllowWeaponTarget(unitID, targetID, attackerWeaponNum, attackerWeaponDefID, defPriority)
        local unitDefID = GetUnitDefID(targetID)

        if unitDefID then
            local allowed = true
            local priority = defPriority

            if AAunits[unitID] then
                local priorityEnabled = GetUnitRulesParam(unitID, "priorityEnabled") or 0

                if priorityEnabled == 1 then
                    local airCat = airCategoriesCached[unitDefID]
                    local onlyBombers = GetUnitRulesParam(unitID, "targetPriorityOnlyBombers")
                    local noScouts = GetUnitRulesParam(unitID, "targetPriorityNoSouts")
                    local hasPriority = (GetUnitRulesParam(unitID, "targetPriorityFighters") and GetUnitRulesParam(unitID, "targetPriorityBombers"))

                    if airCat and hasPriority and onlyBombers == 0 then
                        if airCat == "Scouts" then
                            priority = priority * 1000

                            if noScouts == 1 then
                                allowed = false
                            end
                        else
                            priority = priority * GetUnitRulesParam(unitID, ("targetPriority" .. airCat))
                        end
                    elseif airCat and airCat ~= "Bombers" then
                        allowed = false
                    end
                end
            end

            return allowed, priority
        end
    end
end