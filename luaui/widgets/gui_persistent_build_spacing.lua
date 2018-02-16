function widget:GetInfo()
  return {
    name      = "Persistent Build Spacing",
    desc      = "Recalls last build spacing set for each building and game [v2.0]",
    author    = "Niobium & DrHash",
    date      = "Sep 6, 2011",
    license   = "GNU GPL, v3 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

-- Config
local defaultSpacing = 0

-- Globals
local lastCmdID = nil
local buildSpacing = {}

-- Speedups
local spGetActiveCommand = Spring.GetActiveCommand
local spGetBuildSpacing = Spring.GetBuildSpacing
local spSetBuildSpacing = Spring.SetBuildSpacing

-- Callins
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

function widget:Update()
    
    local _, cmdID = spGetActiveCommand()
    if cmdID and cmdID < 0 then
        
        if cmdID ~= lastCmdID then
            spSetBuildSpacing(buildSpacing[-cmdID] or defaultSpacing)
            lastCmdID = cmdID
        end
        
        buildSpacing[-cmdID] = spGetBuildSpacing()
    end
end

function widget:GetConfigData()
    return { buildSpacing = buildSpacing }
end

function widget:SetConfigData(data)
    buildSpacing = data.buildSpacing or {}
end