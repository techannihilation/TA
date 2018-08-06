function widget:GetInfo()
  return {
    name      = "cmd_discharge_helper",
    desc      = "helper widget to discharge emp weapon",
    author    = "nixtux",
    date      = "Apr 24, 2018",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

local glDrawGroundCircle = gl.DrawGroundCircle
local glColor = gl.Color
local glLineWidth = gl.LineWidth

local empID = 105
local dischargeID = UnitDefNames["tlldischarge"].id
local pressed = false
local pos = {}
local dischargeSelected = false
local empAOE = WeaponDefs[UnitDefs[dischargeID].weapons[2].weaponDef].damageAreaOfEffect

function widget:KeyPress(key)
    --Spring.Echo(key)
    if key == 101 then   -- 101 is key e
        pressed = true
    end
end

function widget:KeyRelease(key)
    if dischargeSelected and key == 101 then
        Spring.GiveOrderToUnit(selectedunitID, empID, pos, {})
    end
    pressed = false
end

function widget:Update()
    if pressed then
        local selectedUnits = Spring.GetSelectedUnits()
        if #selectedUnits == 1 and pressed then
            selectedunitID = selectedUnits[1]
            if Spring.GetUnitDefID(selectedUnits[1]) == dischargeID then
                dischargeSelected = true
                local mx,my = Spring.GetMouseState()
                _, pos = Spring.TraceScreenRay(mx,my,true)
            else
                dischargeSelected = false
            end
        else
            dischargeSelected = false
        end
    else
        dischargeSelected = false
    end
end

function widget:DrawWorld()
    if dischargeSelected then
        glColor(1, 1, 0, 0.75)
        glLineWidth(1)
        glDrawGroundCircle(pos[1], pos[2], pos[3], empAOE, 64)
        glColor(1,1,1,1)
    end
end