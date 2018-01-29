
function widget:GetInfo()
  return {
    name      = "Auto First Build Facing",
    desc      = "Set buildfacing toward map center on the first building placed",
    author    = "zwzsg with lotsa help from #lua channel",
    date      = "October 26, 2008",
    license   = "Free",
    layer     = 0,
    enabled   = true  -- loaded by default
  }
end


local facing=0
local x=0
local z=0
local n=0

local SpGetTeamUnitCount = Spring.GetTeamUnitCount
local SpGetMyTeamID = Spring.GetMyTeamID
local SpGetTeamUnits = Spring.GetTeamUnits
local SpGetUnitPosition = Spring.GetUnitPosition
local SpGetActiveCommand = Spring.GetActiveCommand
local SpSendCommands = Spring.SendCommands
local pairs = pairs
local abs = math.abs

function widget:Initialize()
	if Spring.IsReplay() or Spring.GetGameFrame() > 0 then
	    widget:PlayerChanged()
  	end
end

function widget:PlayerChanged(playerID)
	if Spring.GetSpectatingState() and Spring.GetGameFrame() > 0 then
		widgetHandler:RemoveWidget(self)
	end
end

function widget:GameStart()
	widget:PlayerChanged()
end

-- Count all units and calculate their barycenter
function widget:GameFrame(f)
  if f==3 then
    if SpGetTeamUnitCount(SpGetMyTeamID()) and SpGetTeamUnitCount(SpGetMyTeamID())>0 then
      for k,unitID in pairs(SpGetTeamUnits(SpGetMyTeamID())) do
        local ux=0
        local uz=0
        ux,_,uz=SpGetUnitPosition(unitID)
        if ux and uz then
          x=x+ux
          z=z+uz
          n=n+1
        end
      end
    end
    x=x/n
    z=z/n
    widget.widgetHandler.RemoveCallIn(widget.widget,"GameFrame")
  end
end

-- Set buildfacing the first time a building is about to be built
function widget:Update()
  local _,cmd=SpGetActiveCommand()
  if cmd and cmd<0 then
    if abs(Game.mapSizeX - 2*x) > abs(Game.mapSizeZ - 2*z) then
      if (2*x>Game.mapSizeX) then
        facing="west"
      else
        facing="east"
      end
    else
      if (2*z>Game.mapSizeZ) then
        facing="north"
      else
        facing="south"
      end
    end
    SpSendCommands({"buildfacing "..facing})
    widget.widgetHandler.RemoveCallIn(widget.widget,"Update")
  end
end
