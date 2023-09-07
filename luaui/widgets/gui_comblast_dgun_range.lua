function widget:GetInfo()
    return {
        name      = "Comblast & Dgun Range",
        desc      = "Shows the range of commander death explosion and dgun ranges",
        author    = "Bluestone, based on similar widgets by vbs, tfc, decay",
        date      = "11/2013",
        license   = "GPL v3 or later",
        layer     = 0,
        enabled   = true  -- loaded by default
    }
end

-- locals --

local pairs                 = pairs
local sqrt                  = math.sqrt
local min                   = math.min
local max                   = math.max

local spGetUnitPosition     = Spring.GetUnitPosition
local spGetUnitDefID 		= Spring.GetUnitDefID
local spGetAllUnits			= Spring.GetAllUnits
local spGetSpectatingState 	= Spring.GetSpectatingState
local spGetMyPlayerID		= Spring.GetMyPlayerID
local spGetPlayerInfo		= Spring.GetPlayerInfo
local spGetGroundHeight		= Spring.GetGroundHeight
local spIsSphereInView		= Spring.IsSphereInView
local spValidUnitID			= Spring.ValidUnitID
local spIsGUIHidden         = Spring.IsGUIHidden
local spGetUnitNearestEnemy = Spring.GetUnitNearestEnemy
local spGetUnitPosition     = Spring.GetUnitPosition
local spIsUnitSelected      = Spring.IsUnitSelected
local spAreTeamAllied       = Spring.AreTeamsAllied

local glDepthTest 			= gl.DepthTest
local glDrawGroundCircle 	= gl.DrawGroundCircle
local glColor				= gl.Color
local GL_ALWAYS				= GL.ALWAYS
local glBeginEnd			= gl.BeginEnd

local circleDivs = 32
--local blastRadius = 360 -- com explosion

local comCenters = {}
local drawnComs = {}
local drawList
local amSpec = false
local inSpecFullView = false

local myTeamID = Spring.GetMyTeamID()

function widget:PlayerChanged()
    myTeamID = Spring.GetMyTeamID()
end

local TooHigh = true
local HighPing = false
local FPSCount = Spring.GetFPS()
local FPSLimit = 8

local isCommander = {}
-- track coms --

function widget:Initialize()
	for i=1,#UnitDefs do
    	local unitDefID = UnitDefs[i]
  		if unitDefID.customParams.iscommander and not UnitDefNames["rumad_com"].id then
  			local DgunRange = WeaponDefs[UnitDefs[i].weapons[3].weaponDef].range+ 2*WeaponDefs[UnitDefs[i].weapons[3].weaponDef].damageAreaOfEffect
			local deathBlasId = WeaponDefNames[string.lower(UnitDefs[i]["deathExplosion"])].id
			local blastRadius = WeaponDefs[deathBlasId].damageAreaOfEffect
			isCommander[i] = {dgunrange = DgunRange, deathblasid = deathBlasId, blastradius = blastRadius}
    	end
    end

    widgetHandler:RegisterGlobal('SetOpacity_Comblast_DGun_Range', SetOpacity)
    widgetHandler:RegisterGlobal('DrawManager_combblast', DrawStatus)

    checkComs()
    checkSpecView()
    return true
end

function DrawStatus(toohigh,fps,ping)
    HighPing = ping
    TooHigh = toohigh
end

function addCom(unitID, unitDefID, unitTeam)
    if not spValidUnitID(unitID) then return end --because units can be created AND destroyed on the same frame, in which case luaui thinks they are destroyed before they are created
    local x,y,z = Spring.GetUnitPosition(unitID)
    local teamID = unitTeam
    if not teamID then
    	teamID = Spring.GetUnitTeam(unitID)
    end
    if x and teamID then
        comCenters[unitID] = {x=x,y=y,z=z,draw=false,opacity=0,teamID=teamID,dgunRange=isCommander[unitDefID].dgunrange,blastRadius=isCommander[unitDefID].blastradius}
    end
end

function removeCom(unitID)
    comCenters[unitID] = nil
    drawnComs[unitID] = nil
end

function widget:UnitFinished(unitID, unitDefID, unitTeam)
    if isCommander[unitDefID] then
        addCom(unitID, unitDefID, unitTeam)
    end
end

function widget:UnitCreated(unitID, unitDefID, teamID, builderID)
    if isCommander[unitDefID] then
        addCom(unitID, unitDefID, teamID)
    end
end

function widget:UnitTaken(unitID, unitDefID, unitTeam, newTeam)
    if isCommander[unitDefID] then
    	--Spring.Echo(unitTeam, newTeam,Spring.GetUnitTeam(unitID))
        addCom(unitID, unitDefID, newTeam)
    end
end


function widget:UnitGiven(unitID, unitDefID, unitTeam, oldTeam)
    if isCommander[unitDefID] then
    	--Spring.Echo(unitTeam, newTeam,Spring.GetUnitTeam(unitID))
        addCom(unitID, unitDefID, unitTeam)
    end
end

function widget:UnitDestroyed(unitID, unitDefID, unitTeam)
    if comCenters[unitID] then
        removeCom(unitID)
    end
end

function widget:UnitEnteredLos(unitID, unitTeam)
    if not amSpec then
        local unitDefID = spGetUnitDefID(unitID)
        if isCommander[unitDefID] then
            addCom(unitID, unitDefID, teamID)
        end
    end
end

function widget:UnitLeftLos(unitID, unitDefID, unitTeam)
    if not amSpec then
        if comCenters[unitID] then
            removeCom(unitID)
        end
    end
end

function widget:PlayerChanged(playerID)
    checkSpecView()
    return true
end

function widget:GameOver()
    widgetHandler:DeregisterGlobal('SetOpacity_Comblast_DGun_Range', SetOpacity)
    widgetHandler:DeregisterGlobal('DrawManager_combblast', DrawStatus)
    widgetHandler:RemoveWidget(self)
end

function checkSpecView()
    --check if we became a spec
    local _,_,spec,_ = spGetPlayerInfo(spGetMyPlayerID())
    if spec ~= amSpec then
        amSpec = spec
        checkComs()
    end
end

function checkComs()
    --remake list of coms
    for k,_ in pairs(comCenters) do
        comCenters[k] = nil
    end

    local visibleUnits = spGetAllUnits()
    if visibleUnits ~= nil then
        for _, unitID in ipairs(visibleUnits) do
            local unitDefID = spGetUnitDefID(unitID)
            if unitDefID and isCommander[unitDefID] then
                addCom(unitID,unitDefID,teamID)
            end
        end
    end
end


-- draw --

-- map out what to draw
function widget:GameFrame(n)
   if spIsGUIHidden() or HighPing or TooHigh then return end
    -- check if we are in spec full view
    local spec,specFullView,_ = spGetSpectatingState()
    if specFullView ~= inSpecFullView then
        checkComs()
        inSpecFullView = specFullView
    end

    -- check com movement
    for unitID,_ in pairs(comCenters) do
        local x,y,z = spGetUnitPosition(unitID)
        if x then
            local yg = spGetGroundHeight(x,z)
            local draw = true
            local opacity
            local wantedOpacity
            -- show if (1) unit is selected (2) com is enemy and we are not a spec (3) com has an enemy unit nearby

            local enemyUnitID = spGetUnitNearestEnemy(unitID,2*comCenters[unitID].blastRadius,false)
            if spIsUnitSelected(unitID) or (not spec and not spAreTeamAllied(myTeamID,comCenters[unitID].teamID)) then
                wantedOpacity = 0.8
            elseif enemyUnitID then
                local ex,ey,ez = spGetUnitPosition(enemyUnitID)
                local distance = sqrt((x-ex)^2 + (y-ey)^2 + (z-ez)^2)
                wantedOpacity = 0.8 - 0.8*max(distance-comCenters[unitID].blastRadius,0)/comCenters[unitID].blastRadius
            else
                wantedOpacity = 0
            end
            opacity = comCenters[unitID].opacity*(29/30) + wantedOpacity*(1/30) --change gently
            -- check if com is off the ground
            if (y-yg>10) or (not spIsSphereInView(x,y,z,blastRadius)) then
                draw = false
                drawnComs[unitID] = nil
            end
            comCenters[unitID].x = x
            comCenters[unitID].y = y
            comCenters[unitID].z = z
            comCenters[unitID].draw = draw
            comCenters[unitID].opacity = opacity
            drawnComs[unitID] = comCenters[unitID]
        else
            --couldn't get position, check if its still a unit
            if not spValidUnitID(unitID) then
                removeCom(unitID)
            end
        end
    end
end

-- opacity control
local darkOpacity = 0
local lightOpacity = 0

function SetOpacity(dark, light)
    darkOpacity = dark
    lightOpacity = light
end

-- draw circles

function widget:DrawWorldPreUnit()
	if spIsGUIHidden() or HighPing or TooHigh then return end
    glDepthTest(true)
    for _,center in pairs(drawnComs) do
    	--comCenters[unitID] = {x=x,y=y,z=z,draw=false,opacity=0,teamID=teamID,dgunRange=isCommander[unitDefID].dgunrange,blastRadius=isCommander[unitDefID].blastradius}
        if center.draw then
            glColor(1, 0.8, 0, min(center.opacity,lightOpacity))
            glDrawGroundCircle(center.x, center.y, center.z, center.dgunRange, circleDivs)
            glColor(1, 0, 0, min(center.opacity,darkOpacity))
            glDrawGroundCircle(center.x, center.y, center.z, center.blastRadius, circleDivs)
        end
    end
    glDepthTest(false)
end
