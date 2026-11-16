local Sounds = {
	SoundItems = {
		--IncomingChat = {
		--	file = "sounds/ui/beep4.wav",
		--	in3d = "false",
		--},
		MultiSelect = {
			file = "sounds/ui/multiselect.wav",
			in3d = "false",
		},
		MapPoint = {
			file = "sounds/ui/mappoint.wav",	-- file now equal as blank.wav, is being called by chat ui widget now (so users can adjust its volume)
			--rolloff = 0.1,
			--dopplerscale = 0,
			in3d = "false",
		},
		FailedCommand = {
			file = "sounds/replies/cantdo4.wav",
		},
	},
}

--[[ Add sound entries for directory sounds/some-directory/ using the following format:
	['some-directory'] = {
		gain = 0.8,
		maxconcurrent = 1,
		rolloff = 0,
	},

	Compound directories can be used e.g. sound/some-directory/other-directory
	['some-directory/other-directory'] = {

	For attributes that use custom values per sound file:
	gain = {
		default = 0.5,
		custom = {
			['^beamershot2$'] = 0.4,
			['^lasr'] = 0.1,
		},
	},

	Key name is used in string:match for sound file name
	^example$	- exact match whole file name
	^exam		- match any file starting with "exam"
]]
local soundData = {
	-- UI SOUNDS
	['ui'] = {
		gain = {
			default = 0.8, 
			custom = {
				["warning2"] = 0.3
			},
		},
		pitchmod = 0,
		gainmod  = 0,
		dopplerscale = 0,
		maxconcurrent = 1,
		--priority = 1,
		rolloff = 0,
	},
	-- UNDERWATER
	['uw'] = {
		gain = 1.2 * 0.3,
		pitchmod = 0.17,
		gainmod  = 0.2 * 0.3,
		dopplerscale = 0,
		maxconcurrent = 8,
		--priority = 1,
		rolloff = 0.1,
	},

	['weapons-BeamLaser'] = {
		gain = { 
			default = 1.2 * 0.3, 
			custom = {
				['^beamershot2$'] = 0.5 * 0.3,
				['^lasfirerc$'] = 0.06 * 0.3,
				['^heatray'] = 1.0,
				['^heatray3'] = 0.04 * 0.3,
				['pulselaser-2'] = 0.3,
				['pulselaser-3'] = 0.3,
				['pulselaser-4'] = 0.3,
				['pulselaser-5'] = 0.3,
				['pulselaser-6'] = 0.3,
				['laser_lvl1'] = 0.8,
				['laser_lvl2'] = 0.8,
				['laser_lvl3'] = 0.8,
				['Lasrhvy2'] = 0.2,
			},
		},
		pitchmod = {
			default = 0.17,
			custom = {
				['^annigun1'] = 0.20,
				['^heliosfire$'] = 0.03,
				['^beamershot2$'] = 0.04,
				['^lasfirerc$'] = 0.06,
				['^heatray'] = 0.05,
				['^heatray3'] = 0.04,
				['^pulselaser-1'] = 0.3,
				['^pulselaser-2'] = 0.3,
				['pulselaser-4'] = 0.1,
				['pulselaser-5'] = 0.1,
				['pulselaser-6'] = 0.1,
				['laser_level1'] = 0.3,
				['laser_level2'] = 0.3,
				['laser_level3'] = 0.2,
			},
		},
	},

	-- BOMB SOUNDS / More maxconcurrent
	['weapons-AircraftBombs'] = {
		gain = 1.2 * 0.3,
		pitchmod = 0.27,
		gainmod  = 0.2 * 0.3,
		dopplerscale = 1.0,
		maxconcurrent = 32,
		rolloff = 1.1,
	},

	['weapons-Cannon'] = {
		gain = {
			default = 1.0 * 0.3,
			custom = {
				['gauss5'] = 0.5,
				['lbx1'] = 0.2
			},
		},
		pitchmod = {
			default = 0.33,
			custom = {
				["gauss_lvl"] = 0.05,
			} 
		},
		gainmod  = 0.1 * 0.3,
		dopplerscale = {
			default = 2.0, 
			custom = {
				['^gauss'] = 2.5
			},
		},
		maxconcurrent = 64,
		rolloff = 0.2,
	},

	['weapons-MissileLauncher'] = {
		gain = 1.0 * 0.3,
		pitchmod = 0.33,
		gainmod  = 0.1 * 0.3,
		dopplerscale = 1.0,
		maxconcurrent = 128,
		rolloff = 0.2,
	},

	['weapons-Flame'] = {
		gain = 1.0 * 0.3,
		pitchmod = 0.33,
		gainmod  = 0.1 * 0.3,
		dopplerscale = 1.0,
		maxconcurrent = 8,
		rolloff = 0.2,
	},

	['weapons-LaserCannon'] ={
		gain = 1.0 * 0.3,
		pitchmod = 0.05,
		gainmod  = 0.1 * 0.3,
		dopplerscale = 1.0,
		maxconcurrent = 64,
		rolloff = 0.2,
	},

	['weapons-LightningCannon'] = {
		gain = {
			default = 0.8 * 0.3,
			custom = {
				lppc1 = 0.1,
			},
		},
		pitchmod = {
			default = 0.05, 
			custom = {
				lppc1 = 0.10,
				hppc3 = 0.10,
			},
		},
		gainmod  = 0.1 * 0.3,
		dopplerscale = 1.0,
		maxconcurrent = 64,
		rolloff = 0.2,
	},

	['weapons-Rifle'] = {
		gain = 1.0 * 0.3,
		pitchmod = 0,
		gainmod  = 0.1 * 0.3,
		dopplerscale = 1.0,
		maxconcurrent = 8,
		rolloff = 0.2,
	},

	['weapons-StarburstLauncher'] = {
		gain = 1.0 * 0.3,
		pitchmod = 0,
		gainmod  = 0.1 * 0.3,
		dopplerscale = 1.0,
		maxconcurrent = 8,
		rolloff = 0.2,
	},

	['weapons-Torpedoes'] = {
		gain = 1.0 * 0.3,
		pitchmod = 0,
		gainmod  = 0.1 * 0.3,
		dopplerscale = 1.0,
		maxconcurrent = 8,
		rolloff = 0.2,
	},

	-- RAPTOR SOUNDS
	['chickens'] = {
		gain = 1.2 * 0.5,
		pitchmod = {
			default = 0.23,
			custom = {
				['^talonattack$'] = 0.07
			},
		},
		gainmod  = 0.2 * 0.3,
		dopplerscale = 1.0,
		maxconcurrent = 6,
		rolloff = 1.1,
	},


	-- REPLY SOUNDS
	['replies'] = {
		gain = 0.05,
		pitchmod = 0.05,
		gainmod  = 0.2 * 0.3,
		dopplerscale = 0,
		maxconcurrent = 32,
		rolloff = 0.05,
		priority = 1,
		--in3d = false,
	},


	-- AIR UNIT MOVEMENT SOUNDS
	['movement-air'] = {
		gain = 1.2 * 0.3,
		pitchmod = 0.02,
		gainmod  = 0.2 * 0.3,
		dopplerscale = 0,
		maxconcurrent = 2,
		rolloff = 0.1,
		priority = 1,
		--in3d = false,
	},

	-- LAND UNIT MOVEMENT SOUNDS
	['movement'] = {
		gain = 1.2 * 0.3,
		pitchmod = { 
			default = 0.1, 
		custom = {
			["'varmmove"] = 0, 
			}
		},
		gainmod  = 0.2 * 0.3,
		dopplerscale = 0,
		maxconcurrent = 2,
		rolloff = 0.1,
		priority = 1,
		--in3d = false,
	},

	-- UNIT FUNCTION/WEAPON SOUNDS
	['function'] = {
		gain = 1.2 * 0.3,
		pitchmod = 0.02,
		gainmod  = 0.2 * 0.3,
		dopplerscale = 0,
		maxconcurrent = 7,
		rolloff = 0.1,
		priority = 1,
		--in3d = false,
	},

	-- BUILDING FUNCTION/WEAPON SOUNDS
	['buildings'] = {
		gain = 0.2,
		pitchmod = 0.08,
		gainmod  = 0.2 * 0.3,
		dopplerscale = 0,
		maxconcurrent = 2,
		rolloff = 0.1,
		priority = 1,
		--in3d = false,
	},
	-- UI COMMANDS SOUNDS
	['commands'] = {
		gain = 1.2 * 0.3,
		pitchmod = 0.02,
		gainmod  = 0.2 * 0.3,
		dopplerscale = 0,
		maxconcurrent = 32,
		rolloff = 0,
		priority = 1,
		--in3d = false,
	},

	['explosions'] = {
		gain = 1.2 * 0.3,
		pitchmod = {
			default = 0.17,
			custom = {
				['^lrpcshot'] = 0.12,
				['^xplosml'] = 0.22,
				['^xplomed'] = 0.25,
				['^xplolrg'] = 0.3,
				['^nukelaunch$'] = 0.08,
				['^nukelaunchalarm$'] = 0,
			},
		},
		gainmod  = 0.2 * 0.3,
		maxconcurrent = {
			default = 32,
			custom = {
				['^minigun'] = 12,
			},
		},
		dopplerscale = 1.0,
		rolloff = 1.4,
	},

}

local function loadSoundFiles(directory, soundAttributes)
	local soundFiles = VFS.DirList(directory)

	for _, fileName in ipairs(soundFiles) do
		local soundName = string.sub(fileName, string.len(directory) + 1, string.find(fileName, ".wav") -1)
		Sounds.SoundItems[soundName] = {}
		Sounds.SoundItems[soundName].file = fileName

		local value
		for attribute, attributeValue in pairs(soundAttributes) do
			if type(attributeValue) ~= "table" then
				value = attributeValue
			else
				value = attributeValue.default

				for soundMatchPattern, customValue in pairs(attributeValue.custom) do
					if soundName:match(soundMatchPattern) then
						value = customValue
					end
				end
			end

			Sounds.SoundItems[soundName][attribute] = value
		end
	end
end

for directory, attributes in pairs(soundData) do
	loadSoundFiles('sounds/' .. directory .. '/', attributes)
end

return Sounds
