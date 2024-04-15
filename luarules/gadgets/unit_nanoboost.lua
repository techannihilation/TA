
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = 'Nano Boost',
    desc      = 'Turbo mode for nanos',
    author    = 'Nixtux, Silver', -- based on production rate gadget by Deadnight Warrior
    date      = 'Oct 20, 2007',
    license   = 'GNU GPL, v2 or later',
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--synced
if (gadgetHandler:IsSyncedCode()) then

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--Speed-ups
local GetUnitDefID    = Spring.GetUnitDefID
local FindUnitCmdDesc = Spring.FindUnitCmdDesc
local spInsertUnitCmdDesc = Spring.InsertUnitCmdDesc
local spEditUnitCmdDesc = Spring.EditUnitCmdDesc
local spRemoveUnitCmdDesc = Spring.RemoveUnitCmdDesc
local SpGetUnitPosition = Spring.GetUnitPosition
local SpSpawnCEG = Spring.SpawnCEG
local uDefs = UnitDefs
local SpGetUnitHealth = Spring.GetUnitHealth
local SpAddUnitDamage = Spring.AddUnitDamage
local spSetUnitRulesParam  = Spring.SetUnitRulesParam
local gaiaTeamID = Spring.GetGaiaTeamID()
local comDefs = VFS.Include('luarules/configs/comDefIDs.lua')
local nanos = VFS.Include('luarules/configs/comDefIDs.lua')

CMD_NANOBOOST = 33456
local boostednanos = {} -- list of nanos in boostmode
local buildspeedlist = {}

local buildspeedCmdDesc = {
  id      = CMD_NANOBOOST,
  type    = CMDTYPE.ICON_MODE,
  name    = 'Boost',
  cursor  = 'Boost',
  action  = 'Boost',
  tooltip = 'Divert All power to Construction',
  params  = { '0', 'Boost Off', 'Boost On'}
}

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

    buildspeedCmdDesc.params[1] = '1'
    spInsertUnitCmdDesc(unitID, insertID + 1, buildspeedCmdDesc)
end


local function UpdateButton(unitID, statusStr)
  local cmdDescID = FindUnitCmdDesc(unitID, CMD_NANOBOOST)
  if cmdDescID == nil then return end
  local tooltip

  if statusStr == 0 then
    tooltip = 'Nano operating under normal conditions\n\nNano will operate at a\255\001\255\001 500% boost\255\255\255\255 in an unstable mode\n\255\255\001\001DAMAGE WILL OCCUR.'
  else
    tooltip = 'Boost:\n- Production increased to\255\001\255\001 500%\n\255\255\255\255- Reclamation efficiency at\255\001\255\001 500%\n\255\255\255\255- Repair rate set to\255\001\255\001 250%\n\255\255\255\255Select to revert to normal operations.'
  end

  buildspeedCmdDesc.params[1] = statusStr

  spEditUnitCmdDesc(unitID, cmdDescID, {
    params = buildspeedCmdDesc.params,
    tooltip = tooltip,
  })
end

local function BuildspeedCommand(unitID, unitDefID, cmdParams, teamID)
    if cmdParams[1] == 1 then
        Spring.SetUnitBuildSpeed(unitID, buildspeedlist[unitID].speed * 5.0, buildspeedlist[unitID].repair * 2.5, buildspeedlist[unitID].reclaim * 5.0)
        spSetUnitRulesParam(unitID, 'nanoPower', buildspeedlist[unitID].speed * 5.0)
        spSetUnitRulesParam(unitID, 'nanoBoosted', 1)
        boostednanos[unitID] = true
    else
        Spring.SetUnitBuildSpeed(unitID, buildspeedlist[unitID].speed, buildspeedlist[unitID].repair, buildspeedlist[unitID].reclaim)
        spSetUnitRulesParam(unitID, 'nanoPower', buildspeedlist[unitID].speed)
        spSetUnitRulesParam(unitID, 'nanoBoosted', 0)
        boostednanos[unitID] = nil
    end

    buildspeedlist[unitID].mode = cmdParams[1]
    UpdateButton(unitID, cmdParams[1])
end

function removeButton(unitID, ID)
    local cmdID = FindUnitCmdDesc(unitID, ID)

    if cmdID then
        spRemoveUnitCmdDesc(unitID, cmdID)
    end
end

local boostednanosQueue = {}
local currentDamageCoroutine = nil
local gaussianTable = {}
local tableSize = 1000 -- Number of pre-generated Gaussian values

local function damageUnit(unitID, damage)
    SpAddUnitDamage(unitID, damage, 0, gaiaTeamID, 1)
    local x, y, z = SpGetUnitPosition(unitID)
    SpSpawnCEG('ZEUS_FLASH_SUB', x, y, z, 0, 0, 0)
    SendToUnsynced('boostsound', x, y, z)
end

local function gaussianRandom()
    local u, v, s
    repeat
        u = 2 * math.random() - 1
        v = 2 * math.random() - 1
        s = u * u + v * v
    until s ~= 0 and s < 1
    local mul = math.sqrt(-2.0 * math.log(s) / s)
    return u * mul  -- Only one Gaussian value is generated
end

local function generateGaussianTable()
    for i = 1, tableSize do
        gaussianTable[i] = gaussianRandom()
    end
end

local function getGaussian()
    return gaussianTable[math.random(tableSize)]
end

function processDamage()
    local count = 0
    local boostednanosQueueCount = #boostednanosQueue
    while boostednanosQueueCount > 0 do
        local unitID = table.remove(boostednanosQueue, 1)
        local curhp, hp = SpGetUnitHealth(unitID)

        local stdDev = 0.2
        local constDmg = 0.0004

        local damage = math.abs(curhp * (stdDev * getGaussian())) + (hp * constDmg)

        if damage > 0 then
            damageUnit(unitID, damage)
        end

        count = count + 1
        if count >= 8 then
            count = 0
            coroutine.yield()
        end
    end
end

function gadget:GameFrame(n)
    if n % 31 == 0 then
        if not currentDamageCoroutine or coroutine.status(currentDamageCoroutine) == 'dead' then
            boostednanosQueue = {}
            for unitID in pairs(boostednanos) do
                table.insert(boostednanosQueue, unitID)
            end
            currentDamageCoroutine = coroutine.create(processDamage)
            coroutine.resume(currentDamageCoroutine)
        end
    elseif currentDamageCoroutine and coroutine.status(currentDamageCoroutine) ~= 'dead' then
        coroutine.resume(currentDamageCoroutine)
    end
end

function gadget:AllowCommand(unitID, unitDefID, teamID, cmdID, cmdParams, _)
    if cmdID ~= CMD_NANOBOOST or not nanos[unitDefID] then
        return true
    end
    if cmdParams[1] == 1 then
        local _, hp = SpGetUnitHealth(unitID)
        local damage = hp * 0.015
        damageUnit(unitID, damage)
    end
    BuildspeedCommand(unitID, unitDefID, cmdParams, teamID)
    return false
end

function gadget:UnitCreated(unitID, unitDefID, teamID, builderID)
    local ud = uDefs[unitDefID]
    if nanos[unitDefID] or comDefs[unitDefID] then
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
    generateGaussianTable() -- Generate Gaussian values table on initialization
end

function gadget:Shutdown()
    for _, unitID in ipairs(Spring.GetAllUnits()) do
        local cmdDescID = FindUnitCmdDesc(unitID, CMD_NANOBOOST)
        if (cmdDescID) then
            spRemoveUnitCmdDesc(unitID, cmdDescID)
        end
    end
end

else -- unsynced part here

function gadget:Initialize()
  gadgetHandler:AddSyncAction('boostsound', BoostSound)
end

function BoostSound(_, x, y, z)
    Spring.PlaySoundFile('sounds/lasrhit2.wav', 1.0, x,y,z)
end

end
