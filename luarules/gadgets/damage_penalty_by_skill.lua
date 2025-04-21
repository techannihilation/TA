--------------------------------------------------------------------------------
-- gadget: dmg_skill_penalty.lua
--------------------------------------------------------------------------------
function gadget:GetInfo()
    return {
        name = "DamagePenaltyBySkill",
        desc = "Players with higher skill (TS) take increased damage as a balancing measure.",
        author    = "[ur]uncle",
        date      = "2025-04-21",
        license   = "GNU GPL, v2 or later",
        layer     = 0,
        enabled   = true,
    }
end

if not gadgetHandler:IsSyncedCode() then return end

local BASE_TS = 25 -- Players below 25 TS are not affected; a player with 35 TS receives a 10% penalty.
local penaltyMultiplier = 2.5  -- Multiplies the penalty: a player with 35 TS receives a 25% damage penalty.

local Spring_GetTeamList      = Spring.GetTeamList
local Spring_GetTeamInfo      = Spring.GetTeamInfo
local Spring_GetPlayerInfo    = Spring.GetPlayerInfo
local Spring_Echo             = Spring.Echo

local teamScale = {}

local function UpdateTeamScales()
    teamScale = {}
    for _, teamID in ipairs(Spring_GetTeamList()) do
        local leaderID = Spring_GetTeamInfo(teamID)
        if leaderID then
            local _, name, _, _, _, _, _, _, _, _, custom = Spring_GetPlayerInfo(leaderID)
            local playerTS = tonumber(custom and custom.skill)
            if playerTS and playerTS > BASE_TS then
                local penalty = ((playerTS - BASE_TS) / 100) * penaltyMultiplier
                teamScale[teamID] = 1 + penalty
            else
                teamScale[teamID] = 1
            end
        end
    end
end

function gadget:GameStart()
    UpdateTeamScales()
end

function gadget:UnitPreDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponID, attackerID, attackerDefID, attackerTeam)
    local scale = teamScale[unitTeam] or 1
    if scale ~= 1 then
        return damage * scale, 1
    end
    return damage, 1
end