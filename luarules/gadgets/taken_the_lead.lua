

-- This is a GADGET, not a widget
-- Must be inside a mod, in \LuaRules\Gadgets\

function gadget:GetInfo()
	return {
		name = "Has Taken The Lead",
		desc = "Announce Leader",
		author = "zwzsg",
		date = "14 june 2011",
		license = "Free",
		layer = 0,
		enabled = true
	}
end

if (gadgetHandler:IsSyncedCode()) then

	local BestTeam = nil
	local BestTeamCount = nil
	local KillCounters = {}

	local function isUnitComplete(UnitID)
		local health,maxHealth,paralyzeDamage,captureProgress,buildProgress=Spring.GetUnitHealth(UnitID)
		if buildProgress and buildProgress>=1 then
			return true
		else
			return false
		end
	end

	function gadget:Initialize()
		BestTeamCount = 0
		KillCounters = {}
		for _,team in ipairs(Spring.GetTeamList()) do
			KillCounters[team] = 0
		end
	end


	function gadget:UnitDestroyed(u,ud,ut,a,ad,at)
		if ut and at and (not Spring.AreTeamsAllied(ut,at)) and isUnitComplete(u) and u and a and u~=a then
			KillCounters[at]=KillCounters[at]+1
			if KillCounters[at]>BestTeamCount then
				BestTeamCount=KillCounters[at]
				if at~=BestTeam then
					BestTeam=at
					names=nil
					for _,pid in ipairs(Spring.GetPlayerList(at,true)) do
						names=(names and names.."," or "").."<PLAYER"..pid..">"
					end
					Spring.SendMessage("Team"..at.."("..(names and names or "")..") has taken the lead with "..BestTeamCount.." kills!")
				end
			end
		end
	end

end
