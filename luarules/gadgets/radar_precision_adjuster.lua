function gadget:GetInfo()
    return {
        name      = "Radar Error Adjuster",
        desc      = "Adjusts radar error for all players after game start",
        author    = "Silver",
        date      = "02.12.2024",
        license   = "GNU GPL, v2 or later",
        layer     = 0,
        enabled   = true,
    }
end

local errorMultiplier = 2.5
local hasAdjusted = false

if gadgetHandler:IsSyncedCode() then
    function gadget:GameFrame(frame)
        if frame == 1 and not hasAdjusted then
            local teamList = Spring.GetTeamList()
            for _, teamID in ipairs(teamList) do
                local allyteamErrorSize, baseErrorSize, baseErrorMult = Spring.GetRadarErrorParams(teamID)
                if baseErrorMult then
                    Spring.SetRadarErrorParams(
                        teamID,
                        allyteamErrorSize * errorMultiplier,
                        baseErrorSize * errorMultiplier,
                        baseErrorMult * errorMultiplier
                    )
                end
            end
            hasAdjusted = true
            gadgetHandler:RemoveGadget(self)
        end
    end
end
