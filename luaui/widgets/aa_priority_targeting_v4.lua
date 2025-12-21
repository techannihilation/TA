function widget:GetInfo()
    return {
        name      = "Air Priority Targeting",
        version   = "4.0",
        desc      = "Makes AA units target air units based on priority list with air raid detection",
        author    = "Mac675", -- added gui by [ur]uncle
        date      = "18.11.2025",
        license   = "GNU GPL v2",
        layer     = 0,
        enabled   = true
    }
end

-- Configuration
local UPDATE_FREQUENCY = 20 -- frames between updates
local RESCAN_INTERVAL = 30 -- frames between full rescans
local RESCAN_INTERVAL_ALERT = 10 -- frames between full rescans
local RESCAN_INTERVAL_NORMAL = 30 -- frames between full rescans
local SAMPLE_SIZE = 50 -- number of random units to check for movement
local MOVEMENT_THRESHOLD = 0.1 -- fraction that needs be near base to trigger aggressive targeting
local AIR_RAID_CHECK_INTERVAL = 60 -- frames between checks (1 second at 30fps)
local AIR_RAID_CHECK_INTERVAL_NORMAL  = 60 -- frames between  checks (1 second at 30fps)
local AIR_RAID_CHECK_INTERVAL_ALERT=60
local DIST_TO_BASE=9000          
-- Unit name tables for prioritization (higher number = higher priority)
local aa_names={
    --ARM
    "armflak",
    "armhys",
	"armrl",
	"armpack",
	"armcir",

	--kbot
	"armjeth",
	"armaak",
	"armeak",
	
	--spider
	"armhuntsman",
	
	--hover 
	"armah",
	"armiguana",
	
	--veh 
	"armsam",
	"armyork",
	"armeflak",
	
	--static missiles
	"armmercury",
	"arm_ucir",
	
	--CORE
	--static
	"corrl",
	"corsam",
	"corerad",
	"corflak",
	"corpre",
	"coruflak",
	
	--kbot
	"corcrash",
	"coraak",
	"coreak",
	
	--veh 
	"cormist",
	"corsent",
	"coramist",
	
	--tort
	"coraapod",
	
	--hover
	"corah",
	"corfrog",
	
	--air
	"corshock",--???
	
	--static missiles
	"corscreamer",
	
	--TLL
	--static
	"tlllmt",
	"tllsam",
	"tlltetanos",
	"tllflak",
	"tlluflak",
	
	--kbot
	"tllfirestarter",
	"tllaak",
	"tlldilophosaurus",
	
	--veh
	"tllhoplit",
	"tllpuncher",
	"tllmantis",
	
	--tort
	"tllloggerhead",
	
	--static missiles
	"tllhmt",
	
	--TALON
	
	--static
	"talon_rl",
	"talon_cir",
	"talon_popcorn",
	"talon_popcorn1",
	
	--kbot
	"talon_rebel",
	"talon_striker",
	"talon_eak",
	
	--t4 kbot
	"talon_javelin",
	
	--veh
	"talon_sheatiped",
	"talon_vanguard",
	"talon_expanse",
	
	--hover
	"talon_cataphract",
	"talon_hydra",
	
	
	--GOK
	--static
	"gok_rl",
	"gok_flak",	
	"gok_eflak",
	"gok_ucir",
	
	--kbot
	"gok_stung",
	"gok_harbinger",
	"gok_curred",
	
	--t4 kbot
	"gok_pandora",
	
	--veh
	"gok_earthstrike",
	"gok_pains",
	"gok_nahash",
	
	--static missiles
	"gok_ptr",
	
	
	--RUMAD
	--static
	"rumad_rl",
	
	"rumad_sam",
	"rumad_cir",
	"rumad_flak",
	"rumad_erl",
	"rumad_rlrpt",
	
	--kbot
	"rumad_ak",
	"rumad_aak",
	
	--kbot t4
	"rumad_uflak",
	
	
	--veh
	"rumad_pasta",
	"rumad_borer",
	"rumad_mflak",
	
	--static missiles
	"rumad_ptr"
	
}
local target_names = {
    -- ARM (higher number = higher priority)-ok
    {name = "armkam",     priority = 1},
    {name = "armatlas",   priority = 1},
    {name = "armthund",   priority = 1},
    {name = "armpnix",    priority = 2},

    {name = "armbrawl",    priority = 2},
    {name = "armcybr",    priority = 2},
    {name = "armgripn",  priority = 2},
    {name = "armlance",   priority = 2},
    {name = "armdfly",    priority = 2},

    {name = "armpers",    priority = 3},
    {name = "armmuat",    priority = 3},
    {name = "armorion",   priority = 3},
    {name = "armcyclone", priority = 3},

    {name = "armstratus", priority = 4},
    {name = "armlift", priority = 4},

    -- CORE
    {name = "corvalk",    priority = 1},
    {name = "corshad",    priority = 1},
    {name = "corarpe",      priority = 1},

    {name = "corcrw",     priority = 2},
    {name = "corape",     priority = 2},
    {name = "cortitan",     priority = 2},
    {name = "corseahook",     priority = 2},
    {name = "corhurc",    priority = 2},

    {name = "coraap",     priority = 3},
    {name = "cormuat",    priority = 3},
    {name = "corsbomb",   priority = 3},
    {name = "coreclipse", priority = 1000},
    {name = "corlift", priority = 4},
    {name = "corshock", priority = 4},



    -- TLL
    {name = "tlltplane",    priority = 1},
    {name = "tllbomber",    priority = 1},
    {name = "tll_wasp",      priority = 1},
    {name = "tllcopter",     priority = 2},
    {name = "tllabomber",    priority = 2},
    {name = "tlltorp",    priority = 2},
    {name = "tllrobber",    priority = 2},
    {name = "tllpterodactyl",    priority = 2},
    {name = "tllnuada",     priority = 3},
    {name = "tllbtrans",    priority = 3},
    {name = "tllanhur",   priority = 3},
    {name = "tllaether",   priority = 3},
    {name = "tllcondor",   priority = 1},

    -- TALON
    {name = "talon_wyvern",    priority = 1},
    {name = "talon_shade",    priority = 1},
    {name = "talon_trident",      priority = 2},
    {name = "talon_eclipse",     priority = 2},
    {name = "talon_vulture",    priority = 2},
    {name = "talon_rukh",    priority = 2},
    {name = "talon_ceddral",    priority = 2},
    {name = "talon_pampa",     priority = 3},
    {name = "talon_spirit",    priority = 3},
    {name = "talon_tau",   priority = 3},
    {name = "talon_handgod",   priority = 4},
    {name = "talon_plutor",   priority = 4},


     -- GOK
    {name = "gok_chariot",    priority = 1},
    {name = "gok_dirgesinger",    priority = 1},
    {name = "gok_specter",      priority = 2},
    {name = "gok_spook",     priority = 2},
    {name = "gok_hookah",    priority = 2},
    {name = "gok_revenant",    priority = 2},
    {name = "gok_wordbearer",    priority = 2},
    {name = "gok_nosferatu",    priority = 2},
    {name = "gok_benne",     priority = 3},
    {name = "gok_nurgle",    priority = 3},
    {name = "gok_dvergar",   priority = 3},


     -- RUMAD
    {name = "rumad_airtrans_lvl1",    priority = 1},
    {name = "rumad_gunship_lvl1",    priority = 1},
    {name = "rumad_bomber_lvl1",    priority = 1}, 
    {name = "rumad_airtrans_lvl2",    priority = 2},
    {name = "rumad_gunship_lvl2",    priority = 2},
    {name = "rumad_bomber_lvl2",    priority = 2},
    {name = "rumad_gunship_lvl3",    priority = 3},
    {name = "rumad_bomber_lvl3",    priority = 3},
    {name = "rumad_overlord",    priority = 4},

    {name = "halloween",    priority = 1},
    {name = "halloween1",    priority = 2},
    {name = "halloween2",    priority = 3},
    {name = "halloween3",    priority = 5},
}

-- Build priority lookup table
local nameToPriority = {}
for _, entry in ipairs(target_names) do
    nameToPriority[entry.name] = entry.priority
end

-- State
local aaUnits = {} -- our AA units 
local enemyAirUnitsByPriority = {} -- enemy air units organized by priority {[priority] = {unitID = {unitDefID, x, y, z}}}
local frameCount = 0
local lastFullScan = 0
local lastAirRaidCheck = 0
local myTeamID
local myAllyTeamID
local myStartPosX, myStartPosZ
local airRaidActive = false -- flag to trigger more aggressive targeting

-- Spring API locals for performance
local spGetTeamUnits = Spring.GetTeamUnits
local spGetUnitDefID = Spring.GetUnitDefID
local spGetUnitPosition = Spring.GetUnitPosition
local spValidUnitID = Spring.ValidUnitID
local spGetMyTeamID = Spring.GetMyTeamID
local spGetMyAllyTeamID = Spring.GetMyAllyTeamID
local spGetAllUnits = Spring.GetAllUnits
local spGetUnitWeaponState = Spring.GetUnitWeaponState
local spGiveOrderToUnit = Spring.GiveOrderToUnit
local spGetUnitAllyTeam = Spring.GetUnitAllyTeam
local spGetTeamStartPosition = Spring.GetTeamStartPosition
local spGetTeamList = Spring.GetTeamList
local spGetTeamInfo = Spring.GetTeamInfo
local spGetViewGeometry = Spring.GetViewGeometry
local spGetSpectatingState = Spring.GetSpectatingState
local spGetGameFrame = Spring.GetGameFrame
local spIsReplay = Spring.IsReplay

local glColor = gl.Color
local glRect = gl.Rect
local glText = gl.Text
local glGetTextWidth = gl.GetTextWidth
local glLineWidth = gl.LineWidth
local glDrawGroundCircle = gl.DrawGroundCircle
local glBeginEnd = gl.BeginEnd
local glVertex = gl.Vertex
local GL_LINE_STRIP = GL.LINE_STRIP
local GL_LINE_LOOP = GL.LINE_LOOP
local GL_LINES = GL.LINES
        
local CMD_ATTACK = CMD.ATTACK

local math_sqrt = math.sqrt
local math_max = math.max
local math_random = math.random
local math_sin = math.sin

local widgetEnabled = true
local desiredWidgetState = true
local widgetInitComplete = false
local SetWidgetState
local GUI_FONT_SIZE = 13
local GUI_PADDING = 20
local GUI_MIN_WIDTH = 180
local guiX, guiY = 980, 480
local guiW, guiH = GUI_MIN_WIDTH, 30
local dragging = false
local dragOffsetX, dragOffsetY = 0, 0
local vsx, vsy = 0, 0
local gameStarted = false

local function maybeRemoveSelf()
    if spGetSpectatingState() and (spGetGameFrame() > 0 or gameStarted) then
        widgetHandler:RemoveWidget()
    end
end

local function ClampGuiToScreen()
    if vsx <= 0 or vsy <= 0 then
        return
    end
    local maxX = math_max(0, vsx - guiW)
    local maxY = math_max(0, vsy - guiH)
    if guiX < 0 then
        guiX = 0
    elseif guiX > maxX then
        guiX = maxX
    end
    if guiY < 0 then
        guiY = 0
    elseif guiY > maxY then
        guiY = maxY
    end
end

local function UpdateGuiWidthForLabel(label)
    if not label or not glGetTextWidth then
        return
    end
    local textWidth = glGetTextWidth(label) or 0
    local desiredWidth = math_max(GUI_MIN_WIDTH, textWidth * GUI_FONT_SIZE + GUI_PADDING)
    if guiW ~= desiredWidth then
        guiW = desiredWidth
        ClampGuiToScreen()
    end
end

local aa_counter = 0 
-- Unit definitions cache
local unitDefCache = {}
local function DrawDiamond(x, y, z, radius)
    glBeginEnd(GL_LINE_LOOP, function()
        glVertex(x + radius, y, z)
        glVertex(x, y, z + radius)
        glVertex(x - radius, y, z)
        glVertex(x, y, z - radius)
    end)
end

local function DrawCrosshair(x, y, z, size, height)
    glBeginEnd(GL_LINES, function()
        glVertex(x - size, y + height, z)
        glVertex(x + size, y + height, z)
        glVertex(x, y + height, z - size)
        glVertex(x, y + height, z + size)
    end)
end

local function DrawFancyMarker(x, y, z, unitSeed)
    local pulsePhase = ((frameCount + unitSeed) % 90) / 90
    local ripplePhase = ((frameCount + unitSeed * 2) % 60) / 60

    local primaryRadius = 40 + 18 * pulsePhase
    local rippleRadius = primaryRadius + 10 + 16 * ripplePhase

    glLineWidth(2.4)
    glColor(0.05, 0.55, 0.95, 0.45 * (1 - pulsePhase) + 0.1)
    glDrawGroundCircle(x, y, z, primaryRadius, 16)

    glColor(0.05, 0.75, 0.95, 0.2 * (1 - ripplePhase))
    glDrawGroundCircle(x, y, z, rippleRadius, 24)
end

function widget:Initialize()
    if spIsReplay() or spGetGameFrame() > 0 then
        maybeRemoveSelf()
    end

    myTeamID = spGetMyTeamID()
    myAllyTeamID = spGetMyAllyTeamID()

    for _,name in ipairs(aa_names) do
        local found=false
        for unitDefID, unitDef in pairs(UnitDefs) do
            if name==unitDef.name then
				found=true
                break
            end
        end
        if not found then
            Spring.Echo("error aa name: "..name.." not found!")
        end
    end

	for _, entry in ipairs(target_names) do
        local found=false
        for unitDefID, unitDef in pairs(UnitDefs) do
            if entry.name==unitDef.name then
				found=true
                break
            end
        end
        if not found then
            Spring.Echo("error target name: "..entry.name.." not found!")
        end
    end

    -- Build unit def cache
    for unitDefID, unitDef in pairs(UnitDefs) do

        unitDefCache[unitDefID] = {
            isAA = false,
            isAir = unitDef.canFly,
            priority = nil,
            maxRange = 0
        }
        
        if unitDef.canFly then
            local name = unitDef.name:lower()
            
            -- Check if unit is in our target list
            local priority = nameToPriority[name]
            if priority then
                unitDefCache[unitDefID].priority = priority
            end
        end
        
        -- Check if unit is AA
        if find_name(unitDef.name:lower(),aa_names) then
            unitDefCache[unitDefID].isAA = true
            unitDefCache[unitDefID].maxRange=0
            --Spring.Echo("aa init: "..unitDef.name.."")
            for _, weapon in pairs(unitDef.weapons) do
                local weaponDef = WeaponDefs[weapon.weaponDef]
                if weaponDef then
                    unitDefCache[unitDefID].maxRange = math_max(
                        unitDefCache[unitDefID].maxRange,
                        weaponDef.range or 0
                    )
                end
            end
        end
    end
    
    -- Get start positions 
    myStartPosX, _, myStartPosZ = spGetTeamStartPosition(myTeamID)
    
    
    
    -- Initial scan
    ScanForUnits()
    lastFullScan = 0
    lastAirRaidCheck = 0

    local screenW, screenH = spGetViewGeometry()
    if screenW and screenH then
        vsx, vsy = screenW, screenH
        ClampGuiToScreen()
    end

    if not WG then
        WG = {}
    end
    WG.AAPriorityTargeting = {
        setState = function(active, fromExternal)
            SetWidgetState(active, fromExternal)
        end,
        getState = function()
            return widgetEnabled
        end
    }

    widgetInitComplete = true
    SetWidgetState(desiredWidgetState, true)

    if widgetEnabled and WG.SmartAirTarget and WG.SmartAirTarget.getState and WG.SmartAirTarget.getState() then
        SetWidgetState(false, true)
    end
end

function widget:GameStart()
    gameStarted = true
    maybeRemoveSelf()
end

function widget:PlayerChanged(playerID)
    maybeRemoveSelf()
end

function find_name(name, list_of_names) -- Renamed 'table' to 'list_of_names'
    for _, t in ipairs(list_of_names) do -- Correct Lua iteration
        if name == t then
            return true
        end
    end -- Closes the for loop
    return false
end -- Closes the function


function widget:UnitCreated(unitID, unitDefID, unitTeam)
    if unitTeam == myTeamID then
        if unitDefCache[unitDefID] and unitDefCache[unitDefID].isAA then
            aaUnits[unitID] = {
                unitDefID = unitDefID,
				target_id=-1,
				target_priority=-1
            }
            --Spring.Echo("aa added")
            aa_counter = aa_counter + 1
        end
    end
end

function widget:UnitDestroyed(unitID, unitDefID, unitTeam)
    aaUnits[unitID] = nil
    -- Remove from all priority tables
    for priority, units in pairs(enemyAirUnitsByPriority) do
        units[unitID] = nil
    end
end

function widget:UnitTaken(unitID, unitDefID, oldTeam, newTeam)
    if newTeam == myTeamID then
        if unitDefCache[unitDefID] and unitDefCache[unitDefID].isAA then
            aaUnits[unitID] = {
                unitDefID = unitDefID,
                target_id=-1,
				target_priority=-1
            }
        end
    else
        aaUnits[unitID] = nil
        -- Remove from all priority tables
        for priority, units in pairs(enemyAirUnitsByPriority) do
            units[unitID] = nil
        end
    end
end

function widget:UnitGiven(unitID, unitDefID, newTeam, oldTeam)
    widget:UnitTaken(unitID, unitDefID, oldTeam, newTeam)
end

function ScanForUnits()
    -- Scan for our AA units
    aaUnits = {}
    local teamUnits = spGetTeamUnits(myTeamID)
    for i = 1, #teamUnits do
        local unitID = teamUnits[i]
        local unitDefID = spGetUnitDefID(unitID)
        if unitDefCache[unitDefID] and unitDefCache[unitDefID].isAA then
            --Spring.Echo("added aa")
            aaUnits[unitID] = {
                unitDefID = unitDefID,
                target_id=-1,
				target_priority=-1
            }
        end
    end
    
    -- Scan for enemy air units and organize by priority
    enemyAirUnitsByPriority = {}
    local allUnits = spGetAllUnits()
    for i = 1, #allUnits do
        local unitID = allUnits[i]
        if spValidUnitID(unitID) then
            local unitAllyTeam = spGetUnitAllyTeam(unitID)
            if unitAllyTeam and unitAllyTeam ~= myAllyTeamID then
                local unitDefID = spGetUnitDefID(unitID)
                local cached = unitDefCache[unitDefID]
                -- Only track air units with a priority
                if cached and cached.isAir and cached.priority then
                    local x, y, z = spGetUnitPosition(unitID)
                    if x then
                        local priority = cached.priority
                        if not enemyAirUnitsByPriority[priority] then
                            enemyAirUnitsByPriority[priority] = {}
                        end
                        enemyAirUnitsByPriority[priority][unitID] = {
                            unitDefID = unitDefID,
                            x = x, y = y, z = z
                        }
                    end
                end
            end
        end
    end
end

local function EnableWidget()
    widgetEnabled = true
    ScanForUnits()
    lastFullScan = frameCount
    lastAirRaidCheck = frameCount
    airRaidActive = false
    AIR_RAID_CHECK_INTERVAL = AIR_RAID_CHECK_INTERVAL_NORMAL
    RESCAN_INTERVAL = RESCAN_INTERVAL_NORMAL
end

local function DisableWidget()
    widgetEnabled = false
    airRaidActive = false
    AIR_RAID_CHECK_INTERVAL = AIR_RAID_CHECK_INTERVAL_NORMAL
    RESCAN_INTERVAL = RESCAN_INTERVAL_NORMAL
end

SetWidgetState = function(shouldEnable, fromExternal)
    desiredWidgetState = shouldEnable and true or false
    local isExternal = fromExternal and true or false

    if shouldEnable then
        if not widgetEnabled then
            EnableWidget()
        end
        if not isExternal and WG and WG.SmartAirTarget and WG.SmartAirTarget.setState then
            WG.SmartAirTarget.setState(false, true)
        end
    else
        if widgetEnabled then
            DisableWidget()
        end
    end
end

-- Update enemy air unit positions
function UpdateEnemyAirPositions()
    for priority, units in pairs(enemyAirUnitsByPriority) do
        for unitID, data in pairs(units) do
            if spValidUnitID(unitID) then
                local x, y, z = spGetUnitPosition(unitID)
                if x then
                    data.x = x
                    data.y = y
                    data.z = z
                else
                    units[unitID] = nil
                end
            else
                units[unitID] = nil
            end
        end
    end
end

-- Check if enemy air units are near base using  random sampling
function CheckAirRaidMovement()
    -- Count total enemy air units
    local totalCount = 0
    local allEnemyUnits = {}
    for priority, units in pairs(enemyAirUnitsByPriority) do
        for unitID, data in pairs(units) do
            totalCount = totalCount + 1
            allEnemyUnits[totalCount] = {unitID = unitID, data = data}
        end
    end
    
    if totalCount == 0 then
        return false
    end
    -- Spring.Echo("planes detected")
    
    -- Determine sample size
    local sampleSize = math.min(SAMPLE_SIZE, totalCount)
    
    -- True random sampling using reservoir sampling algorithm
    local sampledUnits = {}
    for i = 1, totalCount do
        if i <= sampleSize then
            -- Fill reservoir
            sampledUnits[i] = allEnemyUnits[i]
        else
            -- Random replacement
            local j = math_random(1, i)
            if j <= sampleSize then
                sampledUnits[j] = allEnemyUnits[i]
            end
        end
    end
    
    -- Check how many are near base
    local crossedCount = 0
    for i = 1, sampleSize do
        local unit = sampledUnits[i]
        if unit and unit.data then
            local data = unit.data
            
           
            local toUnitX =myStartPosX- data.x
            local toUnitZ =myStartPosZ- data.z
            
            local dist=toUnitX*toUnitX+toUnitZ*toUnitZ
            
            if (dist) <DIST_TO_BASE*DIST_TO_BASE then
                crossedCount = crossedCount + 1
            end
        end
    end
    
    -- Trigger if more than threshold crossed
    local crossedFraction = crossedCount / sampleSize
    return crossedFraction >= MOVEMENT_THRESHOLD
end

function widget:GameFrame(n)
    frameCount = n
    if not widgetEnabled then
        return
    end
    
    -- Check for air raid periodically
    if frameCount - lastAirRaidCheck >= AIR_RAID_CHECK_INTERVAL then
        UpdateEnemyAirPositions()
        local wasActive = airRaidActive
        -- Spring.Echo("check raid")

        airRaidActive = CheckAirRaidMovement()
        
        if airRaidActive and not wasActive then
            AIR_RAID_CHECK_INTERVAL=AIR_RAID_CHECK_INTERVAL_ALERT
            RESCAN_INTERVAL=RESCAN_INTERVAL_ALERT
            Spring.Echo("AA Priority: Air raid detected! Aggressive targeting enabled.")
        elseif not airRaidActive and wasActive then
            AIR_RAID_CHECK_INTERVAL=AIR_RAID_CHECK_INTERVAL_NORMAL
            RESCAN_INTERVAL=RESCAN_INTERVAL_NORMAL
            Spring.Echo("AA Priority: Air raid subsided. Normal targeting resumed.")
        end
        
        lastAirRaidCheck = frameCount
    end
    
     -- Full rescan periodically
    if frameCount - lastFullScan >= RESCAN_INTERVAL then
        ScanForUnits()
        --Spring.Echo("scan ")

        lastFullScan = frameCount
        return
    end
    -- Update targeting - use faster update frequency during air raids
    if not airRaidActive then
        return
    end


    for unitID, aaData in pairs(aaUnits) do
        if spValidUnitID(unitID) then
                local x, y, z = spGetUnitPosition(unitID)
                if x then
                    local unitDef = unitDefCache[aaData.unitDefID]
                    local maxRange = unitDef.maxRange
                    
                    -- Check if weapon is reloaded
                    local _, reloaded = spGetUnitWeaponState(unitID, 1)
                    
                    if reloaded == nil or reloaded then
                        -- Find highest priority target in range
                        local targetFound = false
                        
                        -- Sort priorities in descending order (highest first)
                        local priorities = {}
                        for priority in pairs(enemyAirUnitsByPriority) do
                            table.insert(priorities, priority)
                        end
                        table.sort(priorities, function(a, b) return a > b end)
                        --check if old target is alive and in range
						
                                    
						
                        -- Check each priority level from highest to lowest
                        for _, priority in ipairs(priorities) do
                            local units = enemyAirUnitsByPriority[priority]
							old_target=false
							
							if spValidUnitID(aaData.target_id) then
								if aaData.target_priority>=priority then 
									local enemy=units[aaData.target_id]
									local enem_data=enemy.data
									local ex, ey, ez = enem_data.x, enem_data.y, enem_data.z
									local dx = ex - x
									local dy = ey - y
									local dz = ez - z
									
									-- Quick bounding box check first
                                    if dx < maxRange and dy < maxRange and dz < maxRange then
                                        local distSq = dx*dx + dy*dy + dz*dz
                                        local maxRangeSq = maxRange * maxRange
                                        
                                        if distSq <= maxRangeSq then
											old_target=true
                                            break
                                        end
                                    end
								end
							end
							
							--leave loop if old taregt alive and in range (and no higher prior)
							if old_target then
								break
							end
							
                            for enem_unitID, enem_data in pairs(units) do
                                if spValidUnitID(enem_unitID) then
                                    local ex, ey, ez = enem_data.x, enem_data.y, enem_data.z
                                    local dx = ex - x
                                    local dy = ey - y
                                    local dz = ez - z
                                    
                                    -- Quick bounding box check first
                                    if dx < maxRange and dy < maxRange and dz < maxRange then
                                        local distSq = dx*dx + dy*dy + dz*dz
                                        local maxRangeSq = maxRange * maxRange
                                        
                                        if distSq <= maxRangeSq then
                                            spGiveOrderToUnit(unitID, CMD_ATTACK, {enem_unitID}, {""})
                                            targetFound = true
                                            aaData.target = enem_unitID
                                            break
                                        end
                                    end
                                end
                            end
                            
                            -- Leave loop if target found
                            if targetFound then
                                break
                            end
                        end
                    end
                else
                    aaUnits[unitID] = nil
                end
        else
            aaUnits[unitID] = nil
        end
    end
end

function widget:DrawScreen()
    local label = widgetEnabled and "Priority Air Targeting: ON" or "Priority Air Targeting: OFF"
    if widgetEnabled and airRaidActive then
        label = label .. " (RAID)"
    end
    UpdateGuiWidthForLabel(label)
    glColor(0, 0, 0, 0.85)
    glRect(guiX - 1, guiY - 1, guiX + guiW + 1, guiY + guiH + 1)
    local r, g, b = 0.4, 0.1, 0.1
    if widgetEnabled then
        r, g, b = 0.05, 0.55, 0.95
    end
    glColor(r, g, b, 0.55)
    glRect(guiX, guiY, guiX + guiW, guiY + guiH)
    glColor(1, 1, 1, 0.9)
    local textY = guiY + (guiH - GUI_FONT_SIZE) * 0.5
    glText(label, guiX + 8, textY, GUI_FONT_SIZE, "on")
end

function widget:DrawWorld()
    if not widgetEnabled then
        return
    end
    for unitID in pairs(aaUnits) do
        if spValidUnitID(unitID) then
            local x, y, z = spGetUnitPosition(unitID)
            if x then
                DrawFancyMarker(x, y, z, unitID)
            end
        end
    end
    glLineWidth(1)
    glColor(1, 1, 1, 1)
end

function widget:MousePress(x, y, button)
    if x >= guiX and x <= guiX + guiW and y >= guiY and y <= guiY + guiH then
        if button == 2 then
            dragging = true
            dragOffsetX = x - guiX
            dragOffsetY = y - guiY
            return true
        elseif button == 1 then
            SetWidgetState(not widgetEnabled, false)
            return true
        end
    end
end

function widget:MouseMove(x, y, dx, dy, button)
    if dragging then
        guiX = x - dragOffsetX
        guiY = y - dragOffsetY
        ClampGuiToScreen()
        return true
    end
end

function widget:MouseRelease(x, y, button)
    if button == 2 and dragging then
        dragging = false
        return true
    end
end

function widget:ViewResize(newVsx, newVsy)
    vsx, vsy = newVsx, newVsy
    ClampGuiToScreen()
end

function widget:GetConfigData()
    return {
        guiX = guiX,
        guiY = guiY,
        widgetEnabled = widgetEnabled
    }
end

function widget:SetConfigData(data)
    if data.guiX then guiX = data.guiX end
    if data.guiY then guiY = data.guiY end
    if data.widgetEnabled == false then
        desiredWidgetState = false
        if widgetInitComplete then
            SetWidgetState(false, true)
        else
            DisableWidget()
        end
    elseif data.widgetEnabled == true then
        desiredWidgetState = true
        if widgetInitComplete then
            SetWidgetState(true, true)
        else
            widgetEnabled = true
        end
    end
    ClampGuiToScreen()
end

function widget:Shutdown()
    aaUnits = {}
    enemyAirUnitsByPriority = {}
    if WG then
        WG.AAPriorityTargeting = nil
    end
end
