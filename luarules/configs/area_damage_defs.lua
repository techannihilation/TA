local array = {}

local DAMAGE_PERIOD = 10 -- how often damage is applied

local weapons = {
	tllacid_acidrain_rocket = { radius = 400, damage = 100, duration = 625, rangeFall = 0.6, timeFall = 0.5},
	armsonic_sonic_cannon = { radius = 95, damage = 300, duration = 45, rangeFall = 0.25, timeFall = 0.8, allyScale = 0.5, teamScale = 0.25},
	tllriot_tllriot_cannon = { radius = 75, damage = 200, duration = 35, rangeFall = 0.25, timeFall = 0.6, allyScale = 0.5 },
	thermite_mine = { radius = 64, damage = 450, duration = 150, rangeFall = 0.5, timeFall = 0.5},
	tllaether_thermite_bomb = { radius = 64, damage = 900, duration = 150, rangeFall = 0.5, timeFall = 0.5},

	--junos
	ajuno_juno_pulse = { radius = 950, damage = 0, duration = 660, rangeFall = 0.8, timeFall = 0.1, scoutDmg = 60},
	cjuno_juno_pulse = { radius = 950, damage = 0, duration = 660, rangeFall = 0.8, timeFall = 0.1, scoutDmg = 60},
	tlljuno_juno_pulse = { radius = 950, damage = 0, duration = 660, rangeFall = 0.8, timeFall = 0.1, scoutDmg = 60},
	
	--mortor_canon
	amortor_mortor_cannon =  { radius = 95, damage = 200, duration = 120, rangeFall = 0.25, timeFall = 0.5, allyScale = 0.25, teamScale = 0.25},
	cmortor_mortor_cannon =  { radius = 95, damage = 200, duration = 120, rangeFall = 0.25, timeFall = 0.5, allyScale = 0.25, teamScale = 0.25},
	tllmortor_mortor_cannon =  { radius = 95, damage = 200, duration = 120, rangeFall = 0.25, timeFall = 0.5, allyScale = 0.25, teamScale = 0.25},

}

-- radius		- defines size of sphereical area in which damage is dealt
-- damage		- maximun damage over 1 second that can be dealt to a unit
-- duration		- how long the area damage stays around for (in frames)
-- rangeFall	- the proportion of damage not dealt increases linearly with distance from 0 to rangeFall at the radius
-- timeFall		- the proportion of damage not dealt increases linearly with elapsed time from 0 to timeFall at the duration

local presets = {
	--module_napalmgrenade = { radius = 256, damage = 20, duration = 1400, rangeFall = 0.6, timeFall = 0.5 },
}

------------------------
-- Send the Config

for name,data in pairs(WeaponDefNames) do
	if data.customParams.areadamage_preset then
		weapons[name] = Spring.Utilities.CopyTable(presets[data.customParams.areadamage_preset])
	end
	if weapons[name] then
		weapons[name].damage = weapons[name].damage *DAMAGE_PERIOD/30
		weapons[name].timeLoss = weapons[name].damage*weapons[name].timeFall*DAMAGE_PERIOD/weapons[name].duration
		array[data.id] = weapons[name]
	end
end

return DAMAGE_PERIOD, array
