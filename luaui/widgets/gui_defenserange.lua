-- modinclude("colors.h.lua")
include("keysym.h.lua")

local versionNumber = "6.32"

function widget:GetInfo()
	return {
		name      = "Defense Range",
		desc      = "[v" .. string.format("%s", versionNumber ) .. "] Displays range of defenses (enemy and ally)",
		author    = "very_bad_soldier",
		date      = "October 21, 2007",
		license   = "GNU GPL v2",
		layer     = -10000000,
		enabled   = true
	}
end

--[[
changelog:
6.3: heightboost support. missing ba floating turrets added (thx to nixa)
6.2: speed-up by cpu culling
6.12: bugfix (BA Ambusher working)
6.11: added missing water units to BA (torpLauncher/FHLT/FRocketTower)
6.1: -XTA-support added (thx to manolo_)
	 -tweak mode and load/save fixed
	 --]]
	 
-- CONFIGURATION
local debug = false --generates debug message

local modConfig = {}
-- TechA
--to support other mods
--table initialized and unitList is needed!
modConfig["TA"] = {}
modConfig["TA"]["unitList"] = 
							{ 
								--Arm
									--Ground Weapons--
								armclaw = { weapons = { 1 } },
								amortor = { weapons = { 1 } },
								armllt = { weapons = { 1 } },
								armllt1 = { weapons = { 1 } },
								tawf001 = { weapons = { 1 } },
								armhlt = { weapons = { 1 } },
								armvhlt = { weapons = { 1 } },
								armguard = { weapons = { 1, 1 } },
								arm_immolator = { weapons = { 1 } },
								armamb = { weapons = { 1,1 } }, --ambusher
								armpb = { weapons = { 1 } }, --pitbull
								armanni = { weapons = { 1 } },
								armanni1 = { weapons = { 1 } },
								aspdbunk = { weapons = { 1 } },
								armdl = { weapons = { 1 } }, --depthcharge
								ajuno = { weapons = { 1 } },
								armtl = { weapons = { 1 } }, --torp launcher
								armatl = { weapons = { 1 } }, --adv torp launcher
								armfhlt = { weapons = { 1 } },  --floating hlt
								arm_immolator = { weapons = { 1 } },
								armamb = { weapons = { 1,1 } }, --ambusher
								armpb = { weapons = { 1 } }, --pitbull
								armanni = { weapons = { 1 } },
								armanni1 = { weapons = { 1 } },
								aspdbunk = { weapons = { 1 } },
								armemp = { weapons = { 1 } },
								armbrtha = { weapons = { 1 } },
								armbrtha1 = { weapons = { 1 } },
								arm_big_bertha = { weapons = { 1 } },
								armvulc = { weapons = { 1 } },
								armvulc1 = { weapons = { 1 } },
								armvulc2 = { weapons = { 1 } },
								armtabi = { weapons = { 1 } },
								armpcan = { weapons = { 1 } },

									--Anti-Air--
								armrl = { weapons = { 2 } }, --light aa
								armrl1 = { weapons = { 2 } },
								packo = { weapons = { 2 } },
								armcir = { weapons = { 2 } }, --chainsaw
								armcir1 = { weapons = { 2 } }, --chainsaw
								armfrt = { weapons = { 2 } },  --floating rocket laucher
								armflak = { weapons = { 2 } },
								armfflak = { weapons = { 2 } },
								mercury = { weapons = { 2 } },
								armhys = { weapons = { 2 } },

									--Anti-Nuke--
								armamd = { weapons = { 3 } }, --antinuke
								armamd1 = { weapons = { 3 } }, --antinuke
								armamd2 = { weapons = { 3 } }, --antinuke
								armmds = { weapons = { 3 } }, --Missile Defence System

								--Core
									--Ground Weapons--
								cormaw = { weapons = { 1 } },
								cmortor = { weapons = { 1 } },
								corexp = { weapons = { 1 } },
								cormaw = { weapons = { 1 } },
								corllt = { weapons = { 1 } },
								corllt1 = { weapons = { 1 } },
								hllt = { weapons = { 1 } },
								corhlt = { weapons = { 1 } },
								corvhlt = { weapons = { 1 } },
								corfhlt = { weapons = { 1 } },
								corpun = { weapons = { 1, 1 } },
								cordl = { weapons = { 1 } },
								cjuno = { weapons = { 1 } },
								coranta = { weapons = { 1 } },
								corbhmth = { weapons = { 1 } },
								corbhmth1 = { weapons = { 1 } },
								corboucher = { weapons = { 1 } },
								corfhlt = { weapons = { 1 } },  --floating hlt
								cortl = { weapons = { 1 } }, --torp launcher
								coratl = { weapons = { 1 } }, --adv torp launcher
								cortoast = { weapons = { 1 } },
								corvipe = { weapons = { 1 } },
								cordoom = { weapons = { 1 } },
								cordoom1 = { weapons = { 1 } },
								corint = { weapons = { 1 } },
								corint1 = { weapons = { 1 } },
								corbuzz = { weapons = { 1 } },
								corbuzz1 = { weapons = { 1 } },
								corbuzz2 = { weapons = { 1 } },
								core_immolator = { weapons = { 1 } },
								core_immolator1	 = { weapons = { 1 } },
								hllt = { weapons = { 1 } },
								nebraska = { weapons = { 1 } },
								core_intimidator = { weapons = { 1 } },
								corpcan = { weapons = { 1 } },
								cormmds = { weapons = { 3 } }, --Missile Defence System

									--Anti-Air--
								corfrt = { weapons = { 2 } }, --floating rocket laucher
								corrl = { weapons = { 2 } },
								corrl1 = { weapons = { 2 } },
								madsam = { weapons = { 2 } },
								corerad = { weapons = { 2 } },
								corerad1 = { weapons = { 2 } },
								corenaa = { weapons = { 2 } },
								corflak = { weapons = { 2 } },
								screamer = { weapons = { 2 } },
								corpre = { weapons = { 2 } },
								
									--Anti-Nuke--
								corfmd = { weapons = { 3 } },
								corfmd1 = { weapons = { 3 } },
								corfmd2 = { weapons = { 3 } },
								cortron = { weapons = { 3 } },

								--TLL
									--Ground Weapons--
								tllatorp = { weapons = { 1 } },
								tlldcsta = { weapons = { 1 } },
								tllemp = { weapons = { 1 } },
								tllatorp = { weapons = { 1 } },
								tllhlt = { weapons = { 1 } },
								tllhltns = { weapons = { 1 } },
								tlllrpt = { weapons = { 1 } },
								tllobliterator = { weapons = { 1 } },
								tllplasma = { weapons = { 1 } },
								tllpulaser = { weapons = { 1 } },
								tllrlrpc = { weapons = { 1 } },
								tllshoretorp = { weapons = { 1 } },
								tllstuner = { weapons = { 1 } },
								tlltorp = { weapons = { 1 } },
								tllllt = { weapons = { 1 } },
								tlllft = { weapons = { 1 } },
								tllweb = { weapons = { 1 } },
								tllupgweb = { weapons = { 1 } },
								tlldmc = { weapons = { 1 } },
								tlllbt = { weapons = { 1 } },
								tlltrid = { weapons = { 1 } },
								tllkrak = { weapons = { 1 } },
								tlljuno = { weapons = { 1 } },
								tllpcan = { weapons = { 1 } },

									--Anti-Air--
								tlllmt = { weapons = { 2 } },
								tlllmt1 = { weapons = { 2 } },
								tlllmtns = { weapons = { 2 } },
								tllnssam = { weapons = { 2 } },
								tllflak = { weapons = { 2 } },
								tllfflak = { weapons = { 2 } },
								tllsam = { weapons = { 2 } },
								tlldb = { weapons = { 2 } },
								tllhmt = { weapons = { 2 } },

									--Anti-Nuke--
								tllantinuke = { weapons = { 3 } },
								tllantinuke1 = { weapons = { 3 } },
								tllgazelle = { weapons = { 3 } },
								armmds = { weapons = { 3 } } --Missile Defence System
							}

--implement this if you want dps-depending ring-colors
--colors will be interpolated by dps scores between min and max values. values outside range will be set to nearest value in range -> min or max
modConfig["TA"]["armorTags"] = {}
modConfig["TA"]["armorTags"]["air"] = "default"
modConfig["TA"]["armorTags"]["ground"] = "default"
modConfig["TA"]["dps"] = {}
modConfig["TA"]["dps"]["ground"] = {}
modConfig["TA"]["dps"]["air"] = {}
modConfig["TA"]["dps"]["ground"]["min"] = 50
modConfig["TA"]["dps"]["ground"]["max"] = 500
modConfig["TA"]["dps"]["air"]["min"] = 80
modConfig["TA"]["dps"]["air"]["max"] = 500
--end of dps-colors
--implement this if you want custom colors - we dont want it for BA
modConfig["TA"]["color"] = {}
modConfig["TA"]["color"]["enemy"] = {}
modConfig["TA"]["color"]["enemy"]["ground"] = {}
modConfig["TA"]["color"]["enemy"]["air"] = {}

modConfig["TA"]["color"]["enemy"]["nuke"] = {}									 
modConfig["TA"]["color"]["enemy"]["ground"]["min"] = { 1.0, 0.0, 0.0 }
modConfig["TA"]["color"]["enemy"]["ground"]["max"] = { 1.0, 1.0, 0.0 }
modConfig["TA"]["color"]["enemy"]["air"]["min"] = { 0.0, 1.0, 0.0 }

modConfig["TA"]["color"]["enemy"]["air"]["max"] = { 0.0, 0.0, 1.0 }
modConfig["TA"]["color"]["enemy"]["nuke"] =  { 1.0, 1.0, 1.0 }
modConfig["TA"]["color"]["ally"] = modConfig["TA"]["color"]["enemy"]
--end of custom colors
--end of TA

	
--DEFAULT COLOR CONFIG
--is used when no game-specfic color config is found in current game-definition
local colorConfig = {}
colorConfig["enemy"] = {}
colorConfig["enemy"]["ground"]= {}
colorConfig["enemy"]["ground"]["min"]= {}
colorConfig["enemy"]["ground"]["max"]= {}
colorConfig["enemy"]["air"]= {}
colorConfig["enemy"]["air"]["min"]= {}
colorConfig["enemy"]["air"]["max"]= {}
colorConfig["enemy"]["nuke"]= {}
colorConfig["enemy"]["ground"]["min"] = { 1.0, 0.0, 0.0 }
colorConfig["enemy"]["ground"]["max"] = { 1.0, 1.0, 0.0 }
colorConfig["enemy"]["air"]["min"] = { 0.0, 1.0, 0.0 }
colorConfig["enemy"]["air"]["max"] = { 0.0, 0.0, 1.0 }
colorConfig["enemy"]["nuke"] =  { 1.0, 1.0, 1.0 }

colorConfig["ally"] = colorConfig["enemy"]
--end of DEFAULT COLOR CONFIG

local state = {}
state["screenx"], state["screeny"] = widgetHandler:GetViewSizes()
state["curModID"] = nil
state["myPlayerID"] = nil

--Button display configuration
--position only relevant if no saved config data found
local buttonConfig = {}
buttonConfig["enabled"] = { ally = { ground = false, air = false, nuke = false }, enemy = { ground = true, air = true, nuke = true } }

buttonConfig["baseColorEnemy"] = { 0.6, 0.0, 0.0, 0.6 }
buttonConfig["baseColorAlly"] = { 0.0, 0.3, 0.0, 0.6 }
buttonConfig["enabledColorAlly"] = { 0.0, .80, 0.0, 1.9 }
buttonConfig["enabledColorEnemy"] = { 1.00, 0.0, 0.0, 0.95 }

local rangeCircleList --glList for drawing range circles
local _,oldcamy,_ = Spring.GetCameraPosition() --for tracking if we should change the alpha/linewidth based on camheight

local defences = {}	
local currentModConfig = {}
local buttons = {}

local updateTimes = {}
updateTimes["remove"] = 0
updateTimes["line"] = 0
updateTimes["removeInterval"] = 1 --configurable: seconds for the ::update loop

local lineConfig = {}
lineConfig["lineWidth"] = 1.0 -- calcs dynamic now
lineConfig["alphaValue"] = 0.0 --> dynamic behavior can be found in the function "widget:Update"
lineConfig["circleDivs"] = 40.0 

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local GL_LINE_LOOP          = GL.LINE_LOOP
local glBeginEnd            = gl.BeginEnd
local glColor               = gl.Color
local glDepthTest           = gl.DepthTest
local glDrawGroundCircle    = gl.DrawGroundCircle
local glDrawGroundQuad      = gl.DrawGroundQuad
local glLineWidth           = gl.LineWidth
local glTexRect             = gl.TexRect
local glText                = gl.Text
local glTranslate           = gl.Translate
local glVertex              = gl.Vertex
local glAlphaTest			= gl.AlphaTest
local glBlending			= gl.Blending
local glRect				= gl.Rect
local glCallList		 	= gl.CallList
local glCreateList			= gl.CreateList
local glDeleteList			= gl.DeleteList

local huge                  = math.huge
local max					= math.max
local min					= math.min
local sqrt					= math.sqrt
local abs					= math.abs
local lower                 = string.lower
local sub                   = string.sub
local upper                 = string.upper
local floor                 = math.floor
local format                = string.format
local PI                    = math.pi
local cos                   = math.cos
local sin                   = math.sin

local spEcho                = Spring.Echo
local spGetGameSeconds      = Spring.GetGameSeconds
local spGetMouseState       = Spring.GetMouseState
local spGetMyPlayerID       = Spring.GetMyPlayerID
local spGetPlayerInfo       = Spring.GetPlayerInfo
local spGetPositionLosState = Spring.GetPositionLosState
local spGetUnitDefID        = Spring.GetUnitDefID
local spGetUnitPosition     = Spring.GetUnitPosition
local spTraceScreenRay      = Spring.TraceScreenRay
local spGetCameraPosition   = Spring.GetCameraPosition
local spGetMyTeamID			= Spring.GetMyTeamID
local spGetGroundHeight 	= Spring.GetGroundHeight
local spIsGUIHidden 		= Spring.IsGUIHidden
local spGetLocalTeamID	 	= Spring.GetLocalTeamID
local spGetActiveCommand 	= Spring.GetActiveCommand
local spGetActiveCmdDesc 	= Spring.GetActiveCmdDesc
local spIsSphereInView  	= Spring.IsSphereInView

local udefTab				= UnitDefs
local weapTab				= WeaponDefs

--functions
local printDebug
local UpdateButtons
local AddButton
local DetectMod
local SetButtonOrigin
local ResetGl
local GetButton
local ButtonAllyPressed
local ButtonEnemyPressed
local GetColorsByTypeAndDps
local UnitDetected
local GetColorByDps
local CheckDrawTodo
local DrawRanges

local TooHigh = true
local HighPing = false
local FPSCount = Spring.GetFPS()
local FPSLimit = 8
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


function widget:TextCommand(command)
	--Spring.Echo("DEFRANGE", command, mycommand)
	local mycommand=false --buttonConfig["enabled"]["enemy"][tag] 

	if (string.find(command, "defrange")) then 
		mycommand=true
		local ally='ally'
		local rangetype='ground'
		local enabled=false		
		if (string.find(command, "enemy")) then 
			ally='enemy'
		end
		if (string.find(command, "air")) then 
			rangetype='air'
		elseif  (string.find(command, "nuke")) then 
			rangetype='nuke'
		end
		if (string.find(command, "+")) then 
			enabled=true
		end
		buttonConfig["enabled"][ally][rangetype]=enabled
		Spring.Echo("Range visibility of "..ally.." "..rangetype.." defenses set to",enabled)
		return true
	end
	
	return false
end


function widget:Initialize()
	WG['defrange'] = buttonConfig
	state["myPlayerID"] = spGetLocalTeamID()
    widgetHandler:RegisterGlobal('SetOpacity_Defense_Range', SetOpacity)
    widgetHandler:RegisterGlobal('DrawManager_defense_range', DrawStatus)

	DetectMod()


	--Recheck units on widget reload
	local myAllyTeam = Spring.GetMyAllyTeamID()
	local units = Spring.GetAllUnits()
	for i=1,#units do
		local unitID = units[i]
		local unitAllyTeam = Spring.GetUnitAllyTeam(unitID)
		UnitDetected(unitID, unitAllyTeam == myAllyTeam)
	end
end

function widget:ShutDown()
    widgetHandler:DeregisterGlobal('SetOpacity_Defense_Range', SetOpacity)
    widgetHandler:DeregisterGlobal('DrawManager_defense_range', DrawStatus)
end

function widget:UnitCreated( unitID,  unitDefID,  unitTeam)	
 UnitDetected( unitID, true )
end

function widget:UnitEnteredLos(unitID, allyTeam)
	UnitDetected( unitID, false, allyTeam )
end

function UnitDetected( unitID, allyTeam, teamId )
	local tag
	local tabValue = defences[unitID]
	if ( tabValue ~= nil and tabValue[1] ~= allyTeam) then
		--unit already known
		return
	end
	
	local udef = UnitDefs[spGetUnitDefID(unitID)]
	local key = tostring(unitID)
	local x, y, z = spGetUnitPosition(unitID)
					
	local range = 0
	local type = 0
	local dps
	local weaponDef
	
	if ( #udef.weapons == 0  ) then
		--not interesting, has no weapons, lame
		return
	end

	if udef.canMove then 
		--not interesting, it moves
		return
	end
	
	printDebug( udef.name )
	local foundWeapons = {}
			
	for i=1, #udef.weapons do
		if ( currentModConfig["unitList"][udef.name] == nil or currentModConfig["unitList"][udef.name]["weapons"][i] == nil ) then
			printDebug("Weapon skipped! Name: "..  udef.name .. " weaponidx: " .. i )
		else
			--get definition from weapon table
			weaponDef = weapTab[ udef.weapons[i].weaponDef ]

			range = weaponDef.range --get normal weapon range
			--printDebug("Weapon #" .. i .. " Range: " .. range .. " Type: " .. weaponDef.type )

			type = currentModConfig["unitList"][udef.name]["weapons"][i]
							
			local dam = weaponDef.damages
			local dps
			local damage
				
			--check if dps-depending colors should be used
			if ( currentModConfig["armorTags"] ~= nil ) then
				printDebug("DPS colors!")
				if ( type == 1 or type == 4 ) then	 -- show combo units with ground-dps-colors
					tag = currentModConfig["armorTags"] ["ground"]
				elseif ( type == 2 ) then
					tag = currentModConfig["armorTags"] ["air"]
				elseif ( type == 3 ) then -- antinuke
					range = weaponDef.coverageRange
					dps = nil
					tag = nil
				end			
						
				if ( tag ~= nil ) then
					--printDebug("Salvo: " .. weaponDef.salvoSize 	)
					damage = dam[Game.armorTypes[tag]]
					dps = damage * weaponDef.salvoSize / weaponDef.reload		
					--printDebug("DPS: " .. dps 	)
				end
						
				color1, color2 = GetColorsByTypeAndDps( dps, type, ( allyTeam == false ) )		
			else
				printDebug("Default colors!")
				local team = "ally"
				if ( allyTeam ) then
					team = "enemy"
				end
				
				if ( type == 1 or type == 4 ) then	 -- show combo units with ground-dps-colors
					color1 = colorConfig[team]["ground"]["min"]
					color2 = colorConfig[team]["air"]["min"]
				elseif ( type == 2 ) then
					color1 = colorConfig[team]["air"]["min"]
				elseif ( type == 3 ) then -- antinuke
					color1 = colorConfig[team]["nuke"]
				end			
			end
			
			--add weapon to list
			local rangeLines = CalcBallisticCircle(x,y,z,range, weaponDef )
			local rangeLinesEx = CalcBallisticCircle(x,y,z,range + 3, weaponDef ) --calc a little bigger circle to display for combo-weapons (air and ground) to display both circles together (without overlapping)
			foundWeapons[i] = { type = type, range = range, rangeLines = rangeLines, rangeLinesEx = rangeLinesEx, color1 = color1, color2 = color2 }
			printDebug("Detected Weapon - Type: " .. type .. " Range: " .. range )
		end
	end

	printDebug("Adding UnitID " .. unitID .. " WeaponCount: " .. #foundWeapons ) --.. "W1: " .. foundWeapons[1]["type"])
	defences[unitID] = { allyState = ( allyTeam == false ), pos = {x, y, z}, unitId = unitID }
	defences[unitID]["weapons"] = foundWeapons
	
	UpdateCircleList()
end

function GetColorsByTypeAndDps( dps, type, isEnemy )
	--BEWARE: dps can be nil here! when antinuke for example
 -- get alternative color for weapons ground AND air
	local color1 = nil
	local color2 = nil
	if ( type == 4 ) then -- show combo units with "ground"-colors
		if ( isEnemy ) then	
			color2 = GetColorByDps( dps, true, "air" ) 
		else
			color2 = GetColorByDps( dps, false, "air") 
		end	
	end		
  
  --get standard colors
	if ( type == 1 or type == 4 ) then
	  if ( isEnemy ) then
			color1 = GetColorByDps( dps, true, "ground" ) 
		else
			color1 = GetColorByDps( dps, false, "ground") 
		end	
	elseif ( type == 2 ) then
		if ( isEnemy ) then
			color1 = GetColorByDps( dps, true, "air" ) 
		else
			color1 = GetColorByDps( dps, false, "air") 
		end	
	elseif ( type == 3 ) then
		if ( isEnemy ) then
			color1 = colorConfig["enemy"]["nuke"]
		else
			color1 = colorConfig["ally"]["nuke"]
		end	
	end
	
	return color1, color2
end

--linear interpolates between min and max color
function GetColorByDps( dps, isEnemy, typeStr )
	local color = { 0.0, 0.0, 0.0 }
	local team = "ally"
	if ( isEnemy ) then team = "enemy" end
	
	printDebug("GetColor typeStr : " .. typeStr  .. "Team: " .. team )
	--printDebug( colorConfig[team][typeStr]["min"] )
	local ldps = max( dps, currentModConfig["dps"][typeStr]["min"] )
	ldps = min( ldps, currentModConfig["dps"][typeStr]["max"])

	ldps = ldps - currentModConfig["dps"][typeStr]["min"]
	local factor = ldps / ( currentModConfig["dps"][typeStr]["max"] - currentModConfig["dps"][typeStr]["min"] )
--	printDebug( "Dps: " .. dps .. " Factor: " .. factor .. " ldps: " .. ldps )
	for i=1,3 do
		color[i] =  ( ( ( 1.0 -  factor ) * colorConfig[team][typeStr]["min"][i] ) + ( factor * colorConfig[team][typeStr]["max"][i] ) )
	--	printDebug( "#" .. i .. ":" .. "min: " .. colorConfig[team][typeStr]["min"]["color"][i] .. " max: " .. colorConfig[team][typeStr]["max"]["color"][i] .. " calc: " .. color[i] ) 
	end
	return color
end

function ResetGl() 
	glColor( { 1.0, 1.0, 1.0, 1.0 } )
	glLineWidth( 1.0 )
end

local darkOpacity = 0
function SetOpacity(dark,light)
    darkOpacity = dark
end

function DrawStatus(toohigh,fps,ping)
    TooHigh = toohigh
    FPSCount = fps
    HighPing = ping
end

function widget:Update()
	if TooHigh or HighPing then
		return
	end
	local timef = spGetGameSeconds()
	local time = floor(timef)

	if ( (timef - updateTimes["line"]) > 0.2 and timef ~= updateTimes["line"] ) then	
		updateTimes["line"] = timef
		
		--adjust line width and alpha by camera height (old code, kept for refence)
        --[[
		_, camy, _ = spGetCameraPosition()
		if ( camy < 700 ) and ( oldcamy >= 700 ) then
			oldcamy = camy
			lineConfig["lineWidth"] = 2.0
			lineConfig["alphaValue"] = 0.25
			UpdateCircleList()
		elseif ( camy < 1800 ) and ( oldcamy >= 1800 ) then
			oldcamy = camy
			lineConfig["lineWidth"] = 1.5
			lineConfig["alphaValue"] = 0.3
			UpdateCircleList()
		elseif ( camy > 1800 ) and ( oldcamy <= 1800 ) then
			oldcamy = camy
			lineConfig["lineWidth"] = 1.0
			lineConfig["alphaValue"] = 0.35
			UpdateCircleList()
		end
        ]]
        
        lineConfig["lineWidth"] = 1.0
        lineConfig["alphaValue"] = darkOpacity
        UpdateCircleList()
	
	end
    
	
	-- update timers once every <updateInt> seconds
	if (time % updateTimes["removeInterval"] == 0 and time ~= updateTimes["remove"] ) then	
		updateTimes["remove"] = time
		--do update stuff:
		
		--remove dead units
		for k, def in pairs(defences) do
			local udefID = spGetUnitDefID(def["unitId"])
			
			local x, y, z = def["pos"][1], def["pos"][2], def["pos"][3]
			local a, b, c = spGetPositionLosState(x, y, z)
			local losState = b
	
			
			if (losState) then	
				if (udefID == nil) then
					printDebug("Unit killed.")
					defences[k] = nil
					UpdateCircleList()
				end
			end				
		end	
	end
end

function DetectMod()
	state["curModID"] = upper(Game.modShortName or "")
	
	if ( modConfig[state["curModID"]] == nil ) then
		spEcho("<DefenseRange> Unsupported Game, shutting down...")
		widgetHandler:RemoveWidget()
		return
	end

	currentModConfig = modConfig[state["curModID"]]
	
	--load mod specific color config if existent
	if ( currentModConfig["color"] ~= nil ) then
		colorConfig = currentModConfig["color"]
		printDebug("Game-specfic color configuration loaded")
	end
	
	printDebug( "<DefenseRange> ModName: " .. Game.modName .. " Detected Mod: " .. state["curModID"] )
end

function GetRange2DWeapon( range, yDiff)
	local root1 = range * range - yDiff * yDiff
	if ( root1 < 0 ) then
		return 0
	else
		return sqrt( root1 )
	end
end

function GetRange2DCannon( range, yDiff, projectileSpeed, rangeFactor, myGravity, heightBoostFactor )
	local factor = 0.7071067
	local smoothHeight = 100.0
	local speed2d = projectileSpeed*factor
	local speed2dSq = speed2d*speed2d
	local curGravity = Game.gravity 
	if ( myGravity ~= nil and myGravity ~= 0 ) then
		gravity = myGravity   -- i have never seen a stationary weapon using myGravity tag, so its untested :D
	end
	local gravity = - ( curGravity / 900 ) -- -0.13333333
		
	--printDebug("rangeFactor: " .. rangeFactor)
	--printDebug("ProjSpeed: " .. projectileSpeed)
	if ( heightBoostFactor < 0.0 ) then
		heightBoostFactor = (2.0 - rangeFactor) / sqrt(rangeFactor)
	end
	
	if ( yDiff < -smoothHeight ) then
		yDiff = yDiff * heightBoostFactor
	elseif ( yDiff < 0.0 ) then
		yDiff = yDiff * ( 1.0 + ( heightBoostFactor - 1.0 ) * ( -yDiff)/smoothHeight )
	end
	
	local root1 = speed2dSq + 2 * gravity * yDiff
	if ( root1 < 0.0 ) then
		printDebug("Cann return 0")
		return 0.0
	else
		printDebug("Cann return: " .. rangeFactor * ( speed2dSq + speed2d * sqrt( root1 ) ) / (-gravity) )
		return rangeFactor * ( speed2dSq + speed2d * sqrt( root1 ) ) / (-gravity)
	end	
end

--hopefully accurate reimplementation of the spring engine's ballistic circle code
function CalcBallisticCircle( x, y, z, range, weaponDef ) 
	local rangeLineStrip = {}
	local slope = 0.0
				
	local rangeFunc = GetRange2DWeapon
	local rangeFactor = 1.0 --used by range2dCannon
	if ( weaponDef.type == "Cannon" ) then
		rangeFunc = GetRange2DCannon
		rangeFactor = range / GetRange2DCannon( range, 0.0, weaponDef.projectilespeed, rangeFactor, nil, weaponDef.heightBoostFactor )
		if ( rangeFactor > 1.0 or rangeFactor <= 0.0 ) then
			rangeFactor = 1.0
		end
	end
	
				
	local yGround = spGetGroundHeight( x,z)
	for i = 1, lineConfig["circleDivs"] do
		local radians = 2.0 * PI * i / lineConfig["circleDivs"]
		local rad = range
								
		local sinR = sin( radians )
		local cosR = cos( radians )
					
		local posx = x + sinR * rad
		local posz = z + cosR * rad
		local posy = spGetGroundHeight( posx, posz )

		local heightDiff = ( posy - yGround ) / 2.0							-- maybe y has to be getGroundHeight(x,z) cause y is unit center and not aligned to ground			
					
		rad = rad - heightDiff * slope
		local adjRadius = rangeFunc( range, heightDiff * weaponDef.heightMod, weaponDef.projectilespeed, rangeFactor, nil, weaponDef.heightBoostFactor )
		local adjustment = rad / 2.0
		local yDiff = 0.0
					
		for j = 0, 49 do
			if ( abs( adjRadius - rad ) + yDiff <= 0.01 * rad ) then
				break
			end
						
			if ( adjRadius > rad ) then
				rad = rad + adjustment
			else
				rad = rad - adjustment
				adjustment = adjustment / 2.0
			end
						
			posx = x + ( sinR * rad )
			posz = z + ( cosR * rad )
			local newY = spGetGroundHeight( posx, posz )

			yDiff = abs( posy - newY )
			posy = newY
			posy = max( posy, 0.0 )  --hack
			
			heightDiff = ( posy - yGround ) 																--maybe y has to be Ground(x,z)
			adjRadius = rangeFunc( range, heightDiff * weaponDef.heightMod, weaponDef.projectilespeed, rangeFactor, weaponDef.myGravity, weaponDef.heightBoostFactor )
		end
					
					
		posx = x + ( sinR * adjRadius )
		posz = z + ( cosR * adjRadius )
		posy = spGetGroundHeight( posx, posz ) + 5.0
		posy = max( posy, 0.0 )   --hack
			
		table.insert( rangeLineStrip, { posx, posy, posz } )
	end
			  
	return rangeLineStrip
end

function CheckDrawTodo( def, weaponIdx )
	if ( def.weapons[weaponIdx]["type"] == 1 or def.weapons[weaponIdx]["type"] == 4 ) then
		if ( def["allyState"] == true and buttonConfig["enabled"]["enemy"]["ground"] ) then
			return true
		elseif ( def["allyState"] == false and buttonConfig["enabled"]["ally"]["ground"] ) then
			return true
		else
			return false
		end	
	end
			
	if ( def.weapons[weaponIdx]["type"] == 2 or def.weapons[weaponIdx]["type"] == 4 ) then
		if ( def["allyState"] == true and buttonConfig["enabled"]["enemy"]["air"] ) then
			return true
		elseif ( def["allyState"] == false and buttonConfig["enabled"]["ally"]["air"] ) then
			return true
		else
			return false
		end
	end
			
	if ( def.weapons[weaponIdx]["type"] == 3 ) then
		if ( def["allyState"] == true and buttonConfig["enabled"]["enemy"]["nuke"] ) then
			return true
		elseif ( def["allyState"] == false and buttonConfig["enabled"]["ally"]["nuke"] ) then
			return true
		end	
	end
			
	return false
end



local function BuildVertexList(verts)
	for i, vert in pairs(verts) do
		--printDebug(verts)
		glVertex(vert)
	end
end

function DrawRanges()
	glDepthTest(true)

	local color
	local range
	for test, def in pairs(defences) do
		--Spring.Echo('defrange drawrranges test',test, #def["weapons"])
		for i, weapon in pairs(def["weapons"]) do
			local execDraw = false
			if (false) then --3.9 % cpu, 45 fps
				if ( spIsSphereInView( def["pos"][1], def["pos"][2], def["pos"][3], weapon["range"] ) ) then
					execDraw = CheckDrawTodo( def, i )			
				end
			else--faster: 3.0% cpu, 46fps
			
				if (  CheckDrawTodo( def, i )) then 
					execDraw =spIsSphereInView( def["pos"][1], def["pos"][2], def["pos"][3], weapon["range"] )
				end
			end
			if ( execDraw ) then
				color = weapon["color1"]
				range = weapon["range"]
				if ( weapon["type"] == 4 ) then
					if (
						( ( def["allyState"] == true and buttonConfig["enabled"]["enemy"]["air"] ) or ( def["allyState"] == false and buttonConfig["enabled"]["ally"]["air"] ) ) 
						and
						( ( def["allyState"] == true and buttonConfig["enabled"]["enemy"]["ground"] == false ) or ( def["allyState"] == false and buttonConfig["enabled"]["ally"]["ground"] == false ) )
						) then
						-- check if unit is combo unit, get secondary color if so
						--if air only is selected
						color = weapon["color2"]
					end
				end
							
				glColor( color[1], color[2], color[3], lineConfig["alphaValue"])
				glLineWidth(lineConfig["lineWidth"])
				glBeginEnd(GL_LINE_LOOP, BuildVertexList, weapon["rangeLines"] )
				
				--printDebug( "Drawing defence: range: " .. range .. " Color: " .. color[1] .. "/" .. color[2] .. "/" .. color[3] .. " a:" .. lineConfig["alphaValue"] )				
						
				if ( ( weapon["type"] == 4 )
						and 
						( ( def["allyState"] == true and buttonConfig["enabled"]["enemy"]["air"] ) or ( def["allyState"] == false and buttonConfig["enabled"]["ally"]["air"] ) )
						and
						( ( def["allyState"] == true and buttonConfig["enabled"]["enemy"]["ground"] ) or ( def["allyState"] == false and buttonConfig["enabled"]["ally"]["ground"] ) )
				) then
					--air and ground: draw 2nd circle
					glColor( weapon["color2"][1], weapon["color2"][2], weapon["color2"][3], lineConfig["alphaValue"])
					glBeginEnd(GL_LINE_LOOP, BuildVertexList, weapon["rangeLinesEx"] )
				end
			end						
		end
	end

	glDepthTest(false)
end


function UpdateCircleList()
	--delete old list
	if rangeCircleList then
		glDeleteList(rangeCircleList)
	end
	
	rangeCircleList = glCreateList(function()
		--create new list
		DrawRanges()
		ResetGl()
	end)
end

function widget:DrawWorld()

  	if spIsGUIHidden() or HighPing then
		return
	end
	
	if rangeCircleList then
		glCallList(rangeCircleList)
	else
		UpdateCircleList()
	end
end

function printDebug( value )
	if ( debug ) then
		if ( type( value ) == "boolean" ) then
			if ( value == true ) then spEcho( "true" )
				else spEcho("false") end
		elseif ( type(value ) == "table" ) then
			spEcho("Dumping table:")
			for key,val in pairs(value) do 
				spEcho(key,val) 
			end
		else
			spEcho( value )
		end
	end
end



--SAVE / LOAD CONFIG FILE
function widget:GetConfigData()
	local data = {}
	data["buttons"] = buttonConfig["enabled"]
	return data
end

function widget:SetConfigData(data) 
	printDebug("Loading config...")
	if (data ~= nil) then
		if ( data["buttons"] ~= nil ) then
			buttonConfig["enabled"] = data["buttons"]
			printDebug("enabled config found...")
		end
	end
end
--END OF SAFE CONFIG FILE