function gadget:GetInfo()
	return {
		name	= 'Units Targetting Prioritie',
		desc	= 'Adds a priority command/button to set the wanted target priritizing',
		author	= 'Doo',
		version	= 'v1.0',
		date	= 'May 2018',
		license	= 'GNU GPL, v2 or later',
		layer	= -1, --must run before game_initial_spawn, because game_initial_spawn must control the return of GameSteup
		enabled	= true
	}
end

--synced
if gadgetHandler:IsSyncedCode() then

local CMD_SET_PRIORITY = 34567

local setPriorityAirf = {
	id      = CMD_SET_PRIORITY,
	type    = CMDTYPE.ICON_MODE,
	name    = 'Set Priority',
	action  = 'setpriority',
	tooltip = 'Toggle for target type priority\nCurrent AA priority set to to fighters',
	queueing = false,
	params  = { '0', 'Fighters', 'Bombers', 'none'} ,
}

local setPriorityAirb = {
	id      = CMD_SET_PRIORITY,
	type    = CMDTYPE.ICON_MODE,
	name    = 'Set Priority',
	action  = 'setpriority',
	tooltip = 'Toggle for target type priority\nCurrent AA priority set to to bombers',
	queueing = false,
	params  = { '1', 'Fighters', 'Bombers', 'none'} ,
}

local setPriorityAirn = {
	id      = CMD_SET_PRIORITY,
	type    = CMDTYPE.ICON_MODE,
	name    = 'Set Priority',
	action  = 'setpriority',
	tooltip = 'Toggle for target type priority\nNo current priority set for AA',
	queueing = false,
	params  = { '2', 'Fighters', 'Bombers', 'No priority'} ,
}

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

	function gadget:Initialize()

	end

	function gadget:UnitCreated(unitID, unitDefID)
		local uDef = UnitDefs[unitDefID]
		if uDef.customParams.prioritytarget and uDef.customParams.prioritytarget == "air" then
			Spring.InsertUnitCmdDesc(unitID, CMD_SET_PRIORITY, setPriorityAirn)
					Spring.SetUnitRulesParam(unitID, "targetPriorityFighters", 1)
					Spring.SetUnitRulesParam(unitID, "targetPriorityBombers", 1)			
					Spring.SetUnitRulesParam(unitID, "targetPriorityScouts", 1000)
		end
	end

	function gadget:AllowCommand(unitID, unitDefID, unitTeam, cmdID, cmdParams, cmdOptions, cmdTag, synced)
		if cmdID == CMD_SET_PRIORITY then
		cmdDescId = Spring.FindUnitCmdDesc(unitID, CMD_SET_PRIORITY) 
			if cmdParams and cmdParams[1] then
				if cmdParams[1] == 0 then
				Spring.EditUnitCmdDesc(unitID, cmdDescId, setPriorityAirf)
				elseif cmdParams[1] == 1 then
				Spring.EditUnitCmdDesc(unitID, cmdDescId, setPriorityAirb)
				elseif cmdParams[1] == 2 then
				Spring.EditUnitCmdDesc(unitID, cmdDescId, setPriorityAirn)
				end
			end
		end
		return true
	end

	function gadget:UnitCommand(unitID, unitDefID, unitTeam, cmdID, cmdParams, cmdOpts, cmdTag)
		if cmdID == CMD_SET_PRIORITY then
			if cmdParams and cmdParams[1] then
				if cmdParams[1] == 0 then
					Spring.SetUnitRulesParam(unitID, "targetPriorityFighters", 0.0001)
					Spring.SetUnitRulesParam(unitID, "targetPriorityBombers", 1)			
					Spring.SetUnitRulesParam(unitID, "targetPriorityScouts", 1000)
				elseif cmdParams[1] == 1 then
					Spring.SetUnitRulesParam(unitID, "targetPriorityFighters", 1)
					Spring.SetUnitRulesParam(unitID, "targetPriorityBombers", 0.0001)			
					Spring.SetUnitRulesParam(unitID, "targetPriorityScouts", 1000)
				elseif cmdParams[1] == 2 then
					Spring.SetUnitRulesParam(unitID, "targetPriorityFighters", 1)
					Spring.SetUnitRulesParam(unitID, "targetPriorityBombers", 1)			
					Spring.SetUnitRulesParam(unitID, "targetPriorityScouts", 1000)
				end
			end
		end
	end

	function gadget:AllowWeaponTarget(unitID, targetID, attackerWeaponNum, attackerWeaponDefID, defPriority)
		local allowed = true
		local unitDefID = Spring.GetUnitDefID(targetID)
		local priority = defPriority
		local hasPriority = (Spring.GetUnitRulesParam(unitID, "targetPriorityFighters") and Spring.GetUnitRulesParam(unitID, "targetPriorityBombers") and Spring.GetUnitRulesParam(unitID, "targetPriorityScouts"))
		if hasPriority then
			if airCategories[unitDefID] then
				priority = priority * Spring.GetUnitRulesParam(unitID, ("targetPriority"..airCategories[unitDefID]))
			end
		end	
		return allowed, priority
	end
end