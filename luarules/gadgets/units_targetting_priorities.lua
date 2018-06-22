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
	tooltip = 'Toggle for target type priority',
	queueing = false,
	params  = { '0', 'Fighters', 'Bombers', 'none'} ,
}
local setPriorityAirb = {
	id      = CMD_SET_PRIORITY,
	type    = CMDTYPE.ICON_MODE,
	name    = 'Set Priority',
	action  = 'setpriority',
	tooltip = 'Toggle for target type priority',
	queueing = false,
	params  = { '1', 'Fighters', 'Bombers', 'none'} ,
}
local setPriorityAirn = {
	id      = CMD_SET_PRIORITY,
	type    = CMDTYPE.ICON_MODE,
	name    = 'Set Priority',
	action  = 'setpriority',
	tooltip = 'Toggle for target type priority',
	queueing = false,
	params  = { '2', 'Fighters', 'Bombers', 'No priority'} ,
}
airCategories = {
	--Transporters
	armatlas = "Bombers",
	armdfly = "Bombers",
	armdragf = "Bombers",
	armsl = "Bombers",
	corfalc = "Bombers",
	corvalk = "Bombers",
	tllrobber = "Bombers",
	tlltplane = "Bombers",
	armor = "Bombers",
	corbtrans = "Bombers",

	--Bombers
	armblz = "Bombers",
	corfiend = "Bombers",
	armcybr = "Bombers",
	armlance = "Bombers",
	armpnix = "Bombers",
	armsb = "Bombers",
	armthund = "Bombers",
	armcyclone = "Bombers",
	corgripn = "Bombers",
	corhurc = "Bombers",
	corsb = "Bombers",
	corshad = "Bombers",
	cortitan = "Bombers",
	tllabomber = "Bombers",
	tllbomber = "Bombers",
	tlltorpp = "Bombers",
	coreclipse = "Bombers",
	tllseab = "Bombers",
	corseap = "Bombers",
	armseap = "Bombers",
	corsbomb = "Bombers",
	armorion = "Bombers",
	tllanhur = "Bombers",
	tllaether = "Bombers",

    airwolf3g = "Fighters",
	armfig	 = "Fighters",
	armhawk	 = "Fighters",
	armsfig	 = "Fighters",
	corsfig	 = "Fighters",
	corvamp	 = "Fighters",
	corveng	 = "Fighters",
	shrike	 = "Fighters",
	tlladvfight	 = "Fighters",
	tllfight = "Fighters",
	tllseaf	 = "Fighters",
	tllshu = "Fighters",
	armstratus = "Fighters",
	corshoc = "Fighters",
	tllcondor = "Fighters",

	--Scouts
	armpeep = "Scouts",
	armawac = "Scouts",
	armsehak = "Scouts",
	corfink = "Scouts",
	corawac = "Scouts",
	corhunt = "Scouts",
	tllprob = "Scouts",
	tllrsplane = "Scouts",
	tllsonpl = "Scouts"
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
		local unitName = UnitDefs[Spring.GetUnitDefID(targetID)].name
		local priority = defPriority
		local hasPriority = (Spring.GetUnitRulesParam(unitID, "targetPriorityFighters") and Spring.GetUnitRulesParam(unitID, "targetPriorityBombers") and Spring.GetUnitRulesParam(unitID, "targetPriorityScouts"))
		if hasPriority then
			if airCategories[unitName] then
				priority = priority * Spring.GetUnitRulesParam(unitID, ("targetPriority"..airCategories[unitName]))
			end
		end	
		return allowed, priority
	end
end