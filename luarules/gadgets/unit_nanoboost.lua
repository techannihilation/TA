
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
local uDefs = UnitDefs
local SpGetUnitHealth = Spring.GetUnitHealth

local mrandom = math.random
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

CMD_NANOBOOST = 33456
local boostednanos = {} -- list of nanos in boostmode

local buildspeedlist = {}

local nanos = {
  [UnitDefNames["armnanotc"].id] = true,
  [UnitDefNames["armnanotc1"].id] = true,
  [UnitDefNames["armnanotc2"].id] = true,
  [UnitDefNames["armnanotc3"].id] = true,
  [UnitDefNames["ananotower"].id] = true,
  [UnitDefNames["cornanotc"].id] = true,
  [UnitDefNames["cornanotc1"].id] = true,
  [UnitDefNames["cornanotc2"].id] = true,
  [UnitDefNames["cornanotc3"].id] = true,
  [UnitDefNames["cnanotower"].id] = true,
  [UnitDefNames["tllnanotc"].id] = true,
  [UnitDefNames["tllnanotc1"].id] = true,
  [UnitDefNames["tllnanotc2"].id] = true,
}

local buildspeedCmdDesc = {
  id      = CMD_NANOBOOST,
  type    = CMDTYPE.ICON_MODE,
  name    = 'Boost',
  cursor  = 'Boost',
  action  = 'Boost',
  tooltip = 'Divert All power to Construction',
  params  = { '0', 'Boost', 'Normal'}
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
    tooltip = 'Boost: Production at 180%.\nSelect to Revert to normal production.'
   end

  buildspeedCmdDesc.params[1] = statusStr

  spEditUnitCmdDesc(unitID, cmdDescID, { 
    params  = buildspeedCmdDesc.params, 
    tooltip = tooltip,
  })
end


local function BuildspeedCommand(unitID, unitDefID, cmdParams, teamID)
	if cmdParams[1] == 1 then
		--Spring.Echo("boosted at " .. buildspeedlist[unitID].speed *1.8)
		Spring.SetUnitBuildSpeed(unitID, buildspeedlist[unitID].speed *1.8,0,0)
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
	if nanos[unitDefID] then
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
      	if mrandom(0,1) == 0 then 
	  local _,hp = SpGetUnitHealth(unitID)
	  local damage = mrandom(0,(hp*0.18))
	  --Spring.Echo("hp = " .. hp .."      " .. damage)
	  SpAddUnitDamage(unitID ,damage)
	  local x,y,z = SpGetUnitPosition(unitID)
	  SpSpawnCEG("ZEUS_FLASH_SUB",x,y,z,0,0,0)
      end
    end
  end
end

function gadget:AllowCommand(unitID, unitDefID, teamID, cmdID, cmdParams, _)
	local returnvalue
	if cmdID ~= CMD_NANOBOOST or not nanos[unitDefID] then
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
