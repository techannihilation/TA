function gadget:GetInfo()
	return {
		name = "UnitScale",
		desc = "",
		author = "Silver",
		date = "15.09.2024",
		license = "GNU GPL, v2 or later",
		layer = 0,
		version = "1.1",
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
	-- local SetUnitSelectionVolumeData = Spring.SetUnitSelectionVolumeData
    -- local GetUnitSelectionVolumeData = Spring.GetUnitSelectionVolumeData -- not works?

	local unitsToScale = {
		[UnitDefNames["core_core"].id] = {
			modelScale = 1.5,
			colVolumeScale = 1.5,
			selVolumeScale = 2
		},
	}

	local function UnitModelScale(unitID, base, scale)
		local pieceTable = {GetUnitPieceMatrix(unitID, base)}
		pieceTable[1] = scale
		pieceTable[6] = scale
		pieceTable[11] = scale
		SetUnitPieceMatrix(unitID, base, pieceTable)
	end

	local function UnitVolumeScale(unitID, colVolumeScale, selVolumeScale)
		local vd = {GetUnitCollisionVolumeData(unitID)}
        --local svd = {GetUnitSelectionVolumeData(unitID)}

		SetUnitCollisionVolumeData(unitID, vd[1] * colVolumeScale, vd[2] * colVolumeScale, vd[3] * colVolumeScale, vd[4], vd[5], vd[6], vd[7], vd[8], vd[9])
		--SetUnitSelectionVolumeData(unitID, svd[1] * selVolumeScale, svd[2] * selVolumeScale, svd[3] * selVolumeScale, svd[4], svd[5], svd[6], svd[7], svd[8], svd[9])
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