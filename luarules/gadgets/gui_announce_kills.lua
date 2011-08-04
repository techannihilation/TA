-- This is a GADGET

function gadget:GetInfo()
	return {
		name = "Announce kills",
		desc = "Announce Leader",
		author = "Jools, zwzsg",
		date = "14 june 2011",
		license = "Free",
		layer = 0,
		enabled = true
	}
end

function friendlyName(teamID)
	if teamID == nil then return "NONE" end
	local _,_,_,notHuman,side,_,_,_ = Spring.GetTeamInfo(teamID)
	if notHuman then
		if side == "arm" then return "Arm"
		elseif side == "core" then return "Core"
		elseif  side == "tll" then return "Tll"
		else return side
		end
	else
		names=nil
		for _,pid in ipairs(Spring.GetPlayerList(teamID,true)) do
			local player = Spring.GetPlayerInfo(pid)
                        local _, _, spec, _, _, _, _, _ = Spring.GetPlayerInfo(pid) 
     if ( spec ~= true ) then 
        names=(names and names.."," or "").."<PLAYER"..pid..">"
      end
		end
		if names == nil then return ("Team " .. teamID) end
		return (names and names or "")
	end
end


if (gadgetHandler:IsSyncedCode()) then

	local bestTeam = nil
	local bestKills = nil
	local killCounters = {}
	local soundsOn = false -- change if you want sounds
	local snd = "sounds/ding.wav" --path to sound file
	local function isUnitComplete(UnitID)
		local health,maxHealth,paralyzeDamage,captureProgress,buildProgress=Spring.GetUnitHealth(UnitID)
		if buildProgress and buildProgress>=1 then
			return true
		else
			return false
		end
	end

	function gadget:Initialize()
		bestKills = 0
		killCounters = {}
		for _,team in ipairs(Spring.GetTeamList()) do
			killCounters[team] = 0
		end
	end

	function gadget:UnitDestroyed(u,ud,ut,a,ad,at)
		if ut and at and (not Spring.AreTeamsAllied(ut,at)) and isUnitComplete(u) and u and a and u~=a then
			killCounters[at]=killCounters[at]+1
			if killCounters[at]>bestKills then
				bestKills=killCounters[at]
				if at~=bestTeam then
					bestTeam=at
					if soundsOn then Spring.PlaySoundFile(snd) end
					Spring.SendMessage("\255\255\001\001" .. friendlyName(bestTeam) .. " has taken the lead with " .. bestKills .. " kills.")
				end
			end
		end
	end

end
