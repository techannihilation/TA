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
local pos = {}
local dischargeSelected = false

function widget:KeyPress(key)
    --Spring.Echo(key)
    if key == 101 then   -- 101 is key e
        pressed = true
    end
end

function widget:MousePress(mx, my, mButton)
    if dischargeSelected and mButton == 1 then
        Spring.GiveOrderToUnit(selectedunitID, empID, pos, {"shift"})
    end
    pressed = false
end

function widget:Update()
    if pressed then
        local selectedUnits = Spring.GetSelectedUnits()
        if #selectedUnits == 1 then
            selectedunitID = selectedUnits[1]
            local selectedDefID = Spring.GetUnitDefID(selectedUnits[1])
            if selectedDefID == dischargeID then
                dischargeSelected = true
                WG.drawAOErings = selectedDefID
                local mx,my = Spring.GetMouseState()
                _, pos = Spring.TraceScreenRay(mx,my,true)
            else
                dischargeSelected = false
                WG.drawAOErings = nil
            end
        else
            dischargeSelected = false
            WG.drawAOErings = nil
        end
    else
        dischargeSelected = false
        WG.drawAOErings = nil
    end
end