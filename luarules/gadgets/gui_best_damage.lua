-- This is a GADGET, not a widget
-- Must be inside a mod, in \LuaRules\Gadgets\

function gadget:GetInfo()
	return {
		name = "Best Total Damage",
		desc = "Announce Damage",
		author = "zwzsg", --nixtux
		date = "14 june 2011",
		license = "Free",
		layer = 0,
		enabled = true
	}
end

if (gadgetHandler:IsSyncedCode()) then

	local BestTeamDamage = nil
	local BestTeamDamageCount = nil
	local DamageCounters = {}
	local MinDamage = 50
	local oldtime = 0
	local currenttime
	local UPDATE = 15
	local dgun_weapons = {}
	
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

	local function GetOldAIInfo(team)
		local AIInfo={Spring.GetAIInfo(team)}
		if #AIInfo==6 then
			table.insert(AIInfo,1,team)
		end
		return unpack(AIInfo)
	end
	
	function gadget:Initialize()
	
		for i=1,#WeaponDefs do
    		local wd = WeaponDefs[i]
    		if (wd.type == "DGun") then
      			dgun_weapons[wd] = true
    		end
  		end

		BestTeamDamageCount = 0
		DamageCounters = {}
		for _,team in ipairs(Spring.GetTeamList()) do
			DamageCounters[team] = 0
		end
		if Spring.GetModOptions()["missionscript"] then
			gadgetHandler:RemoveGadget()
			return
		end
	end

	function gadget:UnitDamaged(u,ud,ut,d, p ,w ,pr, a,ad,at)
		if dgun_weapons[w] then return end
		currenttime = Spring.GetGameSeconds()
		if ut and at and (not Spring.AreTeamsAllied(ut,at)) and isUnitComplete(u) and u and a and u~=a and p == false then
			DamageCounters[at]=DamageCounters[at]+math.floor(d)
			if DamageCounters[at]>BestTeamDamageCount then
				BestTeamDamageCount=DamageCounters[at]
				if at~=BestTeamDamage then
					BestTeamDamage=at
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
						local _,_,_,_,ShortName,_,_ = GetOldAIInfo(at)
						if ShortName and string.len(ShortName)>2 then
							if ShortName~="UNKNOWN" and ShortName~="SYNCED_NOSHORTNAME" and ShortName~="NullAI" and ShortName~="NullOOJavaAI" then
								names=(names and names..", " or "")..ShortName
							else
								names=(names and names..", " or "").."AI"
							end
						end
					end
						if BestTeamDamageCount > MinDamage and (currenttime > oldtime + UPDATE) then
						Spring.SendMessage("\255\255\001\001" ..(names and names or "").."'s "..GetSide(at).." has dealt "..BestTeamDamageCount.." total damage!")
						oldtime = currenttime
						end
				end
			end
		end
	end
end