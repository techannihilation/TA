local versionNumber = "1.2"

function gadget:GetInfo()
	return {
	name = "Factory Guard",
	desc = "Factory Guard",
	author = "nix", --jools
	date = "Jun, 2013",
	license = "gpl",
	layer = 2,
	enabled = true,
	}
end

-- Shared SYNCED/UNSYNCED

CMD_FACTORYGUARD 						= 37460 
local SetCustomCommandDrawData					= Spring.SetCustomCommandDrawData
local FindUnitCmdDesc 						= Spring.FindUnitCmdDesc

if (gadgetHandler:IsSyncedCode()) then

--SYNCED


local Echo 							= Spring.Echo
local EditUnitCmdDesc						= Spring.EditUnitCmdDesc
local FindUnitCmdDesc						= Spring.FindUnitCmdDesc
local InsertUnitCmdDesc						= Spring.InsertUnitCmdDesc
local GetUnitDefID						= Spring.GetUnitDefID

local defaultTeamSetting = {}

local factoryGuardCmd = {
  id      = CMD_FACTORYGUARD,
  type    = CMDTYPE.ICON_MODE,
  name    = 'Factory guard',
  cursor  = 'Guard',
  tooltip = 'Factory guard: pass through share of units guarding factory',
  params  = { '0', 'Pass none', 'Pass 25%', 'Pass 50%', 'Pass 75%', 'Pass 100%'},
  hidden = true,
}

local function SetFactoryValues(unitID,guardLimit)
	local nbGuard, nbPass
	if guardLimit == 0 then -- pass none
		nbGuard = 1
		nbPass = -9 -- not used
	elseif guardLimit == 4 then -- pass all
		nbGuard = -1
		nbPass = 9 -- not used
	elseif guardLimit == 1 then -- pass 25%
		nbGuard = 3
		nbPass = 1
	elseif guardLimit == 2 then -- pass 50 %
		nbGuard = 1
		nbPass = 1
	elseif guardLimit == 3 then -- pass 75 %
		nbGuard = 1
		nbPass = 3
	end
	Spring.SetUnitRulesParam(unitID,"nbGuard",nbGuard)
	Spring.SetUnitRulesParam(unitID,"nbPass",nbPass)
end

local function UpdateFactoryButton(unitID, newValue)
	local cmdDescID = FindUnitCmdDesc(unitID, CMD_FACTORYGUARD)
	if (cmdDescID == nil) then
		return
	end
	
	factoryGuardCmd.params[1] = newValue
	EditUnitCmdDesc(unitID, cmdDescID, {params  = factoryGuardCmd.params})
	SetFactoryValues(unitID,newValue)
	Spring.SetUnitRulesParam(unitID,"FactoryGuard",newValue)
end

function gadget:UnitFromFactory(unitID, unitDefID, unitTeam, factID,factDefID,_)
	local uD = UnitDefs[unitDefID]
		
	if uD and uD.canGuard and not uD.isFactory and uD.isBuilder and uD.canAssist then
		local guardLimit = Spring.GetUnitRulesParam(factID,"FactoryGuard")
		
		if not guardLimit then return end
		if guardLimit == 4 or guardLimit == 0 then
			return -- no updates needed for trivial cases
		else
			local nbGuard = Spring.GetUnitRulesParam(factID,"nbGuard")
			local nbPass = Spring.GetUnitRulesParam(factID,"nbPass")
			
			if nbGuard == 0 and nbPass == 0 then
				SetFactoryValues(factID,guardLimit)
			else
				if nbGuard > 0 then
					nbGuard = nbGuard - 1
					Spring.SetUnitRulesParam(factID,"nbGuard",nbGuard)
				elseif nbPass > 0 then					
					nbPass = nbPass - 1
					Spring.SetUnitRulesParam(factID,"nbPass",nbPass)
					if nbPass == 0 then
						SetFactoryValues(factID,guardLimit)
					end
				end
			end
		end
	end
end

function gadget:Initialize()
	gadgetHandler:RegisterCMDID(CMD_FACTORYGUARD)
		
	for _, unitID in ipairs(Spring.GetAllUnits()) do
		local unitDefID = GetUnitDefID(unitID)
		gadget:UnitCreated(unitID, unitDefID, team)
	end
end

function gadget:AllowCommand(unitID, unitDefID, teamID, cmdID, cmdParams, _)
	
	if cmdID ~= CMD_FACTORYGUARD then
		return true
	end
	
	local newValue = cmdParams[1]
	local fd = UnitDefs[unitDefID]
	defaultTeamSetting[teamID] = newValue
	
	if fd and fd.isFactory then
		UpdateFactoryButton(unitID,newValue)
	end
	
	return false
end

function gadget:UnitCreated(unitID, unitDefID, teamID)
	local uD = UnitDefs[unitDefID]
	if uD and uD.isFactory then
		if not (FindUnitCmdDesc(unitID, CMD_FACTORYGUARD)) then
			InsertUnitCmdDesc(unitID, 74, factoryGuardCmd)
			UpdateFactoryButton(unitID,defaultTeamSetting[teamID] or 0)
		end
	end
end

else 
--UNSYNCED
end