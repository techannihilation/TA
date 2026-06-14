function widget:GetInfo()
	return {
		name = "Final Boss HUD",
		desc = "Shows final boss countdown and status",
		author = "Codex",
		date = "2026-06-13",
		license = "GNU GPL, v2 or later",
		layer = 50,
		enabled = true,
	}
end

local spGetGameFrame = Spring.GetGameFrame
local spGetGameRulesParam = Spring.GetGameRulesParam
local spIsGUIHidden = Spring.IsGUIHidden
local spGetViewGeometry = Spring.GetViewGeometry

local glColor = gl.Color
local glGetTextWidth = gl.GetTextWidth
local glRect = gl.Rect
local glText = gl.Text

local FRAMES_PER_SECOND = 30
local DEAD_DISPLAY_FRAMES = 60 * FRAMES_PER_SECOND
local SHIELD_ALERT_FRAMES = 6 * FRAMES_PER_SECOND

local STATE_FIGHT = 1
local STATE_FORCED_MOVE = 2
local STATE_DEAD = 3

local ATTACKER_UNKNOWN = 0
local ATTACKER_COMMANDER = 1
local ATTACKER_AIR = 2
local ATTACKER_NAVAL = 3
local ATTACKER_STATIC = 4
local ATTACKER_ARTILLERY = 5
local ATTACKER_BUILDER = 6
local ATTACKER_GROUND = 7

local vsx, vsy = spGetViewGeometry()
local deadSeenFrame
local LINE_ROTATE_FRAMES = 8 * FRAMES_PER_SECOND
local COUNTDOWN_CLOSE_FRAMES = 5 * 60 * FRAMES_PER_SECOND
local COUNTDOWN_FINAL_FRAMES = 60 * FRAMES_PER_SECOND
local PRE_BOSS_COMMENT_VISIBLE_FRAMES = 12 * FRAMES_PER_SECOND
local SPAWN_REACTION_FRAMES = 60 * FRAMES_PER_SECOND
local HP_DAMAGED_FRACTION = 0.60
local HP_ARMORED_FRACTION = 0.30

local countdownLines = {
	"Command says this is fine.",
	"The briefing was mostly screaming.",
	"Logistics forgot to pack mercy.",
	"Air support filed a complaint.",
	"Radar found the problem. It is large.",
	"Morale is now a consumable.",
	"All plans now end at step two.",
	"The map has requested leave.",
	"Someone wake the insurance bunker.",
	"High command recommends distance.",
	"Victory condition: improvise harder.",
	"The forecast calls for heavy metal.",
	"Evacuation plan filed under optimism.",
	"Radar operators are using both hands.",
	"The bunker has entered negotiations.",
	"Command ordered calm. Nobody complied.",
	"Enemy size estimate: yes.",
	"The sirens are now singing harmony.",
	"Someone sharpen the contingency plan.",
	"Base defense requested adult supervision.",
	"The war room ran out of room.",
	"Supply says courage is backordered.",
	"Maps updated: here be problems.",
	"The manual skipped this chapter.",
	"Command is checking the warranty.",
	"Scouts report one mobile crisis.",
	"The panic button has a panic button.",
	"Defensive posture: clenched.",
	"Someone brief the crater crews.",
	"Today's password is duck.",
	"All units, hydrate and reconsider.",
	"The alarm has requested overtime.",
	"Optimism moved to reserves.",
	"High command is blinking in Morse.",
	"Threat level: expensive.",
	"Bring snacks. This may take armor.",
	"Base morale is wearing a helmet.",
	"The horizon looks armed.",
	"Stand by for motivational damage.",
	"Command has located the loud problem.",
	"The safe distance is another map.",
	"The briefing pointer melted.",
	"Strategic patience has left early.",
	"All excuses are now ammunition.",
	"The calendar says boss o'clock.",
	"Engineers deny building this one.",
	"The enemy has chosen dramatic timing.",
	"Weather report: incoming steel.",
	"Someone cancel the parade route.",
	"Readiness level: pockets empty.",
	"Command asks everyone to look busy.",
	"Fear is not a build menu item.",
	"Base defense is doing math loudly.",
	"Incoming: one unscheduled promotion test.",
	"War accountants are sweating.",
	"The sky just filed a hazard report.",
	"Confidence has been rationed.",
	"Final inspection found a boss.",
}

local countdownCloseLines = {
	"Five-minute plan: become difficult to erase.",
	"Command found the checklist. It is sweating.",
	"Last-minute courage is being distributed.",
	"Defenses are rehearsing their serious face.",
	"The countdown has stopped being polite.",
	"Everyone with a plan, please form a line.",
	"Base security has upgraded frowning.",
	"Final briefing shortened to point and yell.",
	"Evacuation math is doing theater.",
	"Command recommends tightening every bolt.",
	"The loud part is approaching schedule.",
	"Morale is being issued in small portions.",
}

local countdownFinalLines = {
	"Sixty seconds. Pretend this was intentional.",
	"Last call for heroic overconfidence.",
	"Command says breathe faster.",
	"The horizon is making eye contact.",
	"Final checks: weapons, armor, excuses.",
	"The warning label is now the plan.",
	"All units, look expensive and dangerous.",
	"Brace for unscheduled leadership training.",
	"The map is holding its breath.",
	"Countdown entering bad-decision range.",
	"Base defense, try to look surprised.",
	"Impact appointment confirmed.",
}

local preBossLineSets = {
	[ATTACKER_UNKNOWN] = {
		"The front is spending money in suspicious directions.",
		"Command is watching the expensive part of the battlefield.",
		"Something costly is arguing near the front.",
		"War accountants report active investment in future craters.",
	},
	[ATTACKER_COMMANDER] = {
		"A commander is near the front, because rank apparently blocks shells.",
		"Command presence detected close to danger. Bold or lost.",
		"The front has a commander-shaped liability with a weapon.",
		"Someone important is standing where explosions apply.",
	},
	[ATTACKER_AIR] = {
		"The most expensive front argument currently has wings.",
		"Air power is loitering near trouble with premium confidence.",
		"Pilots are turning fuel into expensive opinions.",
		"The front is being patrolled by airborne budget stress.",
	},
	[ATTACKER_NAVAL] = {
		"The front's priciest complaint is floating with guns.",
		"Naval assets are making the shoreline financially nervous.",
		"The waterline is hosting a very expensive disagreement.",
		"Fleet command has placed value near violence.",
	},
	[ATTACKER_STATIC] = {
		"Static firepower is anchoring the front with expensive stubbornness.",
		"The priciest front argument is bolted down and loud.",
		"Defensive architecture is carrying the budget today.",
		"The front has become a construction project with muzzle flash.",
	},
	[ATTACKER_ARTILLERY] = {
		"Long-range fire is making expensive comments from a careful distance.",
		"The front's richest voice speaks in delayed explosions.",
		"Artillery is converting range into financial confidence.",
		"Someone parked a costly punctuation machine near the front.",
	},
	[ATTACKER_BUILDER] = {
		"Builders near the front are making management uncomfortable.",
		"Construction assets are close enough to need combat etiquette.",
		"The front contains tools, ambition, and questionable insurance.",
		"Engineering is standing too close to the lesson.",
	},
	[ATTACKER_GROUND] = {
		"The front's most expensive ground unit is volunteering for history.",
		"Heavy ground assets are trading courage for depreciation.",
		"The priciest ground argument is close to enemy punctuation.",
		"Armored budget is moving where the map gets loud.",
	},
}

local spawnLines = {
	"The boss has arrived. It did not bring snacks.",
	"Command confirms the large problem is now local.",
	"Good news: the countdown stopped. Bad news: because it is here.",
	"The map just developed a boss-shaped scheduling conflict.",
	"All units, welcome our new terrain editor.",
	"The boss spawned and immediately lowered property values.",
	"That entrance had more budget than our army.",
	"Command says do not clap. It might hear rhythm.",
	"The boss has entered the chat with artillery punctuation.",
	"Congratulations, everyone: the warning label became interactive.",
	"Local crater crews have switched to piecework.",
	"The boss is here, and it looks disappointed in our architecture.",
	"Radar operators request a second screen and a quieter career.",
	"All plans are now considered historical documents.",
	"The boss spawned at center map because subtlety was busy.",
	"Morale asked for a transfer. Logistics lost the form.",
	"That was not a spawn animation. That was a legal threat.",
	"Command reports the boss is taller than our excuses.",
	"Base defenses are pretending this was covered in training.",
	"The boss just made the horizon fail a confidence check.",
	"Someone tell the insurance bunker to start stretching.",
	"First contact achieved. Second thoughts achieved faster.",
	"The boss is here to collect overdue panic.",
	"War accountants have upgraded the situation to very expensive.",
}

local attackerLineSets = {
	[ATTACKER_COMMANDER] = {
		spawn = {
			"The boss arrived and commanders immediately chose bad career growth.",
			"Commanders are greeting the boss with extremely personal diplomacy.",
			"The boss sees commanders and wonders why the small bosses are angry.",
		},
		fight = {
			"Commanders are poking the apocalypse with rank insignia.",
			"The boss is being lectured by walking authority problems.",
			"Commander fire detected. Ambition has entered melee range.",
		},
		damaged = {
			"Commanders made a dent. Promotions remain theoretical.",
			"The boss is damaged and blaming middle management.",
			"Commander pressure works. The paperwork will be enormous.",
		},
		armored = {
			"Armored boss says commanders need a larger argument.",
			"Advanced shields are now ignoring rank.",
			"The boss activated armor because command presence got annoying.",
		},
		forced = {
			"Commander blockers are about to learn org chart physics.",
			"The boss is walking through command authority.",
			"Commanders requested respect. The boss selected pavement.",
		},
		dead = {
			"Commanders finished the boss. The promotion paperwork is glowing.",
			"The boss was defeated by command presence and excessive firepower.",
		},
	},
	[ATTACKER_AIR] = {
		spawn = {
			"The boss spawned and aircraft started circling like nervous paperwork.",
			"Air units are already filing complaints from altitude.",
			"The boss looked up. Pilots are pretending that is fine.",
		},
		fight = {
			"Aircraft are attacking from above, where optimism is thinner.",
			"Pilots report the target is still inconveniently three-dimensional.",
			"The boss is receiving airborne criticism at unsafe speeds.",
		},
		damaged = {
			"Air strikes made dents. The boss has begun hating weather.",
			"Pilots found the hitbox and immediately got smug.",
			"The boss is damaged by aircraft and considering a roof.",
		},
		armored = {
			"Armored shields are making pilots recalculate confidence.",
			"The boss turned on armor. Air command turned on nervous laughter.",
			"Aircraft are now bombing a shield with personality issues.",
		},
		forced = {
			"The boss is ignoring air traffic control with ground confidence.",
			"Pilots requested spacing. The boss requested a straight line.",
			"Air attacks continue while the boss commutes through problems.",
		},
		dead = {
			"Aircraft finished the boss. The sky is acting casual.",
			"The boss lost to air power and a lot of nervous pilots.",
		},
	},
	[ATTACKER_NAVAL] = {
		spawn = {
			"The boss spawned and the fleet began reconsidering buoyancy.",
			"Naval guns opened up. The shoreline asked to be excluded.",
			"The boss is being welcomed by floating accountants of damage.",
		},
		fight = {
			"The fleet is shelling the boss from the wet confidence zone.",
			"Naval fire detected. The boss has discovered offshore irritation.",
			"Ships are arguing with the boss at artillery volume.",
		},
		damaged = {
			"Fleet guns made progress. The ocean is acting innocent.",
			"The boss is damaged and blaming coastal policy.",
			"Naval fire is working. The fish refuse comment.",
		},
		armored = {
			"Armored boss is now waterproofing its bad attitude.",
			"The fleet found shields. The shields found smugness.",
			"Naval fire meets advanced armor and a very rude health bar.",
		},
		forced = {
			"The boss is moving like it wants to confiscate the coastline.",
			"Naval blockers are safe only by being inconveniently wet.",
			"The boss is marching toward the fleet with beach opinions.",
		},
		dead = {
			"The fleet sank the problem without needing it to float.",
			"Naval fire defeated the boss. The shoreline is smug.",
		},
	},
	[ATTACKER_STATIC] = {
		spawn = {
			"The boss spawned and every turret remembered it has a job.",
			"Static defenses opened fire with excellent posture.",
			"The base is greeting the boss using mounted anxiety.",
		},
		fight = {
			"Turrets are explaining property rights at muzzle velocity.",
			"Static defense detected. The boss is auditing the neighborhood.",
			"The boss is being yelled at by architecture with barrels.",
		},
		damaged = {
			"Turrets made dents. The base is trying not to brag.",
			"The boss is damaged by buildings and taking it personally.",
			"Static defenses are now classified as impolite furniture.",
		},
		armored = {
			"Armored boss is arguing with the entire base layout.",
			"Turrets hit shields. Shields replied with bureaucracy.",
			"The boss activated armor against organized real estate.",
		},
		forced = {
			"The boss is walking through the zoning dispute.",
			"Static defenses cannot move. The boss respects the contrast.",
			"Architecture is losing a debate with mass.",
		},
		dead = {
			"Static defenses won. The buildings are pretending they never worried.",
			"The boss was defeated by architecture with excellent trigger discipline.",
		},
	},
	[ATTACKER_ARTILLERY] = {
		spawn = {
			"The boss spawned and artillery started writing from far away.",
			"Long-range guns are sending complaints with travel time.",
			"Artillery opened negotiations from a safe emotional distance.",
		},
		fight = {
			"Artillery is mailing explosions to the boss.",
			"The boss is being attacked by distant disagreement.",
			"Long-range fire detected. Cowardice has excellent ballistics.",
		},
		damaged = {
			"Artillery made dents. Distance remains undefeated.",
			"The boss is damaged by shells it has not personally met.",
			"Long-range pressure works. The boss is updating its address book.",
		},
		armored = {
			"Armored boss is now charging extra for indirect criticism.",
			"Artillery found shields and invented louder punctuation.",
			"Long-range fire is negotiating with advanced plating.",
		},
		forced = {
			"The boss is moving toward the return address.",
			"Artillery distance is being reviewed by angry footsteps.",
			"The boss has selected counter-battery by walking there.",
		},
		dead = {
			"Artillery finished the boss from a socially comfortable distance.",
			"The boss lost to long-range punctuation.",
		},
	},
	[ATTACKER_BUILDER] = {
		spawn = {
			"The boss spawned and builders chose violence with a side of tools.",
			"Construction crews are attacking. This is not in the manual.",
			"The boss is being challenged by units with workplace hazards.",
		},
		fight = {
			"Builders are fighting the boss. HR has left the map.",
			"Repair tools near the boss are being used with hostile intent.",
			"Construction units are applying industrial sarcasm.",
		},
		damaged = {
			"Builders made a dent. Everyone is pretending that was planned.",
			"The boss is damaged by the maintenance department.",
			"Tool-based aggression is producing measurable results.",
		},
		armored = {
			"Armored boss refuses to be renovated.",
			"Builders hit shields and requested a larger wrench.",
			"The boss activated armor against unauthorized maintenance.",
		},
		forced = {
			"The boss is walking through the worksite inspection.",
			"Builders blocking it are about to become construction material.",
			"Safety cones have failed to impress the boss.",
		},
		dead = {
			"Builders defeated the boss. Maintenance is now a combat doctrine.",
			"The boss was removed by unauthorized repair personnel.",
		},
	},
	[ATTACKER_GROUND] = {
		spawn = {
			"The boss spawned and the ground army formed a queue for regret.",
			"Ground forces opened fire with admirable poor judgment.",
			"The boss is being welcomed by tracked optimism.",
		},
		fight = {
			"Ground units are trading armor for data.",
			"The boss is being attacked by brave metal in small portions.",
			"Tanks and bots are explaining persistence loudly.",
		},
		damaged = {
			"Ground forces made dents. Nobody tell them the bill.",
			"The boss is damaged by the finest bulk courage available.",
			"Frontline pressure is working and complaining.",
		},
		armored = {
			"Armored boss is making ground fire feel underdressed.",
			"Ground units hit shields and kept arguing anyway.",
			"The boss activated armor against concentrated stubbornness.",
		},
		forced = {
			"The boss is walking through the ground army's thesis.",
			"Frontline blockers are being promoted to road texture.",
			"Ground forces requested a line. The boss made a hole.",
		},
		dead = {
			"Ground forces finished the boss by applying enough stubborn metal.",
			"The frontline defeated the boss and immediately requested repairs.",
		},
	},
}

local fightLines = {
	"Operation Walk Loudly is live.",
	"Subtlety has left the chain of command.",
	"The boss brought combined arms. All arms.",
	"Collateral damage is doing push-ups.",
	"Doctrine says shoot the glowing part.",
	"Recon reports: yes, still enormous.",
	"The frontline has become a suggestion.",
	"Fire discipline downgraded to fire enthusiasm.",
	"Command requests fewer bad ideas.",
	"The good news: it is hard to miss.",
	"The bad news: it shoots back.",
	"Tactical retreat renamed strategic cardio.",
	"Engineers are negotiating with physics.",
	"Artillery asked for a bigger calendar.",
	"The battle plan is now written in craters.",
	"This is why we label buttons.",
	"Please keep arms inside the apocalypse.",
	"Budget meeting postponed by lasers.",
	"The boss is conducting urban redesign.",
	"Enemy morale detected. Correcting.",
	"The boss is making terrain suggestions.",
	"Laser budget has entered free fall.",
	"All roads now lead to regret.",
	"The chain of command is a circle.",
	"Suppressive fire has become expressive.",
	"Combined arms? More like combined alarms.",
	"Command says flank it. With what?",
	"The boss is auditing our cover.",
	"Friendly advice: stop standing there.",
	"Armor column practicing interpretive panic.",
	"The front line moved without permission.",
	"Someone tell artillery to use paragraphs.",
	"The enemy is immune to subtle hints.",
	"Tactical doctrine now fits on a napkin.",
	"The boss has right of way.",
	"Cover is temporary. Craters are forever.",
	"Return fire, return receipts later.",
	"All units: aim for the angry part.",
	"The boss is speedrunning complaints.",
	"Command requests a smaller battlefield.",
	"The battlefield has become a meeting.",
	"Morale officer deployed under protest.",
	"That was not a warning shot.",
	"The boss brought its own soundtrack.",
	"Infantry handbook now says nope.",
	"Base layout entering modern art phase.",
	"Damage control needs damage control.",
	"The enemy has rejected our proposal.",
	"Fire support says define enough.",
	"Armor reports dents with opinions.",
	"Strategic depth reduced by lasers.",
	"Command calls this character building.",
	"The boss is testing our refund policy.",
	"All units, bravely avoid vaporization.",
	"Precision strike? It is very large.",
	"The front asked to be reassigned.",
	"Operational tempo: screaming allegro.",
	"Someone promote the repair crew.",
	"The boss has achieved local weather.",
	"War crimes department is on lunch.",
	"Covering fire is now a lifestyle.",
	"The enemy is applying pressure generously.",
	"Defensive line converted to dotted line.",
	"The boss is not respecting signage.",
	"All brave volunteers were volunteered.",
	"Command says hold. Physics disagrees.",
	"Turrets report emotional overheating.",
	"The boss is doing hostile landscaping.",
	"Ammo counters are praying in binary.",
	"Every direction is now forward.",
	"Recon confirms: still not friendly.",
	"The plan is evolving under fire.",
	"Suppress it until it becomes history.",
	"The enemy brought a thesis on violence.",
	"This is not a drill. Drills are cheaper.",
	"Command regrets the word manageable.",
	"The boss is aggressively networking.",
	"Base defenses entering jazz mode.",
	"Someone get a bigger after-action report.",
	"The frontline has filed for damages.",
	"Enemy armor class: rude.",
	"The boss skipped stealth training.",
	"Targets are easy. Surviving is advanced.",
	"The unit cap is judging us.",
	"Command says morale builds character.",
	"Character is taking splash damage.",
	"All guns: speak clearly.",
	"The boss is a mobile bad decision.",
	"Today we learn if walls believe.",
	"High command has muted the radio.",
	"The enemy has tactical confidence issues.",
	"Explosions are now part of navigation.",
	"Field repairs upgraded to field miracles.",
	"The boss is collecting no-parking fines.",
	"This battle needs a larger font.",
	"Command says excellent data point.",
	"The boss refuses to be kited politely.",
	"Retreat path under construction.",
	"All units: make it earn the drama.",
	"Victory requires fewer witnesses.",
	"The boss is debating with artillery.",
	"Keep firing until math improves.",
	"Strategic reserve found hiding.",
	"Base commander is aging in real time.",
	"The boss brought peer-reviewed danger.",
	"Someone tell the wreckage to queue.",
	"Every shell is a strongly worded memo.",
	"The enemy is overqualified.",
	"This is fine, but louder.",
	"Command found the threat assessment. It growled.",
	"All units, do not feed the boss.",
	"The boss is deleting cover alphabetically.",
	"Tactical dignity has been postponed.",
	"Radar says it is still personal.",
	"The battlefield is being rebranded.",
	"Fire control switched to enthusiastic mode.",
	"Nobody ordered extra apocalypse.",
	"Command recommends aggressive optimism.",
	"The boss is allergic to quiet.",
	"Armor crews request softer physics.",
	"All roads now require courage.",
}

local fightDamagedLines = {
	"The boss is damaged and taking notes.",
	"Visible dents detected. Confidence not advised.",
	"Command says progress counts if smoking.",
	"The boss has noticed the inconvenience.",
	"Repair crews are smiling too early.",
	"Keep firing. The health bar has opinions.",
	"Damage assessment: rude but useful.",
	"The boss is losing paint and patience.",
	"Armor crews report measurable hope.",
	"That wound made the briefing louder.",
	"The enemy is now negotiating with physics.",
	"Pressure is working. So is everything else.",
	"Command approves this statistical discomfort.",
	"The boss is still enormous, just personally offended.",
	"Halfway to history, all the way to danger.",
	"Fire control says the math is improving.",
}

local fightArmoredLines = {
	"Advanced shields online. The ego has armor.",
	"The boss got angry and upgraded its excuses.",
	"Critical phase: please annoy it professionally.",
	"The health bar found a second department.",
	"Command confirms the boss is now extra rude.",
	"Damage still counts. It just complains harder.",
	"Shield phase detected. Optimism needs armor.",
	"The boss has entered executive tantrum mode.",
	"All units, focus fire and lower expectations.",
	"That was the angry thirty percent.",
	"The boss is protecting its remaining bad ideas.",
	"Fire discipline upgraded to stubborn.",
	"Shields are up. Pride remains vulnerable.",
	"Command recommends precision and disrespect.",
	"The enemy is now mostly spite and plating.",
	"Finish it before it invents another phase.",
}

local forcedMoveLines = {
	"Pathfinding received a direct order.",
	"Traffic jam promoted to enemy combatant.",
	"The boss is done reading the room.",
	"Manual override: walk through it.",
	"Obstacles are now paperwork.",
	"Road clearance by intimidation.",
	"Formation changed to excuse me.",
	"Blocking force meets moving argument.",
	"Detour denied by command authority.",
	"The boss has selected a shortcut.",
	"Unit collision is now a rumor.",
	"Traffic control has surrendered.",
	"Pathing says no. Boss says yes.",
	"Obstacle doctrine failed inspection.",
	"The road is wherever it walks.",
	"Someone painted arrows on panic.",
	"Move order upgraded to argument.",
	"Blocking units became speed bumps.",
	"Direct route approved by mass.",
	"Navigation mode: professionally rude.",
	"Escort vehicles advised to scatter.",
	"The boss is crowdsourcing a lane.",
	"Terrain compliance is mandatory.",
	"No more polite fighting today.",
	"Queue blockers face disciplinary physics.",
	"The shortcut is through everyone.",
	"Marching orders: remove geography.",
	"Traffic jam receiving live feedback.",
	"The boss discovered shove doctrine.",
	"Pathfinding is taking notes.",
	"Roadblock status: temporary.",
	"Manual override has heavy boots.",
	"The boss is applying lane pressure.",
	"Please clear the red carpet.",
	"Formation changed to bulldozer.",
	"Obstruction report filed by wreckage.",
	"The boss is done waiting in line.",
	"Command authorizes rude movement.",
	"Route recalculated through nonsense.",
	"Personal space has been suspended.",
	"The boss is enforcing right of way.",
	"Traffic cones are not doctrine.",
	"Everything blocking is volunteering.",
	"Movement plan: occupy destination.",
	"Pathing committee overruled.",
	"Stalling tactic met larger tactic.",
	"The boss is walking off irritation.",
	"Roadwork completed by impact.",
}

local forcedMoveDamagedLines = {
	"Damaged boss chooses the direct complaint.",
	"Low patience, high mass, straight line.",
	"The boss is limping through objections.",
	"Roadblocks are testing the wrong theory.",
	"The route is now a damage report.",
	"Traffic has been selected for demolition.",
	"Movement priority: hurt feelings forward.",
	"Pathing has lost the argument again.",
}

local forcedMoveArmoredLines = {
	"Armored boss no longer accepts traffic.",
	"Shield phase has right of way.",
	"The angry plating is taking shortcuts.",
	"Obstacles are learning about commitment.",
	"Critical phase movement: through.",
	"Command marks this as hostile commuting.",
	"The boss is shoving with advanced shields.",
	"Road clearance upgraded to final warning.",
}

local deadLines = {
	"Threat neutralized. Paperwork victorious.",
	"Command claims this was the plan.",
	"The crater has been debriefed.",
	"Logistics found the receipt.",
	"Medals approved. Eyebrows pending.",
	"Enemy redesign program cancelled.",
	"The crater has accepted responsibility.",
	"Command is calling that controlled.",
	"Survivors promoted to witnesses.",
	"The boss has been downsized.",
	"Debrief scheduled after cheering.",
	"Threat assessment updated to past tense.",
	"All units may exhale tactically.",
	"Logistics requests reusable boss parts.",
	"Morale restored, mostly out of spite.",
	"The wreckage is now an objective marker.",
	"Command congratulates accidental competence.",
	"Enemy warranty successfully voided.",
	"The battlefield gets one quiet minute.",
	"Repair crews have entered denial.",
	"Someone save the good crater.",
	"Victory smells like overheated metal.",
	"High command has unmuted itself.",
	"The boss failed final inspection.",
	"Strategic screaming may now stop.",
	"Cleanup crew requests a bigger broom.",
	"All plans retroactively brilliant.",
	"The boss is now terrain decor.",
	"Medics report morale bruising only.",
	"Artillery asks if anyone saw that.",
	"The after-action report needs coffee.",
	"Command says never doubted you.",
	"The crater is being named later.",
	"Enemy morale has left the server.",
	"Budget office found the explosion.",
}

local function fmtTime(frames)
	if frames < 0 then
		frames = 0
	end
	local seconds = math.floor((frames / FRAMES_PER_SECOND) + 0.5)
	local minutes = math.floor(seconds / 60)
	seconds = seconds - (minutes * 60)
	return string.format("%02d:%02d", minutes, seconds)
end

local function pickLine(lines, frame)
	if not lines or #lines == 0 then
		return ""
	end
	local idx = (math.floor(frame / LINE_ROTATE_FRAMES) % #lines) + 1
	return lines[idx]
end

local function getCountdownLines(framesUntilSpawn)
	if framesUntilSpawn <= COUNTDOWN_FINAL_FRAMES then
		return countdownFinalLines
	end
	if framesUntilSpawn <= COUNTDOWN_CLOSE_FRAMES then
		return countdownCloseLines
	end
	return countdownLines
end

local function getPreBossLines(commentClass)
	return preBossLineSets[commentClass or ATTACKER_UNKNOWN] or preBossLineSets[ATTACKER_UNKNOWN]
end

local function getActiveLines(state, hpFraction, shieldActive, frame, actualSpawnFrame, attackerClass)
	hpFraction = hpFraction or 1
	local armored = shieldActive == 1 or hpFraction <= HP_ARMORED_FRACTION
	local damaged = hpFraction <= HP_DAMAGED_FRACTION
	local attackerLines = attackerLineSets[attackerClass or ATTACKER_UNKNOWN]
	if actualSpawnFrame and actualSpawnFrame >= 0 and frame <= (actualSpawnFrame + SPAWN_REACTION_FRAMES) then
		if attackerLines and attackerLines.spawn then
			return attackerLines.spawn
		end
		return spawnLines
	end

	if state == STATE_FORCED_MOVE then
		if attackerLines and attackerLines.forced then
			return attackerLines.forced
		end
		if armored then
			return forcedMoveArmoredLines
		end
		if damaged then
			return forcedMoveDamagedLines
		end
		return forcedMoveLines
	end

	if armored then
		if attackerLines and attackerLines.armored then
			return attackerLines.armored
		end
		return fightArmoredLines
	end
	if damaged then
		if attackerLines and attackerLines.damaged then
			return attackerLines.damaged
		end
		return fightDamagedLines
	end
	if attackerLines and attackerLines.fight then
		return attackerLines.fight
	end
	return fightLines
end

local function getDeadLines(attackerClass)
	local attackerLines = attackerLineSets[attackerClass or ATTACKER_UNKNOWN]
	if attackerLines and attackerLines.dead then
		return attackerLines.dead
	end
	return deadLines
end

local function drawPanel(x1, y1, x2, y2)
	glColor(0, 0, 0, 0.58)
	glRect(x1, y1, x2, y2)
	glColor(0.85, 0.08, 0.04, 0.92)
	glRect(x1, y2 - 3, x2, y2)
	glColor(1, 1, 1, 1)
end

local function drawFittedText(text, x, y, size, options, maxWidth)
	local fittedSize = size
	if glGetTextWidth and maxWidth and maxWidth > 0 then
		local width = glGetTextWidth(text) * fittedSize
		if width > maxWidth then
			fittedSize = math.max(10, fittedSize * (maxWidth / width))
		end
	end
	glText(text, x, y, fittedSize, options)
end

local function drawShieldAlert(frame, shieldFrame)
	if not shieldFrame or shieldFrame < 0 then
		return
	end
	local elapsed = frame - shieldFrame
	if elapsed < 0 or elapsed > SHIELD_ALERT_FRAMES then
		return
	end

	local progress = elapsed / SHIELD_ALERT_FRAMES
	local alpha = math.min(1, progress / 0.15, (1 - progress) / 0.25)
	local pulse = 0.5 + 0.5 * math.sin(elapsed * 0.35)
	local panelW = math.min(700, math.max(360, vsx - 80))
	local panelH = 108 + (8 * pulse)
	local x1 = (vsx - panelW) * 0.5
	local x2 = x1 + panelW
	local y1 = (vsy - panelH) * 0.5
	local y2 = y1 + panelH

	glColor(0, 0, 0, 0.62 * alpha)
	glRect(x1, y1, x2, y2)
	glColor(1.0, 0.12, 0.04, 0.88 * alpha)
	glRect(x1, y2 - 4, x2, y2)
	glColor(0.05, 0.75, 1.0, 0.58 * alpha)
	glRect(x1, y1, x2, y1 + 3)

	glColor(1.0, 0.18 + 0.12 * pulse, 0.08, alpha)
	drawFittedText("BOSS GOT MAD", vsx * 0.5, y2 - 43, 27 + (4 * pulse), "oc", panelW - 40)
	glColor(0.92, 0.95, 1.0, alpha)
	drawFittedText("Advanced shields online. Someone dented the expensive ego.", vsx * 0.5, y1 + 30, 15, "oc", panelW - 44)
	glColor(1, 1, 1, 1)
end

function widget:ViewResize(viewSizeX, viewSizeY)
	vsx = viewSizeX
	vsy = viewSizeY
end

function widget:DrawScreen()
	if spIsGUIHidden and spIsGUIHidden() then
		return
	end
	if spGetGameRulesParam("final_boss_enabled") ~= 1 then
		return
	end

	local frame = spGetGameFrame()
	local spawnFrame = spGetGameRulesParam("final_boss_spawn_frame") or 0
	local actualSpawnFrame = spGetGameRulesParam("final_boss_actual_spawn_frame") or -1
	local spawned = spGetGameRulesParam("final_boss_spawned") or 0
	local alive = spGetGameRulesParam("final_boss_alive") or 0
	local state = spGetGameRulesParam("final_boss_state") or 0
	local shieldFrame = spGetGameRulesParam("final_boss_shield_frame") or -1
	local shieldActive = spGetGameRulesParam("final_boss_shield_active") or 0
	local hpFraction = spGetGameRulesParam("final_boss_hp_fraction") or 1
	local attackerClass = spGetGameRulesParam("final_boss_attacker_class") or ATTACKER_UNKNOWN
	local preBossCommentFrame = spGetGameRulesParam("final_boss_pre_spawn_comment_frame") or -1
	local preBossCommentClass = spGetGameRulesParam("final_boss_pre_spawn_comment_class") or ATTACKER_UNKNOWN

	if spawned ~= 1 then
		if preBossCommentFrame < 0 or frame < preBossCommentFrame or frame > (preBossCommentFrame + PRE_BOSS_COMMENT_VISIBLE_FRAMES) then
			return
		end
	end
	if state == STATE_DEAD then
		if not deadSeenFrame then
			deadSeenFrame = frame
		end
		if frame > (deadSeenFrame + DEAD_DISPLAY_FRAMES) then
			return
		end
	else
		deadSeenFrame = nil
	end

	local panelW = math.min(430, math.max(310, vsx - 48))
	local panelH = 72
	local x2 = vsx - 24
	local x1 = x2 - panelW
	local y2 = vsy - 118
	local y1 = y2 - panelH
	local title
	local detail
	local colorPrefix = "\255\255\210\120"

	if spawned ~= 1 then
		local framesUntilSpawn = spawnFrame - frame
		title = "FINAL BOSS IN " .. fmtTime(framesUntilSpawn)
		detail = pickLine(getPreBossLines(preBossCommentClass), preBossCommentFrame)
	elseif state == STATE_DEAD or alive ~= 1 then
		title = "FINAL BOSS DESTROYED"
		detail = pickLine(getDeadLines(attackerClass), frame)
		colorPrefix = "\255\160\255\160"
	else
		title = "FINAL BOSS ACTIVE"
		detail = pickLine(getActiveLines(state, hpFraction, shieldActive, frame, actualSpawnFrame, attackerClass), frame)
		colorPrefix = "\255\255\120\90"
	end

	drawPanel(x1, y1, x2, y2)
	drawFittedText(colorPrefix .. title, x1 + 14, y2 - 27, 17, "o", panelW - 28)
	drawFittedText("\255\225\225\225" .. detail, x1 + 14, y1 + 17, 13, "o", panelW - 28)
	if alive == 1 and state ~= STATE_DEAD then
		drawShieldAlert(frame, shieldFrame)
	end
	glColor(1, 1, 1, 1)
end
