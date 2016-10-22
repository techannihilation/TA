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
  "corcom5",
  "corcom6",
  "corcom7",

--Arm 
  "armcom",
  "armcom1",
  "armcom4",
  "armcom5",
  "armcom6",
  "armcom7",

--The lost legacy
  "tllcom",
  "tllcom1",
  "tllcom3",
  "tllcom5",
  "tllcom6",
  "tllcom7",

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
  "armcarry",
  
  "cormabm",
  "corcarry",
  
  "tllcarry",
  "tllturtle",
  
  --misc
  
}


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


function widget:Initialize() 
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

