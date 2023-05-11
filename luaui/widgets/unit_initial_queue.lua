function widget:GetInfo()
	-- Puts it above minimap_startboxes with layer 0
	return {
		name = "Initial Queue",
		desc = "Allows you to queue buildings before game start",
		author = "Niobium",
		version = "1.6",
		date = "7 April 2010",
		license = "GNU GPL, v2 or later",
		layer = -1,
		enabled = true,
		handler = true
	}
end

-- 12 jun 2012: "uDef.isMetalExtractor" was replaced by "uDef.extractsMetal > 0" to fix "metal" mode map switching (by [teh]decay, thx to vbs and Beherith)
-- 20 march 2013: added keyboard support with BA keybinds (Bluestone)
-- august 2013: send queue length to cmd_idle_players (BrainDamage)
-- june 2015: guishader + rounded corners + hover effect + widget scales with resolution + remembers queue after /luaui reload (Floris)
-- 26 october 2021: v1.7: Simplify faction change ([MOL]Silver)
------------------------------------------------------------
-- Config
------------------------------------------------------------

-- Building ids
local COMMANDER = {
[UnitDefNames["armcom"].id] = "ARM",
[UnitDefNames["corcom"].id] = "CORE",
[UnitDefNames["tllcom"].id] = "TLL",
[UnitDefNames["talon_com"].id] = "TALON",
[UnitDefNames["gok_com"].id] = "GOK",
[UnitDefNames["rumad_com"].id] = "RUMAD",
}

local CONVERT_TABLE = {
[1] =  {[UnitDefNames["armsolar"].id] = "ARM", 		[UnitDefNames["corsolar"].id] = "CORE",		[UnitDefNames["tllsolar"].id] = "TLL", 		[UnitDefNames["talon_solar"].id] = "TALON", 		[UnitDefNames["gok_solar"].id] = "GOK",		[UnitDefNames["rumad_solar"].id] = "RUMAD", 		},
[2] =  {[UnitDefNames["armwin"].id] = "ARM", 		[UnitDefNames["corwin"].id] = "CORE",		[UnitDefNames["tllwin"].id] = "TLL", 		[UnitDefNames["talon_win"].id] = "TALON", 			[UnitDefNames["gok_win"].id] = "GOK",		[UnitDefNames["rumad_win"].id] = "RUMAD", 			},
[3] =  {[UnitDefNames["armgeo_mini"].id] = "ARM",	[UnitDefNames["corgeo_mini"].id] = "CORE", 	[UnitDefNames["tllgeo_mini"].id] = "TLL",	[UnitDefNames["talon_geo_mini"].id] = "TALON", 		[UnitDefNames["gok_geo_mini"].id] = "GOK",	[UnitDefNames["rumad_geo_mini"].id] = "RUMAD",		},
[4] =  {[UnitDefNames["armmstor"].id] = "ARM", 		[UnitDefNames["cormstor"].id] = "CORE", 	[UnitDefNames["tllmstor"].id] = "TLL",		[UnitDefNames["talon_mstor"].id] = "TALON", 		[UnitDefNames["gok_mstor"].id] = "GOK",		[UnitDefNames["rumad_mstor"].id] = "RUMAD", 		},
[5] =  {[UnitDefNames["armestor"].id] = "ARM", 		[UnitDefNames["corestor"].id] = "CORE", 	[UnitDefNames["tllestor"].id] = "TLL",		[UnitDefNames["talon_estor"].id] = "TALON", 		[UnitDefNames["gok_estor"].id] = "GOK",		[UnitDefNames["rumad_estor"].id] = "RUMAD", 		},
[6] =  {[UnitDefNames["armmex"].id] = "ARM", 		[UnitDefNames["cormex"].id] = "CORE",		[UnitDefNames["tllmex"].id] = "TLL", 		[UnitDefNames["talon_mex"].id] = "TALON", 			[UnitDefNames["gok_mex"].id] = "GOK",		[UnitDefNames["rumad_mex"].id] = "RUMAD", 			},
[7] =  {[UnitDefNames["armmakr"].id] = "ARM", 		[UnitDefNames["cormakr"].id] = "CORE", 		[UnitDefNames["tllmm"].id] = "TLL", 		[UnitDefNames["talon_makr"].id] = "TALON", 			[UnitDefNames["gok_makr"].id] = "GOK",		[UnitDefNames["rumad_metalmakerlvl1"].id] = "RUMAD", 			},
[8] =  {[UnitDefNames["armlab"].id] = "ARM", 		[UnitDefNames["corlab"].id] = "CORE", 		[UnitDefNames["tlllab"].id] = "TLL", 		[UnitDefNames["talon_clone_lab"].id] = "TALON", 	[UnitDefNames["gok_lab"].id] = "GOK",		--[[ [UnitDefNames["rumad_lab"].id] = "RUMAD", ]]	},
[9] =  {[UnitDefNames["armvp"].id] = "ARM", 		[UnitDefNames["corvp"].id] = "CORE", 		[UnitDefNames["tllvp"].id] = "TLL", 		[UnitDefNames["talon_vp"].id] = "TALON", 			[UnitDefNames["gok_lab"].id] = "GOK",		[UnitDefNames["rumad_vp"].id] = "RUMAD", 			},
[10] = {[UnitDefNames["armap"].id] = "ARM", 		[UnitDefNames["corap"].id] = "CORE", 		[UnitDefNames["tllap"].id] = "TLL",  		[UnitDefNames["talon_ap"].id] = "TALON", 			[UnitDefNames["gok_ap"].id] = "GOK",		[UnitDefNames["rumad_ap"].id] = "RUMAD", 			},
[11] = {[UnitDefNames["armeyes"].id] = "ARM", 		[UnitDefNames["coreyes"].id] = "CORE", 		[UnitDefNames["tlltower"].id] = "TLL",		[UnitDefNames["talon_eye"].id] = "TALON", 			[UnitDefNames["gok_eyes"].id] = "GOK",		[UnitDefNames["rumad_eyes"].id] = "RUMAD", 			},
[12] = {[UnitDefNames["armrad"].id] = "ARM", 		[UnitDefNames["corrad"].id] = "CORE",		[UnitDefNames["tllradar"].id] = "TLL", 		[UnitDefNames["talon_rad"].id] = "TALON", 			[UnitDefNames["gok_rad"].id] = "GOK",		--[[ [UnitDefNames["rumad_rad"].id] = "RUMAD", ]] 	},
[13] = {[UnitDefNames["armdrag"].id] = "ARM", 		[UnitDefNames["cordrag"].id] = "CORE", 		[UnitDefNames["tlldt"].id] = "TLL",			[UnitDefNames["talon_drag"].id] = "TALON", 			[UnitDefNames["gok_drag"].id] = "GOK",		[UnitDefNames["rumad_drag"].id] = "RUMAD", 			},
[14] = {[UnitDefNames["armllt"].id] = "ARM", 		[UnitDefNames["corllt"].id] = "CORE",		[UnitDefNames["tllllt"].id] = "TLL", 		[UnitDefNames["talon_llt"].id] = "TALON", 			[UnitDefNames["gok_llt"].id] = "GOK",		[UnitDefNames["rumad_llt"].id] = "RUMAD", 			},
[15] = {[UnitDefNames["armdl"].id] = "ARM", 		[UnitDefNames["cordl"].id] = "CORE", 		[UnitDefNames["tllshoretorp"].id] = "TLL",  																								--[[ [UnitDefNames["rumad_dl"].id] = "RUMAD", ]]	},
[16] = {[UnitDefNames["armrl"].id] = "ARM", 		[UnitDefNames["corrl"].id] = "CORE",		[UnitDefNames["tlllmt"].id] = "TLL",  		[UnitDefNames["talon_rl"].id] = "TALON", 			[UnitDefNames["gok_rl"].id] = "GOK",		[UnitDefNames["rumad_rl"].id] = "RUMAD", 			},
[17] = {[UnitDefNames["armtide"].id] = "ARM", 		[UnitDefNames["cortide"].id] = "CORE",		[UnitDefNames["tlltide"].id] = "TLL", 		[UnitDefNames["talon_tide"].id] = "TALON", 			[UnitDefNames["gok_tide"].id] = "GOK",		--[[ [UnitDefNames["rumad_tide"].id] = "RUMAD", ]]	},
[18] = {[UnitDefNames["armfmkr"].id] = "ARM", 		[UnitDefNames["corfmkr"].id] = "CORE", 		[UnitDefNames["tllwmconv"].id] = "TLL",		[UnitDefNames["talon_fmkr"].id] = "TALON", 			[UnitDefNames["gok_fmkr"].id] = "GOK",		--[[ [UnitDefNames["rumad_fmkr"].id] = "RUMAD", ]] 	},
[19] = {[UnitDefNames["armsy"].id] = "ARM", 		[UnitDefNames["corsy"].id] = "CORE", 		[UnitDefNames["tllsy"].id] = "TLL", 		[UnitDefNames["talon_sy"].id] = "TALON", 			[UnitDefNames["gok_sy"].id] = "GOK",		--[[ [UnitDefNames["rumad_sy"].id] = "RUMAD", ]] 	},
[20] = {[UnitDefNames["armsonar"].id] = "ARM", 		[UnitDefNames["corsonar"].id] = "CORE", 	[UnitDefNames["tllsonar"].id] = "TLL", 		[UnitDefNames["talon_sonar"].id] = "TALON", 		[UnitDefNames["gok_sonar"].id] = "GOK",		--[[ [UnitDefNames["rumad_sonar"].id] = "RUMAD", ]] },
[21] = {[UnitDefNames["armfdrag"].id] = "ARM", 		[UnitDefNames["corfdrag"].id] = "CORE", 	[UnitDefNames["tlldtns"].id] = "TLL", 		[UnitDefNames["talon_fdrag"].id] = "TALON", 		[UnitDefNames["gok_fdrag"].id] = "GOK",		--[[ [UnitDefNames["rumad_fdrag"].id] = "RUMAD", ]] },
[22] = {[UnitDefNames["armtl"].id] = "ARM", 		[UnitDefNames["cortl"].id] = "CORE", 		[UnitDefNames["tlltorp"].id] = "TLL", 		[UnitDefNames["talon_tl"].id] = "TALON", 			[UnitDefNames["gok_tl"].id] = "GOK", 		--[[ [UnitDefNames["rumad_tl"].id] = "RUMAD", ]] 	},
[23] = {[UnitDefNames["armfllt"].id] = "ARM", 		[UnitDefNames["corfllt"].id] = "CORE", 		[UnitDefNames["tllfllt"].id] = "TLL",															[UnitDefNames["gok_fllt"].id] = "GOK",		--[[ [UnitDefNames["rumad_fllt"].id] = "RUMAD", ]] 	},
[24] = {[UnitDefNames["armfrt"].id] = "ARM", 		[UnitDefNames["corfrt"].id] = "CORE", 		[UnitDefNames["tlllmtns"].id] = "TLL",		[UnitDefNames["talon_frl"].id] = "TALON", 			[UnitDefNames["gok_frl"].id] = "GOK", 		--[[ [UnitDefNames["rumad_frt"].id] = "RUMAD", ]] 	},
}

-- Panel
local iconWidth = 55
local iconHeight = 52
local iconPadding = 0.2
local borderSize = 0
local maxCols = 5
local fontSize = 17
local margin = 1
local drawTooltip = true
local drawBigTooltip = false
local borderPadding = 1

local borderColor = {1, 1, 1, 0.025}

local hoverColor = {1, 1, 1, 0.25}

local pushedColor = {1, 0.1, 0, 0.33}

local clickColor = {0.66, 1, 0, 0.25}

local bgcorner = LUAUI_DIRNAME .. "Images/bgcorner.png"
local buttonhighlight = ":n:" .. LUAUI_DIRNAME .. "Images/button-highlight.dds"
local buttonpushed = ":n:" .. LUAUI_DIRNAME .. "Images/button-pushed.dds"
local oldUnitpicsDir = LUAUI_DIRNAME .. "Images/oldunitpics/"
local customScale = 0.95

-- Colors
local buildDistanceColor = {0.3, 1.0, 0.3, 0.6}

local buildLinesColor = {0.3, 1.0, 0.3, 0.6}

local borderNormalColor = {0.3, 1.0, 0.3, 0.5}

local borderClashColor = {0.7, 0.3, 0.3, 1.0}

local borderValidColor = {0.0, 1.0, 0.0, 1.0}

local borderInvalidColor = {1.0, 0.0, 0.0, 1.0}

local buildingQueuedAlpha = 0.5
local metalColor = "\255\196\196\255" -- Light blue
local energyColor = "\255\255\255\128" -- Light yellow
local buildColor = "\255\128\255\128" -- Light green
local whiteColor = "\255\255\255\255" -- White
local vsx, vsy = gl.GetViewSizes()
local widgetScale = 1 -- will adjust based on resolution
local GL_ONE = GL.ONE
local GL_ONE_MINUS_SRC_ALPHA = GL.ONE_MINUS_SRC_ALPHA
local GL_SRC_ALPHA = GL.SRC_ALPHA
local glBlending = gl.Blending


-- to check if OTA icon exist, defs table
local OtaIconExist = {}
local isMex = {}
local isBuildableQueue = {}

for uDefID, uDef in pairs(UnitDefs) do
	if uDef.extractsMetal > 0 then
		isMex[uDefID] = true
	end

	if COMMANDER[uDefID] then
		if uDef.buildOptions then
			for i = 1, #uDef.buildOptions do
				local tooltip = UnitDefs[uDef.buildOptions[i]].tooltip
				local humanName = UnitDefs[uDef.buildOptions[i]].humanName
				local text = "\255\215\255\215" .. humanName .. "\n\255\240\240\240"
				local description_long = UnitDefs[uDef.buildOptions[i]].customParams.description_long or "" --Todo atm we don"t use this

				isBuildableQueue[uDef.buildOptions[i]] = {
					tooltip = tooltip,
					humanName = humanName,
					text = text,
					description_long = description_long
				}
			end
		end
	end
end

for uDefID, uDef in pairs(UnitDefs) do
	if uDef.extractsMetal > 0 then
		isMex[uDefID] = true
	end
end

------------------------------------------------------------
-- Globals
------------------------------------------------------------
local sDefID -- Starting unit def ID
local sDef -- UnitDefs[sDefID]
local selDefID = nil 
local buildQueue = {}
local buildNameToID = {}
local gameStarted = false
local wWidth, wHeight = Spring.GetWindowGeometry()
local wl, wt = 50, 0.5 * wHeight
local cellRows = {} -- {{bDefID, bDefID, ...}, ...}
local panelList = nil -- Display list for panel
local areDragging = false
local isMex = {} -- isMex[uDefID] = true / nil
local weaponRange = {} -- weaponRange[uDefID] = # / nil
local myTeamID = Spring.GetMyTeamID()
local amNewbie = (Spring.GetTeamRulesParam(myTeamID, "isNewbie") == 1)

------------------------------------------------------------
-- Local functions
------------------------------------------------------------
function wrap(str, limit)
	limit = limit or 72
	local here = 1
	local buf = ""
	local t = {}

	str:gsub("(%s*)()(%S+)()", function(sp, st, word, fi)
		if fi - here > limit then
			--# Break the line
			here = st
			table.insert(t, buf)
			buf = word
		else
			buf = buf .. sp .. word --# Append
		end
	end)

	--# Tack on any leftovers
	if (buf ~= "") then
		table.insert(t, buf)
	end

	return t
end

local function RectQuad(px, py, sx, sy)
	local o = 0.008 -- texture offset, because else grey line might show at the edges
	gl.TexCoord(o, 1 - o)
	gl.Vertex(px, py, 0)
	gl.TexCoord(1 - o, 1 - o)
	gl.Vertex(sx, py, 0)
	gl.TexCoord(1 - o, o)
	gl.Vertex(sx, sy, 0)
	gl.TexCoord(o, o)
	gl.Vertex(px, sy, 0)
end

function DrawRect(px, py, sx, sy)
	gl.BeginEnd(GL.QUADS, RectQuad, px, py, sx, sy)
end

local function TraceDefID(mx, my)
	local overRow = cellRows[1 + math.floor((wt - my) / ((iconHeight + borderSize) * widgetScale))]
	if not overRow then return nil end

	return overRow[1 + math.floor((mx - wl) / ((iconWidth + borderSize) * widgetScale))]
end

local function GetBuildingDimensions(uDefID, facing)
	local bDef = UnitDefs[uDefID]

	if (facing % 2 == 1) then
		return 4 * bDef.zsize, 4 * bDef.xsize
	else
		return 4 * bDef.xsize, 4 * bDef.zsize
	end
end

local function DrawBuilding(buildData, borderColor, buildingAlpha, drawRanges)
	local bDefID, bx, by, bz, facing = buildData[1], buildData[2], buildData[3], buildData[4], buildData[5]
	local bw, bh = GetBuildingDimensions(bDefID, facing)
	gl.DepthTest(false)
	gl.Color(borderColor)

	gl.Shape(GL.LINE_LOOP, {
		{
			v = {bx - bw, by, bz - bh}
		},
		{
			v = {bx + bw, by, bz - bh}
		},
		{
			v = {bx + bw, by, bz + bh}
		},
		{
			v = {bx - bw, by, bz + bh}
		}
	})

	if drawRanges then
		if isMex[bDefID] then
			gl.Color(1.0, 0.3, 0.3, 0.7)
			gl.DrawGroundCircle(bx, by, bz, Game.extractorRadius, 50)
		end

		local wRange = weaponRange[bDefID]

		if wRange then
			gl.Color(1.0, 0.3, 0.3, 0.7)
			gl.DrawGroundCircle(bx, by, bz, wRange, 40)
		end
	end

	gl.DepthTest(GL.LEQUAL)
	gl.DepthMask(true)

	if buildingAlpha == 1 then
		gl.Lighting(true)
	end

	gl.Color(1.0, 1.0, 1.0, buildingAlpha)
	gl.PushMatrix()
	gl.Translate(bx, by, bz)
	gl.Rotate(90 * facing, 0, 1, 0)
	gl.UnitShape(bDefID, Spring.GetMyTeamID(), false, true, false)
	gl.PopMatrix()
	gl.Lighting(false)
	gl.DepthTest(false)
	gl.DepthMask(false)
end

local function DrawUnitDef(uDefID, uTeam, ux, uy, uz)
	gl.Color(1.0, 1.0, 1.0, 1.0)
	gl.DepthTest(GL.LEQUAL)
	gl.DepthMask(true)
	gl.Lighting(true)
	gl.PushMatrix()
	gl.Translate(ux, uy, uz)
	gl.UnitShape(uDefID, uTeam, false, true, false)
	gl.PopMatrix()
	gl.Lighting(false)
	gl.DepthTest(false)
	gl.DepthMask(false)
end

local function DoBuildingsClash(buildData1, buildData2)
	local w1, h1 = GetBuildingDimensions(buildData1[1], buildData1[5])
	local w2, h2 = GetBuildingDimensions(buildData2[1], buildData2[5])

	return math.abs(buildData1[2] - buildData2[2]) < w1 + w2 and math.abs(buildData1[4] - buildData2[4]) < h1 + h2
end

local function SetSelDefID(defID)
	selDefID = defID
	local MetalWidget = widgetHandler.knownWidgets["Pre Start Metal View"] or {}

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

	for i = 1, #uBuilds do
		uCanBuild[uBuilds[i]] = true
	end

	-- Can it build everything that was queued ?
	for i = 1, #buildQueue do
		if not uCanBuild[buildQueue[i][1]] then return false end
	end

	return true
end

local function GetQueueBuildTime()
	local t = 0

	for i = 1, #buildQueue do
		t = t + UnitDefs[buildQueue[i][1]].buildTime
	end

	return t / sDef.buildSpeed
end

local function GetQueueCosts()
	local mCost = 0
	local eCost = 0
	local bCost = 0

	for i = 1, #buildQueue do
		local uDef = UnitDefs[buildQueue[i][1]]
		mCost = mCost + uDef.metalCost
		eCost = eCost + uDef.energyCost
		bCost = bCost + uDef.buildTime
	end

	return mCost, eCost, bCost
end

------------------------------------------------------------
-- Initialize/shutdown
------------------------------------------------------------
function widget:Initialize()
	if not WG["background_opacity_custom"] then
		WG["background_opacity_custom"] = {0, 0, 0, 0.5}
	end

	-- Don"t run if start positions are random
	-- Don"t run if game has already started -- Don"t run if i"m a newbie -- Don"t run if we are a spec 
	if (Game.startPosType == 1) or (Spring.GetGameFrame() > 0) or amNewbie or (Spring.GetSpectatingState()) then
		widgetHandler:RemoveWidget(self)

		return remove
	end

	local _, _, _, _, mySide = Spring.GetTeamInfo(myTeamID)

	-- Don"t run unless we know what faction the player is
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
	if (WG["guishader_api"] ~= nil) then
		local sBuilds = UnitDefs[sDefID].buildOptions
		local numCols = math.min(#sBuilds, maxCols)
		local numRows = math.ceil(#sBuilds / numCols)
		local bgheight = ((numRows * iconHeight) + margin) * widgetScale
		local bgwidth = ((numCols * iconWidth) + margin) * widgetScale
		WG["guishader_api"].InsertRect(wl - (margin * widgetScale), wt - bgheight, wl + bgwidth, wt + margin * widgetScale, "initialqueue")
	end
end

function RectRound(px, py, sx, sy, cs)
	px, py, sx, sy, cs = math.floor(px), math.floor(py), math.ceil(sx), math.ceil(sy), math.floor(cs)
	gl.Rect(px + cs, py, sx - cs, sy)
	gl.Rect(sx - cs, py + cs, sx, sy - cs)
	gl.Rect(px + cs, py + cs, px, sy - cs)
	gl.Texture(bgcorner)
	--if py <= 0 or px <= 0 then gl.Texture(false) else gl.Texture(bgcorner) end
	DrawRect(px, py + cs, px + cs, py) -- top left
	--if py <= 0 or sx >= vsx then gl.Texture(false) else gl.Texture(bgcorner) end
	DrawRect(sx, py + cs, sx - cs, py) -- top right
	--if sy >= vsy or px <= 0 then gl.Texture(false) else gl.Texture(bgcorner) end
	DrawRect(px, sy - cs, px + cs, sy) -- bottom left
	--if sy >= vsy or sx >= vsx then gl.Texture(false) else gl.Texture(bgcorner) end
	DrawRect(sx, sy - cs, sx - cs, sy) -- bottom right
	gl.Texture(false)
end

function InitializeFaction(sDefID)
	sDef = UnitDefs[sDefID]
	-- Don"t run if theres nothing to show
	local sBuilds = sDef.buildOptions
	if not sBuilds or (#sBuilds == 0) then return end
	-- Set up cells
	local numCols = math.min(#sBuilds, maxCols)
	local numRows = math.ceil(#sBuilds / numCols)
	cellRows = {} -- clear them before faction change
	for r = 1, numRows do
		cellRows[r] = {}
	end

	for b = 0, #sBuilds - 1 do
		cellRows[1 + math.floor(b / numCols)][1 + b % numCols] = sBuilds[b + 1]

		if VFS.FileExists(oldUnitpicsDir .. UnitDefs[sBuilds[b + 1]].name .. ".png") then
			OtaIconExist[sBuilds[b + 1]] = oldUnitpicsDir .. UnitDefs[sBuilds[b + 1]].name .. ".png"
		end
	end

	-- delete any pre-existing displaylist
	if panelList then
		gl.DeleteList(panelList)
	end

	for uDefID, uDef in pairs(UnitDefs) do
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

	if (WG["guishader_api"] ~= nil) then
		WG["guishader_api"].RemoveRect("initialqueue")
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
	local _, _, _, _, mySide = Spring.GetTeamInfo(Spring.GetMyTeamID())

	if Spring.GetGameSeconds() <= 0 and mySide ~= "" then
		local startUnitName = Spring.GetSideData(mySide)
		local sDefID = UnitDefNames[startUnitName].id
		local sBuilds = UnitDefs[sDefID].buildOptions
		local numCols = math.min(#sBuilds, maxCols)
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
--local queueTimeFormat = whiteColor .. "Queued: " .. buildColor .. "%.1f sec " .. whiteColor .. "[" .. metalColor .. "%d m" .. whiteColor .. ", " .. energyColor .. "%d e" .. whiteColor .. "]"
local queueTimeFormat = whiteColor .. "Queued " .. metalColor .. "%dm " .. energyColor .. "%de " .. buildColor .. "%.1f sec"

--local queueTimeFormat = metalColor .. "%dm " .. whiteColor .. "/ " .. energyColor .. "%de " .. whiteColor .. "/ " .. buildColor .. "%.1f sec"
-- "Queued 23.9 seconds (820m / 2012e)" (I think this one is the best. Time first emphasises point and goodness of widget)
-- Also, it is written like english and reads well, none of this colon stuff or figures stacked together
function widget:DrawScreen()
	gl.PushMatrix()
	gl.Translate(wl, wt, 0)
	gl.Scale(widgetScale, widgetScale, widgetScale)
	gl.PushMatrix()
	gl.Translate(0, borderSize, 0)
	-- background
	local bgheight = ((#cellRows * iconHeight) + margin)
	local bgwidth = ((maxCols * iconWidth) + margin)
	gl.Color(WG["background_opacity_custom"])
	RectRound(-(margin), -bgheight, bgwidth, margin, ((iconWidth + iconPadding + iconPadding) / 7))
	gl.Color(borderColor)
	RectRound(-(margin) + borderPadding, -bgheight + borderPadding, bgwidth - borderPadding, margin - borderPadding, ((iconWidth + iconPadding + iconPadding) / 9))

	for r = 1, #cellRows do
		local cellRow = cellRows[r]
		gl.Translate(0, -((iconHeight - borderSize)), 0)
		gl.PushMatrix()

		for c = 1, #cellRow do
			gl.Color(0, 0, 0, 1)
			--gl.Rect(-borderSize, -borderSize, iconWidth + borderSize, iconHeight + borderSize)
			gl.Color(1, 1, 1, 1)

			if WG["OtaIcons"] and OtaIconExist[cellRow[c]] then
				gl.Texture(OtaIconExist[cellRow[c]])
			else
				gl.Texture("#" .. cellRow[c]) -- Screen.vsx,Screen.vsy
			end

			DrawRect(iconPadding, iconPadding, (iconWidth - iconPadding), (iconHeight - iconPadding))
			gl.Texture(false)
			gl.Translate((iconWidth + borderSize), 0, 0)
		end

		gl.PopMatrix()
	end

	gl.PopMatrix()
	--gl.CallList(panelList)
	gl.Scale(1 / widgetScale, 1 / widgetScale, 1 / widgetScale)

	if #buildQueue > 0 then
		local mCost, eCost, bCost = GetQueueCosts()
		local buildTime = bCost / sDef.buildSpeed
		totalTime = buildTime
		gl.Text(string.format(queueTimeFormat, mCost, eCost, buildTime), 0, margin * widgetScale, fontSize * widgetScale, "do")
	end

	-- draw hover
	--{mx,my,m1,m2,m3}
	local CurMouseState = {Spring.GetMouseState()}

	local row = 1 + math.floor((wt - CurMouseState[2]) / ((iconHeight + borderSize) * widgetScale))
	local col = 1 + math.floor((wl - CurMouseState[1]) / ((iconWidth + borderSize) * widgetScale))

	if TraceDefID(CurMouseState[1], CurMouseState[2]) then
		gl.Translate(-((iconWidth * widgetScale) * col), -((iconHeight * widgetScale) * row), 0)
		gl.Texture(buttonhighlight)
		gl.Color(hoverColor)
		DrawRect(iconPadding * widgetScale, iconPadding * widgetScale, iconWidth - iconPadding * widgetScale, iconHeight - iconPadding * widgetScale)
		gl.Color(hoverColor[1], hoverColor[2], hoverColor[3], hoverColor[4] / 1.5)
		glBlending(GL_SRC_ALPHA, GL_ONE)
		DrawRect(iconPadding * widgetScale, iconPadding * widgetScale, (iconWidth - iconPadding) * widgetScale, (iconHeight - iconPadding) * widgetScale)
		glBlending(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)

		if CurMouseState[3] then
			gl.Color(clickColor)
			DrawRect(iconPadding * widgetScale, iconPadding * widgetScale, (iconWidth - iconPadding) * widgetScale, (iconHeight - iconPadding) * widgetScale)
			gl.Color(clickColor[1], clickColor[2], clickColor[3], clickColor[4] / 1.5)
			glBlending(GL_SRC_ALPHA, GL_ONE)
			DrawRect(iconPadding * widgetScale, iconPadding * widgetScale, (iconWidth - iconPadding) * widgetScale, (iconHeight - iconPadding) * widgetScale)
			glBlending(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)
			lastClickedRow = row
			lastClickedCol = col
		end

		gl.Texture(false)
		gl.Translate(iconWidth * widgetScale * col, iconHeight * widgetScale * row, 0)

		if drawTooltip and WG["tooltip"] ~= nil then
			local udefid = TraceDefID(CurMouseState[1], CurMouseState[2])
			local text = isBuildableQueue[udefid].text

			if drawBigTooltip and isBuildableQueue[udefid].description_long ~= nil then
				local lines = wrap(isBuildableQueue[udefid].description_long, 58)
				local description = ""
				local newline = ""

				for i, line in ipairs(lines) do
					description = description .. newline .. line
					newline = "\n"
				end

				text = text .. description
			else
				text = text .. isBuildableQueue[udefid].tooltip
			end

			WG["tooltip"].ShowTooltip("initialqueue", text)
		end
	end

	if selDefID ~= nil and lastClickedRow ~= nil and lastClickedCol ~= nil then
		local row, col = lastClickedRow, lastClickedCol
		gl.Translate(-((iconWidth * widgetScale) * col), -((iconHeight * widgetScale) * row), 0)
		gl.Texture(buttonpushed)
		gl.Color(pushedColor)
		DrawRect((iconPadding * widgetScale), (iconPadding * widgetScale), ((iconWidth - iconPadding) * widgetScale), ((iconHeight - iconPadding) * widgetScale))
		gl.Color(pushedColor[1], pushedColor[2], pushedColor[3], pushedColor[4] / 1.5)
		glBlending(GL_SRC_ALPHA, GL_ONE)
		DrawRect((iconPadding * widgetScale), (iconPadding * widgetScale), ((iconWidth - iconPadding) * widgetScale), ((iconHeight - iconPadding) * widgetScale))
		glBlending(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)
		gl.Texture(false)
		gl.Translate(((iconWidth * widgetScale) * col), ((iconHeight * widgetScale) * row), 0)
	end

	gl.PopMatrix()
end

local previousCommander

function widget:DrawWorld()
	--don"t draw anything once the game has started; after that engine can draw queues itself
	if gameStarted then return end
	-- Set up gl
	gl.LineWidth(1.49)
	-- We need data about currently selected building, for drawing clashes etc
	local selBuildData

	if selDefID then
		local mx, my = Spring.GetMouseState()
		local _, pos = Spring.TraceScreenRay(mx, my, true)

		if pos then
			local bx, by, bz = Spring.Pos2BuildPos(selDefID, pos[1], pos[2], pos[3])
			local buildFacing = Spring.GetBuildFacing()

			selBuildData = {selDefID, bx, by, bz, buildFacing}
		end
	end

	local myTeamID = Spring.GetMyTeamID()
	local sx, sy, sz = Spring.GetTeamStartPosition(myTeamID) -- Returns -100, -100, -100 when none chosen
	local startChosen = (sx ~= -100)

	if startChosen then
		-- Correction for start positions in the air
		sy = Spring.GetGroundHeight(sx, sz)
		-- Draw the starting unit at start position
		sDefID = sDef.id
		DrawUnitDef(sDefID, myTeamID, sx, sy, sz)
		gl.Color(buildDistanceColor)
		gl.DrawGroundCircle(sx, sy, sz, sDef.buildDistance, 40)
	end

	-- Check for faction change
	if previousCommander ~= COMMANDER[sDef.id] then
		for b = 1, #buildQueue do
			local buildData = buildQueue[b]
			local buildDataId = buildData[1]

			for i, v in ipairs(CONVERT_TABLE) do
				if v[buildDataId] then
					for j, faction in pairs(v) do
						if faction == COMMANDER[sDef.id] then
							buildData[1] = j
							buildQueue[b] = buildData
						end
					end
				end
			end
		end
	end
	previousCommander = COMMANDER[sDef.id]

	-- Draw all the buildings
	local queueLineVerts = startChosen and {
		{
			v = {sx, sy, sz}
		}
	} or {}

	for b = 1, #buildQueue do
		local buildData = buildQueue[b]

		if selBuildData and DoBuildingsClash(selBuildData, buildData) then
			DrawBuilding(buildData, borderClashColor, buildingQueuedAlpha)
		else
			DrawBuilding(buildData, borderNormalColor, buildingQueuedAlpha)
		end

		queueLineVerts[#queueLineVerts + 1] = {
			v = {buildData[2], buildData[3], buildData[4]}
		}
	end

	-- Draw queue lines
	gl.Color(buildLinesColor)
	gl.LineStipple("springdefault")
	gl.Shape(GL.LINE_STRIP, queueLineVerts)
	gl.LineStipple(false)

	-- Draw selected building
	if selBuildData then
		if Spring.TestBuildOrder(selDefID, selBuildData[2], selBuildData[3], selBuildData[4], selBuildData[5]) ~= 0 then
			DrawBuilding(selBuildData, borderValidColor, 1.0, true)
		else
			DrawBuilding(selBuildData, borderInvalidColor, 1.0, true)
		end
	end

	-- Reset gl
	gl.Color(1.0, 1.0, 1.0, 1.0)
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

	-- Don"t run if we are a spec
	local areSpec = Spring.GetSpectatingState()

	if areSpec then
		widgetHandler:RemoveWidget(self)

		return
	end

	-- Don"t run if we didn"t queue anything
	if (#buildQueue == 0) then
		widgetHandler:RemoveWidget(self)

		return
	end

	if (n < 2) then return end -- Give the unit frames 0 and 1 to spawn
	--inform gadget how long is our queue
	local buildTime = GetQueueBuildTime()
	Spring.SendCommands("luarules initialQueueTime " .. buildTime)

	if (n == 142) then
		Spring.Echo("> Starting unit never spawned !")
		widgetHandler:RemoveWidget(self)

		return
	end

	--comGate takes up until frame 105
	if (comGate == 0 or Spring.GetGameFrame() == 141) then
		local tasker
		-- Search for our starting unit
		local units = Spring.GetTeamUnits(Spring.GetMyTeamID())

		for u = 1, #units do
			local uID = units[u]

			if GetUnitCanCompleteQueue(uID) then
				tasker = uID
				if Spring.GetUnitRulesParam(uID, "startingOwner") == Spring.GetMyPlayerID() then break end --we found our com even if cooping, assigning queue to this particular unit
			end
		end

		if tasker then
			for b = 1, #buildQueue do
				local buildData = buildQueue[b]

				Spring.GiveOrderToUnit(tasker, -buildData[1], {buildData[2], buildData[3], buildData[4], buildData[5]}, {"shift"})
			end

			widgetHandler:RemoveWidget(self)
		end
	end
end

------------------------------------------------------------
-- Mouse
------------------------------------------------------------
function widget:IsAbove(mx, my)
	return TraceDefID(mx, my)
end

local tooltipFormat = "Build %s\n%s\n" .. metalColor .. "%d m " .. whiteColor .. "/ " .. energyColor .. "%d e " .. whiteColor .. "/ " .. buildColor .. "%.1f sec"

function widget:GetTooltip(mx, my)
	local bDefID = TraceDefID(mx, my)
	local bDef = UnitDefs[bDefID]

	return string.format(tooltipFormat, bDef.humanName, bDef.tooltip, bDef.metalCost, bDef.energyCost, bDef.buildTime / sDef.buildSpeed)
end

function SetBuildFacing()
	local wx, wy, _, _ = Spring.GetScreenGeometry()
	local _, pos = Spring.TraceScreenRay(wx / 2, wy / 2, true)
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

function widget:MousePress(mx, my, mButton)
	local tracedDefID = TraceDefID(mx, my)

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
				local mx, my = Spring.GetMouseState()
				local _, pos = Spring.TraceScreenRay(mx, my, true)
				if not pos then return end
				local bx, by, bz = Spring.Pos2BuildPos(selDefID, pos[1], pos[2], pos[3])
				local buildFacing = Spring.GetBuildFacing()

				if WG["PreGameMexPos"] and isMex[selDefID] then
					bx = WG["PreGameMexPos"].bx
					by = WG["PreGameMexPos"].by
					bz = WG["PreGameMexPos"].bz
				end

				if Spring.TestBuildOrder(selDefID, bx, by, bz, buildFacing) ~= 0 then
					local buildData = {selDefID, bx, by, bz, buildFacing}

					local _, _, meta, shift = Spring.GetModKeyState()

					if meta then
						table.insert(buildQueue, 1, buildData)
					elseif shift then
						local anyClashes = false

						for i = #buildQueue, 1, -1 do
							if DoBuildingsClash(buildData, buildQueue[i]) then
								anyClashes = true
								table.remove(buildQueue, i)
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

function widget:MouseMove(mx, my, dx, dy, mButton)
	if areDragging then
		local sBuilds = UnitDefs[sDefID].buildOptions
		local numCols = math.min(#sBuilds, maxCols)
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

function widget:MouseRelease(mx, my, mButton)
	areDragging = false
	local tracedDefID = TraceDefID(mx, my)

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

function widget:ViewResize(newX, newY)
	vsx, vsy = newX, newY
	widgetScale = (0.6 + (vsx * vsy / 4000000)) * customScale
	processGuishader()
	local sBuilds = UnitDefs[sDefID].buildOptions
	local numCols = math.min(#sBuilds, maxCols)
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
	-- Facing commands are only handled by spring if we have a building selected, which isn"t possible pre-game
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

		Spring.Echo("Buildings set to face " .. ({"South", "East", "North", "West"})[1 + newFacing])

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