-- $Id: explosion_spawn_defs.lua 4050 2009-03-09 02:56:38Z midknight $
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--Lists post-processing weapon names and the units to spawn when they go off

local spawn_defs = {
	armorbital_zeus_cannon = {name = "armzeus", cost = 0, expire = 0},
	gok_blackpollen_cut_launcher = {name = "gok_cut", cost = 0, expire = 0},
}

local shieldCollide = { -- unitDefs as the shield hit callin is setup really strangely
}

return spawn_defs, shieldCollide
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
