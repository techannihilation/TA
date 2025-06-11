-- luarules/gadgets/mo_preventcombomb.lua

function gadget:GetInfo()
    return {
        name      = "mo_preventcombomb",
        desc      = "Makes commanders survive their own blast / DGun and punishes abusers",
        author    = "TheFatController, Silver",
        date      = "2025‑06‑11",
        license   = "GPLv2 or later",
        layer     = 0,
        enabled   = true,
    }
end

--------------------------------------------------------------------------------
--  Synced‑only gadget (needs to touch health & MoveCtrl)
--------------------------------------------------------------------------------

if not gadgetHandler:IsSyncedCode() then
    return  -- unsynced portion not required
end

local math               = math
local spEcho             = Spring.Echo
local spGetModOptions    = Spring.GetModOptions
local spGetUnitHealth    = Spring.GetUnitHealth
local spGetUnitDefID     = Spring.GetUnitDefID
local spDestroyUnit      = Spring.DestroyUnit
local spGetProjectileOwnerID = Spring.GetProjectileOwnerID
local spGetGameFrame     = Spring.GetGameFrame
local spMoveCtrlEnable   = Spring.MoveCtrl.Enable
local spMoveCtrlDisable  = Spring.MoveCtrl.Disable
local spMoveCtrlSetPos   = Spring.MoveCtrl.SetPosition
local spMoveCtrlSetVel   = Spring.MoveCtrl.SetVelocity
local spMoveCtrlSetRelPos = Spring.MoveCtrl.SetRelativeVelocity
local spAreTeamsAllied   = Spring.AreTeamsAllied

--------------------------------------------------------------------------------
--  Configuration (mod‑options & constants)
--------------------------------------------------------------------------------

local MODOPT = (spGetModOptions() or {}).mo_preventcombomb or "off"

if MODOPT == "off" then
    spEcho("[mo_preventcombomb] Disabled via mod‑option.")
    gadgetHandler:RemoveGadget(self)
    return
end

-- Mode flags
local IS_MODE_1V1 = MODOPT == "1v1"
local IS_MODE_HP  = MODOPT == "hp"  -- also true for 1v1 (inherits HP capping)

--------------------------------------------------------------------------------
--  Look‑up tables for weapons & commander defs
--------------------------------------------------------------------------------

local blastWeapons = {}  -- commander_blast weapons
local dgunWeapons  = {}  -- disintegrator weapons

for wdid, wd in pairs(WeaponDefs) do
    if wd.customParams and wd.customParams.stats_is_plane then
        -- skip plane bombs (some mods call them *blast*)
    end
    local wname = wd.name:lower()
    if wname:find("commander_blast", 1, true) then
        blastWeapons[wdid] = true
        spEcho("[mo_preventcombomb] Commander‑blast weapon detected: " .. wname .. " (id " .. wdid .. ")")
    elseif wname:find("disintegrator", 1, true) then
        dgunWeapons[wdid] = true
        spEcho("[mo_preventcombomb] DGun weapon detected: " .. wname .. " (id " .. wdid .. ")")
    end
end

-- Commander definitions
local COMMANDERS = VFS.Include("luarules/configs/comDefIDs.lua") or {}

--------------------------------------------------------------------------------
--  State tracking tables
--------------------------------------------------------------------------------

local cantFall   = {}  -- [unitID] = expireFrame (ignore negative weapon‑ID dmg)
local moveLock   = {}  -- [unitID] = expireFrame (MoveCtrl lock after blast)
local dgunImmune = {}  -- [unitID] = expireFrame (ignore repeat DGun damage)

local CANT_FALL_FRAMES = 220
local MOVE_LOCK_FRAMES = 30
local DGUN_IMMUNE_FRAMES = 10   -- frames of immunity to chained DGun hits

--------------------------------------------------------------------------------
--  Utility helpers
--------------------------------------------------------------------------------

local function IsCommander(defID)
    return COMMANDERS[defID]
end

local function CapDamage(unitID, hp, raw)
    -- Cap damage so commander always survives with ~200hp left
    local capHP   = hp * 0.33
    local capFlat = hp - 200 - math.random(1, 10)
    local capped  = math.min(raw, capHP, capFlat)
    return math.max(0, capped)
end

local function LockUnit(unitID, frame)
    if moveLock[unitID] then return end
    local x, y, z = Spring.GetUnitPosition(unitID)
    if not x then return end
    spMoveCtrlEnable(unitID)
    spMoveCtrlSetPos(unitID, x, y, z)
    spMoveCtrlSetVel(unitID, 0, 0, 0)
    moveLock[unitID] = frame + MOVE_LOCK_FRAMES
    --spEcho("[mo_preventcombomb] MoveCtrl lock applied to commander " .. unitID)
end

--------------------------------------------------------------------------------
--  Main damage interception
--------------------------------------------------------------------------------

function gadget:UnitPreDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponID,
                               attackerID, attackerDefID, attackerTeam, projectileID)
    if not IsCommander(unitDefID) then
        -- Non‑commander unit: early‑out unless it is *attacker* commander doing DGun abuse (ignored here)
        return damage, 1
    end

    local frame = spGetGameFrame()

    ------------------------------------------------------------
    -- Falling debris immunity (weaponIDs are negative)
    ------------------------------------------------------------
    if weaponID < 0 and cantFall[unitID] then
        if frame <= cantFall[unitID] then
            return 0, 0
        else
            cantFall[unitID] = nil
        end
    end

    ------------------------------------------------------------
    -- DGun protection & punishment (always active in hp & 1v1)
    ------------------------------------------------------------
    if dgunWeapons[weaponID] then
        -- ignore repeat DGun damage within grace window
        if dgunImmune[unitID] and frame <= dgunImmune[unitID] then
            return 0, 0
        end

        -- Identify shooter even if attackerID is nil (ground‑fire case)
        local shooterID = attackerID
        if (not shooterID or shooterID <= 0) and projectileID and projectileID > 0 then
            shooterID = spGetProjectileOwnerID(projectileID)
        end

        -- Punish shooter if valid and is a commander and not self
        if shooterID and shooterID ~= unitID then
            local shooterDefID = spGetUnitDefID(shooterID)
            if shooterDefID and IsCommander(shooterDefID) then
                --spEcho("[mo_preventcombomb] Commander " .. shooterID .. " DGunned enemy commander " .. unitID .. "; punishing!")
                spDestroyUnit(shooterID, true, false)
            end
        end

        -- Make victim live
        local hp = select(1, spGetUnitHealth(unitID))
        if hp and hp > 0 then
            damage = CapDamage(unitID, hp, damage)
        end

        dgunImmune[unitID] = frame + DGUN_IMMUNE_FRAMES
        return damage, 0
    end

    ------------------------------------------------------------
    -- Commander blast protection (only when hit by commander_blast)
    ------------------------------------------------------------
    if blastWeapons[weaponID] and (IS_MODE_HP or IS_MODE_1V1) then
        -- If attacker is the commander itself, allow suicide (com‑bomb)
        if attackerID and attackerID == unitID then
            return damage, 1
        end

        local hp = select(1, spGetUnitHealth(unitID))
        if hp and hp > 0 then
            damage = CapDamage(unitID, hp, damage)
        end

        if IS_MODE_1V1 then
            -- Positional lock and no‑fall window
            LockUnit(unitID, frame)
            cantFall[unitID] = frame + CANT_FALL_FRAMES
        end
        return damage, 0
    end

    ------------------------------------------------------------
    -- Default: untouched
    ------------------------------------------------------------
    return damage, 1
end

--------------------------------------------------------------------------------
--  Frame‑based maintenance
--------------------------------------------------------------------------------

function gadget:GameFrame(frame)
    -- Unlock MoveCtrl
    for unitID, expire in pairs(moveLock) do
        if frame >= expire then
            spMoveCtrlDisable(unitID)
            moveLock[unitID] = nil
            --spEcho("[mo_preventcombomb] MoveCtrl unlock for commander " .. unitID)
        end
    end

    -- Expire cant‑fall immunity
    for unitID, expire in pairs(cantFall) do
        if frame >= expire then
            cantFall[unitID] = nil
        end
    end

    -- Expire DGun immunity
    for unitID, expire in pairs(dgunImmune) do
        if frame >= expire then
            dgunImmune[unitID] = nil
        end
    end
end

--------------------------------------------------------------------------------
--  Clean‑up on death & gadget shutdown
--------------------------------------------------------------------------------

local function Purge(unitID)
    moveLock[unitID]   = nil
    cantFall[unitID]   = nil
    dgunImmune[unitID] = nil
end

function gadget:UnitDestroyed(unitID, unitDefID, teamID)
    Purge(unitID)
end

function gadget:Shutdown()
    -- Ensure all MoveCtrl is disabled (safety)
    for unitID in pairs(moveLock) do
        spMoveCtrlDisable(unitID)
    end
end
