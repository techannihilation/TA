--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "mo_preventcombomb",
    desc      = "Commanders survive commander blast and DGun",
    author    = "TheFatController",
    date      = "Aug 31, 2009",
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


local oneOnone = false
local Health = false

-- remove gadget if modoption is not set
function gadget:Initialize()
	if (Spring.GetModOptions().mo_preventcombomb == "1v1") then 
		Spring.Echo("1v1")
		oneOnone = true
	elseif (Spring.GetModOptions().mo_preventcombomb == "hp") then
		Spring.Echo("Health")
		Health = true
	elseif (Spring.GetModOptions().mo_preventcombomb == "off") then
		gadgetHandler:RemoveGadget(self)
		return false
	end
end

local GetTeamInfos = Spring.GetTeamInfos
local GetUnitPosition = Spring.GetUnitPosition
local GetGroundHeight = Spring.GetGroundHeight
local MoveCtrl = Spring.MoveCtrl
local GetGameFrame = Spring.GetGameFrame
local DestroyUnit = Spring.DestroyUnit
local ValidUnitID = Spring.ValidUnitID

local COM_BLAST = {
  [WeaponDefNames['commander_blast1'].id] = true,
  [WeaponDefNames['commander_blast5'].id] = true,
  [WeaponDefNames['commander_blast6'].id] = true,
  [WeaponDefNames['commander_blast7'].id] = true,
  [WeaponDefNames['commander_blast8'].id] = true,
}

local DGUN = {
  --Arm
  [WeaponDefNames['armcom_arm_disintegrator'].id] = true,
  [WeaponDefNames['armcom1_arm_disintegrator'].id] = true,
  [WeaponDefNames['armcom4_arm_disintegrator1'].id] = true,
  [WeaponDefNames['armcom_fusion_arm_disintegrator'].id] = true,
  [WeaponDefNames['armcom5_arm_disintegrator2'].id] = true,
  [WeaponDefNames['armcom6_arm_disintegrator2'].id] = true,
  [WeaponDefNames['armcom7_arm_disintegrator2'].id] = true,
  --Core
  [WeaponDefNames['corcom_arm_disintegrator'].id] = true,
  [WeaponDefNames['corcom1_arm_disintegrator'].id] = true,
  [WeaponDefNames['corcom3_arm_disintegrator1'].id] = true,
  [WeaponDefNames['corcom_fusion_arm_disintegrator'].id] = true,

  [WeaponDefNames['corcom5_arm_disintegrator2'].id] = true,
  [WeaponDefNames['corcom6_arm_disintegrator2'].id] = true,
  [WeaponDefNames['corcom7_arm_disintegrator2'].id] = true,
  --The Lost Legacy
  [WeaponDefNames['tllcom_arm_disintegrator3'].id] = true,
  [WeaponDefNames['tllcom1_arm_disintegrator'].id] = true,
  [WeaponDefNames['tllcom3_tll_disintegrator1'].id] = true,
  [WeaponDefNames['tllcom_fusion_arm_disintegrator'].id] = true,
  [WeaponDefNames['tllcom5_tll_disintegrator2'].id] = true,
  [WeaponDefNames['tllcom6_tll_disintegrator2'].id] = true,
  [WeaponDefNames['tllcom7_tll_disintegrator2'].id] = true,
}

local COMMANDER = {
  --Core
  [UnitDefNames["corcom"].id] = true,
  [UnitDefNames["corcom1"].id] = true,
  [UnitDefNames["corcom3"].id] = true,
  [UnitDefNames["corcom_fusion"].id] = true,
  [UnitDefNames["corcom5"].id] = true,
  [UnitDefNames["corcom6"].id] = true,
  [UnitDefNames["corcom7"].id] = true,
  --Arm 
  [UnitDefNames["armcom"].id] = true,
  [UnitDefNames["armcom1"].id] = true,
  [UnitDefNames["armcom4"].id] = true,
  [UnitDefNames["armcom_fusion"].id] = true,
  [UnitDefNames["armcom5"].id] = true,
  [UnitDefNames["armcom6"].id] = true,
  [UnitDefNames["armcom7"].id] = true,
  --The lost legacy
  [UnitDefNames["tllcom"].id] = true,
  [UnitDefNames["tllcom1"].id] = true,
  [UnitDefNames["tllcom3"].id] = true,
  [UnitDefNames["tllcom_fusion"].id] = true,
  [UnitDefNames["tllcom5"].id] = true,
  [UnitDefNames["tllcom6"].id] = true,
  [UnitDefNames["tllcom7"].id] = true,
}


local immuneDgunList = {}
local ctrlCom = {}
local cantFall = {}

function gadget:UnitPreDamaged(unitID, unitDefID, unitTeam, damage, paralyzer,
                            weaponID, projectileID, attackerID, attackerDefID, attackerTeam)
	--falling & debris damage
	if weaponID < 0 and cantFall[unitID] then
		return 0, 0
	end

	--New Commander with greatest hp survives blast option
	if COM_BLAST[weaponID] and COMMANDER[unitDefID] and ValidUnitID(attackerID) and Health then
	  
	local hp = Spring.GetUnitHealth(unitID)
	hp = hp or 0
	local combombDamage = math.min(hp*0.33, math.max(0,hp-200-math.random(1,10))) -- lose hp*0.4 damage but don't let health get <200
	combombDamage = math.min(damage,combombDamage) 
		local targethp = Spring.GetUnitHealth(attackerID)
		if unitID ~= attackerID then
			if hp > targethp then
				--Spring.Echo("Commander Damage Reduced")
				return combombDamage, 0
			else
				--Spring.Echo("Commander Blast Default Damage Dealt")
				return damage
			end
		end
	else
		--Spring.Echo("Normal Damage")
		return damage
	end
	
	--Default settings for 1v1
	if DGUN[weaponID] and oneOnone then
	local hp = Spring.GetUnitHealth(unitID)
	hp = hp or 0
	local combombDamage = math.min(hp*0.33, math.max(0,hp-200-math.random(1,10))) -- lose hp*0.4 damage but don't let health get <200
	combombDamage = math.min(damage,combombDamage) 
		if immuneDgunList[unitID] then
			-- immune
			return 0, 0
		elseif COMMANDER[attackerDefID] and COMMANDER[unitDefID] then
			-- make unitID immune to DGun, kill attackedID
			immuneDgunList[unitID] = GetGameFrame() + 45
			DestroyUnit(attackerID,false,false,unitID)
			return combombDamage, 0
		end
	elseif COM_BLAST[weaponID] and COMMANDER[unitDefID] and oneOnone then
		if unitID ~= attackerID then
			--prevent falling damage to the unitID, and lock position
			MoveCtrl.Enable(unitID)
			ctrlCom[unitID] = GetGameFrame() + 30
			cantFall[unitID] = GetGameFrame() + 30
			return combombDamage, 0
		else
			--com blast hurts the attackerID 
			return damage
		end
	end
	return damage
	
end

function gadget:GameFrame(currentFrame)
  if oneOnone then
	for unitID,expirationTime in pairs(immuneDgunList) do
		if currentFrame > expirationTime then
			immuneDgunList[unitID] = nil
		end
	end
	for unitID,expirationTime in pairs(ctrlCom) do
		if currentFrame > expirationTime then
			--if the game was actually a draw then this unitID is not valid anymore
			--if that is the case then just remove it from the cantFall list and clear the ctrlCom flag
			local x,_,z = GetUnitPosition(unitID)
			if x then
				local y = GetGroundHeight(x,z)
				MoveCtrl.SetPosition(unitID, x,y,z)
				MoveCtrl.Disable(unitID)
				cantFall[unitID] = currentFrame + 220
			else
				cantFall[unitID] = nil
			end

			ctrlCom[unitID] = nil
		end
	end
	for unitID,expirationTime in pairs(cantFall) do
		if currentFrame > expirationTime then
			cantFall[unitID] = nil
		end
	end
  end
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------