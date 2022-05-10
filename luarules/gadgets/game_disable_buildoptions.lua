function gadget:GetInfo()
	return {
		name = "Disable build options",
		desc = "",
		author = "[MOL]",
		date = "2022",
		license = "GNU GPL, v2 or later",
		layer = 0,
		enabled = true
	}
end

local disableCmds = {
	[-76] = true, --load units clone
	[-9] = true, --gatherwait
	[-8] = true, --squadwait
	[-7] = true, --deathwait
	[-6] = true, --timewait
}

local RemoveUnitCmdDesc = Spring.RemoveUnitCmdDesc
local FindUnitCmdDesc = Spring.FindUnitCmdDesc
local GetUnitCmdDescs = Spring.GetUnitCmdDescs
local disableUnitsByDefParm = {}
local UnitDefIDsCached = {}
local minHeight, maxHeight = Spring.GetGroundExtremes()

if gadgetHandler:IsSyncedCode() then
	local function DisableCmdDesc(unitID, disableTable)
		for cmdID in pairs(disableTable) do
			local cmdDescID = FindUnitCmdDesc(unitID, -cmdID)

			if cmdDescID then
				RemoveUnitCmdDesc(unitID, cmdDescID)
			end
		end
	end

	local function updateUnitsByDefParmTable(unitID)
		local CmdIDTable = GetUnitCmdDescs(unitID)
		disableUnitsByDefParm = {}

		for i, v in pairs(CmdIDTable) do
			local buildUnitID = v["id"] * -1

			if UnitDefIDsCached[buildUnitID] then
				disableUnitsByDefParm[buildUnitID] = true
			end
		end
	end

	function gadget:Initialize()
		for name, parm in pairs(UnitDefs) do
			if parm.minWaterDepth > 0 then
				UnitDefIDsCached[name] = true
			end
		end
	end

	function gadget:UnitCreated(unitID, unitDefID)
		DisableCmdDesc(unitID, disableCmds)
		if minHeight > 0 then
			updateUnitsByDefParmTable(unitID)
			DisableCmdDesc(unitID, disableUnitsByDefParm)
		end
	end
else
end