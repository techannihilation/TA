-- $Id: explosion_spawn_defs.lua 4050 2009-03-09 02:56:38Z midknight $
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--Lists post-processing weapon names and the units to spawn when they go off

local spawn_defs = {
	armorbital_zeus_cannon = {name = "armzeus", cost = 0, expire = 0},
	--armorbital1_peewee_cannon = {name = "armhdpw", cost = 0, expire = 0},
	--corpcan_peewee_cannon = {name = "corak", cost = 0, expire = 0},
	--tllpcan_peewee_cannon = {name = "tllprivate", cost = 0, expire = 0},

}

local shieldCollide = { -- unitDefs as the shield hit callin is setup really strangely
}

return spawn_defs, shieldCollide
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
