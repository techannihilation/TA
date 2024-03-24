function gadget:GetInfo()
	return {
		name = 'Stockpile limit control',
		desc = 'Limits stockpile to x ammunition',
		author = 'Bluestone Skymyj',
		date = '01/11/2021',
		license = 'WTFPL',
		version = 'v1.0',
		layer = 0,
		enabled = true
	}
end

if (gadgetHandler:IsSyncedCode()) then

	local defaultPilelimit  = 10

	local pileLimits = {
		atomicbomber = 3,
		minelayer = 2,
		unitlauncher = 50,
		nuke = 4,
		antinuke = 9,
		tacticalnuke = 6,
	}

	local unitCollections = {
		atomicbomber = {'armcybr'},

		minelayer = {'armmin', 'cormin', 'tlltsetse', 'talon_carbon', 'gok_min', 'rumad_min', 'armcybr', 'tllacid'},

		unitlauncher = {'armorbital', 'gok_blackpollen'},

		nuke = {'armsilo', 'armsilo1', 'armfsilo', 'corsilo', 'corsilo1','corfsilo',
				'tllsilo', 'tllsilo1', 'tllfsilo', 'talon_silo', 'talon_silo1', 'talon_elixir',
				'gok_silo', 'gok_silo1', 'gok_silo2',
				'armhcar',
				'corhcar',
				'tllhcar',
				'talon_hcar',
				'gok_hcar',
				'rumad_silo', 'rumad_silo1', 'rumad_silo2',
				'corarbritator', 'cortron', 'coruppercut', 'coraegis',
				'armemp', 'armmarlin',
				'talon_armistice', 'talon_frigate',
				'tllemp', 'tllswordfish',
				'gok_eveningstar'},

		tacticalnuke = {},--TODO

		antinuke  = {
				'armamd', 'armamd1', 'armamd2', 'armcarry',
				'corfmd', 'corfmd1', 'corfmd2', 'corcarry',
				'tllantinuke', 'tllantinuke1', 'tllantinuke2', 'tllcarry',
				'talon_damascus', 'talon_damascus1', 'talon_damascus2', 'talon_carry',
				'rumad_antinuke', 'rumad_antinuke1', 'rumad_antinuke2', 'rumad_mantinuke'}
			}

	local unitDefsByName = {}
	for name, def in pairs(UnitDefNames) do
		unitDefsByName[def.id] = name
	end

	local unitGroupsByDefID = {}
	for group, names in pairs(unitCollections) do
		for _, name in ipairs(names) do
			local defID = UnitDefNames[name].id
			unitGroupsByDefID[defID] = group
		end
	end

	local CMD_STOCKPILE = CMD.STOCKPILE
	local CMD_INSERT = CMD.INSERT
	local SpGiveOrderToUnit = Spring.GiveOrderToUnit

	function gadget:AllowCommand(UnitID, UnitDefID, teamID, cmdID, cmdParams, cmdOptions, cmdTag, synced)
		if UnitID then
			local pilelimit = pileLimits[unitGroupsByDefID[UnitDefID]] or defaultPilelimit

			if cmdID == CMD_STOCKPILE or (cmdID == CMD_INSERT and cmdParams[2] == CMD_STOCKPILE) then
				local pile, pileQ = Spring.GetUnitStockpile(UnitID)
				local addQ = 1

				if cmdOptions.shift then
					addQ = cmdOptions.ctrl and 100 or 5
				elseif cmdOptions.ctrl then
					addQ = 20
				end

				if cmdOptions.right then
					addQ = -addQ
				end

				return handleStockPileCommand(UnitID, addQ, pile, pileQ, pilelimit)
			end
		end

		return true
	end

	function handleStockPileCommand(UnitID, addQ, pile, pileQ, pilelimit)
		if pile + pileQ + addQ > pilelimit then
			if pile + pileQ <= pilelimit then
				local added = 0
				local needed = pilelimit - pile - pileQ

				while added < needed do
					SpGiveOrderToUnit(UnitID, CMD_STOCKPILE, {}, {""})
					added = added + 1
				end
			end

			return false
		end

		return true
	end
end