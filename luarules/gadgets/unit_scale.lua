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
	local GetUnitRadius = Spring.GetUnitRadius
	local GetUnitHeight = Spring.GetUnitHeight
	local SetUnitRadiusAndHeight = Spring.SetUnitRadiusAndHeight
	-- local SetUnitSelectionVolumeData = Spring.SetUnitSelectionVolumeData
    -- local GetUnitSelectionVolumeData = Spring.GetUnitSelectionVolumeData -- not works?

	local unitsToScale = {}

	local function addScaledUnit(unitName, scaleDef)
		local unitDef = UnitDefNames[unitName]
		if unitDef then
			unitsToScale[unitDef.id] = scaleDef
		end
	end

	addScaledUnit("core_core_boss", {
			modelScale = 1.5,
			colVolumeScale = 1.5,
			selVolumeScale = 2
	})
	addScaledUnit("gok_darkdeus_boss", {
			modelScale = 1.3,
			colVolumeScale = 1.3,
			selVolumeScale = 1.3,
			radiusHeightScale = 1.3
	})

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

	local function UnitRadiusHeightScale(unitID, scale)
		if not scale or not GetUnitRadius or not GetUnitHeight or not SetUnitRadiusAndHeight then
			return
		end
		local radius = GetUnitRadius(unitID)
		local height = GetUnitHeight(unitID)
		if radius and height then
			SetUnitRadiusAndHeight(unitID, radius * scale, height * scale)
		end
	end

	function gadget:UnitFinished(unitID, unitDefID, unitTeam)
		if unitsToScale[unitDefID] then
			local base = GetUnitRootPiece(unitID)
			local modelScale = unitsToScale[unitDefID].modelScale
			local colVolumeScale = unitsToScale[unitDefID].colVolumeScale
			local selVolumeScale = unitsToScale[unitDefID].selVolumeScale
			local radiusHeightScale = unitsToScale[unitDefID].radiusHeightScale

			if base then
				UnitModelScale(unitID, base, modelScale)
				UnitVolumeScale(unitID, colVolumeScale, selVolumeScale)
				UnitRadiusHeightScale(unitID, radiusHeightScale)
			end
		end
	end
end
