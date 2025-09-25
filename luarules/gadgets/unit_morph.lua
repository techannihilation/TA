---- $Id: unit_morph.lua 4651 2009-05-23 17:04:46Z carrepairer $
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    unit_morph.lua
--  brief:   Adds unit morphing command
--  author:  Dave Rodgers (improved by jK, Licho and aegis)
--
--  Copyright (C) 2007.
--  Licensed under the terms of the GNU GPL, v2 or later.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "UnitMorph",
    desc      = "Adds unit morphing",
    author    = "trepan (improved by jK, Licho, aegis, CarRepairer), nixtux",
    date      = "Jan, 2008",
    license   = "GNU GPL, v2 or later",
    layer     = -1,
    enabled   = true
  }
end
-- Changes for TechA
-- Fix Rc not being factory to unlock morph
-- Fix level output for our needs
-- Fix failed morph when unit limit is reached, they now stall until unit limit is lowered
-- Fix all morphs ending on same frame, now they stagger there starting frame


-- Changes for "The Cursed"
--    CarRepairer: may add a customized texture in the morphdefs, otherwise uses original behavior (unit buildicon and the word Morph). Break changes made in CA.
--    aZaremoth: may add a customized text in the morphdefs


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
-- Interface with other gadgets:
--
--
-- During Initialize() this morph gadget creates a global table, GG.MorphInfo, from which you can read:
--
-- GG.MorphInfo[unitDefId] -- nil if for units that can't morph, otherwise a table, of key=destinationUnitDefId, value=morphCmdId
--
-- GG.MorphInfo["MAX_MORPH"] -- the number of morph handled
--
-- GG.MorphInfo["CMD_MORPH_BASE_ID"] -- The CMD ID of the generic morph command
-- GG.MorphInfo["CMD_MORPH_BASE_ID"]+1 -- The CMD ID of the first specific morph command
-- GG.MorphInfo["CMD_MORPH_BASE_ID"]+GG.MorphInfo["MAX_MORPH"] -- The CMD ID of the last specific morph command
--
-- GG.MorphInfo["CMD_MORPH_STOP_BASE_ID"] -- The CMD ID of the generic morph stop command
-- GG.MorphInfo["CMD_MORPH_STOP_BASE_ID"]+1 -- The CMD ID of the first specific morph stop command
-- GG.MorphInfo["CMD_MORPH_STOP_BASE_ID"]+GG.MorphInfo["MAX_MORPH"] -- The CMD ID of the last specific morph stop command
--
-- Thus other gadgets can know which morphing commands are available
-- Then they can simply issue:
--    Spring.GiveOrderToUnit(u,genericMorphCmdID,{},{})
-- or Spring.GiveOrderToUnit(u,genericMorphCmdID,{targetUnitDefId},{})
-- or Spring.GiveOrderToUnit(u,specificMorphCmdID,{},{})
--
-- where:
-- genericMorphCmdID is the same unique value, no matter what is the source unit or target unit
-- specificMorphCmdID is a different value for each source<->target morphing pair
--

--[[ Sample codes that could be used in other gadgets:

  -- Morph unit u
  Spring.GiveOrderToUnit(u,31210,{},{})

  -- Morph unit u into a supertank:
  local otherDefId=UnitDefNames["supertank"].id
  Spring.GiveOrderToUnit(u,31210,{otherDefId},{})

  -- In place of writing 31210 you could use a morphCmdID that you'd read with:
  local morphCmdID=(GG.MorphInfo or {})["CMD_MORPH_BASE_ID"]
  if not morphCmdID then
    Spring.Echo("Error! Can't find Morph Cmd ID!"")
    return
  end

  -- Print all the morphing possibilities:
  for src,morph in pairs(GG.MorphInfo) do
    if type(src)=="number" then
      local txt=UnitDefs[src].name.." may morph into "
      for dst,cmd in pairs(morph) do
        txt=txt..UnitDefs[src].name.." with CMD "..cmd
      end
      Spring.Echo(txt)
    end
  end

]]--

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  Proposed Command ID Ranges:
--
--    all negative:  Engine (build commands)
--       0 -   999:  Engine
--    1000 -  9999:  Group AI
--   10000 - 19999:  LuaUI
--   20000 - 29999:  LuaCob
--   30000 - 39999:  LuaRules
--

local CMD_MORPH_STOP = 32410
local CMD_MORPH = 31410

local floor = math.floor
local pi = math.pi
local abs = math.abs
local huge = math.huge
local min = math.min

local SpGetUnitHealth = Spring.GetUnitHealth
local SpGetTeamUnits = Spring.GetTeamUnits
local SpGetUnitExperience = Spring.GetUnitExperience
local SpGetUnitDefID = Spring.GetUnitDefID
local SpGetTeamList = Spring.GetTeamList
local SpGetUnitAllyTeam = Spring.GetUnitAllyTeam
local SpSetUnitHealth = Spring.SetUnitHealth
local SpEditUnitCmdDesc = Spring.EditUnitCmdDesc
local SpFindUnitCmdDesc = Spring.FindUnitCmdDesc
local SpInsertUnitCmdDesc = Spring.InsertUnitCmdDesc
local SpGetCommandQueue = Spring.GetCommandQueue
local SpGiveOrderToUnit = Spring.GiveOrderToUnit
local SpSetUnitResourcing = Spring.SetUnitResourcing
local SpAddUnitResource = Spring.AddUnitResource
local SpGetUnitBasePosition = Spring.GetUnitBasePosition
local SpGetUnitHeading = Spring.GetUnitHeading
local SpSetUnitBlocking = Spring.SetUnitBlocking
local SpCreateUnit = Spring.CreateUnit
local SpSetUnitPosition = Spring.SetUnitPosition
local SpSetUnitRotation = Spring.SetUnitRotation
local SpSetUnitExperience = Spring.SetUnitExperience
local SpGetUnitStates = Spring.GetUnitStates
local SpGiveOrderArrayToUnitArray = Spring.GiveOrderArrayToUnitArray
local SpGetUnitCommands = Spring.GetUnitCommands
local SpGetAllUnits = Spring.GetAllUnits
local SpGetUnitShieldState = Spring.GetUnitShieldState
local SpSetUnitShieldState = Spring.SetUnitShieldState
local SpDestroyUnit = Spring.DestroyUnit
local SpGetUnitTransporter = Spring.GetUnitTransporter
local SpUseUnitResource = Spring.UseUnitResource
local GetUnitTeam = Spring.GetUnitTeam
local SpRemoveUnitCmdDesc = Spring.RemoveUnitCmdDesc
local SpGetTeamInfo = Spring.GetTeamInfo
local spGetUnitRulesParam = Spring.GetUnitRulesParam

local CMD_GUARD = CMD.GUARD
local CMD_INSERT = CMD.INSERT
local CMD_REMOVE = CMD.REMOVE
local CMD_ONOFF = CMD.ONOFF
local CMD_FIRE_STATE = CMD.FIRE_STATE
local CMD_MOVE_STATE = CMD.MOVE_STATE
local CMD_REPEAT = CMD.REPEAT
local CMD_TRAJECTORY = CMD.TRAJECTORY
local CMD_STOP = CMD.STOP
local CMD_SELFD = CMD.SELFD
local CMD_WANT_CLOAK = 37382

local MAXunits = tonumber(Spring.GetModOptions().maxunits) or 500 --

local morphPenalty = 1.0
local MAX_MORPH = 0 --// will increase dynamically
local expMulti = 0 -- new unit xp multiplier

local nanos = {
  --Arm
  [UnitDefNames["armnanotc"].id] = true,
  [UnitDefNames["armnanotc1"].id] = true,
  [UnitDefNames["armnanotc2"].id] = true,
  [UnitDefNames["armnanotc3"].id] = true,
  [UnitDefNames["armfnanotc"].id] = true,
  [UnitDefNames["armfnanotc1"].id] = true,
  [UnitDefNames["armfnanotc2"].id] = true,

  --Core
  [UnitDefNames["cornanotc"].id] = true,
  [UnitDefNames["cornanotc1"].id] = true,
  [UnitDefNames["cornanotc2"].id] = true,
  [UnitDefNames["cornanotc3"].id] = true,
  [UnitDefNames["corfnanotc"].id] = true,
  [UnitDefNames["corfnanotc1"].id] = true,
  [UnitDefNames["corfnanotc2"].id] = true,

  --Tll
  [UnitDefNames["tllnanotc"].id] = true,
  [UnitDefNames["tllnanotc1"].id] = true,
  [UnitDefNames["tllnanotc2"].id] = true,
  [UnitDefNames["tllnanotc3"].id] = true,
  [UnitDefNames["tllfnanotc"].id] = true,
  [UnitDefNames["tllfnanotc1"].id] = true,
  [UnitDefNames["tllfnanotc2"].id] = true,

  --Talon
  [UnitDefNames["talon_nanotc"].id] = true,
  [UnitDefNames["talon_nanotc1"].id] = true,
  [UnitDefNames["talon_nanotc2"].id] = true,
  [UnitDefNames["talon_nanotc3"].id] = true,
  [UnitDefNames["talon_fnanotc"].id] = true,
  [UnitDefNames["talon_fnanotc1"].id] = true,
  [UnitDefNames["talon_fnanotc2"].id] = true,

  --Gok
  [UnitDefNames["gok_nanotc"].id] = true,
  [UnitDefNames["gok_nanotc1"].id] = true,
  [UnitDefNames["gok_nanotc2"].id] = true,
  [UnitDefNames["gok_nanotc3"].id] = true,
  [UnitDefNames["gok_fnanotc"].id] = true,
  [UnitDefNames["gok_fnanotc1"].id] = true,
  [UnitDefNames["gok_fnanotc2"].id] = true,

    --Rumad
    [UnitDefNames["rumad_nanotc"].id] = true,
    [UnitDefNames["rumad_nanotc1"].id] = true,
    [UnitDefNames["rumad_nanotc2"].id] = true,
    [UnitDefNames["rumad_nanotc3"].id] = true,
    [UnitDefNames["rumad_nanotc4"].id] = true,
    --[UnitDefNames["rumad_fnanotc"].id] = true,
    --[UnitDefNames["rumad_fnanotc1"].id] = true,
    --[UnitDefNames["rumad_fnanotc2"].id] = true,
}

--------------------------------------------------------------------------------
--  COMMON
--------------------------------------------------------------------------------

--[[ // for use with any mod -_-
function GetTechLevel(udid)
  local ud = UnitDefs[udid];
  return (ud and ud.techLevel) or 0
end
]]--

-- // for use with mods like CA <_<
local function GetTechLevel(UnitDefID)
  --return UnitDefs[UnitDefID].techLevel or 0
  local cats = UnitDefs[UnitDefID].modCategories
  if (cats) then
    --// bugfix, cuz lua don't remove uppercase :(
    if     (cats["LEVEL1"]) then return 1
    elseif (cats["LEVEL2"]) then return 2
    elseif (cats["LEVEL3"]) then return 3
    elseif (cats["LEVEL4"]) then return 4
    elseif (cats["level1"]) then return 1
    elseif (cats["level2"]) then return 2
    elseif (cats["level3"]) then return 3
    elseif (cats["level4"]) then return 4
    end
  end
  return 0
end

local function isFactory(UnitDefID)
  return UnitDefs[UnitDefID].isFactory or UnitDefs[UnitDefID].customParams.ismorphingrc or false
end


local function isFinished(UnitID)
  local _,_,_,_,buildProgress = SpGetUnitHealth(UnitID)
  return (buildProgress==nil)or(buildProgress>=1)
end

local function HeadingToFacing(heading)
        return floor((heading + 8192) / 16384) % 4
end

--// translate lowercase UnitNames to real unitname (with upper-/lowercases)
local defNamesL = {}
for defName in pairs(UnitDefNames) do
  defNamesL[string.lower(defName)] = defName
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


local function DefCost(paramName, udSrc, udDst)
  local pSrc = udSrc[paramName]
  local pDst = udDst[paramName]
  if ((not pSrc) or (not pDst) or
      (type(pSrc) ~= 'number') or
      (type(pDst) ~= 'number')) then
    return 0
  end
  local cost = (pDst - pSrc) * morphPenalty
  if (cost < 0) then
    cost = 0
  end
  return floor(cost)
end

local function BuildMorphDef(udSrc, morphData)
  local udDst = UnitDefNames[defNamesL[string.lower(morphData.into)] or -1]
  if (not udDst) then
    Spring.Echo('Morph gadget: Bad morph dst type: ' .. morphData.into)
    return
  else
    local unitDef = udDst
    local newData = {}
    newData.into = udDst.id
    newData.time = morphData.time or floor(unitDef.buildTime*7/upgradingBuildSpeed)
    newData.increment = (1 / (30 * newData.time))
    newData.metal  = (morphData.metal  or DefCost('metalCost',  udSrc, udDst))
    newData.energy = (morphData.energy or DefCost('energyCost', udSrc, udDst))
    newData.resTable = {
      m = (newData.increment * newData.metal),
      e = (newData.increment * newData.energy)
    }
    newData.tech = morphData.tech or 0
    newData.research = morphData.research or nil 
    newData.xp   = morphData.xp or 0
    newData.rank = morphData.rank or 0
    newData.facing = morphData.facing
    local require = -1
    if (morphData.require) then
      require = (UnitDefNames[defNamesL[string.lower(morphData.require)] or -1] or {}).id
      if (require) then
        reqDefIDs[require]=true
      else
        Spring.Echo('Morph gadget: Bad morph requirement: ' .. morphData.require)
        require = -1
      end
    end
    newData.require = require

    MAX_MORPH = MAX_MORPH + 1 -- CMD_MORPH is the "generic" morph command. "Specific" morph command start at CMD_MORPH+1
    newData.cmd     = CMD_MORPH      + MAX_MORPH
    newData.stopCmd = CMD_MORPH_STOP + MAX_MORPH

    if (type(GG.MorphInfo)~="table") then
        GG.MorphInfo = {["CMD_MORPH_BASE_ID"]=CMD_MORPH,["CMD_MORPH_STOP_BASE_ID"]=CMD_MORPH_STOP}
    end
    if (type(GG.MorphInfo[udSrc.id])~="table") then
        GG.MorphInfo[udSrc.id]={}
    end
    GG.MorphInfo[udSrc.id][udDst.id]=newData.cmd
    GG.MorphInfo["MAX_MORPH"] = MAX_MORPH

    newData.texture = morphData.texture
    newData.text = morphData.text
    return newData
  end
end

local function ValidateMorphDefs(mds)
  local newDefs = {}
  for src,morphData in pairs(mds) do
    local udSrc = UnitDefNames[defNamesL[string.lower(src)] or -1]
    if (not udSrc) then
      Spring.Echo('Morph gadget: Bad morph src type: ' .. src)
    else
      newDefs[udSrc.id] = {}
      if (morphData.into) then
        local morphDef = BuildMorphDef(udSrc, morphData)
        if (morphDef) then newDefs[udSrc.id][morphDef.cmd] = morphDef end
      else
        for _,morphData in pairs(morphData) do
          local morphDef = BuildMorphDef(udSrc, morphData)
          if (morphDef) then newDefs[udSrc.id][morphDef.cmd] = morphDef end
        end
      end
    end
  end
  return newDefs
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


if (gadgetHandler:IsSyncedCode()) then
--------------------------------------------------------------------------------
--  SYNCED
--------------------------------------------------------------------------------

include("LuaRules/colors.h.lua")

local stopPenalty  = 0.667
local upgradingBuildSpeed = 250
local XpScale = 0.50

local XpMorphUnits = {}

local devolution = true            --// remove upgrade capabilities after factory destruction?
local stopMorphOnDevolution = true --// should morphing stop during devolution

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local morphDefs  = {} --// make it global in Initialize()
local morphUnits = {} --// make it global in Initialize()
local reqDefIDs  = {} --// all possible unitDefID's, which are used as a requirement for a morph
local morphToStart = {} -- morphes to start next frame

--// per team techlevel and owned MorphReq. units table
local teamTechLevel = {}
local teamReqUnits  = {}
local teamList = SpGetTeamList()
local teamInvalidFactories = {}
for i=1,#teamList do
  local teamID = teamList[i]
  teamReqUnits[teamID]  = {}
  teamTechLevel[teamID] = 0
  teamInvalidFactories[teamID] = {}
end

CMD_PASSIVE = 34571
CMD_NANOBOOST = 33456

local morphCmdDesc = {
--  id     = CMD_MORPH, -- added by the calling function because there is now more than one option
  type   = CMDTYPE.ICON,
  name   = 'Morph',
  cursor = 'Morph',  -- add with LuaUI?
  action = 'morph',
}

--// will be replaced in Initialize()
local RankToXp    = function() return 0 end
local GetUnitRank = function() return 0 end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local function SplitNames(name)
  local Desc = "Morph \n"
  local string = tostring(name)
  local longestword = 1
  for word in string.gmatch(string,"%w+") do
    if string.len(word) > longestword then
      longestword = string.len(word)
    end
  end
  for word in string.gmatch(string,"%w+") do
    padding = math.floor(longestword-string.len(word))
    for p = 1, padding do
      Desc =  Desc .. " "
    end
    Desc =  Desc .. word .. "\n"
  end
return Desc
end

local function UnitReqCheck(teamID, reqUnit)
  if (reqUnit==-1) then return true end

  return ((teamReqUnits[teamID][reqUnit] or 0) > 0)
end

local function GetMorphToolTip(unitID, unitDefID, teamID, morphDef, teamTech, unitXP, unitRank, teamOwnsReqUnit)
  local ud = UnitDefs[morphDef.into]
  local tt = ''
  --tt = tt .. 'UnitID ' .. unitID .. '\n'
  tt = tt .. 'UnitDefID ' .. morphDef.into .. '\n'
  if (morphDef.text ~= nil) then
    tt = tt .. WhiteStr  .. morphDef.text .. '\n'
  else
  --add prefix
  if(morphDef.research == nil) then
    --normal morph prefix
    tt = tt .. 'Morph into a ' .. ud.humanName .. '\n'
  else
    --research prefix
    tt = tt .. 'Research tech level ' .. (morphDef.research + 1) .. '\n'
  end
  end
  if (morphDef.time > 0) then
    tt = tt .. GreenStr  .. 'time: '   .. morphDef.time     .. '\n'
  end
  if (morphDef.metal > 0) then
    tt = tt .. CyanStr   .. 'metal: '  .. morphDef.metal    .. '\n'
  end
  if (morphDef.energy > 0) then
    tt = tt .. YellowStr .. 'energy: ' .. morphDef.energy   .. '\n'
  end
  if (morphDef.tech > teamTech) or
     (morphDef.xp > unitXP) or
     (morphDef.rank > unitRank) or
     (not teamOwnsReqUnit)
  then
    tt = tt .. RedStr .. 'needs'
    if (morphDef.tech>teamTech) then tt = tt .. ' tech level: ' .. morphDef.tech+1 end
    if (morphDef.xp>unitXP)     then tt = tt .. ' xp: '    .. string.format('%.2f',morphDef.xp) end
    if (morphDef.rank>unitRank) then tt = tt .. ' rank: '  .. morphDef.rank .. ' (' .. string.format('%.2f',RankToXp(unitDefID,morphDef.rank)) .. 'xp)' end
    if (not teamOwnsReqUnit)    then tt = tt .. ' unit: '  .. UnitDefs[morphDef.require].humanName end
  end
  return tt
end

local function UpdateMorphReqs(teamID)
  local morphCmdDesc = {}

  local teamTech  = teamTechLevel[teamID] or 0
  local teamUnits = SpGetTeamUnits(teamID)
  for n=1,#teamUnits do
    local unitID   = teamUnits[n]
    local unitXP   = SpGetUnitExperience(unitID)
    local unitRank = GetUnitRank(unitID)
    local unitDefID = SpGetUnitDefID(unitID)
    local morphDefs = morphDefs[unitDefID] or {}

    for _,morphDef in pairs(morphDefs) do
      local cmdDescID = SpFindUnitCmdDesc(unitID, morphDef.cmd)
      if (cmdDescID) then
        local teamOwnsReqUnit = UnitReqCheck(teamID,morphDef.require)
        morphCmdDesc.disabled = (morphDef.tech > teamTech)or(morphDef.rank > unitRank)or(morphDef.xp > unitXP)or(not teamOwnsReqUnit)
        morphCmdDesc.tooltip  = GetMorphToolTip(unitID, unitDefID, teamID, morphDef, teamTech, unitXP, unitRank, teamOwnsReqUnit)
        SpEditUnitCmdDesc(unitID, cmdDescID, morphCmdDesc)
      end
    end
  end
end

local function AddMorphCmdDesc(unitID, unitDefID, teamID, morphDef, teamTech)
  local unitXP   = SpGetUnitExperience(unitID)
  local unitRank = GetUnitRank(unitID)
  local teamOwnsReqUnit = UnitReqCheck(teamID,morphDef.require)
  morphCmdDesc.tooltip = GetMorphToolTip(unitID, unitDefID, teamID, morphDef, teamTech, unitXP, unitRank, teamOwnsReqUnit)
  local humDesc = ""

  if morphDef.texture then
    morphCmdDesc.texture = "LuaRules/Images/Morph/".. morphDef.texture
    morphCmdDesc.name = ''
  else
    local ud = UnitDefs[morphDef.into]
    local string = SplitNames(ud.humanName)
    local longestword = 1
    for word in string.gmatch(string,"%w+") do
      if string.len(word) > longestword then
        longestword = string.len(word)
      end
    end

    for word in string.gmatch(string,"%w+") do
      padding = math.floor(longestword-string.len(word))
      for p = 1, padding do
        humDesc =  humDesc .. " "
      end
      humDesc =  humDesc .. word .. "\n"
    end

    morphCmdDesc.texture = "#" .. morphDef.into   --//only works with a patched layout.lua or the TweakedLayout widget!
    morphCmdDesc.name = "" .. humDesc  --to do add padding
  end


  morphCmdDesc.disabled= (morphDef.tech > teamTech)or(morphDef.rank > unitRank)or(morphDef.xp > unitXP)or(not teamOwnsReqUnit)

  morphCmdDesc.id = morphDef.cmd

  if morphDef.research ~= nil then 
    morphCmdDesc.name = "Research\n T"..morphDef.research
  end

  local cmdDescID = SpFindUnitCmdDesc(unitID, morphDef.cmd)
  if (cmdDescID) then
    SpEditUnitCmdDesc(unitID, cmdDescID, morphCmdDesc)
  else
    SpInsertUnitCmdDesc(unitID, morphCmdDesc)
  end

  morphCmdDesc.tooltip = nil
  morphCmdDesc.texture = nil
  morphCmdDesc.text = nil
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


local function ReAssignAssists(newUnit,oldUnit)

  local unitDefID = SpGetUnitDefID(oldUnit)
  local isCommander = UnitDefs[unitDefID].customParams.iscommander or nil
  local isBuilder = UnitDefs[unitDefID].isBuilder or nil
  --if isBuilder and not isCommander then -- Added by skymyj. try to commander unlock Nano level
  if isBuilder then
  if unitDefID and not nanos[unitDefID] then return end
  end
  -- for now only reassign command to nanos

  local ally = SpGetUnitAllyTeam(newUnit)
  local alliedTeams = SpGetTeamList(ally)
  for n=1,#alliedTeams do
    local teamID = alliedTeams[n]
    local alliedUnits = SpGetTeamUnits(teamID)
    for i=1,#alliedUnits do
      local unitID = alliedUnits[i]
      local cmds = SpGetCommandQueue(unitID,20)
      for j=1,#cmds do
        local cmd = cmds[j]
        if (cmd.id == CMD_GUARD)and(cmd.params[1] == oldUnit) then
          SpGiveOrderToUnit(unitID,CMD_INSERT,{cmd.tag,CMD_GUARD,0,newUnit},{})
          SpGiveOrderToUnit(unitID,CMD_REMOVE,{cmd.tag},{})
        end
      end
    end
  end
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


local function StartMorph(unitID, unitDefID, teamID, morphDef, cmdp)
  if not Spring.ValidUnitID(unitID) then return end
  if not isFinished(unitID) or (Spring.GetUnitRulesParam(unitID, "jumpReload") == 0) then return true end

  local teamsize = #Spring.GetTeamUnits(teamID)
  if teamsize > (MAXunits * 0.95) then
    SendToUnsynced("unit_morph_stalled", teamID, teamsize)
  end

  Spring.SetUnitRulesParam(unitID, "Morphing", 1)
  SpSetUnitHealth(unitID, { paralyze = 1.0e9 })
  SpSetUnitResourcing(unitID, "e", 0)
  SpGiveOrderToUnit(unitID, CMD_ONOFF, { 0 }, { "alt" })
  if nanos[unitDefID] then
    SpGiveOrderToUnit(unitID, CMD_NANOBOOST, { 0 }, { "alt" })
  end

  morphUnits[unitID] = {
    def = morphDef,
    progress = 0.0,
    increment = morphDef.increment,
    syncTick = 0, -- added for throttled mph_prg
    teamID = teamID,
  }

  SendToUnsynced("mph_str", unitID, unitDefID, 0.0, morphDef.increment, morphID, teamID, cmdp)

  local cmdDescID = SpFindUnitCmdDesc(unitID, morphDef.cmd)
  if (cmdDescID) then
    SpEditUnitCmdDesc(unitID, cmdDescID, { id = morphDef.stopCmd, name = RedStr .. "Stop" })
  end

  SendToUnsynced("unit_morph_start", unitID, unitDefID, morphDef.cmd)
end

local function StopMorph(unitID, morphData)
  morphUnits[unitID] = nil
  SendToUnsynced("mph_stp", unitID)
  Spring.SetUnitRulesParam(unitID,"Morphing",0)

  SpSetUnitHealth(unitID, { paralyze = -1})
  local scale = morphData.progress * stopPenalty
  local unitDefID = SpGetUnitDefID(unitID)

  SpSetUnitResourcing(unitID,"e", UnitDefs[unitDefID].energyMake)
  SpGiveOrderToUnit(unitID, CMD_ONOFF, { 1 }, { "alt" })
  local usedMetal  = morphData.def.metal  * scale
  SpAddUnitResource(unitID, 'metal',  usedMetal)
  local usedEnergy = morphData.def.energy * scale
  SpAddUnitResource(unitID, 'energy', usedEnergy)

  SendToUnsynced("unit_morph_stop", unitID)

  local cmdDescID = SpFindUnitCmdDesc(unitID, morphData.def.stopCmd,morphData.def.cmd)
  if (cmdDescID) then
  local name = SplitNames(UnitDefs[morphData.def.into].humanName)
    SpEditUnitCmdDesc(unitID, cmdDescID, {id=morphData.def.cmd, name=name})  --morphCmdDesc.name})
  end
end


local function FinishMorph(unitID, morphData)
  Spring.SetUnitRulesParam(unitID,"Morphing",0)
  local udDst = UnitDefs[morphData.def.into]
  local ud = UnitDefs[unitID]
  local defName = udDst.name
  local unitTeam = morphData.teamID
  local px, py, pz = SpGetUnitBasePosition(unitID)
  local h = SpGetUnitHeading(unitID)
  SpSetUnitBlocking(unitID, false)
  morphUnits[unitID] = nil

  --update team tech level  TODO format
  local teamID = unitTeam
  local newLevel = morphData.def.research or 0
  if(newLevel > 0)
  then
    if(teamTechLevel[teamID] < newLevel) then
      TechLevelUpdated(teamID, newLevel)
    end
    StopMorph(unitID,morphData)
    return
  end
  
  local oldHealth,oldMaxHealth,paralyzeDamage,captureProgress,buildProgress = SpGetUnitHealth(unitID)
  local isBeingBuilt = false
  if buildProgress < 1 then
    isBeingBuilt = true
  end

  local newUnit

  if udDst.isBuilding or udDst.isFactory then
  --if udDst.isBuilding then

    local x = floor(px/16)*16
    local y = py
    local z = floor(pz/16)*16
    local face = HeadingToFacing(h)
    local xsize = udDst.xsize
    local zsize =(udDst.zsize or udDst.ysize)
    if ((face == 1) or(face == 3)) then
      xsize, zsize = zsize, xsize
    end
    if xsize/4 ~= floor(xsize/4) then
      x = x+8
    end
    if zsize/4 ~= floor(zsize/4) then
      z = z+8
    end
    newUnit = SpCreateUnit(defName, x, y, z, face, unitTeam, isBeingBuilt)
  if not newUnit then
    StopMorph(unitID, morphData)
    return
  end
    SpSetUnitPosition(newUnit, x, y, z)
  else
    newUnit = SpCreateUnit(defName, px, py, pz, HeadingToFacing(h), unitTeam, isBeingBuilt)
  if not newUnit then
    StopMorph(unitID, morphData)
    return
  end
    SpSetUnitRotation(newUnit, 0, -h * pi / 32768, 0)
    SpSetUnitPosition(newUnit, px, py, pz)
  end

  --Spring.Echo(morphData.def.facing)
  SpSetUnitRotation(newUnit, 0, -h * pi / 32768, 0)

  --//copy experience
  local newXp = SpGetUnitExperience(unitID)*XpScale
  local nextMorph = morphDefs[morphData.def.into]
  if nextMorph~= nil and nextMorph.into ~= nil then nextMorph = {morphDefs[morphData.def.into]} end
  if (nextMorph) then --//determine the lowest xp req. of all next possible morphs
    local maxXp = huge
    for _, nm in pairs(nextMorph) do
      local rankXpInto = RankToXp(nm.into,nm.rank)
      if (rankXpInto>0)and(rankXpInto<maxXp) then
        maxXp=rankXpInto
      end
      local xpInto     = nm.xp
      if (xpInto>0)and(xpInto<maxXp) then
        maxXp=xpInto
      end
    end
    newXp = min( newXp, maxXp*0.9)*expMulti
  end
  SpSetUnitExperience(newUnit, newXp)

  --//copy some state
  local nanoState = Spring.GetUnitRulesParam(unitID,"nanoBoosted") or 0

  local states = SpGetUnitStates(unitID)
  SpGiveOrderArrayToUnitArray({ newUnit }, {
    { CMD_FIRE_STATE, { states.firestate },             { } },
    { CMD_MOVE_STATE, { states.movestate },             { } },
    { CMD_REPEAT,     { states["repeat"] and 1 or 0 },  { } },
    --{ CMD_WANT_CLOAK,      { states.cloak     and 1 or udDst.initCloaked },  { } },
    { CMD_ONOFF,      { 1 },                            { } },
    { CMD_TRAJECTORY, { states.trajectory and 1 or 0 }, { } },
  })

  local unitDefID = SpGetUnitDefID(newUnit)
  if nanos[unitDefID] then
    Spring.GiveOrderToUnit(newUnit, CMD_NANOBOOST, { nanoState }, {})
  end


  --//copy command queue
  local cmds = SpGetUnitCommands(unitID,4) --only copy last 4 command as first is skipped
  for i = 2, #cmds do  -- skip the first command (CMD_MORPH)
    local cmd = cmds[i]
    SpGiveOrderToUnit(newUnit, cmd.id, cmd.params, cmd.options.coded)
  end

  --//reassign assist commands to new unit
  ReAssignAssists(newUnit,unitID)

  --// copy health
  -- old health is declared above
  local _,newMaxHealth         = SpGetUnitHealth(newUnit)
  local newHealth = (oldHealth / oldMaxHealth) * newMaxHealth
  local hpercent = newHealth/newMaxHealth
  if newHealth<=1 then newHealth = 1 end

  -- prevent conflict with rezz gadget
  if hpercent > 0.045 and hpercent < 0.055 then
    newHealth = newMaxHealth * 0.056 + 1
  end

  SpSetUnitHealth(newUnit, {health = newHealth, build = buildProgress})

  --// copy shield power
  local enabled,oldShieldState = SpGetUnitShieldState(unitID)
  if oldShieldState and SpGetUnitShieldState(newUnit) then
    SpSetUnitShieldState(newUnit, enabled,oldShieldState)
  end

 -- local lineage = Spring.GetUnitLineage(unitID)
 -- Spring.SetUnitLineage(newUnit,lineage,true)

   
  --// FIXME: - re-attach to current transport?
  --// update selection
  SendToUnsynced ("unit_morph_finished", unitID, newUnit)
  

  SpSetUnitBlocking(newUnit, true)
  SpDestroyUnit(unitID, false, true) -- selfd = false, reclaim = true
  SendToUnsynced("mph_stp", unitID)
end


local PROGRESS_SYNC_FREQUENCY = 5

local function UpdateMorph(unitID, morphData, canfinish)
  local cmdQueue = SpGetCommandQueue(unitID, 1)
  if cmdQueue and cmdQueue[1] and cmdQueue[1].id == CMD.WAIT then return true end
  if SpGetUnitTransporter(unitID) then return true end

  if (morphData.progress < 1.0) and SpUseUnitResource(unitID, morphData.def.resTable) then
    morphData.progress = morphData.progress + morphData.increment
    morphData.syncTick = morphData.syncTick + 1

    if morphData.syncTick >= PROGRESS_SYNC_FREQUENCY or morphData.progress >= 1.0 then
      SendToUnsynced("mph_prg", unitID, morphData.progress)
      morphData.syncTick = 0
    end
  end

  if (morphData.progress >= 1.0) and morphData.teamID < (MAXunits) and canfinish then
    FinishMorph(unitID, morphData)
    return false
  end
  return true
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


function gadget:Initialize()
  --// RankApi linking
  if (GG.rankHandler) then
    GetUnitRank = GG.rankHandler.GetUnitRank
    RankToXp    = GG.rankHandler.RankToXp
  end

  if (type(GG.UnitRanked)~="table") then GG.UnitRanked = {} end
  table.insert(GG.UnitRanked, UnitRanked)

  --// get the morphDefs
  morphDefs = include("LuaRules/Configs/morph_defs_techa.lua")
  if (not morphDefs) then gadgetHandler:RemoveGadget(); return; end
  morphDefs = ValidateMorphDefs(morphDefs)

  --// make it global for unsynced access via SYNCED

  --// Register CmdIDs
  for number=0,MAX_MORPH-1 do
    gadgetHandler:RegisterCMDID(CMD_MORPH+number)
    gadgetHandler:RegisterCMDID(CMD_MORPH_STOP+number)
  end


  --// check existing ReqUnits+TechLevel
  local allUnits = SpGetAllUnits()
  for i=1,#allUnits do
    local unitID    = allUnits[i]
    local unitDefID = SpGetUnitDefID(unitID)
    local teamID    = GetUnitTeam(unitID)
    if (reqDefIDs[unitDefID])and(isFinished(unitID)) then
      local teamReq = teamReqUnits[teamID]
      teamReq[unitDefID] = (teamReq[unitDefID] or 0) + 1
    end
    AddFactory(unitID, unitDefID, teamID)
  end

  --// add the Morph Menu Button to existing units
  for i=1,#allUnits do
    local unitID    = allUnits[i]
    local teamID    = GetUnitTeam(unitID)
    local unitDefID = SpGetUnitDefID(unitID)
    local morphDefSet  = morphDefs[unitDefID]
    if (morphDefSet) then
      local useXPMorph = false
      for _,morphDef in pairs(morphDefSet) do
        if (morphDef) then
          local cmdDescID = SpFindUnitCmdDesc(unitID, morphDef.cmd)
          if (not cmdDescID) then
            AddMorphCmdDesc(unitID, unitDefID, teamID, morphDef, teamTechLevel[teamID])
          end

          useXPMorph = (morphDef.xp>0) or useXPMorph
        end
      end

      if (useXPMorph) then XpMorphUnits[#XpMorphUnits+1] = {id=unitID,defID=unitDefID,team=teamID} end
    end
  end

end


function gadget:Shutdown()
  for i,f in pairs(GG.UnitRanked or {}) do
    if (f==UnitRanked) then
      table.remove(GG.UnitRanked, i)
      break
    end
  end

  local allUnits = SpGetAllUnits()
  for i=1,#allUnits do
    local unitID    = allUnits[i]
    local morphData = morphUnits[unitID]
    if (morphData) then
      StopMorph(unitID, morphData)
    end
    for number=0,MAX_MORPH-1 do
      local cmdDescID = SpFindUnitCmdDesc(unitID, CMD_MORPH+number)
      if (cmdDescID) then
        SpRemoveUnitCmdDesc(unitID, cmdDescID)
      end
    end
  end
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


function gadget:UnitCreated(unitID, unitDefID, teamID)
  local morphDefSet = morphDefs[unitDefID]
  if (morphDefSet) then
    local useXPMorph = false
    for _,morphDef in pairs(morphDefSet) do
      if (morphDef) then
        AddMorphCmdDesc(unitID, unitDefID, teamID, morphDef, teamTechLevel[teamID])
        useXPMorph = (morphDef.xp>0) or useXPMorph
      end
    end
    if (useXPMorph) then XpMorphUnits[#XpMorphUnits+1] = {id=unitID,defID=unitDefID,team=teamID} end
  end
end


function gadget:UnitFinished(unitID, unitDefID, teamID)
  local bfrTechLevel = teamTechLevel[teamID] or 0
  AddFactory(unitID, unitDefID, teamID)

  if (reqDefIDs[unitDefID]) then
    local teamReq = teamReqUnits[teamID]
    teamReq[unitDefID] = (teamReq[unitDefID] or 0) + 1
    if (teamReq[unitDefID]==1) then
      UpdateMorphReqs(teamID)
    end
  end

  if (bfrTechLevel~=teamTechLevel[teamID]) then
    UpdateMorphReqs(teamID)
  end
end


-- helper to zap any XpMorphUnits entries for a gone unit
local function RemoveFromXpMorphUnits(unitID)
    for i = #XpMorphUnits, 1, -1 do
        if XpMorphUnits[i].id == unitID then
            table.remove(XpMorphUnits, i)
        end
    end
end

function gadget:UnitDestroyed(unitID, unitDefID, teamID)
    -- 1) clean up any pending XP-morph entry
    RemoveFromXpMorphUnits(unitID)

    -- 2) stop any in-flight morph
    if morphUnits[unitID] then
        StopMorph(unitID, morphUnits[unitID])
        morphUnits[unitID] = nil
    end

    -- 3) original factory/tech-level bookkeeping
    local bfrTechLevel = teamTechLevel[teamID] or 0
    RemoveFactory(unitID, unitDefID, teamID)

    local updateButtons = false
    if (reqDefIDs[unitDefID] and isFinished(unitID)) then
        local teamReq = teamReqUnits[teamID]
        teamReq[unitDefID] = (teamReq[unitDefID] or 0) - 1
        if (teamReq[unitDefID] == 0) then
            StopMorphsOnDevolution(teamID)
            updateButtons = true
        end
    end

    if (bfrTechLevel ~= teamTechLevel[teamID]) then
        StopMorphsOnDevolution(teamID)
        updateButtons = true
    end

    if updateButtons then
        UpdateMorphReqs(teamID)
    end
end


function gadget:UnitTaken(unitID, unitDefID, oldTeamID, teamID)
  self:UnitCreated(unitID, unitDefID, teamID)
  if (isFinished(unitID)) then
    self:UnitFinished(unitID, unitDefID, teamID)
  end
end


function gadget:UnitGiven(unitID, unitDefID, newTeamID, oldTeamID)
  self:UnitDestroyed(unitID, unitDefID, oldTeamID)
end


function UnitRanked(unitID,unitDefID,teamID,newRank,oldRank)
  local morphDefSet = morphDefs[unitDefID]

  if (morphDefSet) then
    local teamTech = teamTechLevel[teamID] or 0
    local unitXP   = SpGetUnitExperience(unitID)
    for _, morphDef in pairs(morphDefSet) do
      if (morphDef) then
        local cmdDescID = SpFindUnitCmdDesc(unitID, morphDef.cmd)
        if (cmdDescID) then
          local morphCmdDesc = {}
          local teamOwnsReqUnit = UnitReqCheck(teamID,morphDef.require)
          morphCmdDesc.disabled = (morphDef.tech > teamTech)or(morphDef.rank > newRank)or(morphDef.xp > unitXP)or(not teamOwnsReqUnit)
          morphCmdDesc.tooltip  = GetMorphToolTip(unitID, unitDefID, teamID, morphDef, teamTech, unitXP, newRank, teamOwnsReqUnit)
          SpEditUnitCmdDesc(unitID, cmdDescID, morphCmdDesc)
        end
      end
    end
  end
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--- Function to handle tech level updates for a team
function TechLevelUpdated(teamID, level)
  teamTechLevel[teamID] = level
    --- Iterate through all invalid factories of the team
    for unitID, factoryData in pairs(teamInvalidFactories[teamID] or {}) do
        local unitDefID = factoryData.defID
        local unitTechLevel = factoryData.techLevel
        
        --- Check if the factory can now be activated
        if unitTechLevel <= (teamTechLevel[teamID] or 0) then
            --- Enable the factory
            Spring.SetUnitHealth(unitID, { paralyze = -1 })  -- remove paralysis effect
            Spring.SetUnitResourcing(unitID, "e", UnitDefs[unitDefID].energyMake)  -- restore production
            
            --- Remove the factory from the invalid list
            teamInvalidFactories[teamID][unitID] = nil
        end
    end

  SendToUnsynced ("team_tech_level_updated", teamID, level)
end

--- Function to add a new factory to the system
function AddFactory(unitID, unitDefID, teamID)
    if isFactory(unitDefID) then
        local unitTechLevel = GetTechLevel(unitDefID)
        local teamTech = teamTechLevel[teamID] or 0
        
        --- Check if the factory requires research
        if unitTechLevel > teamTech then
            --- Add the factory to the invalid list
            if not teamInvalidFactories[teamID] then 
                teamInvalidFactories[teamID] = {} 
            end
            teamInvalidFactories[teamID][unitID] = {
                defID = unitDefID,
                techLevel = unitTechLevel
            }
            
            --- Apply paralysis effects
            Spring.SetUnitResourcing(unitID, "e", 0)  -- stop production
            Spring.SetUnitHealth(unitID, { paralyze = 1.0e9 })  -- apply paralysis effect
        end
    end
end




function RemoveFactory(unitID, unitDefID, teamID)
  if (devolution)and(isFactory(unitDefID))and(isFinished(unitID)) then

    --// check all factories and determine team level
    local level = 0
    local teamUnits = SpGetTeamUnits(teamID)
    for i=1,#teamUnits do
      local unitID2 = teamUnits[i]
      if (unitID2 ~= unitID) then
        local unitDefID2 = SpGetUnitDefID(unitID2)
        if (isFactory(unitDefID2) and isFinished(unitID2)) then
          local unitTechLevel = GetTechLevel(unitDefID2)
          if (unitTechLevel>level) then level = unitTechLevel end
        end
      end
    end

--    if (level ~= teamTechLevel[teamID]) then
--      teamTechLevel[teamID] = level
--    end

  end
end

function StopMorphsOnDevolution(teamID)
  if (stopMorphOnDevolution) then
    for unitID, morphData in pairs(morphUnits) do
      local morphDef = morphData.def
      if (morphData.teamID == teamID)and
         (
           (morphDef.tech>teamTechLevel[teamID])or
           (not UnitReqCheck(teamID, morphDef.require))
         )
      then
        StopMorph(unitID, morphData)
      end
    end
  end
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GameFrame(n)
    if (n % 2 == 0) then
      local i = 0
      for unitid, data in pairs(morphToStart) do
        if i == 10 then break end
        StartMorph(unitid, unpack(data))
        morphToStart[unitid] = nil
        i = i + 1 
      end
    end 

    if ((n+24)%150<1) then
      local unitCount = #XpMorphUnits
      local i = 1

      while (i<=unitCount) do
        local unitdata    = XpMorphUnits[i]
        local unitID      = unitdata.id
        local unitDefID   = unitdata.defID

        local morphDefSet = morphDefs[unitDefID]
        if (morphDefSet) then
          local teamID   = unitdata.team
          local teamTech = teamTechLevel[teamID] or 0
          local unitXP   = SpGetUnitExperience(unitID)
          local unitRank = GetUnitRank(unitID)

          local xpMorphLeft = false
          for _,morphDef in pairs(morphDefSet) do
            if (morphDef) then
              local cmdDescID = SpFindUnitCmdDesc(unitID, morphDef.cmd)
              if (cmdDescID) then
                local morphCmdDesc = {}
                local teamOwnsReqUnit = UnitReqCheck(teamID,morphDef.require)
                morphCmdDesc.disabled = (morphDef.tech > teamTech)or(morphDef.rank > unitRank)or(morphDef.xp > unitXP)or(not teamOwnsReqUnit)
                morphCmdDesc.tooltip  = GetMorphToolTip(unitID, unitDefID, teamID, morphDef, teamTech, unitXP, unitRank, teamOwnsReqUnit)
                SpEditUnitCmdDesc(unitID, cmdDescID, morphCmdDesc)

                xpMorphLeft = morphCmdDesc.disabled or xpMorphLeft
              end
            end
          end
          if (not xpMorphLeft) then
            --// remove unit in list (it fullfills all xp requirements)
            XpMorphUnits[i] = XpMorphUnits[unitCount]
            XpMorphUnits[unitCount] = nil
            unitCount = unitCount - 1
            i = i - 1
          end
        end
        i = i + 1

      end
    end

    local finished = 0
    local maxPerFrame = 2
    for unitID, morphData in pairs(morphUnits) do
        if not UpdateMorph(unitID, morphData, finished < maxPerFrame) then
            morphUnits[unitID] = nil
            finished = finished + 1
        end
    end
end


function gadget:AllowCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions)
  local morphData = morphUnits[unitID]
  local cmdp = nil
  if (morphData) then
    if (cmdID==morphData.def.stopCmd)or(cmdID==CMD_STOP)or(cmdID==CMD_MORPH_STOP) then
      if not SpGetUnitTransporter(unitID) then
        StopMorph(unitID, morphData)
        morphUnits[unitID] = nil
        return false
      end
    elseif (cmdID == CMD_ONOFF) then
      return false
    elseif cmdID == CMD_SELFD then
      StopMorph(unitID, morphData)
      morphUnits[unitID] = nil
    --else --// disallow ANY command to units in morph
    --  return false
    end
  elseif (cmdID >= CMD_MORPH and cmdID <= CMD_MORPH+MAX_MORPH) then
    local morphDef = nil
    if cmdID==CMD_MORPH then
      if type(GG.MorphInfo[unitDefID])~="table" then
        --Spring.Echo('Morph gadget: AllowCommand generic morph on non morphable unit')
        return false
      elseif #cmdParams==0 then
        --Spring.Echo('Morph gadget: AllowCommand generic morph, default target')
        --return true
        for _,md in pairs(morphDefs[unitDefID]) do
          morphDef=md
          break
        end
      elseif GG.MorphInfo[unitDefID][cmdParams[1]] then
        --Spring.Echo('Morph gadget: AllowCommand generic morph, target valid')
        --return true
        morphDef=(morphDefs[unitDefID] or {})[GG.MorphInfo[unitDefID][cmdParams[1]]]
        cmdp = cmdParams[1]
      else
        --Spring.Echo('Morph gadget: AllowCommand generic morph, invalid target')
        return false
      end
      --Spring.Echo('Morph gadget: AllowCommand morph cannot be here!')
    elseif (cmdID > CMD_MORPH and cmdID <= CMD_MORPH+MAX_MORPH) then
      --Spring.Echo('Morph gadget: AllowCommand specific morph')
      morphDef = (morphDefs[unitDefID] or {})[cmdID]
      cmdp = -cmdID
    end
    if ((morphDef)and
        (morphDef.tech<=teamTechLevel[teamID])and
        (morphDef.rank<=GetUnitRank(unitID))and
        (morphDef.xp<=SpGetUnitExperience(unitID))and
        (UnitReqCheck(teamID, morphDef.require)) )
    then
      if(morphDef.research and morphDef.research <= teamTechLevel[teamID])
    then
        return false
    end
      if (isFactory(unitDefID)) then
        --// the factory cai is broken and doesn't call CommandFallback(),
        --// so we have to start the morph here
        -- dont start directly to break recursion
        --StartMorph(unitID, unitDefID, teamID, morphDef)
        morphToStart[unitID] = {unitDefID, teamID, morphDef, cmdp}
        return false
      else
        return true
      end
    end
    return false
  end

  return true
end


function gadget:CommandFallback(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions)
  local cmdp = nil
  if (cmdID < CMD_MORPH or cmdID > CMD_MORPH+MAX_MORPH) then
    return false  --// command was not used
  end
  local morphDef = nil
  if cmdID == CMD_MORPH then
    if type(GG.MorphInfo[unitDefID])~="table" then
      --Spring.Echo('Morph gadget: CommandFallback generic morph on non morphable unit')
      return true,true
    end
    if cmdParams[1] then
      --Spring.Echo('Morph gadget: CommandFallback generic morph with target provided')
      morphDef=(morphDefs[unitDefID] or {})[GG.MorphInfo[unitDefID][cmdParams[1]]]
      cmdp = cmdParams[1]
    else
      --Spring.Echo('Morph gadget: CommandFallback generic morph, default target')
      for _,md in pairs(morphDefs[unitDefID]) do
        morphDef=md
        break
      end
    end
  else
    --Spring.Echo('Morph gadget: CommandFallback specific morph')
    morphDef = (morphDefs[unitDefID] or {})[cmdID]
    cmdp = -cmdID
  end
  if (not morphDef) then
    return true, true  --// command was used, remove it
  end
  local morphData = morphUnits[unitID]
  if (not morphData) then
    -- dont start directly to break recursion
    --StartMorph(unitID, unitDefID, teamID, morphDef)
    morphToStart[unitID] = {unitDefID, teamID, morphDef, cmdp}
    return true, true
  end
  return true, false  --// command was used, do not remove it
end



--------------------------------------------------------------------------------
--  END SYNCED
--------------------------------------------------------------------------------
else
--------------------------------------------------------------------------------
--  UNSYNCED
--------------------------------------------------------------------------------

--// 75b2 compability (removed it in the next release)
if (Spring.GetTeamColor==nil) then
  Spring.GetTeamColor = function(teamID) local _,_,_,_,_,_,r,g,b = SpGetTeamInfo(teamID); return r,g,b end
end

--
-- speed-ups
--

local gameFrame;
local SYNCED = SYNCED
local CallAsTeam = CallAsTeam

local GetGameFrame        = Spring.GetGameFrame
local GetSpectatingState  = Spring.GetSpectatingState
local AddWorldIcon        = Spring.AddWorldIcon
local AddWorldText        = Spring.AddWorldText
local IsUnitInView        = Spring.IsUnitInView
local IsUnitVisible       = Spring.IsUnitVisible
local GetLocalTeamID      = Spring.GetLocalTeamID
local spAreTeamsAllied    = Spring.AreTeamsAllied
local spGetGameFrame      = Spring.GetGameFrame

local glBillboard    = gl.Billboard
local glColor        = gl.Color
local glPushMatrix   = gl.PushMatrix
local glTranslate    = gl.Translate
local glRotate       = gl.Rotate
local glUnitShape    = gl.UnitShape
local glPopMatrix    = gl.PopMatrix
local glText         = gl.Text
local glPushAttrib   = gl.PushAttrib
local glPopAttrib    = gl.PopAttrib
local glBlending     = gl.Blending
local glDepthTest    = gl.DepthTest

local GL_LEQUAL      = GL.LEQUAL
local GL_ONE         = GL.ONE
local GL_SRC_ALPHA   = GL.SRC_ALPHA
local GL_ONE_MINUS_SRC_ALPHA = GL.ONE_MINUS_SRC_ALPHA
local GL_COLOR_BUFFER_BIT = GL.COLOR_BUFFER_BIT

local headingToDegree = (360 / 65535)
local MdMaxDist = 1500000  -- max dist at which to draw ETA

local IsTooHigh = false
local HighPing = false
local pfscount = Spring.GetFPS()

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local useLuaUI = false
local oldFrame = 0        --//used to save bandwidth between unsynced->LuaUI
local drawProgress = true --//a widget can do this job too (see healthbars)

local morphUnits = {}
local morphDefs = {}

local MAX_MORPH = 0 --// will increase dynamically

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function DrawStatus(toohigh,fps,ping)
  --Spring.Echo(toohigh,fps,ping)
  IsTooHigh = toohigh
  pfscount = fps
  HighPing = pingend
end

--//synced -> unsynced actions

local function SelectSwap(cmd, oldID, newID)
  local selUnits = Spring.GetSelectedUnits()
  for i=1,#selUnits do
    local unitID = selUnits[i]
    if (unitID == oldID) then
      selUnits[i] = newID
      Spring.SelectUnitArray(selUnits)
      break
    end
  end


  if false then --(Script.LuaUI('MorphFinished')) then
    if (useLuaUI) then
      local readTeam, spec, specFullView = nil,GetSpectatingState()
      if (specFullView)
        then readTeam = Script.ALL_ACCESS_TEAM
        else readTeam = GetLocalTeamID() end
      CallAsTeam({ ['read'] = readTeam }, function()
        if (IsUnitVisible(oldID)) then
          Script.LuaUI.MorphFinished(oldID,newID)
        end
      end)
    end
  end

  return true
end

local function StartMorph(cmd, unitID, unitDefID, morphID)
  if (Script.LuaUI('MorphStart')) then
    if (useLuaUI) then
      local readTeam, spec, specFullView = nil,GetSpectatingState()
      if (specFullView)
        then readTeam = Script.ALL_ACCESS_TEAM
        else readTeam = GetLocalTeamID() end
      CallAsTeam({ ['read'] = readTeam }, function()
        if (unitID)and(IsUnitVisible(unitID)) then
          Script.LuaUI.MorphStart(unitID, (morphDefs[unitDefID] or {})[morphID] or nil)
        end
      end)
    end
  end
  return true
end

local function StopMorph(cmd, unitID)
  if (Script.LuaUI('MorphStop')) then
    if (useLuaUI) then
      local readTeam, spec, specFullView = nil,GetSpectatingState()
      if (specFullView)
        then readTeam = Script.ALL_ACCESS_TEAM
        else readTeam = GetLocalTeamID() end
      CallAsTeam({ ['read'] = readTeam }, function()
        if (unitID)and(IsUnitVisible(unitID)) then
          Script.LuaUI.MorphStop(unitID)
        end
      end)
    end
  end
  return true
end


local function StartMph(cmd, unitID, unitDefID, prog, incr, mID, tID, cmdp)
  local tdef = nil
  if cmdp == nil then
    for _,md in pairs(morphDefs[unitDefID]) do
      tdef = md
      break
    end
  end
  if cmdp ~= nil and cmdp >= 0 then
    tdef =(morphDefs[unitDefID] or {})[GG.MorphInfo[unitDefID][cmdp]]
  end
  if cmdp ~= nil and cmdp < 0 then
    tdef = (morphDefs[unitDefID] or {})[-cmdp]
  end

  morphUnits[unitID] = {
    def = tdef,
    progress = prog,
    increment = incr,
    morphID = mID,
    teamID = tID,
  }
end

local function StopMph(cmd, unitID)
  morphUnits[unitID] = nil
end

local function ProgMph(cmd, unitID, prog)
  if (morphUnits[unitID] ~= nil) then
    morphUnits[unitID].progress = prog
  end
end

local function StalledMph(cmd, teamID, teamsize)
  local readTeam, spec, specFullView = nil,GetSpectatingState()
  if not spec then
    Spring.Echo("\255\255\255\001Warning Unit Limit Approching - Morph May Stall Reduce Unit Count")
  end
end

--[[
function IsTooHigh()
  local cx, cy, cz = Spring.GetCameraPosition()
  local smoothheight = Spring.GetSmoothMeshHeight(cx,cz)
  local toohigh = ((cy-smoothheight)^2 >= 2500000)
  return toohigh
end
--]]
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:Initialize()
  --// get the morphDefs
  morphDefs = include("LuaRules/Configs/morph_defs_techa.lua")
  if (not morphDefs) then gadgetHandler:RemoveGadget(); return; end
  morphDefs = ValidateMorphDefs(morphDefs)

  gadgetHandler:AddSyncAction("unit_morph_finished", SelectSwap)
  gadgetHandler:AddSyncAction("unit_morph_start", StartMorph)
  gadgetHandler:AddSyncAction("unit_morph_stop", StopMorph)
  gadgetHandler:AddSyncAction("mph_str", StartMph)
  gadgetHandler:AddSyncAction("mph_stp", StopMph)
  gadgetHandler:AddSyncAction("mph_prg", ProgMph)
  gadgetHandler:AddSyncAction("unit_morph_stalled", StalledMph)
  gadgetHandler:AddSyncAction("team_tech_level_updated", TechLevelUpdated)
  gadgetHandler:RegisterGlobal('DrawManager_morph', DrawStatus)

end


function gadget:Shutdown()
  gadgetHandler:RemoveSyncAction("unit_morph_finished")
  gadgetHandler:RemoveSyncAction("unit_morph_start")
  gadgetHandler:RemoveSyncAction("unit_morph_stop")
  gadgetHandler:RemoveSyncAction("mph_str")
  gadgetHandler:RemoveSyncAction("mph_stp")
  gadgetHandler:RemoveSyncAction("mph_prg")
  gadgetHandler:RemoveSyncAction("unit_morph_stalled")
  gadgetHandler:RemoveSyncAction("team_tech_level_updated")
  gadgetHandler:DeregisterGlobal('DrawManager_morph')

end

function gadget:Update()
  local frame = spGetGameFrame()
  if (frame>oldFrame) then
    oldFrame = frame
    if next(morphUnits) then
      local useLuaUI_ = Script.LuaUI('MorphUpdate')
      if (useLuaUI_~=useLuaUI) then --//Update Callins on change
        drawProgress = not Script.LuaUI('MorphDrawProgress')
        useLuaUI     = useLuaUI_
      end

      if (useLuaUI) then
        local morphTable = {}
        local readTeam, spec, specFullView = nil,GetSpectatingState()
        if (specFullView)
          then readTeam = Script.ALL_ACCESS_TEAM
          else readTeam = GetLocalTeamID() end
        CallAsTeam({ ['read'] = readTeam }, function()
          for unitID, morphData in pairs(morphUnits) do
            if (unitID and morphData)and(IsUnitInView(unitID)) then
              morphTable[unitID] = {progress=morphData.progress, into=morphData.def.into}
            end
          end
        end)
        Script.LuaUI.MorphUpdate(morphTable)
      end

    end
  end
end

local teamColors = {}
local function SetTeamColor(teamID,a)
  local color = teamColors[teamID]
  if (color) then
    color[4]=a
    glColor(color)
    return
  end
  local r, g, b = Spring.GetTeamColor(teamID)
  if (r and g and b) then
    local max = math.max(r, g, b)
    if max < 0.5 and max >= 0.1 then
      local norm = 0.5 / max
      r, g, b = r * norm, g * norm, b * norm
    elseif max < 0.1 then
      r, g, b = 0.5, 0.5, 0.5
    end
    color = { r, g, b }
    teamColors[teamID] = color
    glColor(color)
    return
  end
end


--//patchs an annoying popup the first time you morph a unittype(+team)
local alreadyInit = {}
local function InitializeUnitShape(unitDefID,unitTeam)
  local iTeam = alreadyInit[unitTeam]
  if (iTeam)and(iTeam[unitDefID]) then return end

  glPushMatrix()
  gl.ColorMask(false)
  glUnitShape(unitDefID, unitTeam, true, true , true)
  gl.ColorMask(true)
  glPopMatrix()
  if (alreadyInit[unitTeam]==nil) then alreadyInit[unitTeam] = {} end
  alreadyInit[unitTeam][unitDefID] = true
end


local MAX_DRAWN_MORPHS = 200
local DRAWN_THIS_FRAME = 0

local function DrawMorphUnit(unitID, morphData, localTeamID)
  if DRAWN_THIS_FRAME >= MAX_DRAWN_MORPHS then return end
  local h = SpGetUnitHeading(unitID)
  if not h then return end
  local px, py, pz = SpGetUnitBasePosition(unitID)
  if not px then return end

  local unitTeam = morphData.teamID
  InitializeUnitShape(morphData.def.into, unitTeam)

  local frac = ((gameFrame + unitID) % 30) / 30
  local alpha = 2.0 * abs(0.5 - frac)
  local angle
  if morphData.def.facing then
    angle = -HeadingToFacing(h) * 90 + 180
  else
    angle = h * headingToDegree
  end

  SetTeamColor(unitTeam, alpha)
  glPushMatrix()
  glTranslate(px, py, pz)
  glRotate(angle, 0, 1, 0)
  glUnitShape(morphData.def.into, unitTeam, true, true, true)
  glPopMatrix()


  DRAWN_THIS_FRAME = DRAWN_THIS_FRAME + 1
end

function gadget:DrawWorld()
  if IsTooHigh or HighPing or pfscount < 8 then return end
  if not next(morphUnits) then return end

  gameFrame = GetGameFrame()
  DRAWN_THIS_FRAME = 0

  glBlending(GL_SRC_ALPHA, GL_ONE)
  glDepthTest(GL_LEQUAL)

  local spec, specFullView = GetSpectatingState()
  local readTeam = specFullView and Script.ALL_ACCESS_TEAM or GetLocalTeamID()

  CallAsTeam({ ['read'] = readTeam }, function()
    for unitID, morphData in pairs(morphUnits) do
      if unitID and morphData and IsUnitVisible(unitID) then
        DrawMorphUnit(unitID, morphData, readTeam)
      end
    end
  end)

  glColor(1, 1, 1, 1)
  glDepthTest(false)
  glBlending(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)
end


local function split(msg,sep)
  local s=sep or '|'
  local t={}
  for e in string.gmatch(msg..s,'([^%'..s..']+)%'..s) do
    table.insert(t,e)
  end
  return t
end


-- Exemple of AI messages:
-- "aiShortName|morph|762" -- morph the unit of unitId 762
-- "aiShortName|morph|861|12" -- morph the unit of unitId 861 into an unit of unitDefId 12
--
-- Does not work because apparently Spring.GiveOrderToUnit from unsynced gadgets are ignored.
--
function gadget:AICallIn(data)
  if type(data)=="string" then
    local message = split(data)
    if message[1] == "Shard" or true then-- Because other AI shall be allowed to send such morph command without having to pretend to be Shard
      if message[2] == "morph" and message[3] then
        local unitID = tonumber(message[3])
        if unitID and Spring.ValidUnitID(unitID) then
          if message[4] then
            local destDefId=tonumber(message[4])
            --Spring.Echo("Morph AICallIn: Morphing Unit["..unitID.."] into "..UnitDefs[destDefId].name)
            SpGiveOrderToUnit(unitID,CMD_MORPH,{destDefId},{})
          else
            --Spring.Echo("Morph AICallIn: Morphing Unit["..unitID.."] to auto")
            SpGiveOrderToUnit(unitID,CMD_MORPH,{},{})
          end
        else
          Spring.Echo("Not a valid unitID in AICallIn morph request: \""..data.."\"")
        end
      end
    end
  end
end

-- Just something to test the above AICallIn
--function gadget:KeyPress(key)
--  if key==32 then--space key
--    gadget:AICallIn("asn|morph|762")
--  end
--end

--------------------------------------------------------------------------------
--  UNSYNCED
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
--  COMMON
--------------------------------------------------------------------------------
