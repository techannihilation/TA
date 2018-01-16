--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
	return {
		name    = "Lups Shield",
		desc    = "Draws variable shields for shielded units",
		author  = "GoogleFrog",
		date    = "14 November 2017",
		license = "GNU GPL, v2 or later",
		layer   = 500, -- Call ShieldPreDamaged after gadgets which change whether interception occurs
		enabled = true,
	}
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

if gadgetHandler:IsSyncedCode() then
	local spSetUnitRulesParam = Spring.SetUnitRulesParam
	local INLOS_ACCESS = {inlos = true}
	local gameFrame = 0

	function gadget:GameFrame(n)
		gameFrame = n
	end
	
	function gadget:ShieldPreDamaged(proID, proOwnerID, shieldEmitterWeaponNum, shieldCarrierUnitID, bounceProjectile, beamEmitter, beamCarrierID)
		spSetUnitRulesParam(shieldCarrierUnitID, "shieldHitFrame", gameFrame, INLOS_ACCESS)
		return false
	end
	
	return
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local spGetMyAllyTeamID     = Spring.GetMyAllyTeamID
local spGetSpectatingState  = Spring.GetSpectatingState

local IterableMap = VFS.Include("LuaRules/Gadgets/Include/IterableMap.lua")
local shieldUnitDefs = include("LuaRules/Configs/lups_shield_fxs.lua")

local Lups
local LupsAddParticles
local UPDATE_PERIOD = 10

local myAllyTeamID = spGetMyAllyTeamID()

local shieldUnits = IterableMap.New()
local startup = true
local disabledShieldCobOff = {}
local disabledShieldStun = {}

local buttonDefs = VFS.Include"LuaRules/Configs/cob_buttons.lua"
local cobCmdIds = #buttonDefs

local ShieldUnits = {
  --Core
  [UnitDefNames["corcom5"].id] = true,
  [UnitDefNames["corcom6"].id] = true,
  [UnitDefNames["corcom7"].id] = true,
  [UnitDefNames["corgate"].id] = true,
  [UnitDefNames["corgate1"].id] = true,
  [UnitDefNames["corgate2"].id] = true,
  [UnitDefNames["corshieldgen"].id] = true,
  [UnitDefNames["monkeylord"].id] = true, 
  [UnitDefNames["corsfus"].id] = true, 
  --Arm 
  [UnitDefNames["armcom5"].id] = true,
  [UnitDefNames["armcom6"].id] = true,
  [UnitDefNames["armcom7"].id] = true,
  [UnitDefNames["armgate"].id] = true,
  [UnitDefNames["armgate1"].id] = true,
  [UnitDefNames["armgate2"].id] = true,
  [UnitDefNames["armpraet"].id] = true,
  [UnitDefNames["exoarm"].id] = true,
  [UnitDefNames["armsmc"].id] = true,
  --The lost legacy
  [UnitDefNames["tllcom5"].id] = true,
  [UnitDefNames["tllcom6"].id] = true,
  [UnitDefNames["tllcom7"].id] = true,
  [UnitDefNames["tllgate"].id] = true,
  [UnitDefNames["tllgate1"].id] = true,
  [UnitDefNames["tllgate2"].id] = true,
  [UnitDefNames["irritator"].id] = true,
}

local function GetVisibleSearch(x, z, search)
	if not x then
		return false
	end
	for i = 1, #search do
		if Spring.IsPosInAirLos(x + search[i][1], 0, z + search[i][2], myAllyTeamID) then
			return true
		end
	end
	return false
end

local function UpdateVisibility(unitID, unitData, unitVisible, forceUpdate)
	unitVisible = unitVisible or (myAllyTeamID == unitData.allyTeamID)
	if not unitVisible then
		local ux,_,uz = Spring.GetUnitPosition(unitID)
		unitVisible = GetVisibleSearch(ux, uz, unitData.search)
	end
	
	if unitVisible == unitData.unitVisible and not forceUpdate then
		return
	end
	unitData.unitVisible = unitVisible
	
	for i = 1, #unitData.fxTable do
		local fxID = unitData.fxTable[i]
		local fx = Lups.GetParticles(fxID)
		fx.visibleToMyAllyTeam = unitVisible
	end
end

local function AddUnit(unitID, unitDefID)
	if (not Lups) then
		Lups = GG['Lups']
		LupsAddParticles = Lups.AddParticles 
	end
	
	local def = shieldUnitDefs[unitDefID]
	local defFx = def.fx
	local fxTable = {}
	for i = 1, #defFx do
		local fx = defFx[i]
		local options = Spring.Utilities.CopyTable(fx.options)
		options.unit = unitID
		options.shieldCapacity = def.shieldCapacity
		local fxID = LupsAddParticles(fx.class, options)
		if fxID ~= -1 then
			fxTable[#fxTable + 1] = fxID
		end
	end
	
	local unitData = {
		unitDefID  = unitDefID,
		search     = def.search,
		fxTable    = fxTable,
		allyTeamID = Spring.GetUnitAllyTeam(unitID)
	}
	shieldUnits.Add(unitID, unitData)
	
	local _, fullview = spGetSpectatingState()
	UpdateVisibility(unitID, unitData, fullview, true)
end

local function RemoveUnit(unitID)
	local unitData = shieldUnits.Get(unitID)
	if unitData then
		for i = 1, #unitData.fxTable do
			local fxID = unitData.fxTable[i]
			Lups.RemoveParticles(fxID)
		end
		shieldUnits.Remove(unitID)
	end
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
	RemoveUnit(unitID)
	disabledShieldCobOff[unitID] = nil
	disabledShieldStun[unitID] = nil
end

function gadget:UnitFinished(unitID, unitDefID, unitTeam)
	if shieldUnitDefs[unitDefID] then
		AddUnit(unitID, unitDefID)
	end
end

function gadget:UnitTaken(unitID, unitDefID, newTeam, oldTeam)
	local unitData = shieldUnits.Get(unitID)
	if unitData then
		unitData.allyTeamID = Spring.GetUnitAllyTeam(unitID)
	end
end

function gadget:PlayerChanged()
	myAllyTeamID = spGetMyAllyTeamID()
end

function gadget:CommandNotify(id, params, options)
	if (id >= 34520 and id <= (34520+cobCmdIds)) then
		local selectedUnit = Spring.GetSelectedUnits()
		if #selectedUnit == 1 then
			local cmdunitID = selectedUnit[1]
			local unitData = shieldUnits.Get(cmdunitID)
			if unitData and ShieldUnits[cmdunitID] then
				if params[1] == 0 then
					RemoveUnit(cmdunitID)
					disabledShieldCobOff[cmdunitID] = true
				end
			end
			if params[1] == 1 and (id >= 34520 and id <= 34540) and ShieldUnits[cmdunitID] then
				if disabledShieldCobOff[cmdunitID] then 
					AddUnit(cmdunitID, Spring.GetUnitDefID(cmdunitID))
					disabledShieldCobOff[cmdunitID] = nil
				end
			end
		end
    end
end

function gadget:UnitStunned(unitID, unitDefID, unitTeam, stunned)
  local unitData = shieldUnits.Get(unitID)
  if stunned then
    if unitData then
	  RemoveUnit(unitID)
	  disabledShieldStun[unitID] = true
    end
  elseif (not stunned) and disabledShieldStun[unitID] then
	AddUnit(unitID, unitDefID)
 end
end

function gadget:GameFrame(n)
	if startup then
		local allUnits = Spring.GetAllUnits()
		for i = 1, #allUnits do
			local unitID = allUnits[i]
			local unitDefID = Spring.GetUnitDefID(unitID)
			gadget:UnitFinished(unitID, unitDefID)
		end
		startup = false
	end
	if n%UPDATE_PERIOD == 0 then
		local _, fullview = spGetSpectatingState()
		for unitID, unitData in shieldUnits.Iterator() do
			UpdateVisibility(unitID, unitData, fullview)
		end
	end
end
