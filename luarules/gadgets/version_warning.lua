function gadget:GetInfo()
  return {
    name      = "Version Check",
    desc      = "Prints a warning if engine version is too low/high",
    author    = "Bluestone",
    date      = "Horses",
    license   = "",
    layer     = math.huge,
    enabled   = true  --  loaded by default?
  }
end

if (gadgetHandler:IsSyncedCode()) then
    return
end

-- don't forget to update it!
local minMajorEngineVersion = 101 
local minMinorEngineVersion = 201
local maxEngineVersion = 102 
-- no real need for a max minor version

local wantedEngineVersions = ""
if minMajorEngineVersion == maxEngineVersion and not minMinorEngineVersion then
    wantedEngineVersions = tostring(minMajorEngineVersion) .. " or equivalent."
else
    wantedEngineVersions = tostring(minMajorEngineVersion) .. (minMinorEngineVersion and ".0.1-"..tostring(minMinorEngineVersion) or "" ) .. "  --  " .. tostring(maxEngineVersion) .. " or equivalent."
end

local red = "\255\255\1\1"

function Warning()
    local reportedMajorVersion, reportedMinorVersion
    local devEngine
    if string.find(Game.version,".",1,true) then 
        local n = string.find(Game.version,".",1,true)
        reportedMajorVersion = string.sub(Game.version,1,n-1)   
        local m = string.find(Game.version,"-",1,true)
        local m2 = string.find(Game.version,"-",m+1,true)
        reportedMinorVersion = string.sub(Game.version,m+1,m2-1)
        devEngine = true
    else 
        local n = string.len(Game.version)
        reportedMajorVersion = string.sub(Game.version,1,n-1)  
        devEngine = false
    end
    
    if not reportedMajorVersion then return end
    if devEngine and not reportedMinorVersion then return end
    
    reportedMajorVersion = tonumber(reportedMajorVersion)
    reportedMinorVersion = tonumber(reportedMinorVersion)

    if (not devEngine and reportedMajorVersion<minMajorEngineVersion) 
        or (devEngine and reportedMajorVersion<minMajorEngineVersion) 
        or (devEngine and reportedMajorVersion==minMajorEngineVersion and reportedMinorVersion<minMinorEngineVersion) 
    then
        Spring.Echo(red .. "WARNING: You are using Spring " .. Game.version .. ", which is too old for this game.")
        Spring.Echo(red .. "Please update your engine to  " .. wantedEngineVersions)
    elseif reportedMajorVersion>maxEngineVersion then
        Spring.Echo(red .. "WARNING: You are using Spring " .. Game.version .. " which is too recent for this game.")
        Spring.Echo(red .. "Please downgrade your engine to Spring " .. wantedEngineVersions)
    end           
end

function gadget:GameStart()
    Warning()
end




--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
