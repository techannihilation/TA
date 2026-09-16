-- Pure, deterministic factory planning. All counts include reserved production.
-- No engine access: callers own observation, queue management and reservations.
local min, max, ceil, sqrt = math.min, math.max, math.ceil, math.sqrt
local function clamp(value, low, high) return max(low, min(high, value)) end
local function number(value, fallback)
	if type(value) == "number" then return value end
	return fallback or 0
end
local function capability(value)
	if value == true then return 1 end
	return clamp(number(value), 0, 1)
end

-- Stocks and ongoing income are divided between active factories. This permits
-- streaming construction while preventing one expensive unit consuming the base.
local function budget(state)
	local r = state.resources
	if not r then return math.huge, math.huge end
	local factories = max(1, number(state.factoryCount, 1))
	local share = clamp(number(state.productionShare, state.underAttack and 0.8 or 0.6), 0.1, 1)
	local horizon = number(state.purchaseHorizon, 75)
	local metal = max(0, number(r.metalCurrent) - number(r.metalReserve))
	local energy = max(0, number(r.energyCurrent) - number(r.energyReserve))
	return (metal * 0.65 + max(0, number(r.metalIncome)) * horizon * share) / factories,
		(energy * 0.65 + max(0, number(r.energyIncome)) * horizon * share) / factories
end

local function Choose(options, metadata, state)
	state, metadata = state or {}, metadata or {}
	local counts, enemy = state.counts or {}, state.enemy or {}
	local own = state.strength or counts
	local constructors, scouts = number(counts.constructor), number(counts.scout)
	local combat, raiders = number(counts.combat), number(counts.raider)
	local aa, artillery = number(counts.aa), number(counts.artillery)
	local army = combat + raiders + aa + artillery
	local groundArmy = combat + raiders + artillery
	local airThreat = max(0, number(enemy.air))
	local heavyThreat = max(0, number(enemy.heavy))
	local raiderThreat = max(0, number(enemy.raider))
	local artilleryThreat = max(0, number(enemy.artillery))
	local defenses = max(0, number(enemy.defense))
	local seaThreat = max(0, number(enemy.sea))
	-- Enemy ground includes its heavy/raider/artillery subtypes; do not count twice.
	local groundThreat = max(number(enemy.ground), heavyThreat + raiderThreat + artilleryThreat)
	local totalThreat = max(1, airThreat + groundThreat + defenses + seaThreat)
	local airShare, heavyShare = airThreat / totalThreat, heavyThreat / totalThreat
	local artilleryShare, defenseShare = artilleryThreat / totalThreat, defenses / totalThreat
	local raiderShare = raiderThreat / totalThreat
	local desiredTier = clamp(number(state.desiredTier, 1), 1, 6)
	local builderTarget = max(0, number(state.builderTarget))
	local scoutTarget = max(0, number(state.scoutTarget, 1))
	local highestBuilder = number(state.highestBuilderTech)
	local underAttack = state.underAttack == true
	local metalBudget, energyBudget = budget(state)
	local desiredAA = airThreat > 0 and max(1, ceil(airThreat * 0.7), ceil(army * (0.08 + airShare * 0.38))) or math.floor(army / 14)
	local aaShortage = max(0, desiredAA - number(own.aa))
	local desiredArtillery = max(army * (0.10 + defenseShare * 0.30 + heavyShare * 0.10), defenses > 0 and 1 or 0)
	local desiredRaiders = max(2, army * (0.22 + artilleryShare * 0.22))
	local desiredCombat = max(3, army * (0.58 - airShare * 0.22))
	local bestID, bestReason, bestScore
	for _, defID in ipairs(options or {}) do
		local meta = metadata[defID]
		if meta then
			local role, tech = meta.role, clamp(number(meta.tech, 1), 1, 6)
			local metalCost = max(1, number(meta.metalCost, 100))
			local energyCost = max(0, number(meta.energyCost))
			local affordability = min(1, metalBudget / metalCost,
				energyCost > 0 and energyBudget / energyCost or 1)
			local score, reason
			local armed = meta.isArmed ~= false and (role == "combat" or role == "raider" or role == "aa" or role == "artillery")
			-- Only useful support roles are eligible. An unarmed transport cannot be
			-- selected merely because every combat option was unaffordable.
			if affordability >= (1 / 1.8) and meta.isBuilding ~= true and meta.isFactory ~= true then
				if role == "constructor" then
					local deficit = max(0, builderTarget - constructors)
					local unlock = tech > highestBuilder and tech <= desiredTier
					if deficit > 0 or unlock then
						score = deficit > 0 and (135 + min(35, deficit * 8)) or 104
						score = score + tech * 4 + min(12, number(meta.buildSpeed) / metalCost * 10)
						reason = deficit > 0 and "expand construction capacity" or "unlock tier " .. tech .. " construction"
						if underAttack then score = constructors == 0 and 85 or 18 end
						-- Interleave early rush combat units: don't mass constructors before early army is fielded
						if not underAttack and desiredTier <= 1 then
							if constructors == 1 and army < 3 then score = score - 45
							elseif constructors >= 2 and army < 6 then score = score - 35 end
						end
					end
				elseif role == "scout" then
					if scouts < scoutTarget and not underAttack then
						score, reason = 118 + min(8, number(meta.speed) / 30), "replace reconnaissance"
					end
				elseif role == "rezzer" then
					if army >= 10 and number(counts.rezzer) < math.floor(army / 12) and not underAttack then
						score, reason = 78, "recover battlefield metal"
					end
				elseif armed then
					if role == "combat" then
						score = 67 + clamp((desiredCombat - combat) / (desiredCombat + 1), -1, 1) * 34
						score = score + raiderShare * 20 + heavyShare * 9
						reason = raiderThreat > 0 and "screen against raiders" or "maintain frontline strength"
					elseif role == "raider" then
						score = 58 + clamp((desiredRaiders - raiders) / (desiredRaiders + 1), -1, 1) * 30 + artilleryShare * 35
						reason = artilleryThreat > 0 and "hunt enemy artillery" or "maintain raiding pressure"
					elseif role == "artillery" then
						score = 52 + clamp((desiredArtillery - artillery) / (desiredArtillery + 1), -1, 1) * 38
						score = score + defenseShare * 50 + heavyShare * 15
						reason = defenses > 0 and "break enemy defenses" or "support against heavy units"
						if groundArmy < 3 then score = score - 30 end
					elseif role == "aa" then
						score = aaShortage > 0 and (110 + min(65, aaShortage * 12) + airShare * 20) or 22
						reason = aaShortage > 0 and "counter observed air" or "maintain air cover"
						if airThreat == 0 and aa >= desiredAA then score = -20 end
					end
					-- Player tactics: Early cheap combat/raider rush (Senethril)
					if (role == "raider" or (role == "combat" and metalCost <= 95)) and not underAttack and desiredTier <= 1 then
						if constructors >= 1 and army < 8 then
							local rushBonus = (8 - army) * 8 + max(0, 95 - metalCost) * 0.4
							score = score + rushBonus
							reason = "early rush strike force"
						end
					end
					-- Player tactics: Mobile missile/skirmisher affinity (Hakora)
					if (role == "combat" or role == "raider") and number(meta.maxRange) >= 450 and metalCost <= 160 then
						score = score + min(12, (number(meta.maxRange) - 300) * 0.04)
					end
					-- Player tactics: Standoff missile / artillery battery support (aDarkBlueDiamond)
					if role == "artillery" and army >= 5 and metalCost <= 300 and (counts.artillery or 0) < math.max(1, math.floor(army * 0.25)) then
						score = score + 12
					end
					if underAttack then
						score = score + 24
						if role == "artillery" and raiderThreat > heavyThreat then score = score - 24 end
					end
					-- Prefer suitable weapons within a role, without relying on names.
					local antiHeavy = meta.antiHeavy ~= nil and capability(meta.antiHeavy)
						or clamp(number(meta.antiGround) / max(80, sqrt(metalCost) * 8), 0, 1)
					local splash = clamp(number(meta.aoe or meta.areaOfEffect) / 160, 0, 1)
					score = score + antiHeavy * heavyShare * 26 + splash * raiderShare * 24
					local dps = number(meta.dps, max(number(meta.antiGround), number(meta.antiAir)))
					score = score + min(10, number(meta.health) / metalCost) + min(8, dps / metalCost * 12)
					score = score + min(8, number(meta.maxRange) / 150)
					if meta.canAttackGround == false and role ~= "aa" then score = score - 65 end
					if meta.canAttackAir == false and role == "aa" then score = nil end
					if score and meta.isWater and not meta.canFly and seaThreat == 0 and not state.isWaterMap then score = score - 55 end
				end
				if score then
					-- Tier bonuses are bounded, so cost and counters still matter. T6
					-- combat remains eligible in any factory that actually offers it.
					score = score + min(tech, desiredTier) * 3 - max(0, tech - desiredTier) * 5
					score = score - (1 - affordability) * 55
					local buildSpeed = number(state.factoryBuildSpeed)
					if underAttack and buildSpeed > 0 then
						score = score - min(24, number(meta.buildTime) / buildSpeed * 0.16)
					end
					-- A small diversity bonus breaks repeated selection of one option;
					-- pending unitCounts must be updated by the caller after each choice.
					local copies = state.unitCounts and number(state.unitCounts[defID]) or 0
					score = score - min(12, sqrt(copies) * 2)
					if score > 0 and (not bestScore or score > bestScore or (score == bestScore and defID < bestID)) then
						bestID, bestReason, bestScore = defID, reason, score
					end
				end
			end
		end
	end
	return bestID, bestReason or "save resources for a useful unit", bestScore
end

return { Choose = Choose }
