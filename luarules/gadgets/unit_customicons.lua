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
    name = "CustomIcons",
    desc = "Sets custom unit icons for TA",
    author = "trepan,BD,TheFatController,Nixtux",
    date = "Jan 8, 2007",
    license = "GNU GPL, v2 or later",
    layer = -100,
    enabled = true --  loaded by default?

  }
end

--------------------------------------------------------------------------------
if gadgetHandler:IsSyncedCode() then return false end
--------------------------------------------------------------------------------
local wasLuaModUIEnabled = 0

--------------------------------------------------------------------------------
function gadget:Initialize()
  Spring.AddUnitIcon("armcom.user", "icons/armcom.png", 2)
  Spring.AddUnitIcon("corcom.user", "icons/corcom.png", 2)
  Spring.AddUnitIcon("tllcom.user", "icons/tllcom.png", 2)
  Spring.AddUnitIcon("talon_com.user", "icons/talon_com.png", 2)
  Spring.AddUnitIcon("gok_com.user", "icons/gok_com.png", 2)
  Spring.AddUnitIcon("cross.user", "icons/cross.png")
  Spring.AddUnitIcon("diamond.user", "icons/diamond.png", 1.1)
  Spring.AddUnitIcon("diamond4.user", "icons/diamond.png", 4)
  Spring.AddUnitIcon("e.user", "icons/e.png")
  Spring.AddUnitIcon("e1.user", "icons/e.png", 1.2)
  Spring.AddUnitIcon("e2.user", "icons/e.png", 1.5)
  Spring.AddUnitIcon("e3.user", "icons/e.png", 1.8)
  Spring.AddUnitIcon("e4.user", "icons/e.png", 2.3)
  Spring.AddUnitIcon("e5.user", "icons/e.png", 3)
  Spring.AddUnitIcon("e6.user", "icons/e.png", 4)
  Spring.AddUnitIcon("hemi-down.user", "icons/hemi-down.png", 1.3)
  Spring.AddUnitIcon("hemi-up.user", "icons/hemi-up.png", 1.8)
  Spring.AddUnitIcon("hemi.user", "icons/hemi.png")
  Spring.AddUnitIcon("hourglass-side.user", "icons/hourglass-side.png")
  Spring.AddUnitIcon("hourglass.user", "icons/hourglass.png")
  Spring.AddUnitIcon("krogoth.user", "icons/krogoth.tga", 3)
  Spring.AddUnitIcon("s_krogoth.user", "icons/krogoth.tga", 4.5)
  Spring.AddUnitIcon("m-down.user", "icons/m-down.png")
  Spring.AddUnitIcon("m-up.user", "icons/m-up.png")
  Spring.AddUnitIcon("m.user", "icons/m.png")
  Spring.AddUnitIcon("nuke.user", "icons/nuke.png", 1.25)
  Spring.AddUnitIcon("slash.user", "icons/slash.png")
  Spring.AddUnitIcon("sphere.user", "icons/sphere.png", 1.1)
  Spring.AddUnitIcon("sphere1point5.user", "icons/sphere.png", 1.2)
  Spring.AddUnitIcon("sphere2.user", "icons/sphere.png", 1.35)
  Spring.AddUnitIcon("sphere2point5.user", "icons/sphere.png", 1.50)
  Spring.AddUnitIcon("sphere3.user", "icons/sphere.png", 1.7)
  Spring.AddUnitIcon("sphere3poing5.user", "icons/sphere.png", 1.85)
  Spring.AddUnitIcon("square.user", "icons/square.png")
  Spring.AddUnitIcon("square_+.user", "icons/square_+.png", 0.7)
  Spring.AddUnitIcon("square_+1.user", "icons/square_+.png", 0.8)
  Spring.AddUnitIcon("square_+2.user", "icons/square_+.png", 0.9)
  Spring.AddUnitIcon("square_+3.user", "icons/square_+.png", 1)
  Spring.AddUnitIcon("square_x.user", "icons/square_x.png")
  Spring.AddUnitIcon("square_x_factory.user", "icons/square_x.png", 1.5)
  Spring.AddUnitIcon("star-dark.user", "icons/star-dark.png")
  Spring.AddUnitIcon("star.user", "icons/star.png")
  Spring.AddUnitIcon("tri-down.user", "icons/tri-down.png", 1.3)
  Spring.AddUnitIcon("tri-up.user", "icons/tri-up.png", 1.4)
  Spring.AddUnitIcon("tri-up_fighter.user", "icons/tri-up.png", 0.9)
  Spring.AddUnitIcon("tri-up_fighter1.user", "icons/tri-up.png", 1.2)
  Spring.AddUnitIcon("triangle-down.user", "icons/triangle-down.png")
  Spring.AddUnitIcon("triangle-up.user", "icons/triangle-up.png")
  Spring.AddUnitIcon("x.user", "icons/x.png")
  Spring.AddUnitIcon("rc.user", "icons/rc.png", 1.4)
  Spring.AddUnitIcon("rc1.user", "icons/rc.png", 2)
  Spring.AddUnitIcon("t5ships.user", "icons/t5ships.png", 5)
  Spring.AddUnitIcon("t5bigships.user", "icons/t5ships.png", 6.5)
  Spring.AddUnitIcon("t6ships.user", "icons/t5ships.png", 8)
  Spring.AddUnitIcon("bships.user", "icons/bship.png", 2.5)
  Spring.AddUnitIcon("bsships.user", "icons/bship.png", 3.6)
  Spring.AddUnitIcon("flagship.user", "icons/bship.png", 5)
  Spring.AddUnitIcon("tiny-sphere.user", "icons/sphere.png", 0.65)
  Spring.AddUnitIcon("blank.user", "icons/sphere.png", 0.0)
  Spring.AddUnitIcon("mech.user", "icons/mech.tga", 3.60)
  Spring.AddUnitIcon("med_mech.user", "icons/mech.tga", 3.0)
  Spring.AddUnitIcon("small_mech.user", "icons/mech.tga", 2.5)
  Spring.AddUnitIcon("corpokie.user", "icons/corpokie.png", 3)
  Spring.AddUnitIcon("cormonkeylord.user", "icons/cormonkeylord.png", 4)
  Spring.AddUnitIcon("cormkl.user", "icons/cormkl.png", 5)
  Spring.AddUnitIcon("gok_azaroth.user", "icons/gok_azaroth.png", 5)
  Spring.AddUnitIcon("armmygalo.user", "icons/armmygalo.png", 5)
  Spring.AddUnitIcon("corlilith.user", "icons/corlilith.png", 6)
  Spring.AddUnitIcon("armolympus.user", "icons/armolympus.png", 4)
  Spring.AddUnitIcon("armexo.user", "icons/armexo.png", 4)
  Spring.AddUnitIcon("talon_mcv.user", "icons/talon_mcv.png", 3)
  Spring.AddUnitIcon("talon_grenat.user", "icons/talon_grenat.png", 4)
  Spring.AddUnitIcon("tllmcv.user", "icons/tllmcv.png", 4)
  Spring.AddUnitIcon("tllsamael.user", "icons/tllsamael.png", 6)
  Spring.AddUnitIcon("tllcolossus.user", "icons/tllcolossus.png", 4)
  Spring.AddUnitIcon("tllsaurus.user", "icons/tllsaurus.png", 5)
  Spring.AddUnitIcon("talon_mythril.user", "icons/talon_mythril.png", 5)
  Spring.AddUnitIcon("armkrypto.user", "icons/armkrypto.png", 3)
  Spring.AddUnitIcon("talon_annubis.user", "icons/talon_annubis.png", 4)
  Spring.AddUnitIcon("armpraet.user", "icons/armpraet.png", 3)
  Spring.AddUnitIcon("talon_scorpion.user", "icons/talon_scorpion.png", 3)
  Spring.AddUnitIcon("corgorg.user", "icons/corgorg.png", 3)
  Spring.AddUnitIcon("arm_furie.user", "icons/arm_furie.png", 3)
  Spring.AddUnitIcon("liche.user", "icons/liche.png", 2.5)
  Spring.AddUnitIcon("satellite.user", "icons/satellite.png", 3)
  Spring.AddUnitIcon("corraven1.user", "icons/corraven1.png", 4)
  Spring.AddUnitIcon("armmcv1.user", "icons/armmcv1.png", 4)
  Spring.AddUnitIcon("corhflag.user", "icons/corhflag.png", 4)
  Spring.AddUnitIcon("gok_cut1.user", "icons/gok_cut1.png", 3)
  Spring.AddUnitIcon("coradamantoise.user", "icons/coradamantoise.png", 4.5)
  Spring.AddUnitIcon("corskrog.user", "icons/corskrog.png", 5)
  Spring.AddUnitIcon("gok_kadesh.user", "icons/gok_kadesh.png", 5)

  -- Setup the unitdef icons
  for udid, ud in pairs(UnitDefs) do
    if ud ~= nil then
      if ud.origIconType == nil then
        ud.origIconType = ud.iconType
      end

      --wind
      if (ud.name == "armwin") or (ud.name == "corwin") or (ud.name == "tllwin") or (ud.name == "talon_win") or (ud.name == "gok_win") then
        Spring.SetUnitDefIcon(udid, "e.user")
        -- t1.5 wind/tidals
      elseif (ud.name == "armawin") or (ud.name == "talon_tide1") or (ud.name == "talon_win1") or (ud.name == "corawin") or (ud.name == "armatidal") or (ud.name == "coratidal") or (ud.name == "tllatide") or (ud.name == "tllwin1") or (ud.name == "gok_tide1") or (ud.name == "gok_win1") then
        Spring.SetUnitDefIcon(udid, "e1.user")
      elseif (ud.name == "armfig") or (ud.name == "corveng") or (ud.name == "tllfight") or (ud.name == "armhawk") or (ud.name == "corvamp") or (ud.name == "tlladvfight") or (ud.name == "talon_echelon") or (ud.name == "talon_token") or (ud.name == "gok_sucub") or (ud.name == "gok_angel") then
        --fighters
        Spring.SetUnitDefIcon(udid, "tri-up_fighter.user")
      elseif (ud.name == "armwolf") or (ud.name == "corshrike") or (ud.name == "tllshu") or (ud.name == "talon_hornet") then
        --t3 fighters
        Spring.SetUnitDefIcon(udid, "tri-up_fighter1.user")
      elseif (ud.name == "sat_radar") or (ud.name == "sat_interceptor") or (ud.name == "sat_strike") or (ud.name == "sat_antiair") or (ud.name == "armcsat") or (ud.name == "tllcsat") or (ud.name == "talon_skynet") or (ud.name == "corslander") then
        --satellite
        Spring.SetUnitDefIcon(udid, "satellite.user")
      elseif ud.name == "armcybr" then
        --liche
        Spring.SetUnitDefIcon(udid, "liche.user")
      elseif (ud.name == "talon_ufus") or (ud.name == "corufus") or (ud.name == "armufus") or (ud.name == "tllufus") then
        --t5 fusions
        Spring.SetUnitDefIcon(udid, "e6.user")
      elseif (ud.name == "armefus") or (ud.name == "corefus") or (ud.name == "tllefus") or (ud.name == "talon_efus") then
        --t4 fusions
        Spring.SetUnitDefIcon(udid, "e5.user")
      elseif (ud.name == "cfusionplant") or (ud.name == "afusionplant") or (ud.name == "tllmegacoldfus") or (ud.name == "talon_sfus") then
        --t3 fusions
        Spring.SetUnitDefIcon(udid, "e4.user")
      elseif (ud.name == "cafus") or (ud.name == "aafus") or (ud.name == "tllcoldfus") or (ud.name == "talon_afus") then
        --t2 fusions
        Spring.SetUnitDefIcon(udid, "e3.user")
      elseif (ud.name == "armfus") or (ud.name == "corfus") or (ud.name == "crnns") or (ud.name == "tllmedfusion") or (ud.name == "armuwfus") or (ud.name == "armuwfus1") or (ud.name == "coruwfus") or (ud.name == "tlluwfusion") or (ud.name == "talon_ckfus") then
        --std fusions
        Spring.SetUnitDefIcon(udid, "e2.user")
      elseif (ud.name == "armnanotc1") or (ud.name == "cornanotc1") or (ud.name == "tllnanotc1") or (ud.name == "armfnanotc1") or (ud.name == "corfnanotc1") or (ud.name == "tllfnanotc1") or (ud.name == "talon_nanotc1") or (ud.name == "talon_fnanotc1") or (ud.name == "gok_nanotc1") then
        --Level 2 nanos
        Spring.SetUnitDefIcon(udid, "square_+1.user")
      elseif (ud.name == "armnanotc2") or (ud.name == "cornanotc2") or (ud.name == "tllnanotc2") or (ud.name == "armfnanotc2") or (ud.name == "corfnanotc2") or (ud.name == "tllfnanotc2") or (ud.name == "talon_nanotc2") or (ud.name == "talon_fnanotc2") or (ud.name == "gok_nanotc2") then
        --Level 3 nanos
        Spring.SetUnitDefIcon(udid, "square_+2.user")
      elseif (ud.name == "armnanotc3") or (ud.name == "cornanotc3") or (ud.name == "tllnanotc3") or (ud.name == "armfnanotc3") or (ud.name == "corfnanotc3") or (ud.name == "tllfnanotc3") or (ud.name == "talon_nanotc3") or (ud.name == "talon_fnanotc3") or (ud.name == "gok_nanotc3") or (ud.name == "armnanotc4") or (ud.name == "cornanotc4") or (ud.name == "tllnanotc4") or (ud.name == "talon_nanotc4") or (ud.name == "gok_nanotc4") then
        --Level 4 nanos
        Spring.SetUnitDefIcon(udid, "square_+3.user")
      elseif ud.name == "corlilith" then
        --Spider
        Spring.SetUnitDefIcon(udid, "corlilith.user")
      elseif ud.name == "corpokie" then
        Spring.SetUnitDefIcon(udid, "corpokie.user")
      elseif ud.name == "cormonkeylord" then
        Spring.SetUnitDefIcon(udid, "cormonkeylord.user")
      elseif ud.name == "cormkl" then
        Spring.SetUnitDefIcon(udid, "cormkl.user")
      elseif ud.name == "gok_azaroth" then
        Spring.SetUnitDefIcon(udid, "gok_azaroth.user")
      elseif ud.name == "armmygalo" then
        Spring.SetUnitDefIcon(udid, "armmygalo.user")
      elseif ud.name == "coradamantoise" then
        Spring.SetUnitDefIcon(udid, "coradamantoise.user")
      elseif ud.name == "arm_furie" then
        --Furie
        Spring.SetUnitDefIcon(udid, "arm_furie.user")
      elseif ud.name == "corgorg" then
        --Gorg
        Spring.SetUnitDefIcon(udid, "corgorg.user")
      elseif ud.name == "armolympus" then
        --Olympus
        Spring.SetUnitDefIcon(udid, "armolympus.user")
      elseif ud.name == "armexo" then
        --armexo
        Spring.SetUnitDefIcon(udid, "armexo.user")
      elseif ud.name == "tllsaurus" then
        --tllsaurus
        Spring.SetUnitDefIcon(udid, "tllsaurus.user")
      elseif ud.name == "tllcolossus" then
        --tllcolossus
        Spring.SetUnitDefIcon(udid, "tllcolossus.user")
      elseif ud.name == "corraven1" then
        --cataclysm
        Spring.SetUnitDefIcon(udid, "corraven1.user")
      elseif ud.name == "tllmcv" then
        --tllmcv
        Spring.SetUnitDefIcon(udid, "tllmcv.user")

      elseif ud.name == "gok_kadesh" then
        Spring.SetUnitDefIcon(udid, "gok_kadesh.user")

      elseif ud.name == "corskrog" then
        Spring.SetUnitDefIcon(udid, "corskrog.user")

      elseif ud.name == "gok_cut1" then
        --gok_cut1
        Spring.SetUnitDefIcon(udid, "gok_cut1.user")

      elseif ud.name == "armmcv1" then
        --armmcv1
        Spring.SetUnitDefIcon(udid, "armmcv1.user")

      elseif ud.name == "corhflag" then
        --corhflag
        Spring.SetUnitDefIcon(udid, "corhflag.user")

      elseif ud.name == "tllsamael" then
        --tllsamael
        Spring.SetUnitDefIcon(udid, "tllsamael.user")
      elseif (ud.name == "talon_mcv") or (ud.name == "talon_mcv1") then
        --talon_mcv
        Spring.SetUnitDefIcon(udid, "talon_mcv.user")
      elseif ud.name == "talon_grenat" then
        --talon_grenat
        Spring.SetUnitDefIcon(udid, "talon_grenat.user")
      elseif (ud.name == "armcom") or (ud.name == "armcom1") or (ud.name == "armcom2") or (ud.name == "armcom3") then
        --armcom
        Spring.SetUnitDefIcon(udid, "armcom.user")
      elseif (ud.name == "corcom") or (ud.name == "corcom1") or (ud.name == "corcom2") or (ud.name == "corcom3") then
        --corcom
        Spring.SetUnitDefIcon(udid, "corcom.user")
      elseif (ud.name == "tllcom") or (ud.name == "tllcom1") or (ud.name == "tllcom2") or (ud.name == "tllcom3") then
        --tllcom
        Spring.SetUnitDefIcon(udid, "tllcom.user")
      elseif (ud.name == "talon_com") or (ud.name == "talon_com1") or (ud.name == "talon_com2") or (ud.name == "talon_com3") then
        --talon_com
        Spring.SetUnitDefIcon(udid, "talon_com.user")
      elseif (ud.name == "gok_com") or (ud.name == "gok_com1") or (ud.name == "gok_com2") or (ud.name == "gok_com3") then
        --gok_com
        Spring.SetUnitDefIcon(udid, "gok_com.user")
      elseif ud.name == "corkrog" then
        --krogoth
        Spring.SetUnitDefIcon(udid, "krogoth.user")
      elseif (ud.name == "armbanth") or (ud.name == "armgor") or (ud.name == "talon_talos") then
        --small mech
        Spring.SetUnitDefIcon(udid, "small_mech.user")
      elseif (ud.name == "armorco") or (ud.name == "armraptor") or (ud.name == "gok_archon") then
        --med mech
        Spring.SetUnitDefIcon(udid, "med_mech.user")
      elseif ud.name == "talon_annubis" then
        --t3 Annubis
        Spring.SetUnitDefIcon(udid, "talon_annubis.user")
      elseif ud.name == "armkrypto" then
        --t3 Krypto
        Spring.SetUnitDefIcon(udid, "armkrypto.user")
      elseif ud.name == "talon_mythril" then
        --t4 mechs
        Spring.SetUnitDefIcon(udid, "talon_mythril.user")
      elseif ud.name == "talon_scorpion" then
        --t4 mechs
        Spring.SetUnitDefIcon(udid, "talon_scorpion.user")
      elseif ud.name == "armpraet" then
        --t4 mechs
        Spring.SetUnitDefIcon(udid, "armpraet.user")
      elseif (ud.name == "armhope") or (ud.name == "cordust") or (ud.name == "corvaliant") or (ud.name == "tllbarbarus") or (ud.name == "talon_gold") then
        --T5 Medium / Small Hero
        Spring.SetUnitDefIcon(udid, "t5ships.user")
      elseif (ud.name == "abroadside") or (ud.name == "cdevastator") or (ud.name == "tllzeppelin") or (ud.name == "gok_apocalypse") then
        --T5 Big Hero
        Spring.SetUnitDefIcon(udid, "t5bigships.user")
      elseif (ud.name == "armarch") or (ud.name == "talon_independence") or (ud.name == "gok_squid") then
        --T6 Arch or independance
        Spring.SetUnitDefIcon(udid, "t6ships.user")
      elseif (ud.name == "corbats") or (ud.name == "armbats") or (ud.name == "tllviking") or (ud.name == "talon_imperator") then
        --battleships
        Spring.SetUnitDefIcon(udid, "bships.user")
      elseif (ud.name == "corblackhy") or (ud.name == "cortyrnt") or (ud.name == "aseadragon") or (ud.name == "armtrmph") or (ud.name == "armbc") or (ud.name == "tllcaps") or (ud.name == "talon_dread") or (ud.name == "talon_fcar") then
        --uber ships
        Spring.SetUnitDefIcon(udid, "bsships.user")
      elseif (ud.name == "talon_paladium") or (ud.name == "corurbanus") or (ud.name == "armcentrum") or (ud.name == "tllpliosaurus") then
        --t4 ships
        Spring.SetUnitDefIcon(udid, "flagship.user")
      elseif ud.isFactory then
        -- factories
        Spring.SetUnitDefIcon(udid, "square_x_factory.user")
      elseif ud.isBuilder then
        -- builders
        if (ud.speed > 0) and ud.canMove then
          Spring.SetUnitDefIcon(udid, "cross.user") -- mobile
        else
          Spring.SetUnitDefIcon(udid, "square_+.user") -- immobile
        end
      elseif ud.stockpileWeaponDef ~= nil then
        -- nuke / antinuke ( stockpile weapon anyway )
        Spring.SetUnitDefIcon(udid, "nuke.user")
      elseif ud.canFly then
        -- aircraft
        Spring.SetUnitDefIcon(udid, "tri-up.user")
      elseif (ud.speed <= 0) and ud.shieldWeaponDef then
        -- immobile shields
        Spring.SetUnitDefIcon(udid, "hemi-up.user")
      elseif ((ud.extractsMetal > 0) or (ud.makesMetal > 0)) or (ud.name == "armmakr") or (ud.name == "armfmkr") or (ud.name == "ametalmakerlvl1") or (ud.name == "armamaker") or (ud.name == "armmmkr") or (ud.name == "armuwmmm") or (ud.name == "ametalmakerlvl2") or (ud.name == "ametalmakerlvl3") or (ud.name == "cormakr") or (ud.name == "corfmkr") or (ud.name == "cmetalmakerlvl1") or (ud.name == "coramaker") or (ud.name == "cormmkr") or (ud.name == "coruwmmm") or (ud.name == "cmetalmakerlvl2") or (ud.name == "tllmm") or (ud.name == "tlluwconv") or (ud.name == "tllammaker") or (ud.name == "tllwmmohoconv") then
        -- metal extractors and makers
        Spring.SetUnitDefIcon(udid, "m.user")
      elseif (ud.totalEnergyOut > 10) and (ud.speed <= 0) then
        -- energy generators
        Spring.SetUnitDefIcon(udid, "e.user")
      elseif ud.isTransport then
        -- transports
        Spring.SetUnitDefIcon(udid, "diamond.user")
      elseif (ud.minWaterDepth > 0) and (ud.speed > 0) and (ud.waterline > 10) then
        -- submarines
        Spring.SetUnitDefIcon(udid, "tri-down.user")
      elseif (ud.minWaterDepth > 0) and (ud.speed > 0) then
        -- ships
        Spring.SetUnitDefIcon(udid, "hemi-down.user")
      elseif ((ud.radarRadius > 1) or (ud.sonarRadius > 1) or (ud.seismicRadius > 1)) and (ud.speed <= 0) and (#ud.weapons <= 0) then
        -- sensors
        Spring.SetUnitDefIcon(udid, "hourglass-side.user")
      elseif ((ud.jammerRadius > 1) or (ud.sonarJamRadius > 1)) and (ud.speed <= 0) then
        -- jammers
        Spring.SetUnitDefIcon(udid, "hourglass.user")
      elseif (ud.name == "cordrag") or (ud.name == "corfdrag") or (ud.name == "corfort") or (ud.name == "armdrag") or (ud.name == "armfdrag") or (ud.name == "armfort") or (ud.name == "gok_drag") or (ud.name == "gok_fdrag") or (ud.name == "gok_fort") or (ud.name == "talon_drag") or (ud.name == "talon_fdrag") or (ud.name == "talon_fort") or (ud.name == "tlldtns") or (ud.name == "tlladt") or (ud.name == "tlldt") then
        --Dragon teeth
        Spring.SetUnitDefIcon(udid, "blank.user")
      elseif ud.isBuilding or (ud.speed <= 0) then
        -- defenders and other buildings
        if not ud.weaponCount then
          ud.weaponCount = 0
        end

        if #ud.weapons <= 0 then
          Spring.SetUnitDefIcon(udid, "square.user")
        else
          if ud.weapons[1].onlyTargets["vtol"] then
            Spring.SetUnitDefIcon(udid, "slash.user")
          else
            Spring.SetUnitDefIcon(udid, "x.user")
          end
        end
      end
    end
  end

  -- Shrink scouts
  Spring.SetUnitDefIcon(UnitDefNames["corfav"].id, "tiny-sphere.user")
  Spring.SetUnitDefIcon(UnitDefNames["armfav"].id, "tiny-sphere.user")
  Spring.SetUnitDefIcon(UnitDefNames["corpunk"].id, "tiny-sphere.user")
  Spring.SetUnitDefIcon(UnitDefNames["armflea"].id, "tiny-sphere.user")
  Spring.SetUnitDefIcon(UnitDefNames["tllbug"].id, "tiny-sphere.user")
  Spring.SetUnitDefIcon(UnitDefNames["tllgladius"].id, "tiny-sphere.user")
  Spring.SetUnitDefIcon(UnitDefNames["gok_cut"].id, "tiny-sphere.user")
  Spring.SetUnitDefIcon(UnitDefNames["gok_negator"].id, "tiny-sphere.user")
  Spring.SetUnitDefIcon(UnitDefNames["gok_hellbiker"].id, "tiny-sphere.user")
  Spring.SetUnitDefIcon(UnitDefNames["talon_infantry"].id, "tiny-sphere.user")
  Spring.SetUnitDefIcon(UnitDefNames["talon_rebel"].id, "tiny-sphere.user")
  Spring.SetUnitDefIcon(UnitDefNames["talon_mercenary"].id, "tiny-sphere.user")
  Spring.SetUnitDefIcon(UnitDefNames["talon_sniper"].id, "tiny-sphere.user")
  Spring.SetUnitDefIcon(UnitDefNames["talon_topaz"].id, "tiny-sphere.user")
end

local function IsUnitProducedByAnyFactoryFromList(factories, unitDefId)
  if factories and unitDefId then
    for _, factory in pairs(factories) do
      local buildOptions = UnitDefNames[factory].buildOptions

      if buildOptions then
        for _, buildOption in pairs(buildOptions) do
          if unitDefId == buildOption then return true end
        end
      end
    end
  end

  return false
end
--------------------------------------------------------------------------------
