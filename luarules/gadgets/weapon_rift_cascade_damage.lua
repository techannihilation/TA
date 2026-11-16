function gadget:GetInfo()
  return {
    name    = "Rift Cascade Damage",
    desc    = "Spawns damaging explosions on units around weapon impact site",
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
local spAddUnitDamage = Spring.AddUnitDamage
local spGetGameFrame = Spring.GetGameFrame
local spGetUnitTeam = Spring.GetUnitTeam
local spAreTeamsAllied = Spring.AreTeamsAllied
local spSpawnProjectile = Spring.SpawnProjectile
local cos, sin, random = math.cos, math.sin, math.random
local TWO_PI = 6.28318530718

local pendingExplosions = {} -- frame, x, y, z, attackerID, defenderID 
local pendingLightning = {}
local EXPLODE_DELAY = 15
local LIGHTNING_LEAD = 5
local PURPLE_LIGHTNING_ID = WeaponDefNames["purple_lightning"].id

if gadgetHandler:IsSyncedCode() then
-- SYNCED

    --- @param explodedmg integer 
    --- @param explodenum integer
    --- @param rFrames integer
    -- rFrames = 30 * reload time of weapon in seconds, so how many frames it takes to reload weapon
    local riftWeapons = {
      [WeaponDefNames['tlldmc_tlldmc'].id] = {explodedmg = 500, explodenum = 2, rFrames = WeaponDefNames['tlldmc_tlldmc'].reload * 30} 
    }

    local riftWeaponReloadCache = {
        [WeaponDefNames['tlldmc_tlldmc'].id] = 0,
    }

    local riftWeaponsIDs = {
        WeaponDefNames['tlldmc_tlldmc'].id
    }


    function gadget:Initialize()
        for _, wID in ipairs(riftWeaponsIDs) do 
            Script.SetWatchWeapon(wID, true)
        end
        Spring.Echo("Purple Lightning: ", PURPLE_LIGHTNING_ID)
    end

    function gadget:UnitDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponDefID, projectileID, attackerID, attackerDefID, attackerTeam ) -- rift opening script
        -- Spring.Echo("weaponDefID for RiftCascade check: ", weaponDefID)
        if unitTeam == attackerTeam then return end
        local now = spGetGameFrame()
        
        
        if (riftWeapons[weaponDefID]) then 
            -- Spring.Echo("rift cascade triggered on unit", unitID)
            -- impact point = unit centre 
            local px, py, pz = spGetUnitPosition(unitID)
            local riftInfo = riftWeapons[weaponDefID]
            local explodenum = riftInfo.explodenum
            local lastExp = nil -- remember last explosion


            for i=1, explodenum do -- spawn 6 explosions around epicenter 
                local angle = random() * TWO_PI -- 2pi
                local dist = random(0, 200)
                local ex = px + dist * cos(angle)
                local ey = py
                local ez = pz + dist * sin(angle)
                local eFrame = now + EXPLODE_DELAY

                spSpawnCEG("purple_explosion", ex, ey, ez)   
                -- 2a. queue explosions
                local expInfo = {
                    frame = now + 10, 
                    x = ex, 
                    y = py, 
                    z = ez,
                    aID = attackerID,
                    aTeam = attackerTeam,
                    uTeam = unitTeam,
                    wID = weaponDefID, 
                    damage = damage
                }

                pendingExplosions[#pendingExplosions + 1] = expInfo

                -- 2b. queue "rift lightning"
                if (lastExp) then
                    local lightningInfo = {
                        aID = attackerID, 
                        aTeam = attackerTeam, 
                        wID = weaponDefID,
                        frame = eFrame - LIGHTNING_LEAD, 
                        sx = lastExp.x, sy = lasyExp.y, sz = lastExp.z, -- location of *last* explosion
                        dx = ex, dy = ey, dz = ez                       -- location of *curr* explosion
                    }
                    pendingLightning[#pendingLightning + 1] = lightningInfo

                lastExp = expInfo -- so for next explosion, we look at the explosion we just made
                end 
            end
        end
    end

    -- 3. now we handle explosion damage + lightning
    function gadget:GameFrame(f) 
        local i = 1

        -- 3a handle lightning per frame 
        while (i <= #pendingLightning) do 
            local lightningInfo = pendingLightning[i]
            if (f >= lightningInfo.frame) then 
                Spring.Echo("triggered lightning:", i)
                local projInfo = {
                    pos = {lightningInfo.sx, lightningInfo.sy, lightningInfo.sz},
                    ['end'] = {lightningInfo.dx, lightningInfo.dy, lightningInfo.dz},
                    owner = lightningInfo.aID,
                    team = lightningInfo.aTeam, 
                    ttl = 20,
                }

                spSpawnProjectile(PURPLE_LIGHTNING_ID, projInfo)
                pendingLightning[i] = pendingLightning[#pendingLightning]
                pendingLightning[#pendingLightning] = nil
            else
                i = i + 1
            end
        end
    

    i = 1
        while (i <= #pendingExplosions) do
            Spring.Echo("triggered explosion:", i)
            local rift = pendingExplosions[i]
            local riftInfo = riftWeapons[rift.wID]

            if f >= rift.frame then 
                -- primary CEG
                spSpawnCEG("purple_explosion", rift.x, rift.y, rift.z)

                local localUnits = spGetUnitsInSphere(rift.x, rift.y, rift.z, 1000)
                if (localUnits) then
                    for _,nearUnit in ipairs(localUnits) do
                        if (not spAreTeamsAllied(rift.aTeam, spGetUnitTeam(nearUnit))) then 
                            local nx, ny, nz = spGetUnitPosition(nearUnit)
                            for j = 1, riftInfo.explodenum do 
                                local n_angle = random() * TWO_PI
                                local n_dist = random (0,60)
                                local exp_x = nx + n_dist*cos(n_angle)
                                local exp_z = nz + n_dist*sin(n_angle)
                                spSpawnCEG("purple_explosion", exp_x, ny, exp_y)
                                spAddUnitDamage(nearUnit, riftInfo.explodedmg, 0, riftInfo.attackerID, -1)
                            end
                        end
                    end
                end
                pendingExplosions[i] = pendingExplosions[#pendingExplosions]
                pendingExplosions[#pendingExplosions] = nil
            else
                i = i + 1
            end
        end
    end

-- END UNSYNCED -- 
else
-- UNSYNCED
  -- no unsynced part
end
