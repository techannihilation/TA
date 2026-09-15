# TechAI - Tech Annihilation Lua AI for Recoil Engine

This file documents the TechAI subsystem, its dependencies, and its test
harness. It is the primary reference for editing `ai_techai.lua`, the
`luarules/configs/techai_*` modules, and the `tests/techai` suite.

Project facts:

- Game: Tech Annihilation (TechA), six factions ARM / CORE / TLL / TALON / GOK /
  RUMAD.
- Engine: Recoil RTS (Spring fork), target release 2025.06.05.
- The AI is a **synced LuaRules gadget**, not a native C++ AI. It abuses
  `gadget:GameFrame` and `Spring.*` calls the same way a LuaAI would, driven by
  `RegisterAITeam` found through `Spring.GetTeamLuaAI` (e.g. `TechAI: Easy`).
- The AIs are FOW-compliant: enemy information is only ever used when it was
  observed (LOS or radar contact), and intel decays.

## Layout of the subsystem

```
luarules/gadgets/ai_techai.lua          -- main gadget (2861 lines, all logic)
luarules/configs/techai_metadata.lua    -- unit metadata enrichment (roles, tiers)
luarules/configs/techai_builder.lua     -- engine-facing builder scheduler
luarules/configs/techai_economy.lua     -- pure builder demand scoring
luarules/configs/techai_production.lua  -- pure factory unit selection
luarules/configs/techai_layout.lua      -- base zoning / factory clearance
luarules/configs/techai_metal.lua       -- metal map rescan around spawns
luarules/configs/techai_geo.lua         -- geothermal vent collector (pre/post-start)
luarules/gadgets/geo_spot_finder.lua    -- publishes GG.geoSpots before+after start
luarules/configs/maker_defs.lua         -- metal maker capacities (shared with game)
luarules/configs/morph_defs_techa.lua   -- morph definitions (shared with unit_morph)
tests/techai/                           -- Lua 5.1/LuaJIT regression harness
```

Dependency graph (configs are pure and reusable; only the gadget talks to the
engine):

```
ai_techai.lua
 ├─ techai_metadata.lua   (VFS.Include line 273, exposed as Metadata)
 ├─ maker_defs.lua        (line 274, guarded by FileExists)
 ├─ techai_metal.lua      (line 277, MetalScanner)
 ├─ techai_layout.lua     (line 291, BaseLayout = Create(UnitMetadata, aiTeams, GetMetalSpots, GetGeoSpots))
 ├─ morph_defs_techa.lua  (line 625, guarded by FileExists)
 ├─ techai_builder.lua    (line 1859, BuilderPlanner = Create({metadata, threat, layout, metalSpots, basePosition, safePosition}))
 └─ techai_production.lua (line 2257, ProductionPlanner)
techai_builder.lua
 └─ techai_economy.lua    (VFS.Include at top, used in Manage)
geo_spot_finder.lua
 └─ techai_geo.lua        (VFS.Include at top, GeoScanner)
```

Cross-gadget contracts (see "Inter-gadget contracts" below):

- `mex_spot_finder.lua` publishes `GG.metalSpots`.
- `geo_spot_finder.lua` publishes `GG.geoSpots` / `GG.geoSpotsByPos` and
  `_G.geoSpots` — a pre-game pass in `Initialize` plus post-start re-merges at
  `GameFrame` 1 and 180 (maps/gadgets may surface vents in GameStart, the same
  window in which some maps write their metal).
- `game_energy_conversion.lua` owns team rules params `mmLevel`, `mmUse`,
  `mmCapacity`, `mmAvgEffi`.
- `unit_morph.lua` publishes `GG.MorphInfo` and also reads
  `morph_defs_techa.lua`.

## ai_techai.lua: structure (by line range)

Line numbers are for the current file (2861 lines, rev. 2026-09-15, after the
zoning + builder judgement + industrial expansion + intel hints pass, the
builder-drift + build-power gate + storage + hint turrets + worker morphing
pass, the geothermal point detection + layout pass, and the September 15
infolog crash-fix pass).

- **1-107** Header, `gadget:GetInfo()`, synced-only guard, local aliases for the
  `Spring.*` API surface used (the fixture in `tests/techai/fixture.lua` must
  keep providing every one of them), CMD constants (`CMD_MORPH = 31410` came
  from `unit_morph.lua`), sector math (SECTOR_SIZE 512), and globals
  `aiTeams` / `aiTeamList` / `aiTeamCount`.
- **109-197** `GiveTacticalOrder` (tactical orders are deduplicated while the
  destination is stable to avoid restarting pathfinding; idle units may not
  resume a cached order) and `IsUnitReady`. DIFFICULTY presets are defined at
  141-193.
- **198-271** `CreateFactionCatalog()` and `FactionUnitCatalog` — one catalog
  per faction with role buckets: commanders, t1-t5 mex, t1-t5 factories (+
  t1kbot/veh/air/sea/hov split), t1-t5 constructors, energy (wind/solar/tidal/
  geo + t1-t5), t1-t5 makers, t1-t5 nanotowers, defenses, radar, aa, scouts,
  raiders, combat, artillery, t4/t5 combat, rezUnits.
- **273-307** Config includes listed above. `GetMetalSpots()` returns
  `discoveredMetalSpots` when the rescan ran, otherwise `GG.metalSpots` /
  `_G.metalSpots`; `GetGeoSpots()` reads the live `GG.geoSpots` /
  `_G.geoSpots` (never cached — `geo_spot_finder.lua` merges post-start vents
  into it). `spGiveOrderToUnit` is wrapped so every successful build
  order (<0 command with params[1]/[3]) calls `BaseLayout.Reserve`.
  `metalRescanDone` / `nextMetalScanFrame` are the rescan wires.
- **308-612** `InferFaction` (name prefix wins: rumad/gok/talon/tll/core/arm,
  fallback `customParams.faction`), `DetermineTechLevel` (name heuristics),
  `CatalogUnits()`: walks `UnitDefs`, calls `Metadata.Enrich` once per def into
  `UnitMetadata[defID]` and fills the faction catalogs. Buildings that carry
  `metalStorage`/`energyStorage` classify as role `storage` with
  `storageKind`/`storageAmount` (both here and in the `HandleUnitCreated`
  fallback role inference).
- **619-651** `RawMorphDefs` include and `InitMorphTable()`: builds
  `UnitMorphTable[srcDefID]` with `{into, intoName, xp, metal, energy, tech,
  time}`. Morph costs default to `(dstCost - srcCost) * 1.25` (min 50/200).
- **654-684** `SectorGrid` (recon sectors of 512 elmos) and `InitMetalMap()`
  which counts metal spots per sector (also re-run after rescan).
- **695-927** Intel & placement helpers:
  - `IsMorphingCommander` reads unit rules param `"Morphing"`.
  - `RecordEnemyBuildingInLOS` (records observed building intel + updates
    `ai.intel.hints`), `PurgeIntelIfMissing` (default 90 frames),
    `PickBestReconTarget`.
  - `FindSafeBuildPosition` with a `base` branch to `BaseLayout.Find` when ai is
    given (it is called with 6 args from all manager paths).
  - `FindBaseExpansionBuildPosition` / `FindSafeCoreBuildPosition` both forward
    to `BaseLayout.Find`.
  - `GetClosestFreeMexSpot(ai, ux, uz, maxDist, centerPos, defID)` — grid-keyed
    spot reservation, LOS+build check, 64-elmo occupancy guard.
  - `ai.intel.hints` is initialized here on team registration as
    `{tech=0, kinds={}, seen={}, frame=...}` — aggregated enemy contact mix
    (`tech` = highest observed tier, `kinds` = observed subclass counts,
    `seen` = observed defIDs). The AI may plan against hinted unit kinds as if
    they were real (see `productionEnemy`/`UpdateIncomingThreatProfile`).
- **929-1119** `ExecuteCommanderOpeningQueue(ai, builderID, udef, teamID)` --
  the single opening shift-queue: find T1 mex/energy(T1, wind vs solar)/factory
  (70% kbot / 30% veh), tent two closest mex within 420-450 elmos of spawn,
  then energy, mex2, energy2 (if solar) and the first factory. **Defers when
  `#GetMetalSpots()==0`** (`return false`, line 923) — this is the hook the
  post-spawn rescan retries later. Sets `openingSequenceQueued`.
- **1121-1461** "BARb" tactical systems: `GetThreatAtPosition`, `UpdateFrontline`,
  `ManageEnergyConverters` (sets `mmLevel` team rules param, not ONOFF),
  `ManageRetreatAndRepair`, `ManageRaiders`, `ManageArtillery`,
  `FindNearbyRezUnit`, `ManageUnitMorphs` (candidates: commander, combat,
  nanotowers, constructors/rezzer; gates: 60-frame throttle, one active target,
  `goodCost` = income*30 headroom + 10% storage retained after paying, morph
  tech requirement vs `maxFactoryTier`, and workers only surrendered while
  another builder/tower remains — nanotowers skip during an open stall, combat
  must be fully idle, constructors not mid-task; reserves metal/energy, issues
  the per-entry morph command from `GG.MorphInfo`).
- **1463-1693** `HandleUnitCreated` — idempotent unit registration. Commander
  branch records `ai.spawnPos` and `ai.metalScanFrame = currentFrame + 90`
  (sets the global `nextMetalScanFrame` to the earliest one, line 1490-1492),
  detects water maps (`cy < 0`), and queues the opening if new. Factory branch
  records the first rally point to map center. Classifies units into role lists
  from `UnitMetadata[defID].role`.
- **1695-1862** `RegisterAITeam` (difficulty from name in aiTypeStr: easy/
  hard-cheater-brutal/med-normal; default NORMAL; seeds `ai.intel.hints`),
  `GetAITypeForTeam`, and `ScanAndRegisterAITeams` (via `GetTeamList`+
  `GetTeamLuaAI`). Registers any pre-existing team units.
  `BuilderPlanner = techai_builder.Create(...)` at 1859.
- **1864-2182** `ManageBuilder` — the business logic driver. Seeds a
  `BuilderPlanner.Refresh(ai, teamID, frame)` economic snapshot once per cycle,
  builds ranked options via `Economy.Rank`, then tries top-12: mex (free spot or
  upgrade own lower-tier extractor via RECLAIM+rebuild, one upgrader per site),
  energy/converter/factory/defense/aa/radar/nanotower placement via BaseLayout
  + `Allowed` + spot reservation; repairs unfinished buildings first, reclaims
  metal-rich LOS features when metal < 40% of storage, else guards the first
  factory. `ai.builderTasks[builder]` tracks the current job (reasons:
  `assist`, `energy emergency`, `metal expansion`, `upgrade metal extraction`,
  `finish existing investment`, `support production`, ...).
- **2184-2255** `UpdateIncomingThreatProfile` — aggregates LOS/radar observed
  enemy counters into `threatProfile{air, heavy, raider, artillery, sea}` with
  aging (lastScanFrame). Hidden units never count. **Preemptive factory hints**:
  for each known enemy factory still in memory, every product it can build
  (`UnitMetadata[defID].buildOptions`, factory older than ~1800 frames) adds
  +0.5 to the matching `enemy[kind]` (and +0.5 to `enemy.ground` unless the
  product is air or a defense), so the AI starts hardening against a factory's
  products before any of them are seen; LOS contacts also accumulate into
  `ai.intel.hints` and leak into `ai.productionEnemy` for the production module.
- **2259-2337** `GetProductionSnapshot` + `ManageFactory` — reads compressed
  build queues (`GetFullBuildQueue`, depth tally), tracks pending reservations,
  calls `ProductionPlanner.Choose`, and issues one unit at a time; T3+ factories
  keep a one-unit queue; rallies the factory. Constructor budget is now
  income/queue-driven instead of a fixed per-factory cap
  (`builderTarget = max(2, min(difficulty.maxBuilders*3,
  2+floor(metalIncome/12)+floor(#unfinished/4)))`, line 2307) — the old
  "10 builders per factory" limit is gone.
- **2339-2487** `ManageMilitaryForces` — wave assaults (`squadSize` from
  difficulty, `lastAssaultFrame`), base defense responders (only ~3 nearest),
  protection of retreating units against strategic orders.
- **2490-2559** `ManageResourceCheating` — Medium/Hard `AddTeamResource` income
  bonuses scaled by game time up to `cheatFlatMetalMax` etc. Easy: none. Income
  reads are sanitized to finite values and injections re-check finiteness
  (wiped teams report inf income from `GetTeamResources`; the old code raised
  `spAddTeamResource ... got +-Inf` errors — September 15 fix).
- **2560-2699** Gadget entry points:
  - `Initialize()`: CatalogUnits, InitMorphTable, InitMetalMap,
    ScanAndRegisterAITeams.
  - `GameStart()`: InitMetalMap (again) + ScanAndRegisterAITeams (spawn teams
    may only be known now).
  - `GameFrame(n)`: (a) fail-safe registration loop — on `n%60==0` re-scan team
    units for teams missing a commander/builders; (b) frame 1 opening trigger;
    (c) **metal rescan block (2610-2630)**: once, when `n >= nextMetalScanFrame`
    and not `metalRescanDone`, runs `MetalScanner.Scan(centers,
    GG.metalSpots...)` storing `discoveredMetalSpots`, calls `InitMetalMap()`,
    then retries `ExecuteCommanderOpeningQueue` for every commander that is
    still `not openingSequenceQueued and factoryCount == 0`; (d) per AI team:
    resource cheat, faction determination, `PurgeIntelIfMissing`,
    `UpdateIncomingThreatProfile`, `GetProductionSnapshot`,
    `BuilderPlanner.Refresh`, `ManageUnitMorphs`, then all `manageBuilder`s (if
    `IsUnitReady`), all `manageFactory`s, then `UpdateFrontline`,
    `ManageEnergyConverters`, `ManageRetreatAndRepair`, `ManageRaiders`,
    `ManageArtillery`, `ManageMilitaryForces`. The whole per-team body runs on
    `n % ai.difficulty.orderDelay == (i*3) % orderDelay`.
  - Backwards-compatible `GetTeamInfo` handling (table vs magic numbers,
    `select(6, ...)` for allyTeam).
- **2701-2861** Callbacks:
  - `UnitCreated` (lazy team registration via `GetAITypeForTeam` then
    `HandleUnitCreated`), `UnitDestroyed` (removes unit from every role list,
    clears `claimedSpots` for destroyed mexes, releases morph reserves, and
    clears `microUntil`/`factoryChoices`/`mexUpgrades` entries),
    `UnitDamaged` (records LOS attacker contact — truncates `spGetTeamInfo`
    through a local first; `select(6, ...)` in argument position forwarded the
    engine's extra team-color returns into `spGetUnitLosState`'s boolean
    `ignoreAllied` slot and errored on every damage event, September 15 fix),
    `UnitGiven`/`UnitTaken`
    (re-register for the new owner), `UnitEnteredLos` (records building intel +
    contact), `UnitEnteredRadar` (radar blip grid, 64-elmo cells), `GameOver`.

## Config modules

### techai_metadata.lua (170 lines)
`Metadata.Enrich(defID, udef, meta, weaponDefs, makerDefs) -> meta`.

- Tier: explicit `customParams.techlevel/tech_level/tier` (1-6), else tooltip /
  human name (`tech level N`, `t[N]`), else `factoryTiers` (ashipyardlvl3=5,
  *_ulab=4, *_elab=3, etc.), `specialTiers` (armarch, talon_independence,
  gok_squid, core_core = 6), else `nanotc[1-4]` mapping to 2..5. Factories are
  capped at T5.
- Weapon scoring: iterate `udef.weapons`, skip shields/interceptors; targets
  from `onlyTargets`/`onlyTargetCategory` (string or table, lowercased);
  compute `canAttackAir`, `canAttackGround`, `isArmed`, `maxRange` (no
  shield/interceptor range), AoE, and `antiAir`/`antiGround` DPS.
- Output: `energyOutput` = energyMake - upkeep (+ wind/tidal scaled to map
  average), `metalOutput`, converter via `makerDefs[defID]` (`c` drain, `e`
  efficiency, role='converter').
- `classifyConstructor`: role 'constructor' unless the unit is mine-only =>
  `role='minelayer'` with `canBuildEconomy=false`. A mix of mines + any real
  economy/production/support build option stays a constructor (this is tested
  against real menus in `metadata.lua`).

### techai_builder.lua (238 lines)
`M.Create(api)` where `api = {metadata, threat(ai,x,z), layout, metalSpots,
basePosition, safePosition}`. Returns `{Refresh, Manage}`.

- `Refresh(ai, teamID, frame)`: cached per frame. Snapshot `state` containing
  `resources` (metal/energy: current minus `ai.reservedMetal/Energy`, storage,
  income, expense), role `counts`, `pending` (roles with in-progress jobs),
  `committedMetal/Energy` (shared budgets for unfinished + pending production +
  active builder jobs), `incomingEnergy` (from unfinished + jobs), `factoryUtilization`
  (active/total, where active means a real build queue, not a rally point),
  `unfinished` list, `hasMetalSpots`, `unusedConverterCapacity` = built
  converter drain minus team `mmUse`, `enemyPressure` from threatProfile.
  Storage decision inputs: `fullFrames` (per-frame counter kept in
  `ai.fullFrames`, reset when a resource drops below 0.9 of storage) and
  `storageCap` (sum of `storageKind`/`storageAmount` of built storages).
  Turret decision inputs: `defenseGround` (hints.kinds ground/raider/artillery/
  defense/sea + threat heavy/raider), `defenseAir` (kinds air + threat air),
  `hintTech` (highest hinted tech).
- `Manage(ai, builder, defID, teamID, allyTeamID, frame)`: keeps a builder on
  GUARD/PATROL/FIGHT/REPAIR-assist jobs only if demand unchanged, else chooses
  the top-12 ranked build options. Mex handling (`freeMex`) uses 32-elmo grid
  keys shared across ally AIs (`sharedSpots[ally..':'..key]`) and own
  `ai.claimedSpots[key]` (expire after 1800 frames), bounded to
  `ai.maxCommanderDist` (1100) for the commander. Replacement upgrade of own
  extractors is limited to one active `ai.mexUpgrades[id]` per site. Non-mex
  placements use `basePosition` -> `safePosition`, `Allowed` checks at threat
  <250, physical spacing conflict retries, and reserve via `S` wrapper plus
  `api.layout.Reserve`. Falls back to REPAIR nearest unfinished when no ranked
  build was viable, RECLAIM features when metal-scarce, GUARD first factory.

### techai_economy.lua (122 lines)
Pure `M.Rank(options, metadata, state)` -> sorted `{defID, score, reason}`.
Budget horizon: factory 60, else 35 frames (0.7x income), plus committed
deduction; energy-critical keeps cheap recovery possible even under a committed
expensive fusion. Roles scored: energy (emergency 1100 / demand 650 +
output-per-metal), mex (400+) unless critical or spotless maps, converter (only
with >=55% energy ratio and `surplus >= drain*1.15`; forces energy first when no
spots), factory, storage (tiered, see below), defense/aa (hint-driven, see
below), radar (<1), nanotower.
Deterministic.

Factory scoring (industrial expansion): bootstrap 1000 for the first factory,
else `390+45*tech` with `+90` for a higher tier. A factory votes when
`pending.factory < allowance = max(1, floor(m.income/50))` AND any of: first
factory, a strictly-higher tech tier, an overwhelmed existing factory
(`factoryUtilization>=0.75` with m/e ratios >=0.35), a rich economy
(`m.income>=45` with ratios >=0.5 and energy not constrained), or a
`previousTier` back-fill (tech one below `maxFactoryTier`, so after jumping to
T2 the AI back-fills its T1 industrial base). Same-tier duplication is
throttled by the allowance gate; `-200` when the energy budget is tight. No
fixed "N factories" cap. Expansion/duplication votes (busy/rich/previous-tier)
also require `constructor+commander+nanotower+rezzer >= factoryCount` — build
power must exist to staff each duplicated factory; tier progression and the
first factory are never gated.

Storage scoring (tiered reserves): only after `fullFrames[kind] >= 300`
sustained near-full frames and a factory exists (`maxFactoryTier>=1`), capped
at two storage units, gated to `tech <= maxFactoryTier+1` and to a capacity
target of `income*180` (`storageCap[kind] < target`), with tier-1 preferred
(score `300 + 30*have==0 - (tech-1)*12`). Metal and energy storages are
selected independently by which resource is full.

Defense/aa scoring (hint-driven): `threat = role=='aa' and defenseAir or
defenseGround`; only ranked when `threat>0`, capped at `min(6,threat)` per
role, tech ceiling `<= hintTech+1`, tier-diff penalty `(tech - max(1,hintTech))*12`.

Nanotower scoring (stall tactics): target = factory count + 1 if e-stalling
(`eRatio<0.5` with energy need) + 1 if m-stalling (`mRatio<0.6` with metal
need); builds nano towers up to that target (score 620 "accelerate
power/metal recovery") while a stall is active, and only in surplus
(`mRatio>0.6 and eRatio>0.6`) falls back to spare-capacity construction
(score 250). Building requires `mRatio>0.20 and eRatio>0.20` so towers never
deepen a stall.

### techai_production.lua (148 lines)
Pure `M.Choose(options, metadata, state)` -> bestID, reason, score.
`budget(state)` = `(metal*0.65 + income*horizon*share)/factoryCount`, share 0.6
(0.8 under attack). Desired ratios: AA from air threat share, artillery from
defense/heavy share, raiders from artillery share, combat remainder. Support
roles: constructor (deficit or tech unlock <= desiredTier), scout (if
< scoutTarget and not under attack), rezzer (army >= 10, < army/12). Armed unit
scoring adds anti-heavy, splash, DPS/cost, health/cost, range; affinity
penalties for air-only AA, wrong-water, and affordability `(1-affordability)*55`
(denied when affordability < 1/1.8). Diversity: `-min(12, sqrt(copies)*2)`.
Tier term `+min(tech,desiredTier)*3 - max(0,tech-desiredTier)*5` keeps cost and
counters relevant; T6 combat remains eligible. Does not mutate state.

### techai_layout.lua (199 lines)
`M.Create(metadata, teams, metalSpots)` -> `{Allowed, Reserve, Find, Refresh}`
and exports `Bounds`, `Lane`, `Overlap` for the tests. CELL=384. Footprints in
8-elmo build squares: `bounds(def,x,z,facing,padding)` (padding stays **12**, so
buildings keep a small gap and the 384-cell district boundaries stay stable);
factories also reserve an exit `lane` (256 elmos long, widened to the largest
produced unit + 32; `facing%2` swaps x/z). `Allowed` verifies map bounds (16
margin), district homogeneity (each 384-cell the footprint touches must still
be for the same category, or untagged; cells are tagged
energy/converter/factory/defense/support by existing structures and reserved
plans — mex is excluded from tagging on purpose), factory lane in-bounds, metal
patch clearance (spots must stay buildable before extractors exist), and
overlap checks against live allied structures and shared plans.

Dense zoning: `Refresh` (every 30 frames, 2800 radius) additionally tags each
allied structure record with `cat` (kind of building) and `own` (same team),
and computes `layout.zones[cat]={x,z}` — the centroid of the team's own
structures plus reserved plans per category, snapped to the 16-elmo grid. It
also drops plans whose build command left the builder queue (removes the plan,
which lowers the zone centroid again). `Find` reuses a matching district (pass
1) or allocates a fresh one (pass 2) by walking rings step 64 with
`steps=max(8,floor(2πr/128))`, anchored at `layout.zones[category]`
(or spawnPos) instead of the base center — so new buildings of a category pack
tightly against that category's existing cluster, while the 384-cell tags in
`Allowed` keep the zones homogeneous. **Every ring is capped at 1152 elmos from
the commander spawn and an outlying category centroid is pulled back toward it,
so a distant parking spot can never drag subsequent construction (and the
builders who must reach it) away from the base.** Sector/region keys are always
relative to `ai.spawnPos`. Facing gate: `lastFacing = def.isFactory and 3 or 1`
(factories try all 4 rotations, non-factories 0..1). `Reserve` stores `cat` per
plan and tags cells so planned districts don't collide. `kind()` maps
`storage` to its own zone so reserves cluster together.

### techai_metal.lua (217 lines)

`MetalScanner`:
- `Scan(spawnPositions, existingSpots)`: copies existing spots, then (if
  `Spring.GetMetalAmount` exists) samples a 900-radius disc around every spawn
  at 16-elmo cells, floodfills 8-neighbour components (capped width 256, cells
  1024), and emits one spot per patch at the metal-weighted centroid, rounded to
  8. Merge distance 64.
- `Start(existingSpots)` / `Step(job, maxCells)`: streaming whole-map scanner
  using a two-row union-find (`root`/`union`), so a giant continuous field
  doesn't need a giant cell list or a final flood pass. Returns `job.spots`
  when `done`.

### techai_layout.lua geothermal placement

Geo spots reach `BaseLayout.Create` as a fourth argument (`geoSpots` getter,
wired from `ai_techai.lua` line 291). `Allowed` rejects **any** non-`needGeo`
building placed within 40 elmos of a listed vent; `needGeo` plants may occupy
their own vent. `Find` for a `needGeo` unit probes vents closest to the anchor
inside the base radius (1152), offsets `-32..32` step 16 across facings
`0..lastFacing`, returning the first cell with `TestBuildOrder > 0` — so vents
beyond the base radius are deliberately skipped (they would drag builders away),
and every vent within reach keeps a reserved slot for its plant.

### techai_geo.lua (45 lines)

`GeoScanner`:
- `Scan(existingSpots)`: deep-copies the caller's spots (never mutates), then —
  when `Spring.GetAllFeatures` / `FeatureDefs[defID].geoThermal` exist — walks
  every feature whose def has `geoThermal` and adds `{x, y=midPos y, z,
  defID=featureDefID, name=FeatureDefs[defID].name}` at 8-rounded positions.
  New vents merge into the copy by 64-elmo distance (spawn-facing iteration
  order wins), others are preserved unchanged. Degrades to a pass-through when
  geometry data is absent (test harness without feature stubs).

### geo_spot_finder.lua (65 lines)

Shared synced gadget: `Initialize()` runs the first `GeoScanner.Scan` **before
game start**; `GameFrame` re-scans again at frames 1 and 180 (the same window
in which maps may surface vents and `mex_spot_finder` writes its spots), then
removes the callin. Publishes `GG.geoSpots` (array), `GG.geoSpotsByPos`
(16-elmo grid index) and `_G.geoSpots` so the pre-game snapshot survives the
GG retire.

### maker_defs.lua (69 lines)
`UnitDefNames.<id> -> { c = drain, e = efficiency }`. T1 ~45-250 drain,
efficiency ~0.8-1.4% ; lvl4/lvl5 up to 192K-300K drain. Also included by game's
energy-conversion gadget? No — TechAI re-derives `converterDrain/metalOutput`
from this table; `game_energy_conversion.lua` uses its own config. Keep the two
in sync when balancing converters.

### morph_defs_techa.lua (842 lines)
Morph table shared with `unit_morph.lua` (`include("LuaRules/Configs/morph_defs_techa.lua")`).
Each key is `src unit name` -> either a single morph `{into=.., time=..}` or a
list of alternatives `{{into=..}, {into=..}}`. Optional fields: `require`,
`metal`, `energy`, `xp`, `rank`, `tech`. `devolution` flag at top is disabled;
the block at the bottom adds reverse morphs only when true. Commander chains
(armcom->..1->..2->..3, etc.) and econ/factory conversions are tuned here —
editing this file changes BOTH the player morph gadget and the AI's morph plan.

## Inter-gadget contracts

- **`GG.metalSpots`** — array of `{x,y,z}` published by `mex_spot_finder.lua`
  (line 120). TechAI reads it via `GetMetalSpots()`. Because some maps write
  their start deposits in `GameStart` (e.g. Techno Lands) — after the finder
  already ran — TechAI performs its own `MetalScanner.Scan` around each known
  spawn once, ~90 frames after the first commander registers
  (`nextMetalScanFrame`), caches the result in `discoveredMetalSpots`, then
  retries any deferred opening. Do not publish TechAI's private list back into
  `GG.metalSpots` (it would duplicate mexes on other AIs/widgets).
- **`game_energy_conversion.lua`** — team rules params `mmLevel` (0..1 reserve
  fraction the converter keeps in storage) and `mmUse` (current draw). TechAI
  sets `mmLevel` from `ManageEnergyConverters` and reads `mmUse` in
  `techai_builder.lua` Refresh to compute `unusedConverterCapacity`. Changing
  one without the other breaks the converter flow.
- **`unit_morph.lua`** — publishes `GG.MorphInfo` (`GG.MorphInfo[srcDefID][dstDefID] = cmdID`,
  `GG.MorphInfo.CMD_MORPH_BASE_ID` (=31410), `GG.MorphInfo.CMD_MORPH_STOP_BASE_ID`,
  `GG.MorphInfo.MAX_MORPH`). TechAI uses `CMD_MORPH=31410` and the per-entry
  cmdID from `GG.MorphInfo` when issuing morph orders; it reads the
  `"Morphing"` unit rules param; it reserves cost while morphing
  (`ai.reservedMetal/Energy`, `ai.activeMorphTarget`, `ai.pendingMorphUnits`).
- **`comDefIDs.lua`/`nanoDefIDs.lua`** — used by other gadgets; TechAI does not
  depend on them directly (its commanders are identified by role metadata).

## Unit role / metadata conventions

`UnitMetadata[unitDefID]` (built once by `CatalogUnits` at load, enriched by
`Metadata.Enrich`) contains at least: `faction`, `role`, `tech`, `isWater`,
`metalCost`, `energyCost`, `buildTime`, `health`, `speed`, `isArmed`,
`canAttackAir`, `canAttackGround`, `maxRange`, `areaOfEffect`, `antiAir`,
`antiGround`, `energyOutput`, `converterDrain`, `metalOutput`, `isFactory`,
`canBuildEconomy`, `canResurrect`, `isCommander`.

Roles: `commander`, `factory`, `constructor`, `minelayer` (constructor that
only mines — excluded from buildpower demand), `mex`, `energy`, `converter`,
`nanotower`, `radar`, `defense`, `aa`, `combat`, `raider`, `artillery`, `scout`,
`rezzer`, `unknown`.

The role lists per AI team: `ai.builders` (commanders + constructors),
`ai.factories`, `ai.mexes`, `ai.combatUnits`, `ai.raiderUnits`,
`ai.assaultUnits`, `ai.artilleryUnits`, `ai.aaUnits`, `ai.rezUnits`,
`ai.scoutUnits`, `ai.converters`. `UnitDestroyed` keeps these consistent.

## Test harness (tests/techai)

The suite executes the REAL gadget source under Lua 5.1 or LuaJIT 2.1 with a
deterministic Spring API fixture. It does NOT add hooks to the gadget — the only
test surface is a set of `local`s that `run.py` exports via a trailer appended
to the source chunk:

```
exports = ['aiTeams','UnitMetadata','FactionUnitCatalog','HandleUnitCreated',
 'RegisterAITeam','GetProductionSnapshot','ManageFactory',
 'UpdateIncomingThreatProfile','ManageRetreatAndRepair','ManageMilitaryForces',
 'ManageArtillery','GiveTacticalOrder','PurgeIntelIfMissing','ManageBuilder',
 'GetClosestFreeMexSpot','BuilderPlanner','ManageEnergyConverters','GetMetalSpots',
 'ManageUnitMorphs','UnitMorphTable','GetGeoSpots']
```

Dragging a `Spring.Echo` into the gadget is harmless to the tests (the fixture
stubs `Echo`), but the user directive is that **the gadget must stay free of
Spring.Echo/Spring.Log** — verify with a grep after editing
(`rg "Spring\.Echo|Spring\.Log|Echo\("` should return nothing).

### Running

Install lupa in-game either system-wide or into the in-game runtime:

```
python -m pip install --target .techai-test-runtime lupa   (Python 3.12)
python tests/techai/run.py            # Lua 5.1
python tests/techai/run.py luajit21   # LuaJIT 2.1
```

The environment used during development ships a ready-made runtime at:
`C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe`
(the game fixture is not yet on PATH; call it explicitly and pass `tests/techai/run.py`).

Run order inside `run.py` (each section below re-executes `fixture.lua` + gadget
chunk; fresh LuaRuntime for `regression.lua`, `scheduler.lua`, `rescan.lua`):

1. `regression.lua` (96 asserts) — six factions, opening orders, repeat
   registration idempotency, compressed queues/cross-factory reservations,
   capture lifecycle, LOS-hidden threats, artillery kiting, AA retreat,
   order dedup, stale radar without scouts, builder task preservation,
   reservation expiry, emergency commander retreat, proportional defense,
   preemptive enemy factory-hint enrichment (products of a seen factory leak
   +0.5 into `productionEnemy.*` and hints are only clocked when observed),
   storage role classification, morph gating (energy cost headroom,
   reservation capture, tech-base gate, constructor never surrendered as the
   only remaining worker, supported constructor morphs), `UnitDamaged`
   attacker-contact recording through the engine-like 7-value `GetTeamInfo` +
   strict `GetUnitLosState` stubs, and non-finite resource-cheat sanitization
   driven by a real `GameFrame` with inf income.
2. `stall.lua` (56) — eight teams post-opening factory/energy/second-mex,
   inherited FIGHT rally on constructors, real GameFrame scheduler visits all
   teams. Reproduces the old `nil Z coordinate` and tactical timestamp crashes.
3. `demand.lua` (57), `production.lua` (29), `metadata.lua` (77) — pure modules
   + real unit files (uses `units/*.lua`, `maker_defs.lua`, real build menus).
   `demand.lua` drives the industrial expansion matrix (saturated T2 base
   back-fills T1, build-power gate needs a constructor present, affordability
   gate throttles a pending factory, rich/surplus same-tier duplication), the
   nanotower stall-support matrix (e-stall / m-stall towers scored, redundant
   tower cap, surplus-only when ratios >0.6), the tiered storage matrix
   (sustained near-full 300-frame window, metal/energy kind selection, two-unit
   cap, tier-1 preference, capacity target `income*180`, factory-required) and
   the hint-driven turret matrix (ground/air threat separation, tier follows
   `hintTech`).
4. `metal.lua` (19), `layout.lua` (66), `geo.lua` (10) — metal scanning module +
   layout zoning/lanes/find (Find capped at 1152 elmos from spawn so a drifting
   category centroid can never walk builders far from the base; vents beyond the
   radius are skipped and vents inside are freed from other construction), and
   the GeoScanner module (preserves caller spots, 64-elmo merge, geoThermal defs,
   pass-through without feature stubs).
5. `scheduler.lua` (19) — shared builder scheduler on one live team.
6. `rescan.lua` (34) — post-spawn metal rescan integration: empty deposit map at
   spawn (all openings defer), publish deposits, advance past `metalScanFrame`,
   assert every commander queues its mex and flips `openingSequenceQueued`, and
   that the scan never re-runs.
7. `geo_gadget.lua` (8) — executes the REAL `geo_spot_finder.lua` source in a
   fresh runtime: `Initialize` publishes the pre-game scan, `GameFrame(1)`
   merges `GG.geoSpots` + `GG.geoSpotsByPos` + `_G.geoSpots`,
   `GameFrame(180)` merges a third vent, later frames are no-ops (callin
   removed).

Total: **471 assertions** on both runtimes.

### Fixture essentials (fixture.lua)

- `Game = {mapSizeX=8192, mapSizeZ=8192, maxUnits=32000}`; `CMD` subset
  (incl. `MORPH=31410`, matching `unit_morph.lua`).
  `GG.metalSpots` pre-seeded with 16 spots (2 per team at start positions);
  `GG.geoSpots` pre-seeded with one distant vent at (400,7800) so the live
  getter is non-empty while layout tests only see vents they inject.
- 8 teams, factions arm/core/tll/talon/gok/rumad/arm/core; each has com(1),
  mex(2), solar(3), lab(4), constructor(5), tank(6), scout(7), flash(8),
  arty(9), antiair(10), nanotc(11, building constructor), mstor(12,
  `metalStorage=2000`), estor(13, `energyStorage=2000`) — def IDs
  `team*100 + n`.
- `Spring` stubs: no `GetMetalAmount`/`GetMetalMapSize` (so `MetalScanner.Scan`
  only copies the existing spots — used to prove the rescan keeps them and adds
  discovered ones), `GetTeamResources` returns `resources.metal/energy` tables,
  `GiveOrderToUnit` records into `orders` + `queues` (non-shift clears), no
  terrain (ground 0, `TestBuildOrder` = 2, LOS on by default). Engine-mirroring
  strictness (September 15): `GetTeamInfo` returns SEVEN values (the 7th is a
  team-color number, like the live engine), `GetUnitLosState` asserts its
  argument types (`boolean expected, got number` otherwise), and
  `AddTeamResource`/`SetTeamResource` reject non-finite amounts, recording
  injections into the global `injected` list.
- `units` keyed by ID with `{def, team, x, z, hp, progress, los}`;
  `addUnit(id, def, team, x, z, hp, progress)`.

## Rules of thumb when editing

- **Preserve pure separation**: `techai_economy`/`techai_production` are the
  only files allowed to be engine-free. Builder placement/orders stay in
  `techai_builder.lua`; engine reads/writes in the gadget only.
- **FOW discipline**: never plan against enemy data that did not come from
  `UnitEnteredLos`/`UnitEnteredRadar`/`UnitDamaged` observers, and always decay
  it (`PurgeIntelIfMissing`).
- **Multi-value returns**: never write `cond and A(...) or B(...)` for functions
  returning more than one value; use explicit branches (the September stall fix).
  Never pass `select(n, ...)` directly as a call argument — it forwards every
  value from n on; truncate through a local first (the September 15
  `UnitDamaged`/`GetUnitLosState` error storm).
- **Positions for build commands** must always be numbers on all four slots
  (x, y, z, facing), including shift-queue shift commands — the fixture asserts
  this and the live engine crashes otherwise.
- **Shared economy snapshot**: `BuilderPlanner.Refresh` returns the state cached
  for that frame and team; don't mutate it.
- **Claim keys**: mex claims are `math.floor(x/32)..'_'..math.floor(z/32)`;
  layout plans are `builder..':'..defID..':'..x..':'..z`. Keep the key schemes
  in sync between the gadget, `techai_builder.lua` and `techai_layout.lua`.
- **Don't add Echo/logging** (see above). If debugging is needed, use the
  failed units' build orders (`orders`/`queues`) and `ai.builderTasks` in the
  test fixtures, or `infolog.txt` via LuaAI errors rather than Echo.
- **Run the suite** after any change to the gadget or config modules:
  both `python tests/techai/run.py` and `python tests/techai/run.py luajit21`
  must pass before finishing. Keep README assertion counts in
  `tests/techai/README.md` in sync when adding tests.
- Back up the gadget before a large change under `tests/techai/*.bak`
  (existing: `ai_techai.pre-demand.lua.bak`, `ai_techai.pre-stall-fix.lua.bak`,
  `ai_techai.before.lua.bak`, `ai_techai.pre-layout.lua.bak`).

## Design history / references

- `.agents/chatgpt6_prompt.md` — the original user prompt ("hyper efficient and
  deadly") and the change log for the four building fixes: factory-exit
  clearance lanes, minelayer recognition, commander base sectors
  (mex-excluded), post-spawn metal rescan.
- `.agents/implementation_plan.md`, `.agents/walkthrough.md` — step-by-step
  accounts of the demand/economy and stall-fix work.
- `tests/techai/README.md` — user-facing changelog with assertion counts,
  September 11 stall section, September 14 rescan section, and the September 14
  "dense zoning + industrial expansion + enemy hints + nanotower stall tactics"
  section plus the September 14 geothermal-detection section (see the September
  14 changes in `ai_techai.lua`, `techai_layout.lua`, `techai_economy.lua`,
  `techai_geo.lua`, `geo_spot_finder.lua` and the demand/regression suites).
- `sandbox.2026-09-*.log` — command histories for those days.

September 14 pass summary (assertion counts 411 -> 420): (1) dense zone
anchoring in `techai_layout.lua` — per-category centroids, rings 96..1440 step
64 anchored at the category zone, padding stays 12; (2) constructor pool is now
income/queue-driven (`builderTarget` at ai_techai.lua:2256) instead of the
removed per-factory 10-builder cap; (3) industrial factory expansion in
`techai_economy.lua` (higher-tier, first-factory, overwhelmed, rich, and
previous-tier back-fill votes behind an income-allowance gate, no factory cap);
(4) enemy intel hints (`ai.intel.hints`) + preemptive factory-product
enrichment feeding `ai.productionEnemy`; (5) nanotower e-stall/m-stall and
surplus-capacity scoring.

September 14 second pass (counts 420 -> 443): (1) `techai_layout.lua` `Find`
now caps every ring at 1152 elmos from the commander spawn and pulls an
outlying category centroid back toward it, so base expansions never creep away
from the base (the earlier rings 96..1440 were erroneously anchored at the
*average* of built plans, letting a distant parking area pull subsequent
construction further out — builders had no reason to leave the base); (2)
factory duplication in `techai_economy.lua` now also requires build power
(`counts.constructor+commander+nanotower+rezzer >= factoryCount`) for
busy/rich/previous-tier votes — tier progression and the first factory stay
ungated, so a T2/T3 shell is never built without constructors to staff it; (3)
tiered metal/energy storage: `CatalogUnits`/fallback classify `metalStorage`/
`energyStorage` buildings as role `storage` with `storageKind`/`storageAmount`,
`techai_layout.lua` gives them a clustered `storage` zone, `techai_builder.lua`
`Refresh` accumulates per-frame `ai.fullFrames` (current >= 0.9*storage) and
tracks `state.storageCap`, and the economy ranks storage only after 300
sustained near-full frames, capping two, preferring tier 1, gated to
`maxFactoryTier+1` and to a capacity target of `income*180`; (4) base
defense/aa turrets now follow remembered enemy hints (`state.defenseGround`/
`state.defenseAir` from `hints.kinds` + threat profile, `state.hintTech`),
with per-role caps `min(6, threat)` and a tech ceiling `hintTech+1`; (5)
`ManageUnitMorphs` candidate pool now includes nanotowers and constructors;
morphing requires `goodCost` (income*30 headroom + 10% storage retained after
paying), the morph tech requirement is gated by `maxFactoryTier`, and workers
are only surrendered while construction remains (nanotowers skip during an
open stall), combat units must be fully idle, constructors must not be mid-task.
Fixture defs 11-13 (nanotc/mstor/estor), `CMD.MORPH`, exports
`ManageUnitMorphs`/`UnitMorphTable`.

September 14 third pass (counts 443 -> 467): geothermal point detection before
and after game start. `geo_spot_finder.lua` (new synced gadget) scans
geothermal vents (`FeatureDefs[defID].geoThermal`) in `Initialize` (pre-game),
re-merges at `GameFrame` 1 and 180, then drops the callin — publishing
`GG.geoSpots`, `GG.geoSpotsByPos`, and `_G.geoSpots`. New pure module
`techai_geo.lua` (`GeoScanner.Scan`) preserves the caller's spots, merges new
vents by 64 elmos, and reads `_G.geoSpots` too so the pre-game snapshot
survives the GG retire. The gadget's `GetGeoSpots()` (live, never cached) is
wired into `BaseLayout.Create` as a fourth argument (ai_techai.lua:291).
`techai_layout.lua` `Allowed` clears a 40-elmo patch around every vent for all
but `needGeo` plants (which own their vent), and `needGeo` `Find` probes vents
within the 1152 base radius (offsets -32..32 step 16, facings 0..lastFacing,
`TestBuildOrder > 0`), skipping farther vents so builders never leave the base.
Tests: `geo.lua` (10, module), `geo_gadget.lua` (8, executes the real gadget
source: pre-game publish, frame-1/180 merges, callin removal), layout +4 to 66,
regression +2 to 92 (fixture seeds `GG.geoSpots`, `GetGeoSpots` export).

September 15 pass (counts 467 -> 471): infolog crash fixes from a 12-minute
Techno Lands match that ended in `Fatal: [spring_lua_alloc_log_error]
[handle=LuaRules][OOM] synced=1` (synced LuaRules heap at the engine's 4 GiB
cap). (1) `UnitDamaged` passed `select(6, spGetTeamInfo(unitTeam))` directly
into `spGetUnitLosState`, forwarding the engine's extra team-color return into
the boolean `ignoreAllied` slot — 9,473 `bad argument #3 (boolean expected,
got number)` errors, one per damage event (the lag spikes), each building a
traceback and broadcasting a net LOGMSG; now truncated through a local and the
LOS query is skipped without an ally team. (2) `ManageResourceCheating`
injected `+Inf` from wiped teams' engine income (`spAddTeamResource ... got
+-Inf`, 50 errors); income is sanitized finite and injections re-check. (3)
`techai_metadata.lua` no longer touches the removed `WeaponDefs` key
`areaOfEffect` eagerly (1,766 load-time `WeaponDefIndex` errors); the
`damageAreaOfEffect` fallback is lazy. (4) `UnitDestroyed` also clears
`microUntil`/`factoryChoices`/`mexUpgrades`. Fixture now mirrors the engine
(7-value `GetTeamInfo`, strict `GetUnitLosState`, finite-only
`Add/SetTeamResource` + `injected` log); regression +4 to 96 (attacker-contact
recording, inf-income cheat sanitization via a real `GameFrame`).