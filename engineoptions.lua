--  Custom Options Definition Table format

--  NOTES:
--  - using an enumerated table lets you specify the options order

--
--  These keywords must be lowercase for LuaParser to read them.
--
--  key:      the string used in the script.txt
--  name:     the displayed name
--  desc:     the description (could be used as a tooltip)
--  type:     the option type
--  def:      the default value
--  min:      minimum value for number options
--  max:      maximum value for number options
--  step:     quantization step, aligned to the def value
--  maxlen:   the maximum string length for string options
--  items:    array of item strings for list options
--  scope:    'global', 'player', 'team', 'allyteam'
--

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  Example EngineOptions.lua
--

local options = {
     
  
   {
       key="ta_others",
       name="Tech Annihilation - Other Settings",
       name="Tech Annihilation - Other Settings",
       type="section",
    },
  {
    key    = 'MaxUnits',
    name   = 'Max units',
    desc   = 'Maximum number of units (including buildings) for each team allowed at the same time\nAutoHost Usage :- MaxUnits',
    type   = 'number',
    def    = 1500,
    min    = 1,
    max    = 10000, --- engine caps at lower limit if more than 3 team are ingame
    step   = 1,  -- quantization is aligned to the def value
                    -- (step <= 0) means that there is no quantization
    section= "ta_others",
  },
  {
    key    = "mo_enemycomcount",
    name   = "Enemy Com Counter",
    desc   = "Tells each team the total number of commanders alive in enemy teams",
    type   = "bool",
    def    = true,
    section= "ta_others",
  },
  {
    key    = 'GhostedBuildings',
    name   = 'Ghosted Buildings',
    desc   = "Once an enemy building will be spotted\na ghost trail will be placed to memorize location even after the loss of the line of sight\nAutoHost Usage :- MaxUnits",
    type   = 'bool',
    def    = true,
    section= "ta_others",
  },
  {
    key    = 'FixedAllies',
    name   = 'Fixed ingame alliances',
    desc   = 'Disables the possibility of players to dynamically change alliances ingame\nAutoHost Usage :- FixedAllies',
    type   = 'bool',
    def    = false,
    section= "ta_others",
  },

  {
    key    = 'LimitSpeed',
    name   = 'Speed Restriction',
    desc   = 'Limits maximum and minimum speed that the players will be allowed to change to\nAutoHost Usage :- LimitSpeed',
    type   = 'section',
  },

  {
    key    = 'MaxSpeed',
    name   = 'Maximum game speed',
    desc   = 'Sets the maximum speed that the players will be allowed to change to\nAutoHost Usage :- MaxSpeed',
    type   = 'number',
    section= 'LimitSpeed',
    def    = 3,
    min    = 0.1,
    max    = 100,
    step   = 0.1,  -- quantization is aligned to the def value
                    -- (step <= 0) means that there is no quantization
  },

  {
    key    = 'MinSpeed',
    name   = 'Minimum game speed',
    desc   = 'Sets the minimum speed that the players will be allowed to change to\nAutoHost Usage :- MinSpeed',
    type   = 'number',
    section= 'LimitSpeed',
    def    = 0.3,
    min    = 0.1,
    max    = 100,
    step   = 0.1,  -- quantization is aligned to the def value
                    -- (step <= 0) means that there is no quantization
  },

  {
    key    = 'DisableMapDamage',
    name   = 'Undeformable Map',
    desc   = 'Prevents the map shape from being changed by weapons\nAutoHost Usage :- DisableMapDamage',
    type   = 'bool',
    def    = false,
    section= "ta_others",
  },
--[[
-- the following options can create problems and were never used by interface programs, thus are commented out for the moment

  {
    key    = 'NoHelperAIs',
    name   = 'Disable helper AIs',
    desc   = 'Disables luaui ai usage for all players',
    type   = 'bool',
    def    = false,
  },
--]]
}

return options
