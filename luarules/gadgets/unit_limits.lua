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

local unitLimiter = tonumber(Spring.GetModOptions().mo_unitlimiter) or 0
if unitLimiter == 0 then return 0 end
--------------------------------------------------------------------------------
-- SPEEDUPS
--------------------------------------------------------------------------------
local GetGameFrame = Spring.GetGameFrame
local SendMessageToTeam = Spring.SendMessageToTeam
--------------------------------------------------------------------------------
-- CONSTANS
--------------------------------------------------------------------------------
local maxCounter = 10 -- maximum units/time period for each team
local timePeriod = 120 -- time period to check count of units
local waitFrames = 10 -- delay frames before counter is zero out * number of units build in timePeriod
--------------------------------------------------------------------------------
local counter = {}
local factoryList = {}
local gameFrame = {}
local prevgameFrame = {}
local unitsCount = {}
local redcolor = "\255\255\64\64"
local yellowcolor = "\255\255\255\64"

if (gadgetHandler:IsSyncedCode()) then
	--------------------------------------------------------------------------------
	-- BEGIN SYNCED
	--------------------------------------------------------------------------------
	function gadget:Initialize()
	end

	function gadget:UnitFromFactory(unitID, unitDefID, unitTeam, factID, factDefID, userOrders)
		gameFrame[unitTeam] = GetGameFrame()

		if not prevgameFrame[unitTeam] then
			prevgameFrame[unitTeam] = gameFrame[unitTeam]
		end

		factoryList[factID] = true

		if unitsCount[unitTeam] == nil then
			unitsCount[unitTeam] = 0
		end

		unitsCount[unitTeam] = unitsCount[unitTeam] + 1

		if gameFrame[unitTeam] > prevgameFrame[unitTeam] + timePeriod then
			prevgameFrame[unitTeam] = gameFrame[unitTeam]
			counter[unitTeam] = unitsCount[unitTeam]
			unitsCount[unitTeam] = 0
		end
	end

	function gadget:AllowUnitCreation(unitDefID, builderID, builderTeamID, x, y, z, facing)
		gameFrame[builderTeamID] = GetGameFrame()
		if not factoryList[builderID] then return true end

		if (counter[builderTeamID] and counter[builderTeamID] > maxCounter) then
			local waitTime = waitFrames * counter[builderTeamID]

			if gameFrame[builderTeamID] > (prevgameFrame[builderTeamID] + waitTime) then
				counter[builderTeamID] = 0
			end

			SendMessageToTeam(builderTeamID, yellowcolor .. "WARNING:" .. redcolor .. " SPAM LIMITER ACTIVETED FOR " .. math.floor(waitTime / 30) .. " SECONDS")

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