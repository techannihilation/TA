function widget:GetInfo()
	return {
		name    = "Red Tooltip",
		desc    = "Requires Red UI Framework. Always pinned bottom-left, auto-resizable.",
		author  = "Regret (modified by [ur]uncle)",
		date    = "August 11, 2009", -- last change 05.01.2025
		license = "GNU GPL, v2 or later",
		layer   = -100,
		enabled = true,
		--handler = true,
	}
end

local NeededFrameworkVersion = 8
local iconsizeMaster = 96
local iconsize = iconsizeMaster
local oldUnitpicsDir = LUAUI_DIRNAME .. "Images/oldunitpics/"
local OtaIconExist = {}

for i = 1, #UnitDefs do
	if VFS.FileExists(oldUnitpicsDir .. UnitDefs[i].name .. ".png") then
		OtaIconExist[i] = oldUnitpicsDir .. UnitDefs[i].name .. ".png"
	end
end

local cbackground, cborder = include("Configs/ui_config.lua")

local Config = {
	tooltip = {
		fontsize = 15,
		margin   = 5,
		cbackground = cbackground,
		cborder     = cborder,
	},
}

local sGetCurrentTooltip     = Spring.GetCurrentTooltip
local sGetSelectedUnitsCount = Spring.GetSelectedUnitsCount
local sGetMouseState         = Spring.GetMouseState
local sTraceScreenRay        = Spring.TraceScreenRay
local unitDefID = nil

local function IncludeRedUIFrameworkFunctions()
	New             	= WG.Red.New(widget)
	Copy            	= WG.Red.Copytable
	SetTooltip      	= WG.Red.SetTooltip
	GetSetTooltip   	= WG.Red.GetSetTooltip
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

local function armorInfo(unitID, text)
	local health, maxHealth = Spring.GetUnitHealth(unitID)
	local _, armoredMultiple = Spring.GetUnitArmored(unitID)
	if armoredMultiple and armoredMultiple ~= 1 then
			local closedHP = math.floor(health / armoredMultiple)
			local bonusHPPercent = math.floor((1 / armoredMultiple - 1) * 100)
			text = text .. string.format("\n\255\255\77\77Armor: +%d%%, maxHP: %d", bonusHPPercent, closedHP)
	end
	return text
end


-- local function expInfo(unitID, text)
-- 	exp = Spring.GetUnitExperience(unitID)
-- 	"Exp:", format("+%d%% health", (uMaxHp/uDef.health-1)*100)
-- end

local function getEditedCurrentTooltip()
	local text = sGetCurrentTooltip()
	--Spring.Echo(text)
	local mx, my = sGetMouseState()
	local kind, var1 = sTraceScreenRay(mx, my, false, true)
	local expMorphPat = "UnitDefID (%d+)\n"
	local MorphDefID = tonumber(text:match(expMorphPat))
	if MorphDefID then
		text = text:gsub(expMorphPat, "")
	end
	if MorphDefID then
		unitDefID = MorphDefID
		iconsize = iconsizeMaster
	elseif kind == "unit" then
		unitDefID = Spring.GetUnitDefID(var1 or -1)
		iconsize = iconsizeMaster
	elseif WG["hoverID"] and WG["hoverID"] < 0 then
		unitDefID = math.abs(WG["hoverID"])
		--Spring.Echo("hoverID",unitDefID)
		iconsize = iconsizeMaster
	elseif sGetSelectedUnitsCount() == 1 then
		local selUnit = Spring.GetSelectedUnits()[1]
		if Spring.ValidUnitID(selUnit) then
			unitDefID = Spring.GetUnitDefID(selUnit)
			iconsize = iconsizeMaster
			text = armorInfo(selUnit, text)
		end
	else
		unitDefID = nil
		iconsize = 0
	end

	-- Armor Information Integration
	local rType, unitID = Spring.TraceScreenRay(mx, my)
	if rType == "unit" then
		text = armorInfo(unitID, text)
	end

	return text
end

local tooltip = {}

local function createtooltip(cfg)
	local margin   = cfg.margin
	local fontsize = cfg.fontsize
	local textObj = {
		"text",
		px       = 0,
		py       = 0,
		fontsize = fontsize,
		caption  = "",
		options  = "o",
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

local backgroundObj = {
	"rectangle",
	px    	= 0,
	py    	= 0,
	sx    	= 0,
	sy    	= 0,
	color 	= cfg.cbackground,
	border	= cfg.cborder,
	onupdate = function(self)
		local textW = textObj.getwidth()
		local textH = textObj.getheight()
		local finalW = margin + iconsize + margin + textW + margin
		local finalH = margin + math.max(textH, iconsize - margin) + margin
		self.sx = finalW
		self.sy = finalH
		local vsx, vsy = Screen.vsx, Screen.vsy
		self.px = 0
		self.py = vsy - self.sy
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

function widget:DrawScreen()
	if unitDefID and tooltip and tooltip.background then
	local margin = Config.tooltip.margin
		gl.Color(1,1,1,1)
		if WG["OtaIcons"] and OtaIconExist[unitDefID] then
			gl.Texture(OtaIconExist[unitDefID])
		else
			gl.Texture("#" .. unitDefID)
		end
		local bx = tooltip.background.px
		local by = tooltip.background.py
		local vsy = Screen.vsy
		gl.TexRect(bx, vsy - by - iconsize - margin, bx + iconsize, vsy - by)
		gl.Texture(false)
	end
end

function widget:Initialize()
	if not RedUIchecks() then return end
	tooltip = createtooltip(Config.tooltip)
	Spring.SetDrawSelectionInfo(false)
	Spring.SendCommands("tooltip 0")
end

function widget:Shutdown()
	Spring.SendCommands("tooltip 1")
end
