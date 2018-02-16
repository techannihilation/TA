-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

function widget:GetInfo()
  return {
    name      = "Unit Count Indicator",
    desc      = "Shows Unit Count",
    author    = "nixtux",
    date      = "30 July 2014",
    license   = "GNU GPL, v2 or later",
    layer     = 10,
    enabled   = true  -- loaded by default?
  }
end

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

-- speed-ups
local SpGetMyTeamID = Spring.GetMyTeamID
local SpIsGUIHidden = Spring.IsGUIHidden
local SpGetTeamUnits = Spring.GetTeamUnits
local spGetSpectatingState = Spring.GetSpectatingState

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

local MAXunits = tonumber(Spring.GetModOptions().maxunits) or 500
local UnitCount = nil

local tackyfontpath = "luarules/fonts/LCD2U___.TTF"
local textcolor =  { 1.0, 0.0, 0.0, 1.0 }
local outline =  { 0.1, 0.1, 0.1, 1.0 }	
local vsx,vsy = Spring.GetViewGeometry()
local dx,dy = vsx*0.955, vsy*0.88
local teamID = SpGetMyTeamID()
local tackyfont = gl.LoadFont( tackyfontpath, 16 )

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
function widget:Initialize()
  if Spring.IsReplay() or Spring.GetGameFrame() > 0 then
    widget:PlayerChanged()
  else
    tackyfont = gl.LoadFont( tackyfontpath, 16 )
    teamID = SpGetMyTeamID()
    UnitCount = #SpGetTeamUnits(teamID)
    vsx,vsy = Spring.GetViewGeometry()
    dx = vsx*0.955
    dy = vsy*0.88
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

function widget:ViewResize()
  vsx,vsy = Spring.GetViewGeometry()
  dx = vsx*0.955
  dy = vsy*0.88
end

function widget:GameFrame(frame)
  if ((frame+24)%32<1) then
    UnitCount = #SpGetTeamUnits(teamID)
    if UnitCount < (MAXunits * 0.95) then
      UnitCount = nil
    end
  end
end

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

function widget:DrawScreen()
  if (SpIsGUIHidden() == false) then
    if (UnitCount ~= nil) and (Spring.GetGameFrame() > 0) then
    tackyfont:Begin()
    tackyfont:SetOutlineColor( outline )
    tackyfont:SetTextColor( textcolor )
    tackyfont:Print("Unit Count", dx, dy, 20,'cO')
    tackyfont:Print(UnitCount, dx, dy - 28, 26,'cO')
    tackyfont:End()
    end
  end
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------