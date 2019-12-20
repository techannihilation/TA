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
		{
			into = 'armcom4',
			time = 30,
		
			metal = 0,
			energy = 0,
			--Free For Xmas
		
		},
		{
			into = 'armcom1',
			time = 45,
		
			metal = 0,
			energy = 0,
			--Free For Xmas
		},
	},
	armcom1 = {
		into = 'armcom_fusion',
        	time = 90,
	},
	armcom_fusion = {
		into = 'armcom6',
        	time = 180,
	},
	armcom4 = {
		into = 'armcom5',
        	time = 60,
	},
	armcom5 = {
		into = 'armcom6',
		time = 180,
	},
	armcom6 = {
		into = 'armcom7',
		time = 360,
	},
	talon_com = {
		{
			into = 'talon_com3',
			time = 30,
		
			metal = 0,
			energy = 0,
			--Free For Xmas
		
		},
		{
			into = 'talon_com1',
			time = 45,
		
			metal = 0,
			energy = 0,
			--Free For Xmas
		},
	},
	talon_com1 = {
		into = 'talon_com_fusion',
        	time = 90,
	},
	talon_com_fusion = {
		into = 'talon_com6',
        	time = 180,
	},
	talon_com3 = {
		into = 'talon_com5',
        	time = 60,
	},
	talon_com5 = {
		into = 'talon_com6',
		time = 180,
	},
	talon_com6 = {
		into = 'talon_com7',
		time = 360,
	},
	corcom = {
		{
			into = 'corcom3',
			time = 30,
		
			metal = 0,
			energy = 0,
			--Free For Xmas

		},
		{	
			into = 'corcom1',
			time = 45,
		
			metal = 0,
			energy = 0,
			--Free For Xmas
			
		},
	},
	corcom1 = {
		into = 'corcom_fusion',
        	time = 90,
	},
	corcom_fusion = {
		into = 'corcom6',
        	time = 180,
	},
	corcom3 = {
		into = 'corcom5',
		time = 60,
	},
	corcom5 = {
		into = 'corcom6',
		time = 180,
	},
	corcom6 = {
		into = 'corcom7',
		time = 360,
	},
	tllcom = {
		{
			into = 'tllcom3',
			time = 30,
		
			metal = 0,
			energy = 0,
			--Free For Xmas
		
		},
		{
			into = 'tllcom1',
			time = 45,
		
			metal = 0,
			energy = 0,
			--Free For Xmas
		},
	},
	tllcom1 = {
		into = 'tllcom_fusion',
        	time = 90,
	},
	tllcom_fusion = {
		into = 'tllcom6',
        	time = 180,
	},	
	tllcom3 = {
		into = 'tllcom5',
		time = 60,
	},
	tllcom5 = {
		into = 'tllcom6',
		time = 180,
	},
	tllcom6 = {
		into = 'tllcom7',
		time = 360,
	},
	corrl = {
		into = 'corrl1',
		time = 10,
		xp = 0.01,
	},
	armrl = {
		into = 'armrl1',
		time = 10,
		xp = 0.01,
	},
	tlllmt = {
		into = 'tlllmt1',
		time = 10,
		xp = 0.01,
	},
	armllt = {
		into = 'armllt1',
		time = 15,
		xp = 0.25,
	},
	corllt = {
		into = 'corllt1',
		time = 15,
		xp = 0.25,
	},
	tllllt = {
		into = 'tlllft',
		time = 15,
		xp = 0.25,
	},
	talon_llt = {
		into = 'talon_llt',
		time = 15,
		xp = 0.25,
	},
	armhlt = {
		into = 'armvhlt',
		time = 30,
		xp = 0.25,
	},	
	talon_hlt = {
		into = 'talon_vhlt',
		time = 30,
		xp = 0.25,
	},	
	corhlt= {
		into = 'corvhlt',
		time = 30,
		xp = 0.25,
	},
	tllhlt = {
		into = 'tllvhlt',
		time = 30,
		xp = 0.30,
	},
	tllweb = {
		into = 'tllupgweb',
		time = 30,
		xp = 0.50,
	},
	armguard= {
		into = 'armamb',
		time = 30,
		xp = 0.25,
	},
	talon_painless = {
		into = 'talon_slinger',
		time = 30,
		xp = 0.25,
	},
	corpun= {
		into = 'cortoast',
		time = 30,
		xp = 0.25,
	},
	tlllbt = {
		into = 'tllplasma',
		time = 30,
		xp = 0.25,
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
	armscab = {
		into = 'armscab1',
		time = 60,
		tech = 2,
	},
	cormabm = {
		into = 'cormabm1',
		time = 60,
		tech = 2,
	},
	tllturtle = {
		into = 'tllturtle1',
		time = 60,
		tech = 2,
	},
	talon_tribulation = {
		into = 'talon_tribulation1',
		time = 60,
		tech = 2,
	},
	tllantinuke = {
		into = 'tllantinuke1',
		time = 60,
		tech = 2,
	},
	armanni = {
		into = 'armanni1',
		time = 90,
		xp = 1,
	},
	cordoom = {
		into = 'cordoom1',
		time = 90,
		xp = 1,
	},
	tllobliterator = {
		into = 'tllobliterator1',
		time = 90,
		xp = 1,
	},
	talon_blt = {
		into = 'talon_blt1',
		time = 90,
		xp = 1,
	},
	corflak = {
		into = 'corpre',
		time = 90,
		xp = 1,
	},
	armflak = {
		into = 'armhys',
		time = 90,
		xp = 1,
	},
	tllflak = {
		into = 'tlldb',
		time = 90,
		xp = 1,
	},
	talon_popcorn = {
		into = 'talon_popcorn1',
		time = 90,
		xp = 1,
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
	armcir = {
		into = 'armcir1',
		time = 20,
		xp = 0.05,
	},
	corerad = {
		into = 'corerad1',
		time = 20,
		xp = 0.05,
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
		time = 90,
		tech = 2,
	},
	talon_geo = {
		into = 'talon_mohogeo',
		time = 120,
		tech = 1,
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
		time = 90,
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
	armgate4 = {
		into = 'armgate1',
		time = 90,
		tech = 3,
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
	corgate4 = {
		into = 'corgate1',
		time = 90,
		tech = 3,
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
	tllgate4 = {
		into = 'tllgate1',
		time = 90,
		tech = 3,
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
	talon_gate4 = {
		into = 'talon_gate1',
		time = 90,
		tech = 3,
	},
	--[[
	correch1 = {
		into = 'correch2',
		time = 50,
	},
	correch2 = {
		into = 'correch3',
		time = 75,
	},
	correch3 = {
		into = 'correch4',
		time = 100,
	},
	armrech1 = {
		into = 'armrech2',
		time = 50,
	},
	armrech2 = {
		into = 'armrech3',
		time = 75,
	},
	armrech3 = {
		into = 'armrech4',
		time = 100,
	},
	--]]
	armvulc = {
		into = 'armvulc2',
		time = 45,
		xp = 0.15,
	},
	corbuzz = {
		into = 'corbuzz2',
		time = 45,
		xp = 0.15,
	},
	tllhydre = {
		into = 'tllhydre2',
		time = 45,
		xp = 0.15,
	},
	talon_veloute = {
		into = 'talon_veloute2',
		time = 45,
		xp = 0.15,
	},
	armbrtha2 = {
		into = 'armbrtha',
		time = 30,
		xp = 0.25,	
	},
	armbrtha = {
		into = 'armbrtha1',
		time = 45,
		xp = 0.25,
	},
	corint2 = {
		into = 'corint',
		time = 30,
		xp = 0.25,	
	},
	corint= {
		into = 'corint1',
		time = 45,
		xp = 0.25,
	},
	tlllrpt2 = {
		into = 'tlllrpt',
		time = 30,
		xp = 0.25,	
	},
	tlllrpt = {
		into = 'tlllrpt1',
		time = 45,
		xp = 0.25,
	},
	tllprivate = {
		into = 'tllprivate1',
	  	time = 5,
		xp = 0.01,
	},
	armpw = {
		into = 'armpw1',
		time = 5,
		xp = 0.01,
	},
	armpw1 = {
		{
		into = 'armfast',
		time = 5,
		xp = 0.25,
	},
	{
		into = 'armhdpw',
		time = 60,
		xp = 1.00,
	},
	},
	armfast = {
     		into = 'armjugg',
		time = 120,
		xp = 1.00,
	},
	armhdpw = {
		into = 'arm_furie',
		time = 180,
		xp = 1.00,
	},
	arm_furie = {
		into = 'arm_furie1',
		time = 180,
		xp = 1.00,
	},
	armrock = {
		into = 'armcrack',
		time = 10,
		xp = 0.05,
	},
	armham = {
		into = 'armham1',
		time = 10,
		xp = 0.05,
	},
	armham1 = {
		into = 'armfido',
		time = 30,
		xp = 0.15,
	},
	armfido = {
		into = 'armshock',
		time = 60,
		xp = 0.30,
	},
	corak = {
		into = 'corak1',
		time = 5,
		xp = 0.01,
	},
	corak1 = {
		into = 'corpyro',
		time = 5,
		xp = 0.25,
	},
	corpyro = {
		into = 'corpyrox',
		time = 45,
		xp = 0.50,
	},
	corpyrox = {
		into = 'corpyrox1',
		time = 15,
		xp = 0.05,
	},
	corpyrox1 = {
		into = 'cordem',
		time = 45,
		xp = 0.10,
	},
	corstorm = {
		into = 'corrock',
		time = 10,
		xp = 0.05,
	},
	corthud = {
		into = 'corthud1',
		time = 10,
		xp = 0.05,
	},
	corthud1 = {
		into = 'cormort',
		time = 30,
		xp = 0.25,
	},
	armflash = {
		into = 'armflash1',
		time = 10,
		xp = 0.05,
	},	
	armlatnk = {
		into = 'armchimera',
		time = 45,
		xp = 0.50,
	},
	armstump = {
		into = 'armstump1',
		time = 15,
		xp = 0.10,
	},
	armstump1 = {
		into = 'armbull',
		time = 30,
		xp = 0.30,
	},	
	armbull = {
		into = 'armbull2',
		time = 30,
		xp = 0.15,
	},
	armbull2 = {
		into = 'armmcv',
		time = 90,
		xp = 0.30,
	},
	tawf013 = {
		into = 'tawf0131',
		time = 10,
		xp = 0.05,
	},
	tawf0131 = {
		into = 'armmart',
		time = 30,
		xp = 0.15,
	},
    	armmart = {
		into = 'avtr',
		time = 90,
		xp = 0.50,
	},
	armjanus = {
		into = 'armjanus1',
		time = 15,
		xp = 0.10,
	},
	armjanus1 = {
		into = 'tankanotor',
		time = 120,
		xp = 1.00,
	},
	tankanotor = {	
		into = 'armmlrs',
		time = 90,
		xp = 0.50,
	},
	armsam = {
		into = 'armsam1',
		time = 10,
		xp = 0.05,
	},
	armsam1 = {	
		into = 'armhorg',
		time = 45,
		xp = 0.25,
	},
	tllannouncer = {	
		into = 'tllannouncer1',
		time = 10,
		xp = 0.05,
	},
	corgator = {
		into = 'corgator1',
		time = 10,
		xp = 0.05,
	},
	corgator1 = {
		into = 'nsacskv',
		time = 20,
		xp = 0.15,
	},
	corlevlr = {
		into = 'corlevlr1',
		time = 15,
		xp = 0.10,
	},
	corlevlr1 = {
		into = 'corgol',
		time = 45,
		xp = 0.50,
	},
	corgol = {
		into = 'corgol1',
		time = 30,
		xp = 0.15,
	},
	corgol1 = {
		into = 'corbt',
		time = 90,
		xp = 0.50,
	},
	corraid = {
		into = 'corraid1',
		time = 15,
		xp = 0.10,
	},
	corraid1 = {
		into = 'correap',
		time = 30,
		xp = 0.30,
	},
	correap = {
		into = 'champ',
		time = 60,
		xp = 0.50,
	},
	corwolv = {
		into = 'corwolv1',
		time = 10,
		xp = 0.05,
	},
	corwolv1 = {
		{
			into = 'cormart',
			time = 20,
			xp = 0.15,
		},
		{
			into = 'trem',
			time = 45,
			xp = 0.30,
		},
	},
	cormart = {
		{
			into = 'cortotal',
			time = 45,
			xp = 0.30,
		},
		{
			into = 'clb',
			time = 90,
			xp = 0.50,
		},
	},
	trem = {
     		into = 'armsiege',
		time = 90,
		xp = 0.45,
	},
	cormist = {
		into = 'cormist1',
		time = 10,
		xp = 0.05,
	},
	cormist1 = {
		into = 'tawf114',
		time = 60,
		xp = 0.30,
	},
	armjeth = {
		into = 'armaak',
		time = 30,
		xp = 1.00,
	},
	armaak = {
		into = 'armeak',
		time = 60,
		xp = 1.25,
	},
	corcrash = {
		into = 'coraak',
		time = 30,
		xp = 1.00,
	},
	coraak = {
		into = 'coreak',
		time = 60,
		xp = 1.25,
	},
	armwar = {
		into = 'armmav',
		time = 30,
		xp = 0.25,
	},
	armmav = {
     		into = 'armraz',
		time = 60,
		xp = 1.00,
	},
	armraz  = {
 		into = 'armraz1',
        	time = 90,
        	xp = 0.50,
         },
	aexxec = {
     		into = 'akmech',
		time = 60,
		xp = 0.25,
	},
	akmech = {
		into = 'armorco',
		time = 90,
		xp = 0.50,
	},
	armmerl = {
		into = 'armmlrs',
		time = 90,
		xp = 1.00,
	},
	corhrk = {
		into = 'corhowie',
		time = 90,
		xp = 1.25,
	},
	corsumo = {
		into = 'corsumo1',
		time = 30,
		xp = 0.10,
	},
	corsumo1 = {
		into = 'helepolis',
		time = 30,
		xp = 0.10,
	},
	helepolis = {
		into = 'gorg',
		time = 90,
		xp = 0.10,
	},
	armzeus = {
		into = 'armzeus1',
		time = 20,
		xp = 0.10,
	},
	armzeus1 = {
		into = 'armcav',
		time = 20,
		xp = 0.10,
	},
	corcan = {
     		into = 'corcan1',
		time = 20,
		xp = 0.05,
	},
	armfboy = {
		into = 'armfboy1',
		time = 30,
		xp = 0.15,
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
		time = 90,
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
		time = 90,
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
		time = 90,
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
		time = 90,
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
		time = 90,
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
		time = 90,
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
		time = 90,
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
		time = 90,
	},
	armamph = {
		into = 'marauder',
		time = 60,
		xp = 0.30,
	},
	armanac = {
		into = 'armhplasma',
		time = 30,
		xp = 0.5,
	},
	corsnap = {
		into = 'nsacbehe',
		time = 60,
		xp = 0.75,
	},
	ahermes = {
		into = 'armyork',
		time = 30,
		xp = 0.20,
	},
	corjeag = {
     		into = 'corsent',
		time = 30,
		xp = 0.20,
	},
	gladiator = {
		into = 'krogtaar',
		time = 90,
		xp = 0.75,
	},
	krogtaar = {
		{
		into = 'armgor',
		time = 60,
		xp = 0.25,
	},
	{
		into = 'corkrog',
		time = 90,
		xp = 0.50,
	},
	},
	armgor = {
		into = 'corkrog',
		time = 60,
		xp = 0.25,
	},
	corkrog = {
		into = 'corkrog1',
		time = 120,
		xp = 0.25,
	},
	armbanth = {
		into = 'armbanth1',
		time = 120,
		xp = 0.25,
	},
	corkarg = {
 		into = 'corkarg1',
		time = 120,
		xp = 0.50,
         },
	arm_furie = {
		into = 'arm_furie1',
		time = 120,
		xp = 0.25,
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
	corprot = {
     		into = 'troman',
		time = 60,
		xp = 0.30,
	},
	coramph = {
     		into = 'shiva',
		time = 60,
		xp = 0.25,
	},
	tllsalamander = {
    	 	into = 'tllcenturion',
		time = 30,
		xp = 0.30,
	},
	armpincer = {
    	 	into = 'armcroc',
		time = 30,
		xp = 0.30,
	},
	armcroc = {
   	  	into = 'armscpion',
		time = 30,
		xp = 0.30,
	},
	armst = {
  	   	into = 'armscpion',
		time = 30,
		xp = 0.15,
	},
	tllshaker = {
   	  	into = 'tllloki',
		time = 30,
		xp = 0.35,
	},
	tllloki = {
 	    	into = 'tllmlrpc',
		time = 90,
		xp = 0.60,
	},
	tllariman = {
  	   	into = 'tllcoyote',
		time = 30,
		xp = 0.40,
	},
	tllconvincer = {
  	   	into = 'tllacid',
		time = 120,
		xp = 0.60,
	},
	tllroaster = {
		into = 'tllroaster1',
		time = 30,
		xp = 0.20,
	},
	armmanni = {
		into = 'armmanni1',
		time = 30,
		xp = 0.20,
	},
	tllpbot = {
		into = 'tllpbot1',
	 	time = 10,
		xp = 0.05,
	},
	tllpbot1 = {
    		into = 'tllartybot',
		time = 30,
		xp = 0.50,
	},
	tllartybot = {
     		into = 'heavyimpact',
		time = 45,
		xp = 0.50,
	},
	tllbind = {
     		into = 'tllblind',
		time = 60,
		xp = 0.15,
	},
	tllfireraiser = {
     		into = 'tllfireraiser1',
		time = 10,
		xp = 0.05,
	},
	tllfireraiser1 = {
     		into = 'tllamphibot',
		time = 30,
		xp = 0.50,
	},
	tllfirestarter = {
	    into = 'tllaak',
		time = 30,
		xp = 0.20,	
	},
	tllhoplit = {
	    into = 'tllpuncher',
		time = 30,
		xp = 0.20,	
	},
	armjamt = {
		into = 'armveil',
	  	time = 30,
	  	tech = 1,
	},
	corjamt = {
		into = 'corshroud',
	  	time = 30,
	  	tech = 1,
	},
	tlljam = {
		into = 'tllajam',
	  	time = 30,
	  	tech = 1,
	},
	talon_conspiracy  = {
		into = 'talon_conspiracy1',
	  	time = 30,
	  	tech = 1,
	},
	armrad = {
		into = 'armarad',
	  	time = 30,
	  	tech = 1,
	},	
	corrad = {
		into = 'corarad',
	  	time = 30,
	  	tech = 1,
	},
	tllradar = {
		into = 'tllarad',
	  	time = 30,
	  	tech = 1,
	},
	talon_rad = {
		into = 'talon_arad',
		time = 30,
		tech = 1,
	},
	armjamt = {
		into = 'armveil',
		time = 30,
		tech = 1,
	},
	corjamt = {
		into = 'corshroud',
		time = 30,
		tech = 1,
	},
	tlljam = {
		into = 'tllajam',
		time = 30,
		tech = 1,
	},
	airwolf3g = {
		into = 'armstratus',
	  	time = 60,
		xp = 0.10,
	},
	shrike = {
		into = 'corshock',
	  	time = 60,
		xp = 0.10,
	},
	tllshu = {
		into = 'tllcondor',
	  	time = 20,
		xp = 0.05,
	},
	trem = {
		into = 'cormcv',
	  	time = 90,
		xp = 0.35,
	},
	cormenacer = {
		into = 'corhaboob',
	  	time = 90,
		xp = 0.35,
	},
	coradon = {
		into = 'corhcrus',
	  	time = 30,
		xp = 0.20,
	},
	armtem = {
		into = 'armhcrus',
	  	time = 90,
		xp = 0.35,
	},
	tllhplasma = {
		into = 'tllhcrus',
	  	time = 60,
		xp = 0.35,
	},
	tllsalamander = {
		into = 'tllcenturion',
	  	time = 60,
		xp = 0.35,
	},
	tllcenturion = {
		into = 'tllinsulator',
	  	time = 60,
		xp = 0.35,
	},
	tllshaker = {
		into = 'tllleopard',
	  	time = 60,
		xp = 0.35,
	},
	--talon_psyker = {
	--	into = 'talon_psyker1',
	--  	time = 35,
	--},
	talon_whinestone  = {
		into = 'talon_sapphire',
	  	time = 40,
		xp = 0.40,
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
