--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "mo_combomb_full_damage",
    desc      = "Flying Combombs Can Do Less Damage",
    author    = "TheFatController",
    date      = "Sept 06, 2010",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

if (not gadgetHandler:IsSyncedCode()) then
  return false
end

local COM_BLAST = {
  [WeaponDefNames['commander_blast1'].id] = true,
  [WeaponDefNames['commander_blast5'].id] = true,
  [WeaponDefNames['commander_blast6'].id] = true,
  [WeaponDefNames['commander_blast7'].id] = true,
  [WeaponDefNames['commander_blast8'].id] = true,
}

function gadget:UnitPreDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponID, projectileID, attackerID, attackerDefID, attackerTeam) --we use UnitPreDamaged so as we get in before unit_transportfix has its effect
  
  --Spring.Echo("UnitPreDamaged called with unitID " .. unitID .. " and attackerID ", attackerID)
  
  if (weaponID == COM_BLAST) and Spring.ValidUnitID(attackerID) then -- we control the damage inflicted on units by the COM_BLAST. Very rarely an invalid attackerID is returned with weaponID=COM_BLAST, I have no idea why/how.
		--Spring.Echo("weapon is comblast from unloaded com " .. attackerID)
		local x,y,z = Spring.GetUnitBasePosition(attackerID)
		local h = Spring.GetGroundHeight(x,z)
		--Spring.Echo(x .. " " .. y .. " " .. z .. " " .. h)
		if ((y-h) > 10) then
			local _,hp = Spring.GetUnitHealth(unitID)
			local newdamage = math.min(damage,math.max(hp*0.6,400)) 
			--Spring.Echo("new damage is " .. newdamage .. ", old damage is " .. damage .. ", hp is " .. hp)
			return newdamage,0
		end		
	end
	return damage,1
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------