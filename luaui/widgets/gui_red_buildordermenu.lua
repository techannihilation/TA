function widget:GetInfo()
	return {
	version   = "8",
	name      = "Red Build/Order Menu",
	desc      = "Requires Red UI Framework",
	author    = "Regret",
	date      = "August 9, 2009", --last change September 10,2009
	license   = "GNU GPL, v2 or later",
	layer     = 0,
	enabled   = true, --enabled by default
	handler   = true, --can use widgetHandler:x()
	}
end
local NeededFrameworkVersion = 8
local CanvasX,CanvasY = 1272,734 --resolution in which the widget was made (for 1:1 size)
--1272,734 == 1280,768 windowed

local SpSetActiveCommand = Spring.SetActiveCommand
local SpForceLayoutUpdate = Spring.ForceLayoutUpdate
local SpGetCmdDescIndex = Spring.GetCmdDescIndex
local SpGetModKeyState = Spring.GetModKeyState

local cbackground, cborder, cbuttonbackground = include("Configs/ui_config.lua")

local buttonTexture	= LUAUI_DIRNAME.."Images/button.png"
local oldUnitpicsDir = LUAUI_DIRNAME.."Images/oldunitpics/"
local CMD_MORPH = 31410
local CMD_MORPH_STOP = 32410
local CMD_STOCKPILE = CMD.STOCKPILE
local MAX_MORPH = 250

local textureColorDisabled = {0.45,0.45,0.45,0.98}
local textureColorOrderButton = {1,1,1,0.95}
local textureColorOrderIcon = {1,1,1,0.99}
local textureColorBuild = {1,1,1,0.98}
local stateColorRed = {0.8,0,0,1}
local stateColorYellow = {0.8,0.8,0,1}
local stateColorGreen = {0,0.8,0,1}
local stateColorGray = {0.8,0.8,0.8,1}

local oldUnitpics = true
local OtaIconExist = {}

for i=1,#UnitDefs do
	if VFS.FileExists(oldUnitpicsDir..UnitDefs[i].name..'.png') then
		OtaIconExist[i] = oldUnitpicsDir..UnitDefs[i].name..'.png'
		--Spring.Echo("Icon Path ",oldUnitpicsDir..UnitDefs[i].name..'.png')
	end
end

local function convertToNumber(input)
    if type(input) == "number" then
        return input
    end
    if type(input) == "string" and input:sub(1, 2) == "@@" then
        local number = tonumber(input:sub(3))
        if number then
            return number
        end
    end
    return tonumber(input)
end

local function stripCommandActionPrefix(input)
	if type(input) == "string" and input:sub(1, 2) == "@@" then
		return input:sub(3), true
	end
	return input, false
end

local function isMorphCommand(cmdID)
	return (cmdID >= CMD_MORPH and cmdID <= CMD_MORPH + MAX_MORPH)
		or (cmdID >= CMD_MORPH_STOP and cmdID <= CMD_MORPH_STOP + MAX_MORPH)
end

local function shouldShowTexturedCommandCaption(cmdID)
	return cmdID == CMD_STOCKPILE or isMorphCommand(cmdID)
end

--todo: build categories (eco | labs | defences | etc) basically sublists of buildcmds (maybe for regular orders too)

local Config = {
	buildmenu = {
		px = 0,py = CanvasY -(12*6+5*2) -(35*8+0*7+5*2) -5, --default start position
		
		isx = 45,isy = 40, --icon size
		ix = 5,iy = 6, --icons x/y
		ispreadx=0,ispready=0, --space between icons
		
		margin = 0, --distance from background border
		
		fadetime = 0.15, --fade effect time, in seconds
		
		ctext = {1,1,1,1}, --color {r,g,b,alpha}
		cbackground = cbackground,
		cborder = cborder,
		cbuttonbackground = cbuttonbackground,
		
		dragbutton = {2}, --middle mouse button
		tooltip = {
			background = "Hold \255\255\255\1middle mouse button\255\255\255\255 to drag the buildmenu around.",
		},
	},
	
	ordermenu = {
		px = 0,py = CanvasY -(12*6+5*2) -(35*8+0*7+5*2) -5 -(35*5+0*4+5*2) -5,
		
		isx = 45,isy = 33,
		ix = 5,iy = 4,
		
		ispreadx=0,ispready=0,
		
		margin = 0,
		
		fadetime = 0.15,
		
		ctext = {1,1,1,1},
		cbackground = cbackground,
		cborder = cborder,
		cbuttonbackground = cbuttonbackground,
		
		dragbutton = {2}, --middle mouse button
		tooltip = {
			background = "Hold \255\255\255\1middle mouse button\255\255\255\255 to drag the ordermenu around.",
		},
	},
}

local guishaderEnabled = WG['guishader_api'] or false

local sGetSelectedUnitsCount = Spring.GetSelectedUnitsCount
local sGetActiveCommand = Spring.GetActiveCommand
local sGetActiveCmdDescs = Spring.GetActiveCmdDescs
local ssub = string.sub
local mfloor = math.floor

local SelectedUnitsCount = 0
local currentActiveCommandName = nil
local emptyCommands = {}
local UpdateGrid

local function ActivateCommandLeft(mx,my,self)
	local cmdID = self.cmdID
	if (not cmdID) then return end
	local cmdIndex = SpGetCmdDescIndex(cmdID)
	if (cmdIndex) then
		SpSetActiveCommand(cmdIndex,1,true,false,SpGetModKeyState())
	end
end

local function ActivateCommandRight(mx,my,self)
	local cmdID = self.cmdID
	if (not cmdID) then return end
	local cmdIndex = SpGetCmdDescIndex(cmdID)
	if (cmdIndex) then
		SpSetActiveCommand(cmdIndex,3,false,true,SpGetModKeyState())
	end
end

local function PreviousPage(mx,my,self)
	local g = self.grid
	if (not g) then return end
	g.page = g.page - 1
	if (g.page < 1) then
		g.page = g.pagecount
	end
	UpdateGrid(g,g.currentcmds,g.currentordertype)
end

local function NextPage(mx,my,self)
	local g = self.grid
	if (not g) then return end
	g.page = g.page + 1
	if (g.page > g.pagecount) then
		g.page = 1
	end
	UpdateGrid(g,g.currentcmds,g.currentordertype)
end

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
			if (o.maxfontsize) then o.maxfontsize = o.maxfontsize * scale end
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

WG.hoverID = nil
    local function CreateGrid(r)
	local background = {"rectangle",
		px=r.px,py=r.py,
		sx=r.isx*r.ix+r.ispreadx*(r.ix-1) +r.margin*2,
		sy=r.isy*(r.iy+1)+r.ispready*(r.iy) +r.margin*2,
		color=r.cbackground,
		border=r.cborder,
		movable=r.dragbutton,
		movableslaves={},
		obeyscreenedge = true,
		overrideclick = {1,2},
		
		effects = {
			fadein_at_activation = r.fadetime,
			fadeout_at_deactivation = r.fadetime,
		},
	}
	
	local selecthighlight = {"rectangle",
		px=0,py=0,
		sx=r.isx,sy=r.isy,
		
		color={1,0,0,0.3},
		border={1.0,0,0,15},
		
		active=false,
		onupdate=function(self)
		self.active = false
		end,
	}
	
	local mouseoverhighlight = Copy(selecthighlight,true)
	mouseoverhighlight.color={1,1,1,0.3}
	mouseoverhighlight.border={1,1,1,0.15}
	
	local heldhighlight = Copy(selecthighlight,true)
	heldhighlight.color={1,1,0,0.3}
	heldhighlight.border={1,1,0,0.15}
	
	local icon = {"rectangle",
		px=0,py=0,
		sx=r.isx,sy=r.isy,
		
		options="n", --disable colorcodes
		captioncolor=r.ctext,
		
		overridecursor = true,
		overrideclick = {3},
		mouseclick = {
			{1,ActivateCommandLeft},
			{3,ActivateCommandRight},
		},
		
		mouseheld={
			{1,function(mx,my,self)
				heldhighlight.px = self.px
				heldhighlight.py = self.py
				heldhighlight.active = nil
			end},
		},
		mouseover=function(mx,my,self)
			if self.cmdID then
				WG.hoverID = self.cmdID
				--Spring.Echo(WG.hoverID,self.cmdname)
			end
			mouseoverhighlight.px = self.px
			mouseoverhighlight.py = self.py
			mouseoverhighlight.active = nil
			SetTooltip(self.tooltip)
		end,
		
		onupdate=function(self)
			if ((currentActiveCommandName ~= nil) and (self.cmdname == currentActiveCommandName)) then
				selecthighlight.px = self.px
				selecthighlight.py = self.py
				selecthighlight.active = nil
			end
		end,
		
		effects = background.effects,
		
		active=false,
	}
	New(background)
	
	local backward = New(Copy(icon,true))
	backward.caption = "  <--  " --should be replaced with a shiny texture
	local forward = New(Copy(icon,true))
	forward.caption = "  -->  "
	
	local indicator = New({"rectangle",
		px=0,py=0,
		sx=r.isx,sy=r.isy,
		captioncolor=r.ctext,
		options = "n",
		
		effects = background.effects,
	})
	background.movableslaves={backward,forward,indicator}
	
	local icons = {}
	for y=1,r.iy do
		for x=1,r.ix do
			local b = New(Copy(icon,true))
			b.px = background.px +r.margin + (x-1)*(r.ispreadx + r.isx)
			b.py = background.py +r.margin + (y-1)*(r.ispready + r.isy)
			table.insert(background.movableslaves,b)
			icons[#icons+1] = b
			
			if ((y==r.iy) and (x==r.ix)) then
				backward.px = icons[#icons-r.ix+1].px
				forward.px = icons[#icons].px
				indicator.px = (forward.px + backward.px)/2
				
				backward.py = icons[#icons].py + r.isy + r.ispready
				forward.py = backward.py
				indicator.py = backward.py
			end
		end
	end
	
	local staterect = {"rectangle",
		border = r.cborder,
		
		effects = background.effects,
	}
	local staterectangles = {}
	
	New(selecthighlight)
	New(mouseoverhighlight)
	New(heldhighlight)
	
	--tooltip
	background.mouseover = function(mx,my,self) SetTooltip(r.tooltip.background) end
	
	local grid = {
		["background"] = background,
		["icons"] = icons,
		["backward"] = backward,
		["forward"] = forward,
		["indicator"] = indicator,
		["staterectangles"] = staterectangles,
		["staterect"] = staterect,
	}
	backward.grid = grid
	forward.grid = grid
	backward.mouseclick = {{1,PreviousPage}}
	forward.mouseclick = {{1,NextPage}}
	return grid
end

UpdateGrid = function(g,cmds,ordertype)
	local cmdCount = #cmds
	g.currentcmds = cmds
	g.currentordertype = ordertype
	if (cmdCount==0) then
		g.background.active = false
	else
		g.background.active = nil
	end

	local curpage = g.page or 1
	local icons = g.icons
	local iconCount = #icons
	local pagecount = 1
	if (cmdCount > 0) then
		pagecount = mfloor((cmdCount - 1) / iconCount) + 1
	end
	g.pagecount = pagecount
	
	if (curpage > pagecount) then
		curpage = 1
	elseif (curpage < 1) then
		curpage = pagecount
	end
	g.page = curpage
	
	local firstCmdIndex = (curpage - 1) * iconCount + 1
	local visibleIconCount = cmdCount - firstCmdIndex + 1
	if (visibleIconCount > iconCount) then
		visibleIconCount = iconCount
	elseif (visibleIconCount < 0) then
		visibleIconCount = 0
	end
	for i=visibleIconCount+1,iconCount do
		icons[i].active = false --deactivate
	end
	
	local staterectangles = g.staterectangles
	for i=1,#staterectangles do
		staterectangles[i].active = false
	end
	local usedstaterectangles = 0
	
	for i=1,visibleIconCount do
		local cmd = cmds[firstCmdIndex + i - 1]
		local icon = icons[i]
		local params = cmd.params or emptyCommands
		icon.tooltip = cmd.tooltip
		icon.active = nil --activate
		icon.cmdname = cmd.name
		icon.cmdID = cmd.id
		if (cmd.texture and cmd.texture ~= "") then
			icon.texture = cmd.texture
		else
			icon.texture = buttonTexture
		end

		if (cmd.disabled) then
			icon.texturecolor = textureColorDisabled
		else
			if (ordertype ~= 1) then
				if icon.texture == buttonTexture then
					icon.texturecolor = textureColorOrderButton
				else
					icon.texturecolor = textureColorOrderIcon
				end
			else
				icon.texturecolor = textureColorBuild
			end
		end
		
		icon.maxfontsize = nil
		if (ordertype == 1) then --build orders
			local firstParam = convertToNumber(params[1])
			local buildDefID = cmd.id * -1
			local otaIcon = OtaIconExist[buildDefID]
			if oldUnitpics and UnitDefs[buildDefID] ~= nil and otaIcon then
				icon.texture = otaIcon
			else
				icon.texture = "#"..buildDefID
			end
			if (firstParam) then
				icon.caption = "\n\n"..firstParam.."          "
			else
				icon.caption = nil
			end
		else
			if (cmd.type == 5) then --state cmds (fire at will, etc)
				local firstParam = convertToNumber(params[1])
				if firstParam then
					local label, strippedActionPrefix = stripCommandActionPrefix(params[firstParam+2] or cmd.name)
					icon.caption = " "..label.." "
					if strippedActionPrefix then
						icon.maxfontsize = icon.sy * 0.35
					end
				
					local statecount = #params-1 --number of states for the cmd
					local curstate = firstParam+1
					local spread = 2
					local stateRectWidth = nil
					local stateRectHeight = nil
					if (statecount > 0) then
						stateRectWidth = (icon.sx-(spread*(statecount+1)))/statecount
						stateRectHeight = icon.sy/7
					end
				
					for i=1,statecount do
						usedstaterectangles = usedstaterectangles + 1
						local s = staterectangles[usedstaterectangles]
						if (s == nil) then
							s = New(Copy(g.staterect,true))
							staterectangles[usedstaterectangles] = s
							table.insert(g.background.movableslaves,s)
						end
						s.active = nil --activate
						
						s.sx = stateRectWidth
						s.sy = stateRectHeight
						s.px = icon.px+spread + (s.sx+spread)*(i-1)
						s.py = icon.py + icon.sy - s.sy -spread
						
						if (i == curstate) then
							if (statecount < 4) then
								if (i == 1) then
									s.color = stateColorRed
								elseif (i == 2) then
									if (statecount == 3) then
										s.color = stateColorYellow
									else
										s.color = stateColorGreen
									end
								elseif (i == 3) then
									s.color = stateColorGreen
								end
							else
								s.color = stateColorGray
							end
						else
							s.color = nil
						end
					end
				else 
					Spring.Echo("send info to nix ", cmd, cmd.name)
				end
			else
				if (icon.texture == buttonTexture or shouldShowTexturedCommandCaption(cmd.id)) then
					icon.caption = " "..cmd.name.." "
				else
					icon.caption = nil
				end
			end
		end
	end
	
	if (pagecount>1) then
		g.backward.active = nil --activate
		g.forward.active = nil
		g.indicator.active = nil
		g.indicator.caption = "    "..curpage.."    "
	else
		g.backward.active = false
		g.forward.active = false
		g.indicator.active = false
	end
end

function widget:TextCommand(command)
	if (string.find(command, "otaicons") == 1 and string.len(command) == 8) then
		oldUnitpics = not oldUnitpics
		SpForceLayoutUpdate()
		if oldUnitpics then
			Spring.Echo("Using OTA unit icons in buildmenu")
		else
			Spring.Echo("Using TechA unit icons in buildmenu")
		end
	end
end

function widget:Initialize()
	PassedStartupCheck = RedUIchecks()
	if (not PassedStartupCheck) then return end
		
	buildmenu = CreateGrid(Config.buildmenu)
	ordermenu = CreateGrid(Config.ordermenu)
	
	buildmenu.page = 1
	ordermenu.page = 1
	
	AutoResizeObjects() --fix for displacement on crash issue

	WG['OtaIcons'] = oldUnitpics
end

local function onNewCommands(buildcmds,othercmds)
	if (SelectedUnitsCount==0) then
		buildmenu.page = 1
		ordermenu.page = 1
	end

	UpdateGrid(buildmenu,buildcmds,1)
	UpdateGrid(ordermenu,othercmds,2)
end

local function onWidgetUpdate() --function widget:Update()
	AutoResizeObjects()
	SelectedUnitsCount = sGetSelectedUnitsCount()
	local _,_,_,curcmdname = sGetActiveCommand()
	currentActiveCommandName = curcmdname
end

--save/load stuff
--currently only position
function widget:GetConfigData() --save config
	if (PassedStartupCheck) then
		local vsy = Screen.vsy
		local unscale = CanvasY/vsy --needed due to autoresize, stores unresized variables
		Config.buildmenu.px = buildmenu.background.px * unscale
		Config.buildmenu.py = buildmenu.background.py * unscale
		Config.ordermenu.px = ordermenu.background.px * unscale
		Config.ordermenu.py = ordermenu.background.py * unscale
		return {Config=Config, oldUnitpics=oldUnitpics}
	end
end
function widget:SetConfigData(data) --load config
	if (data.Config ~= nil) then
		Config.buildmenu.px = data.Config.buildmenu.px
		Config.buildmenu.py = data.Config.buildmenu.py
		Config.ordermenu.px = data.Config.ordermenu.px
		Config.ordermenu.py = data.Config.ordermenu.py
		if (data.oldUnitpics ~= nil) then
			oldUnitpics = data.oldUnitpics
		end
	end
end











--lots of hacks under this line ------------- overrides/disables default spring menu layout and gets current orders + filters out some commands
local hijackedlayout = false
function widget:Shutdown()
	if (hijackedlayout) then
		widgetHandler:ConfigLayoutHandler(true)
		SpForceLayoutUpdate()
	end
end
local hiddencmds = {
	[76] = true, --load units clone
	[65] = true, --selfd
	[9] = true, --gatherwait
	[8] = true, --squadwait
	[7] = true, --deathwait
	[6] = true, --timewait
}
local function GetCommands()
	local buildcmds = {}
	local othercmds = {}
	local othercmdsPending = {}
	local buildcmdscount = 0
	local othercmdscount = 0
	local othercmdsPendingCount = 0
	local activeCmdDescs = sGetActiveCmdDescs()
	for i=1,#activeCmdDescs do
		local cmd = activeCmdDescs[i]
		if (type(cmd) == "table") then
			local cmdtype = cmd.type
			local cmdaction = cmd.action
			if (
			(not hiddencmds[cmd.id]) and
			(cmdaction ~= nil) and
			--(not cmd.disabled) and
			(cmdtype ~= 21) and
			(cmdtype ~= 18) and
			(cmdtype ~= 17)
			) then
				if ((cmdtype == 20) --build building
				or (ssub(cmdaction,1,10) == "buildunit_")) then
					buildcmdscount = buildcmdscount + 1
					buildcmds[buildcmdscount] = cmd
				elseif (cmdtype == 5) then
					othercmdscount = othercmdscount + 1
					othercmds[othercmdscount] = cmd
				else
					othercmdsPendingCount = othercmdsPendingCount + 1
					othercmdsPending[othercmdsPendingCount] = cmd
				end
			end
		end
	end
	for i=1,othercmdsPendingCount do
		othercmdscount = othercmdscount + 1
		othercmds[othercmdscount] = othercmdsPending[i]
	end
	
	return buildcmds,othercmds
end
local hijackattempts = 0
local layoutping = 54352 --random number
local function hijacklayout()
	if (hijackattempts>5) then
		Spring.Echo(widget:GetInfo().name.." failed to hijack config layout.")
		widgetHandler:ToggleWidget(widget:GetInfo().name)
		return
	end
	local function dummylayouthandler(xIcons, yIcons, cmdCount, commands) --gets called on selection change
		WG.layoutpinghax = 54352
		widgetHandler.commands = commands
		widgetHandler.commands.n = cmdCount
		widgetHandler:CommandsChanged() --call widget:CommandsChanged()
		local iconList = {[1337]=9001}
		local custom_cmdz = widgetHandler.customCommands
		return "", xIcons, yIcons, {}, custom_cmdz, {}, {}, {}, {}, {}, iconList
	end
	widgetHandler:ConfigLayoutHandler(dummylayouthandler) --override default build/ordermenu layout
	SpForceLayoutUpdate()
	hijackedlayout = true
	hijackattempts = hijackattempts + 1
end
local updatehax = false
local updatehax2 = true
local firstupdate = true
local function haxlayout()
	if (WG.layoutpinghax~=layoutping) then
		hijacklayout()
	end
	WG.layoutpinghax = nil
	updatehax = true
end
function widget:CommandsChanged()
	haxlayout()
end

function widget:GameFrame(frame)
  if oldUnitpics ~= WG['OtaIcons'] then
  	--Spring.Echo("OtaIcons toggle ", WG['OtaIcons'])
  	oldUnitpics = WG['OtaIcons']
    SpForceLayoutUpdate()
  end

  if frame%9==0 then
  	WG.hoverID = nil
  end
end

local sec = 0
local guishaderCheckInterval = 1
function widget:Update(dt)
	sec=sec+dt
	if (sec>1/guishaderCheckInterval) then
		sec = 0
		if (WG['guishader_api'] ~= guishaderEnabled) then
			guishaderEnabled = WG['guishader_api']
			if (guishaderEnabled) then
				Config.buildmenu.fadetimeOut = 0.02
				Config.ordermenu.fadetimeOut = 0.02
			else
				Config.buildmenu.fadetimeOut = Config.buildmenu.fadetime*0.66
				Config.ordermenu.fadetimeOut = Config.ordermenu.fadetime*0.66
			end
		end
	end
	onWidgetUpdate()
	if (updatehax or firstupdate) then
		if (firstupdate) then
			haxlayout()
			firstupdate = nil
		end
		onNewCommands(GetCommands())
		updatehax = false
		updatehax2 = true
	end
	if (updatehax2) then
		if (SelectedUnitsCount == 0) then
			onNewCommands(emptyCommands,emptyCommands) --flush
			updatehax2 = false
		end
	end
end
