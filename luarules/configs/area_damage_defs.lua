local array = {}

local DAMAGE_PERIOD = 10 -- how often damage is applied

local weapons = {

	-- Acid
	tllacid_acidrain_rocket = { radius = 400, damage = 100, duration = 625, rangeFall = 0.6, timeFall = 0.5},

	-- Thermite Fire
	thermite_mine = { radius = 64, damage = 500, duration = 150, rangeFall = 0.5, timeFall = 0.5},

	tllnaja_thermite_barrage = { radius = 64, damage = 500, duration = 150, rangeFall = 0.5, timeFall = 0.5},
	tllsaurus_thermite_barrage = { radius = 64, damage = 500, duration = 150, rangeFall = 0.5, timeFall = 0.5},

	tllaether_thermite_bomb = { radius = 64, damage = 900, duration = 150, rangeFall = 0.5, timeFall = 0.5},

	-- Small Rockets Thermite
	tllhtml_thermite_barrage = { radius = 48, damage = 250, duration = 150, rangeFall = 0.5, timeFall = 0.5},
	tllpterodactyl_thermite_barrage = { radius = 48, damage = 250, duration = 150, rangeFall = 0.5, timeFall = 0.5},
	tllleopard_thermite_barrage = { radius = 48, damage = 250, duration = 150, rangeFall = 0.5, timeFall = 0.5},

	--junos
	ajuno_juno_pulse = { radius = 750, damage = 0, duration = 660, rangeFall = 0.8, timeFall = 0.1, scoutDmg = 10},
	cjuno_juno_pulse = { radius = 750, damage = 0, duration = 660, rangeFall = 0.8, timeFall = 0.1, scoutDmg = 10},
	tlljuno_juno_pulse = { radius = 750, damage = 0, duration = 660, rangeFall = 0.8, timeFall = 0.1, scoutDmg = 10},
	talon_juno_juno_pulse = { radius = 750, damage = 0, duration = 660, rangeFall = 0.8, timeFall = 0.1, scoutDmg = 10},
	gok_juno_juno_pulse = { radius = 750, damage = 0, duration = 660, rangeFall = 0.8, timeFall = 0.1, scoutDmg = 10},
	rumad_juno_juno_pulse = { radius = 750, damage = 0, duration = 660, rangeFall = 0.8, timeFall = 0.1, scoutDmg = 10},

	--Blue Light Explosion
	tllleopard_mortor_cannon =  { radius = 95, damage = 250, duration = 140, rangeFall = 0.25, timeFall = 0.5, allyScale = 0.25, teamScale = 0.25},
	tllhailstorm_rapid_cannon =  { radius = 95, damage = 250, duration = 140, rangeFall = 0.25, timeFall = 0.5, allyScale = 0.25, teamScale = 0.25},
	tllriot_tllriot_cannon = { radius = 75, damage = 200, duration = 70, rangeFall = 0.25, timeFall = 0.5, allyScale = 0.5},

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
