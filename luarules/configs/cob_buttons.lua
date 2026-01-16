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
	rumad_king1 = {
		{
			name = "shield_rumad_king_1",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	rumad_king2 = {
		{
			name = "shield_rumad_king_2",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	rumad_king3 = {
		{
			name = "shield_rumad_king_3",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
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
	talon_boxer = {
		{
			name = "shield_talboxer",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	armexo = {
		{
			name = "shield_exo",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	armorco = {
		{
			name = "shield_furie",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	rumad_gala = {
		{
			name = "shield_rumad_gala",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	rumad_mcv2 = {
		{
			name = "shield_rumad_mcv2",
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
	talon_repentance = {
		{
			name = "shield_repentance",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	armshieldgen = {
		{
			name = "shield_armveh",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	armvengence = {
		{
			name = "shield_arm_vengence",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	armbeetle = {
		{
			name = "shield_arm_beetle",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	talon_seth = {
		{
			name = "shield_talon_seth",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	corsingularity = {
		{
			name = "shield_core_singularity",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	talon_shieldgen = {
		{
			name = "shield_talonveh",
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
	tllirritator = {
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
	gok_bats = {
		{
		name = "shield_gokbats",
		cob = "Shield",
		tooltip = "Toggle shield activation",
		type = CMDTYPE.ICON_MODE,
		params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	gok_valefor = {
		{
		name = "shield_gokval",
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
	armolympus = {
		{
			name = "weapon_toggle_olympus",
			cob = "Dive",
			tooltip = "Amunition change",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Gauss', 'Plasma'},
		},
	},
	--[[
	talon_silver = {
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
	gok_archon = {
		{
			name = "shield_gokarchon",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	gok_darkarchonte = {
		{
			name = "shield_gokdarkarchonte",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	gok_ucp = {
		{
			name = "shield_gokucp",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	-- GOK
	gok_gate = {
		{
			name = "shield_gokg",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	gok_fgate = {
		{
			name = "shield_gokfg",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	gok_fgate1 = {
		{
			name = "shield_gokfg1",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	gok_gate1 = {
		{
			name = "shield_gokg1",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	gok_gate2 = {
		{
			name = "shield_gokg2",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	gok_gate3 = {
		{
			name = "shield_gokg3",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	gok_gate4 = {
		{
			name = "shield_gokg4",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	gok_com1 = {
		{
			name = "shield_gokc1",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	gok_com2 = {
		{
			name = "shield_gokc2",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	gok_com3 = {
		{
			name = "shield_gokc3",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	gok_antichrist = {
		{
			name = "shield_gok_antichrist",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	gok_satan = {
		{
			name = "shield_gok_satan",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	gok_slanesh = {
		{
			name = "shield_gok_slanesh",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	gok_azaroth = {
		{
			name = "shield_gok_azaroth",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
	gok_eck = {
		{
			name = "shield_gok_eck",
			cob = "Shield",
			tooltip = "Toggle shield activation",
			type = CMDTYPE.ICON_MODE,
			params = {'1', 'Shield Off', 'Shield On'},
		},
	},
}
