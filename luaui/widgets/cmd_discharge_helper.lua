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

local empID = 105
local dischargeID = UnitDefNames["tlldischarge"].id
local pressed = false

function widget:KeyPress(key)
    --Spring.Echo(key)
    if key == 101 then   -- 101 is key e
        pressed = true
    end
end

function widget:KeyRelease(key)
    local selectedUnits = Spring.GetSelectedUnits()
    if #selectedUnits == 1 and pressed then
        selectedunitID = selectedUnits[1]
        if Spring.GetUnitDefID(selectedUnits[1]) == dischargeID then
            local mx,my = Spring.GetMouseState()
            local _,pos = Spring.TraceScreenRay(mx,my,true)
            --Spring.Echo(key,dischargeID,pos[1],pos[2],pos[3])
            Spring.GiveOrderToUnit(selectedunitID, empID, pos, {})
        end
    end
    pressed = false
end