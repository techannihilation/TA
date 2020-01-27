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
--------------------------------------------------------------------------------
-- CONSTANS
--------------------------------------------------------------------------------
local waitFrames = 15
local maxCounter = 5
--------------------------------------------------------------------------------
local prevGameframe = 0
local Counter = {}
local unitsCount = {}
local gameframe = GetGameFrame()
local factoryList = {}

if (gadgetHandler:IsSyncedCode()) then
	--------------------------------------------------------------------------------
	-- BEGIN SYNCED
	--------------------------------------------------------------------------------
	function gadget:Initialize()
	end

	function gadget:UnitFromFactory(unitID, unitDefID, unitTeam, factID, factDefID, userOrders)
		gameframe = GetGameFrame()
		factoryList[factID] = true

		if unitsCount[unitTeam] == nil then
			unitsCount[unitTeam] = 0
		end

		unitsCount[unitTeam] = unitsCount[unitTeam] + 1

		if gameframe > prevGameframe + 30 then
			prevGameframe = gameframe
			Counter[unitTeam] = unitsCount[unitTeam]
			unitsCount[unitTeam] = 0
		end
	end

	function gadget:AllowUnitCreation(unitDefID, builderID, ubuilderTeam, x, y, z, facing)
		gameframe = GetGameFrame()
		if not factoryList[builderID] then return true end

		if (Counter[ubuilderTeam] and Counter[ubuilderTeam] > maxCounter) then
			if gameframe > prevGameframe + (waitFrames * Counter[ubuilderTeam]) then
				Counter[ubuilderTeam] = 0
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