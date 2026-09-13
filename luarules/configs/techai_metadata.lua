-- Runtime UnitDefs metadata for TechAI. Source filenames are historical and
-- often disagree with the tier shown to players (shipyardlvl3 is a T5 yard).
local Metadata = {}
local min, max = math.min, math.max

local factoryTiers = {
    ashipyardlvl3=5, cshipyardlvl4=5, tllshipyardlvl3=5,
    gok_yard=5, rumad_yard=5, talon_covertopscentre=5,
    arm_ulab=4, core_ulab=4, tll_ulab=4, gok_ulab=4, rumad_ulab=4, talon_ulab=4,
    armusy=4, corusy=4, tllusy=4, gok_usy=4, talon_usy=4,
    arm_elab=3, corgant=3, tll_elab=3, gok_elab=3, rumad_elab=3, talon_elab=3,
}
local specialTiers = {armarch=6, talon_independence=6, gok_squid=6, core_core=6}

local function number(value, fallback)
    return tonumber(value) or fallback or 0
end

local function declaredTier(udef)
    local cp = udef.customParams or {}
    local explicit = tonumber(cp.techlevel or cp.tech_level or cp.tier)
    if explicit and explicit >= 1 and explicit <= 6 then return math.floor(explicit) end
    for _, value in ipairs({udef.tooltip or udef.description or '', udef.humanName or ''}) do
        local text = tostring(value):lower()
        local tier = text:match('tech%s*level%s*([1-6])%f[%D]')
            or text:match('%f[%w]t([1-6])%f[%W]')
        if tier then return tonumber(tier) end
    end
end

local function targetSet(mount, weapon)
    local targets = mount.onlyTargets or mount.onlyTargetCategory or mount.onlytargetcategory
        or weapon.onlyTargetCategory
    if type(targets) == 'string' then
        local set = {}
        for word in targets:lower():gmatch('%S+') do set[word] = true end
        return set
    elseif type(targets) == 'table' then
        local set = {}
        for key, value in pairs(targets) do
            if value then set[tostring(key):lower()] = true end
        end
        return set
    end
end

local function weaponStats(udef, meta, weaponDefs)
    meta.canAttackAir, meta.canAttackGround, meta.isArmed = false, false, false
    meta.maxRange, meta.areaOfEffect = 0, 0
    meta.antiAir, meta.antiGround = 0, 0
    for _, mount in pairs(udef.weapons or {}) do
        local weapon = weaponDefs[mount.weaponDef] or {}
        local kind = tostring(weapon.type or weapon.weaponType or ''):lower()
        -- Shield range and strategic interception radius are not attack range.
        if not weapon.isShield and kind ~= 'shield' and number(weapon.interceptor) == 0 then
            local damage = weapon.damages or weapon.damage or {}
            local defaultDamage = number(damage[0], number(damage.default))
            local maxDamage = defaultDamage
            for _, value in pairs(damage) do
                if type(value) == 'number' then maxDamage = max(maxDamage, value) end
            end
            -- Some stripped engine fixtures omit damages. A non-shield weapon
            -- still denotes an armed unit; real engines expose its damage table.
            if maxDamage > 0 or next(damage) == nil then
                local targets = targetSet(mount, weapon)
                local unrestricted = not targets or next(targets) == nil or targets.all
                local air = unrestricted or targets.vtol or targets.air or targets.fighter or targets.satellite
                local ground = unrestricted or targets.surface or targets.underwater or targets.ground or targets.ship or targets.sub
                if weapon.canAttackGround == false then ground = false end
                if weapon.canAttackAir == false then air = false end
                if weapon.canAttackAir == true then air = true end
                -- Unknown custom categories may target combat ground units.
                if not air and not ground and targets and next(targets) then ground = true end
                local reload = max(0.1, number(weapon.reload, number(weapon.reloadTime, 1)))
                local dps = max(1, defaultDamage, maxDamage * 0.25)
                    * max(1, number(weapon.salvoSize, number(weapon.burst, 1))) / reload
                meta.canAttackAir = meta.canAttackAir or not not air
                meta.canAttackGround = meta.canAttackGround or not not ground
                meta.isArmed = true
                meta.maxRange = max(meta.maxRange, number(weapon.range))
                meta.areaOfEffect = max(meta.areaOfEffect, number(weapon.damageAreaOfEffect, number(weapon.areaOfEffect)))
                if air then meta.antiAir = meta.antiAir + dps end
                if ground then meta.antiGround = meta.antiGround + dps end
            end
        end
    end
end

function Metadata.Enrich(defID, udef, meta, weaponDefs, makerDefs)
    local name = tostring(udef.name or ''):lower()
    local tier = declaredTier(udef) or specialTiers[name]
    if udef.isFactory then tier = factoryTiers[name] or tier end
    if not tier then
        local nano = name:match('nanotc([1-4])$')
        if nano then tier = tonumber(nano) + 1 end
    end
    meta.tech = min(udef.isFactory and 5 or 6, max(1, tier or number(meta.tech, 1)))
    meta.metalCost = number(udef.metalCost, number(meta.metalCost))
    meta.energyCost = number(udef.energyCost)
    meta.buildTime = max(1, number(udef.buildTime, 1))
    meta.buildSpeed = number(udef.buildSpeed)
    meta.health = number(udef.health, number(udef.maxHealth, 1))
    meta.speed = number(udef.speed)
    meta.isWater = number(udef.minWaterDepth) > 0
    meta.canFly = not not udef.canFly
    weaponStats(udef, meta, weaponDefs or {})

    local game = Game or {}
    local wind = number(udef.windGenerator)
    local tidal = number(udef.tidalGenerator)
    local averageWind = (number(game.windMin, 5) + number(game.windMax, 15)) * 0.5
    meta.energyOutput = max(0, number(udef.energyMake) - number(udef.energyUpkeep))
    if wind > 0 then meta.energyOutput = meta.energyOutput + min(wind, averageWind) end
    if tidal > 0 then meta.energyOutput = meta.energyOutput + tidal * number(game.tidal, 1) end
    meta.converterDrain, meta.metalOutput = 0, number(udef.metalMake)
    local conversion = makerDefs and makerDefs[defID]
    if conversion then
        meta.converterDrain = number(conversion.c)
        meta.metalOutput = meta.converterDrain * number(conversion.e)
        meta.conversionEfficiency = number(conversion.e)
        meta.role = 'converter'
    end
    if not conversion and meta.role == 'converter' then
        local cp = udef.customParams or {}
        meta.converterDrain = number(cp.energy_conversion_capacity, number(udef.energyUpkeep))
        meta.conversionEfficiency = number(cp.energy_conversion, 0.01)
        meta.metalOutput = max(meta.metalOutput, meta.converterDrain * meta.conversionEfficiency)
    end
    if meta.role == 'combat' or meta.role == 'raider' or meta.role == 'artillery' or meta.role == 'aa' or meta.role == 'scout' then
        if meta.isArmed then
            if meta.canAttackAir and not meta.canAttackGround then meta.role = 'aa'
            elseif meta.maxRange >= 650 and not udef.canFly then meta.role = 'artillery'
            elseif meta.role == 'aa' or meta.role == 'scout' then meta.role = 'combat' end
        end
    end
    return meta
end

return Metadata
