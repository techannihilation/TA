function gadget:GetInfo()
	return {
		name = "UnitScale",
		desc = "",
		author = "Silver",
		date = "15.09.2024",
		license = "GNU GPL, v2 or later",
		layer = 0,
		version = "1.0",
		enabled = true,
	}
end

--SYNCED
if gadgetHandler:IsSyncedCode() then
	local GetUnitPieceMatrix = Spring.GetUnitPieceMatrix
	local SetUnitPieceMatrix = Spring.SetUnitPieceMatrix
	local GetUnitRootPiece = Spring.GetUnitRootPiece
	local GetUnitCollisionVolumeData = Spring.GetUnitCollisionVolumeData
	local SetUnitCollisionVolumeData = Spring.SetUnitCollisionVolumeData
	local SetUnitSelectionVolumeData = Spring.SetUnitSelectionVolumeData

	local unitsToScale = {
		[UnitDefNames["core_core"].id] = {
			modelScale = 1.5,
			colVolumeScale = 2.5,
			selVolumeScale = 2
		},
	}

	local function toTable(...)
		return {...}
	end

	local function UnitModelScale(unitID, base, scale)
		local pieceTable = toTable(GetUnitPieceMatrix(unitID, base))
		pieceTable[1] = scale
		pieceTable[6] = scale
		pieceTable[11] = scale
		SetUnitPieceMatrix(unitID, base, pieceTable)
	end

	local function UnitVolumeScale(unitID, colVolumeScale, selVolumeScale)
		local vd = toTable(GetUnitCollisionVolumeData(unitID))
		SetUnitCollisionVolumeData(unitID, vd[1] * colVolumeScale, vd[2] * colVolumeScale, vd[3] * colVolumeScale, vd[4], vd[5], vd[6], vd[7], vd[8], vd[9])
		SetUnitSelectionVolumeData(unitID, vd[1] * selVolumeScale, vd[2] * selVolumeScale, vd[3] * selVolumeScale, vd[4], vd[5], vd[6], vd[7], vd[8], vd[9])
	end

	function gadget:UnitFinished(unitID, unitDefID, unitTeam)
		if unitsToScale[unitDefID] then
			local base = GetUnitRootPiece(unitID)
			local modelScale = unitsToScale[unitDefID].modelScale
			local colVolumeScale = unitsToScale[unitDefID].colVolumeScale
			local selVolumeScale = unitsToScale[unitDefID].selVolumeScale

			if base then
				UnitModelScale(unitID, base, modelScale)
				UnitVolumeScale(unitID, colVolumeScale, selVolumeScale)
			end
		end
	end
end