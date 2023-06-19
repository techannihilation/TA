function gadget:GetInfo()
	return {
		name = 'Stockpile limit control',
		desc = 'Limits stockpile to x amunition',
		author = 'Bluestone Skymyj',
		version = 'v1.0',
		date = '01/11/2021',
		license = 'WTFPL',
		layer = 0,
		enabled = true
	}
end

-- SYNCED --
if (gadgetHandler:IsSyncedCode()) then

  -- minelayer
	local armminDefID = UnitDefNames.armmin.id
	local corminDefID = UnitDefNames.cormin.id
	local tllminDefID = UnitDefNames.tlltsetse.id
	local talonminDefID = UnitDefNames.talon_carbon.id
	local gokminDefID = UnitDefNames.gok_min.id
	local rumadminDefID = UnitDefNames.rumad_min.id
	local armcybrDefID = UnitDefNames.armcybr.id

  -- Nuke
	local armsiloDefID = UnitDefNames.armsilo.id
	local armsilo1DefID = UnitDefNames.armsilo1.id
	local armsilo2DefID = UnitDefNames.armfsilo.id
	local corsiloDefID = UnitDefNames.corsilo.id
	local corsilo1DefID = UnitDefNames.corsilo1.id
	local corsilo2efID = UnitDefNames.corfsilo.id
	local tllsiloDefID = UnitDefNames.tllsilo.id
	local tllsilo1DefID = UnitDefNames.tllsilo1.id
	local tllsilo2DefID = UnitDefNames.tllfsilo.id
	local talonsiloDefID = UnitDefNames.talon_silo.id
	local talonsilo1DefID = UnitDefNames.talon_silo1.id
	local talonsilo2DefID = UnitDefNames.talon_elixir.id
	local goksiloDefID = UnitDefNames.gok_silo.id
	local goksilo1DefID = UnitDefNames.gok_silo1.id
	local goksilo2DefID = UnitDefNames.gok_silo2.id
	local armmsiloDefID = UnitDefNames.armhcar.id
	local cormsiloDefID = UnitDefNames.corhcar.id
	local tllmsiloDefID = UnitDefNames.tllhcar.id
	local talonmsiloDefID = UnitDefNames.talon_hcar.id
	local gokmsiloDefID = UnitDefNames.gok_hcar.id
	local rumadsiloDefID = UnitDefNames.rumad_silo.id
	local rumadsilo1DefID = UnitDefNames.rumad_silo1.id

  -- Launcher
	local gok_blackpollenDefID = UnitDefNames.gok_blackpollen.id
	local armorbitalDefID = UnitDefNames.armorbital.id

	--Tactical
	local corarbritatorDefID = UnitDefNames.corarbritator.id
	local coraegisDefID = UnitDefNames.coraegis.id
	local cortronDefID = UnitDefNames.cortron.id
	local coruppercutDefID = UnitDefNames.coruppercut.id
	local armempDefID = UnitDefNames.armemp.id
	local armmarlinDefID = UnitDefNames.armmarlin.id
	local talonempDefID = UnitDefNames.talon_armistice.id
	local talon_frigateDefID = UnitDefNames.talon_frigate.id
	local tllempDefID = UnitDefNames.tllemp.id
	local tllswordfishDefID = UnitDefNames.tllswordfish.id
	local gok_eveningstarDefID = UnitDefNames.gok_eveningstar.id
	local tllacidDefID = UnitDefNames.tllacid.id

	--Variable
	local pilelimit
	local minelayer = 2
	local nuke = 3
	local antinuke = 8
	local unitlauncher = 50

	local CMD_STOCKPILE = CMD.STOCKPILE
	local CMD_INSERT = CMD.INSERT
	local SpGiveOrderToUnit = Spring.GiveOrderToUnit

	function gadget:AllowCommand(UnitID, UnitDefID, teamID, cmdID, cmdParams, cmdOptions, cmdTag, synced) -- Can't use StockPileChanged because that doesn't get called when the stockpile queue changes
		if UnitID then
			pilelimit = 8 --Default

			if (UnitDefID == gokminDefID or UnitDefID == corminDefID or UnitDefID == armminDefID or UnitDefID == rumadminDefID or UnitDefID == tllminDefID or UnitDefID == talonminDefID or UnitDefID == tllacidDefID) then
				pilelimit = minelayer
			end

			if (UnitDefID == armorbitalDefID or UnitDefID == gok_blackpollenDefID) then
				pilelimit = unitlauncher
			end

			if (UnitDefID == corarbritatorDefID or UnitDefID == cortronDefID or UnitDefID == coruppercutDefID or UnitDefID == coraegisDefID
			or UnitDefID == armempDefID or UnitDefID == armmarlinDefID
			or UnitDefID == talonempDefID or UnitDefID == talon_frigateDefID
			or UnitDefID == tllempDefID or UnitDefID == tllswordfishDefID
			or UnitDefID == gok_eveningstarDefID) then
				pilelimit = nuke
			end

			if (UnitDefID == armsiloDefID or UnitDefID == armsilo1DefID or UnitDefID == armsilo2DefID
			or UnitDefID == corsiloDefID or UnitDefID == corsilo1DefID or UnitDefID == corsilo2DefID
			or UnitDefID == tllsiloDefID or UnitDefID == tllsilo1DefID or UnitDefID == tllsilo2DefID
			or UnitDefID == talonsiloDefID or UnitDefID == talonsilo1DefID or UnitDefID == talonsilo2DefID
			or UnitDefID == goksiloDefID or UnitDefID == goksilo1DefID or UnitDefID == goksilo2DefID
			or UnitDefID == rumadsiloDefID or UnitDefID == rumadsilo1DefID
			or UnitDefID == armcybrDefID) then
				pilelimit = nuke
			end

			if (UnitDefID == armmsiloDefID or UnitDefID == cormsiloDefID or UnitDefID == tllmsiloDefID or UnitDefID == talonmsiloDefID or UnitDef == gokmsiloDefID) then
				pilelimit = nuke
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
