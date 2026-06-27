function widget:GetInfo()
	return {
		name = "LuaRules Cheat Menu",
		desc = "Shows cheat-mode buttons for selected LuaRules and engine commands",
		author = "Codex",
		date = "2026-06-27",
		license = "GNU GPL, v2 or later",
		layer = 61,
		enabled = true,
	}
end

local spGetViewGeometry = Spring.GetViewGeometry
local spIsCheatingEnabled = Spring.IsCheatingEnabled
local spIsGUIHidden = Spring.IsGUIHidden
local spGetMouseState = Spring.GetMouseState
local spSendCommands = Spring.SendCommands

local glColor = gl.Color
local glGetTextWidth = gl.GetTextWidth
local glRect = gl.Rect
local glText = gl.Text

local vsx, vsy = spGetViewGeometry()
local panelX = 36
local panelY = 420
local panelW = 292
local titleH = 34
local rowH = 28
local gap = 6
local minimized = false
local draggingPanel = false
local dragOffX = 0
local dragOffY = 0
local hitboxes = {}
local hoverX
local hoverY

local commandGroups = {
	{
		label = "LuaRules",
		commands = {
			{ label = "Boss Dev Mode", command = "luarules bossdevmode" },
			{ label = "Profiler", command = "luarules profile" },
			{ label = "Kill Profiler", command = "luarules kill_profiler", warning = true },
		},
	},
	{
		label = "Engine",
		commands = {
			{ label = "God Mode", command = "godmode" },
			{ label = "NoCost", command = "luarules nc" },
			{ label = "Global LOS", command = "globallos" },
		},
	},
}

local function clamp(value, minValue, maxValue)
	if value < minValue then
		return minValue
	end
	if value > maxValue then
		return maxValue
	end
	return value
end

local function inside(x, y, box)
	return box and x >= box.x1 and x <= box.x2 and y >= box.y1 and y <= box.y2
end

local function isCheatMode()
	return spIsCheatingEnabled and spIsCheatingEnabled()
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

local function currentPanelH()
	if minimized then
		return titleH
	end

	local rows = 0
	for i = 1, #commandGroups do
		rows = rows + 1 + #commandGroups[i].commands
	end
	return titleH + 12 + (rows * rowH) + gap
end

local function clampPanel()
	panelX = clamp(panelX, 8, math.max(8, vsx - panelW - 8))
	panelY = clamp(panelY, 8, math.max(8, vsy - currentPanelH() - 8))
end

local function drawButton(id, label, command, x1, y1, x2, y2, warning)
	hitboxes[#hitboxes + 1] = { id = id, type = "button", command = command, x1 = x1, y1 = y1, x2 = x2, y2 = y2 }
	local hovered = hoverX and hoverY and hoverX >= x1 and hoverX <= x2 and hoverY >= y1 and hoverY <= y2
	if warning then
		if hovered then
			glColor(0.52, 0.18, 0.10, 0.98)
		else
			glColor(0.34, 0.13, 0.08, 0.94)
		end
	else
		if hovered then
			glColor(0.18, 0.24, 0.30, 0.98)
		else
			glColor(0.12, 0.16, 0.20, 0.94)
		end
	end
	glRect(x1, y1, x2, y2)
	glColor(1, 1, 1, hovered and 1 or 0.96)
	if command then
		drawFittedText(label, x1 + 10, y1 + 8, 12, "o", (x2 - x1) * 0.44)
		if hovered then
			glColor(0.78, 0.90, 1.0, 1)
		else
			glColor(0.64, 0.76, 0.86, 0.92)
		end
		drawFittedText("/" .. command, x2 - 10, y1 + 8, 10, "or", (x2 - x1) * 0.50)
	else
		drawFittedText(label, (x1 + x2) * 0.5, y1 + 7, 12, "oc", x2 - x1 - 8)
	end
end

function widget:Initialize()
	clampPanel()
end

function widget:ViewResize(viewSizeX, viewSizeY)
	vsx = viewSizeX
	vsy = viewSizeY
	clampPanel()
end

function widget:DrawScreen()
	if spIsGUIHidden and spIsGUIHidden() then
		return
	end
	if not isCheatMode() then
		hitboxes = {}
		return
	end

	hitboxes = {}
	if spGetMouseState then
		hoverX, hoverY = spGetMouseState()
	else
		hoverX = nil
		hoverY = nil
	end
	local panelH = currentPanelH()
	local x1 = panelX
	local y1 = panelY
	local x2 = panelX + panelW
	local y2 = panelY + panelH
	hitboxes[#hitboxes + 1] = { type = "drag", x1 = x1, y1 = y2 - titleH, x2 = x2, y2 = y2 }

	glColor(0, 0, 0, 0.74)
	glRect(x1, y1, x2, y2)
	glColor(0.05, 0.75, 1.0, 0.72)
	glRect(x1, y2 - 3, x2, y2)
	glColor(0.85, 0.08, 0.04, 0.86)
	glRect(x1, y1, x2, y1 + 2)
	glColor(1, 1, 1, 0.96)
	glText("CHEAT COMMANDS", x1 + 12, y2 - 22, 13, "o")

	drawButton("minimize", minimized and "+" or "-", nil, x2 - 34, y2 - 29, x2 - 10, y2 - 8, false)
	if minimized then
		return
	end

	local y = y2 - titleH - 8
	for i = 1, #commandGroups do
		local group = commandGroups[i]
		glColor(1.0, 0.38, 0.12, 0.9)
		glText(group.label, x1 + 12, y - 14, 12, "o")
		y = y - rowH

		for j = 1, #group.commands do
			local entry = group.commands[j]
			drawButton("command", entry.label, entry.command, x1 + 12, y - 22, x2 - 12, y, entry.warning)
			y = y - rowH
		end
	end

	glColor(1, 1, 1, 1)
end

function widget:MousePress(mx, my, button)
	if button ~= 1 or not isCheatMode() then
		return false
	end

	for i = #hitboxes, 1, -1 do
		local box = hitboxes[i]
		if inside(mx, my, box) then
			if box.type == "button" then
				if box.id == "minimize" then
					minimized = not minimized
					clampPanel()
				elseif box.command and spSendCommands then
					spSendCommands({ box.command })
				end
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
	if not draggingPanel then
		return
	end
	panelX = clamp(mx - dragOffX, 8, math.max(8, vsx - panelW - 8))
	panelY = clamp(my - dragOffY, 8, math.max(8, vsy - currentPanelH() - 8))
end

function widget:MouseRelease(mx, my, button)
	if button == 1 and draggingPanel then
		draggingPanel = false
		return true
	end
	return false
end
