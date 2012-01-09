if (Spring.GetModOptions) then
	local modOptions = Spring.GetModOptions()
	local Commanders = {
	  ["corcom"] = true,
	  ["corcom1"] = true,
	  ["corcom3"] = true,
	  ["corcom5"] = true,
	  ["corcom6"] = true,
	  ["corcom7"] = true,
	  ["armcom"] = true,
	  ["armcom1"] = true,
	  ["armcom4"] = true,
	  ["armcom5"] = true,
	  ["armcom6"] = true,
	  ["armcom7"] = true,
	  ["tllcom"] = true,
	  ["tllcom3"] = true,
	  ["tllcom5"] = true,
	  ["tllcom6"] = true,
	  ["tllcom7"] = true,
	}

	for name, ud in pairs(UnitDefs) do  
		if (Commanders[ud.unitname]) then
			ud.energystorage = modOptions.startenergy or 1000
			ud.metalstorage = modOptions.startmetal or 1000
		end
	end
end

local WorkerTimeThresholds = { 
	{wt = 2000,		color={r = 0.7, g = 0.7, 	b = 1.0}},
	{wt = 1000,		color={r = 0.7, g = 1.0, 	b = 0.7}},
	{wt = 250, 		color={r = 0.2, g = 0.6, 	b = 0.2}},
	{wt = 0, 		color={r = 0.5, g = 0.5, 	b = 0.2}}
}

function WorkerTimeThresholds:getColor(wt)
	local nearestHigherT, nearestLowerT

	for _, v in ipairs(self) do
		if (wt >= v.wt) then
			nearestLowerT = v
			break
		end
		nearestHigherT = v
	end
	
	if not nearestLowerT then 
		nearestLowerT = self[#self]
	end
	
	local rel
	if not nearestHigherT then 
		nearestHigherT = nearestLowerT 
		rel = 0
	else
		rel = (wt - nearestLowerT.wt) / (nearestHigherT.wt -  nearestLowerT.wt)
	end
	
	return 
		(nearestLowerT.color.r + rel * (nearestHigherT.color.r - nearestLowerT.color.r)), 
		(nearestLowerT.color.g + rel * (nearestHigherT.color.g - nearestLowerT.color.g)), 
		(nearestLowerT.color.b + rel * (nearestHigherT.color.b - nearestLowerT.color.b))
end

for _, ud in pairs(UnitDefs) do
	if not ud.customparams then
		ud.customparams = {}
	end
end
	 
for name, ud in pairs(UnitDefs) do
	if ((ud.workertime or 0) > 0) then
		ud.nanocolor = {WorkerTimeThresholds:getColor(ud.workertime)}
	end
end

