
function widget:GetInfo()
	return {
		name      = "Initial Queue",
		desc      = "Allows you to queue buildings before game start",
		author    = "Niobium",
		version   = "1.6",
		date      = "7 April 2010",
		license   = "GNU GPL, v2 or later",
		layer     = -1, -- Puts it above minimap_startboxes with layer 0
		enabled   = true,
		handler   = true
	}
end
-- 12 jun 2012: "uDef.isMetalExtractor" was replaced by "uDef.extractsMetal > 0" to fix "metal" mode map switching (by [teh]decay, thx to vbs and Beherith)
-- 20 march 2013: added keyboard support with BA keybinds (Bluestone)
-- august 2013: send queue length to cmd_idle_players (BrainDamage)
-- june 2015: guishader + rounded corners + hover effect + widget scales with resolution + remembers queue after /luaui reload (Floris)


------------------------------------------------------------
-- Config
------------------------------------------------------------
-- Panel
local iconWidth = 55
local iconHeight = 52
local iconPadding = 0.2
local borderSize = 0
local maxCols = 5
local fontSize = 17
local margin = 1
local drawTooltip = true -- drawBigTooltip = true... this needs to be true aswell
local drawBigTooltip = false
local borderPadding = 1
local borderColor = {1,1,1,0.025}
local backgroundColor = {0,0,0,0.66}
local hoverColor = {1,1,1,0.25}
local pushedColor = {1,0.1,0,0.33}
local clickColor = {0.66,1,0,0.25}
--local pressColor = {1,0,0,0.44}
local bgcorner = LUAUI_DIRNAME .. "Images/bgcorner.png"
local buttonhighlight = ":n:" .. LUAUI_DIRNAME .. "Images/button-highlight.dds"
local buttonpushed = ":n:" .. LUAUI_DIRNAME .. "Images/button-pushed.dds"
local oldUnitpicsDir = LUAUI_DIRNAME .. "Images/oldunitpics/"
local customScale = 0.95
-- Colors
local buildDistanceColor = {0.3,1.0,0.3,0.6}
local buildLinesColor = {0.3,1.0,0.3,0.6}
local borderNormalColor = {0.3,1.0,0.3,0.5}
local borderClashColor = {0.7,0.3,0.3,1.0}
local borderValidColor = {0.0,1.0,0.0,1.0}
local borderInvalidColor = {1.0,0.0,0.0,1.0}
local buildingQueuedAlpha = 0.5
local metalColor = '\255\196\196\255' -- Light blue
local energyColor = '\255\255\255\128' -- Light yellow
local buildColor = '\255\128\255\128' -- Light green
local whiteColor = '\255\255\255\255' -- White
local vsx,vsy = gl.GetViewSizes()
local widgetScale = 1 -- will adjust based on resolution
local GL_ONE = GL.ONE
local GL_ONE_MINUS_SRC_ALPHA = GL.ONE_MINUS_SRC_ALPHA
local GL_SRC_ALPHA = GL.SRC_ALPHA
local glBlending = gl.Blending

-- Building ids
local ARMCOM = UnitDefNames["armcom"].id
local CORCOM = UnitDefNames["corcom"].id
local TLLCOM = UnitDefNames["tllcom"].id
local TALON_COM = UnitDefNames["talon_com"].id
 
local ARMMEX = UnitDefNames["armmex"].id
local CORMEX = UnitDefNames["cormex"].id
local TLLMEX = UnitDefNames["tllmex"].id
local TALON_MEX = UnitDefNames["talon_mex"].id
 
local ARMUWMEX = UnitDefNames["armuwmex"].id
local CORUWMEX = UnitDefNames["coruwmex"].id
local TLLUWMEX = UnitDefNames["tlluwmex"].id
local TALON_UWMEX = UnitDefNames["talon_uwmex"].id
 
local ARMSOLAR = UnitDefNames["armsolar"].id
local CORSOLAR = UnitDefNames["corsolar"].id
local TLLSOLAR = UnitDefNames["tllsolar"].id
local TALON_SOLAR = UnitDefNames["talon_solar"].id
 
 
local ARMWIN = UnitDefNames["armwin"].id
local CORWIN = UnitDefNames["corwin"].id
local TLLWIND = UnitDefNames["tllwindtrap"].id
local TALON_WIND = UnitDefNames["talon_win"].id
 
local ARMTIDE = UnitDefNames["armtide"].id
local CORTIDE = UnitDefNames["cortide"].id
local TLLTIDE = UnitDefNames["tlltide"].id
local TALON_TIDE = UnitDefNames["talon_tide"].id
 
local ARMLLT = UnitDefNames["armllt"].id
local CORLLT = UnitDefNames["corllt"].id
local TLLLLT = UnitDefNames["tllllt"].id
local TALON_LLT = UnitDefNames["talon_llt"].id
 
local ARMRAD = UnitDefNames["armrad"].id
local CORRAD = UnitDefNames["corrad"].id
local TLLRADAR = UnitDefNames["tllradar"].id
local TALON_RADAR = UnitDefNames["talon_rad"].id
 
local ARMRL = UnitDefNames["armrl"].id
local CORRL = UnitDefNames["corrl"].id
local TLLLMT = UnitDefNames["tlllmt"].id
local TALON_RL = UnitDefNames["talon_rl"].id
 
local ARMTL = UnitDefNames["armtl"].id
local CORTL = UnitDefNames["cortl"].id
local TllToRP = UnitDefNames["tlltorp"].id
local TALON_TL = UnitDefNames["talon_tl"].id
 
local ARMSONAR = UnitDefNames["armsonar"].id
local CORSONAR = UnitDefNames["corsonar"].id
local TLLSONAR = UnitDefNames["tllsonar"].id
local TALON_SONAR = UnitDefNames["talon_sonar"].id
 
 
local ARMFRT = UnitDefNames["armfrt"].id
local CORFRT = UnitDefNames["corfrt"].id
local TLLLMTNS = UnitDefNames["tlllmtns"].id
local TALON_FRL = UnitDefNames["talon_frl"].id
 
 
local ARMLAB = UnitDefNames["armlab"].id
local CORLAB = UnitDefNames["corlab"].id
local TLLLAB = UnitDefNames["tlllab"].id
local TALON_CLONE_LAB = UnitDefNames["talon_clone_lab"].id
 
 
local ARMVP = UnitDefNames["armvp"].id
local CORVP = UnitDefNames["corvp"].id
local TLLVP = UnitDefNames["tllvp"].id
local TALON_VP = UnitDefNames["talon_vp"].id
 
 
local ARMSY = UnitDefNames["armsy"].id
local CORSY = UnitDefNames["corsy"].id
local TLLSY = UnitDefNames["tllsy"].id
local TALON_SY = UnitDefNames["talon_sy"].id
 
-- these are not used for hotkeys but used for switch faction buildings
 
local ARMMSTOR = UnitDefNames["armmstor"].id
local CORMSTOR = UnitDefNames["cormstor"].id
local TLLMSTOR = UnitDefNames["tllmstor"].id
local TALON_MSTOR = UnitDefNames["talon_mstor"].id
 
 
local ARMESTOR = UnitDefNames["armestor"].id
local CORESTOR = UnitDefNames["corestor"].id
local TLLESTOR = UnitDefNames["tllestor"].id
local TALON_ESTOR = UnitDefNames["talon_estor"].id
 
local ARMMAKR = UnitDefNames["armmakr"].id
local CORMAKR = UnitDefNames["cormakr"].id
local TLLMM = UnitDefNames["tllmm"].id
local TALON_MAKR = UnitDefNames["talon_makr"].id
 
local ARMEYES = UnitDefNames["armeyes"].id
local COREYES = UnitDefNames["coreyes"].id
local TllToWER = UnitDefNames["tlltower"].id
 
local ARMDRAG = UnitDefNames["armdrag"].id
local CORDRAG = UnitDefNames["cordrag"].id
local TLLDTNS = UnitDefNames["tlldtns"].id
local TALON_DRAG = UnitDefNames["talon_drag"].id
 
local ARMDL = UnitDefNames["armdl"].id
local CORDL = UnitDefNames["cordl"].id
local TLLSHORETORP = UnitDefNames["tllshoretorp"].id
--local TALON_TL = UnitDefNames["talon_tl"].id --???? FIXME SKYMYJ
 
 
local ARMAP = UnitDefNames["armap"].id
local CORAP = UnitDefNames["corap"].id
local TLLAP = UnitDefNames["tllap"].id
local TALON_AP = UnitDefNames["talon_ap"].id
 
 
local ARMFRAD = UnitDefNames["armfrad"].id
local CORFRAD = UnitDefNames["corfrad"].id
--local TLLDTNS = UnitDefNames["tlldtns"].id --???? FIXME SKYMYJ
local TALON_FRAD = UnitDefNames["talon_frad"].id -- not in use, fix me SKYMYJ need to be added to TalonToArm, ToCore and etc
 
local ARMUWMS = UnitDefNames["armuwms"].id
local CORUWMS = UnitDefNames["coruwms"].id
local TLLUWMSTORAGE = UnitDefNames["tlluwmstorage"].id
local TALON_UWMS = UnitDefNames["talon_uwms"].id
 
local ARMUWES = UnitDefNames["armuwes"].id
local CORUWES = UnitDefNames["coruwes"].id
local TLLUWESTORAGE = UnitDefNames["tlluwestorage"].id
local TALON_UWES = UnitDefNames["talon_uwes"].id
 
local ARMFMKR = UnitDefNames["armfmkr"].id
local CORFMKR = UnitDefNames["corfmkr"].id
local TLLWMCONV = UnitDefNames["tllwmconv"].id
local TALON_FMKR = UnitDefNames["talon_fmkr"].id
 
local ARMFDRAG = UnitDefNames["armfdrag"].id
local CORFDRAG = UnitDefNames["corfdrag"].id
--local TLLDTNS = UnitDefNames["tlldtns"].id --???? FIXME SKYMYJ
local TALON_FDRAG = UnitDefNames["talon_fdrag"].id
 
local ARMGEOMINI = UnitDefNames["armgeo_mini"].id
local CORGEOMINI = UnitDefNames["corgeo_mini"].id
local TLLGEOMINI = UnitDefNames["tllgeo_mini"].id
local TALON_GEOMINI = UnitDefNames["talon_geo_mini"].id

-- this info is used to switch buildings between factions
local ArmToCore = {}

-- to check if OTA icon exist, defs table
local OtaIconExist = {}

ArmToCore[ARMMEX] = CORMEX
ArmToCore[ARMUWMEX] = CORUWMEX
ArmToCore[ARMSOLAR] = CORSOLAR
ArmToCore[ARMWIN] = CORWIN
ArmToCore[ARMTIDE] = CORTIDE
ArmToCore[ARMLLT] = CORLLT
ArmToCore[ARMRAD] = CORRAD
ArmToCore[ARMRL] = CORRL
ArmToCore[ARMTL] = CORTL
ArmToCore[ARMSONAR] = CORSONAR
ArmToCore[ARMFRT] = CORFRT
ArmToCore[ARMLAB] = CORLAB
ArmToCore[ARMVP] = CORVP
ArmToCore[ARMSY] = CORSY
ArmToCore[ARMMSTOR] = CORMSTOR
ArmToCore[ARMESTOR] = CORESTOR
ArmToCore[ARMMAKR] = CORMAKR
ArmToCore[ARMEYES] = COREYES
ArmToCore[ARMDRAG] = CORDRAG
ArmToCore[ARMDL] = CORDL
ArmToCore[ARMAP] = CORAP
ArmToCore[ARMFRAD] = CORFRAD
ArmToCore[ARMUWMS] = CORUWMS
ArmToCore[ARMUWES] = CORUWES
ArmToCore[ARMFMKR] = CORFMKR
ArmToCore[ARMFDRAG] = CORFDRAG
ArmToCore[ARMGEOMINI] = CORGEOMINI

local TllToCore = {}

TllToCore[TLLMEX] = CORMEX
TllToCore[TLLUWMEX] = CORUWMEX
TllToCore[TLLSOLAR] = CORSOLAR
TllToCore[TLLWIND] = CORWIN
TllToCore[TLLTIDE] = CORTIDE
TllToCore[TLLLLT] = CORLLT
TllToCore[TLLRADAR] = CORRAD
TllToCore[TLLLMT] = CORRL
TllToCore[TLLSONAR] = CORSONAR
TllToCore[TLLLMTNS] = CORFRT
TllToCore[TLLLAB] = CORLAB
TllToCore[TLLVP] = CORVP
TllToCore[TLLSY] = CORSY
TllToCore[TLLMSTOR] = CORMSTOR
TllToCore[TLLESTOR] = CORESTOR
TllToCore[TLLMM] = CORMAKR
TllToCore[TllToWER] = COREYES
TllToCore[TLLDTNS] = CORDRAG
TllToCore[TLLSHORETORP] = CORDL
TllToCore[TLLAP] = CORAP
TllToCore[TLLUWMSTORAGE] = CORUWMS
TllToCore[TLLUWESTORAGE] = CORUWES
TllToCore[TLLWMCONV] = CORFMKR
TllToCore[TLLDTNS] = CORFDRAG
TllToCore[TllToRP] = CORTL
TllToCore[TLLGEOMINI] = CORGEOMINI

local TllToArm = {}

TllToArm[TLLMEX] = ARMMEX
TllToArm[TLLUWMEX] = ARMUWMEX
TllToArm[TLLSOLAR] = ARMSOLAR
TllToArm[TLLWIND] = ARMWIN
TllToArm[TLLTIDE] = ARMTIDE
TllToArm[TLLLLT] = ARMLLT
TllToArm[TLLRADAR] = ARMRAD
TllToArm[TLLLMT] = ARMRL
TllToArm[TLLSONAR] = ARMSONAR
TllToArm[TLLLMTNS] = ARMFRT
TllToArm[TLLLAB] = ARMLAB
TllToArm[TLLVP] = ARMVP
TllToArm[TLLSY] = ARMSY
TllToArm[TLLMSTOR] = ARMMSTOR
TllToArm[TLLESTOR] = ARMESTOR
TllToArm[TLLMM] = ARMMAKR
TllToArm[TllToWER] = ARMEYES
TllToArm[TLLDTNS] = ARMDRAG
TllToArm[TLLSHORETORP] = ARMDL
TllToArm[TLLAP] = ARMAP
TllToArm[TLLUWMSTORAGE] = ARMUWMS
TllToArm[TLLUWESTORAGE] = ARMUWES
TllToArm[TLLWMCONV] = ARMFMKR
TllToArm[TLLDTNS] = ARMFDRAG
TllToArm[TllToRP] = ARMTL
TllToArm[TLLGEOMINI] = ARMGEOMINI

local TalonToTll = {}

 TalonToTll[TALON_MEX] = TLLMEX
 TalonToTll[TALON_UWMEX] = TLLUWMEX
 TalonToTll[TALON_SOLAR] = TLLSOLAR
 TalonToTll[TALON_WIND] = TLLWIND
 TalonToTll[TALON_TIDE] = TLLTIDE
 TalonToTll[TALON_LLT] = TLLLLT
 TalonToTll[TALON_RADAR] = TLLRAD
 TalonToTll[TALON_RL] = TLLLMT
 TalonToTll[TALON_SONAR] = TLLSONAR
 TalonToTll[TALON_FRL] = TLLFRT
 TalonToTll[TALON_CLONE_LAB] = TLLLAB
 TalonToTll[TALON_VP] = TLLVP
 TalonToTll[TALON_SY] = TLLSY
 TalonToTll[TALON_MSTOR] = TLLMSTOR
 TalonToTll[TALON_ESTOR] = TLLESTOR
 TalonToTll[TALON_MAKR] = TLLMAKR
 --TalonToTll [TALON] = TLLEYES
 TalonToTll[TALON_DRAG] = TLLDTNS
 TalonToTll[TALON_TL] = TLLSHORETORP
 TalonToTll[TALON_AP] = TLLAP
 TalonToTll[TALON_UWMS] = TLLUWMSTORAGE
 TalonToTll[TALON_UWES] = TLLUWESTORAGE
 TalonToTll[TALON_FMKR] = TLLWMCONV
 TalonToTll[TALON_FDRAG] = TLLDTNS
 TalonToTll[TALON_TL] = TllToRP
 TalonToTll[TALON_GEOMINI] = TLLGEOMINI

local TalonToArm = {}

TalonToArm[TALON_MEX] = ARMMEX
TalonToArm[TALON_UWMEX] = ARMUWMEX
TalonToArm[TALON_SOLAR] = ARMSOLAR
TalonToArm[TALON_WIND] = ARMWIN
TalonToArm[TALON_TIDE] = ARMTIDE
TalonToArm[TALON_LLT] = ARMLLT
TalonToArm[TALON_RADAR] = ARMRAD
TalonToArm[TALON_RL] = ARMRL
TalonToArm[TALON_SONAR] = ARMSONAR
TalonToArm[TALON_FRL] = ARMFRT
TalonToArm[TALON_CLONE_LAB] = ARMLAB
TalonToArm[TALON_VP] = ARMVP
TalonToArm[TALON_SY] = ARMSY
TalonToArm[TALON_MSTOR] = ARMMSTOR
TalonToArm[TALON_ESTOR] = ARMESTOR
TalonToArm[TALON_MAKR] = ARMMAKR
--TalonToArm [TALON] = ARMEYES
TalonToArm[TALON_DRAG] = ARMDRAG
TalonToArm[TALON_TL] = ARMDL
TalonToArm[TALON_AP] = ARMAP
TalonToArm[TALON_UWMS] = ARMUWMS
TalonToArm[TALON_UWES] = ARMUWES
TalonToArm[TALON_FMKR] = ARMFMKR
TalonToArm[TALON_FDRAG] = ARMFDRAG
TalonToArm[TALON_TL] = ARMTL
TalonToArm[TALON_GEOMINI] = ARMGEOMINI

local TalonToCore = {}

TalonToCore[TALON_MEX] = CORMEX
TalonToCore[TALON_UWMEX] = CORUWMEX
TalonToCore[TALON_SOLAR] = CORSOLAR
TalonToCore[TALON_WIND] = CORWIN
TalonToCore[TALON_TIDE] = CORTIDE
TalonToCore[TALON_LLT] = CORLLT
TalonToCore[TALON_RADAR] = CORRAD
TalonToCore[TALON_RL] = CORRL
TalonToCore[TALON_SONAR] = CORSONAR
TalonToCore[TALON_FRL] = CORFRT
TalonToCore[TALON_CLONE_LAB] = CORLAB
TalonToCore[TALON_VP] = CORVP
TalonToCore[TALON_SY] = CORSY
TalonToCore[TALON_MSTOR] = CORMSTOR
TalonToCore[TALON_ESTOR] = CORESTOR
TalonToCore[TALON_MAKR] = CORMAKR
--TalonToArm [TALON] = COREYES
TalonToCore[TALON_DRAG] = CORDRAG
TalonToCore[TALON_TL] = CORDL
TalonToCore[TALON_AP] = CORAP
TalonToCore[TALON_UWMS] = CORUWMS
TalonToCore[TALON_UWES] = CORUWES
TalonToCore[TALON_FMKR] = CORFMKR
TalonToCore[TALON_FDRAG] = CORFDRAG
TalonToCore[TALON_TL] = CORTL
TalonToCore[TALON_GEOMINI] = CORGEOMINI


function table_invert(t)
	local s = {}

	for k,v in pairs(t) do
		s[v] = k
	end

	return s
end

local CoreToArm = table_invert(ArmToCore)
local CoreTotll = table_invert(TllToCore)
local ArmTotll = table_invert(TllToArm)
local TllToTalon = table_invert(TalonToTll)
local ArmToTalon = table_invert(TalonToArm)
local CoreToTalon = table_invert(TalonToCore)
local isMex = {}
local isBuildableQueue = {}

for uDefID,uDef in pairs(UnitDefs) do
	if uDef.extractsMetal > 0 then
		isMex[uDefID] = true
	end

	if ARMCOM == uDefID or CORCOM == uDefID or TLLCOM == uDefID or TALON_COM == uDefID then
		if uDef.buildOptions then
			for i = 1,#uDef.buildOptions do
				local tooltip = UnitDefs[uDef.buildOptions[i]].tooltip
				local humanName = UnitDefs[uDef.buildOptions[i]].humanName
				local text = "\255\215\255\215" .. humanName .. "\n\255\240\240\240"
				local description_long = UnitDefs[uDef.buildOptions[i]].customParams.description_long or "" --Todo atm we don't use this 

				isBuildableQueue[uDef.buildOptions[i]] = {
					tooltip = tooltip,
					humanName = humanName,
					text = text,
					description_long = description_long
				}
				--Spring.Echo("Initial Queue Build Option's ",i,UnitDefs[uDef.buildOptions[i]].name)
			end
		end
	end
end

for uDefID,uDef in pairs(UnitDefs) do
	if uDef.extractsMetal > 0 then
		isMex[uDefID] = true
	end
end

------------------------------------------------------------
-- Globals
------------------------------------------------------------
local sDefID -- Starting unit def ID
local sDef -- UnitDefs[sDefID]
local selDefID = nil -- Currently selected def ID
local buildQueue = {}
local buildNameToID = {}
local gameStarted = false
local wWidth,wHeight = Spring.GetWindowGeometry()
local wl,wt = 50,0.5 * wHeight
local cellRows = {} -- {{bDefID, bDefID, ...}, ...}
local panelList = nil -- Display list for panel
local areDragging = false
local isMex = {} -- isMex[uDefID] = true / nil
local weaponRange = {} -- weaponRange[uDefID] = # / nil
local changeStartUnitRegex = '^\138(%d+)$'
local startUnitParamName = 'startUnit'
local myTeamID = Spring.GetMyTeamID()
local myPlayerID = Spring.GetMyPlayerID()
local amNewbie = (Spring.GetTeamRulesParam(myTeamID,'isNewbie') == 1)
local totalTime

------------------------------------------------------------
-- Local functions
------------------------------------------------------------
function wrap(str,limit)
	limit = limit or 72
	local here = 1
	local buf = ""
	local t = {}

	str:gsub("(%s*)()(%S+)()",function(sp,st,word,fi)
		if fi - here > limit then
			--# Break the line
			here = st
			table.insert(t,buf)
			buf = word
		else
			buf = buf .. sp .. word --# Append
		end
	end)

	--# Tack on any leftovers
	if (buf ~= "") then
		table.insert(t,buf)
	end

	return t
end

local function RectQuad(px,py,sx,sy)
	local o = 0.008 -- texture offset, because else grey line might show at the edges
	gl.TexCoord(o,1 - o)
	gl.Vertex(px,py,0)
	gl.TexCoord(1 - o,1 - o)
	gl.Vertex(sx,py,0)
	gl.TexCoord(1 - o,o)
	gl.Vertex(sx,sy,0)
	gl.TexCoord(o,o)
	gl.Vertex(px,sy,0)
end

function DrawRect(px,py,sx,sy)
	gl.BeginEnd(GL.QUADS,RectQuad,px,py,sx,sy)
end

local function TraceDefID(mx,my)
	local overRow = cellRows[1 + math.floor((wt - my) / ((iconHeight + borderSize) * widgetScale))]
	if not overRow then return nil end

	return overRow[1 + math.floor((mx - wl) / ((iconWidth + borderSize) * widgetScale))]
end

local function GetBuildingDimensions(uDefID,facing)
	local bDef = UnitDefs[uDefID]

	if (facing % 2 == 1) then
		return 4 * bDef.zsize,4 * bDef.xsize
	else
		return 4 * bDef.xsize,4 * bDef.zsize
	end
end

local function DrawBuilding(buildData,borderColor,buildingAlpha,drawRanges)
	local bDefID,bx,by,bz,facing = buildData[1],buildData[2],buildData[3],buildData[4],buildData[5]
	local bw,bh = GetBuildingDimensions(bDefID,facing)
	gl.DepthTest(false)
	gl.Color(borderColor)

	gl.Shape(GL.LINE_LOOP,{
		{
			v = {bx - bw,by,bz - bh}
		},
		{
			v = {bx + bw,by,bz - bh}
		},
		{
			v = {bx + bw,by,bz + bh}
		},
		{
			v = {bx - bw,by,bz + bh}
		}
	})

	if drawRanges then
		if isMex[bDefID] then
			gl.Color(1.0,0.3,0.3,0.7)
			gl.DrawGroundCircle(bx,by,bz,Game.extractorRadius,50)
		end

		local wRange = weaponRange[bDefID]

		if wRange then
			gl.Color(1.0,0.3,0.3,0.7)
			gl.DrawGroundCircle(bx,by,bz,wRange,40)
		end
	end

	gl.DepthTest(GL.LEQUAL)
	gl.DepthMask(true)

	if buildingAlpha == 1 then
		gl.Lighting(true)
	end

	gl.Color(1.0,1.0,1.0,buildingAlpha)
	gl.PushMatrix()
	gl.Translate(bx,by,bz)
	gl.Rotate(90 * facing,0,1,0)
	gl.UnitShape(bDefID,Spring.GetMyTeamID(),false,true,false)
	gl.PopMatrix()
	gl.Lighting(false)
	gl.DepthTest(false)
	gl.DepthMask(false)
end

local function DrawUnitDef(uDefID,uTeam,ux,uy,uz)
	gl.Color(1.0,1.0,1.0,1.0)
	gl.DepthTest(GL.LEQUAL)
	gl.DepthMask(true)
	gl.Lighting(true)
	gl.PushMatrix()
	gl.Translate(ux,uy,uz)
	gl.UnitShape(uDefID,uTeam,false,true,false)
	gl.PopMatrix()
	gl.Lighting(false)
	gl.DepthTest(false)
	gl.DepthMask(false)
end

local function DoBuildingsClash(buildData1,buildData2)
	local w1,h1 = GetBuildingDimensions(buildData1[1],buildData1[5])
	local w2,h2 = GetBuildingDimensions(buildData2[1],buildData2[5])

	return math.abs(buildData1[2] - buildData2[2]) < w1 + w2 and math.abs(buildData1[4] - buildData2[4]) < h1 + h2
end

local function SetSelDefID(defID)
	selDefID = defID
	local MetalWidget = widgetHandler.knownWidgets['Pre Start Metal View'] or {}

	if selDefID then
		WG["PreGameCommand"] = {
			cmdID = -selDefID
		}
	else
		WG["PreGameCommand"] = nil
	end

	if (isMex[selDefID] ~= nil) ~= (Spring.GetMapDrawMode() == "metal") and MetalWidget.active == false then
		Spring.SendCommands("ShowMetalMap")
	end
end

local function GetUnitCanCompleteQueue(uID)
	local uDefID = Spring.GetUnitDefID(uID)
	if uDefID == sDefID then return true end
	-- What can this unit build ?
	local uCanBuild = {}
	local uBuilds = UnitDefs[uDefID].buildOptions

	for i = 1,#uBuilds do
		uCanBuild[uBuilds[i]] = true
	end

	-- Can it build everything that was queued ?
	for i = 1,#buildQueue do
		if not uCanBuild[buildQueue[i][1]] then return false end
	end

	return true
end

local function GetQueueBuildTime()
	local t = 0

	for i = 1,#buildQueue do
		t = t + UnitDefs[buildQueue[i][1]].buildTime
	end

	return t / sDef.buildSpeed
end

local function GetQueueCosts()
	local mCost = 0
	local eCost = 0
	local bCost = 0

	for i = 1,#buildQueue do
		local uDef = UnitDefs[buildQueue[i][1]]
		mCost = mCost + uDef.metalCost
		eCost = eCost + uDef.energyCost
		bCost = bCost + uDef.buildTime
	end

	return mCost,eCost,bCost
end

------------------------------------------------------------
-- Initialize/shutdown
------------------------------------------------------------

function widget:Initialize()
    if not WG["background_opacity_custom"] then
        WG["background_opacity_custom"] = {0,0,0,0.5}
    end
	if (Game.startPosType == 1) or			-- Don't run if start positions are random
		(Spring.GetGameFrame() > 0) or		-- Don't run if game has already started
		amNewbie or						-- Don't run if i'm a newbie
		(Spring.GetSpectatingState()) then	-- Don't run if we are a spec
		widgetHandler:RemoveWidget(self)
		return
	end
	-- Get our starting unit
	local _,_,_,_,mySide = Spring.GetTeamInfo(myTeamID)

	-- Don't run unless we know what faction the player is
	if mySide == "" then
		widgetHandler:RemoveWidget(self)

		return
	else
		local startUnitName = Spring.GetSideData(mySide)
		sDefID = UnitDefNames[startUnitName].id
		InitializeFaction(sDefID)
		WG["faction_change"] = InitializeFaction
	end

	processGuishader()
end

function processGuishader()
	if (WG['guishader_api'] ~= nil) then
		local sBuilds = UnitDefs[sDefID].buildOptions
		local numCols = math.min(#sBuilds,maxCols)
		local numRows = math.ceil(#sBuilds / numCols)
		local bgheight = ((numRows * iconHeight) + margin) * widgetScale
		local bgwidth = ((numCols * iconWidth) + margin) * widgetScale
		WG['guishader_api'].InsertRect(wl - (margin * widgetScale),wt - bgheight,wl + bgwidth,wt + margin * widgetScale,'initialqueue')
	end
end

function RectRound(px,py,sx,sy,cs)
	local px,py,sx,sy,cs = math.floor(px),math.floor(py),math.ceil(sx),math.ceil(sy),math.floor(cs)
	gl.Rect(px + cs,py,sx - cs,sy)
	gl.Rect(sx - cs,py + cs,sx,sy - cs)
	gl.Rect(px + cs,py + cs,px,sy - cs)
	gl.Texture(bgcorner)
	--if py <= 0 or px <= 0 then gl.Texture(false) else gl.Texture(bgcorner) end
	DrawRect(px,py + cs,px + cs,py) -- top left
	--if py <= 0 or sx >= vsx then gl.Texture(false) else gl.Texture(bgcorner) end
	DrawRect(sx,py + cs,sx - cs,py) -- top right
	--if sy >= vsy or px <= 0 then gl.Texture(false) else gl.Texture(bgcorner) end
	DrawRect(px,sy - cs,px + cs,sy) -- bottom left
	--if sy >= vsy or sx >= vsx then gl.Texture(false) else gl.Texture(bgcorner) end
	DrawRect(sx,sy - cs,sx - cs,sy) -- bottom right
	gl.Texture(false)
end

function InitializeFaction(sDefID)
	sDef = UnitDefs[sDefID]
	-- Don't run if theres nothing to show
	local sBuilds = sDef.buildOptions
	if not sBuilds or (#sBuilds == 0) then return end
	-- Set up cells
	local numCols = math.min(#sBuilds,maxCols)
	local numRows = math.ceil(#sBuilds / numCols)

	for r = 1,numRows do
		cellRows[r] = {}
	end

	for b = 0,#sBuilds - 1 do
		cellRows[1 + math.floor(b / numCols)][1 + b % numCols] = sBuilds[b + 1]

		if VFS.FileExists(oldUnitpicsDir .. UnitDefs[sBuilds[b + 1]].name .. '.png') then
			OtaIconExist[sBuilds[b + 1]] = oldUnitpicsDir .. UnitDefs[sBuilds[b + 1]].name .. '.png'
		end
	end

	-- delete any pre-existing displaylist
	if panelList then
		gl.DeleteList(panelList)
	end

	for uDefID,uDef in pairs(UnitDefs) do
		if uDef.extractsMetal > 0 then
			isMex[uDefID] = true
		end

		if uDef.maxWeaponRange > 16 then
			weaponRange[uDefID] = uDef.maxWeaponRange
		end
	end
end

function widget:Shutdown()
	if panelList then
		gl.DeleteList(panelList)
	end

	if (WG['guishader_api'] ~= nil) then
		WG['guishader_api'].RemoveRect('initialqueue')
	end

	WG["faction_change"] = nil
end


------------------------------------------------------------
-- Config
------------------------------------------------------------

function widget:GetConfigData()
	if (Spring.GetSpectatingState()) then return end
	--local wWidth, wHeight = Spring.GetWindowGeometry()
	--return {wl / wWidth, wt / wHeight}
	local _,_,_,_,mySide = Spring.GetTeamInfo(Spring.GetMyTeamID())

	if Spring.GetGameSeconds() <= 0 and mySide ~= "" then
		local startUnitName = Spring.GetSideData(mySide)
		local sDefID = UnitDefNames[startUnitName].id
		local sBuilds = UnitDefs[sDefID].buildOptions
		local numCols = math.min(#sBuilds,maxCols)
		local numRows = math.ceil(#sBuilds / numCols)
		local bgheight = ((numRows * iconHeight) + margin) * widgetScale
		local bgwidth = ((numCols * iconWidth) + margin) * widgetScale
		savedTable = {}
		savedTable.buildQueue = buildQueue
		savedTable.wt = wt
		savedTable.wl = wl
		savedTable.bgheight = bgheight
		savedTable.bgwidth = bgwidth
		savedTable.gameid = Game.gameID

		return savedTable
	end
end

function widget:SetConfigData(data)
	--if (Spring.GetSpectatingState()) then return end
	--local wWidth, wHeight = Spring.GetWindowGeometry()
	--wl = math.floor(wWidth * (data[1] or 0.40))
	--wt = math.floor(wHeight * (data[2] or 0.10))
	if data.wt ~= nil and data.wl ~= nil and data.bgwidth ~= nil and data.bgheight ~= nil then
		wt = data.wt
		wl = data.wl

		if wl < 0 then
			wl = 0
		end

		if wl > vsx + data.bgwidth then
			wl = vsx + data.bgwidth
		end

		if wt < data.bgheight then
			wt = data.bgwidth
		end

		if wt > vsy then
			wt = vsy
		end
	end

	if Spring.GetGameSeconds() <= 0 and data.buildQueue and data.gameId and data.gameId == Game.gameID then
		buildQueue = data.buildQueue
	end
end

------------------------------------------------------------
-- Drawing
------------------------------------------------------------
--local queueTimeFormat = whiteColor .. 'Queued: ' .. buildColor .. '%.1f sec ' .. whiteColor .. '[' .. metalColor .. '%d m' .. whiteColor .. ', ' .. energyColor .. '%d e' .. whiteColor .. ']'
local queueTimeFormat = whiteColor .. 'Queued ' .. metalColor .. '%dm ' .. energyColor .. '%de ' .. buildColor .. '%.1f sec'
--local queueTimeFormat = metalColor .. '%dm ' .. whiteColor .. '/ ' .. energyColor .. '%de ' .. whiteColor .. '/ ' .. buildColor .. '%.1f sec'


-- "Queued 23.9 seconds (820m / 2012e)" (I think this one is the best. Time first emphasises point and goodness of widget)
	-- Also, it is written like english and reads well, none of this colon stuff or figures stacked together


function widget:DrawScreen()
	gl.PushMatrix()
	gl.Translate(wl,wt,0)
	gl.Scale(widgetScale,widgetScale,widgetScale)
	gl.PushMatrix()
	gl.Translate(0,borderSize,0)
	-- background
	local bgheight = ((#cellRows * iconHeight) + margin)
	local bgwidth = ((maxCols * iconWidth) + margin)
	gl.Color(WG["background_opacity_custom"])
	RectRound(-(margin),-bgheight,bgwidth,margin,((iconWidth + iconPadding + iconPadding) / 7))
	gl.Color(borderColor)
	RectRound(-(margin) + borderPadding,-bgheight + borderPadding,bgwidth - borderPadding,margin - borderPadding,((iconWidth + iconPadding + iconPadding) / 9))

	for r = 1,#cellRows do
		local cellRow = cellRows[r]
		gl.Translate(0,-((iconHeight - borderSize)),0)
		gl.PushMatrix()

		for c = 1,#cellRow do
			gl.Color(0,0,0,1)
			--gl.Rect(-borderSize, -borderSize, iconWidth + borderSize, iconHeight + borderSize)
			gl.Color(1,1,1,1)

			if WG['OtaIcons'] and OtaIconExist[cellRow[c]] then
				gl.Texture(OtaIconExist[cellRow[c]])
			else
				gl.Texture('#' .. cellRow[c]) -- Screen.vsx,Screen.vsy
			end

			DrawRect(iconPadding,iconPadding,(iconWidth - iconPadding),(iconHeight - iconPadding))
			gl.Texture(false)
			gl.Translate((iconWidth + borderSize),0,0)
		end

		gl.PopMatrix()
	end

	gl.PopMatrix()
	--gl.CallList(panelList)
	gl.Scale(1 / widgetScale,1 / widgetScale,1 / widgetScale)

	if #buildQueue > 0 then
		local mCost,eCost,bCost = GetQueueCosts()
		local buildTime = bCost / sDef.buildSpeed
		totalTime = buildTime
		gl.Text(string.format(queueTimeFormat,mCost,eCost,buildTime),0,margin * widgetScale,fontSize * widgetScale,'do')
	end

	-- draw hover
	local CurMouseState = {Spring.GetMouseState()} --{mx,my,m1,m2,m3}
	local row = 1 + math.floor((wt - CurMouseState[2]) / ((iconHeight + borderSize) * widgetScale))
	local col = 1 + math.floor((wl - CurMouseState[1]) / ((iconWidth + borderSize) * widgetScale))

	if TraceDefID(CurMouseState[1],CurMouseState[2]) then
		gl.Translate(-((iconWidth * widgetScale) * col),-((iconHeight * widgetScale) * row),0)
		gl.Texture(buttonhighlight)
		gl.Color(hoverColor)
		DrawRect((iconPadding * widgetScale),(iconPadding * widgetScale),((iconWidth - iconPadding) * widgetScale),((iconHeight - iconPadding) * widgetScale))
		gl.Color(hoverColor[1],hoverColor[2],hoverColor[3],hoverColor[4] / 1.5)
		glBlending(GL_SRC_ALPHA,GL_ONE)
		DrawRect((iconPadding * widgetScale),(iconPadding * widgetScale),((iconWidth - iconPadding) * widgetScale),((iconHeight - iconPadding) * widgetScale))
		glBlending(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA)

		if CurMouseState[3] then
			gl.Color(clickColor)
			DrawRect((iconPadding * widgetScale),(iconPadding * widgetScale),((iconWidth - iconPadding) * widgetScale),((iconHeight - iconPadding) * widgetScale))
			gl.Color(clickColor[1],clickColor[2],clickColor[3],clickColor[4] / 1.5)
			glBlending(GL_SRC_ALPHA,GL_ONE)
			DrawRect((iconPadding * widgetScale),(iconPadding * widgetScale),((iconWidth - iconPadding) * widgetScale),((iconHeight - iconPadding) * widgetScale))
			glBlending(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA)
			lastClickedRow = row
			lastClickedCol = col
		end

		gl.Texture(false)
		gl.Translate(((iconWidth * widgetScale) * col),((iconHeight * widgetScale) * row),0)

		if drawTooltip and WG['tooltip'] ~= nil then
			local udefid = TraceDefID(CurMouseState[1],CurMouseState[2])
			local text = isBuildableQueue[udefid].text

			if drawBigTooltip and isBuildableQueue[udefid].description_long ~= nil then
				local lines = wrap(isBuildableQueue[udefid].description_long,58)
				local description = ''
				local newline = ''

				for i,line in ipairs(lines) do
					description = description .. newline .. line
					newline = '\n'
				end

				text = text .. description
			else
				text = text .. isBuildableQueue[udefid].tooltip
			end

			WG['tooltip'].ShowTooltip('initialqueue',text)
		end
	end

	if selDefID ~= nil and lastClickedRow ~= nil and lastClickedCol ~= nil then
		local row,col = lastClickedRow,lastClickedCol
		gl.Translate(-((iconWidth * widgetScale) * col),-((iconHeight * widgetScale) * row),0)
		gl.Texture(buttonpushed)
		gl.Color(pushedColor)
		DrawRect((iconPadding * widgetScale),(iconPadding * widgetScale),((iconWidth - iconPadding) * widgetScale),((iconHeight - iconPadding) * widgetScale))
		gl.Color(pushedColor[1],pushedColor[2],pushedColor[3],pushedColor[4] / 1.5)
		glBlending(GL_SRC_ALPHA,GL_ONE)
		DrawRect((iconPadding * widgetScale),(iconPadding * widgetScale),((iconWidth - iconPadding) * widgetScale),((iconHeight - iconPadding) * widgetScale))
		glBlending(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA)
		gl.Texture(false)
		gl.Translate(((iconWidth * widgetScale) * col),((iconHeight * widgetScale) * row),0)
	end

	gl.PopMatrix()
end

function widget:DrawWorld()
	--don't draw anything once the game has started; after that engine can draw queues itself
	if gameStarted then return end
	-- Set up gl
	gl.LineWidth(1.49)
	-- We need data about currently selected building, for drawing clashes etc
	local selBuildData

	if selDefID then
		local mx,my = Spring.GetMouseState()
		local _,pos = Spring.TraceScreenRay(mx,my,true)

		if pos then
			local bx,by,bz = Spring.Pos2BuildPos(selDefID,pos[1],pos[2],pos[3])
			local buildFacing = Spring.GetBuildFacing()
			selBuildData = {selDefID,bx,by,bz,buildFacing}
		end
	end

	local myTeamID = Spring.GetMyTeamID()
	local sx,sy,sz = Spring.GetTeamStartPosition(myTeamID) -- Returns -100, -100, -100 when none chosen
	local startChosen = (sx ~= -100)

	if startChosen then
		-- Correction for start positions in the air
		sy = Spring.GetGroundHeight(sx,sz)

		-- Draw the starting unit at start position
		if sDef.id == ARMCOM then
			sDefID = sDef.id
		elseif sDef.id == CORCOM then
			sDefID = sDef.id
		else
			sDefID = sDef.id
		end

		DrawUnitDef(sDefID,myTeamID,sx,sy,sz)
		-- Draw start units build radius
		gl.Color(buildDistanceColor)
		gl.DrawGroundCircle(sx,sy,sz,sDef.buildDistance,40)
	end

	-- Check for faction change
	for b = 1,#buildQueue do
		local buildData = buildQueue[b]
		local buildDataId = buildData[1]

		if sDef.id == ARMCOM then
			if CoreToArm[buildDataId] ~= nil then
				buildData[1] = CoreToArm[buildDataId]
				buildQueue[b] = buildData
			end

			if TllToArm[buildDataId] ~= nil then
				buildData[1] = TllToArm[buildDataId]
				buildQueue[b] = buildData
			end

			if TalonToArm[buildDataId] ~= nil then
				buildData[1] = TalonToArm[buildDataId]
				buildQueue[b] = buildData
			end
		elseif sDef.id == CORCOM then
			if ArmToCore[buildDataId] ~= nil then
				buildData[1] = ArmToCore[buildDataId]
				buildQueue[b] = buildData
			end

			if TllToCore[buildDataId] ~= nil then
				buildData[1] = TllToCore[buildDataId]
				buildQueue[b] = buildData
			end

			if TalonToCore[buildDataId] ~= nil then
				buildData[1] = TalonToCore[buildDataId]
				buildQueue[b] = buildData
			end
		elseif sDef.id == TLLCOM then
			if CoreTotll[buildDataId] ~= nil then
				buildData[1] = CoreTotll[buildDataId]
				buildQueue[b] = buildData
			end

			if ArmTotll[buildDataId] ~= nil then
				buildData[1] = ArmTotll[buildDataId]
				buildQueue[b] = buildData
			end

			if TalonTotll[buildDataId] ~= nil then
				buildData[1] = TalonTotll[buildDataId]
				buildQueue[b] = buildData
			end
		elseif sDef.id == TALON_COM then
			if CoreToTalon[buildDataId] ~= nil then
				buildData[1] = CoreToTalon[buildDataId]
				buildQueue[b] = buildData
			end

			if ArmToTalon[buildDataId] ~= nil then
				buildData[1] = ArmToTalon[buildDataId]
				buildQueue[b] = buildData
			end

			if TllToTalon[buildDataId] ~= nil then
				buildData[1] = TllToTalon[buildDataId]
				buildQueue[b] = buildData
			end
		end
	end

	-- Draw all the buildings
	local queueLineVerts = startChosen and {
		{
			v = {sx,sy,sz}
		}
	} or {}

	for b = 1,#buildQueue do
		local buildData = buildQueue[b]

		if selBuildData and DoBuildingsClash(selBuildData,buildData) then
			DrawBuilding(buildData,borderClashColor,buildingQueuedAlpha)
		else
			DrawBuilding(buildData,borderNormalColor,buildingQueuedAlpha)
		end

		queueLineVerts[#queueLineVerts + 1] = {
			v = {buildData[2],buildData[3],buildData[4]}
		}
	end

	-- Draw queue lines
	gl.Color(buildLinesColor)
	gl.LineStipple("springdefault")
	gl.Shape(GL.LINE_STRIP,queueLineVerts)
	gl.LineStipple(false)

	-- Draw selected building
	if selBuildData then
		if Spring.TestBuildOrder(selDefID,selBuildData[2],selBuildData[3],selBuildData[4],selBuildData[5]) ~= 0 then
			DrawBuilding(selBuildData,borderValidColor,1.0,true)
		else
			DrawBuilding(selBuildData,borderInvalidColor,1.0,true)
		end
	end

	-- Reset gl
	gl.Color(1.0,1.0,1.0,1.0)
	gl.LineWidth(1.0)
end

------------------------------------------------------------
-- Game start
------------------------------------------------------------

local comGate = tonumber(Spring.GetModOptions().mo_comgate) or 0 --if comgate is on, all orders are blocked before frame 105


function widget:GameFrame(n)
	if not gameStarted then
		gameStarted = true
	end

	-- Don't run if we are a spec
	local areSpec = Spring.GetSpectatingState()

	if areSpec then
		widgetHandler:RemoveWidget(self)

		return
	end

	-- Don't run if we didn't queue anything
	if (#buildQueue == 0) then
		widgetHandler:RemoveWidget(self)

		return
	end

	if (n < 2) then return end -- Give the unit frames 0 and 1 to spawn
	--inform gadget how long is our queue
	local buildTime = GetQueueBuildTime()
	Spring.SendCommands("luarules initialQueueTime " .. buildTime)

	if (n == 142) then
		--Spring.Echo("> Starting unit never spawned !")
		widgetHandler:RemoveWidget(self)

		return
	end

	--comGate takes up until frame 105
	if (comGate == 0 or Spring.GetGameFrame() == 141) then
		local tasker
		-- Search for our starting unit
		local units = Spring.GetTeamUnits(Spring.GetMyTeamID())

		for u = 1,#units do
			local uID = units[u]

			--Spring.GetUnitDefID(uID) == sDefID then
			if GetUnitCanCompleteQueue(uID) then
				tasker = uID
				if Spring.GetUnitRulesParam(uID,"startingOwner") == Spring.GetMyPlayerID() then break end --we found our com even if cooping, assigning queue to this particular unit
			end
		end

		if tasker then
			--Spring.Echo("sending queue to unit")
			for b = 1,#buildQueue do
				local buildData = buildQueue[b]
				Spring.GiveOrderToUnit(tasker,-buildData[1],{buildData[2],buildData[3],buildData[4],buildData[5]},{"shift"})
			end

			widgetHandler:RemoveWidget(self)
		end
	end
end

------------------------------------------------------------
-- Mouse
------------------------------------------------------------
function widget:IsAbove(mx,my)
	return TraceDefID(mx,my)
end

local tooltipFormat = 'Build %s\n%s\n' .. metalColor .. '%d m ' .. whiteColor .. '/ ' .. energyColor .. '%d e ' .. whiteColor .. '/ ' .. buildColor .. '%.1f sec'

function widget:GetTooltip(mx,my)
	local bDefID = TraceDefID(mx,my)
	local bDef = UnitDefs[bDefID]

	return string.format(tooltipFormat,bDef.humanName,bDef.tooltip,bDef.metalCost,bDef.energyCost,bDef.buildTime / sDef.buildSpeed)
end

function SetBuildFacing()
	local wx,wy,_,_ = Spring.GetScreenGeometry()
	local _,pos = Spring.TraceScreenRay(wx / 2,wy / 2,true)
	if not pos then return end
	local x = pos[1]
	local z = pos[3]

	if math.abs(Game.mapSizeX - 2 * x) > math.abs(Game.mapSizeZ - 2 * z) then
		if (2 * x > Game.mapSizeX) then
			facing = 3
		else
			facing = 1
		end
	else
		if (2 * z > Game.mapSizeZ) then
			facing = 2
		else
			facing = 0
		end
	end

	Spring.SetBuildFacing(facing)
end

needBuildFacing = true

function widget:MousePress(mx,my,mButton)
	local tracedDefID = TraceDefID(mx,my)

	if tracedDefID then
		if mButton == 1 then
			if needBuildFacing then
				SetBuildFacing()
				needBuildFacing = false
			end

			SetSelDefID(tracedDefID)

			return true
		elseif mButton == 2 or mButton == 3 then
			areDragging = true

			return true
		end
	else
		if selDefID then
			if mButton == 1 then
				local mx,my = Spring.GetMouseState()
				local _,pos = Spring.TraceScreenRay(mx,my,true)
				if not pos then return end
				local bx,by,bz = Spring.Pos2BuildPos(selDefID,pos[1],pos[2],pos[3])
				local buildFacing = Spring.GetBuildFacing()

				if WG["PreGameMexPos"] and isMex[selDefID] then
					bx = WG["PreGameMexPos"].bx
					by = WG["PreGameMexPos"].by
					bz = WG["PreGameMexPos"].bz
					--buildFacing = WG["PreGameMexPos"].buildFacing
				end

				if Spring.TestBuildOrder(selDefID,bx,by,bz,buildFacing) ~= 0 then
					local buildData = {selDefID,bx,by,bz,buildFacing}
					local _,_,meta,shift = Spring.GetModKeyState()

					if meta then
						table.insert(buildQueue,1,buildData)
					elseif shift then
						local anyClashes = false

						for i = #buildQueue,1,-1 do
							if DoBuildingsClash(buildData,buildQueue[i]) then
								anyClashes = true
								table.remove(buildQueue,i)
							end
						end

						if not anyClashes then
							buildQueue[#buildQueue + 1] = buildData
						end
					else
						buildQueue = {buildData}
					end

					if not shift then
						SetSelDefID(nil)
					end
				end

				return true
			elseif mButton == 3 then
				SetSelDefID(nil)

				return true
			end
		end
	end
end

function widget:MouseMove(mx,my,dx,dy,mButton)
	if areDragging then
		local sBuilds = UnitDefs[sDefID].buildOptions
		local numCols = math.min(#sBuilds,maxCols)
		local numRows = math.ceil(#sBuilds / numCols)
		local bgheight = ((numRows * iconHeight) + margin) * widgetScale
		local bgwidth = ((numCols * iconWidth) + margin) * widgetScale

		if wl + dx >= 0 and wl + bgwidth + dx - 1 <= vsx then
			wl = wl + dx
		end

		if wt + dy >= bgheight and wt + bgheight + dy - 1 <= vsy + bgheight then
			wt = wt + dy
		end

		if wl < 0 then
			wl = 0
		end

		if wl > vsx - bgwidth then
			wl = vsx - bgwidth
		end

		if wt < bgheight then
			wt = bgheight
		end

		if wt > vsy then
			wt = vsy
		end

		processGuishader()
	end
end


function widget:MouseRelease(mx,my,mButton)
	areDragging = false
	local tracedDefID = TraceDefID(mx,my)

	if tracedDefID then
		if mButton == 1 then
			if needBuildFacing then
				SetBuildFacing()
				needBuildFacing = false
			end

			SetSelDefID(tracedDefID)

			return true
		end
	end
end

-- ------------------------------------------------------------
-- -- Keyboard -- This will only work with BA!
-- ------------------------------------------------------------
-- local ZKEY = 122
-- local XKEY = 120
-- local CKEY = 99
-- local VKEY = 118

-- function widget:KeyPress(key,mods,isrepeat)
-- 	if sDef == UnitDefs[ARMCOM] then
-- 		if key == ZKEY then
-- 			if 		selDefID == ARMMEX then 	SetSelDefID(ARMUWMEX)
-- 			elseif 	selDefID == ARMUWMEX then	SetSelDefID(ARMMEX)
-- 			else								SetSelDefID(ARMMEX)
-- 			end		
-- 		elseif key == XKEY then
-- 			if 		selDefID == RMSOLAR then	SetSelDefID(ARMWIN)
-- 			elseif 	selDefID == ARMWIN then		SetSelDefID(ARMTIDE)
-- 			elseif 	selDefID == ARMTIDE then	SetSelDefID(ARMSOLAR)
-- 			else 								SetSelDefID(ARMSOLAR)
-- 			end
-- 		elseif key == CKEY then
-- 			if		selDefID == ARMLLT then		SetSelDefID(ARMRAD)
-- 			elseif 	selDefID == ARMRAD then		SetSelDefID(ARMRL)
-- 			elseif 	selDefID == ARMRL then 		SetSelDefID(ARMTL)
-- 			elseif 	selDefID == ARMTL then 		SetSelDefID(ARMSONAR)
-- 			elseif 	selDefID == ARMSONAR then	SetSelDefID(ARMFRT)
-- 			elseif 	selDefID == ARMFRT then		SetSelDefID(ARMLLT)
-- 			else 								SetSelDefID(ARMLLT)
-- 			end
-- 		elseif key == VKEY then
-- 			if		selDefID == ARMLAB then		SetSelDefID(ARMVP)
-- 			elseif 	selDefID == ARMVP then		SetSelDefID(ARMSY)
-- 			elseif 	selDefID == ARMSY then		SetSelDefID(ARMLAB)
-- 			else 								SetSelDefID(ARMLAB)
-- 			end			
-- 		end	
-- 	elseif sDef == UnitDefs[CORCOM] then
-- 		if key == ZKEY then
-- 			if 		selDefID == CORMEX then 	SetSelDefID(CORUWMEX)
-- 			elseif 	selDefID == CORUWMEX then	SetSelDefID(CORMEX)
-- 			else								SetSelDefID(CORMEX)
-- 			end		
-- 		elseif key == XKEY then
-- 			if 		selDefID == CORSOLAR then	SetSelDefID(CORWIN)
-- 			elseif 	selDefID == CORWIN then		SetSelDefID(CORTIDE)
-- 			elseif 	selDefID == CORTIDE then	SetSelDefID(CORSOLAR)
-- 			else 								SetSelDefID(CORSOLAR)
-- 			end
-- 		elseif key == CKEY then
-- 			if		selDefID == CORLLT then		SetSelDefID(CORRAD)
-- 			elseif 	selDefID == CORRAD then		SetSelDefID(CORRL)
-- 			elseif 	selDefID == CORRL then 		SetSelDefID(CORTL)
-- 			elseif 	selDefID == CORTL then 		SetSelDefID(CORSONAR)
-- 			elseif 	selDefID == CORSONAR then	SetSelDefID(CORFRT)
-- 			elseif 	selDefID == CORFRT then		SetSelDefID(CORLLT)
-- 			else 								SetSelDefID(CORLLT)
-- 			end
-- 		elseif key == VKEY then
-- 			if		selDefID == CORLAB then		SetSelDefID(CORVP)
-- 			elseif 	selDefID == CORVP then		SetSelDefID(CORSY)
-- 			elseif 	selDefID == CORSY then		SetSelDefID(CORLAB)
-- 			else 								SetSelDefID(CORLAB)		
-- 			end
-- 		end	
-- 	elseif sDef == UnitDefs[TLLCOM] then
-- 		if key == ZKEY then
-- 			if 		selDefID == TLLMEX then 	SetSelDefID(TLLUWMEX)
-- 			elseif 	selDefID == TLLUWMEX then	SetSelDefID(TLLMEX)
-- 			else								SetSelDefID(TLLMEX)
-- 			end		
-- 		elseif key == XKEY then
-- 			if 		selDefID == TLLSOLAR then	SetSelDefID(TLLWIND)
-- 			elseif 	selDefID == TLLWIND then	SetSelDefID(TLLTIDE)
-- 			elseif 	selDefID == TLLTIDE then	SetSelDefID(TLLSOLAR)
-- 			else 								SetSelDefID(TLLSOLAR)
-- 			end
-- 		elseif key == CKEY then
-- 			if		selDefID == TLLLLT then		SetSelDefID(TLLRADAR)
-- 			elseif 	selDefID == TLLRADAR then	SetSelDefID(TLLLMT)
-- 			elseif 	selDefID == TLLLMT then 	SetSelDefID(TllToRP)
-- 			elseif 	selDefID == TllToRP then 	SetSelDefID(TLLSONAR)
-- 			elseif 	selDefID == TLLSONAR then	SetSelDefID(TLLLMTNS)
-- 			elseif 	selDefID == TLLLMTNS then	SetSelDefID(TLLLLT)
-- 			else 								SetSelDefID(TLLLLT)
-- 			end
-- 		elseif key == VKEY then
-- 			if		selDefID == TLLLAB then		SetSelDefID(TLLVP)
-- 			elseif 	selDefID == TLLVP then		SetSelDefID(TLLSY)
-- 			elseif 	selDefID == TLLSY then		SetSelDefID(TLLLAB)
-- 			else 								SetSelDefID(TLLLAB)		
-- 			end
-- 		end	
-- 	end

-- end

function widget:ViewResize(newX,newY)
	vsx,vsy = newX,newY
	widgetScale = (0.6 + (vsx * vsy / 4000000)) * customScale
	processGuishader()
	local sBuilds = UnitDefs[sDefID].buildOptions
	local numCols = math.min(#sBuilds,maxCols)
	local numRows = math.ceil(#sBuilds / numCols)
	local bgheight = ((numRows * iconHeight) + margin) * widgetScale
	local bgwidth = ((numCols * iconWidth) + margin) * widgetScale

	if wl < 0 then
		wl = 0
	end

	if wl > vsx - bgwidth then
		wl = vsx - bgwidth
	end

	if wt < bgheight then
		wt = bgheight
	end

	if wt > vsy then
		wt = vsy
	end
end

------------------------------------------------------------
-- Misc
------------------------------------------------------------
function widget:TextCommand(cmd)
	-- Facing commands are only handled by spring if we have a building selected, which isn't possible pre-game
	local m = cmd:match("^buildfacing (.+)$")

	if m then
		local oldFacing = Spring.GetBuildFacing()
		local newFacing

		if (m == "inc") then
			newFacing = (oldFacing + 1) % 4
		elseif (m == "dec") then
			newFacing = (oldFacing + 3) % 4
		else
			return false
		end

		Spring.SetBuildFacing(newFacing)
		Spring.Echo("Buildings set to face " .. ({"South","East","North","West"})[1 + newFacing])

		return true
	end

	local buildName = cmd:match("^buildunit_([^%s]+)$")

	if buildName then
		local bDefID = buildNameToID[buildName]

		if bDefID then
			SetSelDefID(bDefID)

			return true
		end
	end
end
