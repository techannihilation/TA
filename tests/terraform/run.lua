-- Run from the repository root: lua5.1 tests/terraform/run.lua
local Fixture = dofile("tests/terraform/fixture.lua")
local Cost = dofile("luarules/Utilities/terraform_cost.lua")
local checks = 0

local function check(condition, message)
	checks = checks + 1
	assert(condition, message)
end

local function near(actual, expected, message)
	check(math.abs(actual - expected) <= 1e-8 * math.max(1, math.abs(expected)),
		(message or "values differ") .. ": " .. tostring(actual) .. " vs " .. tostring(expected))
end

local cost = Cost.Create()
near(cost.maxDisplacement, 50)
near(cost.Work(0, 0, 10), 10 / math.log(2))
near(cost.Work(0, 10, 20), 20 / math.log(2))
near(cost.Work(0, 20, 30), 40 / math.log(2))
near(cost.Work(0, 0, 50), 310 / math.log(2))
near(cost.Work(0, 50, 0), 50, "restoring a wall stays cheap")
near(cost.Work(0, -50, 0), 50, "filling a trench stays cheap")
near(cost.Work(100, 150, 90), 50 + 10 / math.log(2), "crossing the baseline")
near(cost.Work(100, 80, 70), cost.Work(0, 20, 30), "cost uses local original height")

for _, sign in ipairs({-1, 1}) do
	local splitWork = 0
	for height = 0, 49 do
		splitWork = splitWork + cost.Work(123, 123 + sign * height, 123 + sign * (height + 1))
	end
	near(splitWork, cost.Work(123, 123, 123 + sign * 50), "repeated orders cannot discount work")
	check(cost.IsHeightAllowed(123, 123, 123 + sign * 50), "boundary is allowed")
	check(not cost.IsHeightAllowed(123, 123 + sign * 50, 123 + sign * 51), "stacking beyond boundary is rejected")
	check(cost.IsHeightAllowed(123, 123 + sign * 100, 123 + sign * 70), "external deformation can be restored")
	check(not cost.IsHeightAllowed(123, 123 + sign * 100, 123 + sign * 101), "external deformation cannot be deepened")
	check(not cost.IsHeightAllowed(123, 123 + sign * 100, 123 - sign * 70), "cannot cross to another out-of-bounds height")
end

near(Cost.Create({mo_terraform_cost_doubling = "20", mo_terraform_max_multiplier = "8"}).maxDisplacement, 60)
near(Cost.Create({mo_terraform_max_multiplier = 1}).maxDisplacement, 0)
near(Cost.Create({mo_terraform_cost_doubling = "garbage"}).maxDisplacement, 50)
near(Cost.Create({mo_terraform_max_multiplier = math.huge}).maxDisplacement, 50)
near(Cost.Create({mo_terraform_metal_cost = -5}).metalPerWork, 0)
near(cost.energyPerWork, 1)
near(Cost.Create({mo_terraform_energy_cost = "0.5"}).energyPerWork, 0.5)
near(Cost.Create({mo_terraform_energy_cost = -5}).energyPerWork, 0)
near(Cost.Create({mo_terraform_energy_cost = math.huge}).energyPerWork, 1)
check(not cost.IsHeightAllowed(0, 0, 0 / 0), "NaN targets are rejected")
check(not cost.IsHeightAllowed(0, 0, math.huge), "infinite targets are rejected")

-- Mod-option defaults and runtime defaults must agree.
for _, option in ipairs(dofile("modoptions.lua")) do
	if option.key == "mo_terraform_cost_doubling" then near(option.def, cost.doublingHeight) end
	if option.key == "mo_terraform_max_multiplier" then near(option.def, cost.maxMultiplier) end
	if option.key == "mo_terraform_metal_cost" then near(option.def, cost.metalPerWork) end
	if option.key == "mo_terraform_energy_cost" then near(option.def, cost.energyPerWork) end
end

local function segment(points)
	return {points = #points, point = points, area = {}}
end

local function prepared(fixture, height)
	local delayed = VFS.Include("luarules/gadgets/include/terraform_delayed.lua")
	local data = segment({{x = 256, z = 256}})
	delayed.PrepareSegment(data, 1, height)
	return delayed, data
end

-- The actual frozen grid includes slopes and must reject invalid edge points.
local fixture = Fixture.Create()
local delayed, data = prepared(fixture, 50)
local frozen = assert(delayed.FreezeSegments({data}, 1, 100))
near(frozen.work, 310 / math.log(2))
check(delayed.Apply(frozen, false), "permitted job applies")
local writes = fixture.writes
delayed, data = prepared(fixture, 51)
local invalid, reason = delayed.FreezeSegments({data}, 1, 100)
check(not invalid and reason == "displacement", "frozen core cap is authoritative")
check(fixture.writes == writes, "rejected jobs leave terrain unchanged")

fixture = Fixture.Create()
delayed, data = prepared(fixture, 40)
frozen = assert(delayed.FreezeSegments({data}, 1, 10))
local expected = 0
local edgeCount = 0
for i = 1, frozen.count do
	local point = frozen.points[i]
	expected = expected + cost.Work(0, 0, point.finalHeight)
	if point.isEdge then edgeCount = edgeCount + 1 end
end
check(edgeCount > 0, "fixture exercises edge slopes")
near(frozen.work, expected, "edge slopes pay exponential work too")

fixture = Fixture.Create()
fixture.original = function(x) return x == 256 and 0 or -200 end
fixture.ground = fixture.original
delayed, data = prepared(fixture, 50)
invalid, reason = delayed.FreezeSegments({data}, 1, 100)
check(not invalid and reason == "displacement", "legal core cannot force an illegal edge")

fixture = Fixture.Create()
delayed, data = prepared(fixture, 20)
frozen = assert(delayed.FreezeSegments({data}, 1, 100))
frozen.points[1].finalHeight = 60
check(not delayed.Apply(frozen, false), "application rechecks the cap")
check(fixture.writes == 0 and fixture.batches == 0, "application rejects the entire grid atomically")

fixture = Fixture.Create()
fixture.ground = function() return -100 end
delayed, data = prepared(fixture, -70)
frozen = assert(delayed.FreezeSegments({data}, 1, 100))
near(frozen.work, 30, "out-of-bounds restoration costs ordinary work")
fixture.ground = function() return -60 end
check(not delayed.Apply(frozen, false), "stale restoration cannot worsen external terrain beyond the cap")

-- Every user-facing tool goes through the same checks in the real gadget.
for _, tool in ipairs({"Wall", "Area", "Ramp", "Extend"}) do
	fixture = Fixture.Create()
	fixture:LoadGadget()
	check(not fixture:Start(fixture[tool](fixture, 51)), tool .. " rejects excessive deformation")
	check(not fixture:Task() and fixture.writes == 0, tool .. " does not start rejected work")
	check(string.find(fixture.messages[#fixture.messages], "50.0", 1, true), "rejection reports the configured cap")
	check(fixture:Start(fixture[tool](fixture, 20)), tool .. " accepts ordinary deformation")
	fixture:Finish()
	check(fixture.writes > 0, tool .. " completes")
end

fixture = Fixture.Create()
fixture:LoadGadget()
check(fixture:Start(fixture:Wall(-50)), "trench at boundary starts")
fixture:Finish()
check(not fixture:Start(fixture:Wall(-60)), "a second job cannot deepen a boundary trench")
check(fixture:Start(fixture:Area(0, 5)), "restore is allowed")
fixture:Finish()

-- Smoothing may move natural cliff heights far from a point's own baseline.
fixture = Fixture.Create()
fixture.ground = function(x) return x < 256 and 0 or 1000 end
fixture.original = fixture.ground
fixture:LoadGadget()
check(not fixture:Start(fixture:Area(0, 3)), "smooth cannot bypass the local baseline cap")

fixture = Fixture.Create()
fixture.ground = function() return -100 end
fixture:LoadGadget()
check(fixture:Start(fixture:Area(0, 5)), "restore repairs external deformation beyond the cap")
fixture:Finish()

-- Currency is optional and paid only while real work advances.
fixture = Fixture.Create({mo_terraform_energy_cost = 0})
fixture:LoadGadget()
check(fixture:Start(fixture:Wall(20)), "free-metal job starts")
fixture:Finish()
check(fixture.paymentAttempts == 0, "disabling both costs never touches team resources")

fixture = Fixture.Create({mo_terraform_metal_cost = "0.01"})
fixture:LoadGadget()
check(fixture:Start(fixture:Wall(20)), "priced job starts")
local task = fixture:Task()
local quoted = task.metalCost
local frames = task.remainingFrames
check(quoted > 0, "priced job exposes its quote")
fixture:Step(3)
check(task.state == "resources", "insufficient metal pauses work")
check(task.remainingFrames == frames and fixture.spent == 0 and fixture.writes == 0,
	"resource stall causes neither progress, charges nor deformation")

fixture.metal = quoted * 2
fixture.unitX = 0
fixture.unitZ = 0
fixture:Step(2)
check(task.state == "walking" and fixture.spent == 0 and fixture.energySpent == 0,
	"walking costs no resources")
fixture.unitX = 256
fixture.unitZ = 256
fixture.stunned = true
fixture:Step(2)
check(task.state == "paused" and fixture.spent == 0 and fixture.energySpent == 0,
	"stunned builders pay no resources")
fixture.stunned = false
fixture:Step()
check(task.remainingFrames == frames - 1, "replenishing metal resumes progress")
near(fixture.spent, quoted / frames, "one frame pays one share of work")
near(task.remainingMetal, quoted - fixture.spent, "public remaining cost tracks payments")
fixture.metal = 0
fixture:Step(2)
check(task.state == "resources" and task.remainingFrames == frames - 1,
	"a later resource stall preserves completed work")
fixture.metal = quoted
fixture:Finish()
near(fixture.spent, quoted, "completion charges exactly the quote")
local spent = fixture.spent
fixture:Step(3)
near(fixture.spent, spent, "finished jobs do not charge again")

fixture = Fixture.Create({mo_terraform_metal_cost = 0.01})
fixture.metal = 10000
fixture:LoadGadget()
check(fixture:Start(fixture:Wall(20)), "cancelable job starts")
task = fixture:Task()
fixture:Step()
spent = fixture.spent
local canceledEnergy = fixture.energySpent
check(spent > 0 and spent < task.metalCost, "partial work spends only partial cost")
fixture.command = nil
fixture:Step()
check(not fixture:Task() and fixture.writes == 0, "canceling does not apply incomplete terrain")
near(fixture.spent, spent, "canceling charges no unperformed work")
near(fixture.energySpent, canceledEnergy, "canceling charges no unperformed energy")

-- Energy can be used independently, and both resource rates use the same work.
fixture = Fixture.Create()
fixture:LoadGadget()
check(fixture:Start(fixture:Wall(20)), "energy-only job starts by default")
task = fixture:Task()
local energyQuote = task.energyCost
check(task.metalCost == 0 and energyQuote > 0, "default cost is energy with optional metal")
fixture:Finish()
near(fixture.energySpent, energyQuote, "energy-only job charges its exact quote")
near(fixture.spent, 0, "energy-only job never charges metal")

fixture = Fixture.Create({mo_terraform_metal_cost = 0.01, mo_terraform_energy_cost = 0})
fixture.metal = 10000
fixture.energy = 0
fixture:LoadGadget()
check(fixture:Start(fixture:Wall(20)), "energy cost can be disabled independently")
fixture:Finish()
check(fixture.spent > 0 and fixture.energySpent == 0, "disabled energy cost never charges energy")

fixture = Fixture.Create({mo_terraform_metal_cost = "0.01", mo_terraform_energy_cost = "1.5"})
fixture.metal = 0
fixture.energy = 0
fixture:LoadGadget()
check(fixture:Start(fixture:Area(50)), "combined-cost job starts")
task = fixture:Task()
quoted = task.metalCost
energyQuote = task.energyCost
frames = task.remainingFrames
near(energyQuote, quoted * 150, "both quotes scale from the same exponential work")
fixture:Step()
check(task.state == "resources" and task.remainingFrames == frames, "both resources missing pauses work")
fixture.metal = quoted * 2
fixture:Step()
check(fixture.spent == 0 and fixture.energySpent == 0, "missing energy cannot consume available metal")
fixture.metal = 0
fixture.energy = energyQuote * 2
fixture:Step()
check(fixture.spent == 0 and fixture.energySpent == 0, "missing metal cannot consume available energy")
near(task.remainingMetal, quoted)
near(task.remainingEnergy, energyQuote)
fixture.metal = quoted * 2
fixture:Step()
check(task.state == "working" and task.remainingFrames == frames - 1, "both resources available resumes work")
near(fixture.spent, quoted / frames, "metal and energy pay together per work frame")
near(fixture.energySpent, energyQuote / frames)
near(task.remainingEnergy, energyQuote - fixture.energySpent, "public energy remaining tracks payments")
local energySpent = fixture.energySpent
spent = fixture.spent
fixture.energy = 0
fixture:Step(3)
check(task.state == "resources" and task.remainingFrames == frames - 1, "later energy stall preserves progress")
near(fixture.spent, spent, "energy stall does not drain metal")
near(fixture.energySpent, energySpent)
fixture.energy = energyQuote
fixture:Finish()
near(fixture.spent, quoted, "combined job charges exact total metal")
near(fixture.energySpent, energyQuote, "combined job charges exact total energy")
fixture:Step(2)
near(fixture.energySpent, energyQuote, "finished job stops charging energy")

-- Builder time follows weighted work, including the existing one-second floor.
local shortFrames
for _, height in ipairs({10, 50}) do
	fixture = Fixture.Create()
	fixture:LoadGadget()
	check(fixture:Start(fixture:Area(height)), "timing comparison job starts")
	task = fixture:Task()
	local work = task.energyCost -- default energy rate is one per work unit
	near(task.totalFrames, math.max(30, math.ceil(work / (300 * 40) * 30)),
		"duration scales with actual exponential work")
	if height == 10 then
		shortFrames = task.totalFrames
	else
		check(task.totalFrames > shortFrames, "deeper deformation increases real build time")
	end
end

fixture = Fixture.Create({mo_terraform_cost_doubling = 20, mo_terraform_max_multiplier = 8})
fixture:LoadGadget()
check(fixture:Start(fixture:Wall(60)), "mod options change the derived cap")
fixture:Finish()
check(not fixture:Start(fixture:Wall(61)), "the configured cap is still enforced")

print("Terraform regression checks passed: " .. checks)
