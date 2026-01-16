local AC0    = 0.8  / 100
local AC1    = 0.9  / 100
local AC2    = 1    / 100
local AC3    = 1.1  / 100
local AC4    = 1.2  / 100
local AC5    = 1.3  / 100
local AC6    = 1.4  / 100

local convertCapacities = {

  -- ARM
  [UnitDefNames.armmakr.id]         = { c = 50,     e = AC0 },
  [UnitDefNames.armfmkr.id]         = { c = 100,    e = AC0 },
  [UnitDefNames.armamaker.id]       = { c = 150,    e = AC2 },
  [UnitDefNames.armmmkr.id]         = { c = 800,    e = AC3 },
  [UnitDefNames.armuwmmm.id]        = { c = 1000,   e = AC3 },
  [UnitDefNames.ametalmakerlvl2.id] = { c = 8000,   e = AC4 },
  [UnitDefNames.ametalmakerlvl3.id] = { c = 32000,  e = AC5 },
  [UnitDefNames.ametalmakerlvl4.id] = { c = 192000, e = AC6 },

  -- CORE
  [UnitDefNames.cormakr.id]         = { c = 64,     e = AC0 },
  [UnitDefNames.corfmkr.id]         = { c = 128,    e = AC0 },
  [UnitDefNames.coramaker.id]       = { c = 192,    e = AC2 },
  [UnitDefNames.cormmkr.id]         = { c = 1024,   e = AC3 },
  [UnitDefNames.coruwmmm.id]        = { c = 1280,   e = AC3 },
  [UnitDefNames.cmetalmakerlvl2.id] = { c = 10240,  e = AC4 },
  [UnitDefNames.cmetalmakerlvl3.id] = { c = 40960,  e = AC5 },
  [UnitDefNames.cmetalmakerlvl4.id] = { c = 245000, e = AC6 },

  -- TLL
  [UnitDefNames.tllmm.id]              = { c = 45,     e = AC0 },
  [UnitDefNames.tllwmconv.id]          = { c = 90,     e = AC0 },
  [UnitDefNames.tllmetalmakerlvl1.id]  = { c = 135,    e = AC2 },
  [UnitDefNames.tllammaker.id]         = { c = 750,    e = AC3 },
  [UnitDefNames.tllwmmohoconv.id]      = { c = 900,    e = AC3 },
  [UnitDefNames.tllmetalmakerlvl2.id]  = { c = 9000,   e = AC4 },
  [UnitDefNames.tllmetalmakerlvl3.id]  = { c = 36000,  e = AC5 },
  [UnitDefNames.tllmetalmakerlvl4.id]  = { c = 168000, e = AC6 },

  -- TALON
  [UnitDefNames.talon_makr.id]         = { c = 75,     e = AC0 },
  [UnitDefNames.talon_fmkr.id]         = { c = 150,    e = AC0 },
  [UnitDefNames.talon_makr1.id]        = { c = 225,    e = AC2 },
  [UnitDefNames.talon_amaker.id]       = { c = 1200,   e = AC3 },
  [UnitDefNames.talon_famkr.id]        = { c = 1375,   e = AC3 },
  [UnitDefNames.talon_metalmakerlvl2.id]= { c = 12000, e = AC4 },
  [UnitDefNames.talon_metalmakerlvl3.id]= { c = 48000, e = AC5 },
  [UnitDefNames.talon_metalmakerlvl4.id]= { c = 300000,e = AC6 },

  -- GOK
  [UnitDefNames.gok_makr.id]          = { c = 60,     e = AC0 },
  [UnitDefNames.gok_fmkr.id]          = { c = 120,    e = AC0 },
  [UnitDefNames.gok_makr1.id]         = { c = 180,    e = AC2 },
  [UnitDefNames.gok_amaker.id]        = { c = 1000,   e = AC3 },
  [UnitDefNames.gok_famkr.id]         = { c = 1150,   e = AC3 },
  [UnitDefNames.gok_metalmakerlvl2.id]= { c = 10000,  e = AC4 },
  [UnitDefNames.gok_metalmakerlvl3.id]= { c = 45000,  e = AC5 },
  [UnitDefNames.gok_metalmakerlvl4.id]= { c = 275000, e = AC6 },

  -- RUMAD
  [UnitDefNames.rumad_metalmakerlvl1.id] = { c = 250,   e = AC1 },
  [UnitDefNames.rumad_metalmakerlvl2.id] = { c = 1000,  e = AC3 },
  [UnitDefNames.rumad_metalmakerlvl3.id] = { c = 10000, e = AC4 },
  [UnitDefNames.rumad_metalmakerlvl4.id] = { c = 35000, e = AC5 },
  [UnitDefNames.rumad_metalmakerlvl5.id] = { c = 210000,e = AC6 },
}

return convertCapacities
