-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

function widget:GetInfo()
  return {
    name      = "Morph Indicator",
    desc      = "Shows ablity to morph next to allied units",
    author    = "numpty based on trepan's rank widget",
    date      = "01 May 2010",
    license   = "GNU GPL, v2 or later",
    layer     = 5,
    enabled   = true  -- loaded by default?
  }
end

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

-- speed-ups

include('Headers/billboard.lua')

local GetUnitDefID         = Spring.GetUnitDefID
local GetUnitDefDimensions = Spring.GetUnitDefDimensions
local GetUnitExperience    = Spring.GetUnitExperience
local GetTeamList          = Spring.GetTeamList
local GetTeamUnits         = Spring.GetTeamUnits
local GetMyAllyTeamID      = Spring.GetMyAllyTeamID
local GetUnitViewPosition  = Spring.GetUnitViewPosition
local spGetSpectatingState = Spring.GetSpectatingState

local glDepthTest      = gl.DepthTest
local glDepthMask      = gl.DepthMask
local glAlphaTest      = gl.AlphaTest
local glTexture        = gl.Texture
local glTexRect        = gl.TexRect
local glTranslate      = gl.Translate
local glBillboard      = gl.BillboardFixed
local CreateBillboard  = gl.CreateBillboard
local glDrawFuncAtUnit = gl.DrawFuncAtUnit
local glDeleteTexture  = gl.DeleteTexture

local GL_GREATER = GL.GREATER


-- loads unit morph info 
local morphDefs = VFS.Include('LuaRules/Configs/morph_defs_techa.lua', nil, VFS.RAW_FIRST)
local morphRanks ={}

local CMD_MORPH = 31410
local MAX_MORPH = 250 -- ATM its 173

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

local update = 4.0

local alliedUnits  = {}
local smallList = {}
local morphableList = {}


local myAllyTeamID = 666

local iconsize   = 33
local iconoffset = 14

local rankTexBase = 'LuaUI/Images/Ranks/'
local rankTextures = {
  [0] = nil,
  [1] = rankTexBase .. 'rank1.png',
  [2] = rankTexBase .. 'rank3.png',
  [3] = rankTexBase .. 'star.png',
}

local sentmessage = {}

local morphRankMax = #rankTextures

local TooHigh = true
local HighPing = false
local FPSCount = Spring.GetFPS()
local FPSLimit = 8

local message = 0
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

-- debug function  displays table data in human friendly manner
local function tableDebug(t, indent)
  for n, v in pairs(t) do
    if type(v) == 'table' then
			 Spring.Echo (indent..'('..n..')')
    	 tableDebug(v, indent..'   ')
    else
  	  Spring.Echo (indent..'('..n..')'..v)
    end
  end
end

-- assumes standardise structure of morphDefs (see initialisation of widget)
local function getUnitMorphXpValuesArray(unitName)
	local result = {}
	local i,v,i2,v2

  if morphDefs[unitName] then
    for i, v in ipairs(morphDefs[unitName]) do
      if v.xp then
      	 -- now check xp value hasnt already been recorded
      	 found = false
				 for i2, v2 in ipairs(result) do
				   if v2 == v.xp then
				 	   found = true
			 		 end
			 	end
				if not found then table.insert(result,v.xp) end
      end
    end
    table.sort(result)
  end
  return result
end

local function getAllUnitsMorphXpValuesArray()
	local result = {}
	local n,v
	for n, v in pairs(morphDefs) do
    result[n] = getUnitMorphXpValuesArray(n)
	end
	return result
end

function DrawStatus(toohigh,fps,ping)
    TooHigh = toohigh
    FPSCount = fps
    HighPing = ping
end

function widget:Initialize()
    widgetHandler:RegisterGlobal('DrawManager_mphi', DrawStatus)


  if (UnitDefs[1].height == nil) then
    for udid, ud in ipairs(UnitDefs) do
      -- this cause a lag on loading, but it is a huge performance improvment!
      ud.height = GetUnitDefDimensions(udid).radius
    end
  end


  -- now scan thru morphDefs and standardise structure
  for k, v in pairs(morphDefs) do
   if morphDefs[k].into then morphDefs[k] = {morphDefs[k]} end
  end

	-- now make an array with morph ranks in useable form
	morphRanks = getAllUnitsMorphXpValuesArray()

  widget:Update(0)
end

function widget:Shutdown()
  widgetHandler:DeregisterGlobal('DrawManager_mphi', DrawStatus)

  for _,rankTexture in ipairs(rankTextures) do
    glDeleteTexture(rankTexture)
  end
end


-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

local function SetUnitRank(unitID)
  local ud = UnitDefs[GetUnitDefID(unitID)]
  local teamID = Spring.GetUnitTeam(unitID)
  local rankIndex = 0
  local i, v
  if (ud == nil) then
    alliedUnits[unitID] = nil
    return
  end
  local unitName = ud.name
  local humanName = ud.humanName
  local xp = GetUnitExperience(unitID)
  if (not xp) then
    alliedUnits[unitID] = nil
    return
  end


    -- find out if there are xp requiring morphs for the unit
    if morphRanks[unitName] then
			 for i,v in ipairs(morphRanks[unitName]) do
			 	 if xp < v then
	 	 		   break
			   else
   		     rankIndex = rankIndex + 1
   		     if rankIndex >= morphRankMax then
					 		rankIndex = morphRankMax
							break
						end
         end
			 end
    end

  local rankTex = rankTextures[rankIndex]

  alliedUnits[unitID] = {}
    if (rankTex ~= nil) then 
      smallList[unitID] = { rankTex, ud.height + iconoffset, message, humanName, teamID, false}
    end
end

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

local timeCounter = math.huge -- force the first update


function widget:Update(deltaTime)
  if (timeCounter < update) then
    timeCounter = timeCounter + deltaTime
    return
  end

  timeCounter = 0

  local newAllyTeamID = GetMyAllyTeamID()
  if (newAllyTeamID == myAllyTeamID) then
    -- just update the units
    for unitID in pairs(alliedUnits) do
      SetUnitRank(unitID)
    end
  else
    -- re-create the allied unit list
    alliedUnits = {}
    myAllyTeamID = newAllyTeamID
    for _,teamID in ipairs(GetTeamList(myAllyTeamID) ) do
      for _,unitID in ipairs(GetTeamUnits(teamID)) do
        SetUnitRank(unitID)
      end
    end
  end
end

function widget:GameFrame(frame)
  if spGetSpectatingState() then
    --return
  end

  if frame%4==0 then
    --Spring.Echo("current cmdid ", WG["hoverID"], CMD_MORPH, CMD_MORPH+200 ,frame)
    if WG.hoverID and (WG.hoverID >= CMD_MORPH and WG.hoverID <= (CMD_MORPH+200)) then
      local sel = Spring.GetSelectedUnits()
      for i, unitIDs in pairs(sel) do
        local unitDefID = Spring.GetUnitDefID(unitIDs)
        if smallList[unitIDs] then
          table.insert(morphableList,unitIDs)
        end
      end
      if #morphableList>0 then
        Spring.SelectUnitArray(morphableList,false)
      end
    end
    morphableList = {}
  end

  if frame%129==0 then
    for unitID,v in pairs(smallList) do
      local myteam = Spring.GetMyTeamID()
        if v[3] == 0 and sentmessage[unitID] == nil and myteam == v[5] then
        Spring.Echo("\255\255\225\001" .. v[4] .. " Is Ready For Morph")
        sentmessage[unitID] = true
      end
    end
  end
end

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

function widget:UnitCreated(unitID, unitDefID, unitTeam)
  if (Spring.IsUnitAllied(unitID)) then
    SetUnitRank(unitID)
  end
end


function widget:UnitDestroyed(unitID, unitDefID, unitTeam)
  alliedUnits[unitID] = nil
  smallList[unitID] = nil
  sentmessage[unitID] = nil
end


function widget:UnitGiven(unitID, unitDefID, oldTeam, newTeam)
  if (Spring.IsUnitAllied(unitID)) then
    SetUnitRank(unitID)
  else
    alliedUnits[unitID] = nil
    smallList[unitID] = nil
    sentmessage[unitID] = nil
  end
end


-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

local function DrawUnitFunc(yshift)
  glTranslate(0,yshift,0)
  glBillboard()
  glTexRect(-iconsize+10.5, -9, 10.5, iconsize-9)
end


function widget:DrawWorld()
  if TooHigh or HighPing then 
    return
  end
  
  if Spring.IsGUIHidden() == false then 
    --if (next(smallList) == nil) then
    --  return -- avoid unnecessary GL calls
   -- end
  
    CreateBillboard()

    glDepthMask(true)
    glDepthTest(true)
    glAlphaTest(GL_GREATER, 0.01)
    for unitID, rankTexHeight in pairs(smallList) do
      glTexture(rankTexHeight[1])
      glDrawFuncAtUnit(unitID, false, DrawUnitFunc, rankTexHeight[2])
    end
       
    glTexture(false)
    glAlphaTest(false)
    glDepthTest(false)
    glDepthMask(false)
    
  end
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------