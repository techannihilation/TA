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
-- This gadget checks through the attributes of each unitdef and assigns an appropriate icon for use in the minimap & zoomed out mode.
--
-- The reason that this is a gadget (it could also be a widget) and not part of weapondefs_post.lua/iconTypes.lua is the following:  
-- the default valuesfor UnitDefs attributes that are not specified in our unitdefs lua files are only loaded into UnitDefs AFTER  
-- unitdefs_post.lua and iconTypes.lua have been processed. For example, at the time of unitdefs_post, for most units ud.speed is  
-- nil and not a number, so we can't e.g. compare it to zero. Also, it's more modularized as a widget/gadget. 
-- [We could set the default values up in unitdefs_post to match engine defaults but thats just too hacky.]
--
-- Bluestone 27/04/2013
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "CustomIcons",
    desc      = "Sets custom unit icons for BA",
    author    = "trepan,BD,TheFatController",
    date      = "Jan 8, 2007",
    license   = "GNU GPL, v2 or later",
    layer     = -100,
    enabled   = true  --  loaded by default?
  }
end

--------------------------------------------------------------------------------

if (gadgetHandler:IsSyncedCode()) then
  return false
end

--------------------------------------------------------------------------------

local wasLuaModUIEnabled = 0

--------------------------------------------------------------------------------

function gadget:Initialize()

  Spring.AddUnitIcon("armcom.user", "icons/armcom.png",2)
  Spring.AddUnitIcon("corcom.user", "icons/corcom.png",2)
  Spring.AddUnitIcon("tllcom.user", "icons/tllcom.png",2)
  Spring.AddUnitIcon("cross.user", "icons/cross.png")
  Spring.AddUnitIcon("diamond.user", "icons/diamond.png",1.1)
  Spring.AddUnitIcon("e.user", "icons/e.png")
  Spring.AddUnitIcon("e1.user", "icons/e.png",1.2)
  Spring.AddUnitIcon("e2.user", "icons/e.png",1.4)
  Spring.AddUnitIcon("e3.user", "icons/e.png",1.8)
  Spring.AddUnitIcon("e4.user", "icons/e.png",2.3)
  Spring.AddUnitIcon("hemi-down.user", "icons/hemi-down.png",1.3)
  Spring.AddUnitIcon("hemi-up.user", "icons/hemi-up.png")
  Spring.AddUnitIcon("hemi.user", "icons/hemi.png")
  Spring.AddUnitIcon("hourglass-side.user", "icons/hourglass-side.png")
  Spring.AddUnitIcon("hourglass.user", "icons/hourglass.png")
  Spring.AddUnitIcon("krogoth.user", "icons/krogoth.png",3)
  Spring.AddUnitIcon("m-down.user", "icons/m-down.png")
  Spring.AddUnitIcon("m-up.user", "icons/m-up.png")
  Spring.AddUnitIcon("m.user", "icons/m.png")
  Spring.AddUnitIcon("nuke.user", "icons/nuke.png",1.25)
  Spring.AddUnitIcon("sphere.user", "icons/sphere.png",1.1)
  Spring.AddUnitIcon("sphere2.user", "icons/sphere.png",1.35)
  Spring.AddUnitIcon("sphere3.user", "icons/sphere.png",1.7)
  Spring.AddUnitIcon("square.user", "icons/square.png")
  Spring.AddUnitIcon("square_+.user", "icons/square_+.png")
  Spring.AddUnitIcon("square_x.user", "icons/square_x.png")
  Spring.AddUnitIcon("square_x_factory.user", "icons/square_x.png",1.5)
  Spring.AddUnitIcon("star-dark.user", "icons/star-dark.png")
  Spring.AddUnitIcon("star.user", "icons/star.png")
  Spring.AddUnitIcon("tri-down.user", "icons/tri-down.png",1.3)
  Spring.AddUnitIcon("tri-up.user", "icons/tri-up.png",1.4)
  Spring.AddUnitIcon("tri-up_fighter.user", "icons/tri-up.png",0.9)
  Spring.AddUnitIcon("tri-up_fighter1.user", "icons/tri-up.png",1.2)
  Spring.AddUnitIcon("triangle-down.user", "icons/triangle-down.png")
  Spring.AddUnitIcon("triangle-up.user", "icons/triangle-up.png")
  Spring.AddUnitIcon("x.user", "icons/x.png")
  Spring.AddUnitIcon("rc.user", "icons/rc.png",1.4)
  Spring.AddUnitIcon("rc1.user", "icons/rc.png",2)
  Spring.AddUnitIcon("t4ships.user", "icons/t4ships.png",2)
  Spring.AddUnitIcon("bships.user", "icons/bship.png",1.7)
  Spring.AddUnitIcon("bsships.user", "icons/bship.png",2.3)
  Spring.AddUnitIcon("tiny-sphere.user", "icons/sphere.png",0.65)
  Spring.AddUnitIcon("shield.user", "icons/shield.tga",1.7)

   
  -- Setup the unitdef icons
  for udid,ud in pairs(UnitDefs) do
  
    if (ud ~= nil) then
      if (ud.origIconType == nil) then
        ud.origIconType = ud.iconType
      end
 
--wind      
      if (ud.name=="armwin") or (ud.name=="corwin") or (ud.name=="tllwindtrap") then
        Spring.SetUnitDefIcon(udid, "e.user")
-- t1.5 wind      
      elseif (ud.name=="armawin") or (ud.name=="corawin") then
        Spring.SetUnitDefIcon(udid, "e1.user")
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
      elseif (ud.name=="cafus") or (ud.name=="aafus") or (ud.name=="tllcoldfus") then
        Spring.SetUnitDefIcon(udid, "e3.user")
--std fusions
      elseif (ud.name=="armfus") or (ud.name=="corfus") or (ud.name=="tllmedfusion") or (ud.name=="armckfus") or (ud.name=="armdf") or (ud.name=="armuwfus")
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
      elseif (ud.name=="abroadside") or (ud.name=="cdevastator") or (ud.name=="tllvaliant") then
        Spring.SetUnitDefIcon(udid, "t4ships.user")
--battleships
      elseif (ud.name=="corbats") or (ud.name=="armbats") or (ud.name=="tllviking") then 
        Spring.SetUnitDefIcon(udid, "bships.user")
--uber ships
	 elseif (ud.name=="corblackhy") or (ud.name=="cortyrnt") or (ud.name=="aseadragon")
      or (ud.name=="armtrmph") or (ud.name=="armbc") then
        Spring.SetUnitDefIcon(udid, "bsships.user")
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
-- nuke / antinuke ( stockpile weapon anyway )
      elseif (ud.stockpileWeaponDef ~= nil) then
      	Spring.SetUnitDefIcon(udid, "nuke.user")
-- aircraft	
      elseif (ud.canFly) then
        Spring.SetUnitDefIcon(udid, "tri-up.user")
-- immobile shields
      elseif ((ud.speed <= 0) and ud.shieldWeaponDef) then
        Spring.SetUnitDefIcon(udid, "shield.user")
-- metal extractors and makers
      elseif ((ud.extractsMetal > 0) or (ud.makesMetal > 0)) or
	(ud.name=="armmakr") or (ud.name=="armfmkr") or (ud.name=="ametalmakerlvl1") or (ud.name=="armamaker") or (ud.name=="armckmakr") or (ud.name=="armmmkr") or (ud.name=="armuwmmm") or (ud.name=="ametalmakerlvl2") or
	(ud.name=="cormakr") or (ud.name=="corfmkr") or (ud.name=="cmetalmakerlvl1") or (ud.name=="coramaker") or (ud.name=="corhmakr") or (ud.name=="cormmkr") or (ud.name=="coruwmmm")or (ud.name=="cmetalmakerlvl2")
	or (ud.name=="tllmm") or (ud.name=="tlluwconv") or (ud.name=="tllammaker") or (ud.name=="tllwmmohoconv")then
        Spring.SetUnitDefIcon(udid, "m.user")
-- energy generators
      elseif ((ud.totalEnergyOut > 10) and (ud.speed <= 0)) then
        Spring.SetUnitDefIcon(udid, "e.user")
-- transports
      elseif (ud.isTransport) then
        Spring.SetUnitDefIcon(udid, "diamond.user")
-- submarines
      elseif ((ud.minWaterDepth > 0) and (ud.speed > 0) and (ud.waterline > 10)) then
        Spring.SetUnitDefIcon(udid, "tri-down.user")
-- ships
      elseif ((ud.minWaterDepth > 0) and (ud.speed > 0)) then
        Spring.SetUnitDefIcon(udid, "hemi-down.user")
-- sensors
      elseif (((ud.radarRadius > 1) or
               (ud.sonarRadius > 1) or
               (ud.seismicRadius > 1)) and (ud.speed <= 0) and (#ud.weapons <= 0)) then
        Spring.SetUnitDefIcon(udid, "hourglass-side.user")
-- jammers
      elseif (((ud.jammerRadius > 1) or
               (ud.sonarJamRadius > 1)) and (ud.speed <= 0)) then
        Spring.SetUnitDefIcon(udid, "hourglass.user")
-- defenders and other buildings
      elseif (ud.isBuilding or (ud.speed <= 0)) then
         if (not ud.weaponCount) then
            ud.weaponCount = 0
         end
       if (#ud.weapons <= 0) then
          Spring.SetUnitDefIcon(udid, "square.user")
        else
		  if ud.weapons[1].onlyTargets["vtol"] then
			Spring.SetUnitDefIcon(udid, "slash.user")		  
		  else
			Spring.SetUnitDefIcon(udid, "x.user")
		  end
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
  
-- Shrink scouts
  Spring.SetUnitDefIcon(UnitDefNames["corfav"].id, "tiny-sphere.user")
  Spring.SetUnitDefIcon(UnitDefNames["armfav"].id, "tiny-sphere.user")
  Spring.SetUnitDefIcon(UnitDefNames["corak"].id, "tiny-sphere.user")
  Spring.SetUnitDefIcon(UnitDefNames["armpw"].id, "tiny-sphere.user")
  Spring.SetUnitDefIcon(UnitDefNames["armflea"].id, "tiny-sphere.user")
  Spring.SetUnitDefIcon(UnitDefNames["tllbug"].id, "tiny-sphere.user")
  Spring.SetUnitDefIcon(UnitDefNames["tllgladius"].id, "tiny-sphere.user")
  Spring.SetUnitDefIcon(UnitDefNames["tllprivate"].id, "tiny-sphere.user")
end

--------------------------------------------------------------------------------

