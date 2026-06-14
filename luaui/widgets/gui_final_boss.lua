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

local vsx, vsy = spGetViewGeometry()
local deadSeenFrame
local LINE_ROTATE_FRAMES = 8 * FRAMES_PER_SECOND

local countdownLines = {
	"Command says this is fine.",
	"Intel upgraded panic to policy.",
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
	"Intel says bring bigger intel.",
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
	"Intel recommends fewer windows.",
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
	"Intel admits it was worried.",
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
	local warningFrame = spGetGameRulesParam("final_boss_warning_frame") or spawnFrame
	local spawned = spGetGameRulesParam("final_boss_spawned") or 0
	local alive = spGetGameRulesParam("final_boss_alive") or 0
	local state = spGetGameRulesParam("final_boss_state") or 0
	local shieldFrame = spGetGameRulesParam("final_boss_shield_frame") or -1

	if frame < warningFrame and spawned ~= 1 then
		return
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
		title = "FINAL BOSS IN " .. fmtTime(spawnFrame - frame)
		detail = pickLine(countdownLines, frame)
	elseif state == STATE_DEAD or alive ~= 1 then
		title = "FINAL BOSS DESTROYED"
		detail = pickLine(deadLines, frame)
		colorPrefix = "\255\160\255\160"
	else
		title = "FINAL BOSS ACTIVE"
		if state == STATE_FORCED_MOVE then
			detail = pickLine(forcedMoveLines, frame)
		else
			detail = pickLine(fightLines, frame)
		end
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
