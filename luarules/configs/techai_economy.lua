-- Pure demand scoring. Positions, orders and shared reservations live in the gadget.
local M = {}
local function clamp(x, low, high) return math.max(low, math.min(high, x)) end

function M.Rank(options, metadata, state)
	local ranked = {}
	local e = state.energy
	local m = state.metal
	local eRatio = e.current / math.max(1, e.storage)
	local mRatio = m.current / math.max(1, m.storage)
	local eNet = e.income - e.expense
	local mNet = m.income - m.expense
	local critical = eRatio < 0.20 or (eNet < 0 and e.current / -eNet < 12)
	local energyNeed = math.max(0, m.income * 10 - e.income, -eNet)
	local metalNeed = clamp(1 - mRatio + math.max(0, -mNet) / math.max(1, m.income), 0, 2)
	local counts, pending = state.counts or {}, state.pending or {}
	local maxFactoryTier = state.maxFactoryTier or 0
	-- No extractor sites: fund metal production through the cheapest buildable
	-- converter, expanding power first when its draw exceeds the spare income.
	if state.hasMetalSpots==false and metalNeed>0.2 then
		local drain=state.unusedConverterCapacity or 0
		if drain<=0 then
			for _,defID in ipairs(options) do
				local meta=metadata[defID]
				if meta and meta.role=='converter' and (meta.converterDrain or 0)>0
					and (meta.metalCost or 0)<=m.current+m.income*45 then
					if drain==0 or meta.converterDrain<drain then drain=meta.converterDrain end
				end
			end
		end
		if drain>0 then energyNeed=math.max(energyNeed,drain*1.15-eNet) end
	end
	for _, defID in ipairs(options) do
		local meta = metadata[defID]
		if meta then
			local role, cost, ecost = meta.role, meta.metalCost or 0, meta.energyCost or 0
			local horizon = role == 'factory' and 60 or 35
			local metalBudget = math.max(0, m.current + m.income * horizon * 0.7 - (state.committedMetal or 0))
			local energyBudget = math.max(0, e.current + e.income * horizon * 0.7 - (state.committedEnergy or 0))
			-- A power recovery project must remain possible while other work is stalled.
			if role == 'energy' and critical then
				metalBudget = math.max(metalBudget, m.current + m.income * 15)
				energyBudget = math.max(energyBudget, e.current + e.income * 45)
			end
			local affordable = cost <= metalBudget and ecost <= energyBudget
			local score, reason
			if affordable then
				if role == 'energy' and (meta.energyOutput or 0) > 0 then
					local output = meta.energyOutput
					local shortage = energyNeed + (critical and math.max(30, e.income * 0.4) or 0)
					local incoming = state.incomingEnergy or 0
					if critical and state.incomingEmergencyEnergy~=nil then incoming=state.incomingEmergencyEnergy end
					if incoming < shortage + 20 and (critical or energyNeed > 0 or eRatio < 0.5) then
						score = (critical and 1100 or 650) + math.min(100, output / math.max(1, cost) * 100)
							- math.max(0, output - shortage * 2) / math.max(1, output) * 60
						reason = critical and 'energy emergency' or 'energy demand'
					end
				elseif role == 'mex' and not critical and state.hasMetalSpots~=false then
					score = 400 + metalNeed * 160 + (meta.tech or 1) * 8 - (pending.mex or 0) * 90
					reason = 'metal expansion'
				elseif role == 'converter' and not critical then
					local surplus = eNet - (state.pendingConverterDrain or 0)
					local drain = meta.converterDrain or 0
					if drain > 0 and surplus >= drain * 1.15 and eRatio >= 0.55 and metalNeed > 0.2 then
						score = 450 + metalNeed * 100 + math.min(90, (meta.metalOutput or 0) * 25)
							- (pending.converter or 0) * 150
						reason = 'convert spare energy to metal'
					end
				elseif role == 'factory' and not critical and (meta.tech or 1) <= 5 then
					local factoryCount = counts.factory or 0
					local tech = meta.tech or 1
					local higherTier = tech > maxFactoryTier
					local previousTier = not higherTier and tech == maxFactoryTier - 1
					local busy = (state.factoryUtilization or 0) >= 0.75 and mRatio >= 0.35 and eRatio >= 0.35
					local rich = m.income >= 45 and mRatio >= 0.5 and eRatio >= 0.5
					-- A T2+ factory without sufficient build power spams idle shells:
					-- only tier progression is ever allowed while the constructor
					-- pool cannot actually staff the factories being duplicated.
					local canSupport = (counts.constructor or 0) + (counts.commander or 0)
						+ (counts.nanotower or 0) + (counts.rezzer or 0) >= factoryCount
					-- Industrial scale: saturated factories expand same tier and a
					-- T2+ base back-fills the previous tier, all throttled by how
					-- many new factories the economy can actually feed.
					local vote = higherTier or factoryCount == 0 or (canSupport and (busy or rich or previousTier))
					local allowance = math.max(1, math.floor(m.income / 50))
					if vote and (pending.factory or 0) < allowance then
						-- Tier dominates within the factory choice once genuinely affordable.
						score = (factoryCount == 0 and 1000 or 390) + tech * 45
							+ (higherTier and 90 or 0) + (state.enemyPressure or 0) * 20
						if energyNeed > e.income * 0.25 then score = score - 200 end
						reason = higherTier and 'affordable tech progression'
							or (previousTier and 'expand lower-tier industrial capacity' or 'production capacity')
					end
				elseif (role == 'defense' or role == 'aa') and not critical then
					local threat = role == 'aa' and (state.defenseAir or 0) or (state.defenseGround or 0)
					if threat > 0 then
						local have = (counts[role] or 0) + (pending[role] or 0)
						if have < math.min(6, threat) and (meta.tech or 1) <= math.max(1, (state.hintTech or 0) + 1) then
							local tierDiff = math.max(0, (meta.tech or 1) - math.max(1, state.hintTech or 1))
							score = 360 + math.min(150, threat * 25) - tierDiff * 12
							reason = role == 'aa' and 'air defense' or 'base defense'
						end
					end
				elseif role == 'storage' and not critical and (maxFactoryTier or 0) >= 1 then
					local sk = meta.storageKind
					if sk == 'metal' or sk == 'energy' then
						local income = sk == 'metal' and m.income or e.income
						local currCap = state.storageCap and state.storageCap[sk] or 0
						local target = math.max(2000, income * 180)
						local full = state.fullFrames and state.fullFrames[sk] or 0
						local have = (counts.storage or 0) + (pending.storage or 0)
						if full >= 300 and have < 2 and currCap < target and (meta.tech or 1) <= (maxFactoryTier or 0) + 1 then
							score = 300 + (have == 0 and 30 or 0) - math.max(0, (meta.tech or 1) - 1) * 12
							reason = sk == 'metal' and 'metal reserves' or 'energy reserves'
						end
					end
				elseif role == 'radar' and not critical and (counts.radar or 0) + (pending.radar or 0) < 1 then
					score, reason = 280, 'early warning'
				elseif role == 'nanotower' and not critical then
					local nanoCount = (counts.nanotower or 0) + (pending.nanotower or 0)
					local factoryCount = counts.factory or 0
					-- Nano turrets accelerate the construction that ends a stall:
					-- e-stall assists the fusion/power project and m-stall assists
					-- the metal makers or mexes being raised to fix the deficit.
					local supportPower = eRatio < 0.5 and energyNeed > 0
					local supportMetal = mRatio < 0.6 and metalNeed > 0.15
					local target = factoryCount + (supportPower and 1 or 0) + (supportMetal and 1 or 0)
					if nanoCount < target and mRatio > 0.20 and eRatio > 0.20 then
						if supportPower or supportMetal then
							score = 620
							reason = supportPower and 'accelerate power recovery' or 'accelerate metal recovery'
						elseif mRatio > 0.6 and eRatio > 0.6 then
							score, reason = 250, 'use surplus construction resources'
						end
					end
				end
			end
			if score and score > 0 then ranked[#ranked + 1] = { defID = defID, score = score, reason = reason } end
		end
	end
	table.sort(ranked, function(a,b) if a.score == b.score then return a.defID < b.defID end return a.score > b.score end)
	return ranked
end

return M
