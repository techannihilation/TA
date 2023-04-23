function gadget:GetInfo()
    return {
      name      = "Unit Portal",
      desc      = "Manage teleport",
      author    = "tizbac",
      date      = "",
      license   = "GPL",
      layer     = 0,
      enabled   = true  --  loaded by default?
    }
end


if (gadgetHandler:IsSyncedCode()) then

    local portals = {}
    local portalID = UnitDefNames.portal.id
    function gadget:UnitCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions)
        if unitDefID == portalID and cmdID==CMD.ONOFF then
            local on = (cmdParams[1]==1) --invert because the command hasn't yet taken effect
            portals[unitID].on = on
            if ( on ) then
                Spring.Echo("Portal "..unitID.." is now ON");
            else
                Spring.Echo("Portal "..unitID.." is now OFF");
            end
        end

        if unitDefID == portalID and cmdID==CMD.PATROL then
            local otherPortalID = cmdParams[1]
            local otherDefID = Spring.GetUnitDefID(otherPortalID)
            if otherDefID ~= portalID then 
                Spring.Echo("Other unit not a portal")
                return
            end
            local p1Ally = Spring.GetUnitAllyTeam(unitID)
            local p2Ally = Spring.GetUnitAllyTeam(unitID)
            if ( p1Ally ~= p2Ally ) then
                Spring.Echo("Portals don't have same ally team")
                return
            end
            Spring.GiveOrderToUnit(otherPortalID, CMD.STOP, {}, {}) -- Here we prevent infinite loop by stopping other portal's patrol 
            portals[unitID].target = otherPortalID
            portals[otherPortalID].target = nil
            Spring.Echo("Portals "..unitID.." - "..otherPortalID.." linked")
        end
    end
    function gadget:UnitCreated(unitID, unitDefID)
        local ud = UnitDefs[unitDefID]
        local name = ud.name

        Spring.Echo("Created "..name)

        if ( name == "portal" ) then
            portals[unitID] = {
                target = nil,
                on = true,
            }
        end
    end

    function gadget:UnitDestroyed(unitID, unitDefID)
        local ud = UnitDefs[unitDefID]
        local name = ud.name
        Spring.Echo("Destroyed "..name)

        if ( name == "portal" ) then
            portals[unitID] = nil
        end
        

    end

    function gadget:GameFrame(n)
        if n % 10 == 0 then
            for unitID, portal in pairs(portals) do
                if ( portal.on and portal.target ~= nil ) then 
                    local unitids = Spring.GetUnitsInRectangle(left, bottom, right, top, Spring.GetUnitTeam(unitID))
                    for i = 1, #unitids do
                        Spring.Echo(unitids[i])
                    end
                end
            end
        end


    end


else 

    return false
end