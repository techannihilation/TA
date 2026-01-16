function widget:GetInfo()
  return {
    name    = "UnitUpgradeDrawer",
    desc    = "Draws ghost shape & progress bar for in-progress upgrades",
    author  = "[ur]uncle",
    date    = "2024-12-29",
    version = "1.7",
    license = "GNU GPL v2 or later",
    layer   = -11, -- load before unit_healthbars.lua widget
    enabled = true,
  }
end

--------------------------------------------
--  Locals
--------------------------------------------
local spIsUnitVisible     = Spring.IsUnitVisible
local spGetUnitHeading    = Spring.GetUnitHeading
local spGetUnitBasePos    = Spring.GetUnitBasePosition
local spGetUnitTeam       = Spring.GetUnitTeam
local spGetLocalTeamID    = Spring.GetLocalTeamID
local spAreTeamsAllied    = Spring.AreTeamsAllied
local spGetUnitRulesParam = Spring.GetUnitRulesParam
local spValidUnitID       = Spring.ValidUnitID
local spGetGameFrame      = Spring.GetGameFrame
local spGetUnitDefID      = Spring.GetUnitDefID

local GL_ONE      = GL.ONE
local GL_LEQUAL   = GL.LEQUAL
local GL_SRC_ALPHA = GL.SRC_ALPHA
local GL_ONE_MINUS_SRC_ALPHA = GL.ONE_MINUS_SRC_ALPHA

local headingToDegree = 360 / 65535

local unitsInProgress = {}   -- [unitID] = true
local teamColors      = {}   -- [teamID] = {r,g,b}
local alreadyInit     = {}   -- [teamID][unitDefID] = true
WG["unitInUpgrade"] = {} -- for unit_healthbars.lua widget

--------------------------------------------
--  Helpers
--------------------------------------------
local function InitializeUnitShape(unitDefID, teamID)
  alreadyInit[teamID] = alreadyInit[teamID] or {}
  if alreadyInit[teamID][unitDefID] then
    return
  end
  gl.PushMatrix()
    gl.ColorMask(false)
    gl.UnitShape(unitDefID, teamID, true)
    gl.ColorMask(true)
  gl.PopMatrix()
  alreadyInit[teamID][unitDefID] = true
end

local function SetTeamColor(teamID, alpha)
  local c = teamColors[teamID]
  if c then
    gl.Color(c[1], c[2], c[3], alpha)
    return
  end
  local r,g,b = Spring.GetTeamColor(teamID)
  if r and g and b then
    teamColors[teamID] = {r,g,b}
    gl.Color(r,g,b, alpha)
  else
    gl.Color(1,1,1, alpha)
  end
end

--------------------------------------------
--  Global functions called by unsynced gadget
--------------------------------------------
function UpgradeStart(unitID)
  unitsInProgress[unitID] = true
  WG["unitInUpgrade"][unitID] = true
end

function UpgradeStop(unitID)
  unitsInProgress[unitID] = nil
  WG["unitInUpgrade"][unitID] = nil
end

--------------------------------------------
--  Widget standard callins
--------------------------------------------
function widget:Initialize()
  widgetHandler:RegisterGlobal("UpgradeStart", UpgradeStart)
  widgetHandler:RegisterGlobal("UpgradeStop",  UpgradeStop)
end

function widget:Shutdown()
  widgetHandler:DeregisterGlobal("UpgradeStart")
  widgetHandler:DeregisterGlobal("UpgradeStop")
end

function widget:DrawWorld()
  gl.Blending(GL_SRC_ALPHA, GL_ONE)
  gl.DepthTest(GL_LEQUAL)

  local myTeam = spGetLocalTeamID()
  local i = 1
  -- loop only over known upgrading units
  for uID in pairs(unitsInProgress) do
    -- Spring.Echo(i)
    -- i = i + 1
    if spValidUnitID(uID) then
      local inProg = spGetUnitRulesParam(uID, "upgrade_inProgress") or 0
      if inProg == 1 and spIsUnitVisible(uID, 64, true) then
        local heading = spGetUnitHeading(uID)
        local px, py, pz = spGetUnitBasePos(uID)

        if heading and px then
          local teamID    = spGetUnitTeam(uID) or -1
          local accumPaid = spGetUnitRulesParam(uID, "upgrade_accumCost") or 0
          local totalCost = spGetUnitRulesParam(uID, "upgrade_totalCost") or 1
          local ratio     = math.min(accumPaid / math.max(totalCost, 0.0001), 1)
          local defID     = spGetUnitDefID(uID) or -1

          -- prepare shape
          InitializeUnitShape(defID, teamID)

          -- flickering alpha effect
          local alpha = (math.sin((spGetGameFrame() + uID) * 0.2) * 0.3) + 0.7

          -- draw ghost shape
          SetTeamColor(teamID, alpha)
          gl.PushMatrix()
            gl.Translate(px, py, pz)
            gl.Rotate(heading * headingToDegree, 0, 1, 0)
            gl.Scale(1.05, 1.05, 1.05)
            gl.UnitShape(defID, teamID, true, true, true)
          gl.PopMatrix()

          -- progress text if allied
          if myTeam and spAreTeamsAllied(myTeam, teamID) then
            gl.PushMatrix()
              gl.Translate(px, py + 14, pz)
              gl.Billboard()
              gl.Text(string.format("Upgrade: %.0f%%", ratio * 100), 0, -20, 11, "oc")
            gl.PopMatrix()
          end
        end
      end
    end
  end

  gl.Color(1,1,1,1)
  gl.DepthTest(false)
  gl.Blending(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)
end
