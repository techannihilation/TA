--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    ico_customicons.lua
--  author:  Dave Rodgers
--
--  Copyright (C) 2007.
--  Licensed under the terms of the GNU GPL, v2 or later.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:GetInfo()
  return {
    name      = "CustomIcons",
    desc      = "Sets custom unit icons for BA",
    author    = "trepan,BD,TheFatController",
    date      = "Jan 8, 2007",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


local wasLuaModUIEnabled = 0

--------------------------------------------------------------------------------


function widget:Shutdown()
  -- revert our changes
  for udid,ud in pairs(UnitDefs) do
    if ((ud ~= nil) and (ud.origIconType ~= nil)) then
      Spring.SetUnitDefIcon(udid, ud.origIconType)
    end
  end
end


--------------------------------------------------------------------------------

function widget:Initialize()

  Spring.AddUnitIcon("armcom.user", "LuaUI/Icons/armcom.png",2)
  Spring.AddUnitIcon("corcom.user", "LuaUI/Icons/corcom.png",2)
  Spring.AddUnitIcon("tllcom.user", "LuaUI/Icons/tllcom.png",2)
  Spring.AddUnitIcon("cross.user", "LuaUI/Icons/cross.png")
  Spring.AddUnitIcon("diamond.user", "LuaUI/Icons/diamond.png",1.1)
  Spring.AddUnitIcon("e.user", "LuaUI/Icons/e.png")
  Spring.AddUnitIcon("e2.user", "LuaUI/Icons/e.png",1.4)
  Spring.AddUnitIcon("e3.user", "LuaUI/Icons/e.png",1.8)
  Spring.AddUnitIcon("e4.user", "LuaUI/Icons/e.png",2.3)
  Spring.AddUnitIcon("hemi-down.user", "LuaUI/Icons/hemi-down.png",1.3)
  Spring.AddUnitIcon("hemi-up.user", "LuaUI/Icons/hemi-up.png")
  Spring.AddUnitIcon("hemi.user", "LuaUI/Icons/hemi.png")
  Spring.AddUnitIcon("hourglass-side.user", "LuaUI/Icons/hourglass-side.png")
  Spring.AddUnitIcon("hourglass.user", "LuaUI/Icons/hourglass.png")
  Spring.AddUnitIcon("krogoth.user", "LuaUI/Icons/krogoth.png",3)
  Spring.AddUnitIcon("m-down.user", "LuaUI/Icons/m-down.png")
  Spring.AddUnitIcon("m-up.user", "LuaUI/Icons/m-up.png")
  Spring.AddUnitIcon("m.user", "LuaUI/Icons/m.png")
  Spring.AddUnitIcon("nuke.user", "LuaUI/Icons/nuke.png",1.25)
  Spring.AddUnitIcon("sphere.user", "LuaUI/Icons/sphere.png",1.1)
  Spring.AddUnitIcon("sphere2.user", "LuaUI/Icons/sphere.png",1.35)
  Spring.AddUnitIcon("sphere3.user", "LuaUI/Icons/sphere.png",1.7)
  Spring.AddUnitIcon("square.user", "LuaUI/Icons/square.png")
  Spring.AddUnitIcon("square_+.user", "LuaUI/Icons/square_+.png")
  Spring.AddUnitIcon("square_x.user", "LuaUI/Icons/square_x.png")
  Spring.AddUnitIcon("square_x_factory.user", "LuaUI/Icons/square_x.png",1.5)
  Spring.AddUnitIcon("star-dark.user", "LuaUI/Icons/star-dark.png")
  Spring.AddUnitIcon("star.user", "LuaUI/Icons/star.png")
  Spring.AddUnitIcon("tri-down.user", "LuaUI/Icons/tri-down.png",1.3)
  Spring.AddUnitIcon("tri-up.user", "LuaUI/Icons/tri-up.png",1.4)
  Spring.AddUnitIcon("tri-up_fighter.user", "LuaUI/Icons/tri-up.png",0.9)
  Spring.AddUnitIcon("tri-up_fighter1.user", "LuaUI/Icons/tri-up.png",1.2)
  Spring.AddUnitIcon("triangle-down.user", "LuaUI/Icons/triangle-down.png")
  Spring.AddUnitIcon("triangle-up.user", "LuaUI/Icons/triangle-up.png")
  Spring.AddUnitIcon("x.user", "LuaUI/Icons/x.png")
  Spring.AddUnitIcon("rc.user", "LuaUI/Icons/rc.png",1.4)
  Spring.AddUnitIcon("rc1.user", "LuaUI/Icons/rc.png",2)
  Spring.AddUnitIcon("t4ships.user", "LuaUI/Icons/t4ships.png",2)


   
  -- Setup the unitdef icons
  for udid,ud in pairs(UnitDefs) do
  
    if (ud ~= nil) then
      if (ud.origIconType == nil) then
        ud.origIconType = ud.iconType
      end
 
--wind      
      if (ud.name=="armwin") or (ud.name=="corwin") or (ud.name=="tllwindtrap") then
        Spring.SetUnitDefIcon(udid, "e.user")
--fighters
      elseif (ud.name=="armfig") or (ud.name=="corveng") or (ud.name=="tllfight") or (ud.name=="armhawk") or (ud.name=="corvamp") or (ud.name=="tlladvfight") then
        Spring.SetUnitDefIcon(udid, "tri-up_fighter.user") 
--t3 fighters
      elseif (ud.name=="airwolf3g") or (ud.name=="shrike") then
        Spring.SetUnitDefIcon(udid, "tri-up_fighter1.user") 
--t4 fusions
      elseif (ud.name=="cfusionplant") or (ud.name=="afusionplant") or (ud.name=="tllmegacoldfus") then
        Spring.SetUnitDefIcon(udid, "e4.user")
--t2 fusions
      elseif (ud.name=="cafus") or (ud.name=="aafus") or (ud.name=="tllmedfusion") then
        Spring.SetUnitDefIcon(udid, "e3.user")
--std fusions
      elseif (ud.name=="armfus") or (ud.name=="corfus") or (ud.name=="tllcoldfus") or (ud.name=="armckfus") or (ud.name=="armdf") or (ud.name=="armuwfus")
      or (ud.name=="coruwfus") or (ud.name=="armckfus") or (ud.name=="tlluwfusion") then
        Spring.SetUnitDefIcon(udid, "e2.user")
--armcom
      elseif (ud.name=="armcom") or (ud.name=="armcom1") or (ud.name=="armcom4") or (ud.name=="armcom5") or (ud.name=="armcom6") or (ud.name=="armcom7") then
        Spring.SetUnitDefIcon(udid, "armcom.user")
--corcom
      elseif (ud.name=="corcom") or (ud.name=="corcom1") or (ud.name=="corcom3") or (ud.name=="corcom5") or (ud.name=="corcom6") or (ud.name=="corcom7") then
        Spring.SetUnitDefIcon(udid, "corcom.user")
--tllcom
      elseif (ud.name=="tllcom") or (ud.name=="tllcom1") or (ud.name=="tllcom3") or (ud.name=="tllcom5") or (ud.name=="tllcom6") or (ud.name=="tllcom7") then
        Spring.SetUnitDefIcon(udid, "tllcom.user")
--krogoth
      elseif (ud.name=="corkrog") then
        Spring.SetUnitDefIcon(udid, "krogoth.user")
--RC
      elseif (ud.name=="armrech3") or (ud.name=="armrech18") or (ud.name=="armrech21")
      or (ud.name=="corech3") or (ud.name=="corech18") or (ud.name=="corech21") then
        Spring.SetUnitDefIcon(udid, "rc.user")
--last rc
      elseif (ud.name=="ccovertopscentre") or (ud.name=="acovertopscentre") then
        Spring.SetUnitDefIcon(udid, "rc1.user")
--broadside etc
      elseif (ud.name=="abroadside") or (ud.name=="cdevastator") then
        Spring.SetUnitDefIcon(udid, "t4ships.user")
      elseif (ud.isFactory) then
        -- factories
        Spring.SetUnitDefIcon(udid, "square_x_factory.user")
      elseif (ud.isBuilder) then
        -- builders
        if ((ud.speed > 0) and ud.canMove) then
          Spring.SetUnitDefIcon(udid, "cross.user")     -- mobile
        else
          Spring.SetUnitDefIcon(udid, "square_+.user")  -- immobile
        end
      elseif (ud.stockpileWeaponDef ~= nil) then
      	-- nuke / antinuke ( stockpile weapon anyway )
      	Spring.SetUnitDefIcon(udid, "nuke.user")
      elseif (ud.canFly) then
        -- aircraft
        Spring.SetUnitDefIcon(udid, "tri-up.user")
      elseif ((ud.speed <= 0) and ud.hasShield) then
        -- immobile shields
        Spring.SetUnitDefIcon(udid, "hemi-up.user")
      elseif ((ud.extractsMetal > 0) or (ud.makesMetal > 0)) then
        -- metal extractors and makers
        Spring.SetUnitDefIcon(udid, "m.user")
      elseif ((ud.totalEnergyOut > 10) and (ud.speed <= 0)) then
        -- energy generators
        Spring.SetUnitDefIcon(udid, "e.user")
      elseif (ud.isTransport) then
        -- transports
        Spring.SetUnitDefIcon(udid, "diamond.user")
      elseif ((ud.minWaterDepth > 0) and (ud.speed > 0) and (ud.waterline > 10)) then
        -- submarines
        Spring.SetUnitDefIcon(udid, "tri-down.user")
      elseif ((ud.minWaterDepth > 0) and (ud.speed > 0)) then
        -- ships
        Spring.SetUnitDefIcon(udid, "hemi-down.user")
      elseif (((ud.radarRadius > 1) or
               (ud.sonarRadius > 1) or
               (ud.seismicRadius > 1)) and (ud.speed <= 0)) then
        -- sensors
        Spring.SetUnitDefIcon(udid, "hourglass-side.user")
      elseif (((ud.jammerRadius > 1) or
               (ud.sonarJamRadius > 1)) and (ud.speed <= 0)) then
        -- jammers
        Spring.SetUnitDefIcon(udid, "hourglass.user")
      elseif (ud.isBuilding or (ud.speed <= 0)) then
         -- defenders and other buildings
         if (not ud.weaponCount) then
            ud.weaponCount = 0
         end
        if (ud.weaponCount <= 0) then
          Spring.SetUnitDefIcon(udid, "square.user")
        else
          Spring.SetUnitDefIcon(udid, "x.user")
        end
      else
        if (ud.techLevel == 4) then
          Spring.SetUnitDefIcon(udid, "sphere2.user")
        elseif (ud.techLevel == 6) then
          Spring.SetUnitDefIcon(udid, "sphere3.user")
        else
          Spring.SetUnitDefIcon(udid, "sphere.user")
        end
      end
    end
  end
end


--------------------------------------------------------------------------------

