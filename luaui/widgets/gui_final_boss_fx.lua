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
local glBeginEnd = gl.BeginEnd
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
local glPolygonOffset = gl.PolygonOffset
local glPopMatrix = gl.PopMatrix
local glPushMatrix = gl.PushMatrix
local glRotate = gl.Rotate
local glScale = gl.Scale
local glTranslate = gl.Translate
local glUniform = gl.Uniform
local glUnit = gl.Unit
local glUnitShape = gl.UnitShape
local glUseShader = gl.UseShader
local glVertex = gl.Vertex

local headingToDegree = 360 / 65535
local finalBossUnits = {}
local pendingUnits = {}
local ghostShader
local uTime
local uColor
local uIntensity

local FINAL_BOSS_SOUND = "luaui/sounds/final_boss.wav"
local FINAL_BOSS_SOUND_VOLUME = 1.5
local FINAL_BOSS_SOUND_LOOP_SECONDS = 40 / 30
local FINAL_BOSS_SOUND_RESTART_MOVE_SQ = 700 * 700
local RING_SEGMENTS = 96

local soundUnitID
local soundX
local soundZ
local soundNextAt = 0
local soundLastPlayAt = -1000

local function isFinalBossUnit(unitID)
	return (spGetUnitRulesParam(unitID, "final_boss") or 0) == 1
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

			float hash(vec2 p) {
				return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453123);
			}

			void main() {
				vec2 fc = gl_FragCoord.xy;
				float scan = 0.70 + 0.30 * sin(fc.y * 0.55 + uTime * 24.0);
				float noise = hash(fc * 0.65 + uTime * 2.0) * 0.55;
				float tear = step(0.88, hash(vec2(floor(fc.y * 0.08), floor(uTime * 18.0)))) * 0.45;
				float flicker = 0.72 + 0.28 * sin(uTime * 75.0 + fc.x * 0.035);
				float alpha = uColor.a * scan * flicker * (0.85 + noise + tear) * uIntensity;
				gl_FragColor = vec4(uColor.rgb, alpha);
			}
		]],
		uniform = {
			uTime = 0,
			uColor = { 1, 1, 1, 1 },
			uIntensity = 1,
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

local function drawBossOutline(unitID, defID, teamID, time)
	local pulse = 0.5 + 0.5 * math.sin(time * 7 + unitID * 0.01)
	local alpha = 0.16 + 0.20 * pulse
	local shift = 0.55 + 0.45 * pulse

	glDepthTest(GL.LEQUAL)
	glBlending(GL.SRC_ALPHA, GL.ONE)
	glPolygonOffset(-35, -4)
	glPolygonMode(GL.FRONT_AND_BACK, GL.LINE)
	glLineWidth(2.4)
	if glLighting then glLighting(false) end
	if glCulling then glCulling(false) end

	glColor(1.0, 0.18 * shift, 0.02, alpha)
	drawUnit(unitID, defID, teamID)
	glLineWidth(1.1)
	glColor(0.05, 0.75, 1.0, alpha * 0.7)
	drawUnit(unitID, defID, teamID)

	glLineWidth(1.0)
	glPolygonMode(GL.FRONT_AND_BACK, GL.FILL)
	glPolygonOffset(false)
	glBlending(GL.SRC_ALPHA, GL.ONE_MINUS_SRC_ALPHA)
	glDepthTest(false)
	glColor(1, 1, 1, 1)
end

local function drawGhostPass(unitID, defID, teamID, time, r, g, b, alpha, offsetX, offsetZ)
	if ghostShader and uColor and glUniform then
		glUniform(uColor, r, g, b, alpha)
	else
		glColor(r, g, b, alpha)
	end
	glPushMatrix()
		if glUnit then
			glTranslate(offsetX, 0, offsetZ)
			drawUnit(unitID, defID, teamID)
		else
			local x, y, z = spGetUnitBasePosition(unitID)
			if x and glUnitShape then
				glTranslate(x + offsetX, y, z + offsetZ)
				local heading = spGetUnitHeading(unitID) or 0
				glRotate(heading * headingToDegree, 0, 1, 0)
				glUnitShape(defID, teamID, true)
			end
		end
	glPopMatrix()
end

local function drawFinalBossGhost(unitID, defID, teamID, time)
	local cam = spGetCameraVectors and spGetCameraVectors() or nil
	local rightX, rightZ = 1, 0
	if cam and cam.right then
		rightX = cam.right[1] or 1
		rightZ = cam.right[3] or 0
	end
	local jitter = (math.sin(time * 28.0) * 0.5) + (math.sin(time * 67.0 + 1.3) * 0.5)
	local offset = 20.0 + (14.0 * jitter)
	local dx = rightX * offset
	local dz = rightZ * offset
	local pulse = 0.5 + 0.5 * math.sin(time * 5.4)
	local alpha = 0.20 + 0.18 * pulse

	glDepthTest(GL.LEQUAL)
	glBlending(GL.SRC_ALPHA, GL.ONE)
	if ghostShader then
		glUseShader(ghostShader)
		if uTime and glUniform then glUniform(uTime, time) end
		if uIntensity and glUniform then glUniform(uIntensity, 1.55) end
	end

	drawGhostPass(unitID, defID, teamID, time, 1.0, 0.10, 0.05, alpha, dx, dz)
	drawGhostPass(unitID, defID, teamID, time, 0.15, 0.75, 1.0, alpha, -dx, -dz)
	drawGhostPass(unitID, defID, teamID, time, 1.0, 0.85, 0.10, alpha * 0.55, dz * 0.45, -dx * 0.45)
	drawGhostPass(unitID, defID, teamID, time, 0.65, 0.05, 1.0, alpha * 0.45, -dz * 0.35, dx * 0.35)

	if ghostShader then
		glUseShader(0)
	end
	glBlending(GL.SRC_ALPHA, GL.ONE_MINUS_SRC_ALPHA)
	glDepthTest(false)
	glColor(1, 1, 1, 1)
end

local function drawRing(radius, yOffset, r, g, b, alpha)
	if GL and GL.LINE_LOOP and glBeginEnd and glVertex then
		glBeginEnd(GL.LINE_LOOP, function()
			for i = 0, RING_SEGMENTS - 1 do
				local a = (i / RING_SEGMENTS) * math.pi * 2
				glVertex(math.cos(a) * radius, yOffset, math.sin(a) * radius)
			end
		end)
	end
end

local function drawFinalBossAura(unitID, defID, teamID, time)
	local x, y, z = spGetUnitBasePosition(unitID)
	if not x then
		return
	end
	local pulse = 0.5 + 0.5 * math.sin(time * 4.5)
	local pulse2 = 0.5 + 0.5 * math.sin(time * 7.0 + 1.7)

	glDepthTest(false)
	glBlending(GL.SRC_ALPHA, GL.ONE)
	if glCulling then glCulling(false) end
	if glLighting then glLighting(false) end

	glPushMatrix()
		glTranslate(x, y + 8, z)
		glLineWidth(3.0)
		glColor(1.0, 0.08, 0.02, 0.30 + 0.22 * pulse)
		drawRing(260 + 70 * pulse, 0, 1, 0, 0, 1)
		glColor(0.05, 0.75, 1.0, 0.22 + 0.18 * pulse2)
		drawRing(390 + 100 * pulse2, 0, 0, 1, 1, 1)
		glColor(1.0, 0.85, 0.08, 0.20 + 0.15 * pulse)
		drawRing(520 + 135 * pulse, 0, 1, 1, 0, 1)
	glPopMatrix()

	if glUnitShape and defID and teamID then
		glPushMatrix()
			glTranslate(x, y + 220, z)
			glRotate((spGetUnitHeading(unitID) or 0) * headingToDegree, 0, 1, 0)
			glScale(1, 5.2 + pulse * 1.8, 1)
			glPolygonMode(GL.FRONT_AND_BACK, GL.LINE)
			glLineWidth(1.6)
			glColor(1.0, 0.06, 0.02, 0.18 + 0.12 * pulse)
			glUnitShape(defID, teamID, true)
			glPolygonMode(GL.FRONT_AND_BACK, GL.FILL)
		glPopMatrix()
	end

	glLineWidth(1.0)
	glBlending(GL.SRC_ALPHA, GL.ONE_MINUS_SRC_ALPHA)
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
		soundNextAt = 0
		return
	end

	local x, y, z = spGetUnitBasePosition(unitID)
	if not x then
		return
	end
	local now = spGetGameSeconds and spGetGameSeconds() or 0
	local forcePlay = false
	if soundUnitID ~= unitID then
		soundUnitID = unitID
		soundX = x
		soundZ = z
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
		spPlaySoundFile(FINAL_BOSS_SOUND, FINAL_BOSS_SOUND_VOLUME, x, y, z, "sfx")
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
				drawFinalBossAura(unitID, defID, teamID, time)
				drawBossOutline(unitID, defID, teamID, time)
				drawFinalBossGhost(unitID, defID, teamID, time)
			end
		end
	end
end
