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
	[CMD.TIMEWAIT] = true,
	[CMD.DEATHWAIT] = true,
	[CMD.SQUADWAIT] = true,
	[CMD.GATHERWAIT] = true,
	[CMD.LOAD_ONTO] = true,
	[CMD.SETBASE] = true,
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
			local cmdDescID = FindUnitCmdDesc(unitID, cmdID)

			if cmdDescID then
				RemoveUnitCmdDesc(unitID, cmdDescID)
			end
		end
	end

	local function updateUnitsByDefParmTable(unitID)
		local CmdIDTable = GetUnitCmdDescs(unitID)
		disableUnitsByDefParm = {}

		for i, v in pairs(CmdIDTable) do
			local buildUnitID = v["id"]

			if UnitDefIDsCached[buildUnitID] then
				disableUnitsByDefParm[buildUnitID] = true
			end
		end
	end

	function gadget:Initialize()
		-- for id, parm in pairs(UnitDefs) do
		-- 	if parm.minWaterDepth > 0 then
		-- 		UnitDefIDsCached[id * -1] = true
		-- 	end
		-- end
	end

	function gadget:UnitCreated(unitID, unitDefID)
		DisableCmdDesc(unitID, disableCmds)

		-- if minHeight > 0 then
		-- 	updateUnitsByDefParmTable(unitID)
		-- 	DisableCmdDesc(unitID, disableUnitsByDefParm)
		-- end
	end
else
end