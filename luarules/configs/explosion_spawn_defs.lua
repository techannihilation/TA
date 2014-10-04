-- $Id: explosion_spawn_defs.lua 4050 2009-03-09 02:56:38Z midknight $
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--Lists post-processing weapon names and the units to spawn when they go off

local spawn_defs = {
	armpcan_peewee_cannon = {name = "armpw", cost = 0, expire = 0},
}

local shieldCollide = { -- unitDefs as the shield hit callin is setup really strangely
}

return spawn_defs, shieldCollide
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
