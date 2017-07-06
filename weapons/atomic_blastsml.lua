-- WEAPONDEF -- ATOMIC_BLASTSML --
--------------------------------------------------------------------------------

local weaponName = "atomic_blastsml"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 320,
	craterboost = 0,
	cratermult = 0,
	explosiongenerator = [[custom:FLASHNUKE320]],
	impulseboost = 0.12300000339746,
	impulsefactor = 0.12300000339746,
	name = [[AtomicBlastWeapon]],
	range = 480,
	reloadtime = 3.5999999046326,
	soundhit = [[xplonuk3]],
	soundstart = [[largegun]],
	turret = 1,
	weaponvelocity = 250,
	damage = {
		commanders = 625,
		default = 1250,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
