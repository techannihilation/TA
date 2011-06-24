if (Spring.GetModOptions) then
	local modOptions = Spring.GetModOptions()
    
	for name, ud in pairs(UnitDefs) do  
		if (ud.unitname == "armcom" or ud.unitname == "corcom" or ud.unitname == "tllcom") then
			ud.energystorage = modOptions.startenergy or 1000
			ud.metalstorage = modOptions.startmetal or 1000
		end
	end
end
