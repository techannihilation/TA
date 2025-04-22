--------------------------------------------------------------------------------
-- gadget: dmg_skill_penalty.lua  (now: High TS DEALS less damage)
--------------------------------------------------------------------------------
function gadget:GetInfo()
    return {
        name = "DamagePenaltyBySkill",
        desc = "Players with higher skill (TS) deal reduced damage as a balancing measure.",
        author    = "[ur]uncle",
        date      = "2025-04-21",
        license   = "GNU GPL, v2 or later",
        layer     = 0,
        enabled   = true,
    }
end

if not gadgetHandler:IsSyncedCode() then return end

local BASE_TS = 20
local penaltyMultiplier = 3.33

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
                teamScale[teamID] = 1 - penalty   -- <--- NOTE: 1 - penalty here!
                if teamScale[teamID] < 0 then teamScale[teamID] = 0 end -- don't go negative
            else
                teamScale[teamID] = 1
            end
        end
    end
end

function gadget:GameStart()
    UpdateTeamScales()
    -- Spring_Echo("[DmgSkillPenalty] Initialized (High TS deals less dmg)")
end

function gadget:UnitPreDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponID, attackerID, attackerDefID, attackerTeam)
    local scale = 1
    if attackerTeam then
        scale = teamScale[attackerTeam] or 1
    end
    return damage * scale, 1
end