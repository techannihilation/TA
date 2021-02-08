function gadget:GetInfo()
	return {
		name = "Load/unload",
		desc = "Sets up a constant load/unload radius for air transports and allows unload as soon as distance is reached (104.0.1 - maintenace 686+)",
		author = "Doo",
		date = "2018",
		license = "PD",
		layer = 0,
		enabled = true,
	}
end

local isAirTransport = {}

for udefID, def in ipairs(UnitDefs) do
	if def.canFly and def.isTransport then
		isAirTransport[udefID] = 30
	end
end

if (gadgetHandler:IsSyncedCode()) then
	local math_sqrt = math.sqrt
	local GetUnitPosition = Spring.GetUnitPosition

	local function distance(pos1, pos2)
		local difX = pos1[1] - pos2[1]
		local difZ = pos1[3] - pos2[3]
		local sqDist = difX * difX + difZ * difZ
		local dist = math_sqrt(sqDist)

		return dist
	end

	function gadget:AllowUnitTransportLoad(transporterID, transporterUnitDefID, transporterTeam, transporteeID, transporteeUnitDefID, transporteeTeam, goalX, goalY, goalZ)
		if isAirTransport[transporterUnitDefID] then
			local pos1 = {GetUnitPosition(transporterID)}

			local pos2 = {goalX, goalY, goalZ}

			if distance(pos1, pos2) <= isAirTransport[transporterUnitDefID] then
				return true
			else
				return false
			end
		else
			return true
		end
	end

	function gadget:AllowUnitTransportUnload(transporterID, transporterUnitDefID, transporterTeam, transporteeID, transporteeUnitDefID, transporteeTeam, goalX, goalY, goalZ)
		if isAirTransport[transporterUnitDefID] then
			local pos1 = {GetUnitPosition(transporterID)}

			local pos2 = {goalX, goalY, goalZ}

			if distance(pos1, pos2) <= isAirTransport[transporterUnitDefID] then
				return true
			else
				return false
			end
		else
			return true
		end
	end
end