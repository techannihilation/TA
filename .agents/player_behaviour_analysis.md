# Player Behaviour & Strategic Tactics Analysis

This document compiles the exhaustive analysis of all human players identified across 45 match demos recorded between September 11 and September 15, 2026, on the Recoil engine (`2025.06.05` / `2025.06.15`) in *Tech Annihilation* (TechA).

---

## 1. Executive Summary & Telemetry Overview

Across 45 demo files (`.sdfz`), packet-level stream parsing of `NETMSG_COMMAND` (opcodes `0x0b` and `0x0e`), unit build orders, structure placement coordinates, and game command queues revealed **10 distinct human players**.

| Player Name | Matches Recorded | Total Commands | Primary Faction(s) | Strategic Archetype |
|---|---|---|---|---|
| **[itsok]Senethril** | 4 | 49,474 | TLL | Hyper-Aggressive Forward Raider & Early Combat Interleaving |
| **Hakora** | 2 | 446,300 | ARM / TLL | High-APM Kinetic Swarm, Mobile Missile Skirmishing (`CMD_FIGHT`) |
| **Milisandia** | 40 | 48,028 | ARM, CORE, GOK, RUMAD | Sensory Dominance, Chokepoint Wall Fortification & LRPC Siege |
| **skyfall** | 3 | 28,619 | ARM | Industrial Logistics Backbone, Nanotower Grid & Frontline Medic |
| **Pepper** | 2 | 36,073 | ARM / TALON | Area Denial Fortifier, Minefield Saturation & Radar Jamming |
| **aDarkBlueDiamond** | 1 | 1,125 | ARM / CORE | Mobile Tactical Missile Battery Echelon & Hover Support |
| **Jonny[5]** | 2 | 1,324 | ARM | Massive Fusion Grid Scaling (90 Fusions) & Beam Laser Defense |
| **Mike** | 1 | 324,189 | ARM / CORE | Minefield Carpet (208 Mines), Dragon's Teeth & Coastal Silos |
| **killfree** | 1 | 12,624 | ARM / TLL | Amphibious Torpedo Swarm, Assault Walkers & Stealth Jamming |
| **mikalo1** | 1 | 144,472 | ARM | Mega-Nanotower Concentration (67 T4 Nanos) & Vulcan Rush |

---

## 2. In-Depth Player Tactical Profiles

---

### 1. [itsok]Senethril
- **Matches Recorded**: 4 (*DeltaSiegeDry*, *Techno Lands Final 26*, *SandOfGold*)
- **Total Commands**: 49,474
- **Primary Faction**: **TLL** (with CORE/ARM crossover)
- **Top Command Distribution**:
  - `CMD_DEATHWAIT`: 45,925
  - `CMD_WAIT`: 1,492
  - `BUILD`: 578
  - `CMD_REPAIR`: 557
  - `CMD_2` / `CMD_1`: 321
- **Top Produced Units**:
  - `cornanotc3` (44 - T4 Nanotowers)
  - `corah` (23 - Hovercraft Assault)
  - `corchamp` (21 - Heavy Battle Tanks / Champions)
  - `armcv` (11 - Construction Vehicles)
  - `cortoast` (11 - Pop-up Heavy Plasma)
  - `corhover3g` (10 - Heavy Hovercraft)
  - `corvaliant` (8 - Assault Cruisers)
  - `coreyes` (7 - Fast Reconnaissance Scouts)
- **Top Built Structures**:
  - `corawac` (69 - Advanced Aerial Early Warning & Control)
  - `cormuat` (50 - Heavy Support Staging)
  - `cormlv` (23 - Minelayers & Chokepoint Defense)
  - `coradon` (21 - Coastal Plasma Artillery)
  - `arm_beamer` (20 - Beam Laser Turrets)
  - `armmex` (16 - Metal Extractors)
  - `cormenacer` (13 - Heavy Point Defense)
- **Opening Build Sequence** (*DeltaSiegeDry*):
  1. `[214.9s]` `armvengence` (Forward Combat Structure)
  2. `[226.4s]` `armcv` (Constructor #1)
  3. `[226.6s]` `armcv` (Constructor #2)
  4. `[251.2s] - [277.8s]` `armmygalo` $\times 5$ (Fast Defensive Screen)
  5. `[292.6s] - [294.0s]` `armmex` $\times 3$ (Extractor Capture)
- **Tactical Doctrine & Strategic Blueprint**:
  - **Early Rush & Forward Harassment**: Does not wait for a large force. Moves small, cheap raider groups out immediately along the expansion vector to deny enemy forward metal extractors and intercept expanding builders.
  - **Builder Interleaving**: Builds 1 constructor to begin basic base setup, then immediately queues 3–4 cheap combat units before queueing the second constructor. This prevents the classic "naked expansion" vulnerability.
  - **Primary Factory Nanotower Boosting**: Drops early nanotowers right next to the first factory to instantly double or triple combat production speed.
  - **Heavy Hovercraft & Mobile Firepower Transition**: Transitions quickly into heavy assault hovercraft (`corah`, `corhover3g`) and battle tanks (`corchamp`) to bypass terrain bottlenecks and hit enemy flanks.

---

### 2. Hakora
- **Matches Recorded**: 2 (*DeltaSiegeDry*, *Techno Lands Final 26.3*)
- **Total Commands**: **446,300** (Highest command density in the entire archive)
- **Primary Faction**: **ARM / TLL**
- **Top Command Distribution**:
  - `CMD_DEATHWAIT`: 436,767 (Extreme command micro & queue cycling)
  - `CMD_WAIT`: 5,068
  - `CMD_REPEAT`: 1,643
  - `BUILD`: 1,350
  - `CMD_UNLOAD_UNITS`: 657
  - `CMD_34571`: 465
- **Top Produced Units**:
  - `tllspy` (19 - Infiltration & Cloaked Intel)
  - `tllbuilderlvl1` (19 - Mobile Constructors)
  - `tllhplasma` (16 - Heavy Mobile Plasma Artillery)
  - `tllbtrans` (15 - Battle Transports)
  - `tllpliosaurus` (13 - Submersible Assault Walkers)
  - `tllmako` (13 - Fast Attack Submarines)
  - `tlleap` (12 - Experimental Air Plants)
  - `tllatidal` (11 - Advanced Tidal Power)
- **Top Built Structures**:
  - `tllfireraiser` (**252** - Mobile Missile Rocket Skirmishers)
  - `tllnanotc` (**165** - Nanotower Grid)
  - `tllanhur` (118 - Anti-Air Defense Platforms)
  - `tllmosasaurus` (81 - Coastal Fortress Batteries)
  - `tllmusk` (76 - Heavy Defense Turrets)
  - `tllnaja` (64 - Beam Weapons)
  - `tllleatherback` (22 - Heavy Defense)
  - `tllmedfusion` (22 - Medium Fusions)
- **Tactical Doctrine & Strategic Blueprint**:
  - **Relentless `CMD_FIGHT` Kinetic Stance**: Issues continuous fight orders over every waypoint. Units never march passively; they remain in ready-to-fire posture, immediately acquiring targets at maximum weapon range.
  - **Mobile Rocket / Missile Skirmisher Swarm**: Produces massive batteries of `tllfireraiser` (252 units). Uses them as mobile artillery screens to obliterate incoming tanks and defenses before they can get into firing range.
  - **Dragon's Teeth Funneling**: Uses `tlledrag` obstacle belts to funnel incoming attacks into pre-targeted killzones covered by `tllfireraiser` and `tllanhur` flak.
  - **Rapid Tech-2 Escalation**: Reaches Tech-2 as quickly as possible, bypassing redundant T1 factory duplication and scaling medium fusions (`tllmedfusion`) and nanotower clusters (`tllnanotc`).

---

### 3. Milisandia
- **Matches Recorded**: **40** (Most active player and core game architect)
- **Total Commands**: 48,028
- **Primary Factions**: **ARM, CORE, GOK, RUMAD**
- **Top Command Distribution**:
  - `CMD_DEATHWAIT`: 42,923
  - `CMD_WAIT`: 3,465
  - `BUILD`: 986
  - `CMD_2`: 182
  - `CMD_MOVE`: 130
  - `CMD_REPAIR`: 59
- **Top Produced Units**:
  - `armhawk` (30 - Stealth Air Superiority Fighters)
  - `armck` (15 - Advanced Construction Kbots)
  - `gok_chariot` (12 - Combat Skirmishers)
  - `armfmine3` (6 - Floating Heavy Mines)
  - `gok_cut` (5 - Tactical Raiders)
  - `armrecl` (4 - Reclaimers)
  - `arm_bagheera` (4 - Advanced Battle Tanks)
  - `corchamp` (3 - Heavy Battle Tanks)
- **Top Built Structures**:
  - `gok_wall` (**82** - Perimeter Walls & Anti-Rush Barriers)
  - `armsnipe` (61 - High-Altitude Precision Sniper Turrets)
  - `armllt` (58 - Light Laser Turrets)
  - `corint` (52 - Target Interceptors)
  - `gok_lrpt1` (**52** - Long-Range Plasma Artillery / LRPC)
  - `armmygalo` (42 - Heavy Defensive Batteries)
  - `gok_slesh1` (38 - Heavy Pulse Defense)
  - `armmerl` (34 - Long-Range Rocket Launchers)
- **Tactical Doctrine & Strategic Blueprint**:
  - **Sensory Dominance & Early Warning**: Blankets the base perimeter with radar towers (`gok_kafka`, `gok_rad`, `armrad`) early in the match, detecting enemy flanking maneuvers across the fog of war.
  - **Physical Obstacle Fortification**: Uses perimeter walls (`gok_wall`) and barrier blocks to seal narrow passes and protect metal extractors from early raider raids.
  - **Blind FOW Artillery Bombardment**: Leverages radar contacts to target Long-Range Plasma Cannons (`gok_lrpt1`, `gok_meteor`) into the fog of war, destroying enemy bases and assembly areas before visual contact is established.
  - **Air Superiority Umbrella**: Deploys wings of stealth fighters (`armhawk`) to maintain total air control, denying enemy reconnaissance and bomber runs.

---

### 4. skyfall
- **Matches Recorded**: 3 (*DeltaSiegeDry*, *Techno Lands Final 26.3*)
- **Total Commands**: 28,619
- **Primary Faction**: **ARM**
- **Top Command Distribution**:
  - `CMD_DEATHWAIT`: 22,869
  - `CMD_TIMEWAIT`: 1,549
  - `CMD_REPAIR`: **1,424** (Highest active repair order volume per match)
  - `BUILD`: 557
  - `CMD_34571`: 418
  - `CMD_UNLOAD_UNITS`: 418
- **Top Produced Units**:
  - `armconsul` (19 - Combat Engineering Vehicles / Mobile Rezzers)
  - `armlashover` (17 - Assault Hovercraft)
  - `arm_broadside` (9 - Heavy Flying Gunships / Dreadnoughts)
  - `armmarlin` (8 - Submersible Combat Vessels)
  - `armfig` (7 - Air Superiority Fighters)
  - `armacv` (6 - Advanced Construction Vehicles)
  - `armcroc` (6 - Amphibious Assault Tanks)
  - `armflash` (5 - Fast Assault Raiders)
- **Top Built Structures**:
  - `armmygalo` (119 - Heavy Defensive Batteries)
  - `armnanotc1` (**51** - T2 Nanotower Grid)
  - `armmmkr` (43 - Metal Makers)
  - `armnanotc` (**40** - T1 Nanotowers)
  - `armcroc` (24 - Amphibious Structures)
  - `armpack` (18 - Heavy Energy Storage)
  - `ametalmakerlvl2` (16 - T2 24K Metal Makers)
  - `ametalmakerlvl3` (13 - T3 48K Metal Makers)
- **Tactical Doctrine & Strategic Blueprint**:
  - **The Field Medic & Logistician**: Relies heavily on `armconsul` combat engineers following combat forces to perform non-stop field repairs (`CMD_REPAIR` 1,424 times), keeping high-value tanks and assault hovers operating at peak strength.
  - **Nanotower Multiplier Grid**: Deploys over 91 nanotowers (`armnanotc`, `armnanotc1`) surrounding factories, enabling instant unit queuing and burst production.
  - **Energy-to-Metal Conversion Synergy**: Couples massive fusion power (`armfus`, `aafus`, `afusionplant`) with multi-tier metal makers (`ametalmakerlvl2`, `ametalmakerlvl3`), creating a self-sustaining closed-loop economy independent of metal spots.

---

### 5. Pepper
- **Matches Recorded**: 2 (*Techno Lands Final 26.3*)
- **Total Commands**: 36,073
- **Primary Faction**: **ARM / TALON**
- **Top Command Distribution**:
  - `CMD_DEATHWAIT`: 18,318
  - `CMD_UNLOAD_UNITS`: 3,395
  - `CMD_34571`: 3,314
  - `BUILD`: 3,075
  - `CMD_REPEAT`: 2,784
  - `CMD_2`: 1,925
  - `CMD_REPAIR`: **940**
- **Top Produced Units**:
  - `talon_herison` (48 - Fast Assault Combat Units)
  - `talon_eap` (37 - Experimental Air Platforms)
  - `talon_emstor` (23 - Energy Management Units)
  - `talon_husher` (17 - Mobile Radar Jammers & Stealth Generators)
  - `rumad_zorga` (16 - Heavy Combat Armor)
  - `talon_mirage` (14 - Disruption & Electronic Warfare)
  - `talon_blt` (10 - Heavy Beam Laser Assault)
  - `talon_sheatiped` (10 - Multi-Legged Assault Walkers)
- **Top Built Structures**:
  - `talon_mlv` (**905** - Minelayers, Obstacles & Perimeter Barriers)
  - `talon_mythril` (481 - Defensive Laser Arrays)
  - `talon_pampa` (226 - Ground Batteries)
  - `talon_pepper` (136 - Point Defense)
  - `talon_acv` (108 - Advanced Construction Grid)
  - `talon_mcv1` (102 - Mobile Construction Units)
  - `talon_elixir` (88 - Nanotower Support)
  - `talon_handgod` (85 - Superweapon Artillery Installations)
- **Tactical Doctrine & Strategic Blueprint**:
  - **Extreme Area Denial & Obstacle Carpeting**: Deployed 905 `talon_mlv` barrier and mine installations, physically partitioning the battlefield and creating lethal chokepoints.
  - **Missile Defense & Interception Umbrella**: Deployed 30+ missile defense systems (`talon_mds`) protecting base centers from tactical missiles and strategic strikes.
  - **Electronic Warfare & Radar Jamming**: Constantly covers allied unit concentrations with mobile jammers (`talon_husher`), cloaking troop movements and preventing enemy radar targeting.
  - **Superweapon End-Game**: Transitions late-game resources into massive superweapon artillery (`talon_handgod`) to dismantle enemy bases from absolute safety.

---

### 6. aDarkBlueDiamond
- **Matches Recorded**: 1 (*DeltaSiegeDry*)
- **Total Commands**: 1,125
- **Primary Faction**: **ARM / CORE**
- **Top Command Distribution**:
  - `CMD_DEATHWAIT`: 532
  - `BUILD`: 218
  - `CMD_WAIT`: 176
  - `CMD_REPAIR`: 66
  - `CMD_34571`: 33
- **Top Produced Units**:
  - `corraven` (**30** - Tactical Missile Hovercraft)
  - `corch` (26 - Construction Hovercraft)
  - `coracsub` (13 - Advanced Submarines)
  - `corbsub` (13 - Battle Submarines)
  - `corthud` (11 - Plasma Kbot Artillery)
  - `corasp` (10 - Air Repair & Staging Pads)
  - `corhcar` (9 - Heavy Aircraft Carriers)
  - `corecs` (6 - Combat Support Units)
- **Top Built Structures**:
  - `cormlv` (26 - Minelayers & Barriers)
  - `cormuat` (15 - Heavy Hover Platforms)
  - `cormls` (10 - Naval Repair & Staging)
  - `cach` (9 - Advanced Construction Hovers)
  - `corsms` (7 - Anti-Missile & Sub Defense)
  - `corfsilo` (5 - Tactical Missile Silos)
  - `corgator` (5 - Defensive Turrets)
  - `cormds` (4 - Missile Defense Systems)
- **Tactical Doctrine & Strategic Blueprint**:
  - **Mobile Standoff Artillery Battery Echelon**: Built a dedicated fleet of 30 `corraven` missile hovers and 11 `corthud` artillery kbots. Positioned them in a trailing standoff echelon ~400–600 elmos behind allied frontline brawlers, raining down precision long-range missiles without taking direct fire.
  - **Hover Construction Network**: Leveraged 26 `corch` and 9 `cach` construction hovercraft to rapidly erect forward air repair pads (`corasp`) and missile defense systems (`corsms`) across water and land.

---

### 7. Jonny[5]
- **Matches Recorded**: 2 (*DeltaSiegeDry*)
- **Total Commands**: 1,324
- **Primary Faction**: **ARM**
- **Top Command Distribution**:
  - `CMD_WAIT`: 726
  - `BUILD`: 356
  - `CMD_DEATHWAIT`: 67
  - `CMD_REPAIR`: 38
  - `CMD_ATTACK`: 26
  - `CMD_UNLOAD_UNITS`: 20
- **Top Produced Units**:
  - `armrecl` (8 - Field Reclaimers)
  - `armconsul` (5 - Combat Engineers)
  - `armfark` (4 - Fast Assist & Repair Kbots)
  - `armsmc` (4 - Support Units)
  - `armflea` (3 - Scout Kbots)
  - `armack` (3 - Advanced Construction Kbots)
  - `armvulc2` (3 - Vulcan Rapid-Fire Super-Artillery)
  - `armacv` (2 - Advanced Construction Vehicles)
- **Top Built Structures**:
  - `armfus` (**90** - Nuclear Fusion Plants!)
  - `arm_beamer` (**84** - High-Energy Beam Laser Turrets!)
  - `armmlv` (36 - Defensive Barriers)
  - `armmygalo` (28 - Heavy Defense Platforms)
  - `armmmkr` (23 - Metal Conversion Grid)
  - `armlift` (12 - Heavy Gantries)
  - `coreleopard` (9 - Assault Batteries)
  - `cjuno` (8 - Area Jammer & Radar Neutralizers)
- **Tactical Doctrine & Strategic Blueprint**:
  - **Hyper-Scaled Fusion Economy**: Constructed 90 nuclear fusion power plants (`armfus`), generating tens of thousands of excess energy per second.
  - **Impenetrable Beam Laser Perimeter**: Erected 84 `arm_beamer` beam lasers along the base boundary, instantly incinerating any raiding forces or combat swarms.
  - **Super-Artillery Battery Rush**: Channeled the massive fusion output into 3 `armvulc2` Vulcan super-cannons, saturating enemy base quadrants with non-stop rapid plasma bombardments.

---

### 8. Mike
- **Matches Recorded**: 1 (*Techno Lands Final 26.3*)
- **Total Commands**: **324,189**
- **Primary Faction**: **ARM / CORE**
- **Top Command Distribution**:
  - `CMD_DEATHWAIT`: 316,702
  - `CMD_WAIT`: 5,379
  - `BUILD`: 618
  - `CMD_UNLOAD_UNITS`: 468
  - `CMD_34571`: 413
  - `CMD_REPAIR`: 121
- **Top Produced Units**:
  - `cornanotc3` (8 - T4 Nanotowers)
  - `coraapod` (4 - Anti-Air Pods)
  - `corecs` (3 - Electronic Combat Support)
  - `corcommando` (3 - Cloaked Stealth Assassins)
  - `cbuilderlvl1` (3 - Mobile Builders)
  - `corct` (2 - Heavy Armor)
  - `cormkl` (2 - Minelayers)
  - `coracsub` (2 - Advanced Submarines)
- **Top Built Structures**:
  - `cormin` (**208** - Minefield Saturation Arrays!)
  - `cormuat` (133 - Heavy Water/Hover Staging)
  - `corhgol` (23 - Heavy Defense Batteries)
  - `corfink` (22 - Perimeter Sensors)
  - `corcom3` (20 - Advanced Power Centers)
  - `cjuno` (18 - Anti-Radar Pulses)
  - `corfsilo` (15 - Tactical & Nuclear Missile Silos)
  - `coredrag` (15 - Dragon's Teeth Obstacles)
- **Tactical Doctrine & Strategic Blueprint**:
  - **Minefield Carpet**: Sowed 208 active minefields (`cormin`) across all transit corridors and approaches, detonating enemy assault columns before they could reach friendly defenses.
  - **Strategic Missile Silo Cluster**: Built 15 missile silos (`corfsilo`) to launch coordinated cruise missile and tactical strikes against enemy power grids.

---

### 9. killfree
- **Matches Recorded**: 1 (*Techno Lands Final 26.3*)
- **Total Commands**: 12,624
- **Primary Faction**: **ARM / TLL**
- **Top Command Distribution**:
  - `CMD_DEATHWAIT`: 10,558
  - `CMD_WAIT`: 554
  - `BUILD`: 374
  - `CMD_REPAIR`: 278
  - `CMD_MOVE`: 242
  - `CMD_2`: 159
- **Top Produced Units**:
  - `tllshoretorp` (28 - Shore Torpedo Launchers)
  - `tllbug` (17 - Light Assault Raiders)
  - `tllacsub` (13 - Advanced Combat Submarines)
  - `tllcenturion` (10 - Heavy Assault Walkers)
  - `tllanvil` (8 - Heavy Tanks)
  - `tllvp` (6 - Vehicle Plants)
  - `tllbtrans` (3 - Battle Transports)
  - `tllvisitor` (3 - Long-Range Recon)
- **Top Built Structures**:
  - `tllmatamata` (36 - Heavy Plasma Defense)
  - `tllmusk` (36 - Fortress Turrets)
  - `tllnanotc` (27 - Nanotower Grid)
  - `tllmstor` (26 - Metal Storage)
  - `tllmosasaurus` (25 - Coastal Batteries)
  - `tllmds` (12 - Missile Defense Systems)
  - `tllhjam` (12 - Heavy Radar Jammers)
  - `tllmas` (10 - Air Defense)
- **Tactical Doctrine & Strategic Blueprint**:
  - **Amphibious & Subsurface Control**: Deployed 28 shore torpedo launchers and 13 advanced submarines, locking down water channels and denying naval transit.
  - **Radar Jamming Screen**: Erected 12 heavy radar jammers (`tllhjam`) to blind enemy long-range sensors and prevent artillery targeting.

---

### 10. mikalo1
- **Matches Recorded**: 1 (*Techno Lands Final 26.3*)
- **Total Commands**: **144,472**
- **Primary Faction**: **ARM**
- **Top Command Distribution**:
  - `CMD_DEATHWAIT`: 143,028
  - `BUILD`: 337
  - `CMD_UNLOAD_UNITS`: 228
  - `CMD_REPEAT`: 228
  - `CMD_34571`: 227
  - `CMD_WAIT`: 214
- **Top Produced Units**:
  - `armrecl` (16 - Heavy Reclaimers)
  - `armvulc2` (**12** - Vulcan Rapid-Fire Super-Artillery!)
  - `armmuat` (10 - Heavy Staging Platforms)
  - `abuilderlvl5` (4 - T5 Master Constructors)
  - `armorbweaver` (3 - Assault Walkers)
  - `armck` (2 - Construction Kbots)
  - `armack` (2 - Advanced Construction Kbots)
  - `armslab` (2 - Experimental Labs)
- **Top Built Structures**:
  - `armnanotc3` (**67** - T4 High-Speed Nanotowers!)
  - `armmygalo` (26 - Defensive Batteries)
  - `armfus` (14 - Fusion Power Plants)
  - `armnanotc1` (14 - T2 Nanotowers)
  - `armlift` (12 - Heavy Gantries)
  - `armnanotc2` (12 - T3 Nanotowers)
  - `armnanotc` (11 - T1 Nanotowers)
  - `tllpulaser` (11 - Pulse Lasers)
- **Tactical Doctrine & Strategic Blueprint**:
  - **Mega-Nanotower Build Power Concentration**: Constructed **67 T4 Nanotowers** (`armnanotc3`) clustered tightly around experimental staging areas.
  - **Doomsday Vulcan Artillery Battery**: Exploited the immense build power to produce **12 Vulcan rapid-fire super-artillery cannons** (`armvulc2`). The sheer volume of incoming super-heavy shells annihilated enemy bases across the map in seconds.

---

## 3. Comparative Tactical Matrix

| Player | APM / Cmd Volume | Preferred Unit Class | Preferred Defense / Utility | Core Strategic Timing |
|---|---|---|---|---|
| **Senethril** | High (~12k/game) | Raiders & Assault Hovercraft | Pop-up Heavy Plasma & Forward AWACS | Early-game rush (0–3 min) |
| **Hakora** | Extreme (>200k/game) | Mobile Missile Skirmishers (`fireraiser`) | Dragon's Teeth belts & Flak platforms | Rapid T2 timing push (3–6 min) |
| **Milisandia** | Moderate (~1.2k/game) | Stealth Air Superiority (`armhawk`) | Sensory Radar Towers & LRPC Artillery | Mid-game fortress & siege (5–12 min) |
| **skyfall** | High (~9.5k/game) | Combat Engineers (`armconsul`) | Multi-tier Nanotower grids & Metal Makers | Mid-to-late game macro scaling |
| **Pepper** | High (~18k/game) | Stealth Jammers & Combat Walkers | Dense Minefields & Missile Defense (`mds`) | Continuous area denial & superweapon |
| **aDarkBlueDiamond** | Precise (~1.1k/game) | Tactical Missile Hovercraft (`corraven`) | Mobile Staging & Anti-Missile Systems | Coordinated standoff fire support |
| **Jonny[5]** | Low/Macro (~650/game) | Fast Assist Kbots (`armfark`) | 90+ Fusions & 84+ Beam Lasers | Late-game economic dominance |
| **Mike** | Extreme (>300k/game) | Stealth Commandos & Subs | 200+ Minefields & 15 Missile Silos | Deep defensive attrition & silo strikes |
| **killfree** | Moderate (~12k/game) | Shore Torpedoes & Assault Walkers | Heavy Radar Jammers & Coastal Guns | Amphibious harassment & lane denial |
| **mikalo1** | High (>140k/game) | Reclaimers & Experimental Builders | 67+ T4 Nanotowers & 12+ Vulcans | Extreme super-artillery tech rush |

---

## 4. Integration into TechAI (Mapping Matrix)

| Player Habit / Tactic | Originating Player(s) | TechAI Engine Implementation File | Resulting AI Behavior |
|---|---|---|---|
| **Early Cheap Unit Rush** | Senethril | [`techai_production.lua`](file:///c:/Users/Shar/Documents/My%20Games/Spring/games/taaitest.sdd/luarules/configs/techai_production.lua) | Produces 3–4 cheap units (Peewees, Flash, A.K.s, Bugs) immediately after 1st constructor. |
| **Constructor Interleaving** | Senethril | [`techai_production.lua`](file:///c:/Users/Shar/Documents/My%20Games/Spring/games/taaitest.sdd/luarules/configs/techai_production.lua) | Constructor deficit score receives `-45` penalty until 3+ combat units exist, eliminating naked expansion. |
| **Forward Spot Harassment** | Senethril | [`ai_techai.lua:ManageRaiders`](file:///c:/Users/Shar/Documents/My%20Games/Spring/games/taaitest.sdd/luarules/gadgets/ai_techai.lua) | Raiders patrol forward metal spots along the expansion vector, intercepting expanding builders. |
| **Active Field Repairs** | skyfall, Pepper | [`techai_builder.lua:Manage`](file:///c:/Users/Shar/Documents/My%20Games/Spring/games/taaitest.sdd/luarules/configs/techai_builder.lua) | Builders heal retreating low-health combat units and damaged allied units/defenses before idling. |
| **Sensory Dominance** | Milisandia | [`techai_economy.lua:Rank`](file:///c:/Users/Shar/Documents/My%20Games/Spring/games/taaitest.sdd/luarules/configs/techai_economy.lua) | Scores radar at 380 ("sensory early warning") on 1st factory, expanding secondary radar as base grows. |
| **FOW Radar Bombardment** | Milisandia | [`ai_techai.lua:ManageArtillery`](file:///c:/Users/Shar/Documents/My%20Games/Spring/games/taaitest.sdd/luarules/gadgets/ai_techai.lua) | Artillery bombards radar contacts and known buildings through the fog of war when no LOS targets exist. |
| **Standoff Battery Echelon** | aDarkBlueDiamond | [`techai_production.lua`](file:///c:/Users/Shar/Documents/My%20Games/Spring/games/taaitest.sdd/luarules/configs/techai_production.lua), [`ai_techai.lua`](file:///c:/Users/Shar/Documents/My%20Games/Spring/games/taaitest.sdd/luarules/gadgets/ai_techai.lua) | Maintains 20–25% artillery ratio (`corraven`, `corthud`); artillery trails behind assault waves at standoff range. |
| **Nanotower Grid Scaling** | skyfall, mikalo1 | [`techai_economy.lua:Rank`](file:///c:/Users/Shar/Documents/My%20Games/Spring/games/taaitest.sdd/luarules/configs/techai_economy.lua) | Scales nanotower targets up to $3 \times \text{factoryCount}$ in economic surplus ($m_{\text{income}} \ge 18, e_{\text{income}} \ge 80$). |
| **`CMD_FIGHT` Ready Stance** | Hakora | [`ai_techai.lua:ManageMilitaryForces`](file:///c:/Users/Shar/Documents/My%20Games/Spring/games/taaitest.sdd/luarules/gadgets/ai_techai.lua) | All rally points and wave assaults issue `CMD_FIGHT`, keeping units in active combat readiness. |
| **Mobile Skirmisher Bonus** | Hakora | [`techai_production.lua`](file:///c:/Users/Shar/Documents/My%20Games/Spring/games/taaitest.sdd/luarules/configs/techai_production.lua) | Scores ranged skirmishers (range $\ge 450$, cost $\le 160$) higher, replicating Fireraiser harassment. |
