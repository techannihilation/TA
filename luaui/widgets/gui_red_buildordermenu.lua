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
local update = 4.0

local buttonTexture	= LUAUI_DIRNAME.."Images/button.png"
local oldUnitpicsDir = LUAUI_DIRNAME.."Images/oldunitpics/"

local oldUnitpics = true

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

local sGetSelectedUnitsCount = Spring.GetSelectedUnitsCount
local sGetActiveCommand = Spring.GetActiveCommand
local sGetActiveCmdDescs = Spring.GetActiveCmdDescs
local ssub = string.sub

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
		color=r.cbuttonbackground,
		border={0,0,0,0},
		
		options="n", --disable colorcodes
		captioncolor=r.ctext,
		
		overridecursor = true,
		overrideclick = {3},
		
		mouseheld={
			{1,function(mx,my,self)
				heldhighlight.px = self.px
				heldhighlight.py = self.py
				heldhighlight.active = nil
			end},
		},
		mouseover=function(mx,my,self)
			if self.cmdID then
				WG["cmdID"] = self.cmdID
				--Spring.Echo(WG["cmdID"],self.cmdname)
			end
			mouseoverhighlight.px = self.px
			mouseoverhighlight.py = self.py
			mouseoverhighlight.active = nil
			SetTooltip(self.tooltip)
		end,
		
		onupdate=function(self)
			local _,_,_,curcmdname = sGetActiveCommand()
			if (curcmdname ~= nil) then
				if (self.cmdname == curcmdname) then
					selecthighlight.px = self.px
					selecthighlight.py = self.py
					selecthighlight.active = nil
				end
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
	
	return {
		["background"] = background,
		["icons"] = icons,
		["backward"] = backward,
		["forward"] = forward,
		["indicator"] = indicator,
		["staterectangles"] = staterectangles,
		["staterect"] = staterect,
	}
end

local function UpdateGrid(g,cmds,ordertype)
	if (#cmds==0) then
		g.background.active = false
	else
		g.background.active = nil
	end

	local curpage = g.page
	local icons = g.icons
	local page = {{}}
	
	for i=1,#cmds do
		local index = i-(#page-1)*#icons
		page[#page][index] = cmds[i]
		if ((i == (#icons*#page)) and (i~=#cmds)) then
			page[#page+1] = {}
		end
	end
	g.pagecount = #page
	
	if (curpage > g.pagecount) then
		curpage = 1
	end
	
	local iconsleft = (#icons-#page[curpage])
	if (iconsleft > 0) then
		for i=iconsleft+#page[curpage],#page[curpage]+1,-1 do
			icons[i].active = false --deactivate
		end
	end
	
	for i=1,#g.staterectangles do
		g.staterectangles[i].active = false
	end
	local usedstaterectangles = 0
	
	for i=1,#page[curpage] do
		local cmd = page[curpage][i]
		local icon = icons[i]
		icon.tooltip = cmd.tooltip
		icon.active = nil --activate
		icon.cmdname = cmd.name
		icon.cmdID = cmd.id
		icon.texture = buttonTexture
		if (cmd.texture) then
			if (cmd.texture ~= "") then
				icon.texture = cmd.texture
			end
		end

		if (cmd.disabled) then
			icon.texturecolor = {0.45,0.45,0.45,0.98}
		else
			if (ordertype ~= 1) then
				if icon.texture == buttonTexture then
					icon.texturecolor = {1,1,1,0.95}
				else
					icon.texturecolor = {1,1,1,0.99}
				end
			else
				icon.texturecolor = {1,1,1,0.98}
			end
		end
		
		icon.mouseclick = {
			{1,function(mx,my,self)
				SpSetActiveCommand(SpGetCmdDescIndex(cmd.id),1,true,false,SpGetModKeyState())
			end},
			{3,function(mx,my,self)
				SpSetActiveCommand(SpGetCmdDescIndex(cmd.id),3,false,true,SpGetModKeyState())
			end},
		}
		
		if (ordertype == 1) then --build orders
			if oldUnitpics and UnitDefs[cmd.id*-1] ~= nil and VFS.FileExists(oldUnitpicsDir..UnitDefs[cmd.id*-1].name..'.png') then
				icon.texture = oldUnitpicsDir..UnitDefs[cmd.id*-1].name..'.png'
			else
				icon.texture = "#"..cmd.id*-1
			end
			if (cmd.params[1]) then
				icon.caption = "\n\n"..cmd.params[1].."          "
			else
				icon.caption = nil
			end
		else
			if (cmd.type == 5) then --state cmds (fire at will, etc)
				icon.caption = " "..(cmd.params[cmd.params[1]+2] or cmd.name).." "
				
				local statecount = #cmd.params-1 --number of states for the cmd
				local curstate = cmd.params[1]+1
				
				for i=1,statecount do
					usedstaterectangles = usedstaterectangles + 1
					local s = g.staterectangles[usedstaterectangles]
					if (s == nil) then
						s = New(Copy(g.staterect,true))
						g.staterectangles[usedstaterectangles] = s
						table.insert(g.background.movableslaves,s)
					end
					s.active = nil --activate
					
					local spread = 2
					s.sx = (icon.sx-(spread*(statecount-1+2)))/statecount
					s.sy = icon.sy/7
					s.px = icon.px+spread + (s.sx+spread)*(i-1)
					s.py = icon.py + icon.sy - s.sy -spread
					
					if (i == curstate) then
						if (statecount < 4) then
							if (i == 1) then
								s.color = {0.8,0,0,1}
							elseif (i == 2) then
								if (statecount == 3) then
									s.color = {0.8,0.8,0,1}
								else
									s.color = {0,0.8,0,1}
								end
							elseif (i == 3) then
								s.color = {0,0.8,0,1}
							end
						else
							s.color = {0.8,0.8,0.8,1}
						end
					else
						s.color = nil
					end
				end
			else
				icon.caption = " "..cmd.name.." "
			end
		end
	end
	
	if (#page>1) then
		g.forward.mouseclick={
			{1,function(mx,my,self)
				g.page = g.page + 1
				if (g.page > g.pagecount) then
					g.page = 1
				end
				UpdateGrid(g,cmds,ordertype)
			end},
		}
		g.backward.mouseclick={
			{1,function(mx,my,self)
				g.page = g.page - 1
				if (g.page < 1) then
					g.page = g.pagecount
				end
				UpdateGrid(g,cmds,ordertype)
			end},
		}
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
		Spring.ForceLayoutUpdate()
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
local function GetCommands()
	local hiddencmds = {
		[76] = true, --load units clone
		[65] = true, --selfd
		[9] = true, --gatherwait
		[8] = true, --squadwait
		[7] = true, --deathwait
		[6] = true, --timewait
	}
	local buildcmds = {}
	local statecmds = {}
	local othercmds = {}
	local buildcmdscount = 0
	local statecmdscount = 0
	local othercmdscount = 0
	for index,cmd in pairs(sGetActiveCmdDescs()) do
		if (type(cmd) == "table") then
			if (
			(not hiddencmds[cmd.id]) and
			(cmd.action ~= nil) and
			--(not cmd.disabled) and
			(cmd.type ~= 21) and
			(cmd.type ~= 18) and
			(cmd.type ~= 17)
			) then
				if ((cmd.type == 20) --build building
				or (ssub(cmd.action,1,10) == "buildunit_")) then
					buildcmdscount = buildcmdscount + 1
					buildcmds[buildcmdscount] = cmd
				elseif (cmd.type == 5) then
					statecmdscount = statecmdscount + 1
					statecmds[statecmdscount] = cmd
				else
					othercmdscount = othercmdscount + 1
					othercmds[othercmdscount] = cmd
				end
			end
		end
	end
	local tempcmds = {}
	for i=1,statecmdscount do
		tempcmds[i] = statecmds[i]
	end
	for i=1,othercmdscount do
		tempcmds[i+statecmdscount] = othercmds[i]
	end
	othercmdscount = othercmdscount + statecmdscount
	othercmds = tempcmds
	
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
		return "", xIcons, yIcons, {}, {}, {}, {}, {}, {}, {}, iconList
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
    Spring.ForceLayoutUpdate()
  end

  if frame%9==0 then
  	WG["cmdID"] = nil
  end
end

function widget:Update()
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
			onNewCommands({},{}) --flush
			updatehax2 = false
		end
	end
end
