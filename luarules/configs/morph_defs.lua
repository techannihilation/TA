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
            time = 200,
	},
      armcom4 = {
		into = 'armcom5',
            time = 190,
	},
      armcom5 = {
		into = 'armcom6',
            time = 280,
	},
      armcom6 = {
		into = 'armcom7',
            time = 380,
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
            time = 200,
	},
      corcom3 = {
		into = 'corcom5',
            time = 190,
	},
      corcom5 = {
		into = 'corcom6',
            time = 280,
	},
      corcom6 = {
		into = 'corcom7',
            time = 380,
	},
      tllcom = {
		into = 'tllcom3',
            time = 30,
	    metal = 1350,
	    energy = 12000,
	},
      tllcom3 = {
		into = 'tllcom5',
            time = 190,
	},
      tllcom5 = {
		into = 'tllcom6',
            time = 280,
	},
      tllcom6 = {
		into = 'tllcom7',
            time = 380,
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
            time = 10,
		xp = 0.60,
	},
      corllt = {
		into = 'corllt1',
            time = 10,
		xp = 0.60,
	},
      armhlt = {
	{
		into = 'armhlt1',
            time = 10,
		xp = 0.60,
	},
	{
		into = 'armpb',
            time = 10,
		xp = 0.80,
	},
	},
      corhlt= {
	{
		into = 'corhlt1',
            time = 10,
		xp = 0.60,
	},
	{
		into = 'corvipe',
            time = 10,
		xp = 0.80,
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
            time = 140,
		metal = 1300,
		energy = 15500,
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
		xp = 0.11,
	},
      armpw = {
		into = 'armpw1',
            time = 5,
       		energy = 100,
       		metal = 40,
	},
      armrock = {
              {
		into = 'armrock1',
            time = 5,
		xp = 0.14,
		metal = 50,
		energy = 150,
	},
	{
			into = 'armfark',
            time = 15,
		xp = 1.10,
	},
	{
			into = 'armsptk',
            time = 15,
		xp = 0.60,
		metal = 200,
		energy = 3000,
	},
    },
      armham = {
	{
		into = 'armham1',
            time = 5,
		xp = 0.01,
		metal = 50,
		energy = 130,
	},
	{
		into = 'armfido',
            time = 10,
		xp = 0.20,
	},
	{
		into = 'armack',
            time = 10,
		xp = 0.75,
		metal = 1000,
		energy = 2600,
	},
	},
      corak = {
		into = 'corak1',
            time = 10,
  	       	energy = 125,
  	       	metal = 46,
	},
      corstorm = {
               {
		into = 'corstorm1',
            time = 5,
		xp = 0.14,
		metal = 50,
		energy = 150,
	},
    {
			into = 'corfast',
            time = 15,
		xp = 1.10,
	},
    {
			into = 'cortermite',
            time = 15,
		xp = 0.60,
		metal = 200,
		energy = 3000,
	},
    },
      corthud = {
	{
		into = 'corthud1',
            time = 5,
		xp = 0.01,
		metal = 50,
		energy = 130,
	},
	{
		into = 'cormort',
            time = 10,
		xp = 0.40,
	},
		{
		into = 'corack',
            time = 10,
		xp = 0.80,
		metal = 960,
		energy = 2650,
	},
	},
      armflash = {
		into = 'armflash1',
            time = 5,
		xp = 0.01,
			energy = 90,
			metal = 60,
	},
      armstump = {
	{
		into = 'armstump1',
            time = 5,
		xp = 0.01,
		metal = 60,
		energy = 180,
	},
	{
		into = 'armbull',
            time = 15,
		xp = 0.35,
		metal = 130,
		energy = 2000,
	},
	},
      tawf013 = {
	{
		into = 'tawf0131',
            time = 5,
		xp = 0.01,
		metal = 30,
		energy = 90,
	},
	{
		into = 'armmart',
            time = 15,
		xp = 0.20,
	},
	},
      armjanus = {
	{
		into = 'armjanus1',
            time = 5,
		xp = 0.01,
		metal = 70,
		energy = 190,
	},
	{
		into = 'consul',
            time = 15,
		xp = 0.35,
	},
	{
		into = 'armorca',
            time = 15,
		xp = 0.15,
	},
	},	
      armsam = {
             {
		into = 'armsam1',
            time = 5,
		xp = 0.09,
		metal = 60,
		energy = 120,
	},
	{
			into = 'armacv',
            time = 15,
		xp = 0.90,
		metal = 1140,
		energy = 2200,
	},
	{
			into = 'tawf014',
            time = 15,
		xp = 0.50,
		metal = 750,
		energy = 2450,
	},
    },
      corgator = {
		into = 'corgator1',
            time = 5,
		xp = 0.01,
		energy = 90,
		metal = 60,
	},
      corlevlr = {
	{
		into = 'corlevlr1',
            time = 5,
		xp = 0.01,
		metal = 70,
		energy = 190,
	},
	{
		into = 'consul1',
            time = 15,
		xp = 0.35,
	},
	{
		into = 'corgfbt',
            time = 15,
		xp = 0.15,
		metal = 250,
		energy = 2000,
	},
	},
      corraid = {
	{
		into = 'corraid1',
            time = 5,
		xp = 0.01,
		metal = 60,
		energy = 180,
	},
	{
		into = 'correap',
            time = 15,
		xp = 0.35,
		metal = 130,
		energy = 2000,
	},
	},
      corwolv = {
	{
		into = 'corwolv1',
            time = 5,
		xp = 0.01,
		metal = 30,
		energy = 120,
	},
	{
		into = 'cormart',
            time = 15,
		xp = 0.30,
	},
	{
		into = 'trem',
            time = 25,
		xp = 0.65,
		metal = 500,
		energy = 2400,
	},
	},
      cormist = {
              {
		into = 'cormist1',
            time = 5,
		xp = 0.09,
		metal = 60,
		energy = 150,
	},
	{
			into = 'coracv',
            time = 15,
		xp = 0.85,
		metal = 1200,
		energy = 2200,
	},
	{
			into = 'tawf114',
            time = 15,
		xp = 0.50,
		metal = 750,
		energy = 2450,
	},
    },
    armjeth = {
		into = 'armaak',
            time = 5,
		xp = 0.02,
	},
     corcrash = {
		into = 'coraak',
            time = 5,
		xp = 0.02,
	},
	 armwar = {
		into = 'armmav',
            time = 15,
		xp = 0.15,
		metal = 200,
		energy = 1000,
	},
     armmanni = {
		into = 'armraz',
            time = 25,
		xp = 0.63,
		metal = 850,
		energy = 7500,
	},
     corvroc = {
		into = 'corkarg',
            time = 25,
		xp = 0.80,
		metal = 850,
		energy = 7500,
	},
      armmerl = {
		into = 'requ1',
            time = 25,
		xp = 0.40,
		metal = 300,
		energy = 0,
	},
      armsnipe = {
		into = 'armjugg',
            time = 60,
		xp = 1.40,
		metal = 1950,
		energy = 9500,
	},
       corhrk = {
		into = 'corjurgen',
            time = 25,
		xp = 0.75,
		metal = 750,
		energy = 4500,
	},
      corgol = {
		into = 'corgol1',
            time = 15,
		xp = 0.30,
	},
      corsumo = {
		into = 'corsumo1',
            time = 15,
		xp = 0.30,
	},
      armzeus = {
		into = 'armzeus1',
            time = 15,
		xp = 0.08,
	},
      armfboy = {
		into = 'armfboy1',
            time = 15,
		xp = 0.35,
	},
      armshock1 = {
		into = 'armshock',
            time = 15,
		xp = 0.50,
		metal = 3000,
		energy = 30000,
	},
      armraven1 = {
		into = 'armraven',
            time = 15,
		xp = 0.50,
		metal = 2000,
		energy = 20000,
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
