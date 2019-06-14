function widget:GetInfo()
	return {
	name      = "Red Tooltip", --version 4
	desc      = "Requires Red UI Framework",
	author    = "Regret",
	date      = "August 11, 2009", --last change September 10,2009
	license   = "GNU GPL, v2 or later",
	layer     = -100,
	enabled   = true, --enabled by default
	handler   = true, --can use widgetHandler:x()
	}
end
local NeededFrameworkVersion = 8
local CanvasX,CanvasY = 1440,900 --resolution in which the widget was made (for 1:1 size)
local iconsizeMaster = 96
local iconsize = iconsizeMaster
local oldUnitpicsDir = LUAUI_DIRNAME.."Images/oldunitpics/"
local unitDefID
local CMD_MORPH = 31410

--1272,734 == 1280,768 windowed

--todo: sy adjustment
local OtaIconExist = {}

for i=1,#UnitDefs do
	if VFS.FileExists(oldUnitpicsDir..UnitDefs[i].name..'.png') then
		OtaIconExist[i] = oldUnitpicsDir..UnitDefs[i].name..'.png'
		--Spring.Echo("Icon Path ",oldUnitpicsDir..UnitDefs[i].name..'.png')
	end
end

local cbackground, cborder = include("Configs/ui_config.lua")

local Config = {
	tooltip = {
		px = 0,py = CanvasY-(12*7+5*2), --default start position
		sx = 320,sy = 12*7+5*2, --background size
		
		fontsize = 12,
		
		margin = 5, --distance from background border
		
		cbackground = cbackground,
		cborder = cborder,
		
		dragbutton = {2}, --middle mouse button
		tooltip = {
			background = "Hold \255\255\255\1middle mouse button\255\255\255\255 to drag the tooltip display around.",
		},
	},
}

local sGetCurrentTooltip = Spring.GetCurrentTooltip
local sGetSelectedUnitsCount = Spring.GetSelectedUnitsCount

local function IncludeRedUIFrameworkFunctions()
	New = WG.Red.New(widget)
	Copy = WG.Red.Copytable
	SetTooltip = WG.Red.SetTooltip
	GetSetTooltip = WG.Red.GetSetTooltip
	Screen = WG.Red.Screen
	GetWidgetObjects = WG.Red.GetWidgetObjects
end

local function RedUIchecks()
	local color = "\255\255\255\1"
	local passed = true
	if (type(WG.Red)~="table") then
		Spring.Echo(color..widget:GetInfo().name.." requires Red UI Framework.")
		passed = false
	elseif (type(WG.Red.Screen)~="table") then
		Spring.Echo(color..widget:GetInfo().name..">> strange error.")
		passed = false
	elseif (WG.Red.Version < NeededFrameworkVersion) then
		Spring.Echo(color..widget:GetInfo().name..">> update your Red UI Framework.")
		passed = false
	end
	if (not passed) then
		widgetHandler:ToggleWidget(widget:GetInfo().name)
		return false
	end
	IncludeRedUIFrameworkFunctions()
	return true
end

local function AutoResizeObjects() --autoresize v2
	if (LastAutoResizeX==nil) then
		LastAutoResizeX = CanvasX
		LastAutoResizeY = CanvasY
	end
	local lx,ly = LastAutoResizeX,LastAutoResizeY
	local vsx,vsy = Screen.vsx,Screen.vsy
	if ((lx ~= vsx) or (ly ~= vsy)) then
		local objects = GetWidgetObjects(widget)
		local scale = vsy/ly
		local skippedobjects = {}
		for i=1,#objects do
			local o = objects[i]
			local adjust = 0
			if ((o.movableslaves) and (#o.movableslaves > 0)) then
				adjust = (o.px*scale+o.sx*scale)-vsx
				if (((o.px+o.sx)-lx) == 0) then
					o._moveduetoresize = true
				end
			end
			if (o.px) then o.px = o.px * scale end
			if (o.py) then o.py = o.py * scale end
			if (o.sx) then o.sx = o.sx * scale end
			if (o.sy) then o.sy = o.sy * scale end
			if (o.fontsize) then o.fontsize = o.fontsize * scale end
			if (adjust > 0) then
				o._moveduetoresize = true
				o.px = o.px - adjust
				for j=1,#o.movableslaves do
					local s = o.movableslaves[j]
					s.px = s.px - adjust/scale
				end
			elseif ((adjust < 0) and o._moveduetoresize) then
				o._moveduetoresize = nil
				o.px = o.px - adjust
				for j=1,#o.movableslaves do
					local s = o.movableslaves[j]
					s.px = s.px - adjust/scale
				end
			end
		end
		LastAutoResizeX,LastAutoResizeY = vsx,vsy
	end
end

local function getEditedCurrentTooltip()

	local text = sGetCurrentTooltip()
	--Prune RC tech list
	local lvl1tech = text:match("advanced t1 unit research centre") or nil
	local lvl2tech = text:match("advanced t2 unit research centre") or nil
	local lvl3tech = text:match("advanced t3 unit research centre") or nil
	local lvl4tech = text:match("advanced t4 unit research centre") or nil
	local provides = text:match("Provides") or nil
	if provides then
		if lvl4tech then
			text = text:gsub(lvl3tech,string.format("")) or text
			text = text:gsub(lvl2tech,string.format("")) or text
			text = text:gsub(lvl1tech,string.format("")) or text
			text = text:gsub(",",string.format(""),3) or text
			text = text:gsub(lvl4tech,string.format("Advanced T4 Unit Research Centre")) or text
		elseif lvl3tech then
			text = text:gsub(lvl2tech,string.format("")) or text
			text = text:gsub(lvl1tech,string.format("")) or text
			text = text:gsub(",",string.format(""),2) or text
			text = text:gsub(lvl3tech,string.format("Advanced T3 Unit Research Centre")) or text
		elseif lvl2tech then
			text = text:gsub(lvl1tech,string.format("")) or text
			text = text:gsub(",",string.format(""),1) or text
			text = text:gsub(lvl2tech,string.format("Advanced T2 Unit Research Centre")) or text
		elseif lvl1tech then
			text = text:gsub(lvl1tech,string.format("Advanced T1 Unit Research Centre")) or text
		end
	end
	-- Prune hidden unitID
	--[[
	local expUnitPat = "UnitID (%d+)\n"
	local UnitID = tonumber(text:match(expUnitPat)) or nil
	if UnitID ~= nil then
    	text = text:gsub(expUnitPat,string.format("")) or text
	end
	--]]
	--extract the exp value with regexp
	local expMorphPat = "UnitDefID (%d+)\n"
	local MorphDefID = tonumber(text:match(expMorphPat)) or nil
	if MorphDefID ~= nil then
    	text = text:gsub(expMorphPat,string.format("")) or text
	end

	local expPattern = "Experience (%d+%.%d%d)"
	local currentExp = tonumber(text:match(expPattern))

	local limExp = currentExp and currentExp/(1+currentExp) or 1
	--replace with limexp: exp/(1+exp) since all spring exp effects are linear in limexp, multiply by 10 because people like big numbers instead of [0,1]
	text = currentExp and text:gsub(expPattern,string.format("Experience %.2f", currentExp) ) or text


	if WG.Music and WG.Music.curTrack then
		text = text .. "\nPlaying : " .. WG.Music.curTrack
	end

	local mx,my,gx,gy,gz,tooltipID
    mx,my = Spring.GetMouseState()
    if mx and my then
    local _,pos = Spring.TraceScreenRay(mx,my,true,true)
        if pos then
            gx,gy,gz=unpack(pos)
        end
        local kind,var1 = Spring.TraceScreenRay(mx,my,false,true)
        if kind=="unit" then
            tooltipID = var1
        end
    end
    if MorphDefID then
    	unitDefID=MorphDefID
        iconsize=tooltip.background.sy
    elseif tooltipID then
        unitDefID=Spring.GetUnitDefID(tooltipID)
        iconsize=tooltip.background.sy
    elseif WG["hoverID"] and WG["hoverID"] < 0 then
    	unitDefID=math.abs(WG["hoverID"])
    	iconsize=tooltip.background.sy
    elseif Spring.GetSelectedUnitsCount() == 1 then
    	unitID=Spring.GetSelectedUnits()[1]
    	if Spring.ValidUnitID(unitID) then
    		unitDefID=Spring.GetUnitDefID(unitID)
    		iconsize=tooltip.background.sy
    	end
    else
    	unitDefID=nil
    	iconsize=0
    end
	return text
end

local function createtooltip(r)
	local text = {"text",
		px=r.px+r.margin,py=r.py+r.margin,
		fontsize=r.fontsize,
		caption="",
		options="o",
		
		onupdate=function(self)
			local unitcount = sGetSelectedUnitsCount()
			if (unitcount ~= 0) then
				self.caption = "Selected units: "..unitcount.."\n"
			else
				self.caption = "\n"
			end
		
			if (self._mouseoverself) then
				self.caption = self.caption..r.tooltip.background
			else
				self.caption = self.caption..(getEditedCurrentTooltip() or sGetCurrentTooltip())
			end
		end
	}
	
	local background = {"rectangle",
		px=r.px,py=r.py,
		sx=r.sx,sy=r.sy,
		color=r.cbackground,
		border=r.cborder,
		
		movable=r.dragbutton,
		movableslaves={text},
		
		obeyscreenedge = true,
		--overridecursor = true,
		overrideclick = {2},
		
		onupdate=function(self)
			if (self.px < (Screen.vsx/2)) then --left side of screen
				if ((self.sx-r.margin*2) <= text.getwidth()) then
					self.sx = ((text.getwidth()+r.margin*2) -1) + (iconsize*1.95)
				else
					self.sx = (r.sx * Screen.vsy/CanvasY) + (iconsize*1.95)
				end
				text.px = self.px + r.margin + iconsize
			else --right side of screen
				if ((self.sx-r.margin*2 -1) <= text.getwidth()) then
					self.px = self.px - ((text.getwidth() + r.margin*2) - self.sx)
					self.sx = (text.getwidth() + r.margin*2) + (iconsize*1.95)
				else
					self.px = self.px - ((r.sx * Screen.vsy/CanvasY) - self.sx)
					self.sx = (r.sx * Screen.vsy/CanvasY ) + (iconsize*1.95)
				end
				text.px = self.px + r.margin + iconsize
			end
		end,
		mouseover=function(mx,my,self)
			text._mouseoverself = true
		end,
		mousenotover=function(mx,my,self)
			text._mouseoverself = nil
		end,
	}
	
	New(background)
	New(text)
	
	return {
		["background"] = background,
		["text"] = text,
		
		margin = r.margin,
	}
end

function widget:DrawScreen()
	if unitDefID then
		gl.Color(1, 1, 1, 1)
		--Spring.Echo(VFS.FileExists(oldUnitpicsDir..UnitDefs[unitDefID].name..'.png'),unitDefID,UnitDefs[unitDefID].name )
		if WG['OtaIcons'] and OtaIconExist[unitDefID] then
			gl.Texture(OtaIconExist[unitDefID])
		else
			gl.Texture('#' .. unitDefID) -- Screen.vsx,Screen.vsy
		end
  		gl.TexRect(tooltip.background.px, Screen.vsy - tooltip.background.py - iconsize, tooltip.background.px +iconsize , Screen.vsy - tooltip.background.py) 
  		gl.Texture(false)
  	end
end


function widget:Initialize()
	PassedStartupCheck = RedUIchecks()
	if (not PassedStartupCheck) then return end
	
	tooltip = createtooltip(Config.tooltip)
		
	Spring.SetDrawSelectionInfo(false) --disables springs default display of selected units count
	Spring.SendCommands("tooltip 0")
	AutoResizeObjects()
end

function widget:Shutdown()
	Spring.SendCommands("tooltip 1")
end

function widget:Update()
	AutoResizeObjects()
end

--save/load stuff
--currently only position
function widget:GetConfigData() --save config
	if (PassedStartupCheck) then
		local vsy = Screen.vsy
		local unscale = CanvasY/vsy --needed due to autoresize, stores unresized variables
		if (tooltip.background.px * unscale > -50) or (tooltip.background.py * unscale > -50) then
			Config.tooltip.px = tooltip.background.px * unscale
			Config.tooltip.py = tooltip.background.py * unscale
			return {Config=Config}
		else
			Config.tooltip.px = -50
			Config.tooltip.py = -50
			return {Config=Config}
		end
	end
end
function widget:SetConfigData(data) --load config
	if (data.Config ~= nil) then
		Config.tooltip.px = data.Config.tooltip.px
		Config.tooltip.py = data.Config.tooltip.py
	end
end
