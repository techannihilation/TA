local options = {
  {
    key = "StartingResources",
    name = "Starting Resources",
    desc = "Sets storage and amount of resources that players will start with",
    type = "section",
  },
  {
    key = "ta_exp",
    name = "Tech Annihilation - Experimental Options",
    desc = "Tech Annihilation - Experimental Options",
    type = "section",
  },
  {
    key = "ta_modes",
    name = "Tech Annihilation - Game Modes",
    desc = "Tech Annihilation - Game Modes",
    type = "section",
  },
  {
    key = "ta_options",
    name = "Tech Annihilation - Options",
    desc = "Tech Annihilation - Options",
    type = "section",
  },
  {
    key = "ta_wall_options",
    name = "Tech Annihilation - Wall Options",
    desc = "Tech Annihilation - Wall Options",
    type = "section",
  },
  {
    key = "startenergy",
    name = "Starting energy",
    desc = "Determines amount of energy and energy storage that each player will start with\nAutoHost Usage :- startenergy",
    type = "number",
    section = "StartingResources",
    def = 1000,
    min = 0,
    --max    = 1000000,
    step = 1,
  },
  {
    key = "startmetal",
    name = "Starting metal",
    desc = "Determines amount of metal and metal storage that each player will start with\nAutoHost Usage :- startmetal",
    type = "number",
    section = "StartingResources",
    def = 1000,
    min = 0,
    --max    = 1000000,
    step = 1,
  },
  {
    key = "deathmode",
    name = "Game End Mode",
    desc = "What it takes to eliminate a team\nAutoHost Usage :- deathmode",
    type = "list",
    def = "com",
    section = "ta_modes",
    items = {
      {
        key = "none",
        name = "None",
        desc = "Teams are never eliminated"
      },
      {
        key = "com",
        name = "Kill all enemy Commanders",
        desc = "When a team has no Commanders left, it loses"
      },
        {
        key = "own_com",
        name = "Player resign on Com deat",
        desc = "When player commander dies, you auto-resign."
      },
      {
        key = "killall",
        name = "Kill everything",
        desc = "Every last unit must be eliminated, no exceptions!"
      },
    }
  },
  -- {
  --   key = "mo_coop",
  --   name = "Cooperative Mode",
  --   desc = "Adds an extra commander for comsharing teams\nAutoHost Usage :- mo_coop",
  --   type = "bool",
  --   def = false,
  --   section = "ta_modes",
  -- },
  {
    key = "mo_greenfields",
    name = "No Metal Extraction",
    desc = "No metal extraction on any map\nAutoHost Usage :- mo_greenfields",
    type = "bool",
    def = false,
    section = "ta_modes",
  },
  {
    key = "mo_noowner",
    name = "FFA Mode",
    desc = "Units with no player control are instantly removed/destroyed\nAutoHost Usage :- mo_noowner",
    type = "bool",
    def = false,
    section = "ta_modes",
  },
  {
    key = "mo_preventcombomb",
    name = "Prevent Combombs",
    desc = "Commanders survive DGuns and other commanders explosions\nAutoHost Usage :- mo_preventcombomb",
    type = "list",
    section = "ta_modes",
    def = "off",
    items = {
      {
        key = "hp",
        name = "Health",
        desc = "Commander with greatest hp survives comblast"
      },
      {
        key = "1v1",
        name = "1v1",
        desc = "Default Setting for 1v1 games"
      },
      {
        key = "off",
        name = "Off",
        desc = "Default engine Control"
      },
    }
  },
  {
    key = "shareddynamicalliancevictory",
    name = "Dynamic Ally Victory",
    desc = "Ingame alliance should count for game over condition\nAutoHost Usage :- shareddynamicalliancevictory",
    type = "bool",
    def = false,
    section = "ta_modes",
  },
  {
    key = "mo_noshare",
    name = "Disable ally sharing",
    desc = "Will disable sharing to allies - units and resources\nAutoHost Usage :- mo_noshare",
    type = "bool",
    def = false,
    section = "ta_modes",
  },
  {
    key = "mo_comgate",
    name = "Commander Teleport Effect",
    desc = "Commanders warp in at gamestart with a shiny teleport effect\nAutoHost Usage :- mo_comgate",
    type = "bool",
    def = false,
    section = "ta_options",
  },
  -- {
  --   key = "mo_dynamic",
  --   name = "Dynamic Lighting",
  --   desc = "Toggles Dynamic lighing on or off\nAutoHost Usage :- mo_dynamic",
  --   type = "bool",
  --   def = true,
  --   section = "ta_options",
  -- },
  {
    key = "mo_enemywrecks",
    name = "Show Enemy Wrecks",
    desc = "Gives you LOS of enemy wreckage\nAutoHost Usage :- mo_enemywrecks",
    type = "bool",
    def = true,
    section = "ta_options",
  },
  {
    key = "mo_nanoframedecay",
    name = "Disable nana frame decay",
    desc = "Stop nanoframe decaying over time\nAutoHost Usage :- mo_nanoframedecay",
    type = "bool",
    def = false,
    section = "ta_options",
  },
  {
    key = "mo_no_close_spawns",
    name = "No close spawns",
    desc = "Prevents players startpoints being placed close together (on large enough maps)\nAutoHost Usage :- mo_no_close_spawns",
    type = "bool",
    def = true,
    section = "ta_options",
  },
  {
    key = "mo_nowrecks",
    name = "No Unit Wrecks",
    desc = "Removes all unit wrecks from the game\nAutoHost Usage :- mo_nowrecks",
    type = "bool",
    def = false,
    section = "ta_options",
  },
  {
    key = "mo_preventdraw",
    name = "Commander Ends No Draw",
    desc = "Last Com alive is immune to comblast, D-gunning the last enemy Com with your last Com disqualifies you\nAutoHost Usage :- mo_preventdraw",
    type = "bool",
    def = false,
    section = "ta_options",
  },
  {
    key = "mo_startpoint_assist",
    name = "Startpoint Assist",
    desc = "Chooses sensible starting places for players/AIs who forgot to choose a startpoint for themselves\nAutoHost Usage :- mo_startpoint_assist",
    type = "bool",
    def = false,
    section = "ta_options",
  },
  {
    key = "mo_comtranslock",
    name = "Locktime for Commanders in Transport's",
    desc = "Sets time lock for Transport of own Commanders\nAutoHost Usage :- comtranslock",
    section = "ta_options",
    type = "number",
    def = 0,
    min = 0,
    max = 25,
    step = 1,
  },
  {
    key = "mo_storageowner",
    name = "Team Storage Owner",
    desc = "What owns the starting resource storage\nAutoHost Usage :- mo_storageowner",
    type = "list",
    def = "team",
    section = "ta_options",
    items = {
      {
        key = "com",
        name = "Commander",
        desc = "Starting resource storage belongs to commander, is lost when commander dies"
      },
      {
        key = "team",
        name = "Team",
        desc = "Starting resource storage belongs to the team, cannot be lost"
      },
    }
  },

  {
    key = "exp_flankdefaultmin",
    name = "Min flanking bonus",
    desc = "Multiplier for min flanking bonus",
    section = "ta_exp",
    type = "number",
    def = 0.9,
    min = 0,
    max = 2,
    step = 0.01,
  },
  {
    key = "exp_flankdefaultmax",
    name = "Max flanking bonus",
    desc = "Multiplier for max flanking bonus",
    section = "ta_exp",
    type = "number",
    def = 1.9,
    min = 0,
    max = 20,
    step = 0.01,
  },
  {
    key = "exp_spamlimit",
    name = "Spam Limit",
    desc = "Monitors unit mass production and adjusts build time.",
    type = "bool",
    def = false,
    section = "ta_exp",
  },
  {
    key = "expscaleenabled",
    name = "Experience health/power/reload scaling",
    desc = "",
    type = "number",
    def = 1,
    min = 0,
    max = 1,
    step = 1,
    section = "ta_exp",
  },
}

return options
