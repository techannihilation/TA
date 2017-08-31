function widget:GetInfo()
	return {
		name      = "Unit Marker",
		version   = "1.0",
		desc      = "Marks spotted units of interest now with old-mark auto-remover",
		author    = "LEDZ",
		date      = "2012.10.01",
		license   = "GNU GPL v2",
		layer     = 0,
		enabled   = true
	}
end
--------------------------------------------------------------------------------
--This unit marker is a culmination of previous work by Pako (this method of
--setting units of interest and their names with multi-language support) and
--enhancements by LEDZ. The amount of units/events it marks has been reduced 
--substanially by Bluestone (by popular request).
--Features:
--{x}Multilanguage support
--{x}Marks units of interest with the colour of the unit's owner.
--{x}Auto-deletes previous marks for units that have moved since.

local unitList = {}
--MARKER LIST ------------------------------------
unitList["TA"] = {


--[UnitDefNames["cormabm"].id] = {["en"]="Mobile Anti-Nuke", ["de"]="Mobile Anti-Atomwaffe", ["fr"]="Mobile Contre l'Arme Nucl�aire" },
--[UnitDefNames["armscab"].id] = {["en"]="Mobile Anti-Nuke", ["de"]="Mobile Anti-Atomwaffe", ["fr"]="Mobile Contre l'Arme Nucl�aire" },

--[UnitDefNames["aafus"].id] = 	{["en"]="Adv. Fusion", ["de"]="Fortgeschrittene Fusion", ["fr"]="Sup�rieur Fusion" },
--[UnitDefNames["cafus"].id] = 	{["en"]="Adv. Fusion", ["de"]="Fortgeschrittene Fusion", ["fr"]="Sup�rieur Fusion" },

--[UnitDefNames["amgeo"].id] = 	{["en"]="Moho Geo", ["de"]="Moho Geo", ["fr"]="Moho G�o" },
--[UnitDefNames["cmgeo"].id] = 	{["en"]="Moho Geo", ["de"]="Moho Geo", ["fr"]="Moho G�o" },

--[UnitDefNames["corblackhy"].id]={["en"]="Black Hydra", ["de"]="Flaggschiff", ["fr"]="" },
--[UnitDefNames["armepoch"].id]={["en"]="Epoch", ["de"]="Flaggschiff", ["fr"]="" }




--Anti-Nukes
[UnitDefNames["armamd"].id] = {["en"]="Anti-Nuke", ["de"]="Anti-Atomwaffe", ["fr"]="Contre l'Arme Nucl�aire" },
[UnitDefNames["corfmd"].id] = {["en"]="Anti-Nuke", ["de"]="Anti-Atomwaffe", ["fr"]="Contre l'Arme Nucl�aire" },
[UnitDefNames["armamd1"].id] = 	{["en"]="Adv. Anti Nuke", ["de"]="", ["fr"]="" },
[UnitDefNames["corfmd1"].id] = 	{["en"]="Adv. Anti Nuke", ["de"]="", ["fr"]="" },
[UnitDefNames["tllantinuke"].id] = 	{["en"]="Anti Nuke", ["de"]="", ["fr"]="" },
[UnitDefNames["tllantinuke1"].id] = 	{["en"]="Anti Nuke", ["de"]="", ["fr"]="" },

--Nuke Silos
[UnitDefNames["armsilo"].id] = 	{["en"]="Nuke Missile Silo", ["de"]="Atom-Raketensilo", ["fr"]="l'Arme Nucl�aire" },
[UnitDefNames["corsilo"].id] = 	{["en"]="Nuke Missile Silo", ["de"]="Atom-Raketensilo", ["fr"]="l'Arme Nucl�aire" },
[UnitDefNames["armsilo1"].id] = 	{["en"]="Advanced Nuke", ["de"]="", ["fr"]="" },
[UnitDefNames["corsilo1"].id] = 	{["en"]="Advanced Nuke", ["de"]="", ["fr"]="" },
[UnitDefNames["tllsilo"].id] = 	{["en"]="Nuke", ["de"]="", ["fr"]="" },

--Uber Nukes
[UnitDefNames["tllion"].id] = 	{["en"]="Ultimate Nuke Missile Silo", ["de"]="Atom-Raketensilo", ["fr"]="l'Arme Nucl�aire" },
[UnitDefNames["armfsilo"].id] = 	{["en"]="Ultimate Nuke Missile Silo", ["de"]="Atom-Raketensilo", ["fr"]="l'Arme Nucl�aire" },
[UnitDefNames["corfsilo"].id] = 	{["en"]="Ultimate Nuke Missile Silo", ["de"]="Atom-Raketensilo", ["fr"]="l'Arme Nucl�aire" },

--Uber Anti-Nukes
[UnitDefNames["tllgazelle"].id] = 	{["en"]="Ultimate Anti Nuke", ["de"]="", ["fr"]="" },
[UnitDefNames["armamd2"].id] = 	{["en"]="Ultimate Anti Nuke", ["de"]="", ["fr"]="" },
[UnitDefNames["corfmd2"].id] = 	{["en"]="Ultimate Anti Nuke", ["de"]="", ["fr"]="" },

--Tac Nuke Style static units
[UnitDefNames["armemp"].id] = 	{["en"]="EMP Silo", ["de"]="EMP-Raketensilo", ["fr"]="EMP Silo" },
[UnitDefNames["cortron"].id] = 	{["en"]="Tactical Nuke Silo", ["de"]="Taktische Atom-Raketensilo", ["fr"]="l'Arme Tactiques Nucl�aire" },
[UnitDefNames["tllemp"].id] = 	{["en"]="EMP Silo", ["de"]="EMP-Raketensilo", ["fr"]="EMP Silo" },

--T3 labs
[UnitDefNames["armshltx"].id] = 	{["en"]="T3 Gantry", ["de"]="", ["fr"]="" },
[UnitDefNames["corgant"].id] = 	{["en"]="Krog Gantry", ["de"]="", ["fr"]="" },
[UnitDefNames["armesy"].id] = 	{["en"]="T3 Shipyard", ["de"]="", ["fr"]="" },
[UnitDefNames["coresy"].id] = 	{["en"]="T3 Shipyard", ["de"]="", ["fr"]="" },
[UnitDefNames["armevp"].id] = 	{["en"]="T3 Vehicle Lab", ["de"]="", ["fr"]="" },
[UnitDefNames["corevp"].id] = 	{["en"]="T3 Vehicle Lab", ["de"]="", ["fr"]="" },

--T4 Labs
[UnitDefNames["armshltx1"].id] = 	{["en"]="T4 Gantry", ["de"]="", ["fr"]="" },
[UnitDefNames["corgant1"].id] = 	{["en"]="T4 Gantry", ["de"]="", ["fr"]="" },
[UnitDefNames["cshipyardlvl4"].id] = 	{["en"]="Core Hero Lab", ["de"]="", ["fr"]="" },
[UnitDefNames["ashipyardlvl3"].id] = 	{["en"]="Arm Hero Lab", ["de"]="", ["fr"]="" },
[UnitDefNames["acovertopscentre"].id] = 	{["en"]="T4 Lab", ["de"]="", ["fr"]="" },
[UnitDefNames["ccovertopscentre"].id] = 	{["en"]="T4 Lab", ["de"]="", ["fr"]="" },
[UnitDefNames["core_hexapod_lab"].id] = 	{["en"]="Hexapod Lab", ["de"]="", ["fr"]="" },
[UnitDefNames["arm_mech_lab"].id] = 	{["en"]="Mech Lab", ["de"]="", ["fr"]="" },
[UnitDefNames["tllprototype"].id] = 	{["en"]="Prototype Lab", ["de"]="", ["fr"]="" },

--T3 Mex
[UnitDefNames["armmas"].id] = 	{["en"]="T3 Mex", ["de"]="", ["fr"]="" },
[UnitDefNames["cormas"].id] = 	{["en"]="T3 Mex", ["de"]="", ["fr"]="" },
[UnitDefNames["tllmas"].id] = 	{["en"]="T3 Mex", ["de"]="", ["fr"]="" },

--Fusion
[UnitDefNames["aafus"].id] = 	{["en"]="Adv. Fusion", ["de"]="Fortgeschrittene Fusion", ["fr"]="Sup�rieur Fusion" },
[UnitDefNames["cafus"].id] = 	{["en"]="Adv. Fusion", ["de"]="Fortgeschrittene Fusion", ["fr"]="Sup�rieur Fusion" },
[UnitDefNames["tllcoldfus"].id] = 	{["en"]="Adv. Fusion", ["de"]="Fortgeschrittene Fusion", ["fr"]="Sup�rieur Fusion" },
[UnitDefNames["afusionplant"].id] = 	{["en"]="Arm Mega Fusion Reactor", ["de"]="", ["fr"]="" },
[UnitDefNames["cfusionplant"].id] = 	{["en"]="Core Mega Fusion Reactor", ["de"]="", ["fr"]="" },
[UnitDefNames["tllmegacoldfus"].id] = 	{["en"]="TLL Mega Fusion Reactor", ["de"]="", ["fr"]="" },

--Doomsday etc
[UnitDefNames["armanni"].id] = 	{["en"]="Tachyon", ["de"]="", ["fr"]="" },
[UnitDefNames["cordoom"].id] = 	{["en"]="Tachyon", ["de"]="", ["fr"]="" },
[UnitDefNames["armanni1"].id] = 	{["en"]="Adv. Tachyon", ["de"]="", ["fr"]="" },
[UnitDefNames["cordoom1"].id] = 	{["en"]="Adv. Doomsday", ["de"]="", ["fr"]="" },
[UnitDefNames["tllobliterator"].id] = 	{["en"]="Obliterator", ["de"]="", ["fr"]="" },
[UnitDefNames["tllrlrpc"].id] = 	{["en"]="The Barret", ["de"]="", ["fr"]="" },

--Anti Experimental Cannon 
[UnitDefNames["corboucher"].id] = 	{["en"]="Anti Experimental", ["de"]="", ["fr"]="" },
[UnitDefNames["nebraska"].id] = 	{["en"]="Anti Experimental", ["de"]="", ["fr"]="" },
[UnitDefNames["tlldmc"].id] = 	{["en"]="Anti Experimental", ["de"]="", ["fr"]="" },

--Plasma Cannons
[UnitDefNames["armbrtha"].id] = 	{["en"]="Bertha", ["de"]="", ["fr"]="" },
[UnitDefNames["corint"].id] = 	{["en"]="Intimidator", ["de"]="", ["fr"]="" },
[UnitDefNames["armbrtha1"].id] = 	{["en"]="T3 Bertha", ["de"]="", ["fr"]="" },
[UnitDefNames["corint1"].id] = 	{["en"]="T3 Intimidator", ["de"]="", ["fr"]="" },
[UnitDefNames["arm_big_bertha"].id] = 	{["en"]="EMP Bertha", ["de"]="", ["fr"]="" },
[UnitDefNames["core_intimidator"].id] = 	{["en"]="EMP Intimidator", ["de"]="", ["fr"]="" },
[UnitDefNames["armvulc"].id] = 	{["en"]="Vulcan", ["de"]="Schnellfeuer-Plasmakanone", ["fr"]="Cadence de Tir �lev� Plasma Canon" },
[UnitDefNames["corbuzz"].id] = 	{["en"]="Buzzsaw", ["de"]="Schnellfeuer-Plasmakanone", ["fr"]="Cadence de Tir �lev� Plasma Canon" },
[UnitDefNames["armvulc2"].id] = 	{["en"]="Rapid-Vulcan", ["de"]="", ["fr"]="" },
[UnitDefNames["corbuzz2"].id] = 	{["en"]="Rapid-Buzzsaw", ["de"]="", ["fr"]="" },
[UnitDefNames["armvulc1"].id] = 	{["en"]="T3 Vulcan", ["de"]="", ["fr"]="" },
[UnitDefNames["corbuzz1"].id] = 	{["en"]="T3 Buzzsaw", ["de"]="", ["fr"]="" },
[UnitDefNames["tlllrpt"].id] = 	{["en"]="LR Plasma", ["de"]="", ["fr"]="" },

--TSAR
[UnitDefNames["armtabi"].id] = 	{["en"]="TSAR Cannon", ["de"]="", ["fr"]="" },
[UnitDefNames["corflu"].id] = 	{["en"]="TSAR Cannon", ["de"]="", ["fr"]="" },
[UnitDefNames["tllvanya"].id] = 	{["en"]="TSAR Cannon", ["de"]="", ["fr"]="" },

--Shields
[UnitDefNames["armgate"].id] = 	{["en"]="T2 Shield", ["de"]="", ["fr"]="" },
[UnitDefNames["armgate1"].id] = 	{["en"]="Heavy Shield", ["de"]="", ["fr"]="" },
[UnitDefNames["armgate2"].id] = 	{["en"]="Small Shield", ["de"]="", ["fr"]="" },
[UnitDefNames["corgate"].id] = 	{["en"]="T2 Shield", ["de"]="", ["fr"]="" },
[UnitDefNames["corgate1"].id] = 	{["en"]="Heavy Shield", ["de"]="", ["fr"]="" },
[UnitDefNames["corgate2"].id] = 	{["en"]="Small Shield", ["de"]="", ["fr"]="" },
[UnitDefNames["tllgate"].id] = 	{["en"]="T2 Shield", ["de"]="", ["fr"]="" },
[UnitDefNames["tllgate1"].id] = 	{["en"]="Heavy Shield", ["de"]="", ["fr"]="" },
[UnitDefNames["tllgate2"].id] = 	{["en"]="Small Shield", ["de"]="", ["fr"]="" },

--Super Ships
[UnitDefNames["cdevastator"].id] = 	{["en"]="Holy Shit!", ["de"]="", ["fr"]="" },
[UnitDefNames["abroadside"].id] = 	{["en"]="Holy Shit!", ["de"]="", ["fr"]="" },
[UnitDefNames["tllvaliant"].id] = 	{["en"]="Holy Shit!", ["de"]="", ["fr"]="" },

--T3 AA
[UnitDefNames["corpre"].id] = 	{["en"]="T3 Anti-Air", ["de"]="", ["fr"]="" },
[UnitDefNames["tlldb"].id] = 	{["en"]="T3 Anti-Air", ["de"]="", ["fr"]="" },
[UnitDefNames["armhys"].id] = 	{["en"]="T3 Anti-Air", ["de"]="", ["fr"]="" },

--Moho Geos
[UnitDefNames["amgeo"].id] = 	{["en"]="Moho Geo", ["de"]="Moho Geo", ["fr"]="Moho G�o" },
[UnitDefNames["cmgeo"].id] = 	{["en"]="Moho Geo", ["de"]="Moho Geo", ["fr"]="Moho G�o" },
[UnitDefNames["tllmohogeo"].id] = 	{["en"]="Moho Geo", ["de"]="Moho Geo", ["fr"]="Moho G�o" },

--Don't mark mobile units
--[UnitDefNames["armbanth1"].id] = 	{["en"]="Holy Shit!", ["de"]="", ["fr"]="" },
--[UnitDefNames["corkrog1"].id] = 	{["en"]="Holy Shit!", ["de"]="", ["fr"]="" },
}

--END OF MARKER LIST---------------------------------------

local myLang = "en" -- --set this if you want to bypass lobby country
local myPlayerID
local curModID
local spEcho = Spring.Echo
local spMarkerAddPoint = Spring.MarkerAddPoint--(x,y,z,"text",local? (1 or 0))
local spMarkerErasePosition = Spring.MarkerErasePosition
local spGetUnitTeam = Spring.GetUnitTeam
local IsUnitAllied = Spring.IsUnitAllied
local spGetUnitDefID = Spring.GetUnitDefID
local spGetUnitPosition = Spring.GetUnitPosition
local spGetGameSeconds = Spring.GetGameSeconds
local spGetUnitHealth = Spring.GetUnitHealth
local spGetTeamColor	= Spring.GetTeamColor
local spSendCommands = Spring.SendCommands
local spGetSpectatingState = Spring.GetSpectatingState
local lastUpdate = 0
local addedMarksTable = {}
local addToTable = {}
local markTime = 0
local lastUpdate = 0
local prevX,prevY,prevZ = 0,0,0
local prevMarkX = {}
local prevMarkY = {}
local prevMarkZ = {}
local x,y,z = 0,0,0

local knownUnits = {} --all units that have been marked already, so they wont get marked again
local teamNames = {}

local function GetTeamName(teamID) --need to rewrite this sloppy functionality
  local name = teamNames[teamID]
  if (name) then
    return name
  end

  local teamNum, teamLeader = Spring.GetTeamInfo(teamID)
  if (teamLeader == nil) then
    return "Not sure what purpose this originally served" -- nor I -LEDZ -- I do but its effect is lost in time -Bluestone
  end

  name = Spring.GetPlayerInfo(teamLeader)
  teamNames[teamID] = name
  return name or "Gaia"
end

function widget:Initialize()

	myColour = colourNames(Spring.GetMyTeamID())
	markerLocal = nil --note: this name of this here and on the lua wiki is a misnomer
	curModID = string.upper(Game.modShortName or "")
	if ( unitList[curModID] == nil ) then
		spEcho("<Unit Marker> Unsupported Game, shutting down...")
		widgetHandler:RemoveWidget()
		return
	else	
		curUnitList = unitList[curModID] or {}
	end
	myLang = myLang or string.lower(select(8,Spring.GetPlayerInfo(Spring.GetMyPlayerID())))
end

function colourNames(teamID) 
	nameColourR,nameColourG,nameColourB,nameColourA = spGetTeamColor(teamID)
	R255 = math.floor(nameColourR*255)  --the first \255 is just a tag (not colour setting) no part can end with a zero due to engine limitation (C)
	G255 = math.floor(nameColourG*255)
	B255 = math.floor(nameColourB*255)
	if ( R255%10 == 0) then
		R255 = R255+1
	end
	if( G255%10 == 0) then
		G255 = G255+1
	end
	if ( B255%10 == 0) then
		B255 = B255+1
	end
  return "\255"..string.char(R255)..string.char(G255)..string.char(B255) --works thanks to zwzsg
end 

function widget:UnitEnteredLos(unitID, allyTeam)
	if ( IsUnitAllied( unitID ) ) then return end

	local udefID = spGetUnitDefID(unitID)
	local x, y, z = spGetUnitPosition(unitID)  --x and z on map floor, y is height
	
	if udefID and x then
	  if curUnitList[udefID] then
			prevX, prevY, prevZ = prevMarkX[unitID],prevMarkY[unitID],prevMarkZ[unitID]
			if prevX == nil then
				prevX, prevY, prevZ = 0,0,0
			end
			
			if (math.sqrt(math.pow((prevX - x), 2)+(math.pow((prevZ - z), 2)))) >= 100 then -- marker only really uses x and z
				markColour = colourNames(spGetUnitTeam(unitID))
				if UnitDefs[udefID].customParams.iscommander == "1" then
					markName = GetTeamName(spGetUnitTeam(unitID))
					colouredMarkName = markColour..markName
				else
					markName = curUnitList[udefID]
					markName = markName[myLang] or markName["en"]
					colouredMarkName = markColour..markName
				end
				spMarkerErasePosition(prevX,prevY,prevZ)
				spMarkerAddPoint(x,y,z,colouredMarkName,markerLocal)
				prevX, prevY, prevZ = x, y, z
				prevMarkX[unitID] = prevX
				prevMarkY[unitID] = prevY
				prevMarkZ[unitID] = prevZ
			end
	  end
	end
end
	

function widget:PlayerChanged(playerID)
  if Spring.GetSpectatingState() then
  	widgetHandler:RemoveWidget()
  end
end