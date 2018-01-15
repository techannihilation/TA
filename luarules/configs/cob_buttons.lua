--[[ COB buttons definition description
	armcom5 = {
		{
		name     = "Shield",
		tooltip  = "Toggle shield",  -- equals to name if ommited
		cob      = "Shield",         -- only this is required, function name in units BOS/COB
		endcob   = "Shield",         -- called at the end of duration
		reload   = 0,                -- button is disabled until the reload time has passed, ommit for instant
		duration = 0,                -- how long it calls the function, ommit for instant
		position = 500,              -- ommit for auto-assignment
		type     = CMDTYPE.ICON_MODE,               -- Optional, see LuaCMD CommandTypes on Spring Wiki for details
		params   = {'0', 'Shield Off', 'Shield On'}	-- Optional, see LuaCMD CommandTypes on Spring Wiki for details
		},
	},
]]--



return {
  armcom5 = {
	{
		name = "shield_ac5",
		cob = "Shield",
		tooltip = "Toggle shield activation",
		type = CMDTYPE.ICON_MODE,
		params = {'1', 'Shield Off', 'Shield On'},
	},
  },
  armcom6 = {
	{
		name = "shield_ac6",
		cob = "Shield",
		tooltip = "Toggle shield activation",
		type = CMDTYPE.ICON_MODE,
		params = {'1', 'Shield Off', 'Shield On'},
	},
  },
  armcom7 = {
	{
		name = "shield_ac7",
		cob = "Shield",
		tooltip = "Toggle shield activation",
		type = CMDTYPE.ICON_MODE,
		params = {'1', 'Shield Off', 'Shield On'},
	},
  },
  armgate = {
	{
		name = "shield_ag",
		cob = "Shield",
		tooltip = "Toggle shield activation",
		type = CMDTYPE.ICON_MODE,
		params = {'1', 'Shield Off', 'Shield On'},
	},
  },
  armgate1 = {
	{
		name = "shield_ag1",
		cob = "Shield",
		tooltip = "Toggle shield activation",
		type = CMDTYPE.ICON_MODE,
		params = {'1', 'Shield Off', 'Shield On'},
	},
  },
  armgate2 = {
	{
		name = "shield_ag2",
		cob = "Shield",
		tooltip = "Toggle shield activation",
		type = CMDTYPE.ICON_MODE,
		params = {'1', 'Shield Off', 'Shield On'},
	},
  },
  armpraet = {
	{
		name = "shield_praet",
		cob = "Shield",
		tooltip = "Toggle shield activation",
		type = CMDTYPE.ICON_MODE,
		params = {'1', 'Shield Off', 'Shield On'},
	},
  },
  exoarm = {
	{
		name = "shield_exo",
		cob = "Shield",
		tooltip = "Toggle shield activation",
		type = CMDTYPE.ICON_MODE,
		params = {'1', 'Shield Off', 'Shield On'},
	},
  },
  armsmc = {
	{
		name = "shield_smc",
		cob = "Shield",
		tooltip = "Toggle shield activation",
		type = CMDTYPE.ICON_MODE,
		params = {'1', 'Shield Off', 'Shield On'},
	},
  },
  corcom5 = {
	{
		name = "shield_cc5",
		cob = "Shield",
		tooltip = "Toggle shield activation",
		type = CMDTYPE.ICON_MODE,
		params = {'1', 'Shield Off', 'Shield On'},
	},
  },
  corcom6 = {
	{
		name = "shield_cc6",
		cob = "Shield",
		tooltip = "Toggle shield activation",
		type = CMDTYPE.ICON_MODE,
		params = {'1', 'Shield Off', 'Shield On'},
	},
  },
  corcom7 = {
	{
		name = "shield_cc7",
		cob = "Shield",
		tooltip = "Toggle shield activation",
		type = CMDTYPE.ICON_MODE,
		params = {'1', 'Shield Off', 'Shield On'},
	},
  },
  corgate = {
	{
		name = "shield_cg",
		cob = "Shield",
		tooltip = "Toggle shield activation",
		type = CMDTYPE.ICON_MODE,
		params = {'1', 'Shield Off', 'Shield On'},
	},
  },
  corgate1 = {
	{
		name = "shield_cg1",
		cob = "Shield",
		tooltip = "Toggle shield activation",
		type = CMDTYPE.ICON_MODE,
		params = {'1', 'Shield Off', 'Shield On'},
	},
  },
  corgate2 = {
	{
		name = "shield_cg2",
		cob = "Shield",
		tooltip = "Toggle shield activation",
		type = CMDTYPE.ICON_MODE,
		params = {'1', 'Shield Off', 'Shield On'},
	},
  },
  corshieldgen = {
	{
		name = "shield_gen",
		cob = "Shield",
		tooltip = "Toggle shield activation",
		type = CMDTYPE.ICON_MODE,
		params = {'1', 'Shield Off', 'Shield On'},
	},
  },
  monkeylord = {
	{
		name = "shield_monkey",
		cob = "Shield",
		tooltip = "Toggle shield activation",
		type = CMDTYPE.ICON_MODE,
		params = {'1', 'Shield Off', 'Shield On'},
	},
  },
  tllcom5 = {
	{
		name = "shield_tc5",
		cob = "Shield",
		tooltip = "Toggle shield activation",
		type = CMDTYPE.ICON_MODE,
		params = {'1', 'Shield Off', 'Shield On'},
	},
  },
  tllcom6 = {
	{
		name = "shield_tc6",
		cob = "Shield",
		tooltip = "Toggle shield activation",
		type = CMDTYPE.ICON_MODE,
		params = {'1', 'Shield Off', 'Shield On'},
	},
  },
  tllcom7 = {
	{
		name = "shield_tc7",
		cob = "Shield",
		tooltip = "Toggle shield activation",
		type = CMDTYPE.ICON_MODE,
		params = {'1', 'Shield Off', 'Shield On'},
	},
  },
  tllgate = {
	{
		name = "shield_tg",
		cob = "Shield",
		tooltip = "Toggle shield activation",
		type = CMDTYPE.ICON_MODE,
		params = {'1', 'Shield Off', 'Shield On'},
	},
  },
  tllgate1 = {
	{
		name = "shield_tg1",
		cob = "Shield",
		tooltip = "Toggle shield activation",
		type = CMDTYPE.ICON_MODE,
		params = {'1', 'Shield Off', 'Shield On'},
	},
  },
  tllgate2 = {
	{
		name = "shield_tg2",
		cob = "Shield",
		tooltip = "Toggle shield activation",
		type = CMDTYPE.ICON_MODE,
		params = {'1', 'Shield Off', 'Shield On'},
	},
  },
  irritator = {
	{
		name = "shield_irr",
		cob = "Shield",
		tooltip = "Toggle shield activation",
		type = CMDTYPE.ICON_MODE,
		params = {'1', 'Shield Off', 'Shield On'},
	},
  },
  tlltrid = {
	{
		name = "dive_tri",
		cob = "Dive",
		tooltip = "Dive Underwater",
		type = CMDTYPE.ICON_MODE,
		params = {'1', 'Surface', 'Dive'},
	},
  },
  tllkrak = {
	{
		name = "dive_tri",
		cob = "Dive",
		tooltip = "Dive Underwater",
		type = CMDTYPE.ICON_MODE,
		params = {'1', 'Surface', 'Dive'},
	},
  },
  tlldmc = {
	{
		name = "weapon_toggle",
		cob = "Dive",
		tooltip = "Toggle rapid fire weapon",
		type = CMDTYPE.ICON_MODE,
		params = {'1', 'Rapid', 'Standard'},
	},
  },
}
