   function gadget:GetInfo()
      return {
        name      = "Crashing Aircraft",
        desc      = "Half of all aircraft destroyed and on the crash list crash instead of exploding",
        author    = "Beherith",
        date      = "aug 2012",
        license   = "PD",
        layer     = 1000,
        enabled   = true,
      }
    end
     
if (not gadgetHandler:IsSyncedCode()) then
  return
end
local GetUnitHealth 	= Spring.GetUnitHealth 
local random		= math.random 
local SetUnitCOBValue 	= Spring.SetUnitCOBValue
local SetUnitNoSelect	= Spring.SetUnitNoSelect
local SetUnitCosts	= Spring.SetUnitCosts
local SetUnitSensorRadius = Spring.SetUnitSensorRadius
local crashing		= {}
local crashable  ={ --fucking hacky bugfix, strafemovetype cant crash, and sometimes doesnt take the damage it is dealt. 
	[UnitDefNames["corca"].id] = true,
	[UnitDefNames["armfig"].id] = true,
	[UnitDefNames["armawac"].id] = true,
	[UnitDefNames["armmin"].id] = true,
	[UnitDefNames["corgripn"].id] = true,
	[UnitDefNames["armcyclone"].id] = true,
	[UnitDefNames["corhunt"].id] = true,
	[UnitDefNames["armhawk"].id] = true,
	[UnitDefNames["tlltorpp"].id] = true,
	[UnitDefNames["corshad"].id] = true,
	[UnitDefNames["armcybr"].id] = true,
	[UnitDefNames["corhurc"].id] = true,
	[UnitDefNames["tlladvfight"].id] = true,
	[UnitDefNames["armsehak"].id] = true,
	[UnitDefNames["tllseaf"].id] = true,
	[UnitDefNames["armseap"].id] = true,
	[UnitDefNames["armorion"].id] = true,
	[UnitDefNames["tllseab"].id] = true,
	[UnitDefNames["coreclipse"].id] = true,
	[UnitDefNames["tllrsplane"].id] = true,
	[UnitDefNames["tllprob"].id] = true,
	[UnitDefNames["cbuilderlvl2"].id] = true,
	[UnitDefNames["abuilderlvl2"].id] = true,
	[UnitDefNames["cormin"].id] = true,
	[UnitDefNames["armca"].id] = true,
	[UnitDefNames["tllbomber"].id] = true,
	[UnitDefNames["corawac"].id] = true,
	[UnitDefNames["tllcsa"].id] = true,
	[UnitDefNames["armsfig"].id] = true,
	[UnitDefNames["tllca"].id] = true,
	[UnitDefNames["corfink"].id] = true,
	[UnitDefNames["tllaca"].id] = true,
	[UnitDefNames["cortitan"].id] = true,
	[UnitDefNames["corveng"].id] = true,
	[UnitDefNames["corvamp"].id] = true,
	[UnitDefNames["corseap"].id] = true,
	[UnitDefNames["tllsonpl"].id] = true,
	[UnitDefNames["armthund"].id] = true,
	[UnitDefNames["armaca"].id] = true,
	[UnitDefNames["corsfig"].id] = true,
	[UnitDefNames["corfiend"].id] = true,
	[UnitDefNames["corsb"].id] = true,
	[UnitDefNames["tllabomber"].id] = true,
	[UnitDefNames["corsbomb"].id] = true,
	[UnitDefNames["coraca"].id] = true,
	[UnitDefNames["armlance"].id] = true,
	[UnitDefNames["armpeep"].id] = true,
	[UnitDefNames["cbuilderlvl1"].id] = true,
	[UnitDefNames["shrike"].id] = true,
	[UnitDefNames["armpnix"].id] = true,
	[UnitDefNames["armsb"].id] = true,
	[UnitDefNames["corcsa"].id] = true,
	[UnitDefNames["tllfight"].id] = true,
	[UnitDefNames["armcsa"].id] = true,
	[UnitDefNames["airwolf3g"].id] = true,
	[UnitDefNames["armblz"].id] = true,
	[UnitDefNames["abuilderlvl1"].id] = true,
}

function gadget:UnitPreDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponDefID, projectileID, attackerID, attackerDefID, attackerTeam)
	if paralyzer then return damage,1 end --OOPS FORGOT THIS
	if crashing[unitID] then 
		return 0,0
	end --hacky
	if UnitDefs[unitDefID]["canFly"] == true and (damage>GetUnitHealth(unitID)) and random()<0.33 then
	--NOTE: strafe airmovetype aircraft DO NOT CRASH, only regular stuff like bombers
		--Spring.Echo('CRASHING AIRCRAFT',unitID)
		SetUnitCOBValue(unitID, COB.CRASHING, 1)
		Spring.SetUnitRulesParam(unitID, "nolups",1)
		--SetUnitCosts(unitID,{10000,0,0}) this doesnt work either :)
		SetUnitNoSelect(unitID,true) --cause setting to neutral still allows selection (wtf?)
		crashing[unitID]=true
		SetUnitSensorRadius(unitID, "los", 0)
		SetUnitSensorRadius(unitID, "radar", 0)
		SetUnitSensorRadius(unitID, "sonar", 0)
		--return 0,0--TEST THIS
	end
	return damage,1
end

function gadget:UnitDestroyed(unitID, unitDefID, teamID, attackerID, attackerDefID, attackerTeamID)
	if crashing[unitID] then
		--Spring.Echo('CRASHING AIRCRAFT UNITDESTROYED CALLED!',unitID)
		crashing[unitID]=nil
	end
end
