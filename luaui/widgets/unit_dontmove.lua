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

  --comms
  
  --Core
  "corcom",
  "corcom1",
  "corcom3",
  "corcom_fusion",
  "corcom5",
  "corcom6",
  "corcom7",

--Arm 
  "armcom",
  "armcom1",
  "armcom4",
  "armcom_fusion",
  "armcom5",
  "armcom6",
  "armcom7",

--The lost legacy
  "tllcom",
  "tllcom1",
  "tllcom3",
  "tllcom_fusion",
  "tllcom5",
  "tllcom6",
  "tllcom7",

--Talon
  "talon_com",
  "talon_com1",
  "talon_com3",
  "talon_com_fusion",
  "talon_com5",
  "talon_com6",
  "talon_com7",

  --aa units
  "armjeth",
  "armaak",
  "corcrash",
  "coraak",
  
  "armsam",
  "armyork",
  "cormist",
  "corsent",
  "ahermes",
  "corjeag",
  
  "armah",
  "corah",
  "armmls",
  "cormls",
  "armaas",
  "corarch",
  
  "tllaak",
  "tllsting",
  "tllhovermissile",
  "tllfirestarter",
  "tllhoplit",
  
  --arty
  "tawf013",
  "armham",
  "corwolv",
  
  "armmart",
  "armmerl",
  "cormart",
  "corvroc",
  "trem",
  "armsnipe",
  "corhrk",
  
  "armmh",
  "cormh",
  "armroy",
  "corroy",
  "tawf009",
  "corssub",
  
  "armmship",
  "cormship",
  "armbats",
  "corbats",
  "armbc",
  "aseadragon",
  "corblackhy",
  
  "armraven",
  "armraven1",
  "armshock",
  "armshock1",
  
  --skirmishers/fire support
  "armjanus",
  "armrock",
  "corstorm",
  
  "tawf114",
  "armmanni",
  "cormort",
  
  --scouts
  "armflea",
  "armfav",
  "corfav",
  "armspy",
  "tllbug",
  "tllgladius",
  
  "armpt",
  "corpt",
  "tllotter",

  --bombers
  "armblz",
  "corfiend",
  "armcybr",
  "armlance",
  "armpnix",
  "armsb",
  "armthund",
  "armcyclone",
  "corgripn",
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
  
  --shields/jammers/radars
  "armjam",
  "armaser",
  "armjaspd",
  "armsjam",
  
  "coreter",
  "concealer",
  "corspec",
  "corsjam",
  "blotter",
  
  "tllsquid",
  "tllobscurer",
  "tllmixer",
  "tllconfuser",
  
   
  "armseer",
  "r75-v",
  "armmark",
  
  "watcher",
  "corvrad",
  "corvoyr",
  
  "tlldivine",
  "tllobserver",
  
  
  --antinukes
  "armscab",
  "armscab1",
  "armcarry",
  
  "cormabm",
  "cormabm1",
  "corcarry",
  
  "tllcarry",
  "tllturtle",
  "tllturtle1",

  "talon_damascus",
  "talon_damascus1",
  "talon_nexus",
  
  --misc
  
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

