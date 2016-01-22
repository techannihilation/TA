
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "Production Rate",
    desc      = "Adds a button that sets the production rate for a factory or sets it passive",
    author    = "CAKE modified by Deadnight Warrior", --uses code from Niobium's Passive Builders as well
    date      = "Oct 20, 2007",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

if (not gadgetHandler:IsSyncedCode()) then
  return false  --  silent removal
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--Speed-ups
local GetUnitDefID    = Spring.GetUnitDefID
local FindUnitCmdDesc = Spring.FindUnitCmdDesc
local SetUnitBuildspeed = Spring.SetUnitBuildSpeed
local spGetTeamResources = Spring.GetTeamResources
local spInsertUnitCmdDesc = Spring.InsertUnitCmdDesc
local spEditUnitCmdDesc = Spring.EditUnitCmdDesc
local spRemoveUnitCmdDesc = Spring.RemoveUnitCmdDesc
local Echo = Spring.Echo
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

CMD_BUILDSPEED = 33455
local passiveBuilders 			= {} -- passiveBuilders[uID] = nil / bool
local requiresMetal			 	= {} -- requiresMetal[uDefID] = bool
local requiresEnergy 			= {} -- requiresEnergy[uDefID] = bool
local teamList 					= {} -- teamList[1..n] = teamID
local teamMetalStalling 		= {} -- teamStalling[teamID] = nil / bool
local teamEnergyStalling 		= {} -- teamStalling[teamID] = nil / bool
local modOptions    			= Spring.GetModOptions()
local buildspeedlist 			= {}
local builderSpeeds				= {}
local nanoTurretDefs			= {}
local excludeUnits				= {}


local buildspeedCmdDesc = {
  id      = CMD_BUILDSPEED,
  type    = CMDTYPE.ICON_MODE,
  name    = 'Production',
  cursor  = 'Production',
  action  = 'Production',
  tooltip = 'Orders: Production Rate',
  params  = { '0', 'Passive', '25%', '50%', '75%', '100%'}
}
  
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local function AddBuildspeedCmdDesc(unitID)
  if (FindUnitCmdDesc(unitID, CMD_BUILDSPEED)) then
    return  -- already exists
  end
  local insertID = 
    FindUnitCmdDesc(unitID, CMD.CLOAK)      or
    FindUnitCmdDesc(unitID, CMD.ONOFF)      or
    FindUnitCmdDesc(unitID, CMD.TRAJECTORY) or
    FindUnitCmdDesc(unitID, CMD.REPEAT)     or
    FindUnitCmdDesc(unitID, CMD.MOVE_STATE) or
    FindUnitCmdDesc(unitID, CMD.FIRE_STATE) or
    123456 -- back of the pack
  buildspeedCmdDesc.params[1] = '1'
  spInsertUnitCmdDesc(unitID, insertID + 1, buildspeedCmdDesc)
end

local function UpdateButton(unitID, statusStr)
  local cmdDescID = FindUnitCmdDesc(unitID, CMD_BUILDSPEED)
  if (cmdDescID == nil) then
    return
  end

  local tooltip
  if (statusStr == 0) then
    tooltip = 'Orders: Production halted when resource stalling.'
  elseif (statusStr == 1) then
    tooltip = 'Orders: Production at 25%.'
  elseif (statusStr == 2) then
    tooltip = 'Orders: Production at 50%.'
  elseif (statusStr == 3) then
    tooltip = 'Orders: Production at 75%.'
  else
    tooltip = 'Orders: Full Production.'
  end

  buildspeedCmdDesc.params[1] = statusStr

  spEditUnitCmdDesc(unitID, cmdDescID, { 
    params  = buildspeedCmdDesc.params, 
    tooltip = tooltip,
  })
end

local function BuildspeedCommand(unitID, unitDefID, cmdParams, teamID)
	if cmdParams[1] == 1 then
		Spring.SetUnitBuildSpeed(unitID, buildspeedlist[unitID].speed *.25)
	elseif cmdParams[1] == 2 then
		Spring.SetUnitBuildSpeed(unitID, buildspeedlist[unitID].speed*.5)
	elseif cmdParams[1] == 3 then
		Spring.SetUnitBuildSpeed(unitID, buildspeedlist[unitID].speed*.75)
	else
		Spring.SetUnitBuildSpeed(unitID, buildspeedlist[unitID].speed)
	end
	buildspeedlist[unitID].mode=cmdParams[1]
	UpdateButton(unitID, cmdParams[1])
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:Initialize()
	if modOptions and modOptions.buildspeed and modOptions.buildspeed == '0' then
		gadgetHandler:RemoveGadget()
		return
	end
	
	for uDefID, uDef in pairs(UnitDefs) do
		requiresMetal[uDefID] = (uDef.metalCost > 1) -- T1 metal makers cost 1 metal.
		requiresEnergy[uDefID] = (uDef.energyCost > 0) -- T1 solars cost 0 energy.
		
		if (uDef.isBuilder==true and #uDef.buildOptions>0 or uDef.name:find("_nano_tower",1,true)) then
			if not excludeUnits[uDefID] then
				builderSpeeds[uDefID] = uDef.buildSpeed
				
				if uDef.name:find("_nano_tower",1,true) then
					nanoTurretDefs[uDefID] = true
				end
			end
		end	
	end
	teamList = Spring.GetTeamList()
	gadgetHandler:RegisterCMDID(CMD_BUILDSPEED)
	for _, unitID in ipairs(Spring.GetAllUnits()) do
		local teamID = Spring.GetUnitTeam(unitID)
		local unitDefID = GetUnitDefID(unitID)
		gadget:UnitCreated(unitID, unitDefID, teamID)
	end
	
end

function gadget:UnitCreated(unitID, unitDefID, teamID, builderID)
	
	if builderSpeeds[unitDefID] then
		local stMode = (nanoTurretDefs[unitDefID] and 0) or 4
		buildspeedlist[unitID]={speed=builderSpeeds[unitDefID], mode=stMode}
		AddBuildspeedCmdDesc(unitID)
		UpdateButton(unitID, stMode)
	end
end

function gadget:UnitDestroyed(unitID, _, teamID)
	buildspeedlist[unitID] = nil
end

function gadget:GameFrame(n)
	if n % 16 == 0 then
		for i = 1, #teamList do
			local teamID = teamList[i]
			local mCur, mStor, mPull, mInc, mExp, mShare, mSent, mRec, mExc = spGetTeamResources(teamID, 'metal')
			local eCur, eStor, ePull, eInc, eExp, eShare, eSent, eRec, eExc = spGetTeamResources(teamID, 'energy')
			-- stabilize the situation if storage is small
			if ePull > eExp then
				eCur = eCur - (ePull - eExp)
			end
			if eExc > 0 then
				eCur = eCur + eExc
			end            
			if mPull > mExp then
				mCur = mCur - (mPull - mExp)
			end
			if mExc > 0 then
				mCur = mCur + mExc
			end
			-- never consider it a stall if the actual combined income is higher than the total expense
			teamMetalStalling[teamID] = (mCur < 0.5 * mPull) and ((mInc + mRec) <= (mExp*1.1 + mSent))
			teamEnergyStalling[teamID] = (eCur < 0.5 * ePull) and ((eInc + eRec) <= (eExp*1.1 + eSent))
		end
	end
end

function gadget:AllowUnitBuildStep(builderID, builderTeamID, uID, uDefID, step)
	if buildspeedlist[builderID] then
				
		return (step <= 0) or buildspeedlist[builderID].mode~=0 or not ((teamMetalStalling[builderTeamID] and requiresMetal[uDefID]) or (teamEnergyStalling[builderTeamID] and requiresEnergy[uDefID]))
	else
		return true
	end
end

function gadget:AllowCommand(unitID, unitDefID, teamID, cmdID, cmdParams, _)
	local returnvalue
	if cmdID ~= CMD_BUILDSPEED or UnitDefs[unitDefID].buildSpeed==0 then
		return true
	end
	BuildspeedCommand(unitID, unitDefID, cmdParams, teamID)  
	return false
end

function gadget:Shutdown()
	for _, unitID in ipairs(Spring.GetAllUnits()) do
		local cmdDescID = FindUnitCmdDesc(unitID, CMD_BUILDSPEED)
		if (cmdDescID) then
			spRemoveUnitCmdDesc(unitID, cmdDescID)
		end
	end
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
