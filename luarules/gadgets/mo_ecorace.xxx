function gadget:GetInfo()
	return {
		name = "Best Eco Announcer",
		desc = "Announce Leader in Eco",
		author = "nixtux", --nixtux
		date = "28 june 2014",
		license = "Free",
		layer = 0,
		enabled = false
	}
end

local enabled = tonumber(Spring.GetModOptions().mo_ecorace) or 0

if (enabled == 0) then 
  return false
end

if (gadgetHandler:IsSyncedCode()) then
	
	local HighMincome = 0
	local HighEincome = 0
	local Mteamleader
	local Eteamleader
	
	
	local function GetSide(team)
		local _,_,_,_,side_lower_case = Spring.GetTeamInfo(team)
		local _,side_case_sensitive = Spring.GetSideData(side_lower_case)
		return side_case_sensitive or side_lower_case or "Faction"
	end

	local function GetOldAIInfo(team)
		local AIInfo={Spring.GetAIInfo(team)}
		if #AIInfo==6 then
			table.insert(AIInfo,1,team)
		end
		return unpack(AIInfo)
	end
	
	function gadget:Initialize()
		if Spring.GetModOptions()["missionscript"] then
			gadgetHandler:RemoveGadget()
			return
		end
	end

	function gadget:GameFrame(frame)
		if frame%3600==0 then
		local teamList = Spring.GetTeamList()

			for _,teamID in pairs(teamList) do
				local _,_,_,Mincome = Spring.GetTeamResources(teamID,"metal")
				local _,_,_,Eincome = Spring.GetTeamResources(teamID,"energy")
					if Mincome > HighMincome then
					HighMincome = Mincome
					Mteamleader = teamID
					end
					if Eincome > HighEincome then
					HighEincome = Eincome
					Eteamleader = teamID
					end
			--Spring.Echo("Metal " .. Mteamleader,HighMincome)
			--Spring.Echo("Energy " .. Eteamleader,HighEincome)
			end
						--Metal
			names=nil
			if Mteamleader ~= nil then
			for _,pid in ipairs(Spring.GetPlayerList(Mteamleader,true)) do
			local _,active,spectator=Spring.GetPlayerInfo(pid)
				if active and not spectator then
					names=(names and names..", " or "").."<PLAYER"..pid..">"
				end
			end
			if string.len(Spring.GetTeamLuaAI(Mteamleader) or "")>2 then
				names=(names and names..", " or "")..Spring.GetTeamLuaAI(Mteamleader)
			else
				-- Restore 0.81.2.1 behavior of GetAIInfo
				local _,_,_,_,ShortName,_,_ = GetOldAIInfo(Mteamleader)
				if ShortName and string.len(ShortName)>2 then
					if ShortName~="UNKNOWN" and ShortName~="SYNCED_NOSHORTNAME" and ShortName~="NullAI" and ShortName~="NullOOJavaAI" then
					names=(names and names..", " or "")..ShortName
					else
					names=(names and names..", " or "").."AI"
					end
				end
			end
			Spring.SendMessage("\255\255\001\001" ..(names and names or "").."'s "..GetSide(Mteamleader).." is leading with ".. HighMincome .." Metal Income!\n")
			end
		
			--Energy
		
			names=nil
			if Eteamleader ~= nil then

			for _,pid in ipairs(Spring.GetPlayerList(Eteamleader,true)) do
			local _,active,spectator=Spring.GetPlayerInfo(pid)
				if active and not spectator then
					names=(names and names..", " or "").."<PLAYER"..pid..">"
				end
			end
			if string.len(Spring.GetTeamLuaAI(Eteamleader) or "")>2 then
				names=(names and names..", " or "")..Spring.GetTeamLuaAI(Eteamleader)
			else
				-- Restore 0.81.2.1 behavior of GetAIInfo
				local _,_,_,_,ShortName,_,_ = GetOldAIInfo(Eteamleader)
				if ShortName and string.len(ShortName)>2 then
					if ShortName~="UNKNOWN" and ShortName~="SYNCED_NOSHORTNAME" and ShortName~="NullAI" and ShortName~="NullOOJavaAI" then
					names=(names and names..", " or "")..ShortName
					else
					names=(names and names..", " or "").."AI"
					end
				end
			end
			Spring.SendMessage("\255\255\001\001" ..(names and names or "").."'s "..GetSide(Eteamleader).." is leading with ".. HighEincome .." Energy Income!\n")
			
			end
			end
	end
	end
