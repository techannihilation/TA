--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  Copyright (C) 2007.
--  Licensed under the terms of the GNU GPL, v2 or later.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:GetInfo()
  return {
    name      = "AllyCursors",
    desc      = "Shows the mouse pos of allied players",
    author    = "jK",
    date      = "May,2008",
    license   = "GNU GPL, v2 or later",
    layer     = 5,
    enabled   = true
  }
end


--------------------------------------------------------------------------------
-- CONFIG / CONSTANTS
--------------------------------------------------------------------------------

-- How often (in seconds) to send your mouse positions to allies
local PACKET_SEND_INTERVAL = 0.8

-- How many positions are buffered and sent in one packet
local POS_BUFFER_SIZE = 2

--------------------------------------------------------------------------------
-- SPEED / HELPER REFERENCES
--------------------------------------------------------------------------------

local floor        = math.floor
local pairs        = pairs
local clock        = os.clock

local GetMouseState      = Spring.GetMouseState
local TraceScreenRay     = Spring.TraceScreenRay
local SendLuaUIMsg       = Spring.SendLuaUIMsg
local GetGroundHeight    = Spring.GetGroundHeight
local GetPlayerInfo      = Spring.GetPlayerInfo
local GetTeamColor       = Spring.GetTeamColor
local IsSphereInView     = Spring.IsSphereInView
local GetSpectatingState = Spring.GetSpectatingState

local glTexCoord      = gl.TexCoord
local glVertex        = gl.Vertex
local glPolygonOffset = gl.PolygonOffset
local glDepthTest     = gl.DepthTest
local glTexture       = gl.Texture
local glColor         = gl.Color
local glBeginEnd      = gl.BeginEnd

local GL_QUADS        = GL.QUADS

--------------------------------------------------------------------------------
-- INTERPOLATION HELPERS
--------------------------------------------------------------------------------

--- A simple cubic Hermite-based interpolation for smoothing (1D).
local function CubicInterpolate2(a, b, mix)
  -- mix goes from 0 to 1
  local mix2 = mix * mix
  local mix3 = mix2 * mix
  -- Hermite basis:
  --   h1(t) =  2t^3 - 3t^2 + 1
  --   h2(t) = -2t^3 + 3t^2
  return a * (2 * mix3 - 3 * mix2 + 1) +
         b * (3 * mix2 - 2 * mix3)
end

--------------------------------------------------------------------------------
-- DATA / STATE
--------------------------------------------------------------------------------

-- WG.alliedCursorsPos[playerID] structure:
--   [1 .. 2*POS_BUFFER_SIZE]: x,z pairs
--   [2*POS_BUFFER_SIZE + 1]:  x fallback (oldest)
--   [2*POS_BUFFER_SIZE + 2]:  z fallback (oldest)
--   [2*POS_BUFFER_SIZE + 3]:  last update time
--   [2*POS_BUFFER_SIZE + 4]:  mouse pressed?
--   [2*POS_BUFFER_SIZE + 5]:  teamID
WG.alliedCursorsPos = {}

--------------------------------------------------------------------------------
-- RECV DATA FROM ALLIES
--------------------------------------------------------------------------------

local unpackedPos = {}

function widget:RecvLuaMsg(msg, playerID)
  -- Only handle messages prefixed with '%'
  if msg:sub(1, 1) ~= "%" then
    return
  end

  -- Ignore messages from ourselves
  if playerID == Spring.GetMyPlayerID() then
    return true
  end

  -- Format: "%<pressedFlag><positionData>"
  -- Each position is stored as 4 bytes (U16 for x, U16 for z).
  local pressedFlag = (msg:sub(2,2) == "1")
  local xzData      = msg:sub(3)  -- everything after "%0" or "%1"
  
  -- We expect xzData to be multiple of 4 bytes
  local chunkCount = xzData:len() * 0.25
  if chunkCount ~= POS_BUFFER_SIZE then
    return true
  end

  -- Unpack the positions into `unpackedPos`
  for i = 0, (POS_BUFFER_SIZE - 1) do
    local x = VFS.UnpackU16(xzData:sub(i*4+1,   i*4+2))
    local z = VFS.UnpackU16(xzData:sub(i*4+3,   i*4+4))
    unpackedPos[i*2 + 1] = x
    unpackedPos[i*2 + 2] = z
  end

  local cursorData = WG.alliedCursorsPos[playerID]

  if cursorData then
    -- Shift the old oldest positions to the "fallback" position
    cursorData[2*POS_BUFFER_SIZE + 1] = cursorData[1]
    cursorData[2*POS_BUFFER_SIZE + 2] = cursorData[2]
    
    -- Store new positions at the beginning
    for i = 0, (POS_BUFFER_SIZE - 1) do
      cursorData[i*2 + 1] = unpackedPos[i*2 + 1]
      cursorData[i*2 + 2] = unpackedPos[i*2 + 2]
    end
    
    cursorData[2*POS_BUFFER_SIZE + 3] = clock()
    cursorData[2*POS_BUFFER_SIZE + 4] = pressedFlag

  else
    -- Create fresh entry
    local newData = {}
    for i = 0, (POS_BUFFER_SIZE - 1) do
      newData[i*2 + 1] = unpackedPos[i*2 + 1]
      newData[i*2 + 2] = unpackedPos[i*2 + 2]
    end

    -- Fallback positions for interpolation
    newData[2*POS_BUFFER_SIZE + 1] = unpackedPos[(POS_BUFFER_SIZE - 2)*2 + 1] or 0
    newData[2*POS_BUFFER_SIZE + 2] = unpackedPos[(POS_BUFFER_SIZE - 2)*2 + 2] or 0

    newData[2*POS_BUFFER_SIZE + 3] = clock()
    newData[2*POS_BUFFER_SIZE + 4] = pressedFlag

    -- Store the player's teamID
    local _, _, _, teamID = GetPlayerInfo(playerID, false)
    newData[2*POS_BUFFER_SIZE + 5] = teamID

    WG.alliedCursorsPos[playerID] = newData
  end

  return true -- Message handled
end

--------------------------------------------------------------------------------
-- SEND DATA (OUR MOUSE POS TO ALLIES)
--------------------------------------------------------------------------------

local sendTimer    = 0
local posBuffer    = {} -- [1..2*POS_BUFFER_SIZE]: packed x,z pairs
local storedCount  = 0  -- how many positions we have buffered so far

-- Each chunk in posBuffer is collected at intervals such that:
local storeInterval = PACKET_SEND_INTERVAL / POS_BUFFER_SIZE

function widget:Update(dt)
  if GetSpectatingState() then
    -- If we become a spectator, stop sending
    widgetHandler:RemoveCallIn("Update")
    return
  end

  sendTimer = sendTimer + dt

  -- Periodically record mouse positions
  if (sendTimer % storeInterval) < 0.2 then
    local mx, my = GetMouseState()
    local st, pos = TraceScreenRay(mx, my, true)
    if pos then
      -- Store x,z as packed bytes
      posBuffer[storedCount*2 + 1] = VFS.PackU16(floor(pos[1]))
      posBuffer[storedCount*2 + 2] = VFS.PackU16(floor(pos[3]))
      storedCount = storedCount + 1
    end
  end

  -- Once we've collected enough positions or time is up, send packet
  if (sendTimer > PACKET_SEND_INTERVAL) and (storedCount >= POS_BUFFER_SIZE) then
    sendTimer   = 0
    storedCount = 0

    -- Mouse pressed flag ("0" or "1" if left or right is pressed)
    local pressedFlag = "0"
    local _, _, l, _, r = Spring.GetMouseState()
    if (l or r) then
      pressedFlag = "1"
    end

    -- Build message so the newest stored positions come first
    local posStr = pressedFlag
    for i = POS_BUFFER_SIZE, 1, -1 do
      local xStr = posBuffer[i*2 - 1] or ""
      local zStr = posBuffer[i*2]     or ""
      posStr = posStr .. xStr .. zStr
    end

    -- Send to all allied players
    SendLuaUIMsg("%" .. posStr, "allies")
  end
end

--------------------------------------------------------------------------------
-- RENDERING / DRAWING
--------------------------------------------------------------------------------

-- We draw a small quad on the ground for each cursor
local function DrawGroundQuad(wx, gy, wz)
  -- Use a 32x32 patch and gather ground heights for corners
  local gy_tl = GetGroundHeight(wx - 16, wz - 16) or gy
  local gy_tr = GetGroundHeight(wx + 16, wz - 16) or gy
  local gy_bl = GetGroundHeight(wx - 16, wz + 16) or gy
  local gy_br = GetGroundHeight(wx + 16, wz + 16) or gy
  local gy_l  = GetGroundHeight(wx - 16, wz)      or gy
  local gy_r  = GetGroundHeight(wx + 16, wz)      or gy
  local gy_t  = GetGroundHeight(wx,      wz - 16) or gy
  local gy_b  = GetGroundHeight(wx,      wz + 16) or gy

  -- Top-left
  glTexCoord(0,   0);    glVertex(wx - 16, gy_bl, wz - 16)
  glTexCoord(0,   0.5);  glVertex(wx - 16, gy_l,  wz)
  glTexCoord(0.5, 0.5);  glVertex(wx,      gy,    wz)
  glTexCoord(0.5, 0);    glVertex(wx,      gy_t,  wz - 16)

  -- Top-right
  glTexCoord(0.5, 0);    glVertex(wx,      gy_t,  wz - 16)
  glTexCoord(0.5, 0.5);  glVertex(wx,      gy,    wz)
  glTexCoord(1,   0.5);  glVertex(wx + 16, gy_r,  wz)
  glTexCoord(1,   0);    glVertex(wx + 16, gy_tr, wz - 16)

  -- Bottom-right
  glTexCoord(0.5, 0.5);  glVertex(wx,      gy,    wz)
  glTexCoord(0.5, 1);    glVertex(wx,      gy_b,  wz + 16)
  glTexCoord(1,   1);    glVertex(wx + 16, gy_br, wz + 16)
  glTexCoord(1,   0.5);  glVertex(wx + 16, gy_r,  wz)

  -- Bottom-left
  glTexCoord(0.5, 0.5);  glVertex(wx,      gy,    wz)
  glTexCoord(0.5, 1);    glVertex(wx,      gy_b,  wz + 16)
  glTexCoord(1,   1);    glVertex(wx - 16, gy_bl, wz + 16)
  glTexCoord(1,   0.5);  glVertex(wx - 16, gy_l,  wz)
end

-- Cache the team colors in a local table to avoid repeated color lookups
local teamColors = {}
local function SetTeamColor(teamID, alpha)
  local color = teamColors[teamID]
  if not color then
    local r, g, b = GetTeamColor(teamID)
    if not r or not g or not b then
      -- fallback
      r, g, b = 1, 1, 1
    end
    color = {r, g, b}
    teamColors[teamID] = color
  end
  color[4] = alpha
  glColor(color)
end

function widget:DrawWorldPreUnit()
  if Spring.IsGUIHidden() then
    return
  end

  glDepthTest(true)
  glTexture("LuaUI/Images/allycursor.dds")
  glPolygonOffset(-7, -10)

  local now = clock()

  for playerID, data in pairs(WG.alliedCursorsPos) do
    local lastUpdate  = data[2*POS_BUFFER_SIZE + 3]
    local mouseDown   = data[2*POS_BUFFER_SIZE + 4]
    local teamID      = data[2*POS_BUFFER_SIZE + 5]

    -- Draw a series of fading "ghost" cursors
    for fadeLevel = 0, 5 do
      local fadeTime = (now - lastUpdate) + fadeLevel * 0.025

      -- Default to the very latest position
      local wx = data[1]
      local wz = data[2]

      if fadeTime < PACKET_SEND_INTERVAL then
        -- Interpolate between stored points
        local totalSpan = PACKET_SEND_INTERVAL
        local prog      = (1 - (fadeTime / totalSpan)) * POS_BUFFER_SIZE
        local iFloor    = floor(prog)
        local fraction  = prog - iFloor

        if iFloor < POS_BUFFER_SIZE then
          local xA = data[iFloor*2 + 1]
          local zA = data[iFloor*2 + 2]
          local xB = data[(iFloor + 1)*2 + 1]
          local zB = data[(iFloor + 1)*2 + 2]
          if xA and xB then
            wx = CubicInterpolate2(xA, xB, fraction)
            wz = CubicInterpolate2(zA, zB, fraction)
          end
        end
      end

      local gy = GetGroundHeight(wx, wz) or 0

      if IsSphereInView(wx, gy, wz, 16) then
        local alpha = fadeLevel * 0.2
        SetTeamColor(teamID, alpha)
        glBeginEnd(GL_QUADS, DrawGroundQuad, wx, gy, wz)
      end
    end
  end

  glPolygonOffset(false)
  glTexture(false)
  glDepthTest(false)
end
