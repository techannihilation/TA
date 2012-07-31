if not Spring.GetConfigInt("LuaSocketEnabled", 0) == 1 then
	Spring.Echo("LuaSocketEnabled is disabled")
	return false
end


function widget:GetInfo()
return {
	name    = "TA Statistics Client",
	desc    = "TBD",
	author  = "Finkky ",
	date    = "Spring 2012",
	license = "GNU GPL, v2 or later",
	layer   = 0,
	enabled = true,
}
end

_G = {}

include("3rdpartylibs/sha1.lua")
include("3rdpartylibs/dumper.lua")
include("3rdpartylibs/jsonutils.lua")

local socket = socket

local client
local set
local headersent


--local host = "localhost" http://
local host = "ta-backend.rhcloud.com" --ta-backend.rhcloud.com"
local port = 80
local file = "/"

local spGetActiveCommand 	= Spring.GetActiveCommand
local spGetKeyState         = Spring.GetKeyState
local spGetModKeyState      = Spring.GetModKeyState
local spGetSelectedUnits    = Spring.GetSelectedUnits
local spGetUnitDefID        = Spring.GetUnitDefID
local spGetUnitPosition     = Spring.GetUnitPosition
local spGetGameSeconds      = Spring.GetGameSeconds
local spGetActiveCommand 	= Spring.GetActiveCommand
local spGetActiveCmdDesc 	= Spring.GetActiveCmdDesc
local spGetMouseState       = Spring.GetMouseState
local spTraceScreenRay      = Spring.TraceScreenRay
local spGetMyPlayerID       = Spring.GetMyPlayerID
local spGetPlayerInfo       = Spring.GetPlayerInfo
local spGetCameraVectors    = Spring.GetCameraVectors
local spEcho                = Spring.Echo
local spWarpMouse			= Spring.WarpMouse
local spGetBuildFacing		= Spring.GetBuildFacing
local spSetBuildFacing 		= Spring.SetBuildFacing
local spPos2BuildPos 		= Spring.Pos2BuildPos
local spGetGroundHeight 	= Spring.GetGroundHeight
local spGetLocalTeamID		= Spring.GetLocalTeamID

local spGetTeamRulesParam   = Spring.GetTeamRulesParam
local spGetMyTeamID 		= Spring.GetMyTeamID
local spSendLuaRulesMsg     = Spring.SendLuaRulesMsg
local spGetConfigString 	= Spring.GetConfigString
local spGetLocalPlayerID 	= Spring.GetLocalPlayerID


local floor                 = math.floor
local abs					= math.abs
local atan2                 = math.atan2
local pi                    = math.pi
local sqrt                  = math.sqrt

local tauid = "@@@@@TA$UID@@@@@"
wd = "|"

local function dump(a1)
  Spring.Echo(DataDumper(a1, nil, false))
end

local function dumper(a1)
  return DataDumper(a1, nil, true)
end

local function SocketConnect(host, port)
	client=socket.tcp()
	client:settimeout(50)
	res, err = client:connect(host, port)
	if not res and not res=="timeout" then
		Spring.Echo("Error in connect: "..err)
		return false
	end
	return true, client
end

local c2

local function simplySendOneWay(textData)
	status, client = SocketConnect(host, port)
	if status then
		--Spring.Echo(status)
		client:send(textData)
		--Spring.Echo(client:receive('*a'))
		client:close()
	end
end

local function httpPostJsonSigned(file, jsonText, tokenKey, tokenSecret, gameID)
	request = 
	"POST /resources/secured/"..file.." HTTP/1.0\r\n"..
	"Host: "..host.."\r\n"..
	"X-TA-TokenKey: "..tokenKey.."\r\n"..
	"X-TA-HMAC: "..hmac_sha1(tokenSecret, jsonText).."\r\n"..
	"X-TA-GameID: "..gameID.."\r\n"..
	"Content-Length: "..jsonText:len().."\r\n"..
	"Content-Type: application/json\r\n"..
	"\r\n"..
	jsonText.."\r\n"
	simplySendOneWay(request)
end

local function newDataCallin(path, data, gameID)
	Spring.Echo("Sending game stats data-chunk ... [".. path .."][" .. gameID .. "]")
	httpPostJsonSigned(path,"{\""..path .."\":"..data.."}", spGetConfigString("TATokenKey", emptyStringInd),	spGetConfigString("TATokenSecret", emptyStringInd), gameID and gameID or "N/A")
end

local function checkGameID()
	local protoid = tostring(math.random())
	local gameid = sha1(protoid)
	spSendLuaRulesMsg(tauid..wd..spGetLocalPlayerID()..wd.."gameID"..wd..gameid)
end

function widget:GameStart()
	checkGameID()
end

function widget:GameOver()
	spSendLuaRulesMsg(tauid..wd..spGetLocalPlayerID()..wd.."winners"..wd.."You do that!")
end

function widget:Initialize()
	widgetHandler:RegisterGlobal("newDataCallin", newDataCallin)
	checkGameID()
end