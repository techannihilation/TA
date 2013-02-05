
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "Nano Boost",
    desc      = "Turbo mode for nanos",
    author    = "Nixtux", -- based on production rate gadget by Deadnight Warrior
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
local spGetTeamResources = Spring.GetTeamResources
local spInsertUnitCmdDesc = Spring.InsertUnitCmdDesc
local spEditUnitCmdDesc = Spring.EditUnitCmdDesc
local spRemoveUnitCmdDesc = Spring.RemoveUnitCmdDesc
local SpAddUnitDamage = Spring.AddUnitDamage
local SpGetUnitPosition = Spring.GetUnitPosition
local SpSpawnCEG = Spring.SpawnCEG

local mrandom = math.random
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

CMD_NANOBOOST = 33456
local boostednanos = {} -- list of nanos in boostmode

local buildspeedlist = {}

local buildspeedCmdDesc = {
  id      = CMD_NANOBOOST,
  type    = CMDTYPE.ICON_MODE,
  name    = 'Boost',
  cursor  = 'Boost',
  action  = 'Boost',
  tooltip = 'Orders: Production Rate',
  params  = { '0', 'Normal', 'Boost'}
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local function AddBuildspeedCmdDesc(unitID)
  if (FindUnitCmdDesc(unitID, CMD_NANOBOOST)) then
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
    
    --Remove unused button
    removeButton(unitID, CMD.ATTACK)
    removeButton(unitID, CMD.MOVE)
    removeButton(unitID, CMD.FIGHT)
    removeButton(unitID, CMD.FIRE_STATE)
    buildspeedCmdDesc.params[1] = '1'
    spInsertUnitCmdDesc(unitID, insertID + 1, buildspeedCmdDesc)
end


local function UpdateButton(unitID, statusStr)
  local cmdDescID = FindUnitCmdDesc(unitID, CMD_NANOBOOST)
  if (cmdDescID == nil) then
    return
  end

  local tooltip
  if (statusStr == 0) then
    tooltip = 'Nano running in normal opperations\nWarning Boost mode all power diverted to Production\nNano will be running in an unstable mode\nDAMAGE WILL OCCUR'
  else 
    tooltip = 'Boost: Production at 150%.\nSelect to Revert to normal production.'
   end

  buildspeedCmdDesc.params[1] = statusStr

  spEditUnitCmdDesc(unitID, cmdDescID, { 
    params  = buildspeedCmdDesc.params, 
    tooltip = tooltip,
  })
end


local function BuildspeedCommand(unitID, unitDefID, cmdParams, teamID)
	if cmdParams[1] == 1 then
		--Spring.Echo("boosted at " .. buildspeedlist[unitID].speed *1.5)
		Spring.SetUnitBuildSpeed(unitID, buildspeedlist[unitID].speed *1.5,0,0)
		boostednanos[unitID] = true
	else
		--Spring.Echo("not boosted at " .. buildspeedlist[unitID].speed)
		Spring.SetUnitBuildSpeed(unitID, buildspeedlist[unitID].speed, buildspeedlist[unitID].repair, buildspeedlist[unitID].reclaim)
		boostednanos[unitID] = nil
	end
	buildspeedlist[unitID].mode=cmdParams[1]
	UpdateButton(unitID, cmdParams[1])
end

function removeButton(unitID, ID)
  local cmdID = FindUnitCmdDesc(unitID, ID)
  if cmdID then
    spRemoveUnitCmdDesc(unitID, cmdID)
  end
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:UnitCreated(unitID, unitDefID, teamID, builderID)
	local ud = UnitDefs[unitDefID]
	if (ud.builder==true and (ud.name:find("nanotc",1,true) or ud.name:find("nanotower",1,true))) then
		local stMode = 0
		buildspeedlist[unitID]={speed=ud.buildSpeed, repair=ud.repairSpeed, reclaim=ud.reclaimSpeed, mode=stMode}
		AddBuildspeedCmdDesc(unitID)
		UpdateButton(unitID, stMode)
	end
end

function gadget:UnitDestroyed(unitID, _, teamID)
	buildspeedlist[unitID] = nil
	boostednanos[unitID] = nil
end

function gadget:Initialize()
	gadgetHandler:RegisterCMDID(CMD_NANOBOOST)
	for _, unitID in ipairs(Spring.GetAllUnits()) do
		local teamID = Spring.GetUnitTeam(unitID)
		local unitDefID = GetUnitDefID(unitID)
		gadget:UnitCreated(unitID, unitDefID, teamID)
	end
end

function gadget:GameFrame(n)
  if n % 128 == 0 then
    for unitID in pairs(boostednanos) do
      local x,y,z = SpGetUnitPosition(unitID)
      SpSpawnCEG("ZEUS_FLASH_SUB",x,y,z,0,0,0)
      damage = mrandom(0,140)
      --Spring.Echo("Damage added in frame " .. n .. "   Dps = " .. damage)
      SpAddUnitDamage(unitID ,damage)
    end
  end
end

function gadget:AllowCommand(unitID, unitDefID, teamID, cmdID, cmdParams, _)
	local returnvalue
	if cmdID ~= CMD_NANOBOOST or UnitDefs[unitDefID].buildSpeed==0 then
		return true
	end
	BuildspeedCommand(unitID, unitDefID, cmdParams, teamID)  
	return false
end

function gadget:Shutdown()
	for _, unitID in ipairs(Spring.GetAllUnits()) do
		local cmdDescID = FindUnitCmdDesc(unitID, CMD_NANOBOOST)
		if (cmdDescID) then
			spRemoveUnitCmdDesc(unitID, cmdDescID)
		end
	end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
