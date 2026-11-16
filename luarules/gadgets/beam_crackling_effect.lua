function gadget:GetInfo()
  return {
    name    = "Beam Lightning Crackling Effect",
    desc    = "Spawns LightningCannon effect around beam or lightning weapon, looks animated",
    author   = "vjikholg",
    date    = "2025",
    license   = "GNU GPL v2 or later",
    layer   = 0,
    enabled = true,
  }
end

local spSpawnCEG = Spring.SpawnCEG
local spGetUnitsInSphere = Spring.GetUnitsInSphere
local spGetUnitDefID = Spring.GetUnitDefID
local spGetUnitPosition = Spring.GetUnitPosition
local spGetUnitWeaponVectors = Spring.GetUnitWeaponVectors
local spAddUnitDamage = Spring.AddUnitDamage
local spGetGameFrame = Spring.GetGameFrame
local spGetUnitTeam = Spring.GetUnitTeam
local spAreTeamsAllied = Spring.AreTeamsAllied
local spSpawnProjectile = Spring.SpawnProjectile
local cos, sin, random, ceil = math.cos, math.sin, math.random, math.ceil
local TWO_PI = 6.28318530718
local ARC_DISPLACEMENT = 2 -- dont spawn "Inside" the beam, want to spawn around it


local lightningEffectQueue = {}
local lightningRetriggerFrames = {}

if gadgetHandler:IsSyncedCode() then
-- BEGIN SYNCED --
    local lightningWeapon = {
      [WeaponDefNames['tlldmc_tlldmc'].id] = {weaponFx = WeaponDefNames["purple_lightning"].id, 
                                              rFrames = WeaponDefNames['tlldmc_tlldmc'].reload * 30, 
                                              width = WeaponDefNames['tlldmc_tlldmc'].visuals.thickness,
                                              beamframes = ceil(WeaponDefNames['tlldmc_tlldmc'].beamtime * 30), 
                                              num = 4} 
    }


    -- local function EchoTable(t, indent)
    --     indent = indent or ""
    --     for k, v in pairs(t) do
    --         if type(v) == "table" then
    --             Spring.Echo(indent .. tostring(k) .. " = {")
    --             EchoTable(v, indent .. "  ")
    --             Spring.Echo(indent .. "}")
    --         else
    --             Spring.Echo(indent .. tostring(k), v)
    --         end
    --     end
    -- end

    -- Spring.Echo("testing thickness:", WeaponDefNames['tlldmc_tlldmc'].visuals.thickness, WeaponDefNames['tlldmc_tlldmc'].reload)
    -- EchoTable(WeaponDefNames['tlldmc_tlldmc'], ",")

    local lightningWeaponID = {
        WeaponDefNames['tlldmc_tlldmc'].id,
    } 

    function gadget:Initialize()
        for wDefID, _ in pairs(lightningWeapon) do 
            Script.SetWatchWeapon(wDefID, true)
        end
    end

    local function GetWeaponNum(unitID, wantedWDefID)
        local unitDefID = spGetUnitDefID(unitID)
        -- Spring.Echo("unitDefID: ", unitDefID)
        for i, w in ipairs(UnitDefs[unitDefID].weapons) do
            -- Spring.Echo("echoing i, w", i, w)
            if (w.weaponDef == wantedWDefID) then
                return i
            end
        end
        return nil
    end
    -- queue frame times not position calculation - easy position update by frame 
    function gadget:ProjectileCreated(proID, proOwnerID, proWeaponDefID)
        -- Spring.Echo("Hit proj created")
        if (not lightningWeapon[proWeaponDefID]) then return end -- dont want to fire if not given weapon
        -- -Spring.Echo("passed LightningWeap Test")

        local weaponID = GetWeaponNum(proOwnerID,proWeaponDefID) -- grab the weapon where the proj is fired

        local targetType = Spring.GetUnitWeaponTarget(proOwnerID, weaponID) 
        
        if (targetType ~= 1 and targetType ~= 2) then return end -- not a position

        local curr_f = spGetGameFrame() 
        local weaponInfo = lightningWeapon[proWeaponDefID]

        if (not lightningRetriggerFrames[proOwnerID]) then -- dont retrigger in subseq proj
            lightningRetriggerFrames[proOwnerID] = 0
        end
        
        if (curr_f < lightningRetriggerFrames[proOwnerID]) then return end

        lightningRetriggerFrames[proOwnerID] = curr_f + weaponInfo.rFrames 
        -- makes sure this effect fires once per salvo
        -- stay under ~15-20 arcs per second, 1s = 30 frames so 2-4 arcs/frame with random lifetimes. 
        -- we'll also want to fire this *around* the beam not inside of it 
        -- pick random positions twice around beam weapon.width/2 + k, k is adjustable
        -- random() * 2_PI twice, use this to determine start & end "cood" of arcs via sine, cosine
        
        local width = weaponInfo.width or 1 -- fallback to 1 if nil
        local beamframes = weaponInfo.beamframes
        if (beamframes % 2 == 1) then beamframes = beamframes + 1 end -- round up in frames literally not noticeable avoids weird edge cases

        for i=1, beamframes/2 do 
            for k = 1, 2 do 
                local arcFrame = curr_f + 2*i -- arcing frame is current frame + 2i 
                local lightningInfo = {
                    proOwnerID = proOwnerID,
                    weaponID = weaponID,
                    weaponDefID = proWeaponDefID,
                    frame = arcFrame,           -- what frame its triggered on
                    fx = weaponInfo.weaponFx    -- what effect to use
                }                               -- dynamically determine coordiates of arc during spawntime
                lightningEffectQueue[#lightningEffectQueue + 1] = lightningInfo
            end
        end
    end

-- handle beamFX spawn here
    function gadget:GameFrame(f)
        local i = 1
        
        while (i <= #lightningEffectQueue) do 
            local lightningInfo = lightningEffectQueue[i]
            if (f >= lightningInfo.frame) then
                -- grab necessary spawning info
                local proOwnerID = lightningInfo.proOwnerID
                local weaponID = lightningInfo.weaponID
                local weaponDefID = lightningInfo.weaponDefID
                local width = lightningWeapon[weaponDefID] and lightningWeapon[weaponDefID].width or 1
                local dist = (width / 2) + ARC_DISPLACEMENT
                -- where on beam endpoints do i spawn start, endpoints 
                local startAngle = random() * TWO_PI
                local endAngle = random() * TWO_PI

                -- get position of where effect starts 
                local ux, uy, uz ,_ ,_ ,_ = spGetUnitWeaponVectors(proOwnerID, weaponID)

                -- get position of where effect ends 
                local tx, ty, tz
                local targetType, _, position = Spring.GetUnitWeaponTarget(proOwnerID, weaponID) 

                -- determine target type
                if (targetType == 1) then -- firing at unit
                    tx, ty, tz = spGetUnitPosition(position) 
                elseif (targetType == 2) then -- firing at ground
                    tx, ty, tz  = position[1], position[2], position[3] 
                end

                -- determines in a circle start/end coordinates
                local sx, sy, sz = ux + dist * cos(startAngle), uy + dist * sin(startAngle), uz
                local ex, ey, ez = tx + dist * cos(endAngle), ty + dist * sin(endAngle), tz
                
                local projInfo = {
                    ['pos'] = {sx, sy, sz}, 
                    ['end'] = {ex, ey, ez},
                    ['ttl'] = 10,
                }

                spSpawnProjectile(lightningInfo.fx, projInfo)
                lightningEffectQueue[i] = lightningEffectQueue[#lightningEffectQueue]
                lightningEffectQueue[#lightningEffectQueue] = nil
            else
                i = i + 1
            end
        end
    end

    function gadget:UnitDestroyed(unitID, unitDefID, unitTeam, attackerID, attackerDefID, attackerTeam) -- on unit destroy midfire, we clear queue.
        if (not lightningWeapon[unitDefID]) then return end 
        local i = 1
        while (i < #lightningEffectQueue) do
            if (lightningEffectQueue[i].proOwnerID == unitID) then
                lightningEffectQueue[i] = lightningEffectQueue[#lightningEffectQueue]
                lightningEffectQueue[#lightningEffectQueue] = nil
            end
        end

    end
--  END  SYNCED -- 
else
-- BEGIN UNSYNCED --


-- END  UNSYNCED  --
end
