-- WEAPONDEF -- ATOMIC_BLAST --
--------------------------------------------------------------------------------

local weaponName = "atomic_blast"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 400,
	craterboost = 0,
	cratermult = 0,
	explosiongenerator = [[custom:FLASHNUKE480]],
	impulseboost = 0.12300000339746,
	impulsefactor = 0.12300000339746,
	name = [[AtomicBlastWeapon]],
	soundhit = [[xplonuk3]],
	soundstart = [[largegun]],
	damage = {
		commanders = 1250,
		crawlingbombs = 50,
		default = 2500,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
