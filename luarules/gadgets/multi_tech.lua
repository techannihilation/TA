
--[[
------------------------------------------------------------
		Tech Tree gadget
------------------------------------------------------------
To make use of this gadget:
	Edit the FBI of your units, 
	adding RequireTech and ProvideTech tags
	in the CustomParams section of UnitInfo.
------------------------------------------------------------
Exemple of FBI declaring tech trees that would be managed by this gadget:

[UNITINFO]
{
	Name=Research Center;
	Unitname=searchlab;
	Description=Unlock new technologies;
	[CustomParams]
	{
		ProvideTech=SuperComputers, Exotic Alloys;
	}
	FootprintX=6;
	FootprintZ=6;
	MaxDamage=40000;
	....
}

[UNITINFO]
{
	Name=Stealth tank;
	Unitname=stlthtnk;
	Description=Made of absorbing material;
	[CustomParams]
	{
		RequireTech=Exotic Alloys;
	}
	FootprintX=3;
	FootprintZ=3;
	MaxDamage=8000;
	....
}

[UNITINFO]
{
	Name=Spatial Study Center;
	Unitname=spacelab;
	Description=Unlock spatial technologies;
	[CustomParams]
	{
		RequireTech=SuperComputers, Big-Rockets;
		ProvideTech=Satellite, Exotic Alloys;
	}
	FootprintX=8;
	FootprintZ=8;
	MaxDamage=30000;
	....
}

------------------------------------------------------------
As a bonus:
				Advanced users only!
	Sticking to the FBI should cover all your needs already.
------------------------------------------------------------
Other synced gadgets may access the four following functions:

	GG.TechSlaveCommand(commandID,requirements)
		Makes a command locked until all the techs in the string requirements are reached.
		Useful to lock commands that are not build commands.
		Cannot be used more than once on the same command.
		Exemple: GG.TechSlaveCommand(CMD.DGUN,"Heavy Weapons, Offensive Commander")
		Would make the D-Gun button locked until both "heavy weapons" and "offensive commander" technologies are reached.

	GG.TechCheckCommand(CommandID,TeamID)
		return true if the command is unlocked for the team
		return false if the command is locked for the team

	GG.TechCheck(TechName,TeamID)
		return nil if TechName is not a known technology
		return false if team has not reached the tech
		return true if team has reached the tech

	GG.TechGrant(TechName,TeamID)
		Makes a team get a tech for free

------------------------------------------------------------
Any widgets and gadgets, synced or unsynced, may use:

	Spring.GetTeamRulesParam(team,"technology:"..techname)
		Returns the number of unit providing access to a tech.
		Warning: techname must be lower case.

	For instance, assuming the mod use FBIs such as above,
	Spring.GetTeamRulesParam(Spring.GetMyTeamID(),"technology:exotic alloys")
	would return 0 at game start, and 5 after you finish
	three "Research Center" and two "Spatial Study Center".

	Note that: Spring.GetTeamRulesParam(team,"technology:"..techname)>=1
	Would return the same as GG.TechCheck(techname,team).
	Save that GG.TechCheck is limited to synced gadget,
	while Spring.GetTeamRulesParam is allowed in every lua.
------------------------------------------------------------
Those four functions and those TeamRules are only available
after the Initialize phase of gadgets. Check the layer value
in GetInfo if you need to call them in Initialize.
------------------------------------------------------------

]]--

function gadget:GetInfo()
	return {
		name = "Tech Trees",
		desc = "Prerequisites",
		author = "zwzsg",
		date = "October 2009",
		license = "Public domain",
		layer = -10,
		enabled = true
	}
end



if (gadgetHandler:IsSyncedCode()) then


	-- Variables
	local TechTable={}
	local ProviderTable={}
	local AccessionTable={}
	local ProviderIDs={}
	local AccessionIDs={}

	local OriDesc={}
	local GrantDesc={}
	local ReqDesc={}


	local function SplitString(Line)
		local words={}
		local str=Line
		local delimiters={","}
		local whitespaces={" ","\t"}
		local function CharIs(char,charlist)
			for _,c in ipairs(charlist) do
				if char==c then
					return true
				end
			end
			return false
		end
		-- Find the delimiter, split at them
		while string.len(str)>0 do
			local cursor1=1
			while CharIs(string.sub(str,cursor1,cursor1),delimiters) and cursor1<=string.len(str) do
				cursor1=cursor1+1
			end
			local cursor2=cursor1
			while cursor2<=string.len(str) and not CharIs(string.sub(str,cursor2,cursor2),delimiters) do
				cursor2=cursor2+1
			end
			if cursor1<cursor2 then
				table.insert(words,string.sub(str,cursor1,cursor2-1))
			end
			str=string.sub(str,cursor2,-1)
		end
		-- Remove whitespaces at the start and end of every word. And cast to lowercase.
		for w,word in ipairs(words) do
			local cursor1=1
			while CharIs(string.sub(word,cursor1,cursor1),whitespaces) and cursor1<string.len(word) do
				cursor1=cursor1+1
			end
			local cursor2=string.len(word)
			while CharIs(string.sub(word,cursor2,cursor2),whitespaces) and cursor2>=1 do
				cursor2=cursor2-1
			end
			words[w]=string.lower(string.sub(word,cursor1,cursor2))
		end
		-- Remove empty words
		for w=#words,1,-1 do
			if string.len(words[w])<1 then
				table.remove(words,w)
			end
		end
		return words
	end


	local function InitTechEntry(techname)
		if not TechTable[techname] then
			TechTable[techname]={name=techname,ProvidedBy={},AccessTo={},ProviderCount={}}
			for _,team in ipairs(Spring.GetTeamList()) do
				TechTable[techname].ProviderCount[team]=0
				Spring.SetTeamRulesParam(team,"technology:"..techname,0)
			end
		end
	end


	local function CheckTech(TechName,Team)
		TechName=string.lower(TechName)
		if not TechTable[TechName] then
			Spring.Echo("Bad call to Check Tech: TechName=\""..TechName.."\" is unknown")
			return nil
		else
			if not TechTable[TechName].ProviderCount[Team] then
				Spring.Echo("Bad call to Check Tech: TechName=\""..TechName.."\", Team="..Team)
				return nil
			else
				if TechTable[TechName].ProviderCount[Team]>=1 then
					return true
				else
					return false
				end
			end
		end
	end


	local function CheckCmd(cmd,team)
		if not AccessionTable[cmd] then
			return true
		else
			for _,tech in ipairs(AccessionTable[cmd]) do
				if not CheckTech(tech,team) then
					return false
				end
			end
			return true
		end
	end


	local function EditButtons(u,ud,team)

		-- Sub-functions
		local function GrantingToolTip(u,ucd,cmd)
			if not GrantDesc[cmd] then
				if not OriDesc[cmd] then
					OriDesc[cmd]=Spring.GetUnitCmdDescs(u)[ucd].tooltip
				end
				GrantDesc[cmd]="\255\64\255\255Grants "..table.concat(ProviderTable[-cmd],", ").."\n\255\255\255\255"..OriDesc[cmd]
			end
			return GrantDesc[cmd]
		end

		local function LockedToolTip(u,ucd,cmd)
			if not ReqDesc[cmd] then
				if not OriDesc[cmd] then
					OriDesc[cmd]=Spring.GetUnitCmdDescs(u)[ucd].tooltip
				end
				ReqDesc[cmd]="\255\255\64\64Requires "..table.concat(AccessionTable[cmd],", ").."\n\255\255\255\255"..(GrantDesc[cmd] or OriDesc[cmd])
			end
			return ReqDesc[cmd]
		end

		local function UnlockedToolTip(u,ucd,cmd)
			if not OriDesc[cmd] then
				OriDesc[cmd]=Spring.GetUnitCmdDescs(u)[ucd].tooltip
			end
			return (GrantDesc[cmd] or OriDesc[cmd])
		end

		-- Inits
		local Grants=nil
		local Requires=nil

		-- What is granted
		for _,ud in ipairs(ProviderIDs) do
			local UnitCmdDesc = Spring.FindUnitCmdDesc(u,-ud)
			if UnitCmdDesc then
				Spring.EditUnitCmdDesc(u,UnitCmdDesc,{tooltip=GrantingToolTip(u,UnitCmdDesc,-ud)})
			end
		end

		-- What is required
		for _,cid in ipairs(AccessionIDs) do
			local UnitCmdDesc = Spring.FindUnitCmdDesc(u,cid)
			if UnitCmdDesc then
				if CheckCmd(cid,team) then
					Spring.EditUnitCmdDesc(u,UnitCmdDesc,{disabled=false,tooltip=UnlockedToolTip(u,UnitCmdDesc,cid)})
				else
					Spring.EditUnitCmdDesc(u,UnitCmdDesc,{disabled=true,tooltip=LockedToolTip(u,UnitCmdDesc,cid)})
				end
			end
		end

	end


	local function SlvCmd(cmd,str_reqs)
		local lst_reqs=SplitString(str_reqs)
		if AccessionTable[cmd] then
			Spring.Echo("Slave Command Error: command "..cmd.." already tech-slaved")
			return false
		else
			AccessionTable[cmd]={}
			table.insert(AccessionIDs,cmd)
			for _,techname in ipairs(lst_reqs) do
				if not TechTable[techname] then
					Spring.Echo("Slave Command Error: TechName=\""..techname.."\" is unknown")
				else
					table.insert(TechTable[techname].AccessTo,cmd)
					table.insert(AccessionTable[cmd],techname)
				end
			end
			-- Edit buttons of existing units:
			for _,u in ipairs(Spring.GetAllUnits()) do
				local UnitCmdDesc = Spring.FindUnitCmdDesc(u,cmd)
				if UnitCmdDesc then
					EditButtons(u,Spring.GetUnitDefID(u),Spring.GetUnitTeam(u))
				end
			end
			return true
		end
	end


	local function GrantTech(TechName,Team)
		TechName=string.lower(TechName)
		if not TechTable[TechName] then
			Spring.Echo("Bad call to Grant Tech: TechName=\""..TechName.."\" is unknown")
			return nil
		else
			if not TechTable[TechName].ProviderCount[Team] then
				Spring.Echo("Bad call to Check Tech: TechName=\""..TechName.."\", Team="..Team)
				return false
			else
				TechTable[TechName].ProviderCount[Team]=math.huge
				Spring.SetTeamRulesParam(Team,"technology:"..TechName,TechTable[TechName].ProviderCount[Team])
				for _,u in ipairs(Spring.GetAllUnits()) do
					EditButtons(u,Spring.GetUnitDefID(u),Spring.GetUnitTeam(u))
				end
				return true
			end
		end
	end


	local function isComplete(u)
		local health,maxHealth,paralyzeDamage,captureProgress,buildProgress=Spring.GetUnitHealth(u)
		if buildProgress and buildProgress>=1 then
			return true
		else
			return false
		end
	end


	local function UnitGained(u,ud,team)
		EditButtons(u,ud,team)
		if isComplete(u) and ProviderTable[ud] then
			for _,tech in ipairs(ProviderTable[ud]) do
				TechTable[tech].ProviderCount[team]=TechTable[tech].ProviderCount[team]+1
				Spring.SetTeamRulesParam(team,"technology:"..tech,TechTable[tech].ProviderCount[team])
			end
			for _,u2 in ipairs(Spring.GetTeamUnits(team)) do
				EditButtons(u2,Spring.GetUnitDefID(u2),team)
			end
		end
	end


	local function UnitLost(u,ud,team)
		if isComplete(u) and ProviderTable[ud] then
			for _,tech in ipairs(ProviderTable[ud]) do
				TechTable[tech].ProviderCount[team]=TechTable[tech].ProviderCount[team]-1
				Spring.SetTeamRulesParam(team,"technology:"..tech,TechTable[tech].ProviderCount[team])
			end
			for _,u2 in ipairs(Spring.GetTeamUnits(team)) do
				EditButtons(u2,Spring.GetUnitDefID(u2),team)
			end
		end
	end


	function gadget:UnitCreated(u,ud,team)
		EditButtons(u,ud,team)
		if ProviderTable[ud] then
			Spring.SetUnitTooltip(u,"\255\64\255\255Provides "..table.concat(ProviderTable[ud],", ").."\n\255\255\255\255"..Spring.GetUnitTooltip(u))
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

	function gadget:AllowCommand(u,ud,team,cmd,param,opt,synced)
		return CheckCmd(cid,team)
	end

	function gadget:AllowUnitCreation(ud,builder,team,x,y,z)
		return CheckCmd(-ud,team)
	end


	function gadget:Initialize()

		for _,ud in pairs(UnitDefs) do
			local cp=ud.customParams
			if cp then
				local str_p=cp.providestech or cp.providetech
				local str_r=cp.requirestech or cp.requiretech
				if str_p then
					local lst_p=SplitString(str_p)
					ProviderTable[ud.id]={}
					table.insert(ProviderIDs,ud.id)
					for _,techname in ipairs(lst_p) do
						InitTechEntry(techname)
						table.insert(TechTable[techname].ProvidedBy,ud.id)
						table.insert(ProviderTable[ud.id],techname)
					end
				end
				if str_r then
					local lst_r=SplitString(str_r)
					AccessionTable[-ud.id]={}
					table.insert(AccessionIDs,-ud.id)
					for _,techname in ipairs(lst_r) do
						InitTechEntry(techname)
						table.insert(TechTable[techname].AccessTo,-ud.id)
						table.insert(AccessionTable[-ud.id],techname)
					end
				end
			end
		end

		if true then
			local msg=nil
			for _,tech in pairs(TechTable) do
				msg=(msg and (msg..", ") or "")..tech.name
			end
			msg="\""..gadget:GetInfo().name.."\" gadget"..(msg and (" managing the technologies: "..msg..".") or " found no technology to manage.")
			Spring.Echo(msg)
		end

		GG.TechSlaveCommand=SlvCmd
		GG.TechCheckCommand=CheckCmd
		GG.TechCheck=CheckTech
		GG.TechGrant=GrantTech

	end


end
