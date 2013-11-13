function gadget:GetInfo()
  return {
    name      = "Aimpoint Waterline",
    desc      = "Sets the aimpoint for stationary units which are part below and part above the waterline",
    author    = "Bluestone",
    date      = "13/11/2013",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

--[[
Prior to 95.0, the engine was detected when a unit had part of its model above and part below the waterline, and allowed both land and water weapons to fire accordingly.
This functionality was lost in 95.0, and whether or not water/land weapons could fire at a partially submerged unit became entirely dependent on if the aimpoint was above/below the waterline.
The aimpoint is (by default) the purple dot at the midpoint of the the grey sphere, as shown in /debugcolvol.
This gadget sets the aimpoint of ships and stationary partially submerged units to 0 (which is both above and below the waterline).
--Bluestone 13/11/2013
--]]

local isship = {
       [UnitDefNames['armaas'].id] = true,
       [UnitDefNames['armbats'].id] = true,
       [UnitDefNames['armbc'].id] = true,
       [UnitDefNames['armcarry'].id] = true,
       [UnitDefNames['armcrus'].id] = true,
       [UnitDefNames['armcs'].id] = true,
       [UnitDefNames['armhcar'].id] = true,
       [UnitDefNames['armhls'].id] = true,
       [UnitDefNames['armmls'].id] = true,
       [UnitDefNames['armmship'].id] = true,
       [UnitDefNames['armpt'].id] = true,
       [UnitDefNames['armroy'].id] = true,
       [UnitDefNames['armsjam'].id] = true,
       [UnitDefNames['armtrmph'].id] = true,
       [UnitDefNames['armtship'].id] = true,
       [UnitDefNames['aseadragon'].id] = true,
       [UnitDefNames['corarch'].id] = true,
       [UnitDefNames['corasship'].id] = true,
       [UnitDefNames['corbats'].id] = true,
       [UnitDefNames['corblackhy'].id] = true,
       [UnitDefNames['corcarry'].id] = true,
       [UnitDefNames['corcrus'].id] = true,
       [UnitDefNames['corcs'].id] = true,
       [UnitDefNames['coresupp'].id] = true,
       [UnitDefNames['corhcar'].id] = true,
       [UnitDefNames['cormls'].id] = true,
       [UnitDefNames['cormship'].id] = true,
       [UnitDefNames['corpt'].id] = true,
       [UnitDefNames['corroy'].id] = true,
       [UnitDefNames['corsjam'].id] = true,
       [UnitDefNames['cortship'].id] = true,
       [UnitDefNames['cortyrnt'].id] = true,
       [UnitDefNames['decade'].id] = true,
       [UnitDefNames['tllacs'].id] = true,
       [UnitDefNames['tllambassador'].id] = true,
       [UnitDefNames['tllasship'].id] = true,
       [UnitDefNames['tllbats2'].id] = true,
       [UnitDefNames['tllboat2'].id] = true,
       [UnitDefNames['tllcs'].id] = true,
       [UnitDefNames['tllequalizer'].id] = true,
       [UnitDefNames['tllgiant'].id] = true,
       [UnitDefNames['tllmixer'].id] = true,
       [UnitDefNames['tllotter'].id] = true,
       [UnitDefNames['tllsting'].id] = true,
       [UnitDefNames['tllviking'].id] = true,
       [UnitDefNames['tllviolator'].id] = true,
       [UnitDefNames['tllvisitor'].id] = true,
}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

if (not gadgetHandler:IsSyncedCode()) then
  return
end

function gadget:UnitCreated(unitID, unitDefID, unitTeam)
	if not UnitDefs[unitDefID].canMove or isship[unitDefID] then
	  Spring.Echo("Aim point Reset for :-"..UnitDefs[unitDefID].name)
		local bx,by,bz,mx,my,mz,ax,ay,az = Spring.GetUnitPosition(unitID,true,true) --basepoint,midpoint,aimpoint
		local h = Spring.GetUnitHeight(unitID)
		if by <= 0 and by + h >= 0 then
			--Spring.Echo("Aimpoint Waterline: Set aimpoint of " .. unitID)
			Spring.SetUnitMidAndAimPos(unitID,mx,my,mz,ax,0,az) 
		end
	end
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
