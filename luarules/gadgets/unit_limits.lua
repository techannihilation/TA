function gadget:GetInfo()
	return {
		name = "Spam Limiter",
		desc = "Limits number of units being build",
		author = "Silver",
		version = "",
		date = "2020",
		license = "GNU GPL, v2 or later",
		layer = 0,
		enabled = true
	}
end

--------------------------------------------------------------------------------
-- SPEEDUPS
--------------------------------------------------------------------------------
local GetGaiaTeamID = Spring.GetGaiaTeamID
local GetGameFrame = Spring.GetGameFrame
local GetTeamList = Spring.GetTeamList
local SendMessageToTeam = Spring.SendMessageToTeam
local strformat = string.format
--------------------------------------------------------------------------------
-- CONSTANS
--------------------------------------------------------------------------------
local rateLimit = tonumber(Spring.GetModOptions().mo_ratelimit) or 3 -- maximum number of units produced within one second
--------------------------------------------------------------------------------
local timePeriod = 50 -- time period after units count will be checked
local waitFrames = 30 -- delay after counter is zero out * total number of units produced in timePeriod
local div = timePeriod / 30
local counter = {}
local factoryList = {}
local gameFrame = {}
local prevgameFrame = {}
local unitsCount = {}
local messageSent = {}
local redcolor = "\255\255\64\64"
local yellowcolor = "\255\255\255\64"

if (gadgetHandler:IsSyncedCode()) then
	--------------------------------------------------------------------------------
	-- BEGIN SYNCED
	--------------------------------------------------------------------------------
	function gadget:Initialize()
		local gaiaTeamID = GetGaiaTeamID()
		local teamList = GetTeamList()

		for i = 1, #teamList do
			local teamID = teamList[i]

			if teamID ~= gaiaTeamID then
				prevgameFrame[teamID] = 0
				unitsCount[teamID] = 0
				messageSent[teamID] = false
			end
		end
	end

	local function sendWarningMessage(playerID, waitTime)
		SendMessageToTeam(playerID, yellowcolor .. "WARNING:" .. redcolor .. " SPAM LIMITER ACTIVATED FOR " .. strformat("%.2f", waitTime / 30) .. " SECONDS")
		messageSent[playerID] = true
	end

	function gadget:UnitFromFactory(unitID, unitDefID, unitTeam, factID, factDefID, userOrders)
		factoryList[factID] = true
		gameFrame[unitTeam] = GetGameFrame()
		unitsCount[unitTeam] = unitsCount[unitTeam] + 1

		if gameFrame[unitTeam] > prevgameFrame[unitTeam] + timePeriod then
			prevgameFrame[unitTeam] = gameFrame[unitTeam]
			counter[unitTeam] = unitsCount[unitTeam] / div
			unitsCount[unitTeam] = 0
		end
	end

	function gadget:AllowUnitCreation(unitDefID, builderID, builderTeamID, x, y, z, facing)
		if not factoryList[builderID] then return true end

		if counter[builderTeamID] and counter[builderTeamID] > rateLimit then
			local waitTime = waitFrames * counter[builderTeamID]
			gameFrame[builderTeamID] = GetGameFrame()

			if messageSent[builderTeamID] == false then
				sendWarningMessage(builderTeamID, waitTime)
			end

			if gameFrame[builderTeamID] > (prevgameFrame[builderTeamID] + waitTime) then
				counter[builderTeamID] = 0
				messageSent[builderTeamID] = false
			end

			return false
		else
			return true
		end
	end

	function gadget:UnitDestroyed(unitID, unitDefID, unitTeam, attackerID, attackerDefID, attackerTeam)
		factoryList[unitID] = nil
	end
else
	--------------------------------------------------------------------------------
	-- BEGIN UNSYNCED
	--------------------------------------------------------------------------------
end