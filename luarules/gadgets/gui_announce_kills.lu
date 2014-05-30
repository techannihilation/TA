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

	local function GetSide(team)
		local _,_,_,_,side_lower_case = Spring.GetTeamInfo(team)
		local _,side_case_sensitive = Spring.GetSideData(side_lower_case)
		return side_case_sensitive or side_lower_case or "Faction"
	end

	function gadget:Initialize()
		BestTeamCount = 0
		KillCounters = {}
		for _,team in ipairs(Spring.GetTeamList()) do
			KillCounters[team] = 0
		end
		if Spring.GetModOptions()["missionscript"] then
			gadgetHandler:RemoveGadget()
			return
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
						local _,active,spectator=Spring.GetPlayerInfo(pid)
						if active and not spectator then
							names=(names and names..", " or "").."<PLAYER"..pid..">"
						end
					end
					if string.len(Spring.GetTeamLuaAI(at) or "")>2 then
						names=(names and names..", " or "")..Spring.GetTeamLuaAI(at)
					else
						-- Restore 0.81.2.1 behavior of GetAIInfo
						local function GetOldAIInfo(team)
							local AIInfo={Spring.GetAIInfo(team)}
							if #AIInfo==6 then
								table.insert(AIInfo,1,team)
							end
							return unpack(AIInfo)
						end
						local _,_,_,_,ShortName,_,_ = GetOldAIInfo(at)
						if ShortName and string.len(ShortName)>2 then
							if ShortName~="UNKNOWN" and ShortName~="SYNCED_NOSHORTNAME" and ShortName~="NullAI" and ShortName~="NullOOJavaAI" then
								names=(names and names..", " or "")..ShortName
							else
								names=(names and names..", " or "").."AI"
							end
						end
					end
					Spring.SendMessage("\255\255\001\001" .."Team"..at.." "..(names and names or "").."'s "..GetSide(at).." has taken the lead with "..BestTeamCount.." kills!")
				end
			end
		end
	end

end