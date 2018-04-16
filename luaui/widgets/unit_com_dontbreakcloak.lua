function widget:GetInfo()
	return {
		name      = 'DontBreakCloak',
		desc      = 'Sets units to hold fire when cloaked',
		author    = 'Niobium',  
		version   = '1.1',
		date      = 'April 2011',
		license   = 'GNU GPL, v2 or later',
		layer     = 0,
		enabled   = true,  --  loaded by default?
	}
end

----------------------------------------------------------------
-- Var
----------------------------------------------------------------
local isCommander = {
--Core
  [UnitDefNames["corcom"].id] = true,
  [UnitDefNames["corcom1"].id] = true,
  [UnitDefNames["corcom3"].id] = true,
  [UnitDefNames["corcom_fusion"].id] = true,
  [UnitDefNames["corcom5"].id] = true,
  [UnitDefNames["corcom6"].id] = true,
  [UnitDefNames["corcom7"].id] = true,

--Arm 
  [UnitDefNames["armcom"].id] = true,
  [UnitDefNames["armcom1"].id] = true,
  [UnitDefNames["armcom4"].id] = true,
  [UnitDefNames["armcom_fusion"].id] = true,
  [UnitDefNames["armcom5"].id] = true,
  [UnitDefNames["armcom6"].id] = true,
  [UnitDefNames["armcom7"].id] = true,
	
--The lost legacy
  [UnitDefNames["tllcom"].id] = true,
  [UnitDefNames["tllcom1"].id] = true,
  [UnitDefNames["tllcom3"].id] = true,
  [UnitDefNames["tllcom_fusion"].id] = true,
  [UnitDefNames["tllcom5"].id] = true,
  [UnitDefNames["tllcom6"].id] = true,
  [UnitDefNames["tllcom7"].id] = true,
}

----------------------------------------------------------------
-- Speedups
----------------------------------------------------------------
local CMD_CLOAK = 37382
local CMD_FIRE_STATE = CMD.FIRE_STATE
local CMD_INSERT = CMD.INSERT
local CMD_OPT_ALT = CMD.OPT_ALT
local spGetMyTeamID = Spring.GetMyTeamID
local spGiveOrderToUnit = Spring.GiveOrderToUnit

----------------------------------------------------------------
-- Callins
----------------------------------------------------------------
function widget:Initialize()
	if Spring.IsReplay() or Spring.GetGameFrame() > 0 then
	    widget:PlayerChanged()
  	end
end

function widget:PlayerChanged(playerID)
	if Spring.GetSpectatingState() and Spring.GetGameFrame() > 0 then
		widgetHandler:RemoveWidget(self)
	end
end

function widget:GameStart()
	widget:PlayerChanged()
end

function widget:UnitCommand(uID, uDefID, uTeam, cmdID, cmdParams, cmdOpts)
  if cmdID < 0 then return end
	if (cmdID == CMD_CLOAK) and isCommander[uDefID] and (uTeam == spGetMyTeamID()) then
    widget:PlayerChanged()
  	if cmdParams[1] == 1 then
			spGiveOrderToUnit(uID, CMD_FIRE_STATE, {0}, 0)
            spGiveOrderToUnit(uID, CMD_INSERT, {0, 0, 0}, CMD_OPT_ALT)
		else
			spGiveOrderToUnit(uID, CMD_FIRE_STATE, {2}, 0) 
		end
	end
end