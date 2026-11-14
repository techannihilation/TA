-- Minimal synced-engine fixture. Geometry, command parsing and task execution
-- use the real game files; only the Spring API is stubbed.
local Fixture = {}

function Fixture.Create(options)
	local fixture = {
		options = options or {},
		heights = {},
		original = function() return 0 end,
		ground = function() return 0 end,
		metal = 0,
		energy = 1000000,
		spent = 0,
		energySpent = 0,
		paymentAttempts = 0,
		writes = 0,
		batches = 0,
		messages = {},
		frame = 0,
		unitID = 11,
		unitX = 256,
		unitZ = 256,
		teamID = 0,
		stunned = false,
	}

	Game = {mapSizeX = 512, mapSizeZ = 512, gameSpeed = 30, mapDamage = true}
	GG = {}
	LOG = {WARNING = "warning"}
	CMD = {REMOVE = 2, RESTORE = 110}
	CMDTYPE = {ICON_MAP = 1}
	WeaponDefs = {}
	Script = {SetWatchWeapon = function() end}
	UnitDefs = {}
	UnitDefNames = setmetatable({}, {
		__index = function(definitions, name)
			local id = #UnitDefs + 1
			local definition = {id = id}
			definitions[name] = definition
			UnitDefs[id] = {
				buildSpeed = 300, buildDistance = 150, isBuilder = false,
				maxAcc = 1, isBuilding = false, customParams = {},
			}
			return definition
		end,
	})
	fixture.unitDefID = UnitDefNames.armcom.id

	local function groundHeight(x, z)
		local column = fixture.heights[x]
		local height = column and column[z]
		if height ~= nil then
			return height
		end
		return fixture.ground(x, z)
	end

	Spring = {
		GetModOptions = function() return fixture.options end,
		GetGroundHeight = groundHeight,
		GetGroundOrigHeight = function(x, z) return fixture.original(x, z) end,
		GetGroundNormal = function() return 0, 1, 0 end,
		SetHeightMapFunc = function(callback, ...)
			fixture.batches = fixture.batches + 1
			callback(...)
		end,
		SetHeightMap = function(x, z, height)
			assert(height == height and math.abs(height) < math.huge)
			fixture.heights[x] = fixture.heights[x] or {}
			fixture.heights[x][z] = height
			fixture.writes = fixture.writes + 1
		end,
		UseTeamResource = function(teamID, resources)
			assert(teamID == fixture.teamID and type(resources) == "table")
			local metal = resources.m or 0
			local energy = resources.e or 0
			assert(metal >= 0 and metal < math.huge)
			assert(energy >= 0 and energy < math.huge)
			assert(metal > 0 or energy > 0)
			fixture.paymentAttempts = fixture.paymentAttempts + 1
			if metal > fixture.metal or energy > fixture.energy then
				return false
			end
			fixture.metal = fixture.metal - metal
			fixture.energy = fixture.energy - energy
			fixture.spent = fixture.spent + metal
			fixture.energySpent = fixture.energySpent + energy
			return true
		end,
		ValidUnitID = function(id) return id == fixture.unitID end,
		GetUnitIsDead = function() return false end,
		GetUnitTeam = function() return fixture.teamID end,
		GetUnitDefID = function() return fixture.unitDefID end,
		GetUnitPosition = function() return fixture.unitX, 0, fixture.unitZ end,
		GetUnitIsStunned = function() return fixture.stunned end,
		GetUnitCommands = function() return fixture.command and {fixture.command} or {} end,
		GetAllUnits = function() return {fixture.unitID} end,
		GetTeamAllyTeamID = function() return nil end,
		GiveOrderToUnit = function(id, command)
			assert(id == fixture.unitID and command == CMD.REMOVE)
			fixture.command = nil
		end,
		ClearUnitGoal = function() end,
		SetUnitMoveGoal = function() end,
		InsertUnitCmdDesc = function() end,
		FindUnitCmdDesc = function() return nil end,
		MoveCtrl = {IsEnabled = function() return false end},
		Log = function(_, _, message) fixture.messages[#fixture.messages + 1] = message end,
	}
	SendToUnsynced = function(_, _, message)
		fixture.messages[#fixture.messages + 1] = message
	end
	VFS = {Include = function(path) return assert(loadfile(path))() end}
	gadgetHandler = {
		IsSyncedCode = function() return true end,
		RegisterCMDID = function() end,
	}
	gadget = {}
	return setmetatable(fixture, {__index = Fixture})
end

function Fixture:LoadGadget()
	assert(loadfile("luarules/gadgets/unit_terraform.lua"))()
	self.gadget = gadget
	self.gadget:Initialize()
end

function Fixture:Wall(height, terraformType)
	return {terraformType or 1, self.teamID, 0, height, 2, 1, 0,
		256, 256, 272, 256, self.unitID}
end

function Fixture:Area(height, terraformType)
	return {terraformType or 1, self.teamID, 1, height, 4, 1, 0,
		224, 224, 288, 224, 288, 288, 224, 288, self.unitID}
end

function Fixture:Ramp(height)
	return {4, self.teamID, 0, 100, 2, 1, 0,
		192, height, 256, 320, height, 256, self.unitID}
end

function Fixture:Extend(height)
	local command = {2, self.teamID, 0, 24, 17, 1, 0, 192, 256, 320, 256}
	for _ = 1, 17 do
		command[#command + 1] = height
	end
	command[#command + 1] = self.unitID
	return command
end

function Fixture:Start(command)
	self.command = {id = 39801, tag = self.frame + 1}
	assert(self.gadget:AllowCommand(self.unitID, self.unitDefID, self.teamID,
		39801, command, {}))
	local handled, finished = self.gadget:CommandFallback(self.unitID, self.unitDefID,
		self.teamID, 39801, command, {}, self.command.tag)
	assert(handled)
	return not finished
end

function Fixture:Task()
	local _, task = next(_G.terraformPreviewTasks)
	return task
end

function Fixture:Step(count)
	for _ = 1, count or 1 do
		self.frame = self.frame + 1
		self.gadget:GameFrame(self.frame)
	end
end

function Fixture:Finish()
	local task = self:Task()
	assert(task)
	self:Step(task.remainingFrames)
	assert(not self:Task(), "job did not finish")
end

return Fixture
