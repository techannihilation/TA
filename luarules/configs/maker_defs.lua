
local ACZ = 1.0/100
local AC0 = 1.2/100
local AC1 = 1.3/100
local AC2 = 1.4/100
local A3 = 1.50/100
local C3 = 1.46/100
local AC4 = 1.6/100
local AC5 = 1.7/100
local AC6 = 1.8/100

local T0 = 1.08/100
local T1 = 1.16/100
--local T2 = 1.24/100
--local T3 = 1.31/100
local T4 = 1.42/100
local T5 = 1.47/100
--local T6 = 1.53/100


local convertCapacities = {

		--ARM
		[UnitDefNames.armmakr.id]  = { c = 50, e = (AC0) }, -- Normal
		[UnitDefNames.armfmkr.id]  = { c = 100, e = (AC1) }, -- Floating
		[UnitDefNames.ametalmakerlvl1.id]  = { c = 200, e = (AC2) }, -- T1,5
		[UnitDefNames.armamaker.id]  = { c = 200, e = (AC2) }, -- T1,5
		[UnitDefNames.armckmakr.id]  = { c = 400, e = (A3) }, -- Cloaked/Hardened
		[UnitDefNames.armmmkr.id]  = { c = 800, e = (AC4) }, -- Moho
		[UnitDefNames.armuwmmm.id]  = { c = 1000, e = (AC5) }, -- Underwater
		[UnitDefNames.ametalmakerlvl2.id]  = { c = 16000, e = (AC6) }, -- Super
		
		[UnitDefNames.armgen.id]  = { c = UnitDefNames.armgen.energyMake, e = (ACZ) }, -- Armgen Combo fusion
					
		--CORE
		[UnitDefNames.cormakr.id]  = { c = 64, e = (AC0) }, -- Normal
		[UnitDefNames.corfmkr.id]  = { c = 128, e = (AC1) }, -- Floating
		[UnitDefNames.cmetalmakerlvl1.id]  = { c = 256, e = (AC2) }, -- T1,5
		[UnitDefNames.coramaker.id]  = { c = 256, e = (AC2) }, -- T1,5
		[UnitDefNames.corhmakr.id]  = { c = 3072, e = (C3) }, -- Cloaked/Hardened
		[UnitDefNames.cormmkr.id]  = { c = 1024, e = (AC4) }, -- Moho
		[UnitDefNames.coruwmmm.id]  = { c = 1280, e = (AC5) }, -- Underwater
		[UnitDefNames.cmetalmakerlvl2.id]  = { c =20480, e = (AC6) }, -- Super

		[UnitDefNames.corgen.id]  = { c = UnitDefNames.corgen.energyMake, e = (ACZ) }, -- Corgen Combo fusion
		--TLL
		[UnitDefNames.tllmm.id]  = { c = 100, e = (T0) }, -- Normal
		[UnitDefNames.tllwmconv.id]  = { c = 100, e = (T1) }, -- Floating
		--[UnitDefNames.____.id]  = { c = 300, e = (T2) }, -- T1,5
		--[UnitDefNames.____.id]  = { c = 600, e = (T3) }, -- Cloaked/Hardened
		[UnitDefNames.tllammaker.id]  = { c = 1000, e = (T4) }, -- Moho
		[UnitDefNames.tllwmmohoconv.id]  = { c = 1000, e = (T5) }, -- Underwater
		--[UnitDefNames.____.id]  = { c = 10000, e = (T6) }, -- Super

		[UnitDefNames.tllgen.id]  = { c = UnitDefNames.tllgen.energyMake, e = (ACZ) }, -- Corgen Combo fusion
    }


return convertCapacities

