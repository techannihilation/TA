--------------------------------------------------------------------------------
--  mo_noowner.lua - destroys (or erases) abandoned teams in FFA
--  Updated for Spring / Recoil 105+ (June 2025)                     v2.0
--------------------------------------------------------------------------------

function gadget:GetInfo()
	return {
		name      = "mo_noowner",
		desc      = "No-owner mode for FFA games - removes abandoned teams",
		author    = "TheFatController",
		date      = "08 Jun 2025",
		license   = "GNU GPL v2+",
		layer     = 0,
		enabled   = true
	}
end

--------------------------------------------------------------------------------
-- EARLY OUT (unsynced / modoption disabled)
--------------------------------------------------------------------------------

if not gadgetHandler:IsSyncedCode() then
	return
end

local enabled = tonumber(Spring.GetModOption("mo_noowner") or 0)
if enabled == 0 then
	return false
end

--------------------------------------------------------------------------------
--  SHALLOW IMPORTS / SHORTCUTS
--------------------------------------------------------------------------------

local GetGameFrame        = Spring.GetGameFrame
local GetPlayerInfo       = Spring.GetPlayerInfo
local GetPlayerList       = Spring.GetPlayerList
local GetTeamList         = Spring.GetTeamList
local GetTeamUnits        = Spring.GetTeamUnits
local DestroyUnit         = Spring.DestroyUnit
local GetUnitTransporter  = Spring.GetUnitTransporter
local GetAIInfo           = Spring.GetAIInfo
local GetTeamLuaAI        = Spring.GetTeamLuaAI
local GetTeamRulesParam   = Spring.GetTeamRulesParam
local SetTeamRulesParam   = Spring.SetTeamRulesParam

--------------------------------------------------------------------------------
--  CONSTANTS (frames)
--------------------------------------------------------------------------------

local FPS             = Game.gameSpeed         -- sim frames per second
local MIN             = 60 * FPS               -- helper: 1 minute in frames
local NOWRECKS_LIMIT  = 5 * MIN                -- no wrecks if team dies early
local EARLY_DROP_END  = 2 * MIN                -- "early" window ends here
local EARLY_GRACE     = 1 * MIN                -- reconnect grace (early)
local LATE_GRACE      = 3 * MIN                -- reconnect grace (late)

--------------------------------------------------------------------------------
--  STATE TABLES
--------------------------------------------------------------------------------

local gaiaID              = Spring.GetGaiaTeamID()
local deadTeam            = {}   -- [teamID] = true    (permanently gone)
local droppedTeamFrame    = {}   -- [teamID] = frame   (first detected drop)
local teamsQueuedToDie    = {}   -- [teamID] = true    (unit kill waiting list)

--------------------------------------------------------------------------------
--  UTILITIES
--------------------------------------------------------------------------------

local function teamIsAI(teamID)
	local shortName = select(1, GetAIInfo(teamID))
	return shortName ~= nil
end

local function iterTeams()
	local t = GetTeamList()
	for i = 1, (t and #t or 0) do
		coroutine.yield(t[i])
	end
end

local function getTeamControlState(teamID)
	if teamID == gaiaID or GetTeamLuaAI(teamID) ~= "" then
		return false, false
	end

	local players     = GetPlayerList(teamID) or {}
	local noneControl = true
	local allResigned = true

	for _, pID in ipairs(players) do
		local _, active, spectating = GetPlayerInfo(pID)
		if active and not spectating then
			noneControl = false
		end
		if not spectating then
			allResigned = false
		end
	end

	if teamIsAI(teamID) then
		allResigned = false
		local hostID = select(3, GetAIInfo(teamID))
		if hostID then
			local _, hostActive, hostSpec = GetPlayerInfo(hostID)
			if hostActive and not hostSpec then
				noneControl = false
			end
		end
	end

	return noneControl, allResigned
end

local function destroyTeamUnits(teamID, atFrame)
	local wipeWrecks = (atFrame < NOWRECKS_LIMIT)
	local units      = GetTeamUnits(teamID)

	for _, uID in ipairs(units) do
		if not GetUnitTransporter(uID) then
			if wipeWrecks then
				DestroyUnit(uID, true, false)
			else
				DestroyUnit(uID)
			end
		end
	end

	deadTeam[teamID] = true
	droppedTeamFrame[teamID] = nil
end

--------------------------------------------------------------------------------
--  CALL-INS
--------------------------------------------------------------------------------

function gadget:TeamDied(teamID)
	teamsQueuedToDie[teamID] = true
end

function gadget:GameFrame(frame)
	-- finish off teams already marked dead
	for tID in pairs(teamsQueuedToDie) do
		destroyTeamUnits(tID, frame)
		teamsQueuedToDie[tID] = nil
	end

	-- detect new drops or reconnections
	for teamID in coroutine.wrap(iterTeams) do
		if not deadTeam[teamID] then
			local noneControl, allResigned = getTeamControlState(teamID)

			if noneControl then
				if allResigned then
					destroyTeamUnits(teamID, frame)
				elseif not droppedTeamFrame[teamID] then
					local grace = (frame < EARLY_DROP_END) and EARLY_GRACE or LATE_GRACE
					droppedTeamFrame[teamID] = frame
				end

			elseif droppedTeamFrame[teamID] then
				droppedTeamFrame[teamID] = nil
			end
		end
	end

	-- expire grace periods
	for teamID, startFrame in pairs(droppedTeamFrame) do
		local grace = (startFrame < EARLY_DROP_END) and EARLY_GRACE or LATE_GRACE
		if frame - startFrame > grace then
			destroyTeamUnits(teamID, frame)
		end
	end
end

function gadget:AllowUnitTransfer(_, _, _, newTeam)
	return not deadTeam[newTeam]
end

function gadget:GameOver()
	gadgetHandler:RemoveGadget()
end
