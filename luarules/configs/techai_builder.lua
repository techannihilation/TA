-- Engine-facing builder scheduler. One shared economic snapshot per team cycle.
local Economy = VFS.Include('LuaRules/Configs/techai_economy.lua')
local M = {}

function M.Create(api)
	local S, metadata = Spring, api.metadata
	local sharedSpots = {}
	local function metalSpots()
		if api.metalSpots then return api.metalSpots() end
		local spots=GG.metalSpots or _G.metalSpots
		return type(spots)=='table' and spots or {}
	end
	local function resource(team, kind, reserved)
		local current, storage, pull, income, expense = S.GetTeamResources(team, kind)
		return {current=math.max(0,(current or 0)-(reserved or 0)), storage=storage or 1,
			income=income or 0, expense=expense or pull or 0}
	end
	local function account(state, meta, fraction)
		state.pending[meta.role] = (state.pending[meta.role] or 0) + 1
		state.committedMetal = state.committedMetal + (meta.metalCost or 0) * fraction
		state.committedEnergy = state.committedEnergy + (meta.energyCost or 0) * fraction
		state.incomingEnergy = state.incomingEnergy + (meta.energyOutput or 0)
		if (meta.metalCost or 0)*fraction <= state.metal.current+state.metal.income*10
			and (meta.energyCost or 0)*fraction <= state.energy.current+state.energy.income*10 then
			state.incomingEmergencyEnergy=state.incomingEmergencyEnergy+(meta.energyOutput or 0)
		end
		state.pendingConverterDrain = state.pendingConverterDrain + (meta.converterDrain or 0)
	end
	local function Refresh(ai, team, frame)
		if ai.demand and ai.demand.frame == frame then return ai.demand end
		local state = {frame=frame,metal=resource(team,'metal',ai.reservedMetal),energy=resource(team,'energy',ai.reservedEnergy),
			counts={},pending={},committedMetal=0,committedEnergy=0,incomingEnergy=0,incomingEmergencyEnergy=0,pendingConverterDrain=0,
			maxFactoryTier=0,factoryUtilization=0,enemyPressure=0,unfinished={},hasMetalSpots=#metalSpots()>0}
		local activeFactories, factories, converterCapacity = 0, 0, 0
		local unfinishedByDef={}
		for id in pairs(ai.registeredUnits or {}) do
			local meta = metadata[S.GetUnitDefID(id)]
			if meta then
				state.counts[meta.role] = (state.counts[meta.role] or 0) + 1
				local _,_,_,_,progress = S.GetUnitHealth(id)
				if progress and progress < 1 then
					local defID=S.GetUnitDefID(id)
					unfinishedByDef[defID]=(unfinishedByDef[defID] or 0)+1
					account(state,meta,1-progress)
					state.unfinished[#state.unfinished+1] = id
				elseif meta.role == 'factory' then
					factories = factories + 1
					local depth=ai.production and ai.production.depths[id]
					if depth==nil then
						depth=0
						for _,entry in ipairs(S.GetFullBuildQueue(id) or {}) do for _,count in pairs(entry) do depth=depth+count end end
					end
					if depth>0 then activeFactories=activeFactories+1 end
					state.maxFactoryTier=math.max(state.maxFactoryTier,meta.tech or 1)
				elseif meta.role == 'converter' then
					converterCapacity=converterCapacity+(meta.converterDrain or 0)
				end
			end
		end
		state.factoryUtilization = factories>0 and activeFactories/factories or 0
		for defID,count in pairs(ai.production and ai.production.pending or {}) do
			local meta=metadata[defID]
			local queued=math.max(0,count-(unfinishedByDef[defID] or 0))
			if meta then
				state.committedMetal=state.committedMetal+queued*(meta.metalCost or 0)
				state.committedEnergy=state.committedEnergy+queued*(meta.energyCost or 0)
			end
		end
		local conversionUse=S.GetTeamRulesParam and S.GetTeamRulesParam(team,'mmUse') or 0
		state.unusedConverterCapacity=math.max(0,converterCapacity-(conversionUse or 0))
		state.pendingConverterDrain=state.pendingConverterDrain+state.unusedConverterCapacity
		ai.builderTasks = ai.builderTasks or {}
		for id,task in pairs(ai.builderTasks) do
			local queue=S.GetCommandQueue(id,1)
			local current=queue and queue[1]
			local upgrading=task.upgrading and current and current.id==CMD.RECLAIM
			if not S.ValidUnitID(id) or not current or (task.defID and current.id~=-task.defID and not upgrading) then
				ai.builderTasks[id]=nil
			elseif task.defID and (current.id == -task.defID or upgrading) and not task.unitID then
				local meta=metadata[task.defID]
				if meta then account(state,meta,1) end
			end
		end
		local threat=ai.threatProfile or {}
		state.enemyPressure=(threat.heavy or 0)+(threat.raider or 0)+(threat.air or 0)+(threat.artillery or 0)
		ai.demand=state
		return state
	end

	local function freeMex(ai,builder,defID,bx,bz,ally,frame,commander)
		local best,bestScore
		local spots=metalSpots()
		for _,spot in ipairs(spots) do
			local key=math.floor(spot.x/32)..'_'..math.floor(spot.z/32)
			local claim=sharedSpots[ally..':'..key]
			local own=ai.claimedSpots[key]
			if type(own)=='number' and own<=frame then ai.claimedSpots[key]=nil; own=nil end
			if claim and (claim.untilFrame<=frame or not S.ValidUnitID(claim.builder)) then
				sharedSpots[ally..':'..key]=nil; claim=nil
			end
			local distance=(spot.x-bx)^2+(spot.z-bz)^2
			local sx=ai.spawnPos and ai.spawnPos.x or bx
			local sz=ai.spawnPos and ai.spawnPos.z or bz
			local nearBase=not commander or (spot.x-sx)^2+(spot.z-sz)^2 <= (ai.maxCommanderDist or 1100)^2
			if not own and not claim and nearBase and (not bestScore or distance<bestScore) then
				local y=spot.y or S.GetGroundHeight(spot.x,spot.z)
				if api.threat(ai,spot.x,spot.z)<160 and S.TestBuildOrder(defID,spot.x,y,spot.z,0)>0
					and (not api.layout or api.layout.Allowed(ai,defID,spot.x,spot.z,0)) then
					local occupied=false
					for _,id in ipairs(S.GetUnitsInCylinder(spot.x,spot.z,64) or {}) do
						local ud=UnitDefs[S.GetUnitDefID(id)]
						if ud and ((ud.extractsMetal or 0)>0 or not ud.canMove) then occupied=true; break end
					end
					if not occupied then best={x=spot.x,y=y,z=spot.z,key=key}; bestScore=distance end
				end
			end
		end
		return best
	end

	local function Manage(ai,builder,defID,team,ally,frame)
		local state=Refresh(ai,team,frame)
		local def=UnitDefs[defID]
		local bx,_,bz=S.GetUnitPosition(builder)
		if not def or not bx then return end
		local commander=builder==ai.commanderID
		local ranked=Economy.Rank(def.buildOptions or {},metadata,state)
		local task=ai.builderTasks[builder]
		local commands=S.GetCommandQueue(builder,1)
		local current=commands and commands[1]
		-- Builders can leave guard/assist duties immediately when demand changes.
		-- Active construction/reclaim and deliberate travel retain their orders.
		if current and current.id~=CMD.GUARD and current.id~=CMD.PATROL and current.id~=CMD.FIGHT
			and not (task and task.role=='assist' and current.id==CMD.REPAIR) then return end
		for index=1,math.min(#ranked,12) do
			local choice=ranked[index]
			local meta=metadata[choice.defID]
			local x,y,z,facing,spot
			if meta.role=='mex' then
				spot=freeMex(ai,builder,choice.defID,bx,bz,ally,frame,commander)
				if spot then x,y,z,facing=spot.x,spot.y,spot.z,0 end
				if not x and (meta.tech or 1)>1 then
					-- Replace only our own lower-tier extractor, one upgrader per site.
					ai.mexUpgrades=ai.mexUpgrades or {}
					for _,id in ipairs(ai.mexes) do
						local old=metadata[S.GetUnitDefID(id)]
						local owner=ai.mexUpgrades[id]
						if owner and (not S.ValidUnitID(owner) or (S.GetUnitCommandCount(owner) or 0)==0) then ai.mexUpgrades[id]=nil;owner=nil end
						local mx,my,mz=S.GetUnitPosition(id)
						local _,_,_,_,progress=S.GetUnitHealth(id)
						if old and mx and not owner and old.tech<meta.tech and old.isWater==meta.isWater
							and (not progress or progress>=1) and (mx-bx)^2+(mz-bz)^2<(commander and 900 or 2200)^2
							and api.threat(ai,mx,mz)<100
							and (not api.layout or api.layout.Allowed(ai,choice.defID,mx,mz,0,false,id)) then
							S.GiveOrderToUnit(builder,CMD.RECLAIM,{id},0)
							S.GiveOrderToUnit(builder,-choice.defID,{mx,my,mz,0},{'shift'})
							if api.layout then api.layout.Reserve(ai,builder,choice.defID,mx,mz,0) end
							ai.mexUpgrades[id]=builder
							ai.builderTasks[builder]={defID=choice.defID,role='mex',reason='upgrade metal extraction',x=mx,z=mz,frame=frame,upgrading=true}
							account(state,meta,1)
							return
						end
					end
				end
			else
				x,y,z,facing=api.basePosition(choice.defID,ai,meta.role=='factory' and 120 or 48)
				if not x then x,y,z,facing=api.safePosition(choice.defID,bx,bz,600,48,ai) end
			end
			if x and y and z and facing and api.threat(ai,x,z)<250
				and (not api.layout or api.layout.Allowed(ai,choice.defID,x,z,facing)) then
				-- Reserve physical space before the next constructor makes its choice.
				local radius=((UnitDefs[choice.defID].xsize or 4)+(UnitDefs[choice.defID].zsize or 4))*4+32
				local function conflict(px,pz)
					if api.layout then return false end -- shared rectangle reservations include allied builders
					for id,other in pairs(ai.builderTasks) do
						if id~=builder and other.x and other.defID and (other.x-px)^2+(other.z-pz)^2<(radius+(other.radius or 32))^2 then return true end
					end
					return false
				end
				local occupied=conflict(x,z)
				for attempt=1,4 do
					if not occupied or spot then break end
					local angle=(builder+attempt)*2.399963
					local cx=(ai.spawnPos and ai.spawnPos.x or bx)+math.cos(angle)*(200+attempt*100)
					local cz=(ai.spawnPos and ai.spawnPos.z or bz)+math.sin(angle)*(200+attempt*100)
					local px,py,pz,pf=api.safePosition(choice.defID,cx,cz,350,48,ai)
					if px and api.threat(ai,px,pz)<250 and not conflict(px,pz) then x,y,z,facing=px,py,pz,pf;occupied=false end
				end
				if not occupied and S.GiveOrderToUnit(builder,-choice.defID,{x,y,z,facing},0)~=false then
					if api.layout then api.layout.Reserve(ai,builder,choice.defID,x,z,facing) end
					ai.builderTasks[builder]={defID=choice.defID,role=meta.role,reason=choice.reason,x=x,z=z,radius=radius,frame=frame}
					account(state,meta,1)
					if spot then
						ai.claimedSpots[spot.key]=frame+1800
						sharedSpots[ally..':'..spot.key]={builder=builder,untilFrame=frame+1800}
					end
					return
				end
			end
		end
		-- Finish investments before adding low-priority projects; assist can be
		-- reassigned next cycle if an energy/metal emergency appears.
		local best,dist
		for _,id in ipairs(state.unfinished) do
			local x,_,z=S.GetUnitPosition(id)
			local meta=metadata[S.GetUnitDefID(id)]
			if x and meta then
				local d=(x-bx)^2+(z-bz)^2
				if d<1200^2 and (not dist or d<dist) then best,dist=id,d end
			end
		end
		if best then
			if not task or task.target~=best then S.GiveOrderToUnit(builder,CMD.REPAIR,{best},0) end
			ai.builderTasks[builder]={role='assist',target=best,reason='finish existing investment',frame=frame}
			return
		end
		-- Reclaim only known nearby features when metal is scarce.
		if state.metal.current<state.metal.storage*0.4 then
			local bestFeature,bestValue
			for _,id in ipairs(S.GetFeaturesInCylinder(bx,bz,600) or {}) do
				local feature=FeatureDefs[S.GetFeatureDefID(id)]
				local x,y,z=S.GetFeaturePosition(id)
				if feature and x and (feature.metal or 0)>0 and S.IsPosInLos(x,y,z,ally) and api.threat(ai,x,z)<100 then
					local value=feature.metal/(100+math.sqrt((x-bx)^2+(z-bz)^2))
					if not bestValue or value>bestValue then bestFeature,bestValue={x,y,z,64},value end
				end
			end
			if bestFeature then S.GiveOrderToUnit(builder,CMD.RECLAIM,bestFeature,0); return end
		end
		if not commander and ai.factories[1] then
			local target=ai.factories[1]
			if not task or task.target~=target or not current then S.GiveOrderToUnit(builder,CMD.GUARD,{target},0) end
			ai.builderTasks[builder]={role='assist',target=target,reason='support production',frame=frame}
		end
	end
	return {Refresh=Refresh,Manage=Manage}
end
return M
