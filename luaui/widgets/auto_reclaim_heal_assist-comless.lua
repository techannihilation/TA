-----------------------------------
-- Author: Johan Hanssen Seferidis
--
-- Comments: Sets all idle units that are not selected to fight. That has as effect to reclaim if there is low metal
--					 , repair nearby units and assist in building if they have the possibility.
--					 If you select the unit while it is being idle the widget is not going to take effect on the selected unit.
--

-- Modifier: Capob
-- Modification Notes: 
--	Idle units no long include factories (bug)
--	Units on "Hold Pos" are ignored
--	Applies now to units which can reclaim, or repair, or capture.
-------------------------------------------------------------------------------------

function widget:GetInfo()
	return {
		name = "Auto Reclaim/Heal/Assist-Comless",
		desc = "Makes idle unselected builders/rez/com/nanos to reclaim metal if metal bar is not full, repair nearby units and assist in building",
		author = "Pithikos-modified by nixtux",
		date = "Nov 21, 2010",
		license = "GPLv3",
		layer = 0,
		enabled = true --enable automatically
	}
end

--------------------------------------------------------------------------------------
local echo           = Spring.Echo
local getUnitPos     = Spring.GetUnitPosition
local orderUnit      = Spring.GiveOrderToUnit
local getUnitTeam    = Spring.GetUnitTeam
local isUnitSelected = Spring.IsUnitSelected
local getGameSeconds = Spring.GetGameSeconds
local SpGetUnitStates = Spring.GetUnitStates
local pairs = pairs
local CMD_FIGHT = CMD.FIGHT
local floor = math.floor
local gameInSecs     = 0
local lastOrderGivenInSecs= 0
--now also checking for canRepair,canCapture due to non reclaimers in tech annihilation mod which can repair and build
local idleReclaimers={} --reclaimers because they all can reclaim

myTeamID=-1;

--------------------------------------------------------------------------------------


--Initializer
function widget:Initialize()
	if Spring.IsReplay() or Spring.GetGameFrame() > 0 then
	    widget:PlayerChanged()
  	end
  	myTeamID=Spring.GetMyTeamID() --get my team ID
end

function widget:PlayerChanged(playerID)
	if Spring.GetSpectatingState() and Spring.GetGameFrame() > 0 then
		widgetHandler:RemoveWidget(self)
	end
end

function widget:GameStart()
	widget:PlayerChanged()
end

--Give reclaimers the FIGHT command every second
function widget:GameFrame()
	gameInSecs=floor(getGameSeconds())               --gives the time in seconds(rounded)
	--echo("Time in secs: "..gameInSecs.."    Last order given at: "..lastOrderGivenInSecs) --¤debug
	if (gameInSecs>lastOrderGivenInSecs) then
		for unitID in pairs(idleReclaimers) do
			local x, y, z = getUnitPos(unitID)                --get unit's position
			if (not isUnitSelected(unitID)) then              --if unit is not selected
				orderUnit(unitID, CMD_FIGHT, { x, y, z }, {})   --command unit to reclaim
			end
			lastOrderGivenInSecs=gameInSecs                   --record the time that command was given
		end
	end
end


--Add reclaimer to the register
function widget:UnitIdle(unitID, unitDefID, unitTeam)
	if (myTeamID==getUnitTeam(unitID)) then             --check if unit is mine
		--don't apply to factories 
		--don't apply to units with hold position
		if (UnitDefs[unitDefID]["canReclaim"] or UnitDefs[unitDefID]["canRepair"] or UnitDefs[unitDefID]["canCapture"])
			and not (UnitDefs[unitDefID]["isFactory"] or UnitDefs[unitDefID]["canManualFire"])
			and SpGetUnitStates(unitID)["movestate"] ~= 0
		then     --check if unit can reclaim
			  --echo("Unit "..UnitDefs[unitDefID]["humanName"].." considered a reclaimer");
			  idleReclaimers[unitID]=true                 --add unit to register
			  lastRegiInSecs=gameInSecs
			  --echo("Registering unit "..unitID.." as idle")
		end
		
	end
end


--Unregister reclaimer once it is given a command
function widget:UnitCommand(unitID)
	--echo("Unit "..unitID.." got a command") --¤debug
	for reclaimerID in pairs(idleReclaimers) do
		if (reclaimerID==unitID) then 
			idleReclaimers[reclaimerID]=nil
			--echo("Unregistering unit "..reclaimerID.." as idle")
		end
	end
end
