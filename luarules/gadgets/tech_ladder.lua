
-- List of buildings granting access to each tech level:
LabNames = {
		{"armrech3","corech3"}, -- Tech 1
		{"armrech18","corech18"}, -- Tech 6
		{"armrech21","corech21"}, -- Tech 7
		{"ACovertOpsCentre","CCovertOpsCentre"}, -- Tech 8
	}

-- List of units or commands requiring each tech level:
LockedNames = {
		{"amortor","cmortor","armblz","armjade","armdragf","corfalc","armcbomb","armscar","armmedt","armarty","armeman","dao","cbrutus","aexxec","armsonic","armdark","gladiator","cslicer","corgfbt",}, -- Tech 1
		{"armanni","cordoom","arm_big_bertha","core_intimidator","armvulc","corbuzz","armbull2","armsilo","corsilo",}, -- Tech 5
		{"armshock","armcrabe","cordem","corkarg","shiva","armraven","corjurgen","armmech","armpod","troman","armgant","armmechl","armjugg","armraz","marauder","nebraska","corboucher","cormddm","armhh","armcav","snowman","airwolf3g","taipan","akmech","armhdpw","tankanotor","vaporiser","armscpion","armcd","armpers","shrike","corprot","coredauber","coremech","corcrab","nsacskv","tawf116","armciph","cormonsta","requ1","blackdawn","tu95-a","b52g","armkrmi","magilla","krogtaar",}, -- Tech 7
		{"abuilderlvl3","cbuilderlvl3",}, -- Tech 10
	}


-- Note:
-- I call "lab" what grant tech level, I call "locked" what is locked until a given tech level is reached.
-- LabNames must contain unit names, LockedNames can contain unit names or command IDs.
-- Losing the last lab of your highest tech level makes you lose tech level(s).
-- Reaching a given tech level automatically unlock every lower tech level. If you have a tech 6 lab, then tech 3 units and commands are allowed, even if you don't have any tech 3 lab, for instance.
-- Widgets, or other gadgets, can use Spring.GetTeamRulesParam(teamID,"TechLevel") to know the tech level of a team.



function gadget:GetInfo()
	return {
		name = "Tech Ladder",
		desc = "Handles linear tech levels",
		author = "zwzsg",
		date = "October 2009",
		license = "Public domain",
		layer = 0,
		enabled = true
	}
end



if (gadgetHandler:IsSyncedCode()) then



	-- Variables
	local LabIDs
	local LockedIDs
	local MaxTech
	local LabCount
	local CurrentTech
	local OriDesc
	local GrantDesc
	local ReqDesc



	function gadget:Initialize()

		-- Translate labs name into IDs
		LabIDs={}
		for tech,line in ipairs(LabNames) do
			LabIDs[tech]={}
			for row,name in ipairs(line) do
				if UnitDefNames[string.lower(name)] then
					table.insert(LabIDs[tech],UnitDefNames[string.lower(name)].id)
				else
					Spring.Echo("Error in \""..gadget:GetInfo().name.."\" gadget: LabNames["..tech.."]["..row.."]=\""..name.."\" is not a valid unit name!")
				end
			end
		end

		-- Translate locked units name into -IDs
		LockedIDs={}
		for tech,line in ipairs(LockedNames) do
			LockedIDs[tech]={}
			for row,item in ipairs(line) do
				if type(item)=="string" then -- if unit name, then insert the command "build that unit", numbered -unitid
					if UnitDefNames[string.lower(item)] then
						table.insert(LockedIDs[tech],-UnitDefNames[string.lower(item)].id)
					else
						Spring.Echo("Error in \""..gadget:GetInfo().name.."\" gadget: LockedNames["..tech.."]["..row.."]=\""..item.."\" is not a valid unit name!")
					end
				elseif type(item)=="number" then -- if already a command id, just insert it
					table.insert(LockedIDs[tech],item)
				end
			end
		end

		MaxTech=math.max(#LabIDs,#LockedIDs)
		LabCount={}
		CurrentTech={}
		OriDesc={}
		GrantDesc={}
		ReqDesc={}

		for _,team in ipairs(Spring.GetTeamList()) do
			LabCount[team]={}
			for tech=1,MaxTech do
				LabCount[team][tech]=0
			end
			CurrentTech[team]=0
			Spring.SetTeamRulesParam(team,"TechLevel",CurrentTech[team])
		end

	end



	local function EditButtons(u,ud,team)

		-- Sub-functions
		local function GrantingToolTip(tech,u,ucd,cmd)
			if not GrantDesc[cmd] then
				if not OriDesc[cmd] then
					OriDesc[cmd]=Spring.GetUnitCmdDescs(u)[ucd].tooltip
				end
				GrantDesc[cmd]="\255\64\255\255Grants Tech "..tech.."\n\255\255\255\255"..OriDesc[cmd]
			end
			return GrantDesc[cmd]
		end

		local function LockedToolTip(tech,u,ucd,cmd)
			if not ReqDesc[cmd] then
				if not OriDesc[cmd] then
					OriDesc[cmd]=Spring.GetUnitCmdDescs(u)[ucd].tooltip
				end
				ReqDesc[cmd]="\255\255\64\64Requires Tech "..tech.."\n\255\255\255\255"..(GrantDesc[cmd] or OriDesc[cmd])
			end
			return ReqDesc[cmd]
		end

		local function UnlockedToolTip(tech,u,ucd,cmd)
			if not OriDesc[cmd] then
				OriDesc[cmd]=Spring.GetUnitCmdDescs(u)[ucd].tooltip
			end
			return (GrantDesc[cmd] or OriDesc[cmd])
		end

		-- Inits
		local Grants=nil
		local Requires=nil

		-- What is granted
		for tech,line in ipairs(LabIDs) do
			for _,uid in ipairs(line) do
				local UnitCmdDesc = Spring.FindUnitCmdDesc(u,-uid)
				if UnitCmdDesc then
					Spring.EditUnitCmdDesc(u,UnitCmdDesc,{tooltip=GrantingToolTip(tech,u,UnitCmdDesc,-uid)})
				end
			end
		end

		-- What is required
		for tech=1,MaxTech do
			for _,cid in ipairs(LockedIDs[tech]) do
				local UnitCmdDesc = Spring.FindUnitCmdDesc(u,cid)
				if UnitCmdDesc then
					if tech>CurrentTech[team] then
						Spring.EditUnitCmdDesc(u,UnitCmdDesc,{disabled=true,tooltip=LockedToolTip(tech,u,UnitCmdDesc,cid)})
					else
						Spring.EditUnitCmdDesc(u,UnitCmdDesc,{disabled=false,tooltip=UnlockedToolTip(tech,u,UnitCmdDesc,cid)})
					end
				end
			end
		end

	end



	function gadget:AllowCommand(u,ud,team,cmd,param,opt,synced)
		for tech=CurrentTech[team]+1,MaxTech do
			for _,cid in ipairs(LockedIDs[tech]) do
				if cmd==cid then
					return false
				end
			end
		end
		return true
	end



	function gadget:AllowUnitCreation(ud,builder,team,x,y,z)
		for tech=CurrentTech[team]+1,MaxTech do
			for _,cid in ipairs(LockedIDs[tech]) do
				if cid==-ud then
					return false
				end
			end
		end
		return true
	end



	local function UnitGained(u,ud,team)
		EditButtons(u,ud,team)
		local health,maxHealth,paralyzeDamage,captureProgress,buildProgress=Spring.GetUnitHealth(u)
		if buildProgress and buildProgress>=1 then
			for tech,line in ipairs(LabIDs) do
				for _,id in ipairs(line) do
					if ud==id then
						LabCount[team][tech]=LabCount[team][tech]+1
						if tech>CurrentTech[team] then
							CurrentTech[team]=tech
							Spring.SetTeamRulesParam(team,"TechLevel",CurrentTech[team])
							for _,u2 in ipairs(Spring.GetTeamUnits(team)) do
								EditButtons(u2,Spring.GetUnitDefID(u2),team)
							end
						end
					end
				end
			end
		end
	end



	local function UnitLost(u,ud,team)
		local health,maxHealth,paralyzeDamage,captureProgress,buildProgress=Spring.GetUnitHealth(u)
		if buildProgress and buildProgress>=1 then
			for tech,line in ipairs(LabIDs) do
				for _,id in ipairs(line) do
					if ud==id then
						LabCount[team][tech]=LabCount[team][tech]-1
						if LabCount[team][tech]<=0 and tech>=CurrentTech[team] then
							CurrentTech[team]=0
							for regtech=1,tech do
								if LabCount[team][tech]>0 then
									CurrentTech[team]=regtech
								end
							end
							Spring.SetTeamRulesParam(team,"TechLevel",CurrentTech[team])
							for _,u2 in ipairs(Spring.GetTeamUnits(team)) do
								EditButtons(u2,Spring.GetUnitDefID(u2),team)
							end
						end
					end
				end
			end
		end
	end



	function gadget:UnitCreated(u,ud,team)
		EditButtons(u,ud,team)
		for tech,line in ipairs(LabIDs) do
			for _,uid in ipairs(line) do
				if uid==ud then
					Spring.SetUnitTooltip(u,"\255\64\255\255Provides Tech "..tech.."\n\255\255\255\255"..Spring.GetUnitTooltip(u))
				end
			end
		end
	end

	function gadget:UnitFinished(u,ud,team)
		UnitGained(u,ud,team)
	end

	function gadget:UnitDestroyed(u,ud,team)
		UnitLost(u,ud,team)
	end

	function gadget:UnitGiven(u,ud,team,oldteam)
		UnitGained(u,ud,team)
	end

	function gadget:UnitTaken(u,ud,team,newteam)
		UnitLost(u,ud,team)
	end

end
