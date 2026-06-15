function widget:GetInfo()
	return {
		name = "Final Boss FX",
		desc = "Outline, ghost, and sound effects for the final boss",
		author = "Codex",
		date = "2026-06-13",
		license = "GNU GPL, v2 or later",
		layer = 5,
		enabled = true,
	}
end

local spGetAllUnits = Spring.GetAllUnits
local spGetCameraVectors = Spring.GetCameraVectors
local spGetGameSeconds = Spring.GetGameSeconds
local spGetGameRulesParam = Spring.GetGameRulesParam
local spGetUnitBasePosition = Spring.GetUnitBasePosition
local spGetUnitDefID = Spring.GetUnitDefID
local spGetUnitHeading = Spring.GetUnitHeading
local spGetUnitIsDead = Spring.GetUnitIsDead
local spGetUnitRulesParam = Spring.GetUnitRulesParam
local spGetUnitTeam = Spring.GetUnitTeam
local spIsUnitVisible = Spring.IsUnitVisible
local spPlaySoundFile = Spring.PlaySoundFile
local spValidUnitID = Spring.ValidUnitID

local glBlending = gl.Blending
local glColor = gl.Color
local glCulling = gl.Culling
local glDeleteShader = gl.DeleteShader
local glDepthTest = gl.DepthTest
local glGetShaderLog = gl.GetShaderLog
local glGetUniformLocation = gl.GetUniformLocation
local glCreateShader = gl.CreateShader
local glLighting = gl.Lighting
local glLineWidth = gl.LineWidth
local glPolygonMode = gl.PolygonMode
local glPopMatrix = gl.PopMatrix
local glPushMatrix = gl.PushMatrix
local glRotate = gl.Rotate
local glTranslate = gl.Translate
local glUniform = gl.Uniform
local glUnit = gl.Unit
local glUnitShape = gl.UnitShape
local glUseShader = gl.UseShader

local headingToDegree = 360 / 65535
local finalBossUnits = {}
local pendingUnits = {}
local ghostShader
local uTime
local uColor
local uIntensity
local uAdvanced
local uScan
local uScanDensity
local uNoise
local uFlicker
local uTear

local FINAL_BOSS_SOUND = "sounds/techa_sounds/final_boss.wav"
local FINAL_BOSS_ARMORED_SOUND = "sounds/techa_sounds/final_boss_2.wav"
local FINAL_BOSS_SOUND_VOLUME = 4
local FINAL_BOSS_ARMORED_SOUND_VOLUME = FINAL_BOSS_SOUND_VOLUME * 1.4
local FINAL_BOSS_SOUND_LOOP_SECONDS = 40 / 30
local FINAL_BOSS_SOUND_RESTART_MOVE_SQ = 700 * 700

local soundUnitID
local soundFile
local soundX
local soundZ
local soundNextAt = 0
local soundLastPlayAt = -1000

local defaultFxConfig = {
	normal = {
		outline = { enabled = true, depthMode = "off", alpha = 1, lineWidth = 1, pulseSpeed = 1, red = true, redAlpha = 1, cyan = false, cyanAlpha = 1, green = false, greenAlpha = 1 },
		ghost = { enabled = true, depthMode = "lequal", alpha = 1, offset = 1, jitterSpeed = 1, redPass = true, redAlpha = 1, cyanPass = true, cyanAlpha = 1, yellowPass = false, yellowAlpha = 1, purplePass = false, purpleAlpha = 1 },
		shader = { enabled = true, intensity = 1, scan = 1, scanDensity = 1, noise = 1, flicker = 1, tear = 0 },
	},
	armored = {
		outline = { enabled = true, depthMode = "off", alpha = 2.7892561, lineWidth = 0.65289259, pulseSpeed = 1, red = true, redAlpha = 0.04958677, cyan = true, cyanAlpha = 0, green = true, greenAlpha = 0.08677686 },
		ghost = { enabled = true, depthMode = "less", alpha = 0.80578512, offset = 0.82644629, jitterSpeed = 0.64462811, redPass = true, redAlpha = 0.30991736, cyanPass = true, cyanAlpha = 0.57024789, yellowPass = true, yellowAlpha = 1.95867777, purplePass = true, purpleAlpha = 1.02892566 },
		shader = { enabled = true, intensity = 2.06611562, scan = 1.21487594, scanDensity = 5.69999981, noise = 0.39669418, flicker = 0.27272728, tear = 0 },
	},
}

local depthModes = {
	less = GL.LESS,
	lequal = GL.LEQUAL,
	equal = GL.EQUAL,
	greater = GL.GREATER,
	gequal = GL.GEQUAL,
	notequal = GL.NOTEQUAL,
	always = GL.ALWAYS,
	never = GL.NEVER,
}

local function cfgValue(config, group, key, fallback)
	local groupConfig = config and config[group]
	local value = groupConfig and groupConfig[key]
	if value == nil then
		return fallback
	end
	return value
end

local function phaseConfig(advanced)
	local root = WG and WG.finalBossDevFxConfig
	local phase = advanced and "armored" or "normal"
	local config = root and root[phase]
	return config or defaultFxConfig[phase]
end

local function applyDepthMode(mode)
	if mode == "off" or not mode then
		glDepthTest(false)
		return
	end
	local depthMode = depthModes[mode]
	if depthMode then
		glDepthTest(depthMode)
	else
		glDepthTest(false)
	end
end

local function isFinalBossUnit(unitID)
	return (spGetUnitRulesParam(unitID, "final_boss") or 0) == 1
end

local function isShieldActive(unitID)
	return (spGetUnitRulesParam(unitID, "final_boss_shield_active") or 0) == 1
end

local function isAdvancedFxPhase(unitID)
	if spGetGameRulesParam and spGetGameRulesParam("final_boss_devmode") == 1 and WG then
		if WG.finalBossDevFxPreviewPhase == "normal" then
			return false
		end
		if WG.finalBossDevFxPreviewPhase == "armored" then
			return true
		end
	end
	return isShieldActive(unitID)
end

local function trackUnit(unitID, unitDefID, unitTeam)
	if not unitID then
		return
	end
	if spValidUnitID and not spValidUnitID(unitID) then
		finalBossUnits[unitID] = nil
		pendingUnits[unitID] = nil
		return
	end
	if isFinalBossUnit(unitID) then
		finalBossUnits[unitID] = {
			defID = unitDefID or (spGetUnitDefID and spGetUnitDefID(unitID)),
			teamID = unitTeam or (spGetUnitTeam and spGetUnitTeam(unitID)),
		}
		pendingUnits[unitID] = nil
	else
		pendingUnits[unitID] = true
	end
end

local function compileGhostShader()
	if not glCreateShader then
		return
	end
	local shader = glCreateShader({
		vertex = [[
			#version 120
			void main() {
				gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
			}
		]],
		fragment = [[
			#version 120
			uniform float uTime;
			uniform vec4 uColor;
			uniform float uIntensity;
			uniform float uAdvanced;
			uniform float uScan;
			uniform float uScanDensity;
			uniform float uNoise;
			uniform float uFlicker;
			uniform float uTear;

			float hash(vec2 p) {
				return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453123);
			}

			void main() {
				vec2 fc = gl_FragCoord.xy;
				float scanNormal = 0.85 + 0.15 * sin(fc.y * 0.35 * uScanDensity + uTime * 12.0);
				float noiseNormal = hash(fc * 0.5 + uTime) * 0.35;
				float flickerNormal = 0.85 + 0.15 * sin(uTime * 40.0 + fc.x * 0.02);
				float scanAdvanced = 0.70 + 0.30 * sin(fc.y * 0.55 * uScanDensity + uTime * 24.0);
				float noiseAdvanced = hash(fc * 0.65 + uTime * 2.0) * 0.55;
				float tear = step(0.88, hash(vec2(floor(fc.y * 0.08), floor(uTime * 18.0)))) * 0.45 * uAdvanced * uTear;
				float flickerAdvanced = 0.72 + 0.28 * sin(uTime * 75.0 + fc.x * 0.035);
				float scan = mix(scanNormal, scanAdvanced, uAdvanced);
				float noise = mix(noiseNormal, noiseAdvanced, uAdvanced) * uNoise;
				float flicker = mix(flickerNormal, flickerAdvanced, uAdvanced);
				scan = 1.0 + ((scan - 1.0) * uScan);
				flicker = 1.0 + ((flicker - 1.0) * uFlicker);
				float alpha = uColor.a * scan * flicker * (0.85 + noise + tear) * uIntensity;
				gl_FragColor = vec4(uColor.rgb, alpha);
			}
		]],
		uniform = {
			uTime = 0,
			uColor = { 1, 1, 1, 1 },
			uIntensity = 1,
			uAdvanced = 0,
			uScan = 1,
			uScanDensity = 1,
			uNoise = 1,
			uFlicker = 1,
			uTear = 1,
		},
	})

	if not shader then
		Spring.Echo("Final Boss FX: ghost shader compile failed:", glGetShaderLog and glGetShaderLog() or "")
		return
	end

	ghostShader = shader
	uTime = glGetUniformLocation(shader, "uTime")
	uColor = glGetUniformLocation(shader, "uColor")
	uIntensity = glGetUniformLocation(shader, "uIntensity")
	uAdvanced = glGetUniformLocation(shader, "uAdvanced")
	uScan = glGetUniformLocation(shader, "uScan")
	uScanDensity = glGetUniformLocation(shader, "uScanDensity")
	uNoise = glGetUniformLocation(shader, "uNoise")
	uFlicker = glGetUniformLocation(shader, "uFlicker")
	uTear = glGetUniformLocation(shader, "uTear")
end

local function drawUnit(unitID, defID, teamID)
	if glUnit then
		glUnit(unitID, true)
		return
	end
	if not glUnitShape then
		return
	end
	local x, y, z = spGetUnitBasePosition(unitID)
	if not x then
		return
	end
	local heading = spGetUnitHeading(unitID) or 0
	glPushMatrix()
		glTranslate(x, y, z)
		glRotate(heading * headingToDegree, 0, 1, 0)
		glUnitShape(defID, teamID, true)
	glPopMatrix()
end

local function drawBossOutline(unitID, defID, teamID, time, advanced)
	local config = phaseConfig(advanced)
	if not cfgValue(config, "outline", "enabled", true) then
		return
	end
	local alphaMult = cfgValue(config, "outline", "alpha", 1)
	local lineMult = cfgValue(config, "outline", "lineWidth", 1)
	local pulseSpeed = cfgValue(config, "outline", "pulseSpeed", 1)
	local drawRed = cfgValue(config, "outline", "red", true)
	local drawCyan = cfgValue(config, "outline", "cyan", advanced)
	local drawGreen = cfgValue(config, "outline", "green", false)
	local redAlpha = cfgValue(config, "outline", "redAlpha", 1)
	local cyanAlpha = cfgValue(config, "outline", "cyanAlpha", 1)
	local greenAlpha = cfgValue(config, "outline", "greenAlpha", 1)
	local depthMode = cfgValue(config, "outline", "depthMode", "off")
	if not drawRed and not drawCyan and not drawGreen then
		return
	end

	if not advanced then
		local pulse = 0.5 + 0.5 * math.sin(time * 4 * pulseSpeed + unitID * 0.01)
		local alpha = ((0.1 + 0.2 * pulse) / 4) * alphaMult
		local shift = pulse / 2

		applyDepthMode(depthMode)
		glBlending(GL.SRC_ALPHA, GL.ONE)
		glPolygonMode(GL.FRONT_AND_BACK, GL.LINE)
		if glLighting then glLighting(false) end
		if glCulling then glCulling(false) end

		if drawRed then
			glLineWidth(1.0 * lineMult)
			glColor(1.0, 0.35 * shift, 0.10 * shift, alpha * redAlpha)
			drawUnit(unitID, defID, teamID)
		end
		if drawCyan then
			glLineWidth(1.0 * lineMult)
			glColor(0.05, 0.75, 1.0, alpha * 0.7 * cyanAlpha)
			drawUnit(unitID, defID, teamID)
		end
		if drawGreen then
			glLineWidth(1.0 * lineMult)
			glColor(0.05, 1.0, 0.28, alpha * 0.85 * greenAlpha)
			drawUnit(unitID, defID, teamID)
		end

		glLineWidth(1.0)
		glPolygonMode(GL.FRONT_AND_BACK, GL.FILL)
		glBlending(GL.SRC_ALPHA, GL.ONE_MINUS_SRC_ALPHA)
		glDepthTest(false)
		glColor(1, 1, 1, 1)
		return
	end

	local pulse = 0.5 + 0.5 * math.sin(time * 7 * pulseSpeed + unitID * 0.01)
	local alpha = (0.16 + 0.20 * pulse) * alphaMult
	local shift = 0.55 + 0.45 * pulse

	applyDepthMode(depthMode)
	glBlending(GL.SRC_ALPHA, GL.ONE)
	glPolygonMode(GL.FRONT_AND_BACK, GL.LINE)
	if glLighting then glLighting(false) end
	if glCulling then glCulling(false) end

	if drawRed then
		glLineWidth(2.4 * lineMult)
		glColor(1.0, 0.18 * shift, 0.02, alpha * redAlpha)
		drawUnit(unitID, defID, teamID)
	end
	if drawCyan then
		glLineWidth(1.1 * lineMult)
		glColor(0.05, 0.75, 1.0, alpha * 0.7 * cyanAlpha)
		drawUnit(unitID, defID, teamID)
	end
	if drawGreen then
		glLineWidth(1.5 * lineMult)
		glColor(0.05, 1.0, 0.28, alpha * 0.85 * greenAlpha)
		drawUnit(unitID, defID, teamID)
	end

	glLineWidth(1.0)
	glPolygonMode(GL.FRONT_AND_BACK, GL.FILL)
	glBlending(GL.SRC_ALPHA, GL.ONE_MINUS_SRC_ALPHA)
	glDepthTest(false)
	glColor(1, 1, 1, 1)
end

local function drawGhostPass(unitID, defID, teamID, time, r, g, b, alpha, offsetX, offsetY, offsetZ)
	if ghostShader and uColor and glUniform then
		glUniform(uColor, r, g, b, alpha)
	else
		glColor(r, g, b, alpha)
	end
	glPushMatrix()
		if glUnit then
			glTranslate(offsetX, offsetY, offsetZ)
			drawUnit(unitID, defID, teamID)
		else
			local x, y, z = spGetUnitBasePosition(unitID)
			if x and glUnitShape then
				glTranslate(x + offsetX, y + offsetY, z + offsetZ)
				local heading = spGetUnitHeading(unitID) or 0
				glRotate(heading * headingToDegree, 0, 1, 0)
				glUnitShape(defID, teamID, true)
			end
		end
	glPopMatrix()
end

local function drawFinalBossGhost(unitID, defID, teamID, time, advanced)
	local config = phaseConfig(advanced)
	if not cfgValue(config, "ghost", "enabled", true) then
		return
	end
	local alphaMult = cfgValue(config, "ghost", "alpha", 1)
	local offsetMult = cfgValue(config, "ghost", "offset", 1)
	local verticalOffset = 0.1
	local jitterSpeed = cfgValue(config, "ghost", "jitterSpeed", 1)
	local drawRed = cfgValue(config, "ghost", "redPass", true)
	local drawCyan = cfgValue(config, "ghost", "cyanPass", true)
	local drawYellow = cfgValue(config, "ghost", "yellowPass", advanced)
	local drawPurple = cfgValue(config, "ghost", "purplePass", advanced)
	local redAlpha = cfgValue(config, "ghost", "redAlpha", 1)
	local cyanAlpha = cfgValue(config, "ghost", "cyanAlpha", 1)
	local yellowAlpha = cfgValue(config, "ghost", "yellowAlpha", 1)
	local purpleAlpha = cfgValue(config, "ghost", "purpleAlpha", 1)
	local depthMode = cfgValue(config, "ghost", "depthMode", "off")
	if not drawRed and not drawCyan and not drawYellow and not drawPurple then
		return
	end

	local cam = spGetCameraVectors and spGetCameraVectors() or nil
	local rightX, rightZ = 1, 0
	if cam and cam.right then
		rightX = cam.right[1] or 1
		rightZ = cam.right[3] or 0
	end
	local jitter
	local offset
	local pulse
	local alpha
	if advanced then
		jitter = (math.sin(time * 28.0 * jitterSpeed) * 0.5) + (math.sin(time * 67.0 * jitterSpeed + 1.3) * 0.5)
		offset = (20.0 + (14.0 * jitter)) * offsetMult
		pulse = 0.5 + 0.5 * math.sin(time * 5.4)
		alpha = (0.20 + 0.18 * pulse) * alphaMult
	else
		jitter = (math.sin(time * 18.0 * jitterSpeed) * 0.5) + (math.sin(time * 41.0 * jitterSpeed + 1.3) * 0.5)
		offset = (10.0 + (6.0 * jitter)) * offsetMult
		pulse = 0.5 + 0.5 * math.sin(time * 2.7)
		alpha = (0.14 + 0.12 * pulse) * alphaMult
	end
	local dx = rightX * offset
	local dz = rightZ * offset
	local useShader = ghostShader and cfgValue(config, "shader", "enabled", true)

	applyDepthMode(depthMode)
	glBlending(GL.SRC_ALPHA, GL.ONE)
	if useShader then
		glUseShader(ghostShader)
		if uTime and glUniform then glUniform(uTime, time) end
		if uIntensity and glUniform then glUniform(uIntensity, (advanced and 1.55 or 1.0) * cfgValue(config, "shader", "intensity", 1)) end
		if uAdvanced and glUniform then glUniform(uAdvanced, advanced and 1 or 0) end
		if uScan and glUniform then glUniform(uScan, cfgValue(config, "shader", "scan", 1)) end
		if uScanDensity and glUniform then glUniform(uScanDensity, cfgValue(config, "shader", "scanDensity", 1)) end
		if uNoise and glUniform then glUniform(uNoise, cfgValue(config, "shader", "noise", 1)) end
		if uFlicker and glUniform then glUniform(uFlicker, cfgValue(config, "shader", "flicker", 1)) end
		if uTear and glUniform then glUniform(uTear, cfgValue(config, "shader", "tear", advanced and 1 or 0)) end
	end

	if drawRed then
		drawGhostPass(unitID, defID, teamID, time, 1.0, 0.10, 0.05, alpha * redAlpha, dx, verticalOffset, dz)
	end
	if drawCyan then
		drawGhostPass(unitID, defID, teamID, time, 0.15, 0.75, 1.0, alpha * cyanAlpha, -dx, verticalOffset, -dz)
	end
	if drawYellow then
		drawGhostPass(unitID, defID, teamID, time, 1.0, 0.85, 0.10, alpha * 0.55 * yellowAlpha, dz * 0.45, verticalOffset, -dx * 0.45)
	end
	if drawPurple then
		drawGhostPass(unitID, defID, teamID, time, 0.65, 0.05, 1.0, alpha * 0.45 * purpleAlpha, -dz * 0.35, verticalOffset, dx * 0.35)
	end

	if useShader then
		glUseShader(0)
	end
	glBlending(GL.SRC_ALPHA, GL.ONE_MINUS_SRC_ALPHA)
	glDepthTest(false)
	glColor(1, 1, 1, 1)
end

local function firstTrackedBoss()
	for unitID in pairs(finalBossUnits) do
		return unitID
	end
	return nil
end

function widget:Initialize()
	compileGhostShader()
	if spGetAllUnits then
		local units = spGetAllUnits()
		if units then
			for i = 1, #units do
				trackUnit(units[i])
			end
		end
	end
end

function widget:Shutdown()
	if ghostShader and glDeleteShader then
		glDeleteShader(ghostShader)
	end
	ghostShader = nil
	soundUnitID = nil
	soundFile = nil
	soundNextAt = 0
end

function widget:UnitCreated(unitID, unitDefID, unitTeam)
	trackUnit(unitID, unitDefID, unitTeam)
end

function widget:UnitDestroyed(unitID)
	finalBossUnits[unitID] = nil
	pendingUnits[unitID] = nil
	if unitID == soundUnitID then
		soundUnitID = nil
		soundFile = nil
		soundNextAt = 0
	end
end

function widget:GameFrame(frame)
	if (frame % 15) ~= 0 then
		return
	end
	if (frame % 90) == 0 and spGetAllUnits then
		local units = spGetAllUnits()
		if units then
			for i = 1, #units do
				trackUnit(units[i])
			end
		end
	end
	for unitID in pairs(pendingUnits) do
		if spValidUnitID and not spValidUnitID(unitID) then
			pendingUnits[unitID] = nil
		elseif spGetUnitIsDead and spGetUnitIsDead(unitID) then
			pendingUnits[unitID] = nil
		else
			trackUnit(unitID)
		end
	end
end

function widget:Update(dt)
	if not spPlaySoundFile then
		return
	end
	local unitID = firstTrackedBoss()
	if not unitID or (spGetUnitIsDead and spGetUnitIsDead(unitID)) then
		soundUnitID = nil
		soundFile = nil
		soundNextAt = 0
		return
	end

	local x, y, z = spGetUnitBasePosition(unitID)
	if not x then
		return
	end
	local currentSoundFile = isAdvancedFxPhase(unitID) and FINAL_BOSS_ARMORED_SOUND or FINAL_BOSS_SOUND
	local now = spGetGameSeconds and spGetGameSeconds() or 0
	local forcePlay = false
	if soundUnitID ~= unitID then
		soundUnitID = unitID
		soundFile = currentSoundFile
		soundX = x
		soundZ = z
		forcePlay = true
	elseif soundFile ~= currentSoundFile then
		soundFile = currentSoundFile
		forcePlay = true
	elseif soundX then
		local dx = x - soundX
		local dz = z - soundZ
		if (dx * dx + dz * dz) >= FINAL_BOSS_SOUND_RESTART_MOVE_SQ then
			forcePlay = true
		end
	end
	if now >= soundNextAt then
		forcePlay = true
	end
	if forcePlay and (now - soundLastPlayAt) >= 0 then
		local currentSoundVolume = isAdvancedFxPhase(unitID) and FINAL_BOSS_ARMORED_SOUND_VOLUME or FINAL_BOSS_SOUND_VOLUME
		spPlaySoundFile(currentSoundFile, currentSoundVolume, x, y, z, "sfx")
		soundLastPlayAt = now
		soundNextAt = now + FINAL_BOSS_SOUND_LOOP_SECONDS
		soundX = x
		soundZ = z
	end
end

function widget:DrawWorld()
	local time = spGetGameSeconds and spGetGameSeconds() or 0
	for unitID, data in pairs(finalBossUnits) do
		if spValidUnitID and not spValidUnitID(unitID) then
			finalBossUnits[unitID] = nil
		elseif spGetUnitIsDead and spGetUnitIsDead(unitID) then
			finalBossUnits[unitID] = nil
		elseif spIsUnitVisible and spIsUnitVisible(unitID, 64, true) then
			local defID = data.defID or (spGetUnitDefID and spGetUnitDefID(unitID))
			local teamID = data.teamID or (spGetUnitTeam and spGetUnitTeam(unitID))
			if defID and teamID then
				local advanced = isAdvancedFxPhase(unitID)
				drawBossOutline(unitID, defID, teamID, time, advanced)
				drawFinalBossGhost(unitID, defID, teamID, time, advanced)
			end
		end
	end
end
