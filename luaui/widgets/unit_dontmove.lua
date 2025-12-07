--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:GetInfo()
  return {
    name      = "DontMove",
    desc      = "Sets pre-defined units on hold position.",
    author    = "quantum",
    date      = "Jan 8, 2007",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end


--------------------------------------------------------------------------------
----Speedups
--------------------------------------------------------------------------------

local SpGiveOrderToUnit = Spring.GiveOrderToUnit
local SpGetMyTeamID = Spring.GetMyTeamID
local CMD_MOVE_STATE = CMD.MOVE_STATE

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local unitSet = {}

local unitArray = {

--Core
  "corcom",
  "corcom1",
  "corcom2",
  "corcom3",

--Arm
  "armcom",
  "armcom1",
  "armcom2",
  "armcom3",

--The lost legacy
  "tllcom",
  "tllcom1",
  "tllcom2",
  "tllcom3",

--Talon
  "talon_com",
  "talon_com1",
  "talon_com2",
  "talon_com3",

--Gok
  "gok_com",
  "gok_com1",
  "gok_com2",
  "gok_com3",

--Rumad
  "rumad_king",


  --bombers
  "corfiend",
  "armcybr",
  "armlance",
  "armpnix",
  "armsb",
  "armthund",
  "armcyclone",
  "armgripn",
  "corhurc",
  "corsb",
  "corshad",
  "cortitan",
  "tllabomber",
  "tllbomber",
  "tlltorpp",
  "coreclipse",
  "tllseab",
  "corseap",
  "armseap",
  "corsbomb",
  "armorion",
  "tllanhur",
  "tllaether",
  "talon_shade",
  "talon_handgod",
  "talon_eclipse",

  --GOK
  "gok_dirgesinger",
  "gok_hookah",
  "gok_nurgle",

  --RUMAD
  "rumad_bomber_lvl1",
  "rumad_bomber_lvl2",
  "rumad_bomber_lvl3",

  --antinukes
  "armscab",
  "armcarry",
  "armucar",

  "cormabm",
  "corcarry",
  "corucar",

  "tllcarry",
  "tllturtle",
  "tllucar",

  "talon_tribulation",
  "talon_carry",
  "talon_ucar",

  "gok_carry",
  "gok_eveningstar",
  "gok_ucar",

  -- Air Carrier
  "arm_aircarry",
  "arm_aircarry",

}


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:PlayerChanged(playerID)
  if Spring.GetSpectatingState() then
    widgetHandler:RemoveWidget(self)
  end
end

function widget:Initialize()
  if Spring.IsReplay() or Spring.GetGameFrame() > 0 then
    widget:PlayerChanged()
  end
  for i, v in pairs(unitArray) do
    unitSet[v] = true
  end
end

function widget:UnitFromFactory(unitID, unitDefID, unitTeam)
  local ud = UnitDefs[unitDefID]
  if ((ud ~= nil) and (unitTeam == SpGetMyTeamID())) then
    if (unitSet[ud.name]) then
      SpGiveOrderToUnit(unitID, CMD_MOVE_STATE, { 0 }, {})
    end
  end
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
