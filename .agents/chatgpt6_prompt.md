# Improve TechAI combat

> make the TechAI AI subsystem hyper efficient and deadly, making it fight like a pro player, read the 2 .md files from C:\Users\Shar\\.gemini\antigravity-ide\brain\6007a787-39f1-42a2-815f-23d5558952f1 to get a idea of what the AI does&#x20;
>
> Tech Annihilation is a game built on the Recoil RTS Engine targeting the 2025.06.05 version of the engine. Recoil is a fork of Spring RTS Engine

<details><summary>12 previous messages</summary>

> I’ll read the two design notes, inspect TechAI’s decision loops, and improve the parts that most affect economy, combat, and CPU cost.
>
> <details><summary>Ran 4 commands</summary>
>
> - Ran `Get-ChildItem -LiteralPath 'C:\Users\Shar\.gemini\antigravity-ide\brain\6007a787-39f1-42a2-815f-23d5558952f1' -Filter '*.md' | Select-Object FullName; rg --files -g AGENTS.md -g '*TechAI*' -g '*techai*'; git status --short`
> - Ran `Get-Content -LiteralPath 'C:\Users\Shar\.gemini\antigravity-ide\brain\6007a787-39f1-42a2-815f-23d5558952f1\implementation_plan.md'; Get-Content -LiteralPath 'C:\Users\Shar\.gemini\antigravity-ide\brain\6007a787-39f1-42a2-815f-23d5558952f1\walkthrough.md'; Get-Content luarules/gadgets/ai_techai.lua -TotalCount 180; rg --files luarules | Select-String 'techai|tech_ai'; Get-ChildItem -Path .,..,../.. -Filter AGENTS.md`
> - Ran `rg -n '^local function|^function gadget|GetAllUnits|GetUnitsIn|GetCommandQueue|GetUnitNearestEnemy' luarules/gadgets/ai_techai.lua; rg --files -g '*test*ai*' -g '*check*lua*'; Get-Command lua*,python* -ErrorAction SilentlyContinue | Select-Object Name,Source`
> - Ran `$p='luarules/gadgets/ai_techai.lua'; $s=Get-Content $p; $s[1110..1335]; $s[2860..3228]; $s[3300..3608]`
>
> </details>
>
> I found several concrete weaknesses: factories prioritize ten builders each before fighting, production counts queue entries instead of queued units, and the army manager can overwrite raider and artillery micro. The threat scanner also reads hidden enemies and calls an undefined function. I’m fixing those foundations before tuning aggression.
>
> <details><summary>Edited a file, ran 6 commands, searched the web</summary>
>
> - Ran `$s=Get-Content luarules/gadgets/ai_techai.lua; $s[610..659]; $s[1430..1475]; $s[1540..1670]; $s[1671..1780]; $s[1832..1865]; $s[2788..2835]; rg --files 'C:/Users/Shar/Documents/My Games/Spring' -g '*lua*.exe' -g '*lua*.dll' -g '*test*ai*' -g '*check*lua*' -g '*Read*.lua' | Select-Object -First 30; where.exe python; where.exe node`
>
> - Ran `$s=Get-Content luarules/gadgets/ai_techai.lua; $s[1470..1540]; $s[1780..1831]; $s[1960..2058]; Get-ChildItem 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies' | Select-Object Name; rg --files 'C:/Users/Shar/.cache/codex-runtimes' -g '*lua*' -g python.exe | Select-Object -First 25`
>
> Searched the web for `site.beyondallreason.github.io Recoil Lua GetFullBuildQueue GetUnitNearestEnemy GetUnitLosState`
>
> - Ran `& 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' -c "import importlib.util; print({x:bool(importlib.util.find_spec(x)) for x in ['lupa','luaparser']})"; rg -n 'spGetUnitIsBuilding|spGetUnitTeam|radarBlips|registered' luarules/gadgets/ai_techai.lua; rg --files -g '*LuaSyncedRead*' -g '*spring*.exe' -g '*recoil*.exe' 'C:/Users/Shar/Documents/My Games/Spring' | Select-Object -First 20`
>
> Searched the web for `https://raw.githubusercontent.com/beyond-all-reason/RecoilEngine/2025.06.05/rts/Lua/LuaSyncedRead.cpp`
>
> - Ran `& 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' -m pip install --target .techai-test-runtime lupa`
>
> - Ran `New-Item -ItemType Directory -Force -Path tests/techai | Out-Null; Copy-Item -LiteralPath luarules/gadgets/ai_techai.lua -Destination tests/techai/ai_techai.before.lua`
>
> - Wrote `./luarules/gadgets/ai_techai.lua` (+27 -3)
>
> - Ran `& 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' -m pip install --target .techai-test-runtime lupa`
>
> </details>
>
> The biggest CPU problem is repeated registration: every two seconds the scanner re-adds existing factories and combat units, inflating the AI’s lists indefinitely. I’m making registration idempotent and adding executable regression tests for that, production limits, and tactical order conflicts.
>
> <details><summary>Created a file, edited a file, ran 6 commands</summary>
>
> - Wrote `./luarules/gadgets/ai_techai.lua` (+25 -13)
> - Ran `$s=Get-Content luarules/gadgets/ai_techai.lua; $s[895..938]; $s[660..714]; Get-Content luaai.lua -TotalCount 90; Get-Content modinfo.lua -TotalCount 45`
> - Wrote `./tests/techai/upgrade.py` (+121 -0)
> - Ran `& 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' tests/techai/upgrade.py`
> - Ran `$s=Get-Content luarules/gadgets/ai_techai.lua; $s[330..550]; $s[2990..3035]; $s[2820..2870]; $s[1290..1375]; Get-ChildItem 'C:/Users/Shar/Documents/My Games/Spring/engine/recoil_2025.06.05_amd64-windows' -Filter '*.dll' | Select-Object Name`
> - Wrote `./luarules/gadgets/ai_techai.lua` (+6 -5)
> - Ran `& 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' -c "import sys;sys.path.insert(0,'.techai-test-runtime');from lupa.lua51 import LuaRuntime;from pathlib import Path;l=LuaRuntime();l.execute('assert(loadstring(...))',Path('luarules/gadgets/ai_techai.lua').read_text());print('Lua 5.1 compilation passed')"`
> - Ran `Get-ChildItem .techai-test-runtime/lupa | Select-Object Name; & 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' -c "import sys;sys.path.insert(0,'.techai-test-runtime');from lupa import LuaRuntime;from pathlib import Path;l=LuaRuntime();print(l.lua_version);l.execute('assert(load(...))',Path('luarules/gadgets/ai_techai.lua').read_text());print('Lua compilation passed')"`
> - Ran `Get-ChildItem .techai-test-runtime/lupa | Select-Object Name; & 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' -c "import sys;sys.path.insert(0,'.techai-test-runtime');from lupa.lua51 import LuaRuntime;from pathlib import Path;l=LuaRuntime();l.execute('assert(loadstring(...))',Path('luarules/gadgets/ai_techai.lua').read_text());print('Lua 5.1 compilation passed')"`
>
> </details>
>
> I also found a unit-classification bug: the AI compares engine speeds against source-file values, so ordinary fighting units can be treated as scouts. That’s corrected. Production now budgets builders across the whole team, and retreat and artillery micro have priority over army movement.
>
> <details><summary>Created 3 files, edited 2 files, ran 2 commands</summary>
>
> - Wrote `./tests/techai/fixture.lua` (+82 -0)
> - Wrote `./tests/techai/regression.lua` (+65 -0)
> - Wrote `./tests/techai/run.py` (+16 -0)
> - Ran `& 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' tests/techai/run.py`
> - Wrote `./luarules/gadgets/ai_techai.lua` (+39 -19)
> - Wrote `./tests/techai/regression.lua` (+1 -0)
> - Ran `& 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' tests/techai/run.py`
>
> </details>
>
> The first regression run passes: 61 assertions cover all six faction fixtures, duplicate registration, queue limits, fog-of-war filtering, retreat, and artillery order priority. I’m tightening expansion reservations and adding checks that a small raid doesn’t pull the entire army home.
>
> <details><summary>Edited 2 files, ran 6 commands</summary>
>
> - Ran `rg -n 'claimedSpots\[|canAttackAir|SectorGrid|lastSeenFrame' luarules/gadgets/ai_techai.lua; $s=Get-Content luarules/gadgets/ai_techai.lua; $s[938..1040]; $s[720..758]; $s[1900..1995]`
> - Wrote `./luarules/gadgets/ai_techai.lua` (+20 -21)
> - Ran `& 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' tests/techai/run.py`
> - Wrote `./tests/techai/regression.lua` (+27 -0)
> - Ran `& 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' tests/techai/run.py`
> - Ran `$s=Get-Content luarules/gadgets/ai_techai.lua; $s[580..620]; $s[2845..2900]; $s[3260..3305]; rg -n 'currentFrame \+ 1800|claimedSpots\[|GetFactoryBuilderCount' luarules/gadgets/ai_techai.lua; Get-Content 'C:/Users/Shar/Documents/My Games/Spring/infolog.txt' -Tail 12 -ErrorAction SilentlyContinue`
> - Ran `@'
> from pathlib import Path
> p=Path('luarules/gadgets/ai_techai.lua')
> s=p.read_text()
> a=s.index('local function GetFactoryBuilderCount('); b=s.index('local function GetBestBuilderDefForFactory(',a); s=s[:a]+s[b:]
> a=s.index('\t\t\tif #ai.aaUnits > 0 then',s.index('local function ManageMilitaryForces(')); b=s.index('\n\t\tend\n\telseif #readyCombat',a); s=s[:a]+s[b:]
> s=s.replace('\nInitMorphTable()\n','\n')
> p.write_text(s)
> '@ | & 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe'`
> - Wrote `./luarules/gadgets/ai_techai.lua` (+13 -6)
> - Ran `& 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' tests/techai/run.py`
>
> </details>
>
> All 78 regression assertions now pass. They include six-faction openings, recovery from cancelled mex reservations, commander escape during queued construction, and limited base-defense responses. The changes are in your game folder; match strength and frame-time gains still need validation in Recoil battles.
>
> <details><summary>Created a file, edited a file, ran 2 commands</summary>
>
> - Wrote `./tests/techai/README.md` (+37 -0)
> - Wrote `./tests/techai/run.py` (+2 -1)
> - Ran `Move-Item -LiteralPath tests/techai/ai_techai.before.lua -Destination tests/techai/ai_techai.before.lua.bak; Remove-Item -LiteralPath tests/techai/upgrade.py`
> - Ran `& 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' tests/techai/run.py luajit21`
>
> </details>
</details>

Updated [TechAI](</C:/Users/Shar/Documents/My Games/Spring/games/taaitest.sdd/luarules/gadgets/ai_techai.lua>) after reading both notes.

- Fixed runaway duplicate registration and unnecessary orders.
- Improved army production, builder budgets, and expansion recovery.
- Corrected combat-unit classification.
- Protected retreat and artillery micro.
- Added smarter targets and proportional base defense.

**78 regression assertions pass under both Lua 5.1 and LuaJIT.** Original code is backed up.

Live Recoil battles are still needed to measure performance and playing strength; pro-level results aren’t verified yet.

> i'll let you know if any hiccups occur, thanks for the help

You’re welcome! If anything crops up, send the symptoms and relevant `infolog.txt` lines, and I’ll trace it.

> validate from the infolog.txt, the AI (in 4vs4) seems to stall, after building the 3 builders for mex gathering, they build the mex but then suddenly stop, while the additional builders go to near the centre of the map then do nothing, another AI is also producing a swarm of units but is only sending them to the centre of the map, the ai stops building things and expanding the base by this point

<details><summary>5 previous messages</summary>

> I’ll check `infolog.txt` for errors, then trace why builders and combat units get stuck after the opening.
>
> <details><summary>Ran 4 commands</summary>
>
> - Ran `Get-Content 'C:/Users/Shar/Documents/My Games/Spring/infolog.txt' -Tail 100; rg -n 'TechAI|Error|error|stack traceback' 'C:/Users/Shar/Documents/My Games/Spring/infolog.txt' | Select-Object -Last 100; Get-ChildItem -Filter AGENTS.md; Get-Content tests/techai/README.md`
> - Ran `$s=Get-Content luarules/gadgets/ai_techai.lua; $s[2570..2660]; rg -n 'string.format|local project|local .*Tech|local .*Count' luarules/gadgets/ai_techai.lua | Select-Object -Last 40; $e=Select-String -Path 'C:/Users/Shar/Documents/My Games/Spring/infolog.txt' -Pattern 'Error:.*ai_techai'; $e | Select-Object -First 3; $e.Count; $e.Line | ForEach-Object { $_ -replace '^.*trace=', '' } | Group-Object | Select-Object Count,Name; rg -n '\[TechAI\]' 'C:/Users/Shar/Documents/My Games/Spring/infolog.txt' | Select-Object -Last 10`
> - Ran `rg -n 'local .* = .*and Find|or FindSafe|and FindBase' luarules/gadgets/ai_techai.lua; $s=Get-Content luarules/gadgets/ai_techai.lua; $s[2275..2400]; $s[2730..2840]; Copy-Item 'C:/Users/Shar/Documents/My Games/Spring/infolog.txt' tests/techai/stall-infolog.txt; @'
> from pathlib import Path
> from collections import Counter
> s=Path('tests/techai/stall-infolog.txt').read_text(errors='replace').splitlines()
> e=[l for l in s if 'Error: [LuaRules::RunCallInTraceback]' in l and 'ai_techai' in l]
> print('Errors:',len(e));print('First:',e[0] if e else None)
> print(Counter(l.split('trace=')[-1] for l in e))
> '@ | & 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe'`
> - Ran `rg -n 'GiveTacticalOrder' luarules/gadgets/ai_techai.lua; $s=Get-Content luarules/gadgets/ai_techai.lua; $s[1640..1675]; $s[2388..2455]; $s[2520..2575]`
>
> </details>
>
> The log confirms 3,029 TechAI runtime errors, starting about 47 seconds into the match. Construction code loses three placement coordinates through Lua’s `and/or` expression, and a tactical-order timestamp is missing in unit creation. These errors abort AI updates, which explains the widespread stalling. My earlier tests missed both paths; I’m adding direct reproductions before fixing them.
>
> The log also shows this match ran on Recoil **2025.06.15**, rather than the stated 2025.06.05 target.
>
> <details><summary>Created a file, edited 3 files, ran 2 commands</summary>
>
> - Ran `Copy-Item luarules/gadgets/ai_techai.lua tests/techai/ai_techai.pre-stall-fix.lua.bak; Get-Content tests/techai/run.py; Get-Content tests/techai/fixture.lua -Tail 30; $s=Get-Content luarules/gadgets/ai_techai.lua; $s[2500..2520]`
> - Wrote `./luarules/gadgets/ai_techai.lua` (+4 -2)
> - Ran `@'
> from pathlib import Path
> import re
> p=Path('luarules/gadgets/ai_techai.lua')
> s=p.read_text()
> pat=r'(?m)^(\s*)local (\w+), (\w+), (\w+), (\w+) = isCommander and (FindBaseExpansionBuildPosition\([^\n]+\))\n\s*or (FindSafeBuildPosition\([^\n]+\))'
> def fix(m):
>     indent=m[1]; names=', '.join(m.group(i) for i in range(2,6))
>     return f'{indent}local {names}\n{indent}if isCommander then\n{indent}\t{names} = {m[6]}\n{indent}end\n{indent}if not {m[2]} then\n{indent}\t{names} = {m[7]}\n{indent}end'
> s,n=re.subn(pat,fix,s); assert n==4,n
> p.write_text(s)
> print('Fixed',n,'multi-result placement expressions')
> '@ | & 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe'`
> - Wrote `./luarules/gadgets/ai_techai.lua` (+8 -2)
> - Wrote `./tests/techai/fixture.lua` (+5 -2)
> - Wrote `./tests/techai/run.py` (+5 -1)
> - Wrote `./tests/techai/stall.lua` (+42 -0)
>
> </details>
>
> System error
>
> You've hit your usage limit. Upgrade to Pro (https://chatgpt.com/explore/pro), visit https://chatgpt.com/codex/settings/usage to purchase more credits or try again at 10:04 PM.
</details>

> continue

<details><summary>4 previous messages</summary>

> I’ll continue with the new stall tests and check that all eight teams keep receiving updates after the opening.
>
> The previous test run was blocked by automatic approval review because of a usage-limit error. It did not execute, so the fixes are still unverified.
>
> <details><summary>Edited a file, ran 3 commands</summary>
>
> - Ran `& 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' tests/techai/run.py`
> - Ran `$s=Get-Content luarules/gadgets/ai_techai.lua; $s[2180..2328]; Get-Content tests/techai/stall.lua`
> - Wrote `./luarules/gadgets/ai_techai.lua` (+19 -3)
> - Ran `& 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' tests/techai/run.py`
>
> </details>
>
> The fixes now pass the eight-team tests: commanders resume construction, mex builders move on to a second deposit, and base builders replace inherited combat-rally orders with building work.
>
> The tests also exposed an energy-selection problem: a constructor could stall because the faction’s preferred generator wasn’t in its build menu. I added a buildable fallback. All 134 assertions pass under Lua 5.1; I’m checking LuaJIT and confirming the old code fails the new tests.
>
> <details><summary>Edited a file, ran 2 commands</summary>
>
> - Ran `& 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' tests/techai/run.py luajit21; & 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' tests/techai/run.py lua51 tests/techai/ai_techai.pre-stall-fix.lua.bak`
> - Wrote `./tests/techai/README.md` (+23 -0)
> - Ran `rg -n 'frame = frame or|local function HandleUnitCreated|inherited FIGHT|local canBuildEnergy|local px, py, pz, facing$|local fx, fy, fz, ffacing$' luarules/gadgets/ai_techai.lua; rg -n 'and FindBaseExpansion|or FindSafeBuildPosition' luarules/gadgets/ai_techai.lua`
>
> </details>
</details>

Confirmed: `infolog.txt` contains **3,029 TechAI errors** interrupting AI updates after the opening.

Fixed:
- Missing construction coordinates.
- Missing tactical-order timestamps.
- Builders following factory combat-rally orders.
- Energy selection choosing generators a builder cannot construct.

**134 assertions pass under Lua 5.1 and LuaJIT**, including eight-team post-opening tests. The old code fails the new regression.

Changes are saved. Start a fresh match to load them; live-match recovery still needs verification.

> can you improve the AI's resource management and overhaul the weighing of what the units build (essentially giving every builder intelligent behaviours which they can switch on the fly as demand requires, whenever that's to build metal makers or mexs to produce metal, or energy, or even to build more factories (highest tier permittable by resources) TechA has 6 Tiers, the highest tier with factories is T5 which produces powerful airships. Factories should also build units depending on what's needed and what the enemy has brought to the table

<details><summary>5 previous messages</summary>

> I’ll replace the fixed builder roles with demand-based priorities, so constructors can switch between economy, expansion, production, and support. I’ll also check TechA’s actual tier definitions and make factory production respond to both army gaps and observed enemy forces.
>
> <details><summary>Ran a command</summary>
>
> - Ran `rg --files -g AGENTS.md -g '*techai*' -g '*tier*'; rg -n '^local function|techLevel|techlevel|tech_level' luarules/gadgets/ai_techai.lua; Get-Content tests/techai/run.py; Get-ChildItem units | Select-Object -First 10 Name`
>
> </details>
>
> <details><summary>Ran a command</summary>
>
> - Ran `$s=Get-Content luarules/gadgets/ai_techai.lua; $s[198..326]; $s[340..395]; $s[1220..1250]; $s[3400..3515]; Get-Content units/ametalmakerlvl3.lua -TotalCount 75; Get-Content units/abuilderlvl5.lua -TotalCount 55; rg -n 'customParams|customparams|techlevel|tech_level|level' units/arm*lab*.lua | Select-Object -First 25`
>
> </details>
>
> <details><summary>Created a file, ran a command</summary>
>
> - Ran `$s=Get-Content luarules/gadgets/ai_techai.lua; $s[1878..2145]; Get-Content luarules/gadgets/unit_converter.lua -TotalCount 50 -ErrorAction SilentlyContinue; rg -n 'ametalmakerlvl4|energy_conversion' luarules/configs luarules/gadgets -g '*.lua' | Select-Object -First 20; Copy-Item luarules/gadgets/ai_techai.lua tests/techai/ai_techai.pre-demand.lua.bak`
> - Wrote `./luarules/configs/techai_economy.lua` (+85 -0)
>
> </details>
>
> System error
>
> You've hit your usage limit. Upgrade to Pro (https://chatgpt.com/explore/pro), visit https://chatgpt.com/codex/settings/usage to purchase more credits or try again at Sep 12th, 2026 3:05 AM.
</details>

> lets continue

<details><summary>7 previous messages</summary>

> I’m continuing the overhaul. The tier audit found why some progression choices were wrong: several factory filenames don’t match their in-game tiers. For example, `arm_ulab` produces T4 units, while `ashipyardlvl3` produces T5 airships. I’m making the planner use those declared tiers and account for projects already under construction.
>
> <details><summary>Created a file, edited 3 files, ran 5 commands</summary>
>
> - Wrote `./luarules/configs/techai_builder.lua` (+174 -0)
> - Ran `@'
> from pathlib import Path
> p=Path('luarules/gadgets/ai_techai.lua')
> s=p.read_text()
> # Remove fixed role assignment from registration; new builders get their first
> # demand assignment from the scheduler and never inherit a permanent mex role.
> a=s.index('\t\t-- Maximum of 3 dedicated builders'); b=s.index('\n\telseif meta.role == "rezzer"',a)
> s=s[:a]+s[b:]
> # Insert engine-facing scheduler after all placement/threat helpers exist.
> a=s.index('local function ManageBuilder(')
> s=s[:a]+'''local BuilderPlanner = VFS.Include('LuaRules/Configs/techai_builder.lua').Create({
> 	metadata=UnitMetadata, threat=GetThreatAtPosition,
> 	basePosition=FindBaseExpansionBuildPosition, safePosition=FindSafeBuildPosition,
> })
>
> '''+s[a:]
> a=s.index('\t-- Builder Role Assignment:'); b=s.index('\n\tif isCommander and not ai.spawnPos',a); s=s[:a]+s[b:]
> # Remove old commander assistance priority; demand planner selects assistance.
> a=s.index('\t-- 2. Builder Assistance'); b=s.index('\n\tlocal orderOpt',a); s=s[:a]+s[b:]
> # Replace the post-opening rule ladder completely.
> a=s.index('\t-- 3b. Commander Factory Anti-Lingering:'); b=s.index('\n--------------------------------------------------------------------------------\n-- Factory Production Logic',a)
> s=s[:a]+'''\tBuilderPlanner.Manage(ai,builderID,bDefID,teamID,allyTeamID,currentFrame)
> end
> '''+s[b:]
> # Assist repair duties may be interrupted by changed resource demand.
> s=s.replace('if id and id ~= CMD_GUARD and id ~= CMD_PATROL then return end', '''local task = ai.builderTasks and ai.builderTasks[builderID]
> 		if id and id ~= CMD_GUARD and id ~= CMD_PATROL
> 			and not (id == CMD_REPAIR and task and task.role == 'assist') then return end''')
> # Account for newly created structures without double reservation.
> s=s.replace('ai.registeredUnits[unitID] = true', '''ai.registeredUnits[unitID] = true
> 	local task = ai.builderTasks and builderID and ai.builderTasks[builderID]
> 	if task and task.defID == unitDefID then task.unitID = unitID end''')
> s=s.replace('if ai.registeredUnits then ai.registeredUnits[unitID] = nil end','if ai.registeredUnits then ai.registeredUnits[unitID] = nil end\n\t\tif ai.builderTasks then ai.builderTasks[unitID] = nil end')
> s=s.replace('PurgeIntelIfMissing(ai, allyTeamID)\n\t\t\t\tManageUnitMorphs', 'PurgeIntelIfMissing(ai, allyTeamID)\n\t\t\t\tUpdateIncomingThreatProfile(ai, teamID, n)\n\t\t\t\tBuilderPlanner.Refresh(ai, teamID, n)\n\t\t\t\tManageUnitMorphs')
> p.write_text(s)
> '@ | & 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe'`
> - Wrote `./tests/techai/fixture.lua` (+2 -1)
> - Ran `Get-Content luarules/configs/maker_defs.lua -TotalCount 100; rg -n 'mmUse|mmLevel|CMD.ONOFF|GetUnitIsActive|SetUnitResourcing|mmCapacity' luarules/gadgets/game_energy_conversion.lua; rg -n 'local function ManageFactory|UpdateIncoming|GetProductionSnapshot|isMexBuilder|mexBuilders' luarules/gadgets/ai_techai.lua`
> - Ran `$s=Get-Content luarules/gadgets/game_energy_conversion.lua; $s[275..330]; $s[425..455]; $s[90..155]; $s[355..415]`
> - Ran `@'
> from pathlib import Path
> p=Path('luarules/gadgets/ai_techai.lua')
> s=p.read_text();a=s.index('local function ManageEnergyConverters(');b=s.index('local function ManageRetreatAndRepair(',a)
> s=s[:a]+'''local function ManageEnergyConverters(ai, teamID, currentFrame)
> 	if currentFrame - (ai.lastConverterCheckFrame or -30) < 30 then return end
> 	ai.lastConverterCheckFrame = currentFrame
> 	-- TechA's conversion gadget controls makers through a team energy reserve,
> 	-- not CMD.ONOFF. Leave the actual conversion and efficiency ordering to it.
> 	if not Spring.SetTeamRulesParam then return end
> 	local energy, storage, _, income, expense = spGetTeamResources(teamID, 'energy')
> 	if not energy or not storage or storage <= 0 then return end
> 	local metal, metalStorage = spGetTeamResources(teamID, 'metal')
> 	local net = (income or 0) - (expense or 0)
> 	local emergency = energy < storage * 0.20 or (net < 0 and energy / -net < 12)
> 	local reserve = emergency and 0.95 or 0.70
> 	if not emergency and net >= 0 and metal and metalStorage and metal < metalStorage * 0.30 then reserve=0.55 end
> 	if not ai.converterReserve or math.abs(ai.converterReserve-reserve)>0.01 then
> 		Spring.SetTeamRulesParam(teamID,'mmLevel',reserve)
> 		ai.converterReserve=reserve
> 	end
> end
>
> '''+s[b:];p.write_text(s)
> '@ | & 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe'`
> - Wrote `./luarules/configs/techai_builder.lua` (+6 -2)
> - Wrote `./luarules/configs/techai_economy.lua` (+1 -1)
> - Ran `Get-ChildItem luarules/configs/techai* | Select-Object Name; Get-Content tests/techai/run.py -Tail 10`
>
> </details>
>
> The fixed “three mex builders” assignment is gone. Builders now share a resource forecast, reserve new projects, and choose from their own build menus. This lets the team divide work between metal, energy, factories, and support without every constructor spending the same resources twice.
>
> I also found that TechA’s metal makers use a team energy-reserve setting, so I’m replacing the AI’s ineffective on/off orders with that control.
>
> <details><summary>Ran 2 commands</summary>
>
> - Ran `rg -n 'layer|name' luarules/gadgets/game_energy_conversion.lua | Select-Object -First 5; $s=Get-Content luarules/gadgets/ai_techai.lua; $s[510..550]; $s[2230..2305]`
> - Ran `@'
> from pathlib import Path
> p=Path('luarules/gadgets/ai_techai.lua');s=p.read_text()
> a=s.index('local function UpdateIncomingThreatProfile(');b=s.index('-- Count actual units',a)
> s=s[:a]+'''local function UpdateIncomingThreatProfile(ai, teamID, currentFrame)
> 	if currentFrame - (ai.threatProfile.lastScanFrame or -90) < 90 then return end
> 	local profile = {air=0,heavy=0,raider=0,artillery=0,sea=0,lastScanFrame=currentFrame}
> 	local enemy = {air=0,ground=0,heavy=0,raider=0,artillery=0,defense=0,sea=0}
> 	local allyTeamID = select(6,spGetTeamInfo(teamID))
> 	local bx = ai.spawnPos and ai.spawnPos.x or MAP_SIZE_X/2
> 	local bz = ai.spawnPos and ai.spawnPos.z or MAP_SIZE_Z/2
> 	ai.intel.contacts = ai.intel.contacts or {}
> 	for _, id in ipairs(spGetUnitsInCylinder(bx,bz,2600) or {}) do
> 		local team=S​​pring.GetUnitTeam(id)
> 		local los=spGetUnitLosState(id,allyTeamID)
> 		if team and not spAreTeamsAllied(teamID,team) and los and los.los then
> 			local x,_,z=spGetUnitPosition(id)
> 			if x then ai.intel.contacts[id]={defID=spGetUnitDefID(id),x=x,z=z,frame=currentFrame} end
> 		end
> 	end
> 	for id,contact in pairs(ai.intel.contacts) do
> 		local los=spGetUnitLosState(id,allyTeamID)
> 		if los and los.los then
> 			local x,_,z=spGetUnitPosition(id)
> 			if x then contact.x,contact.z,contact.frame=x,z,currentFrame end
> 		end
> 		local age=currentFrame-contact.frame
> 		local meta=UnitMetadata[contact.defID]
> 		if age>900 or not meta then ai.intel.contacts[id]=nil
> 		else
> 			local role=meta.canFly and 'air' or (meta.role=='defense' and 'defense'
> 				or (meta.role=='artillery' and 'artillery' or (meta.role=='raider' and 'raider' or 'heavy')))
> 			local weight=math.min(12,math.max(1,math.sqrt((meta.metalCost or 100)/200))) * (1-age/1200)
> 			if meta.isArmed then
> 				enemy[role]=enemy[role]+weight
> 				if role~='air' and role~='defense' then enemy.ground=enemy.ground+weight end
> 				if role~='defense' and (contact.x-bx)^2+(contact.z-bz)^2<2600^2 then profile[role]=profile[role]+1 end
> 			end
> 		end
> 	end
> 	ai.threatProfile,ai.productionEnemy=profile,enemy
> end
>
> '''.replace('S​​pring','Spring')+s[b:]
> a=s.index('function gadget:UnitDamaged(');b=s.index('function gadget:UnitGiven(',a)
> s=s[:a]+'''function gadget:UnitDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponDefID, projectileID, attackerID, attackerDefID, attackerTeam)
> 	local ai=aiTeams[unitTeam]
> 	if not ai or not attackerID or not attackerTeam or spAreTeamsAllied(unitTeam,attackerTeam) then return end
> 	local los=spGetUnitLosState(attackerID,select(6,spGetTeamInfo(unitTeam)))
> 	if los and los.los then
> 		local x,_,z=spGetUnitPosition(attackerID)
> 		if x then
> 			ai.intel.contacts=ai.intel.contacts or {}
> 			ai.intel.contacts[attackerID]={defID=attackerDefID,x=x,z=z,frame=Spring.GetGameFrame()}
> 		end
> 	end
> end
>
> '''+s[b:]
> a=s.index('function gadget:UnitEnteredLos(');b=s.index('function gadget:UnitEnteredRadar(',a)
> s=s[:a]+'''function gadget:UnitEnteredLos(unitID, unitTeam, allyTeam, unitDefID)
> 	for _,ai in pairs(aiTeams) do
> 		if select(6,spGetTeamInfo(ai.teamID))==allyTeam and not spAreTeamsAllied(ai.teamID,unitTeam) then
> 			RecordEnemyBuildingInLOS(ai,unitID,unitDefID)
> 			local x,_,z=spGetUnitPosition(unitID)
> 			if x then
> 				ai.intel.contacts=ai.intel.contacts or {}
> 				ai.intel.contacts[unitID]={defID=unitDefID,x=x,z=z,frame=Spring.GetGameFrame()}
> 			end
> 		end
> 	end
> end
>
> '''+s[b:]
> p.write_text(s)
> '@ | & 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe'`
>
> </details>
>
> <details><summary>Ran 3 commands</summary>
>
> - Ran `Get-ChildItem luarules/configs/techai* | Select-Object Name; Get-Content tests/techai/demand.lua -TotalCount 10 -ErrorAction SilentlyContinue`
> - Ran `@'
> from pathlib import Path
> p=Path('luarules/gadgets/ai_techai.lua');s=p.read_text()
> a=s.index('-- Count actual units');b=s.index('--------------------------------------------------------------------------------\n-- Military & Wave Assault Manager',a)
> s=s[:a]+'''local ProductionPlanner = VFS.Include('LuaRules/Configs/techai_production.lua')
>
> -- Count completed units plus every queued unit exactly once across factories.
> local function GetProductionSnapshot(ai)
> 	local pending, depths, counts, unitCounts = {}, {}, {}, {}
> 	local highestBuilderTech=0
> 	for id in pairs(ai.registeredUnits or {}) do
> 		local defID=spGetUnitDefID(id)
> 		local meta=UnitMetadata[defID]
> 		if meta and IsUnitReady(id) then
> 			counts[meta.role]=(counts[meta.role] or 0)+1
> 			unitCounts[defID]=(unitCounts[defID] or 0)+1
> 			if meta.role=='constructor' then highestBuilderTech=math.max(highestBuilderTech,meta.tech or 1) end
> 		end
> 	end
> 	for _,factoryID in ipairs(ai.factories) do
> 		local depth=0
> 		for _,item in ipairs(spGetFullBuildQueue(factoryID) or {}) do
> 			for defID,count in pairs(item) do
> 				pending[defID]=(pending[defID] or 0)+count
> 				unitCounts[defID]=(unitCounts[defID] or 0)+count
> 				local meta=UnitMetadata[defID]
> 				if meta then
> 					counts[meta.role]=(counts[meta.role] or 0)+count
> 					if meta.role=='constructor' then highestBuilderTech=math.max(highestBuilderTech,meta.tech or 1) end
> 				end
> 				depth=depth+count
> 			end
> 		end
> 		depths[factoryID]=depth
> 	end
> 	ai.production={pending=pending,depths=depths,counts=counts,unitCounts=unitCounts,highestBuilderTech=highestBuilderTech}
> end
>
> local function ManageFactory(ai,factoryID,fDefID,teamID)
> 	local production=ai.production
> 	local depth=production.depths[factoryID] or 0
> 	if depth>=3 then return end
> 	local frame=Spring.GetGameFrame()
> 	local demand=BuilderPlanner.Refresh(ai,teamID,frame)
> 	local def=UnitDefs[fDefID]
> 	if not def or not def.buildOptions then return end
> 	local threat=ai.threatProfile
> 	local state={counts=production.counts,unitCounts=production.unitCounts,
> 		enemy=ai.productionEnemy or threat,underAttack=(threat.air+threat.heavy+threat.raider+threat.artillery)>0,
> 		builderTarget=math.min(ai.difficulty.maxBuilders,2+math.floor(demand.metal.income/12)),
> 		scoutTarget=math.min(3,1+math.floor(#ai.combatUnits/25)),
> 		highestBuilderTech=production.highestBuilderTech,desiredTier=UnitMetadata[fDefID].tech,
> 		factoryCount=#ai.factories,factoryBuildSpeed=def.buildSpeed,
> 		resources={metalCurrent=math.max(0,demand.metal.current-demand.committedMetal),metalIncome=demand.metal.income,
> 			energyCurrent=math.max(0,demand.energy.current-demand.committedEnergy),energyIncome=demand.energy.income,
> 			metalExpense=demand.metal.expense,energyExpense=demand.energy.expense}}
> 	while depth<3 do
> 		local project,reason=ProductionPlanner.Choose(def.buildOptions,UnitMetadata,state)
> 		if not project then break end
> 		-- Append production so a live nanoframe is never cancelled.
> 		spGiveOrderToUnit(factoryID,-project,{}, {'shift'})
> 		local meta=UnitMetadata[project]
> 		production.pending[project]=(production.pending[project] or 0)+1
> 		production.unitCounts[project]=(production.unitCounts[project] or 0)+1
> 		production.counts[meta.role]=(production.counts[meta.role] or 0)+1
> 		if meta.role=='constructor' then
> 			production.highestBuilderTech=math.max(production.highestBuilderTech,meta.tech or 1)
> 			state.highestBuilderTech=production.highestBuilderTech
> 		end
> 		ai.factoryChoices=ai.factoryChoices or {}
> 		ai.factoryChoices[factoryID]={defID=project,reason=reason,frame=frame}
> 		depth=depth+1
> 	end
> 	production.depths[factoryID]=depth
> end
>
> '''+s[b:]
> # Old factory helpers no longer used.
> a=s.index('local function FindUnitInBuildOptions(');b=s.index('local function UpdateIncomingThreatProfile(',a);s=s[:a]+s[b:]
> p.write_text(s)
> '@ | & 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe'`
> - Ran `Get-ChildItem luarules/configs/techai* | Select-Object Name; Get-Content luarules/configs/techai_metadata.lua -TotalCount 10 -ErrorAction SilentlyContinue; rg -n '^local function|^function ' luarules/gadgets/ai_techai.lua | Select-Object -Last 20`
>
> </details>
>
> <details><summary>Edited a file, ran a command</summary>
>
> - Ran `@'
> from pathlib import Path
> p=Path('luarules/gadgets/ai_techai.lua');s=p.read_text()
> a=s.index('local UnitMetadata = {}')
> s=s[:a]+'''local Metadata = VFS.Include('LuaRules/Configs/techai_metadata.lua')
> local MakerDefs = VFS.FileExists('LuaRules/Configs/maker_defs.lua') and VFS.Include('LuaRules/Configs/maker_defs.lua') or {}
> '''+s[a:]
> s=s.replace('UnitMetadata[unitDefID] = metaEntry','Metadata.Enrich(unitDefID,udef,metaEntry,WeaponDefs,MakerDefs)\n\t\t\tUnitMetadata[unitDefID] = metaEntry')
> a=s.index('-- Initialize once in gadget:Initialize')
> b=s.rfind('\nend\n',0,a)
> s=s[:b]+'''
> 	-- Rebuild catalog buckets from authoritative enriched metadata. Legacy name
> 	-- guesses above must not override declared tiers or maker/weapon definitions.
> 	for _,cat in pairs(FactionUnitCatalog) do
> 		for key in pairs(cat) do cat[key]={} end
> 		for _,suffix in ipairs({'mex','con','energy','makers','nanotc','defenses','combat'}) do cat['t6'..suffix]={} end
> 	end
> 	local suffixes={mex='mex',factory='factories',constructor='con',energy='energy',converter='makers',nanotower='nanotc',defense='defenses'}
> 	for defID,ud in pairs(UnitDefs) do
> 		local meta=UnitMetadata[defID]
> 		local cat=meta and FactionUnitCatalog[meta.faction]
> 		if cat then
> 			local tier=meta.tech or 1
> 			local suffix=suffixes[meta.role]
> 			local bucket=suffix and ('t'..math.min(tier,meta.role=='factory' and 5 or 6)..suffix)
> 			if meta.role=='commander' then bucket='commanders'
> 			elseif meta.role=='combat' then bucket=tier>=4 and ('t'..tier..'combat') or 'combat'
> 			elseif meta.role=='raider' then bucket='raiders'
> 			elseif meta.role=='scout' then bucket='scouts'
> 			elseif meta.role=='rezzer' then bucket='rezUnits'
> 			elseif meta.role=='aa' or meta.role=='artillery' or meta.role=='radar' then bucket=meta.role end
> 			if bucket then cat[bucket]=cat[bucket] or {}; table.insert(cat[bucket],defID) end
> 			if meta.role=='energy' then
> 				local kind=(ud.windGenerator or 0)>0 and 'wind' or ((ud.tidalGenerator or 0)>0 and 'tidal' or (ud.needGeo and 'geo' or (tier==1 and 'solar')))
> 				if kind then table.insert(cat[kind],defID) end
> 			end
> 			if meta.role=='factory' and tier==1 then
> 				local name=ud.name:lower()
> 				local kind=(name:find('lab') and 'kbot') or (name:find('vp') and 'veh') or (name:find('ap') and 'air') or (name:find('sy') and 'sea') or 'hov'
> 				table.insert(cat['t1'..kind..'_fac'],defID)
> 			end
> 		end
> 	end
> 	for _,cat in pairs(FactionUnitCatalog) do for _,bucket in pairs(cat) do table.sort(bucket) end end
> '''+s[b:]
> p.write_text(s)
> '@ | & 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe'`
> - Wrote `./luarules/configs/techai_builder.lua` (+21 -0)
> - Wrote `./luarules/configs/techai_builder.lua` (+3 -2)
>
> </details>
>
> System error
>
> You've hit your usage limit. Upgrade to Pro (https://chatgpt.com/explore/pro), visit https://chatgpt.com/codex/settings/usage to purchase more credits or try again at 6:01 PM.
</details>

> continue

<details><summary>3 previous messages</summary>

> I’m continuing with integration and testing. The builder planner now covers resource forecasts, shared project budgets, energy emergencies, mex upgrades, and T1–T5 factory selection. I’m finishing the unit metadata and factory-choice logic, then I’ll run the full regression suite.
>
> <details><summary>Explored a file, ran 4 commands</summary>
>
> - Ran `& 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' -c "import sys;sys.path.insert(0,'.techai-test-runtime');from lupa.lua51 import LuaRuntime;from pathlib import Path;l=LuaRuntime();paths=[Path('luarules/gadgets/ai_techai.lua'),*Path('luarules/configs').glob('techai_*.lua')];[(l.execute('assert(loadstring(...))',p.read_text()),print('Compiled',p.name)) for p in paths]"`
>
> - Ran `$s=Get-Content luarules/gadgets/ai_techai.lua; $s[1400..1480]; Get-Content tests/techai/stall.lua -TotalCount 50; rg -n 'spGetTeamResources|reserved' luarules/gadgets/ai_techai.lua | Select-Object -First 30`
>
> - Ran `@'
> from pathlib import Path
> p=Path('luarules/gadgets/ai_techai.lua');s=p.read_text()
> a=s.index('\t-- 1b. Commander Morphing:');b=s.index('\t-- Dedicated Rezzer Unit Behavior:',a);s=s[:a]+s[b:]
> s=s.replace('if ai.activeMorphTarget then return end\n\n\tlocal candidates', '''if ai.activeMorphTarget then return end
> 	local demand=ai.demand
> 	if demand then
> 		if demand.energy.current<demand.energy.storage*0.4 or demand.energy.income<demand.energy.expense then return end
> 		mcur=math.max(0,mcur-demand.committedMetal)
> 		ecur=math.max(0,ecur-demand.committedEnergy)
> 	end
>
> 	local candidates''')
> s=s.replace('local hasSafeEco = (mcur >= opt.metal * 0.75) and (ecur >= opt.energy * 0.75)', 'local hasSafeEco = (spGetUnitCommandCount(unitID) == 0) and (mcur >= opt.metal) and (ecur >= opt.energy)')
> s=s.replace('ai.reservedMetal = opt.metal\n\t\t\t\t\tai.reservedEnergy = opt.energy','ai.reservedMetal = opt.metal\n\t\t\t\t\tai.reservedEnergy = opt.energy\n\t\t\t\t\tai.demand = nil')
> p.write_text(s)
> p=Path('tests/techai/stall.lua');s=p.read_text();s=s.replace(' test.ManageBuilder(', ' frame=frame+30; test.ManageBuilder(')
> s=s.replace('queues[b+11]={}; test.ManageBuilder(ai,b+11,b+5,team,team,frame+30)', 'queues[b+11]={}; frame=frame+30; test.ManageBuilder(ai,b+11,b+5,team,team,frame)')
> s=s.replace('-- Give three constructors the mex role, then a fourth the base role.', '-- Add four interchangeable constructors; all can respond to demand.')
> s=s.replace('for n=200,500 do frame=n; gadget:GameFrame(n) end','local startFrame=frame+1\nfor n=startFrame,startFrame+300 do frame=n; gadget:GameFrame(n) end')
> p.write_text(s)
> '@ | & 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe'`
>
> <details><summary>Explored a file</summary>
>
> - Read `./luarules/configs/techai_production.lua`
>
> </details>
>
> - Ran `Get-Content luarules/configs/techai_metadata.lua -Tail 95; Get-Content tests/techai/demand.lua -TotalCount 30`
>
> </details>
>
> System error
>
> You've hit your usage limit. Upgrade to Pro (https://chatgpt.com/explore/pro), visit https://chatgpt.com/codex/settings/usage to purchase more credits or try again at Sep 13th, 2026 12:23 AM.
</details>

> continue

<details><summary>6 previous messages</summary>

> I’ll resume testing the integrated overhaul and address any failures before handing it back.
>
> The last test run was blocked by automatic approval review because of a usage-limit error, so it did not execute. The updated code remains unverified.
>
> <details><summary>Ran a command</summary>
>
> - Ran `& 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' tests/techai/run.py`
>
> </details>
>
> <details><summary>Edited 3 files, ran 2 commands</summary>
>
> - Wrote `./tests/techai/run.py` (+4 -0)
> - Wrote `./tests/techai/stall.lua` (+2 -2)
> - Ran `& 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' tests/techai/run.py`
> - Wrote `./luarules/configs/techai_builder.lua` (+14 -3)
> - Ran `& 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' tests/techai/run.py`
>
> </details>
>
> Testing found a placement conflict: two builders could choose the same empty site, leaving the second without a usable job. The planner now searches for another site.
>
> I’m also checking emergency power recovery. A barely started fusion shouldn’t prevent builders from adding cheap generators that can restore power sooner.
>
> <details><summary>Edited a file, ran a command</summary>
>
> - Wrote `./tests/techai/stall.lua` (+1 -1)
> - Ran `& 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' tests/techai/run.py`
>
> </details>
>
> System error
>
> You've hit your usage limit. Upgrade to Pro (https://chatgpt.com/explore/pro), visit https://chatgpt.com/codex/settings/usage to purchase more credits or try again at 5:42 AM.
</details>

> continue

<details><summary>9 previous messages</summary>

> I’m continuing the final checks. One remaining regression concerns when the planner chooses factory capacity over more metal income. I’m tracing that decision and tightening budget accounting before the final test run.
>
> <details><summary>Edited 4 files, ran 5 commands</summary>
>
> - Wrote `./tests/techai/stall.lua` (+5 -1)
> - Ran `& 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' tests/techai/run.py`
> - Wrote `./tests/techai/fixture.lua` (+1 -1)
> - Wrote `./tests/techai/stall.lua` (+0 -4)
> - Ran `& 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' tests/techai/run.py`
> - Ran `Get-Content tests/techai/demand.lua -Tail 45; Get-Content tests/techai/metadata.lua -Tail 25; rg -n 'incoming|factoryUtilization|committed|spGetFullBuildQueue|production.strength' luarules/configs/techai_builder.lua luarules/gadgets/ai_techai.lua`
> - Wrote `./luarules/configs/techai_builder.lua` (+22 -2)
> - Wrote `./luarules/configs/techai_economy.lua` (+1 -0)
> - Wrote `./tests/techai/stall.lua` (+2 -1)
> - Ran `@'
> from pathlib import Path
> p=Path('luarules/gadgets/ai_techai.lua');s=p.read_text()
> s=s.replace('local pending, depths, counts, unitCounts = {}, {}, {}, {}','local pending, depths, counts, unitCounts, strength = {}, {}, {}, {}, {}')
> s=s.replace('counts[meta.role]=(counts[meta.role] or 0)+1','counts[meta.role]=(counts[meta.role] or 0)+1\n\t\t\tstrength[meta.role]=(strength[meta.role] or 0)+math.min(12,math.max(1,math.sqrt((meta.metalCost or 100)/200)))',1)
> s=s.replace('counts[meta.role]=(counts[meta.role] or 0)+count','counts[meta.role]=(counts[meta.role] or 0)+count\n\t\t\t\t\tstrength[meta.role]=(strength[meta.role] or 0)+count*math.min(12,math.max(1,math.sqrt((meta.metalCost or 100)/200)))',1)
> s=s.replace('ai.production={pending=pending,depths=depths,counts=counts,unitCounts=unitCounts,highestBuilderTech=highestBuilderTech}', 'ai.production={pending=pending,depths=depths,counts=counts,unitCounts=unitCounts,strength=strength,highestBuilderTech=highestBuilderTech,frame=Spring.GetGameFrame()}')
> s=s.replace('if depth>=3 then return end','local limit=(UnitMetadata[fDefID].tech or 1)>=3 and 1 or 3\n\tif depth>=limit then return end')
> s=s.replace('local state={counts=production.counts,unitCounts=production.unitCounts,','local state={counts=production.counts,unitCounts=production.unitCounts,strength=production.strength,isWaterMap=ai.isWaterMap,')
> s=s.replace('while depth<3 do','while depth<limit do')
> s=s.replace('production.counts[meta.role]=(production.counts[meta.role] or 0)+1', 'production.counts[meta.role]=(production.counts[meta.role] or 0)+1\n\t\tproduction.strength[meta.role]=(production.strength[meta.role] or 0)+math.min(12,math.max(1,math.sqrt((meta.metalCost or 100)/200)))')
> s=s.replace('UpdateIncomingThreatProfile(ai, teamID, n)\n\t\t\t\tBuilderPlanner.Refresh','UpdateIncomingThreatProfile(ai, teamID, n)\n\t\t\t\tGetProductionSnapshot(ai)\n\t\t\t\tBuilderPlanner.Refresh')
> s=s.replace('\n\t\t\t\tGetProductionSnapshot(ai)\n\t\t\t\tfor _, fID','\n\t\t\t\tfor _, fID')
> s=s.replace("local role=meta.canFly and 'air' or (meta.role=='defense'", "local role=meta.canFly and 'air' or (meta.isWater and 'sea') or (meta.role=='defense'")
> p.write_text(s)
> '@ | & 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe'`
> - Ran `& 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' tests/techai/run.py`
>
> </details>
>
> The full suite passes so far. Advanced factories now keep short queues so they can respond to new threats sooner, and anti-air demand compares unit strength rather than treating an expensive AA ship as equivalent to one cheap unit.
>
> I’m adding final tests for groups of interchangeable builders and recovery from power stalls.
>
> <details><summary>Created a file, edited a file, ran a command</summary>
>
> - Wrote `./tests/techai/run.py` (+5 -1)
> - Wrote `./tests/techai/scheduler.lua` (+67 -0)
> - Ran `& 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' tests/techai/run.py`
>
> </details>
>
> if no mex deposits are present, the AI will build metal makers when possible
>
> I’ll make that explicit: when no mex deposits are available, builders will use metal makers when they can afford and power them. If more energy is needed first, they’ll build generation to support conversion.
>
> <details><summary>Edited 4 files, ran 5 commands</summary>
>
> - Wrote `./luarules/configs/techai_builder.lua` (+3 -6)
> - Wrote `./luarules/configs/techai_economy.lua` (+16 -1)
> - Ran `$s=Get-Content luarules/gadgets/ai_techai.lua; $s[1070..1140]; $s[2030..2078]; rg -n 'Fallback if no discrete|not spot|not metalSpots|FindSafeBuildPosition\(.*[Mm]ex' luarules/gadgets/ai_techai.lua`
> - Ran `$s=Get-Content luarules/gadgets/ai_techai.lua; $s[1143..1199]; $s[2093..2123]`
> - Ran `@'
> from pathlib import Path
> p=Path('luarules/gadgets/ai_techai.lua');s=p.read_text()
> s=s.replace('local function ExecuteCommanderOpeningQueue(ai, builderID, udef, teamID)\n', '''local function ExecuteCommanderOpeningQueue(ai, builderID, udef, teamID)
> 	if #(GG.metalSpots or _G.metalSpots or {})==0 then return false end
> ''')
> a=s.index('\t\t-- Continuous metal map fallback:');b=s.index('\n\tend\n\n\tai.openingSequenceQueued',a)
> s=s[:a]+'''\t\t-- No local deposits: begin with power and production. Expansion builders
> 		-- can seek distant deposits, or use conversion as demand permits.
> 		for step=1,2 do
> 			local x,y,z,f=FindSafeBuildPosition(energyDef,cx+step*80,cz,220,36)
> 			if x then QueueOrder(energyDef,x,y,z,f); ai.commanderEnergyCount=(ai.commanderEnergyCount or 0)+1 end
> 		end
> 		local x,y,z,f=FindSafeBuildPosition(facDef,cx,cz,340,64)
> 		if x then QueueOrder(facDef,x,y,z,f);ai.openingFactoryOrdered=true end
> '''+s[b:]
> a=s.index('\t\t\t\t\tlocal mx, my, mz, mfacing = FindSafeBuildPosition(targetMexDef');b=s.index('\n\t\t\t\tend\n\t\t\telse',a)
> s=s[:a]+'''\t\t\t\t\tai.commanderMexCount = 2'''+s[b:]
> s=s.replace('-- 3. Commander Opening Sequence (BARb Style Shift-Queuing)\n', '''-- 3. Commander Opening Sequence (BARb Style Shift-Queuing)
> 	if #(GG.metalSpots or _G.metalSpots or {})==0 then
> 		BuilderPlanner.Manage(ai,builderID,bDefID,teamID,allyTeamID,currentFrame)
> 		return
> 	end
> ''')
> s=s.replace('if (meta.role == "rezzer" or meta.canResurrect) and not isCommander then','if meta.role == "rezzer" and not isCommander then')
> p.write_text(s)
> '@ | & 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe'`
> - Wrote `./tests/techai/fixture.lua` (+5 -1)
> - Ran `& 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' tests/techai/run.py`
> - Wrote `./tests/techai/scheduler.lua` (+17 -0)
> - Ran `& 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' tests/techai/run.py luajit21`
>
> </details>
>
> The no-deposit tests pass: builders choose metal makers when spare power is available and add generation first when it isn’t. They no longer place mexes at arbitrary locations.
>
> The overhaul now passes 281 assertions under LuaJIT, including the eight-team scheduler tests. I’m checking Lua 5.1 and updating the change notes.
>
> <details><summary>Edited 2 files, ran a command</summary>
>
> - Wrote `./luarules/gadgets/ai_techai.lua` (+11 -2)
> - Wrote `./tests/techai/README.md` (+37 -0)
> - Ran `& 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' tests/techai/run.py; & 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' tests/techai/run.py luajit21`
>
> </details>
</details>

Implemented the resource-management overhaul:

- Builders switch duties according to demand and shared budgets.
- No mex deposits → metal makers, with extra energy built first when needed.
- Factory selection respects actual tiers and affordability, up to T5 airship factories.
- Unit production responds to army shortages and observed enemy forces.
- T6 units and economy are recognized.

**281 assertions pass under Lua 5.1 and LuaJIT.** Start a fresh match to load it. Live-match performance still needs validation; `infolog.txt` now includes periodic economy summaries.

> update the building logic to do the following
>
> [1] avoid obstructing the entrance of factories
> [2] avoid building minelayers when a builder is requested (this is a particular problem with rumad air factories)
> [3] allocate sectors near the commander to a particular type of building (excluding mexes)
> [4] perform a second scan after spawning in for mex points (particular for maps like Techno Lands which spawn 4 mexes near a commander's spawn point

<details><summary>4 previous messages</summary>

> I’ll check factory clearance, builder classification, and metal-spot initialization, then add building sectors near the commander and a second scan after spawn.
>
> <details><summary>Ran a command</summary>
>
> - Ran `rg -n '^local function|InitMetalMap|GameStart|GameFrame|CatalogUnits' luarules/gadgets/ai_techai.lua; Get-Content luarules/configs/techai_builder.lua; Get-Content luarules/configs/techai_metadata.lua -TotalCount 85; rg -n 'minelayer|Mine Layer|MineLayer|mine layer' units -g 'rumad*' | Select-Object -First 25`
>
> </details>
>
> <details><summary>Ran a command</summary>
>
> - Ran `$s=Get-Content luarules/gadgets/ai_techai.lua; $s[785..948]; $s[620..658]; rg -n 'metalSpots|GetMetalAmount|SetMetalAmount|mexes|mexspots' luarules -g '*.lua' | Select-Object -First 45; rg -n 'footprint|buildangle|yardmap' units/ashipyardlvl3.lua units/rumad_yard.lua units/rumad_ap.lua; Get-Content tests/techai/run.py`
>
> </details>
>
> System error
>
> You've hit your usage limit. Upgrade to Pro (https://chatgpt.com/explore/pro), visit https://chatgpt.com/codex/settings/usage to purchase more credits or try again at Sep 14th, 2026 1:24 AM.
</details>

> continue

<details><summary>8 previous messages</summary>

> I’ll continue with the four changes. The map audit confirmed that Techno Lands creates its starting mex patches after the existing metal scan, so a delayed rescan is needed. I’ll also test factory clearance using footprint rectangles and facing, so large buildings can’t overlap an exit lane.
>
> <details><summary>Created a file, ran 3 commands</summary>
>
> - Ran `Copy-Item luarules/gadgets/ai_techai.lua tests/techai/ai_techai.pre-layout.lua.bak; Get-ChildItem luarules/configs/techai* | Select-Object Name`
> - Wrote `./luarules/configs/techai_layout.lua` (+169 -0)
> - Ran `@'
> from pathlib import Path
> import re
> p=Path('luarules/gadgets/ai_techai.lua');s=p.read_text()
> pos=s.index('\nlocal function InferFaction')
> s=s[:pos]+'''
> local BaseLayout = VFS.Include('LuaRules/Configs/techai_layout.lua').Create(UnitMetadata,aiTeams)
> local rawGiveOrderToUnit=spGiveOrderToUnit
> spGiveOrderToUnit=function(unitID,command,params,options)
> 	local result=rawGiveOrderToUnit(unitID,command,params,options)
> 	if result~=false and command<0 and params and params[1] and params[3] then
> 		local ai=aiTeams[spGetUnitTeam(unitID)]
> 		if ai then BaseLayout.Reserve(ai,unitID,-command,params[1],params[3],params[4] or 0) end
> 	end
> 	return result
> end
> '''+s[pos:]
> s=s.replace('local function FindSafeBuildPosition(unitDefID, cx, cz, searchRadius, spacing)\n', '''local function FindSafeBuildPosition(unitDefID, cx, cz, searchRadius, spacing, ai)
> 	if ai then return BaseLayout.Find(ai,unitDefID) end
> ''')
> a=s.index('local function FindBaseExpansionBuildPosition(');b=s.index('local function FindSafeCoreBuildPosition(',a)
> s=s[:a]+'''local function FindBaseExpansionBuildPosition(unitDefID, ai, searchSpacing)
> 	return BaseLayout.Find(ai,unitDefID)
> end
>
> '''+s[b:]
> a=s.index('local function FindSafeCoreBuildPosition(');b=s.index('local function GetClosestFreeMexSpot(',a)
> s=s[:a]+'''local function FindSafeCoreBuildPosition(unitDefID, ai, spacing)
> 	return BaseLayout.Find(ai,unitDefID)
> end
>
> '''+s[b:]
> # Every remaining five-argument simple safe-placement call occurs inside a
> # builder/opening context with ai available. Preserve it for zoning/clearance.
> s=re.sub(r'FindSafeBuildPosition\(([^()\n]+)\)',lambda m:'FindSafeBuildPosition('+m[1]+', ai)' if len(m[1].split(','))==5 else m[0],s)
> s=s.replace('metadata=UnitMetadata, threat=GetThreatAtPosition,','metadata=UnitMetadata, threat=GetThreatAtPosition, layout=BaseLayout,')
> p.write_text(s)
> p=Path('luarules/configs/techai_builder.lua');s=p.read_text()
> s=s.replace('api.safePosition(choice.defID,bx,bz,600,48)','api.safePosition(choice.defID,bx,bz,600,48,ai)')
> s=s.replace('api.safePosition(choice.defID,cx,cz,350,48)','api.safePosition(choice.defID,cx,cz,350,48,ai)')
> s=s.replace('if x and y and z and facing and api.threat(ai,x,z)<250 then','if x and y and z and facing and api.threat(ai,x,z)<250\n\t\t\t\tand (not api.layout or api.layout.Allowed(ai,choice.defID,x,z,facing)) then')
> s=s.replace('S.GiveOrderToUnit(builder,-choice.defID,{x,y,z,facing},0)','S.GiveOrderToUnit(builder,-choice.defID,{x,y,z,facing},0)\n\t\t\t\t\tif api.layout then api.layout.Reserve(ai,builder,choice.defID,x,z,facing) end')
> p.write_text(s)
> '@ | & 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe'`
> - Ran `& 'C:/Users/Shar/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' tests/techai/run.py`
>
> </details>
>
> Context compaction
>
> Source: automatic
> Status: completed
>
> I’m continuing the four building changes, with checks for factory exits, builder selection, base sectors, and mex patches created after spawning.
>
> <details><summary>Ran 5 commands</summary>
>
> - Ran `Get-Content luarules/configs/techai_metal.lua; Get-Content luarules/configs/techai_layout.lua`
> - Ran `rg -n "metalSpots|MetalMap|GameStart|GameFrame|layout|mexUpgrade|upgradeMex|GiveOrder" luarules/gadgets/ai_techai.lua luarules/configs/techai_builder.lua; Get-Content tests/techai/run.py`
> - Ran `rg --files -g AGENTS.md -g '*README*' -g '*metal*' -g '*layout*'; Get-Content luarules/configs/techai_builder.lua; Get-Content tests/techai/README.md`
> - Ran `Get-Content luarules/gadgets/ai_techai.lua | Select-Object -Skip 2450 -First 170; Get-Content luarules/gadgets/ai_techai.lua | Select-Object -Skip 840 -First 215; Get-Content luarules/gadgets/ai_techai.lua | Select-Object -Skip 1390 -First 175`
> - Ran `Get-Content luarules/gadgets/ai_techai.lua | Select-Object -Skip 2440 -First 79; Get-Content luarules/gadgets/ai_techai.lua | Select-Object -Skip 1935 -First 185; Get-Content tests/techai/metal.lua; Get-Content tests/techai/scheduler.lua`
>
> </details>
>
> The minelayer fix now distinguishes construction units from mine-only builders, including Rumad’s air minelayer. Factory clearance is also connected to queued buildings, so builders can reserve an exit before the factory exists.
>
> I’m wiring the delayed mex scan into the economy planner and checking that the sector rules still leave builders usable sites.
>
> <details><summary>Edited 3 files</summary>
>
> - Wrote `./luarules/gadgets/ai_techai.lua` (+21 -13)
> - Wrote `./luarules/configs/techai_builder.lua` (+18 -10)
> - Wrote `./luarules/configs/techai_layout.lua` (+13 -4)
>
