
function widget:GetInfo()
	return {
		name      = 'Spectate Selected',
		desc      = 'Automatically spectates owner of selected unit',
		author    = 'Niobium',
        version   = '1.0',
		date      = 'April 2011',
		license   = 'GNU GPL v2',
		layer     = 0,
		enabled   = true
	}
end

local spGetSpectatingState = Spring.GetSpectatingState
local spGetUnitTeam = Spring.GetUnitTeam
local spGetMyTeamID = Spring.GetMyTeamID
local spSendCommands = Spring.SendCommands

local lastSelectedTeam

function widget:SelectionChanged(sel)
	if spGetSpectatingState() then
        local unitID = sel and sel[1]
        if unitID then
            local selTeam = spGetUnitTeam(unitID)
            if selTeam and selTeam ~= lastSelectedTeam and selTeam ~= spGetMyTeamID() then
                lastSelectedTeam = selTeam
                spSendCommands('specteam ' .. selTeam)
            end
        else
            lastSelectedTeam = nil
        end
    else
        lastSelectedTeam = nil
    end
end
