function gadget:GetInfo()
	return {
		name = 'Speed Boost in FPS Mode (Direct Control)',
		desc = '',
		author = 'Silver',
		date = '',
		license = 'GNU GPL, v2 or later',
		layer = 0,
		enabled = true
	}
end

if (gadgetHandler:IsSyncedCode()) then
	local speedFactor = (tonumber(Spring.GetModOptions().mo_directboost) or 0) + 1
	local maximumMetalCost = 1999
	local GetUnitMoveTypeData = Spring.GetUnitMoveTypeData
	local SetGroundMoveTypeData = Spring.MoveCtrl.SetGroundMoveTypeData
	local SetGunshipMoveTypeData = Spring.MoveCtrl.SetGunshipMoveTypeData
	local unitList = {}
	local boostedUnits = {}

	function gadget:UnitCreated(unitID, unitDefID, unitTeam, builderID)
		Spring.Echo(UnitDefs[unitDefID].metalCost)
		if UnitDefs[unitDefID].metalCost <= maximumMetalCost then
			local tr = UnitDefs[unitDefID].turnRate
			local ms = UnitDefs[unitDefID].speed

			unitList[unitID] = {
				orgturnrate = tr,
				orgspeed = ms
			}
		end
	end

	function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
		unitList[unitID] = nil
	end

	function gadget:AllowDirectUnitControl(unitID, unitDefID, unitTeam, playerID)
		if unitList[unitID] then
			boostedUnits[playerID] = unitID
			setSpeed(unitID, speedFactor)
		end

		return true
	end

	function gadget:GameFrame(f)
		if f % 15 ~= 0 then return end

		for _, teamID in pairs(Spring.GetTeamList()) do
			for _, playerID in pairs(Spring.GetPlayerList(teamID)) do
				local _, active, spectator = Spring.GetPlayerInfo(playerID)

				if active and not spectator then
					local unitID = Spring.GetPlayerControlledUnit(playerID)

					if not unitID and boostedUnits[playerID] then
						setSpeed(boostedUnits[playerID], 1)
						boostedUnits[playerID] = nil
					end
				end
			end
		end
	end

	function setSpeed(unitID, speedFactor)
		local MoveTypeData = GetUnitMoveTypeData(unitID)
		if MoveTypeData.name ~= "ground" and MoveTypeData.name ~= "gunship" then return false end

		if MoveTypeData.name == "ground" then
			SetGroundMoveTypeData(unitID, {
				maxSpeed = unitList[unitID].orgspeed * speedFactor
			})
		elseif MoveTypeData.name == "gunship" then
			SetGunshipMoveTypeData(unitID, {
				maxSpeed = unitList[unitID].orgspeed * speedFactor
			})
		end
	end
end