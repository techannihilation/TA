function gadget:GetInfo()
	return {
		name = 'Stockpile limit control',
		desc = 'Limits stockpile to 5 missiles at any time',
		author = 'Bluestone',
		version = 'v1.0',
		date = '23/04/2013',
		license = 'WTFPL',
		layer = 0,
		enabled = true
	}
end

-- SYNCED --
if (gadgetHandler:IsSyncedCode()) then
	local armminDefID = UnitDefNames.armmin.id
	local corminDefID = UnitDefNames.cormin.id
	local tllminDefID = UnitDefNames.tlltsetse.id
	local talonminDefID = UnitDefNames.talon_carbon.id
	local armcybrDefID = UnitDefNames.armcybr.id

	local pilelimit
	local pilelimit1 = 2
	local pilelimit2 = 10
	local CMD_STOCKPILE = CMD.STOCKPILE
	local CMD_INSERT = CMD.INSERT
	local SpGiveOrderToUnit = Spring.GiveOrderToUnit


	function gadget:AllowCommand(UnitID, UnitDefID, teamID, cmdID, cmdParams, cmdOptions, cmdTag, synced) -- Can't use StockPileChanged because that doesn't get called when the stockpile queue changes
		if UnitID and (UnitDefID == armcybrDefID or UnitDefID == corminDefID or UnitDefID == armminDefID or UnitDefID == tllminDefID or UnitDefID == talonminDefID) then
			if (UnitDefID == armpcaDefID or UnitDefID == corpcaDefID or UnitDefID == tllcanDefID) then
				pilelimit = pilelimit2
			else
				pilelimit = pilelimit1
			end

			if cmdID == CMD_STOCKPILE or (cmdID == CMD_INSERT and cmdParams[2] == CMD_STOCKPILE) then
				local pile, pileQ = Spring.GetUnitStockpile(UnitID)
				local addQ = 1

				if cmdOptions.shift then
					if cmdOptions.ctrl then
						addQ = 100
					else
						addQ = 5
					end
				elseif cmdOptions.ctrl then
					addQ = 20
				end

				if cmdOptions.right then
					addQ = -addQ
				end

				if pile + pileQ == pilelimit and (not cmdOptions.right) then
					--SendToUnsynced("PileLimit", teamID, pilelimit) --disable echo, spamming too much becouse of autostock widget :P
				end

				if pile + pileQ + addQ <= pilelimit then
					return true
				else
					if pile + pileQ <= pilelimit then
						local added = 0
						local needed = pilelimit - pile - pileQ

						while added < needed do
							SpGiveOrderToUnit(UnitID, CMD_STOCKPILE, {}, {""}) -- because SetUnitStockpile can't set the queue!
							added = added + 1
						end

						return false
					else
						return false
					end
				end
			end
		end

		return true
	end
	-- UNSYNCED --
else
	local SpGetSpectatingState = Spring.GetSpectatingState
	local SpGetMyTeamID = Spring.GetMyTeamID
	local SpEcho = Spring.Echo

	function gadget:Initialize()
		gadgetHandler:AddSyncAction("PileLimit", PileLimit)
	end

	function PileLimit(_, teamID, pilelimit)
		local myTeamID = SpGetMyTeamID()

		if myTeamID == teamID and not SpGetSpectatingState() then
			SpEcho("\255\255\255\001Stockpile queue is already full (max " .. tostring(pilelimit) .. ").")
		end
	end
end
