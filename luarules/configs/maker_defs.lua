
local ACZ = 0.8/100
local AC0 = 1/100
local AC1 = 1.05/100
local AC2 = 1.3/100
local A3 = 1.35/100
local C3 = 1.35/100
local AC4 = 1.4/100
local AC5 = 1.45/100
local AC6 = 1.5/100
local AC7 = 1.6/100

local T0 = 0.95/100
local T1 = 1/100
local T2 = 1.2/100
--local T3 = 1.31/100
local T4 = 1.35/100
local T5 = 1.4/100
local T6 = 1.45/100
local T7 = 1.5/100

local convertCapacities = {

		--ARM
		[UnitDefNames.armmakr.id]  = { c = 50, e = (AC0) }, -- Normal
		[UnitDefNames.armfmkr.id]  = { c = 100, e = (AC1) }, -- Floating
		[UnitDefNames.ametalmakerlvl1.id]  = { c = 160, e = (AC2) }, -- T1,5
		[UnitDefNames.armamaker.id]  = { c = 160, e = (AC2) }, -- T1,5
		[UnitDefNames.armckmakr.id]  = { c = 400, e = (A3) }, -- Cloaked/Hardened
		[UnitDefNames.armmmkr.id]  = { c = 800, e = (AC4) }, -- Moho
		[UnitDefNames.armuwmmm.id]  = { c = 1000, e = (AC5) }, -- Underwater
		[UnitDefNames.ametalmakerlvl2.id]  = { c = 8000, e = (AC6) }, -- T3
		[UnitDefNames.ametalmakerlvl3.id]  = { c = 54000, e = (AC7) }, -- T4
		[UnitDefNames.armgen.id]  = { c = UnitDefNames.armgen.energyMake, e = (ACZ) },					
		--CORE
		[UnitDefNames.cormakr.id]  = { c = 64, e = (AC0) }, -- Normal
		[UnitDefNames.corfmkr.id]  = { c = 128, e = (AC1) }, -- Floating
		[UnitDefNames.cmetalmakerlvl1.id]  = { c = 192, e = (AC2) }, -- T1,5
		[UnitDefNames.coramaker.id]  = { c = 192, e = (AC2) }, -- T1,5
		[UnitDefNames.corhmakr.id]  = { c = 3072, e = (C3) }, -- Cloaked/Hardened
		[UnitDefNames.cormmkr.id]  = { c = 1024, e = (AC4) }, -- Moho
		[UnitDefNames.coruwmmm.id]  = { c = 1280, e = (AC5) }, -- Underwater
		[UnitDefNames.cmetalmakerlvl2.id]  = { c = 10240, e = (AC6) }, -- T3
		[UnitDefNames.cmetalmakerlvl3.id]  = { c = 40960, e = (AC7) }, -- T4
		[UnitDefNames.corgen.id]  = { c = UnitDefNames.corgen.energyMake, e = (ACZ) }, 

		--TLL
		[UnitDefNames.tllmm.id]  = { c = 100, e = (T0) }, -- Normal
		[UnitDefNames.tllwmconv.id]  = { c = 100, e = (T1) }, -- Floating
		[UnitDefNames.tllmetalmakerlvl1.id]  = { c = 200, e = (T2) }, -- T1,5
		--[UnitDefNames.____.id]  = { c = 600, e = (T3) }, -- Cloaked/Hardened
		[UnitDefNames.tllammaker.id]  = { c = 1000, e = (T4) }, -- Moho
		[UnitDefNames.tllwmmohoconv.id]  = { c = 1200, e = (T5) }, -- Underwater
		[UnitDefNames.tllmetalmakerlvl2.id]  = { c = 10000, e = (T6) }, -- T4	
		[UnitDefNames.tllmetalmakerlvl3.id]  = { c = 40000, e = (T7) }, -- T4
		[UnitDefNames.tllgen.id]  = { c = UnitDefNames.tllgen.energyMake, e = (ACZ) },

		--TALON
		[UnitDefNames.talon_makr.id]  = { c = 75, e = (AC0) }, -- Normal
		[UnitDefNames.talon_fmkr.id]  = { c = 150, e = (AC1) }, -- Floating
		--[UnitDefNames.talon_afmkr.id]  = { c = 225, e = (AC2) }, -- T1,5
		[UnitDefNames.talon_amaker.id]  = { c = 1200, e = (AC4) }, -- Moho
		[UnitDefNames.talon_famkr.id]  = { c = 1375, e = (AC5) }, -- Underwater
		[UnitDefNames.talon_metalmakerlvl2.id]  = { c = 12000, e = (AC6) }, -- T3
		[UnitDefNames.talon_metalmakerlvl3.id]  = { c = 48000, e = (AC7) }, -- T4		
		[UnitDefNames.talon_gen.id]  = { c = UnitDefNames.talon_gen.energyMake, e = (ACZ) },
    }

return convertCapacities

