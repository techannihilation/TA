function widget:GetInfo()
  return {
    name      = "Manualfire range rings",
    desc      = "Add range rings for non dgun manual fire weapon",
    author    = "nixtux",
    date      = "Aug 12, 2018",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

local ringsToDraw = {
    [UnitDefNames["uppercut"].id] = 1,
    [UnitDefNames["armmarlin"].id] = 1,
    [UnitDefNames["armhcar"].id] = 3,
    [UnitDefNames["corhcar"].id] = 3,
    [UnitDefNames["tllswordfish"].id] = 1,
    [UnitDefNames["corarbritator"].id] = 1,
    [UnitDefNames["tlldischarge"].id] = 2,
}

local pairs = pairs
local SpGetAllUnits = Spring.GetAllUnits
local SpGetUnitDefID = Spring.GetUnitDefID
local SpIsUnitAllied = Spring.IsUnitAllied
local SpIsUnitSelected = Spring.IsUnitSelected
local SpGetUnitPosition = Spring.GetUnitPosition
local SpGetActiveCommand = Spring.GetActiveCommand

local glLineWidth = gl.LineWidth
local glColor = gl.Color
local glDrawGroundCircle = gl.DrawGroundCircle
local CMD_MANUALFIRE = CMD.MANUALFIRE

local ringsDefs = {}

local ringedUnits = {}

-- opacity control 
local darkOpacity = 0.5
local lightOpacity = 0.5

function SetOpacity(dark, light) 
    darkOpacity = dark 
    lightOpacity = light 
end 

function widget:Initialize()
    widgetHandler:RegisterGlobal('SetOpacity_Missingrings', SetOpacity) 
    for uDefId, ud in ipairs(UnitDefs) do
        if ringsToDraw[uDefId] then
            ringsDefs[uDefId] = { r = 1 , g = 0, b = 0, radius = WeaponDefs[UnitDefs[uDefId].weapons[ringsToDraw[uDefId]].weaponDef].range}
        end

    end

    for _, uId in pairs(SpGetAllUnits()) do
        widget:UnitEnteredLos(uId)
    end
end

function widget:UnitEnteredLos(uId)
    local uDefId = SpGetUnitDefID(uId)
    if uDefId then
        widget:UnitCreated(uId, uDefId)
    end
end

function widget:UnitCreated(uId, uDefId)
    local rings = ringsDefs[uDefId]
    if rings then
        ringedUnits[uId] = rings
    end
end

function widget:DrawWorld()
    local _, cmdID = SpGetActiveCommand()
    if (cmdID and cmdID == CMD_MANUALFIRE) or WG.drawAOErings then
        for uId, rings in pairs(ringedUnits) do
        local ux, uy, uz = SpGetUnitPosition(uId)
            if ux then
                local r,g,b = rings.r,rings.g,rings.b
                glColor(r,g,b,lightOpacity)
                glLineWidth(1)
                glDrawGroundCircle(ux, uy, uz, rings.radius, 24)
            else
                ringedUnits[uId] = nil
            end
        end
    end
    glLineWidth(1)
    glColor(1, 1, 1, 1)
end

function widget:GameOver() 
    widgetHandler:DeregisterGlobal('SetOpacity_Missingrings', SetOpacity) 
    widgetHandler:RemoveWidget(self) 
end 
