
function gadget:GetInfo()
	return {
		name      = 'DGun CmdType Fix',
		desc      = 'Fixed DGun CmdType so it can target units',
		author    = 'Niobium',
		date      = 'April 2011',
		license   = 'GNU GPL, v2 or later',
		layer     = 0,
		enabled   = true
	}
end

----------------------------------------------------------------
-- Synced only
----------------------------------------------------------------
if not gadgetHandler:IsSyncedCode() then
	return false
end

----------------------------------------------------------------
-- Var
----------------------------------------------------------------
local canDGun = {}

local nukes = {
    [UnitDefNames["uppercut"].id] = true,
    [UnitDefNames["armmarlin"].id] = true,
    [UnitDefNames["armhcar"].id] = true,
    [UnitDefNames["corhcar"].id] = true,
    [UnitDefNames["tllswordfish"].id] = true,
}

local emp = {
    [UnitDefNames["tlldischarge"].id] = true,
}
----------------------------------------------------------------
-- Speedups
----------------------------------------------------------------
local spFindUnitCmdDesc = Spring.FindUnitCmdDesc
local spGetUnitCmdDescs = Spring.GetUnitCmdDescs
local spEditUnitCmdDesc = Spring.EditUnitCmdDesc

local CMD_MANUALFIRE = CMD.MANUALFIRE
local CMDTYPE_ICON_UNIT_OR_MAP = CMDTYPE.ICON_UNIT_OR_MAP

----------------------------------------------------------------
-- Callins
----------------------------------------------------------------
function gadget:Initialize()
    for uDefID, uDef in pairs(UnitDefs) do
        if uDef.customParams.iscommander then
            canDGun[uDefID] = true
        end
    end
end

function gadget:UnitCreated(uID, uDefID, uTeam)
    if canDGun[uDefID] then
        local cmdIdx = spFindUnitCmdDesc(uID, CMD_MANUALFIRE)
        if cmdIdx then
            local cmdDesc = spGetUnitCmdDescs(uID, cmdIdx, cmdIdx)[1]
            if cmdDesc then
				cmdDesc['name'] = 'D-Gun'
                cmdDesc.type = CMDTYPE_ICON_UNIT_OR_MAP
                spEditUnitCmdDesc(uID, cmdIdx, cmdDesc)
            end
        end
    elseif nukes[uDefID] then
        local cmdIdx = spFindUnitCmdDesc(uID, CMD_MANUALFIRE)
        if cmdIdx then
            local cmdDesc = spGetUnitCmdDescs(uID, cmdIdx, cmdIdx)[1]
            if cmdDesc then
				cmdDesc['name'] = 'Nuke'
                cmdDesc.type = CMDTYPE_ICON_UNIT_OR_MAP
                spEditUnitCmdDesc(uID, cmdIdx, cmdDesc)
            end
        end
    elseif emp[uDefID] then
        local cmdIdx = spFindUnitCmdDesc(uID, CMD_MANUALFIRE)
        if cmdIdx then
            local cmdDesc = spGetUnitCmdDescs(uID, cmdIdx, cmdIdx)[1]
            if cmdDesc then
				cmdDesc['name'] = 'E M P'
                cmdDesc.type = CMDTYPE_ICON_UNIT_OR_MAP
                spEditUnitCmdDesc(uID, cmdIdx, cmdDesc)
            end
        end
    end
end

    
