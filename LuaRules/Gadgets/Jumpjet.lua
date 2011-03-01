local CMD_JUMP = 38521

function gadget:GetInfo()
	return {
		name = "Slave JJ to JJ",
		desc = "Slave Jump Jet command to Jump Jet tech",
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
	end
end