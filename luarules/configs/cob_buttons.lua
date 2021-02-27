--[[ COB buttons definition description
	armcom5 = {
		{
		name = "Shield",
		tooltip= "Toggle shield",-- equals to name if ommited
		cob= "Shield", -- only this is required, function name in units BOS/COB
		endcob = "Shield", -- called at the end of duration
		reload = 0,-- button is disabled until the reload time has passed, ommit for instant
		duration = 0,-- how long it calls the function, ommit for instant
		position = 500,-- ommit for auto-assignment
		type = CMDTYPE.ICON_MODE, -- Optional, see LuaCMD CommandTypes on Spring Wiki for details
		params = {'0', 'Shield Off', 'Shield On'}	-- Optional, see LuaCMD CommandTypes on Spring Wiki for details
		},
	},
]]--

return {
	armcom1 = {
		{
			name = "shield_ac1",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	armcom2 = {
		{
			name = "shield_ac2",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	armcom3 = {
		{
			name = "shield_ac3",
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
	armgate3 = {
		{
			name = "shield_ag3",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	armgate4 = {
		{
			name = "shield_ag4",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	armflosh = {
		{
			name = "shield_afg",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	armfgate1 = {
		{
			name = "shield_afg1",
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
	talon_mythril = {
		{
			name = "shield_mythril",
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
	armshieldgen = {
		{
			name = "shield_smc",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	corcom1 = {
		{
			name = "shield_cc1",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	corcom2 = {
		{
			name = "shield_cc2",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	corcom3 = {
		{
			name = "shield_cc3",
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
	corgate3 = {
		{
			name = "shield_cg3",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	corgate4 = {
		{
			name = "shield_cg4",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	corflshd = {
		{
			name = "shield_cfg",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	corfgate1 = {
		{
			name = "shield_cfg1",
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
	cormonkeylord = {
		{
			name = "shield_monkey",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	corcrab = {
		{
			name = "shield_corcrab",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	tllcom1 = {
		{
			name = "shield_tc1",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	tllcom2 = {
		{
			name = "shield_tc2",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	tllcom3 = {
		{
			name = "shield_tc3",
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
	tllgate3 = {
		{
			name = "shield_tg3",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	tllgate4 = {
		{
			name = "shield_tg4",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	tllfgate = {
		{
			name = "shield_tfg",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	tllfgate1 = {
		{
			name = "shield_tfg1",
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
	tllgorgon = {
		{
			name = "shield_gorgon",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	tllmako = {
		{
		name = "shield_mako",
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
	cormcv = {
		{
			name = "weapon_cormcv",
			cob = "Dive",
			tooltip = "High / low",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Low Trajectory', 'High Trajectory'},
		},
	},
	--[[
	talon_mcv = {
		{
			name = "weapon_toggle_talon",
			cob = "Dive",
			tooltip = "Toggle rapid fire weapon",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Deployed', 'Standard'},
		},
	},
	--]]
	talon_com1 = {
		{
			name = "shield_talc1",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	talon_com2 = {
		{
			name = "shield_talc2",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	talon_com3 = {
		{
			name = "shield_talc3",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	talon_gate = {
		{
			name = "shield_talg",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	talon_fgate = {
		{
			name = "shield_talfg",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	talon_fgate1 = {
		{
			name = "shield_talfg1",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	talon_gate1 = {
		{
			name = "shield_talg1",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	talon_gate2 = {
		{
			name = "shield_talg2",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	talon_gate3 = {
		{
			name = "shield_talg3",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	talon_gate4 = {
		{
			name = "shield_talg4",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	talon_obelisk = {
		{
			name = "shield_talob",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	talon_pyramid = {
		{
			name = "shield_talpyramid",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	talon_archon = {
		{
			name = "shield_talarchon",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	talon_cpod = {
		{
			name = "shield_talcpod",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
}
