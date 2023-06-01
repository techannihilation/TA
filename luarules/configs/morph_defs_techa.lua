--[[   Morph Definition File

Morph parameters description
local morphDefs = {				--beginig of morphDefs
	unitname = {				--unit being morphed
		into = 'newunitname',		--unit in that will morphing unit morph into
		time = 10,				--time required to complete morph process
		require = 'requnitname',	--unit requnitname must be present in team for morphing to be enabled
		metal = 10,				--required metal for morphing process     note: if you skip M and/or E costs morph costs the
		energy = 10,			--required energy for morphing process          difference in costs between unitname and newunitname
		xp = 0.07,				--required experience for morphing process (will be deduced from unit xp after morph)
		rank = 1,				--required unit rank for morphing to be enabled
		tech = 2,				--required tech level of a team for morphing to be enabled (1,2,3), if not specified, morph doesn't require tech
	},
}							--end of morphDefs
--]]

local devolution = (-1 > 0)

local morphDefs = {
	armcom = {
		into = 'armcom1',
		time = 45,
	},
	armcom1 = {
		into = 'armcom2',
    time = 90,
	},
	armcom2 = {
		into = 'armcom3',
    time = 135,
	},
	talon_com = {
		into = 'talon_com1',
		time = 45,
	},
	talon_com1 = {
		into = 'talon_com2',
    time = 90,
	},
	talon_com2 = {
		into = 'talon_com3',
    time = 135,
	},
	gok_com = {
		into = 'gok_com1',
		time = 45,
	},
	gok_com1 = {
		into = 'gok_com2',
		time = 90,
	},
	gok_com2 = {
		into = 'gok_com3',
		time = 135,
	},
	corcom = {
		into = 'corcom1',
		time = 45,
	},
	corcom1 = {
		into = 'corcom2',
    time = 90,
	},
	corcom2 = {
		into = 'corcom3',
		time = 135,
	},
	tllcom = {
		into = 'tllcom1',
		time = 45,
	},
	tllcom1 = {
		into = 'tllcom2',
    time = 90,
	},
	tllcom2 = {
		into = 'tllcom3',
		time = 135,
	},
	rumad_com = {
		into = 'rumad_com1',
		time = 60,
	},
	rumad_com1 = {
		into = 'rumad_com2',
		time = 120,
	},
	rumad_com2 = {
		into = 'rumad_com3',
		time = 180,
	},
	rumad_king = {
		into = 'rumad_king1',
		time = 30,
	},
	rumad_king1 = {
		into = 'rumad_king2',
		time = 45,
	},
	rumad_king2 = {
		into = 'rumad_king3',
		time = 60,
	},
	rumad_research_lvl1 = {
		into = 'rumad_research_lvl2',
		time = 70,
	},
	rumad_research_lvl2 = {
		{
			into = 'arm_ulab',
			time = 100,
		},
		{
			into = 'core_hexapod_lab',
			time = 100,
		},
		{
			into = 'talon_ulab',
			time = 100,
		},
		{
			into = 'gok_ulab',
			time = 100,
		},
		{
			into = 'tll_ulab',
			time = 100,
		},
	},
	armamd = {
		into = 'armamd1',
		time = 60,
		tech = 2,
	},
	corfmd = {
		into = 'corfmd1',
		time = 60,
		tech = 2,
	},
	talon_damascus = {
		into = 'talon_damascus1',
		time = 60,
		tech = 2,
	},
	tllantinuke = {
		into = 'tllantinuke1',
		time = 60,
		tech = 2,
	},
	gok_antinuke = {
		into = 'gok_antinuke1',
		time = 60,
		tech = 2,
	},
	armsilo = {
		into = 'armsilo1',
		tech = 2,
		time = 60,
	},
	corsilo = {
		into = 'corsilo1',
		tech = 2,
		time = 60,
	},
	tllsilo = {
		into = 'tllsilo1',
		tech = 2,
		time = 60,
	},
	talon_silo = {
		into = 'talon_silo1',
		tech = 2,
		time = 60,
	},
	gok_silo = {
		into = 'gok_silo1',
		tech = 2,
		time = 60,
	},
	rumad_silo = {
		into = 'rumad_silo1',
		tech = 2,
		time = 60,
	},
	armgeo = {
		{
				into = 'amgeo',
				time = 120,
				tech = 1,
		},
	  {
				into = 'armgmm',
				time = 60,
				tech = 1,
		},
	},
	armgmm = {
		into = 'armfor',
		time = 25,
		tech = 2,
	},
	talon_geo = {
		{
			into = 'talon_mohogeo',
			time = 120,
			tech = 1,
		},
		{
				into = 'talon_pyroclastic',
					time = 90,
					tech = 1,
		},
	},
	talon_mohogeo = {
		into = 'talon_egeo',
		time = 75,
		tech = 2,
	},
	corgeo = {
    {
				into = 'cmgeo',
		  		time = 120,
		  		tech = 1,
		},
		{
				into = 'corbhmth',
		  		time = 90,
		  		tech = 1,
		},
	},
	corbhmth = {
		into = 'corbhmth1',
		time = 120,
		tech = 2,
	},
	gok_geo = {
		into = 'gok_mohogeo',
		time = 120,
		tech = 1,
	},
	gok_mohogeo = {
		into = 'gok_egeo',
		time = 120,
		tech = 2,
	},
	tllgeo = {
		{
			into = 'tllmohogeo',
			time = 120,
			tech = 1,
		},
		{
			into = 'tllgeo_armored',
			time = 90,
			tech = 1,
		},
	},
	tllmohogeo = {
		into = 'tllegeo',
		time = 100,
		tech = 2,
	},
	armgeo_mini = {
    into = 'armgeo',
		time = 30,
	},
	corgeo_mini = {
    into = 'corgeo',
		time = 30,
	},
	tllgeo_mini = {
    into = 'tllgeo',
		time = 30,
	},
	talon_geo_mini = {
    into = 'talon_geo',
		time = 30,
	},
	gok_geo_mini = {
		into = 'gok_geo',
		time = 30,
	},
	rumad_geo_mini = {
		into = 'rumad_geo',
		time = 60,
	},
	rumad_geo = {
		into = 'rumad_mohogeo',
		time = 30,
		tech = 1,
	},
	rumad_mohogeo = {
		into = 'rumad_egeo',
		time = 75,
		tech = 2,
	},
	rumad_gate2 = {
		into = 'rumad_gate',
		time = 30,
		tech = 1,
	},
	rumad_gate = {
		into = 'rumad_gate4',
		time = 60,
		tech = 2,
	},
	armgate2 = {
		into = 'armgate',
		time = 30,
		tech = 1,
	},
	armgate = {
		into = 'armgate4',
		time = 60,
		tech = 2,
	},
	armflosh = {
		into = 'armfgate1',
		time = 60,
		tech = 2,
	},
	armgate4 = {
		into = 'armgate1',
		time = 90,
		tech = 3,
	},
	armgate1 = {
		into = 'armgate3',
		time = 120,
		tech = 4,
	},
	corgate2 = {
		into = 'corgate',
		time = 30,
		tech = 1,
	},
	corgate = {
		into = 'corgate4',
		time = 60,
		tech = 2,
	},
	corflshd = {
		into = 'corfgate1',
		time = 60,
		tech = 2,
	},
	corgate4 = {
		into = 'corgate1',
		time = 90,
		tech = 3,
	},
	corgate1 = {
		into = 'corgate3',
		time = 120,
		tech = 4,
	},
	tllgate2 = {
		into = 'tllgate',
		time = 30,
		tech = 1,
	},
	tllgate = {
		into = 'tllgate4',
		time = 60,
		tech = 2,
	},
	tllfgate = {
		into = 'tllfgate1',
		time = 60,
		tech = 2,
	},
	tllgate4 = {
		into = 'tllgate1',
		time = 90,
		tech = 3,
	},
	tllgate1 = {
		into = 'tllgate3',
		time = 120,
		tech = 4,
	},
	talon_gate2 = {
		into = 'talon_gate',
		time = 30,
		tech = 1,
	},
	talon_gate = {
		into = 'talon_gate4',
		time = 60,
		tech = 2,
	},
	talon_fgate = {
		into = 'talon_fgate1',
		time = 60,
		tech = 2,
	},
	talon_gate4 = {
		into = 'talon_gate1',
		time = 90,
		tech = 3,
	},
	talon_gate1 = {
		into = 'talon_gate3',
		time = 120,
		tech = 4,
	},
	gok_gate2 = {
		into = 'gok_gate',
		time = 30,
		tech = 1,
	},
	gok_gate = {
		into = 'gok_gate4',
		time = 60,
		tech = 2,
	},
	gok_fgate = {
		into = 'gok_fgate1',
		time = 60,
		tech = 2,
	},
	gok_gate4 = {
		into = 'gok_gate1',
		time = 90,
		tech = 3,
	},
	gok_gate1 = {
		into = 'gok_gate3',
		time = 120,
		tech = 4,
	},
	armnanotc = {
		into = 'armnanotc1',
		time = 30,
		tech = 1,
	},
	armnanotc1 = {
		into = 'armnanotc2',
		tech = 2,
		time = 60,
	},
	armnanotc2 = {
		into = 'armnanotc3',
		tech = 3,
		time = 80,
	},
	armnanotc3 = {
		into = 'armnanotc4',
		tech = 4,
		time = 100,
	},
	armfnanotc = {
		into = 'armfnanotc1',
		time = 30,
		tech = 1,
	},
	armfnanotc1 = {
		into = 'armfnanotc2',
		tech = 2,
		time = 60,
	},
	armfnanotc2 = {
		into = 'armfnanotc3',
		tech = 3,
		time = 80,
	},
	cornanotc = {
		into = 'cornanotc1',
		tech = 1,
		time = 30,
	},
	cornanotc1 = {
		into = 'cornanotc2',
		tech = 2,
		time = 60,
	},
	cornanotc2 = {
		into = 'cornanotc3',
		tech = 3,
		time = 80,
	},
	cornanotc3 = {
		into = 'cornanotc4',
		tech = 4,
		time = 100,
	},
	corfnanotc = {
		into = 'corfnanotc1',
		tech = 1,
		time = 30,
	},
	corfnanotc1 = {
		into = 'corfnanotc2',
		tech = 2,
		time = 60,
	},
	corfnanotc2 = {
		into = 'corfnanotc3',
		tech = 3,
		time = 80,
	},
	tllnanotc = {
		into = 'tllnanotc1',
		tech = 1,
		time = 30,
	},
	tllnanotc1 = {
		into = 'tllnanotc2',
		tech = 2,
		time = 60,
	},
	tllnanotc2 = {
		into = 'tllnanotc3',
		tech = 3,
		time = 80,
	},
	tllnanotc3 = {
		into = 'tllnanotc4',
		tech = 4,
		time = 100,
	},
	tllfnanotc = {
		into = 'tllfnanotc1',
		tech = 1,
		time = 30,
	},
	tllfnanotc1 = {
		into = 'tllfnanotc2',
		tech = 2,
		time = 60,
	},
	tllfnanotc2 = {
		into = 'tllfnanotc3',
		tech = 3,
		time = 80,
	},
	talon_nanotc = {
		into = 'talon_nanotc1',
		time = 30,
		tech = 1,
	},
	talon_nanotc1 = {
		into = 'talon_nanotc2',
		tech = 2,
		time = 60,
	},
	talon_nanotc2 = {
		into = 'talon_nanotc3',
		tech = 3,
		time = 80,
	},
	talon_nanotc3 = {
		into = 'talon_nanotc4',
		tech = 4,
		time = 100,
	},
	talon_fnanotc = {
		into = 'talon_fnanotc1',
		time = 30,
		tech = 1,
	},
	talon_fnanotc1 = {
		into = 'talon_fnanotc2',
		tech = 2,
		time = 60,
	},
	talon_fnanotc2 = {
		into = 'talon_fnanotc3',
		tech = 3,
		time = 80,
	},
	gok_nanotc = {
		into = 'gok_nanotc1',
		time = 30,
		tech = 1,
	},
	gok_nanotc1 = {
		into = 'gok_nanotc2',
		tech = 2,
		time = 60,
	},
	gok_nanotc2 = {
		into = 'gok_nanotc3',
		tech = 3,
		time = 80,
	},
	gok_nanotc3 = {
		into = 'gok_nanotc4',
		tech = 4,
		time = 100,
	},
	gok_fnanotc = {
		into = 'gok_fnanotc1',
		time = 30,
		tech = 1,
	},
	gok_fnanotc1 = {
		into = 'gok_fnanotc2',
		tech = 2,
		time = 60,
	},
	gok_fnanotc2 = {
		into = 'gok_fnanotc3',
		tech = 3,
		time = 80,
	},
	rumad_nanotc = {
		into = 'rumad_nanotc1',
		tech = 1,
		time = 30,
	},
	rumad_nanotc1 = {
		into = 'rumad_nanotc2',
		tech = 2,
		time = 60,
	},
	rumad_nanotc2 = {
		into = 'rumad_nanotc3',
		tech = 3,
		time = 80,
	},
	rumad_nanotc3 = {
		into = 'rumad_nanotc4',
		tech = 4,
		time = 100,
	},

	-- Special Units
	corkrog = {
		into = 'corskrog',
		time = 60,
		tech = 3,
		xp = 0.10,
	},
	core_turbulence = {
		into = 'coradamantoise',
		tech = 3,
		time = 60,
		xp = 0.10,
	},
	corraven = {
		into = 'corraven1',
		tech = 3,
		time = 60,
		xp = 0.10,
	},
	corhcrus = {
		into = 'corhflag',
		time = 60,
		tech = 3,
		xp = 0.10,
	},
	armbanth = {
		into = 'armexo',
		time = 60,
		tech = 3,
		xp = 0.10,
	},
	armmcv = {
		into = 'armmcv1',
		time = 60,
		tech = 3,
		xp = 0.10,
	},
	talon_talos = {
		into = 'talon_mythril',
		time = 60,
		tech = 3,
		xp = 0.10,
	},
	talon_abaddon = {
		into = 'talon_repentance',
		time = 60,
		tech = 3,
		xp = 0.10,
	},
	gok_asmodee = {
		into = 'gok_kadesh',
		time = 60,
		tech = 3,
		xp = 0.10,
	},
	tllblind = {
		into = 'tllcolossus',
		time = 60,
		tech = 3,
		xp = 0.10,
	},
	tllmosasaurus = {
		into = 'tllalbertosaurus',
		time = 60,
		tech = 3,
		xp = 0.10,
	},
	rumad_mongol = {
		{
			into = 'rumad_gala',
			time = 45,
			--tech = 3,
			xp = 0.05,
		},
		{
			into = 'rumad_hellion',
			time = 60,
			--tech = 3,
			xp = 0.10,
		},
	},

	-- Titan
	cormkl = {
		into = 'corlilith',
		tech = 4,
		time = 120,
		xp = 0.10,
	},
	arm_broadside = {
		into = 'armarch',
		tech = 4,
		time = 120,
		xp = 0.10,
	},
	gok_octopus = {
		into = 'gok_squid',
		tech = 4,
		time = 120,
		xp = 0.10,
	},
	tllmcv = {
		into = 'tll_tyranosaurus',
		tech = 4,
		time = 120,
		xp = 0.10,
	},
	talon_boxer = {
		into = 'talon_cerberus',
		tech = 4,
		time = 120,
		xp = 0.10,
	},

	--Special units morph
	talon_mcv  = {
		into = 'talon_mcv1',
	  time = 12,
	},
	talon_mcv1  = {
		into = 'talon_mcv',
	  time = 12,
	},
	armnomad = {
		into = 'armvp',
		time = 10,
	},
	armvp = {
		into = 'armnomad',
		time = 10,
	},
	gok_lab = {
		into = 'gok_dome',
		time = 10,
	},
	gok_dome = {
		{
			into = 'gok_lab',
			time = 10,
		},
		{
			into = 'gok_dome1',
			time = 45,
		},
	},
	gok_alab = {
		into = 'gok_dome1',
		time = 10,
	},
	gok_dome1 = {
		into = 'gok_alab',
		time = 10,
	},
	tllnaja = {
		{
			into = 'tlldemon',
			time = 10,
		},
		{
			into = 'tllchameleons',
			time = 10,
		},
	},
	tlldemon = {
		{
			into = 'tllnaja',
			time = 10,
		},
		{
			into = 'tllchameleons',
			time = 10,
		},
	},
	tllchameleons = {
		{
			into = 'tllnaja',
			time = 10,
		},
		{
			into = 'tlldemon',
			time = 10,
		},
	},
}

--
-- Here's an example of why active configuration
-- scripts are better then static TDF files...
--

--
-- devolution, babe  (useful for testing)
--
if (devolution) then
  local devoDefs = {}
  for src,data in pairs(morphDefs) do
    devoDefs[data.into] = { into = src, time = 10, metal = 1, energy = 1 }
  end
  for src,data in pairs(devoDefs) do
    morphDefs[src] = data
  end
end


return morphDefs

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
