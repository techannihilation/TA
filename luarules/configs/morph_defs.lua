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
		metal = 1350,
		energy = 12000,
	},
	{
		into = 'armcom1',
		time = 30,
		metal = 1100,
		energy = 24500,
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
		metal = 1350,
		energy = 12000,
	},
	{
		into = 'corcom1',
		time = 30,
		metal = 1100,
		energy = 24500,
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
		into = 'tllcom3',
		time = 30,
		metal = 1350,
		energy = 12000,
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
	},
      armrl = {
		into = 'armrl1',
		time = 10,
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
	{
		into = 'armhlt1',
		time = 20,
		metal = 250,
		xp = 0.30,
	},
	{
		into = 'armpb',
		time = 30,
		metal = 400,
		xp = 0.60,
	},
	},
      corhlt= {
	{
		into = 'corhlt1',
		time = 20,
		metal = 260,
		xp = 0.30,
	},
	{
		into = 'corvipe',
		time = 30,
		metal = 420,
		xp = 0.60,
	},
	},
      armguard= {
	{
		into = 'arm_guardian',
		time = 20,
		metal = 800,
		energy = 6500,
		xp = 0.50,
	},
	{
		into = 'amortor',
		time = 30,
		metal = 900,
		energy = 9000,
		xp = 0.60,
	},
	},
      corpun= {
	{
		into = 'arm_guardian',
		time = 20,
		metal = 800,
		energy = 6500,
		xp = 0.50,
	},
	{
		into = 'cmortor',
		time = 30,
		metal = 900,
		energy = 9000,
		xp = 0.60,
	},
	},
      armamd = {
		into = 'armamd1',
		time = 40,
	},
      corfmd = {
		into = 'corfmd1',
		time = 40,
	},
      armscab = {
		into = 'armscab1',
		time = 80,
	},
      cormabm = {
		into = 'cormabm1',
		time = 80,
	},
      armanni = {
		into = 'armanni1',
		time = 120,
		xp = 1.07,
	},
      cordoom = {
		into = 'cordoom1',
		time = 140,
		xp = 1.07,
	},
      armsilo = {
		into = 'armsilo1',
		time = 30,
		xp = 0.01,
	},
      corsilo = {
		into = 'corsilo1',
		time = 30,
		xp = 0.01,
	},
      armcir = {
		into = 'armcir1',
		time = 60,
	},
      corerad = {
		into = 'corerad1',
		time = 60,
	},
      armgmm = {
		into = 'armfor',
		time = 180,
	},
      armgate = {
		into = 'armgate1',
		time = 120,
	},
      corgate = {
		into = 'corgate1',
		time = 120,
	},
      corech3 = {
		into = 'corech18',
		time = 30,
	},
      corech18 = {
		into = 'corech21',
		time = 30,
	},
      corech21 = {
		into = 'CCovertOpsCentre',
		time = 120,
	},
      armrech3 = {
		into = 'armrech18',
		time = 30,
	},
      armrech18 = {
		into = 'armrech21',
		time = 30,
	},
      armrech21 = {
		into = 'ACovertOpsCentre',
		time = 120,
	},
      armvulc = {
		into = 'armvulc2',
		time = 30,
		xp = 0.14,
	},
      corbuzz = {
		into = 'corbuzz2',
		time = 30,
		xp = 0.14,
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
      corbhmth = {
		into = 'corbhmth1',
		time = 110,
		xp = 0.30,
	},
      armpw = {
		into = 'armpw1',
		time = 10,
	},
      armrock = {
              {
		into = 'armrock1',
		time = 10,
		xp = 0.30,
	},
	{
		into = 'armfark',
		time = 60,
		xp = 1.10,
	},
	{
		into = 'armsptk',
		time = 30,
		xp = 0.60,
		energy = 3000,
	},
    },
      armham = {
	{
		into = 'armham1',
		time = 10,
		xp = 0.25,
	},
	{
		into = 'armfido',
		time = 30,
		xp = 0.6,
	},
	{
		into = 'armack',
		time = 60,
		xp = 0.85,
		metal = 1200,
		energy = 5000,
	},
	},
      corak = {
		into = 'corak1',
		time = 10,
	},
      corstorm = {
               {
		into = 'corstorm1',
		time = 10,
		xp = 0.30,
	},
    {
		into = 'corfast',
		time = 60,
		xp = 1.10,
	},
    {
		into = 'cortermite',
		time = 30,
		xp = 0.60,
		energy = 3000,
	},
    },
      corthud = {
	{
		into = 'corthud1',
		time = 10,
		xp = 0.25,
	},
	{
		into = 'cormort',
		time = 30,
		xp = 0.6,
	},
	{
		into = 'corack',
		time = 60,
		xp = 0.85,
		metal = 1150,
		energy = 5000,
	},
	},
      armflash = {
		into = 'armflash1',
		time = 10,
		xp = 0.05
	},
      armstump = {
	{
		into = 'armstump1',
		time = 15,
		xp = 0.1,

	},
	{
		into = 'armbull',
		time = 30,
		xp = 0.60,
		energy = 2000,
	},
	},
      tawf013 = {
	{
		into = 'tawf0131',
		time = 10,
		xp = 0.25,
	},
	{
		into = 'armmart',
		time = 30,
		xp = 0.60,
	},
	},
      armjanus = {
	{
		into = 'armjanus1',
		time = 10,
		xp = 0.30,
	},
	{
		into = 'consul',
		time = 60,
		xp = 0.80,
	},
	{
		into = 'armorca',
		time = 30,
		xp = 0.60,
	},
	},	
      armsam = {
             {
		into = 'armsam1',
		time = 10,
		xp = 0.25,
		},
		{
		into = 'armacv',
		time = 30,
		xp = 0.90,
		metal = 1650,
		energy = 5000,
		},
		{
		into = 'tawf014',
		time = 60,
		xp = 0.75,
		energy = 2500,
		},
    },
      corgator = {
		into = 'corgator1',
		time = 10,
		xp = 0.05
	},
      corlevlr = {
	{
		into = 'corlevlr1',
		time = 10,
		xp = 0.30,
	},
	{
		into = 'consul1',
		time = 60,
		xp = 0.80,
	},
	{
		into = 'corgfbt',
		time = 30,
		xp = 0.60,
		energy = 2000,
	},
	},
      corraid = {
	{
		into = 'corraid1',
		time = 15,
		xp = 0.1,
	},
	{
		into = 'correap',
		time = 30,
		xp = 0.60,
		energy = 2000,
	},
	},
      corwolv = {
		{
		into = 'corwolv1',
		time = 10,
		xp = 0.25,
		},
		{
		into = 'cormart',
		time = 30,
		xp = 0.60,
		},
		{
		into = 'trem',
		time = 60,
		xp = 0.85,
		energy = 2500,
		},
	},
      cormist = {
		{
		into = 'cormist1',
		time = 10,
		xp = 0.25,
		},
		{
		into = 'coracv',
		time = 60,
		xp = 0.90,
		metal = 1670,
		energy = 5000,
		},
		{
		into = 'tawf114',
		time = 30,
		xp = 0.75,
		energy = 2500,
		},
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
     armmanni = {
		into = 'armraz',
		time = 60,
		xp = 0.75,
		metal = 2500,
		energy = 7500,
	},
     corvroc = {
		into = 'corkarg',
		time = 60,
		xp = 0.80,
		metal = 2000,
		energy = 7500,
	},
      armmerl = {
		into = 'requ1',
		time = 60,
		xp = 0.60,
		metal = 2000,
		energy = 10000,
	},
      armsnipe = {
		into = 'armjugg',
		time = 90,
		xp = 1.50,
		metal = 6500,
		energy = 20000,
	},
       corhrk = {
		into = 'corjurgen',
		time = 60,
		xp = 0.85,
		metal = 1500,
		energy = 5000,
	},
      corgol = {
		into = 'corgol1',
		time = 60,
		xp = 0.60,
	},
      corsumo = {
		into = 'corsumo1',
		time = 60,
		xp = 0.60,
	},
      armzeus = {
		into = 'armzeus1',
		time = 30,
		xp = 0.25,
	},
      armfboy = {
		into = 'armfboy1',
		time = 60,
		xp = 0.60,
	},
      armshock1 = {
		into = 'armshock',
		time = 60,
		xp = 0.60,
	},
      armraven1 = {
		into = 'armraven',
		time = 60,
		xp = 0.60,
	},
      tllweb = {
		into = 'tllupgweb',
		time = 30,
		xp = 0.60,
	},
      armnanotc = {
		 
		into = 'armnanotc1',
		time = 30,
		tech = 1,
		metal = 380,
		energy = 11000,
	},
      armnanotc1 = {
		   {
		into = 'armnanotc2',
		tech = 2,
		time = 60,
		metal = 1320,
		energy = 43000,
		  },
		  {
		into = 'ananotower',
		time = 30,
		tech = 2,
		metal = 1500,
		energy = 36000,
		  },
		  },
      armnanotc2 = {
		into = 'armnanotc3',
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
		   {
		into = 'cornanotc2',
		tech = 2,
		time = 60,
		metal = 1320,
		energy = 43000,
		  },
		  {
		into = 'cnanotower',
		tech = 2,
		time = 30,
		metal = 1500,
		energy = 36000,
		  },
		  },
      cornanotc2 = {
		into = 'cornanotc3',
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
