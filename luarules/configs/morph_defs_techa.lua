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
		
			--metal = 0,
			--energy = 0,
			--Free For Xmas
		
		},
		{
			into = 'armcom1',
			time = 30,
		
			--metal = 0,
			--energy = 0,
			--Free For Xmas
		},
	},
	armcom1 = {
		into = 'armcom5',
        	time = 90,
	},
	armcom4 = {
		into = 'armcom5',
        	time = 60,
	},
	armcom5 = {
		into = 'armcom6',
		time = 120,
	},
	armcom6 = {
		into = 'armcom7',
		time = 180,
	},
	corcom = {
		{
			into = 'corcom3',
			time = 30,
		
			--metal = 0,
			--energy = 0,
			--Free For Xmas

		},
		{	
			into = 'corcom1',
			time = 30,
		
			--metal = 0,
			--energy = 0,
			--Free For Xmas
			
		},
	},
	corcom1 = {
		into = 'corcom5',
		time = 90,
	},
	corcom3 = {
		into = 'corcom5',
		time = 60,
	},
	corcom5 = {
		into = 'corcom6',
		time = 120,
	},
	corcom6 = {
		into = 'corcom7',
		time = 120,
	},
	tllcom = {
		{
			into = 'tllcom3',
			time = 30,
		
			--metal = 0,
			--energy = 0,
			--Free For Xmas
		
		},
		{
			into = 'tllcom1',
			time = 30,
		
			--metal = 0,
			--energy = 0,
			--Free For Xmas
		},
	},
	tllcom1 = {
		into = 'tllcom5',
		time = 90,
	},
	tllcom3 = {
		into = 'tllcom5',
		time = 60,
	},
	tllcom5 = {
		into = 'tllcom6',
		time = 120,
	},
	tllcom6 = {
		into = 'tllcom7',
		time = 180,
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
		metal = 65,
		xp = 0.50,
	},
	corllt = {
		into = 'corllt1',
		time = 15,
		metal = 70,
		xp = 0.50,
	},
	armhlt = {
		into = 'armvhlt',
		time = 30,
		xp = 0.30,
	},	
	armvhlt	= {		
		into = 'armpb',
		time = 30,
		xp = 0.30,	
	},
	corhlt= {
		into = 'corvhlt',
		time = 30,
		xp = 0.30,
	},
	corvhlt = {
		into = 'corvipe',
		time = 30,
		xp = 0.30,
	},
	tllhlt = {
		into = 'tllpulaser',
		time = 30,
		xp = 0.50,
	},
	tllweb = {
		into = 'tllupgweb',
		time = 30,
		xp = 0.50,
	},
	armguard= {
		into = 'armamb',
		time = 30,
		xp = 0.50,
	},
	corpun= {
		into = 'cortoast',
		time = 30,
		xp = 0.50,
	},
	tlllbt = {
		into = 'tllplasma',
		time = 30,
		xp = 0.50,
	},
	armamd = {
		into = 'armamd1',
		time = 40,
		tech = 2,
	},
	corfmd = {
		into = 'corfmd1',
		time = 40,
		tech = 2,
	},
	armscab = {
		into = 'armscab1',
		time = 80,
	},
	cormabm = {
		into = 'cormabm1',
		time = 80,
	},
	tllantinuke = {
		into = 'tllantinuke1',
		time = 40,
		tech = 2,
	},
	armanni = {
		into = 'armanni1',
		time = 120,
		xp = 1.07,
	},
	cordoom = {
		into = 'cordoom1',
		time = 120,
		xp = 1.07,
	},
	corflak = {
		into = 'corpre',
		time = 120,
		xp = 1.07,
	},
	armflak = {
		into = 'armhys',
		time = 120,
		xp = 1.07,
	},
	tllflak = {
		into = 'tlldb',
		time = 120,
		xp = 1.07,
	},
	armsilo = {
		into = 'armsilo1',
		tech = 2,
		time = 30,
		xp = 0.15,
	},
	corsilo = {
		into = 'corsilo1',
		tech = 2,
		time = 30,
		xp = 0.15,
	},
	armcir = {
		into = 'armcir1',
		time = 60,
		xp = 0.05,
	},
	corerad = {
		into = 'corerad1',
		time = 60,
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
		time = 180,
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
		xp = 0.30,
  	},
	tllgeo = {
		into = 'tllmohogeo',
	  	time = 120,
	  	tech = 1,
	},
	armgate = {
		into = 'armgate1',
		time = 120,
		tech = 2,
	},
	corgate = {
		into = 'corgate1',
		time = 120,
		tech = 2,
	},
	corech3 = {
		into = 'corech18',
		time = 45,
	},
	corech18 = {
		into = 'corech21',
		time = 60,
	},
	corech21 = {
		into = 'CCovertOpsCentre',
		time = 240,
	},
	armrech3 = {
		into = 'armrech18',
		time = 45,
	},
	armrech18 = {
		into = 'armrech21',
		time = 60,
	},
	armrech21 = {
		into = 'ACovertOpsCentre',
		time = 240,
	},
	armvulc = {
		into = 'armvulc2',
		time = 30,
		xp = 0.15,
	},
	corbuzz = {
		into = 'corbuzz2',
		time = 30,
		xp = 0.15,
	},
	armbrtha = {
		into = 'armbrtha1',
		time = 30,
		xp = 0.50,
	},
	corint= {
		into = 'corint1',
		time = 30,
		xp = 0.50,
	},
	armpw = {
		into = 'armpw1',
		time = 10,
		xp = 0.01,
	},
	armpw1 = {
		into = 'armhdpw',
		time = 60,
		xp = 1.00,
	},
	armhdpw = {
		into = 'arm_furie',
		time = 180,
		xp = 1.00,
	},
	armrock = {
		into = 'armrock1',
		time = 10,
		xp = 0.05,
	},
	armrock1 = {
		into = 'armtarantula',
		time = 20,
		xp = 0.10,
	},
	armham = {
		into = 'armham1',
		time = 10,
		xp = 0.05,
	},
	armham1 = {
		into = 'armshock1',
		time = 60,
		xp = 0.50,
	},
	armshock1 = {
		into = 'armshock',
		time = 120,
		xp = 0.60,
	},
	corak = {
		into = 'corak1',
		time = 10,
		xp = 0.01,
	},
	corak1 = {
		into = 'armkrmi',
		time = 60,
		xp = 0.60,
	},
	corpyro = {
		into = 'corpyrox',
		time = 60,
		xp = 0.60,
	},
	corpyrox = {
		into = 'corpyrox1',
		time = 30,
		xp = 0.15,
	},
	corpyrox1 = {
		into = 'cordem',
		time = 60,
		xp = 0.60,
	},
	corstorm = {
		into = 'corstorm1',
		time = 10,
		xp = 0.05,
	},
    	corstorm1 = {
		into = 'armraven1',
		time = 60,
		xp = 0.50,
	},
	armraven1 = {
		into = 'armraven',
		time = 120,
		xp = 0.60,
	},
	corthud = {
		into = 'corthud1',
		time = 10,
		xp = 0.05,
	},
	corthud1 = {
		into = 'cormort',
		time = 30,
		xp = 0.50,
	},
	armflash = {
		into = 'armflash1',
		time = 10,
		xp = 0.05,
	},	
	armlatnk = {
		into = 'nsaagriz',
		time = 180,
		xp = 1.25,
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
		xp = 0.30,
	},
	armbull2 = {
		into = 'armmcv',
		time = 120,
		xp = 0.60,
	},
	tawf013 = {
		into = 'tawf0131',
		time = 10,
		xp = 0.05,
	},
	tawf0131 = {
		into = 'armmart',
		time = 30,
		xp = 0.30,
	},
    	armmart = {
		into = 'avtr',
		time = 120,
		xp = 0.60,
	},
	armjanus = {
		into = 'armjanus1',
		time = 10,
		xp = 0.10,
	},
	armjanus1 = {
		into = 'tankanotor',
		time = 120,
		xp = 1.00,
	},
	tankanotor = {	
		into = 'armmlrs',
		time = 120,
		xp = 0.75,
	},
	armsam = {
		into = 'armsam1',
		time = 10,
		xp = 0.05,
	},
	armsam1 = {	
		into = 'armhorg',
		time = 100,
		xp = 0.5,
	},
	corgator = {
		into = 'corgator1',
		time = 10,
		xp = 0.05,
	},
	corgator1 = {
		into = 'nsacskv',
		time = 45,
		xp = 0.45,
	},
	corlevlr = {
		into = 'corlevlr1',
		time = 10,
		xp = 0.10,
	},
	corlevlr1 = {
		into = 'corgol',
		time = 60,
		xp = 0.60,
	},
	corgol = {
		into = 'corgol1',
		time = 60,
		xp = 0.20,
	},
	corgol1 = {
		into = 'corbt',
		time = 180,
		xp = 1.00,
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
		xp = 0.30,
	},
	corwolv = {
		into = 'corwolv1',
		time = 10,
		xp = 0.05,
	},
	corwolv1 = {
		{
			into = 'cormart',
			time = 30,
			xp = 0.30,
		},
		{
			into = 'trem',
			time = 60,
			xp = 0.45,
		},
	},
	cormart = {
		{
			into = 'cortotal',
			time = 60,
			xp = 0.60,
		},
		{
			into = 'clb',
			time = 120,
			xp = 0.60,
		},
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
		xp = 0.20,
	},
	corcrash = {
		into = 'coraak',
		time = 30,
		xp = 0.20,
	},
	armwar = {
		into = 'armmav',
		time = 30,
		xp = 0.50,
		energy = 2000,
	},
	armmav = {
     		into = 'armraz',
		time = 60,
		xp = 0.5,
	},
	armraz  = {
 		into = 'armraz1',
         	time = 120,
         	xp = 0.50,
         },
	aexxec	= {
     		into = 'akmech',
		time = 120,
		xp = 0.75,
	},
	akmech = {
        	into = 'armorco',
        	time = 120,
		xp = 0.50,
	},
	armmerl = {
		into = 'armmlrs',
		time = 120,
		xp = 1.00,
	},
	corhrk = {
		into = 'corhowie',
		time = 120,
		xp = 1.25,
	},
	corsumo = {
		into = 'corsumo1',
		time = 60,
		xp = 0.20,
	},
	armzeus = {
		into = 'armzeus1',
		time = 20,
		xp = 0.10,
	},
	armfboy = {
		into = 'armfboy1',
		time = 60,
		xp = 0.20,
	},
	armnanotc = {	 
		into = 'armnanotc1',
		time = 30,
		tech = 1,
		metal = 380,
		energy = 11000,
	},
	armnanotc1 = {
		into = 'armnanotc2',
		tech = 2,
		time = 60,
		metal = 1320,
		energy = 43000,
	},
	armnanotc2 = {
		into = 'armnanotc3',
		tech = 3,
		time = 120,
		metal = 3520,
		energy = 99000,
	},
	armfnanotc = {
		into = 'armfnanotc1',
		time = 30,
		tech = 1,
		metal = 380,
		energy = 11000,
	},
	armfnanotc1 = {
		into = 'armfnanotc2',
		tech = 2,
		time = 60,
		metal = 1320,
		energy = 43000,
	},
	armfnanotc2 = {
		into = 'armfnanotc3',
		tech = 3,
		time = 120,
		metal = 3520,
		energy = 99000,
	},
	cornanotc = {
		into = 'cornanotc1',
		tech = 1,
		time = 30,
		metal = 680,
		energy = 11000,
	},
	cornanotc1 = {
		into = 'cornanotc2',
		tech = 2,
		time = 60,
		metal = 1320,
		energy = 43000,
	},
	cornanotc2 = {
		into = 'cornanotc3',
		tech = 3,
		time = 120,
		metal = 3520,
		energy = 99000,
	},
	corfnanotc = {
		into = 'corfnanotc1',
		tech = 1,
		time = 30,
		metal = 680,
		energy = 11000,
	},
	corfnanotc1 = {
		into = 'corfnanotc2',
		tech = 2,
		time = 60,
		metal = 1320,
		energy = 43000,
	},
	corfnanotc2 = {
		into = 'corfnanotc3',
		tech = 3,
		time = 120,
		metal = 3520,
		energy = 99000,
	},
	tllnanotc = {
		into = 'tllnanotc1',
		tech = 1,
		time = 30,
		metal = 800,
		energy = 13000,
	},
	tllnanotc1 = {
		into = 'tllnanotc2',
		tech = 2,
		time = 60,
		metal = 2700,
		energy = 33000,
	},
	tllfnanotc = {
		into = 'tllfnanotc1',
		tech = 1,
		time = 30,
		metal = 800,
		energy = 13000,
	},
	tllfnanotc1 = {
		into = 'tllfnanotc2',
		tech = 2,
		time = 60,
		metal = 2700,
		energy = 33000,
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
		time = 120,
		xp = 0.75,
	},
	krogtaar = {
		into = 'corkrog',
		time = 120,
		xp = 0.50,
	},
	corkrog = {
        	into = 'corkrog1',
        	time = 240,
		xp = 0.60,
	},
	armbanth = {
        	into = 'armbanth1',
        	time = 240,
		xp = 0.60,
	},
	corkarg = {
 		into = 'corkarg1',
         	time = 120,
         	xp = 0.50,
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
	corprot = {
     		into = 'troman',
		time = 60,
		xp = 0.30,
	},
	coramph = {
     		into = 'shiva',
		time = 60,
		xp = 0.30,
	},
	armkrmi= {
     		into = 'armgor',
		time = 120,
		xp = 0.45,
	},
	cortotal = {
     		into = 'armsiege',
		time = 60,
		xp = 0.30,
	},
	armfast = {
     		into = 'armjugg',
		time = 120,
		xp = 0.60,
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
	
-- New adding for TLL

	tllshaker = {
     		into = 'tlloki',
		time = 30,
		xp = 0.35,
	},
	tlloki = {
     		into = 'tllmlrpc',
		time = 120,
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
     		into = 'tlltelsatnk',
		time = 60,
		xp = 0.30,
	},
	tllpbot = {
     		into = 'tllartybot',
		time = 30,
		xp = 0.50,
	},
	tllartybot = {
     		into = 'heavyimpact',
		time = 30,
		xp = 0.50,
	},
	tllbind = {
     		into = 'tllblind',
		time = 120,
		xp = 0.60,
	},
	tllfireraiser = {
     		into = 'tllamphibot',
		time = 30,
		xp = 0.50,
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
