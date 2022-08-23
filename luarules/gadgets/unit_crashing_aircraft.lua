function gadget:GetInfo()
   	return {
   		name = "Crashing Aircraft",
   		desc = "Half of all aircraft destroyed and on the crash list crash instead of exploding",
   		author = "Beherith",
   		date = "aug 2012",
   		license = "PD",
   		layer = 1000,
   		enabled = true,
   	}
   end

   if not gadgetHandler:IsSyncedCode() then return end
   local GetUnitHealth = Spring.GetUnitHealth
   local random = math.random
   local SetUnitCOBValue = Spring.SetUnitCOBValue
   local SetUnitNoSelect = Spring.SetUnitNoSelect
   local SetUnitNoMinimap = Spring.SetUnitNoMinimap
   local SetUnitSensorRadius = Spring.SetUnitSensorRadius
   local DestroyUnit = Spring.DestroyUnit
   local SetUnitWeaponState = Spring.SetUnitWeaponState
   local crashing = {}
   local crashingCount = 0
   local crashable = {}

   function gadget:Initialize()
   	--set up table to check against
   	for _, UnitDef in pairs(UnitDefs) do
   		if UnitDef.canFly == true and UnitDef.transportSize == 0 and (not UnitDef.hoverattack) then
   			crashable[UnitDef.id] = true
   			--Spring.Echo("Air craft set to crash", UnitDef.name)
   		end
   	end
   	--crashable[UnitDefNames['armliche'].id] = false
   end

   function gadget:UnitPreDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponDefID, projectileID, attackerID, attackerDefID, attackerTeam)
   	if paralyzer then return damage, 1 end --OOPS FORGOT THIS
   	if crashing[unitID] then return 0, 0 end --hacky

   	if crashable[unitDefID] and (damage > GetUnitHealth(unitID)) and random() < 0.55 then
   		--NOTE: strafe airmovetype aircraft DO NOT CRASH, only regular stuff like bombers
   		--Spring.Echo('CRASHING AIRCRAFT',unitID)
   		crashingCount = crashingCount + 1
   		crashing[unitID] = Spring.GetGameFrame() + 300

   		for weaponID, weapon in pairs(UnitDefs[unitDefID].weapons) do
   			SetUnitWeaponState(unitID, weaponID, "reloadTime", 9999)
   		end

   		SetUnitCOBValue(unitID, COB.CRASHING, 1)
   		Spring.SetUnitRulesParam(unitID, "nolupsdraw", 1)
   		SetUnitNoMinimap(unitID, true)
   		SetUnitNoSelect(unitID, true) --cause setting to neutral still allows selection (wtf?)
   		SetUnitSensorRadius(unitID, "airLos", 0)
   		SetUnitSensorRadius(unitID, "los", 0)
   		SetUnitSensorRadius(unitID, "radar", 0)
   		SetUnitSensorRadius(unitID, "sonar", 0)
   		--return 0,0--TEST THIS
   	end

   	return damage, 1
   end

   function gadget:GameFrame(gf)
   	if crashingCount > 0 and gf % 20 == 1 then
   		for unitID, deathGameFrame in pairs(crashing) do
   			if gf >= deathGameFrame then
   				DestroyUnit(unitID, false, false)
   			end
   		end
   	end
   end

   function gadget:UnitDestroyed(unitID, unitDefID, teamID, attackerID, attackerDefID, attackerTeamID)
   	if crashing[unitID] then
   		crashingCount = crashingCount - 1
   		--Spring.Echo('CRASHING AIRCRAFT UNITDESTROYED CALLED!',unitID)
   		crashing[unitID] = nil
   	end
   end