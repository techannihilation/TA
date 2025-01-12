function widget:GetInfo()
	return {
		name    = "Red Tooltip",
		desc    = "Requires Red UI Framework. Always pinned bottom-left, auto-resizable.",
		author  = "Regret (modified by [ur]uncle)",
		date    = "August 11, 2009", -- last change 06.01.2025
		license = "GNU GPL, v2 or later",
		layer   = -100,
		enabled = true,
		handler = true,
	}
end

--------------------------------------------------------------------------------
--  CONFIG & CONSTANTS
--------------------------------------------------------------------------------

local NeededFrameworkVersion = 8

-- 1) Define a base resolution (e.g., 1920×1080) for design
local BASE_X, BASE_Y = 1920, 1080

-- 2) Keep track of the last-known screen size for dynamic scaling
local LastAutoResizeX, LastAutoResizeY = nil, nil

-- 3) Original icon size for 1080p
local iconsizeMaster = 96
local iconsize       = iconsizeMaster

local oldUnitpicsDir = LUAUI_DIRNAME .. "Images/oldunitpics/"
local OtaIconExist   = {}

-- Pre-caching old OTA icons
for i = 1, #UnitDefs do
	if VFS.FileExists(oldUnitpicsDir .. UnitDefs[i].name .. ".png") then
		OtaIconExist[i] = oldUnitpicsDir .. UnitDefs[i].name .. ".png"
	end
end

-- Colors from your config
local cbackground, cborder = include("Configs/ui_config.lua")

-- This table will be scaled automatically by Red UI code,
-- but we can also manually set some parts if needed.
local Config = {
	tooltip = {
		fontsize    = 18,
		margin      = 5,
		cbackground = cbackground,
		cborder     = cborder,
	},
}

--------------------------------------------------------------------------------
--  SPRING / REDUI FUNCTIONS
--------------------------------------------------------------------------------

local sGetCurrentTooltip     = Spring.GetCurrentTooltip
local sGetSelectedUnitsCount = Spring.GetSelectedUnitsCount
local sGetMouseState         = Spring.GetMouseState
local sTraceScreenRay        = Spring.TraceScreenRay

local Screen           -- will be set to WG.Red.Screen
local GetWidgetObjects -- will be set to WG.Red.GetWidgetObjects
local New              -- will be set to WG.Red.New
local Copy             -- will be set to WG.Red.Copytable

local unitDefID = nil

--------------------------------------------------------------------------------
--  INCLUDE / CHECKS
--------------------------------------------------------------------------------

local function IncludeRedUIFrameworkFunctions()
	New             	= WG.Red.New(widget)
	Copy            	= WG.Red.Copytable
	Screen          	= WG.Red.Screen
	GetWidgetObjects	= WG.Red.GetWidgetObjects
end

local function RedUIchecks()
	local color  = "\255\255\255\1"
	local passed = true

	if type(WG.Red) ~= "table" then
		Spring.Echo(color .. widget:GetInfo().name .. " requires Red UI Framework.")
		passed = false
	elseif type(WG.Red.Screen) ~= "table" then
		Spring.Echo(color .. widget:GetInfo().name .. " >> strange error.")
		passed = false
	elseif WG.Red.Version < NeededFrameworkVersion then
		Spring.Echo(color .. widget:GetInfo().name .. " >> update your Red UI Framework.")
		passed = false
	end

	if not passed then
		widgetHandler:ToggleWidget(widget:GetInfo().name)
		return false
	end

	IncludeRedUIFrameworkFunctions()
	return true
end

--------------------------------------------------------------------------------
--  TOOLTIP / ICON LOGIC
--------------------------------------------------------------------------------

local function armorInfo(unitID, text)
	local health, maxHealth = Spring.GetUnitHealth(unitID)
    if not health then return "" end
	local _, armoredMultiple = Spring.GetUnitArmored(unitID)
	if armoredMultiple and armoredMultiple ~= 1 then
		local closedHP = math.floor(health / armoredMultiple)
		local bonusHPPercent = math.floor((1 / armoredMultiple - 1) * 100)
		text = text .. string.format("\n\255\255\77\77Armor: +%d%%, maxHP: %d", bonusHPPercent, closedHP)
	end
	return text
end

local function getEditedCurrentTooltip()
	local text = sGetCurrentTooltip()
	local mx, my = sGetMouseState()
	local kind, var1 = sTraceScreenRay(mx, my, false, true)

	-- Check if we're dealing with a morph tooltip
	local expMorphPat = "UnitDefID (%d+)\n"
	local MorphDefID = tonumber(text:match(expMorphPat))
	if MorphDefID then
		text = text:gsub(expMorphPat, "") -- remove that line
	end

	-- Decide which unitDefID to show the icon for
	if MorphDefID then
		unitDefID = MorphDefID
		iconsize  = iconsizeMaster
	elseif kind == "unit" then
		unitDefID = Spring.GetUnitDefID(var1 or -1)
		iconsize  = iconsizeMaster
	elseif WG["hoverID"] and WG["hoverID"] < 0 then
		unitDefID = math.abs(WG["hoverID"])
		iconsize  = iconsizeMaster
	elseif sGetSelectedUnitsCount() == 1 then
		local selUnit = Spring.GetSelectedUnits()[1]
		if Spring.ValidUnitID(selUnit) then
			unitDefID = Spring.GetUnitDefID(selUnit)
			iconsize  = iconsizeMaster
			text = armorInfo(selUnit, text)
		end
	else
		unitDefID = nil
		iconsize  = 0
	end

	-- If the mouse is directly over a unit, integrate armor info
	local rType, unitID = Spring.TraceScreenRay(mx, my)
	if rType == "unit" then
		text = armorInfo(unitID, text)
	end

	return text
end

--------------------------------------------------------------------------------
--  WIDGET OBJECTS CREATION
--------------------------------------------------------------------------------

local tooltip = {}

local function createtooltip(cfg)
	local margin   = cfg.margin
	local fontsize = cfg.fontsize

	-- Text object
	local textObj = {
		"text",
		px       = 0,
		py       = 0,
		fontsize = fontsize,
		caption  = "",
		options  = "o", -- "o" = outline font
		onupdate = function(self)
			local unitcount = sGetSelectedUnitsCount()
			if unitcount > 0 then
				self.caption = "Selected units: " .. unitcount .. "\n"
			else
				self.caption = ""
			end
			self.caption = self.caption .. (getEditedCurrentTooltip() or "")
		end,
	}

	-- Background rectangle
	local backgroundObj = {
		"rectangle",
		px      = 0,
		py      = 0,
		sx      = 0,
		sy      = 0,
		color   = cfg.cbackground,
		border  = cfg.cborder,
		onupdate = function(self)
			local textW = textObj.getwidth()
			local textH = textObj.getheight()

			-- The full width includes left-margin + icon + margin + text + margin
			local finalW = margin + iconsize + margin + textW + margin
			-- The height is margin + whichever is taller, text or icon
			local finalH = margin + math.max(textH, iconsize - margin) + margin

			self.sx = finalW
			self.sy = finalH

			-- Place bottom-left at (0, vsy - finalH), so pinned to bottom-left
			local vsx, vsy = Screen.vsx, Screen.vsy
			self.px = 0
			self.py = vsy - self.sy

			-- The text starts after the icon
			textObj.px = self.px + margin + iconsize
			textObj.py = self.py + margin
		end,
	}

	New(backgroundObj)
	New(textObj)
	return {
		background = backgroundObj,
		text       = textObj,
		margin     = margin,
	}
end

--------------------------------------------------------------------------------
--  DRAW & UPDATE
--------------------------------------------------------------------------------

function widget:DrawScreen()
	if unitDefID and tooltip and tooltip.background then
		local margin = Config.tooltip.margin
		gl.Color(1,1,1,1)
		if WG["OtaIcons"] and OtaIconExist[unitDefID] then
			gl.Texture(OtaIconExist[unitDefID])
		else
			gl.Texture("#" .. unitDefID)
		end

		local bx  = tooltip.background.px
		local by  = tooltip.background.py
		local vsy = Screen.vsy

		-- Draw the icon directly
		-- (Note how we use the updated 'iconsize' here.)
		gl.TexRect(
			bx,             vsy - by - iconsize - margin,
			bx + iconsize,  vsy - by
		)

		gl.Texture(false)
	end
end

--------------------------------------------------------------------------------
--  AUTO-RESIZE LOGIC (IMPORTANT FOR ICON SCALING)
--------------------------------------------------------------------------------

local function AutoResizeObjects()
	if not LastAutoResizeX then
		-- Initialize the “previous known” resolution to our design resolution
		LastAutoResizeX = BASE_X
		LastAutoResizeY = BASE_Y
	end

	local lx, ly = LastAutoResizeX, LastAutoResizeY
	local vsx, vsy = Screen.vsx, Screen.vsy

	-- Only do the scaling if the screen size has actually changed
	if (lx ~= vsx) or (ly ~= vsy) then
		-- Typically we scale by the ratio of new vsy to original
		local scale = vsy / ly

		-- Scale all objects that Red UI is tracking
		local objects = GetWidgetObjects(widget)
		for i = 1, #objects do
			local o = objects[i]
			local adjust = 0

			-- Attempt to keep the object from going off the right side
			if o.movableslaves and (#o.movableslaves > 0) then
				adjust = (o.px * scale + o.sx * scale) - vsx
				if ((o.px + o.sx) - lx) == 0 then
					o._moveduetoresize = true
				end
			end

			if o.px then o.px = o.px * scale end
			if o.py then o.py = o.py * scale end
			if o.sx then o.sx = o.sx * scale end
			if o.sy then o.sy = o.sy * scale end
			if o.fontsize then
				o.fontsize = o.fontsize * scale
			end

			-- Adjust position if off screen
			if adjust > 0 then
				o._moveduetoresize = true
				o.px = o.px - adjust
				-- Move slaves
				for j = 1, #o.movableslaves do
					local s = o.movableslaves[j]
					s.px = s.px - adjust / scale
				end
			elseif (adjust < 0) and o._moveduetoresize then
				o._moveduetoresize = nil
				o.px = o.px - adjust
				for j = 1, #o.movableslaves do
					local s = o.movableslaves[j]
					s.px = s.px - adjust / scale
				end
			end
		end

		-- Always recalc 'iconsizeMaster' based on the new scale
		iconsizeMaster = iconsizeMaster * scale

		-- Update “last known” resolution to the new one
		LastAutoResizeX, LastAutoResizeY = vsx, vsy
	end
end

-- Called automatically by Spring when the view is resized (fullscreen/windowed)
function widget:ViewResize(vsx, vsy)
	-- Update Red UI's known screen geometry
	if Screen then
		Screen.vsx = vsx
		Screen.vsy = vsy
	end
	AutoResizeObjects()
end

--------------------------------------------------------------------------------
--  WIDGET INITIALIZATION / SHUTDOWN
--------------------------------------------------------------------------------

function widget:Initialize()
	if not RedUIchecks() then return end

	-- Create our tooltip objects
	tooltip = createtooltip(Config.tooltip)

	-- Hide default selection info & default tooltip
	Spring.SetDrawSelectionInfo(false)
	Spring.SendCommands("tooltip 0")

	-- Ensure Red UI has the current geometry
	Screen.vsx, Screen.vsy = Spring.GetViewGeometry()

	-- Force an initial resize to scale everything to the *current* resolution
	LastAutoResizeX, LastAutoResizeY = nil, nil
	AutoResizeObjects()
end

function widget:Shutdown()
	-- Restore the default Spring tooltip
	Spring.SendCommands("tooltip 1")
end
