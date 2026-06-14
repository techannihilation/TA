function widget:GetInfo()
	return {
		name = "Final Boss Dev",
		desc = "Local debug controls for the final boss event and FX",
		author = "Codex",
		date = "2026-06-14",
		license = "GNU GPL, v2 or later",
		layer = 60,
		enabled = true,
	}
end

local spGetGameRulesParam = Spring.GetGameRulesParam
local spGetGameSeconds = Spring.GetGameSeconds
local spGetViewGeometry = Spring.GetViewGeometry
local spCreateDir = Spring.CreateDir
local spEcho = Spring.Echo
local spIsGUIHidden = Spring.IsGUIHidden
local spSendLuaRulesMsg = Spring.SendLuaRulesMsg

local vfsFileExists = VFS.FileExists
local vfsInclude = VFS.Include

local glColor = gl.Color
local glGetTextWidth = gl.GetTextWidth
local glRect = gl.Rect
local glText = gl.Text

local vsx, vsy = spGetViewGeometry()
local panelX = 36
local panelY = 170
local panelW = 470
local rowH = 22
local activePhase = "normal"
local minimized = false
local draggingPanel = false
local dragSlider
local dragOffX = 0
local dragOffY = 0
local hitboxes = {}
local saveStatusText
local saveStatusOk = false
local saveStatusUntil = 0

local SAVE_FILE = "LuaUI/Config/final_boss_dev_fx.lua"

local defaultConfig = {
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

local depthModeOptions = { "off", "less", "lequal", "equal", "greater", "gequal", "notequal", "always", "never" }
local depthModeLabels = {
	off = "Off",
	less = "LESS",
	lequal = "LEQUAL",
	equal = "EQUAL",
	greater = "GREATER",
	gequal = "GEQUAL",
	notequal = "NOTEQUAL",
	always = "ALWAYS",
	never = "NEVER",
}

local controls = {
	{ type = "header", label = "Outline" },
	{ type = "toggle", group = "outline", key = "enabled", label = "Outline" },
	{ type = "cycle", group = "outline", key = "depthMode", label = "Outline depth", options = depthModeOptions },
	{ type = "toggle", group = "outline", key = "red", label = "Red outline" },
	{ type = "toggle", group = "outline", key = "cyan", label = "Cyan outline" },
	{ type = "toggle", group = "outline", key = "green", label = "Green outline" },
	{ type = "slider", group = "outline", key = "alpha", label = "Outline alpha", min = 0, max = 3 },
	{ type = "slider", group = "outline", key = "redAlpha", label = "Red outline", min = 0, max = 3 },
	{ type = "slider", group = "outline", key = "cyanAlpha", label = "Cyan outline", min = 0, max = 3 },
	{ type = "slider", group = "outline", key = "greenAlpha", label = "Green outline", min = 0, max = 3 },
	{ type = "slider", group = "outline", key = "lineWidth", label = "Line width", min = 0.25, max = 4 },
	{ type = "slider", group = "outline", key = "pulseSpeed", label = "Pulse speed", min = 0, max = 4 },
	{ type = "header", label = "Ghost" },
	{ type = "toggle", group = "ghost", key = "enabled", label = "Ghost" },
	{ type = "cycle", group = "ghost", key = "depthMode", label = "Ghost depth", options = depthModeOptions },
	{ type = "toggle", group = "ghost", key = "redPass", label = "Red pass" },
	{ type = "toggle", group = "ghost", key = "cyanPass", label = "Cyan pass" },
	{ type = "toggle", group = "ghost", key = "yellowPass", label = "Yellow pass" },
	{ type = "toggle", group = "ghost", key = "purplePass", label = "Purple pass" },
	{ type = "slider", group = "ghost", key = "alpha", label = "Ghost alpha", min = 0, max = 3 },
	{ type = "slider", group = "ghost", key = "redAlpha", label = "Red pass", min = 0, max = 3 },
	{ type = "slider", group = "ghost", key = "cyanAlpha", label = "Cyan pass", min = 0, max = 3 },
	{ type = "slider", group = "ghost", key = "yellowAlpha", label = "Yellow pass", min = 0, max = 3 },
	{ type = "slider", group = "ghost", key = "purpleAlpha", label = "Purple pass", min = 0, max = 3 },
	{ type = "slider", group = "ghost", key = "offset", label = "Ghost offset", min = 0, max = 4 },
	{ type = "slider", group = "ghost", key = "jitterSpeed", label = "Jitter speed", min = 0, max = 4 },
	{ type = "header", label = "Shader" },
	{ type = "toggle", group = "shader", key = "enabled", label = "Shader" },
	{ type = "slider", group = "shader", key = "intensity", label = "Intensity", min = 0, max = 4 },
	{ type = "slider", group = "shader", key = "scan", label = "Scan", min = 0, max = 3 },
	{ type = "slider", group = "shader", key = "scanDensity", label = "Scan density", min = 1, maxByPhase = { normal = 8, armored = 5.7 } },
	{ type = "slider", group = "shader", key = "noise", label = "Noise", min = 0, max = 3 },
	{ type = "slider", group = "shader", key = "flicker", label = "Flicker", min = 0, max = 3 },
	{ type = "slider", group = "shader", key = "tear", label = "Tear", min = 0, max = 3 },
}

local function copyTable(value)
	if type(value) ~= "table" then
		return value
	end
	local result = {}
	for k, v in pairs(value) do
		result[k] = copyTable(v)
	end
	return result
end

local function ensureConfig()
	WG.finalBossDevFxConfig = WG.finalBossDevFxConfig or copyTable(defaultConfig)
	for phaseName, phaseDefaults in pairs(defaultConfig) do
		WG.finalBossDevFxConfig[phaseName] = WG.finalBossDevFxConfig[phaseName] or {}
		for groupName, groupDefaults in pairs(phaseDefaults) do
			WG.finalBossDevFxConfig[phaseName][groupName] = WG.finalBossDevFxConfig[phaseName][groupName] or {}
			for key, value in pairs(groupDefaults) do
				if WG.finalBossDevFxConfig[phaseName][groupName][key] == nil then
					WG.finalBossDevFxConfig[phaseName][groupName][key] = value
				end
			end
		end
	end
	return WG.finalBossDevFxConfig
end

local function clamp(value, minValue, maxValue)
	if value < minValue then
		return minValue
	end
	if value > maxValue then
		return maxValue
	end
	return value
end

local function isDevMode()
	return spGetGameRulesParam("final_boss_devmode") == 1
end

local function currentPanelH()
	if minimized then
		return 42
	end
	return math.max(42, math.min(vsy - 16, 146 + (#controls * rowH)))
end

local function inside(x, y, box)
	return box and x >= box.x1 and x <= box.x2 and y >= box.y1 and y <= box.y2
end

local function drawFittedText(text, x, y, size, options, maxWidth)
	local fittedSize = size
	if glGetTextWidth and maxWidth and maxWidth > 0 then
		local width = glGetTextWidth(text) * fittedSize
		if width > maxWidth then
			fittedSize = math.max(9, fittedSize * (maxWidth / width))
		end
	end
	glText(text, x, y, fittedSize, options)
end

local function drawButton(id, label, x1, y1, x2, y2, active)
	hitboxes[#hitboxes + 1] = { id = id, type = "button", x1 = x1, y1 = y1, x2 = x2, y2 = y2 }
	glColor(active and 0.28 or 0.13, active and 0.34 or 0.15, active and 0.42 or 0.18, 0.92)
	glRect(x1, y1, x2, y2)
	glColor(1, 1, 1, 0.95)
	drawFittedText(label, (x1 + x2) * 0.5, y1 + 7, 12, "oc", x2 - x1 - 8)
end

local function drawToggle(control, x1, y, config)
	local value = config[activePhase][control.group][control.key]
	local box = { type = "toggle", control = control, x1 = x1, y1 = y, x2 = x1 + panelW - 28, y2 = y + rowH }
	hitboxes[#hitboxes + 1] = box
	glColor(0.08, 0.09, 0.10, 0.72)
	glRect(box.x1, box.y1, box.x2, box.y2 - 2)
	glColor(value and 0.0 or 0.32, value and 0.62 or 0.08, value and 0.95 or 0.06, 0.88)
	glRect(x1 + 6, y + 5, x1 + 20, y + 17)
	glColor(0.9, 0.92, 0.95, 0.95)
	glText(control.label, x1 + 28, y + 6, 11, "o")
end

local function drawCycle(control, x1, y, config)
	local value = config[activePhase][control.group][control.key]
	local box = { type = "cycle", control = control, x1 = x1, y1 = y, x2 = x1 + panelW - 28, y2 = y + rowH }
	hitboxes[#hitboxes + 1] = box
	glColor(0.08, 0.09, 0.10, 0.72)
	glRect(box.x1, box.y1, box.x2, box.y2 - 2)
	glColor(0.9, 0.92, 0.95, 0.95)
	glText(control.label, x1 + 8, y + 6, 11, "o")
	glColor(0.12, 0.17, 0.22, 0.95)
	glRect(x1 + 170, y + 3, x1 + panelW - 36, y + 18)
	glColor(0.05, 0.75, 1.0, 0.95)
	drawFittedText(depthModeLabels[value] or tostring(value), x1 + panelW - 102, y + 6, 10, "oc", 120)
end

local function controlMin(control)
	if control.minByPhase and control.minByPhase[activePhase] ~= nil then
		return control.minByPhase[activePhase]
	end
	return control.min
end

local function controlMax(control)
	if control.maxByPhase and control.maxByPhase[activePhase] ~= nil then
		return control.maxByPhase[activePhase]
	end
	return control.max
end

local function drawSlider(control, x1, y, config)
	local group = config[activePhase][control.group]
	local value = group[control.key]
	local minValue = controlMin(control)
	local maxValue = controlMax(control)
	local displayValue = clamp(value, minValue, maxValue)
	local sliderX1 = x1 + 170
	local sliderX2 = x1 + panelW - 58
	local ratio = (displayValue - minValue) / (maxValue - minValue)
	ratio = clamp(ratio, 0, 1)
	local knobX = sliderX1 + ((sliderX2 - sliderX1) * ratio)
	local box = { type = "slider", control = control, x1 = x1, y1 = y, x2 = x1 + panelW - 28, y2 = y + rowH, sliderX1 = sliderX1, sliderX2 = sliderX2 }
	hitboxes[#hitboxes + 1] = box

	glColor(0.08, 0.09, 0.10, 0.72)
	glRect(box.x1, box.y1, box.x2, box.y2 - 2)
	glColor(0.9, 0.92, 0.95, 0.95)
	glText(control.label, x1 + 8, y + 6, 11, "o")
	glColor(0.18, 0.20, 0.23, 0.95)
	glRect(sliderX1, y + 8, sliderX2, y + 13)
	glColor(0.05, 0.75, 1.0, 0.75)
	glRect(sliderX1, y + 8, knobX, y + 13)
	glColor(1.0, 0.18, 0.08, 0.95)
	glRect(knobX - 4, y + 4, knobX + 4, y + 17)
	glColor(0.78, 0.82, 0.86, 0.95)
	glText(string.format("%.2f", displayValue), sliderX2 + 10, y + 6, 10, "o")
end

local function applySlider(box, mx)
	local config = ensureConfig()
	local control = box.control
	local minValue = controlMin(control)
	local maxValue = controlMax(control)
	local ratio = clamp((mx - box.sliderX1) / (box.sliderX2 - box.sliderX1), 0, 1)
	config[activePhase][control.group][control.key] = minValue + ((maxValue - minValue) * ratio)
end

local function setSaveStatus(text, ok)
	saveStatusText = text
	saveStatusOk = ok
	saveStatusUntil = (spGetGameSeconds and spGetGameSeconds() or 0) + 5
end

local function saveFxConfig()
	local config = copyTable(ensureConfig())
	if not table or not table.save then
		setSaveStatus("Save failed: table.save missing", false)
		if spEcho then
			spEcho("Final Boss Dev FX save failed: table.save missing")
		end
		return
	end
	if spCreateDir then
		spCreateDir("LuaUI/Config")
	end
	local ok, err = pcall(table.save, config, SAVE_FILE, "-- Final Boss Dev FX settings")
	if ok then
		setSaveStatus("Saved: " .. SAVE_FILE, true)
		if spEcho then
			spEcho("Final Boss Dev FX saved:", SAVE_FILE)
		end
	else
		setSaveStatus("Save failed", false)
		if spEcho then
			spEcho("Final Boss Dev FX save failed:", err)
		end
	end
end

local function loadFxConfig()
	if not vfsFileExists or not vfsInclude then
		setSaveStatus("Load failed: VFS missing", false)
		if spEcho then
			spEcho("Final Boss Dev FX load failed: VFS missing")
		end
		return
	end
	if not vfsFileExists(SAVE_FILE, VFS.RAW_ONLY) then
		setSaveStatus("Load failed: file missing", false)
		if spEcho then
			spEcho("Final Boss Dev FX load failed: missing", SAVE_FILE)
		end
		return
	end

	local ok, loadedConfig = pcall(vfsInclude, SAVE_FILE, nil, VFS.RAW_ONLY)
	if not ok or type(loadedConfig) ~= "table" then
		setSaveStatus("Load failed", false)
		if spEcho then
			spEcho("Final Boss Dev FX load failed:", loadedConfig)
		end
		return
	end

	WG.finalBossDevFxConfig = copyTable(loadedConfig)
	ensureConfig()
	setSaveStatus("Loaded: " .. SAVE_FILE, true)
	if spEcho then
		spEcho("Final Boss Dev FX loaded:", SAVE_FILE)
	end
end

function widget:Initialize()
	ensureConfig()
	panelX = clamp(panelX, 8, math.max(8, vsx - panelW - 8))
	panelY = clamp(panelY, 8, math.max(8, vsy - currentPanelH() - 8))
end

function widget:Shutdown()
	WG.finalBossDevFxConfig = nil
	WG.finalBossDevFxPreviewPhase = nil
end

function widget:Update()
	if not isDevMode() then
		WG.finalBossDevFxPreviewPhase = nil
	end
end

function widget:ViewResize(viewSizeX, viewSizeY)
	vsx = viewSizeX
	vsy = viewSizeY
	panelX = clamp(panelX, 8, math.max(8, vsx - panelW - 8))
	panelY = clamp(panelY, 8, math.max(8, vsy - currentPanelH() - 8))
end

function widget:DrawScreen()
	if spIsGUIHidden and spIsGUIHidden() then
		return
	end
	if not isDevMode() then
		return
	end
	local config = ensureConfig()
	hitboxes = {}

	local panelH = currentPanelH()
	local x1 = panelX
	local y1 = panelY
	local x2 = panelX + panelW
	local y2 = panelY + panelH
	hitboxes[#hitboxes + 1] = { type = "drag", x1 = x1, y1 = y2 - 34, x2 = x2, y2 = y2 }

	glColor(0, 0, 0, 0.72)
	glRect(x1, y1, x2, y2)
	glColor(0.85, 0.08, 0.04, 0.95)
	glRect(x1, y2 - 3, x2, y2)
	glColor(0.05, 0.75, 1.0, 0.35)
	glRect(x1, y1, x2, y1 + 2)
	glColor(1, 1, 1, 0.96)
	glText("FINAL BOSS DEV", x1 + 12, y2 - 22, 13, "o")
	drawButton("minimize", minimized and "+" or "-", x2 - 34, y2 - 29, x2 - 10, y2 - 8, false)

	if minimized then
		return
	end

	local y = y2 - 64
	drawButton("spawn", "Spawn Boss Now", x1 + 12, y, x1 + 170, y + 24, false)
	drawButton("save", "Save FX", x1 + 184, y, x1 + 304, y + 24, false)
	drawButton("load", "Load FX", x1 + 318, y, x1 + 438, y + 24, false)
	y = y - 30
	drawButton("normal", "No Armor FX", x1 + 12, y, x1 + 222, y + 24, activePhase == "normal")
	drawButton("armored", "Armored FX", x1 + 234, y, x1 + 456, y + 24, activePhase == "armored")
	y = y - 24
	if saveStatusText and (not spGetGameSeconds or spGetGameSeconds() <= saveStatusUntil) then
		if saveStatusOk then
			glColor(0.12, 0.95, 0.45, 0.95)
		else
			glColor(1.0, 0.18, 0.08, 0.95)
		end
		drawFittedText(saveStatusText, x1 + 14, y + 5, 10, "o", panelW - 28)
	end
	y = y - 24

	for i = 1, #controls do
		local control = controls[i]
		if control.type == "header" then
			glColor(1.0, 0.38, 0.12, 0.9)
			glText(control.label, x1 + 14, y + 6, 12, "o")
		elseif control.type == "toggle" then
			drawToggle(control, x1 + 14, y, config)
		elseif control.type == "cycle" then
			drawCycle(control, x1 + 14, y, config)
		elseif control.type == "slider" then
			drawSlider(control, x1 + 14, y, config)
		end
		y = y - rowH
	end

	glColor(1, 1, 1, 1)
end

function widget:MousePress(mx, my, button)
	if button ~= 1 or not isDevMode() then
		return false
	end
	for i = #hitboxes, 1, -1 do
		local box = hitboxes[i]
		if inside(mx, my, box) then
			if box.type == "button" then
				if box.id == "spawn" then
					if spSendLuaRulesMsg then
						spSendLuaRulesMsg("final_boss_dev:spawn_now")
					end
				elseif box.id == "save" then
					saveFxConfig()
				elseif box.id == "load" then
					loadFxConfig()
				elseif box.id == "normal" or box.id == "armored" then
					activePhase = box.id
					WG.finalBossDevFxPreviewPhase = box.id
				elseif box.id == "minimize" then
					minimized = not minimized
				end
				return true
			elseif box.type == "toggle" then
				local config = ensureConfig()
				local control = box.control
				config[activePhase][control.group][control.key] = not config[activePhase][control.group][control.key]
				return true
			elseif box.type == "cycle" then
				local config = ensureConfig()
				local control = box.control
				local group = config[activePhase][control.group]
				local value = group[control.key]
				local nextIndex = 1
				for i = 1, #control.options do
					if control.options[i] == value then
						nextIndex = (i % #control.options) + 1
						break
					end
				end
				group[control.key] = control.options[nextIndex]
				return true
			elseif box.type == "slider" then
				dragSlider = box
				applySlider(box, mx)
				return true
			elseif box.type == "drag" then
				draggingPanel = true
				dragOffX = mx - panelX
				dragOffY = my - panelY
				return true
			end
		end
	end
	return false
end

function widget:MouseMove(mx, my, dx, dy, button)
	if button ~= 1 then
		return false
	end
	if dragSlider then
		applySlider(dragSlider, mx)
		return true
	end
	if draggingPanel then
		panelX = clamp(mx - dragOffX, 8, math.max(8, vsx - panelW - 8))
		panelY = clamp(my - dragOffY, 8, math.max(8, vsy - currentPanelH() - 8))
		return true
	end
	return false
end

function widget:MouseRelease(mx, my, button)
	if button == 1 and (dragSlider or draggingPanel) then
		if dragSlider then
			applySlider(dragSlider, mx)
		end
		dragSlider = nil
		draggingPanel = false
		return true
	end
	return false
end
