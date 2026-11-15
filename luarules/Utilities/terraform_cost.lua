-- Terraform work is measured at each heightmap vertex relative to the map's
-- original height. Integrating the marginal cost prevents cheap repeated digs.
local TerraformCost = {}

local abs = math.abs
local exp = math.exp
local log = math.log
local HEIGHT_EPSILON = 0.0001

local function isFinite(value)
	return type(value) == "number" and value == value
		and value ~= math.huge and value ~= -math.huge
end

local function numberOption(options, key, default, minimum, maximum)
	local value = tonumber(options[key])
	if not isFinite(value) then
		return default
	end
	return math.max(minimum, math.min(maximum, value))
end

function TerraformCost.Create(options)
	options = options or {}
	local model = {
		doublingHeight = numberOption(options, "mo_terraform_cost_doubling", 10, 1, 1000),
		maxMultiplier = numberOption(options, "mo_terraform_max_multiplier", 32, 1, 1024),
		metalPerWork = numberOption(options, "mo_terraform_metal_cost", 0, 0, 100),
		energyPerWork = numberOption(options, "mo_terraform_energy_cost", 1, 0, 10000),
	}
	local rate = log(2) / model.doublingHeight
	-- The hard limit is the inverse of the same exponential used for work.
	model.maxDisplacement = log(model.maxMultiplier) / rate

	function model.IsHeightAllowed(baseHeight, initialHeight, finalHeight)
		if not isFinite(baseHeight) or not isFinite(initialHeight)
				or not isFinite(finalHeight) then
			return false
		end
		local initial = initialHeight - baseHeight
		local final = finalHeight - baseHeight
		if abs(final) <= model.maxDisplacement + HEIGHT_EPSILON then
			return true
		end
		-- Explosions or map scripts may already be outside the terraform limit.
		-- Allow restoration on that side of the baseline, never further digging.
		return initial * final > 0 and abs(final) <= abs(initial)
	end

	local function outwardWork(from, to)
		return exp(rate * from) * (exp(rate * (to - from)) - 1) / rate
	end

	function model.Work(baseHeight, initialHeight, finalHeight)
		local initial = initialHeight - baseHeight
		local final = finalHeight - baseHeight
		if initial * final < 0 then
			-- Return to the baseline at ordinary cost before deforming the other side.
			return abs(initial) + outwardWork(0, abs(final))
		end
		if abs(final) <= abs(initial) then
			return abs(final - initial)
		end
		return outwardWork(abs(initial), abs(final))
	end

	return model
end

return TerraformCost
