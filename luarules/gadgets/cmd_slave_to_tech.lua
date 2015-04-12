local CMD_JUMP = 38521
local CMD_RAMP = 39734
local CMD_LEVEL = 39736
local CMD_RAISE = 39737
local CMD_SMOOTH = 39738
local CMD_RESTORE = 39739
--local CMD_BUMPY = 39740
local CMD_TERRAFORM_INTERNAL = 39801

function gadget:GetInfo()
	return {
		name = "Slave Commands to Tech Level",
		desc = "Slave Commands to Tech levels",
		author = "zwzsg",
		date = "November 2009",
		license = "Public domain",
		layer = 23,
		enabled = true
	}
end

if (gadgetHandler:IsSyncedCode()) then
	function gadget:Initialize()
		GG.TechSlaveCommand(CMD_JUMP,"JumpJet")
		GG.TechSlaveCommand(CMD_RAMP,"Assault Commander")
		GG.TechSlaveCommand(CMD_LEVEL,"Assault Commander")
		GG.TechSlaveCommand(CMD_RAISE,"Assault Commander")
		GG.TechSlaveCommand(CMD_SMOOTH,"Assault Commander")
		GG.TechSlaveCommand(CMD_RESTORE,"Assault Commander")
		GG.TechSlaveCommand(CMD_TERRAFORM_INTERNAL,"Assault Commander")

	end
end
