--------------------------------------------------------------------------------
-- gadget: dmg_skill_penalty.lua  (High TS deals less damage; low TS not boosted)
--------------------------------------------------------------------------------
function gadget:GetInfo()
    return {
        name      = "DamagePenaltyBySkill",
        desc      = "Higher TS deals reduced damage",
        author    = "[ur]uncle",
        date      = "2025-04-21",
        license   = "GNU GPL, v2 or later",
        layer     = 0,
        enabled   = true,
    }
end

if not gadgetHandler:IsSyncedCode() then return end

local BASE_TS       = 25
local PENALTY_MULT  = 8
local MAX_REDUCTION = 0.7

local Spring_GetTeamList   = Spring.GetTeamList
local Spring_GetTeamInfo   = Spring.GetTeamInfo
local Spring_GetPlayerInfo = Spring.GetPlayerInfo

local teamScale = {}

local function Clamp01(x)
    if x < 0 then return 0 end
    if x > 1 then return 1 end
    return x
end

local function UpdateTeamScales()
    teamScale = {}
    for _, teamID in ipairs(Spring_GetTeamList()) do
        local _, leaderID = Spring_GetTeamInfo(teamID) 
        if leaderID then
            local custom = select(11, Spring.GetPlayerInfo(leaderID))
            local name = select(1, Spring.GetPlayerInfo(leaderID))
            local playerTS = tonumber(custom and custom.skill and custom.skill:match("%d+%.?%d*"))
            if playerTS then
                local delta = playerTS - BASE_TS
                local penalty = (delta / 100) * PENALTY_MULT
                local computed = 1 - penalty
                local minScale = 1 - MAX_REDUCTION
                if computed > 1 then computed = 1 end
                if computed < minScale then computed = minScale end
                teamScale[teamID] = Clamp01(computed)
            else
                teamScale[teamID] = 1
            end
            Spring.Echo("~ name ", name, "playerTS ", playerTS, "teamScale[teamID] ", teamScale[teamID], "teamID ", teamID, "leaderID ", leaderID )
        end
    end
end

function gadget:GameStart()
    UpdateTeamScales()
end

function gadget:UnitPreDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponID, projectileID, attackerID, attackerDefID, attackerTeam)
    local scale = 1
    if attackerTeam then
        scale = teamScale[attackerTeam] or 1
    end
    return damage * scale, 1
end




