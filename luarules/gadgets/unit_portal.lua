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
    local CMD_LINK = 33000
    local portals = {}
    local portalID = UnitDefNames.portal.id
    local linkCmdDesc = {
        id			= CMD_LINK,
        type		= CMDTYPE.ICON_UNIT,
        name		= 'Link Portals',
        cursor  = 'Patrol',  -- add with LuaUI?
        action	= 'link',
        tooltip = 'Link two portals to be able to teleport units',
    }
    

    function gadget:Initialize() 
        gadgetHandler:RegisterCMDID(CMD_LINK)
        

    end

    function gadget:UnitCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions)
        if unitDefID == portalID and cmdID==CMD.ONOFF then
            local on = (cmdParams[1]==1) --invert because the command hasn't yet taken effect
            portals[unitID].on = on
            if ( on ) then
                --Spring.Echo("Portal "..unitID.." is now ON");
            else
                --Spring.Echo("Portal "..unitID.." is now OFF");
            end
        end

        if unitDefID == portalID and cmdID==CMD_LINK then
            local otherPortalID = cmdParams[1]
            local otherDefID = Spring.GetUnitDefID(otherPortalID)
            if otherDefID ~= portalID then 
                --Spring.Echo("Other unit not a portal")
                return
            end
            local p1Ally = Spring.GetUnitAllyTeam(unitID)
            local p2Ally = Spring.GetUnitAllyTeam(unitID)
            if ( p1Ally ~= p2Ally ) then
                --Spring.Echo("Portals don't have same ally team")
                return
            end
            portals[unitID].target = otherPortalID
            SendToUnsynced("portal_addline", unitID, otherPortalID) 
            if portals[otherPortalID].target ~= nil then
                SendToUnsynced("portal_removeline", otherPortalID) 
            end
            portals[otherPortalID].target = nil
            --Spring.Echo("Portals "..unitID.." - "..otherPortalID.." linked")
        end
    end
    function gadget:UnitCreated(unitID, unitDefID)
        local ud = UnitDefs[unitDefID]
        local name = ud.name

        --Spring.Echo("Created "..name)

        if ( name == "portal" ) then
            portals[unitID] = {
                target = nil,
                on = true,
            }

            Spring.InsertUnitCmdDesc(unitID, linkCmdDesc)
        end
    end

    function gadget:UnitGiven(uID, uDefID, newTeam, oldTeam)
        local ud = UnitDefs[uDefID]
        local name = ud.name
        --Spring.Echo("Given "..name)

        if ( name == "portal" ) then
            if portals[uID] ~= nil then
                -- Case 1 Clear target of this portal 
                SendToUnsynced("portal_removeline", uID) 
                portals[uID].target = nil
                
            end

            -- Case 2 clear portals targeting this
            for unitID, portal in pairs(portals) do
                if portal.target == uID then
                    portal.target = nil
                    SendToUnsynced("portal_removeline", unitID) 
                end
            end
        end
    end

    function gadget:UnitDestroyed(unitID, unitDefID)
        local ud = UnitDefs[unitDefID]
        local name = ud.name
        

        if ( name == "portal" ) then
            portals[unitID] = nil
            --Spring.Echo("Destroyed portal2")
            for existingPortalID, portal in pairs(portals) do
                if portal.target == unitID then
                    portal.target = nil
                    --Spring.Echo("Linked portal died, unlinking")
                    SendToUnsynced("portal_removeline", existingPortalID) 
                end
            end
        end
        

    end

    function gadget:GameFrame(n)
        if n % 10 == 0 then
            for unitID, portal in pairs(portals) do
                if ( portal.on and portal.target ~= nil ) then 
                    local x, y, z = Spring.GetUnitPosition(unitID)
                    local tx,ty,tz = Spring.GetUnitPosition(portal.target)
                    local unitids = Spring.GetUnitsInRectangle(x-60, z-60, x+60, z+60, Spring.GetUnitAllyTeam(unitID))
                    local remote_unitids = Spring.GetUnitsInRectangle(tx-60, tz-60, tx+60, tz+60)

                    if #remote_unitids >= 2 then
                        --Spring.Echo("Other end of portal is not clear")
                    
                    else
                        for i = 1, #unitids do
                            --Spring.Echo(unitids[i])
                            local uID = unitids[i]
                            if uID ~= unitID then -- DO not teleport self
                                local udef = UnitDefs[Spring.GetUnitDefID(uID)]
                                local oldHealth,oldMaxHealth,paralyzeDamage,captureProgress,buildProgress = Spring.GetUnitHealth(uID)
                                if not udef.canfly and buildProgress >= 1 and udef.canMove and udef.speed > 0.000001 then -- No planes, only completely built units and only units that can actually move
                                    if Spring.UseUnitResource(unitID, {
                                        m = 0,
                                        e = udef.metalCost
                                    }) then
                                        
                                        Spring.SetUnitPosition(uID, tx, ty, tz)

                                        local tx2 = tx
                                        local tz2 = tz 

                                        local heading = Spring.GetUnitHeading(unitID)
                                        -- Move units to the front outside the portal
                                        if ( heading > 0 ) then 
                                            if ( heading < 8192 ) then -- South
                                                tz2 = tz2 + 200
                                            elseif ( heading < 24576 ) then -- East
                                                tx2 = tx2 - 200
                                            else
                                                tz2 = tz2 - 200 -- North
                                            end
                                        else
                                            if ( heading >= -8192 ) then -- South
                                                tz2 = tz2 + 200
                                            elseif ( heading >= -24576 ) then -- West
                                                tx2 = tx2 + 200
                                            else
                                                tz2 = tz2 - 200 -- North
                                            end

                                        end
                                        Spring.GiveOrderToUnit(uID, CMD.MOVE, {tx2, ty, tz2}, {})

                                    end
                                    
                                end


                            end
                        end
                    end
                end
            end
        end


    end


else 
    local GL_LINE_STRIP		= GL.LINE_STRIP
    local GL_LINES			= GL.LINES
    local glVertex			= gl.Vertex
    local glLineStipple 	= gl.LineStipple
    local glLineWidth   	= gl.LineWidth
    local glColor       	= gl.Color
    local glBeginEnd    	= gl.BeginEnd
    local glPushMatrix		= gl.PushMatrix
    local glPopMatrix		= gl.PopMatrix
    local glScale			= gl.Scale
    local glTranslate		= gl.Translate
    local glLoadIdentity	= gl.LoadIdentity
    local glCallList        = gl.CallList
    local glCreateList      = gl.CreateList
    local glDepthTest		= gl.DepthTest
    local glBillboard       = gl.Billboard
    local glText            = gl.Text
    local lines = {}
    local points = {}
    local function DrawLine()
        for i = 1, #points do
            
            glVertex(points[i].x,points[i].y,points[i].z)
        end
    end

    local function PortalAddLine(cmd, source, target)
        lines[source] = target;
        --Spring.Echo("Unsynced added line")
    end

    local function PortalRemoveLine(cmd, source)
        lines[source] = nil;
    end

    function gadget:DrawWorld()
        
        for source , target in pairs(lines) do 
            if Spring.IsUnitSelected(source) then 
                local x1,y1,z1 = Spring.GetUnitPosition(source)
                local x2,y2,z2 = Spring.GetUnitPosition(target)
                points = {{
                    x = x1,
                    y = y1,
                    z = z1
                },{
                    x = x2,
                    y = y2,
                    z = z2
                }
                }
                glColor(0.0,1.0,1.0)
                glBeginEnd(GL_LINE_STRIP, DrawLine)
                glColor(1.0,1.0,1.0)
            end
        end

    end

    function gadget:Initialize()
        gadgetHandler:AddSyncAction("portal_addline", PortalAddLine)
        gadgetHandler:AddSyncAction("portal_removeline", PortalRemoveLine)
    end
end