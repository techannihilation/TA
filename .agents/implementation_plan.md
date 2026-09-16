# Factory Unit Prioritization, Commander Anti-Lingering, & Morph Isolation Plan

This implementation plan addresses four interconnected requirements:
1. **Factory Builder Prioritization & Cap (Max 10 per Individual Factory)**:
   - Factories build builders first if the individual factory has not reached its 10-builder limit.
   - Once an individual factory has 10 builders (active living + queued), it transitions to combat / counter units.
   - If a builder dies, the associated factory automatically builds a replacement.
2. **Counter-Unit Production Against Incoming Enemy Threats**:
   - The AI continuously monitors incoming threats via damage events (`gadget:UnitDamaged`), line-of-sight detections (`gadget:UnitEnteredLos`), and perimeter cylinder scans.
   - Counter-production dynamically prioritizes:
     - **Anti-Air (`cat.aa`)** against incoming enemy aircraft (bombers, gunships, fighters).
     - **Heavy Combat & Artillery (`cat.artillery`, `cat.combat`, `cat.t4combat`, `cat.t5combat`)** against incoming heavy armor / assault units.
     - **Fast Raiders & Skirmishers (`cat.raiders`, `cat.combat`)** against incoming raider swarms and fast harassers.
     - **Balanced Combined Arms** when no immediate threats are incoming.
3. **Commander Base Focus & Anti-Lingering**:
   - The Commander dynamically builds factories, energy, and metal (extractors & metal makers) as needed.
   - **Zero Lingering**: The Commander never guards factories (`CMD_GUARD` removed from `HandleUnitCreated` and Section 3b).
   - **Active Step-Away**: If the Commander is within 280 elmos of any factory, it immediately moves away into open base space to prevent clogging factory exits and stay productive.
4. **Morph Support Prohibition**:
   - Builders and nano turrets must **never** assist the Commander's metamorphosis, as the engine does not permit external support for Commander morphing.
   - All morph-assist repair loops are removed and guarded with `IsMorphingCommander(unitID)`.

---

## Proposed Changes

### TechAI Gadget

#### [MODIFY] [ai_techai.lua](file:///d:/TA-master/TA-master/luarules/gadgets/ai_techai.lua)

- **Factory Builder Tracking (`ai.factoryBuilders`)**:
  - Track living builders associated with each `factoryID`.
  - Helper `GetFactoryBuilderCount(ai, factoryID)`: calculates active living builders plus builders currently queued in that specific factory.
  - In `ManageFactory`:
    - If `GetFactoryBuilderCount(ai, factoryID) < 10`:
      - Prioritize building a constructor (highest tech tier available in `fDefID`'s `buildOptions`).
      - Maintain priority until the individual factory reaches its 10-builder quota.
    - If `GetFactoryBuilderCount(ai, factoryID) >= 10`:
      - Transition to counter-production and combat units.

- **Incoming Threat Detection & Threat Profile (`ai.threatProfile`)**:
  - In `RegisterAITeam`, initialize `threatProfile = { air = 0, heavy = 0, raider = 0, artillery = 0, lastScan = 0 }`.
  - Add `gadget:UnitDamaged`:
    - Inspect `attackerDefID` when allied units/structures are hit. Increment threat weights (air, heavy, raider, artillery).
  - Update `gadget:UnitEnteredLos`:
    - When enemy mobile units enter LOS within 3000 elmos of base, classify and increment threat profile.
  - Periodic base perimeter scan (every 90 frames / 3 seconds):
    - Count enemy units approaching within 2500 elmos of base/factories; decay stale threats.
  - In `ManageFactory` (when builder limit is met):
    - If `threatProfile.air > 0` $\to$ queue Anti-Air unit (`cat.aa`).
    - If `threatProfile.heavy > 0` $\to$ queue heavy combat or artillery (`cat.t5combat`, `cat.t4combat`, `cat.artillery`, `cat.combat`).
    - If `threatProfile.raider > 0` $\to$ queue fast raiders / skirmishers (`cat.raiders`, `cat.combat`).
    - Otherwise, produce balanced combined arms.

- **Commander Base Focus & Anti-Lingering**:
  - Remove factory guard order in `HandleUnitCreated` (lines 1519-1521).
  - Remove Section 3b nano-boosting guard order in `ManageBuilder` (lines 2164-2184).
  - Add Commander factory avoidance in Section 12:
    - If the Commander is within 280 elmos of any factory, order `CMD_MOVE` to an open base coordinate at least 320 elmos away.
  - Commander actively cycles through:
    - Energy construction when energy is low or factories expand (`einc < minc * 12`, `usableEnergy < estor * 0.40`).
    - Metal expansion (claiming safe local mexes or building metal makers when `usableMetal < mstor * 0.35` and energy permits).
    - Additional factory construction when unit production needs ramping up (`minc >= 8 and einc >= 70`).

- **Prohibition of Morph Support**:
  - Add `IsMorphingCommander(unitID)` helper.
  - Remove builder assist loops in `ManageMorphing` (lines 1402-1413) and `ManageBuilder` Section 1b (lines 1892-1902).
  - In Section 12 (repairing unfinished units) and Section 2 (builder assistance), explicitly skip morphing commanders.
  - Ensure nano turrets guard factories rather than morphing commanders.

- **Distribution Synchronization**:
  - Synchronize `d:\TA-master\TA-master\luarules\gadgets\ai_techai.lua` to `C:\Users\Shar\Documents\My Games\Spring\games\taaitest.sdd\luarules\gadgets\ai_techai.lua` and verify SHA-256 match.

---

## Verification Plan

### Automated Tests
1. **Lua Syntax & Block Balance Check**:
   - Run `diagnose_lua.py` ensuring 0 syntax errors or scope imbalances.
2. **Factory Builder Limit & Counter-Unit Simulation**:
   - Write a simulation script testing:
     - Factory produces builders first until exactly 10 are active/queued.
     - 11th unit produced is a combat/counter unit.
     - Air threat simulation causes factory to queue AA.
     - Heavy threat simulation causes factory to queue heavy combat/artillery.
     - Raider threat simulation causes factory to queue raiders.
3. **Commander Anti-Lingering & Morph Isolation Test**:
   - Verify Commander never receives `CMD_GUARD` on a factory.
   - Verify Commander steps away if `dist < 280` from a factory.
   - Verify builders never receive `CMD_REPAIR` on a morphing commander.
4. **SHA-256 Distro Match Verification**:
   - Validate 100% hash parity between workspace and game distro.
