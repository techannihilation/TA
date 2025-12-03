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
  Spring.AddUnitIcon("rumad_king.user", "icons/rumad_king.png", 2)
  Spring.AddUnitIcon("rumad_com.user", "icons/rumad_com.png", 2)
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
  Spring.AddUnitIcon("tllalbertosaurus.user", "icons/tllalbertosaurus.png", 5)
  Spring.AddUnitIcon("gok_azaroth.user", "icons/gok_azaroth.png", 5)
  Spring.AddUnitIcon("armmygalo.user", "icons/armmygalo.png", 5)
  Spring.AddUnitIcon("corlilith.user", "icons/corlilith.png", 6)
  Spring.AddUnitIcon("armolympus.user", "icons/armolympus.png", 4)
  Spring.AddUnitIcon("armexo.user", "icons/armexo.png", 5)
  Spring.AddUnitIcon("talon_mcv.user", "icons/talon_mcv.png", 3)
  Spring.AddUnitIcon("talon_grenat.user", "icons/talon_grenat.png", 4)
  Spring.AddUnitIcon("tllmcv.user", "icons/tllmcv.png", 4)
  Spring.AddUnitIcon("tllsamael.user", "icons/tllsamael.png", 6)
  Spring.AddUnitIcon("tll_tyranosaurus.user", "icons/tll_tyranosaurus.png", 7)
  Spring.AddUnitIcon("tll_neobahomet.user", "icons/tll_neobahomet.png", 5)
  Spring.AddUnitIcon("tllcolossus.user", "icons/tllcolossus.png", 4)
  Spring.AddUnitIcon("tllsaurus.user", "icons/tllsaurus.png", 5)
  Spring.AddUnitIcon("talon_mythril.user", "icons/talon_mythril.png", 5)
  Spring.AddUnitIcon("armkrypto.user", "icons/armkrypto.png", 3)
  Spring.AddUnitIcon("talon_annubis.user", "icons/talon_annubis.png", 4)
  Spring.AddUnitIcon("armpraet.user", "icons/armpraet.png", 3)
  Spring.AddUnitIcon("talon_scorpion.user", "icons/talon_scorpion.png", 3)
  Spring.AddUnitIcon("corgorg.user", "icons/corgorg.png", 3)
  Spring.AddUnitIcon("armorco.user", "icons/armorco.png", 3)
  Spring.AddUnitIcon("liche.user", "icons/liche.png", 2.5)
  Spring.AddUnitIcon("satellite.user", "icons/satellite.png", 3)
  Spring.AddUnitIcon("corraven1.user", "icons/corraven1.png", 4)
  Spring.AddUnitIcon("armmcv1.user", "icons/armmcv1.png", 4)
  Spring.AddUnitIcon("corhflag.user", "icons/corhflag.png", 4)
  Spring.AddUnitIcon("gok_cut1.user", "icons/gok_cut1.png", 3)
  Spring.AddUnitIcon("coradamantoise.user", "icons/coradamantoise.png", 4.5)
  Spring.AddUnitIcon("corskrog.user", "icons/corskrog.png", 5)
  Spring.AddUnitIcon("gok_kadesh.user", "icons/gok_kadesh.png", 6)
  Spring.AddUnitIcon("gok_slanesh.user", "icons/gok_slanesh.png", 5)
  Spring.AddUnitIcon("talon_repentance.user", "icons/talon_repentance.png", 5)
  Spring.AddUnitIcon("gok_satan.user", "icons/gok_satan.png", 3)
  Spring.AddUnitIcon("rumad_mongol.user", "icons/rumad_mongol.png", 3)
  Spring.AddUnitIcon("rumad_hellion.user", "icons/rumad_hellion.png", 4)
  Spring.AddUnitIcon("rumad_oasis.user", "icons/rumad_oasis.png", 3)
  Spring.AddUnitIcon("rumad_mcv1.user", "icons/rumad_mcv1.png", 4)
  Spring.AddUnitIcon("rumad_mcv2.user", "icons/rumad_mcv2.png", 6)


  -- Setup the unitdef icons
  for udid, ud in pairs(UnitDefs) do
    if ud ~= nil then
      if ud.origIconType == nil then
        ud.origIconType = ud.iconType
      end

      -- Wind
      if (ud.name == "armwin") or (ud.name == "corwin") or (ud.name == "tllwin") or (ud.name == "talon_win") or (ud.name == "gok_win") then
        Spring.SetUnitDefIcon(udid, "e.user")

      -- t1.5 wind/tidals
      elseif (ud.name == "armawin") or (ud.name == "talon_tide1") or (ud.name == "talon_win1") or (ud.name == "corawin") or (ud.name == "armatidal") or (ud.name == "coratidal") or (ud.name == "tllatide") or (ud.name == "tllwin1") or (ud.name == "gok_tide1") or (ud.name == "gok_win1") or (ud.name == "rumad_win1") then
        Spring.SetUnitDefIcon(udid, "e1.user")

      -- fighters
      elseif (ud.name == "armfig") or (ud.name == "corveng") or (ud.name == "tllfight") or (ud.name == "armhawk") or (ud.name == "corvamp") or (ud.name == "tlladvfight") or (ud.name == "talon_echelon") or (ud.name == "talon_token") or (ud.name == "gok_sucub") or (ud.name == "gok_angel") then
        Spring.SetUnitDefIcon(udid, "tri-up_fighter.user")

        --t3 fighters
      elseif (ud.name == "armwolf") or (ud.name == "corshrike") or (ud.name == "tllshu") or (ud.name == "talon_hornet") then
        Spring.SetUnitDefIcon(udid, "tri-up_fighter1.user")

      -- Satellite
      elseif (ud.name == "arm_sat_radar") or (ud.name == "arm_sat_mds") or (ud.name == "arm_sat_strike") or (ud.name == "arm_sat_constructor") or (ud.name == "core_sat_constructor") or (ud.name == "talon_sat_constructor") or (ud.name == "talon_skynet") or (ud.name == "core_sat_lander") then
        Spring.SetUnitDefIcon(udid, "satellite.user")

      -- t5 fusions
      elseif (ud.name == "talon_ufus") or (ud.name == "corufus") or (ud.name == "armufus") or (ud.name == "tllufus") or (ud.name == "gok_ufusion") then
        Spring.SetUnitDefIcon(udid, "e6.user")

      -- t4 fusions
      elseif (ud.name == "armefus") or (ud.name == "corefus") or (ud.name == "tllefus") or (ud.name == "talon_efus") or (ud.name == "gok_efusion") or (ud.name == "rumad_efusion") then
        Spring.SetUnitDefIcon(udid, "e5.user")

      -- t3 fusions
      elseif (ud.name == "cfusionplant") or (ud.name == "afusionplant") or (ud.name == "tllmegacoldfus") or (ud.name == "talon_sfus") or (ud.name == "gok_sfusion") or (ud.name == "rumad_sfusion") then
        Spring.SetUnitDefIcon(udid, "e4.user")

      -- t2 fusions
      elseif (ud.name == "cafus") or (ud.name == "aafus") or (ud.name == "tllcoldfus") or (ud.name == "talon_afus") or (ud.name == "rumad_afusion")  then
        Spring.SetUnitDefIcon(udid, "e3.user")

      -- std fusions
      elseif (ud.name == "armfus") or (ud.name == "corfus") or (ud.name == "crnns") or (ud.name == "tllmedfusion") or (ud.name == "armuwfus") or (ud.name == "armuwfus1") or (ud.name == "coruwfus") or (ud.name == "tlluwfusion") or (ud.name == "talon_ckfus") then
        Spring.SetUnitDefIcon(udid, "e2.user")

      --Level 2 nanos
      elseif (ud.name == "armnanotc1") or (ud.name == "cornanotc1") or (ud.name == "tllnanotc1") or (ud.name == "armfnanotc1") or (ud.name == "corfnanotc1") or (ud.name == "tllfnanotc1") or (ud.name == "talon_nanotc1") or (ud.name == "talon_fnanotc1") or (ud.name == "gok_nanotc1") or (ud.name == "rumad_nanotc1") then
        Spring.SetUnitDefIcon(udid, "square_+1.user")
      --Level 3 nanos
      elseif (ud.name == "armnanotc2") or (ud.name == "cornanotc2") or (ud.name == "tllnanotc2") or (ud.name == "armfnanotc2") or (ud.name == "corfnanotc2") or (ud.name == "tllfnanotc2") or (ud.name == "talon_nanotc2") or (ud.name == "talon_fnanotc2") or (ud.name == "gok_nanotc2")  or (ud.name == "rumad_nanotc2") then
        Spring.SetUnitDefIcon(udid, "square_+2.user")
      --Level 4 nanos
      elseif (ud.name == "armnanotc3") or (ud.name == "cornanotc3") or (ud.name == "tllnanotc3") or (ud.name == "armfnanotc3") or (ud.name == "corfnanotc3") or (ud.name == "tllfnanotc3") or (ud.name == "talon_nanotc3") or (ud.name == "talon_fnanotc3") or (ud.name == "gok_nanotc3") or (ud.name == "armnanotc4") or (ud.name == "cornanotc4") or (ud.name == "tllnanotc4") or (ud.name == "talon_nanotc4") or (ud.name == "gok_nanotc4")  or (ud.name == "rumad_nanotc4") then
        Spring.SetUnitDefIcon(udid, "square_+3.user")

      -- Customs units
      elseif ud.name == "tllalbertosaurus" then
          Spring.SetUnitDefIcon(udid, "tllalbertosaurus.user")
          elseif ud.name == "armcybr" then
        Spring.SetUnitDefIcon(udid, "liche.user")
      elseif ud.name == "corlilith" then
        Spring.SetUnitDefIcon(udid, "corlilith.user")
      elseif ud.name == "gok_slanesh" then
        Spring.SetUnitDefIcon(udid, "gok_slanesh.user")
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
      elseif ud.name == "armorco" then
        Spring.SetUnitDefIcon(udid, "armorco.user")
      elseif ud.name == "corgorg" then
        Spring.SetUnitDefIcon(udid, "corgorg.user")
      elseif ud.name == "armolympus" then
        Spring.SetUnitDefIcon(udid, "armolympus.user")
      elseif ud.name == "armexo" then
        Spring.SetUnitDefIcon(udid, "armexo.user")
      elseif ud.name == "tllsaurus" then
        Spring.SetUnitDefIcon(udid, "tllsaurus.user")
      elseif ud.name == "tllcolossus" then
        Spring.SetUnitDefIcon(udid, "tllcolossus.user")
      elseif ud.name == "corraven1" then
        Spring.SetUnitDefIcon(udid, "corraven1.user")
      elseif ud.name == "tllmcv" then
        Spring.SetUnitDefIcon(udid, "tllmcv.user")
      elseif ud.name == "gok_kadesh" then
        Spring.SetUnitDefIcon(udid, "gok_kadesh.user")
      elseif ud.name == "tll_tyranosaurus" then
        Spring.SetUnitDefIcon(udid, "tll_tyranosaurus.user")
      elseif ud.name == "tll_neobahomet" then
        Spring.SetUnitDefIcon(udid, "tll_neobahomet.user")
      elseif ud.name == "corskrog" then
        Spring.SetUnitDefIcon(udid, "corskrog.user")
      elseif ud.name == "gok_cut1" then
        Spring.SetUnitDefIcon(udid, "gok_cut1.user")
      elseif ud.name == "armmcv1" then
        Spring.SetUnitDefIcon(udid, "armmcv1.user")
      elseif ud.name == "corhflag" then
        Spring.SetUnitDefIcon(udid, "corhflag.user")
      elseif ud.name == "gok_satan" then
        Spring.SetUnitDefIcon(udid, "gok_satan.user")
      elseif ud.name == "talon_repentance" then
        Spring.SetUnitDefIcon(udid, "talon_repentance.user")
      elseif ud.name == "tllsamael" then
        Spring.SetUnitDefIcon(udid, "tllsamael.user")
      elseif (ud.name == "talon_mcv") or (ud.name == "talon_mcv1") then
        Spring.SetUnitDefIcon(udid, "talon_mcv.user")
      elseif ud.name == "talon_grenat" then
        Spring.SetUnitDefIcon(udid, "talon_grenat.user")
      elseif ud.name == "corkrog" then
        Spring.SetUnitDefIcon(udid, "krogoth.user")
      elseif ud.name == "rumad_mongol" then
        Spring.SetUnitDefIcon(udid, "rumad_mongol.user")
      elseif ud.name == "rumad_hellion" then
        Spring.SetUnitDefIcon(udid, "rumad_hellion.user")
      elseif ud.name == "rumad_oasis" then
        Spring.SetUnitDefIcon(udid, "rumad_oasis.user")
      elseif ud.name == "rumad_mcv1" then
        Spring.SetUnitDefIcon(udid, "rumad_mcv1.user")
      elseif ud.name == "rumad_mcv2" then
        Spring.SetUnitDefIcon(udid, "rumad_mcv2.user")
      elseif ud.name == "talon_cerberus" then
        Spring.SetUnitDefIcon(udid, "talon_cerberus.user")

      --Commanders
      elseif (ud.name == "armcom") or (ud.name == "armcom1") or (ud.name == "armcom2") or (ud.name == "armcom3") then
        Spring.SetUnitDefIcon(udid, "armcom.user")
      elseif (ud.name == "corcom") or (ud.name == "corcom1") or (ud.name == "corcom2") or (ud.name == "corcom3") then
        Spring.SetUnitDefIcon(udid, "corcom.user")
      elseif (ud.name == "tllcom") or (ud.name == "tllcom1") or (ud.name == "tllcom2") or (ud.name == "tllcom3") then
        Spring.SetUnitDefIcon(udid, "tllcom.user")
      elseif (ud.name == "talon_com") or (ud.name == "talon_com1") or (ud.name == "talon_com2") or (ud.name == "talon_com3") then
        Spring.SetUnitDefIcon(udid, "talon_com.user")
      elseif (ud.name == "gok_com") or (ud.name == "gok_com1") or (ud.name == "gok_com2") or (ud.name == "gok_com3") then
        Spring.SetUnitDefIcon(udid, "gok_com.user")
      elseif (ud.name == "rumad_king") or (ud.name == "rumad_king1") or (ud.name == "rumad_king2") or (ud.name == "rumad_king3") then
        Spring.SetUnitDefIcon(udid, "rumad_king.user")
      elseif (ud.name == "rumad_com") or (ud.name == "rumad_com1") or (ud.name == "rumad_com2") or (ud.name == "rumad_com3") then
        Spring.SetUnitDefIcon(udid, "rumad_com.user")

      --Medium mech
      elseif (ud.name == "armbanth") or (ud.name == "armgor") or (ud.name == "talon_talos") then
        Spring.SetUnitDefIcon(udid, "small_mech.user")

      --Heavy mech
      elseif (ud.name == "armorco") or (ud.name == "armraptor") or (ud.name == "gok_archon") then
        Spring.SetUnitDefIcon(udid, "med_mech.user")

      elseif ud.name == "talon_annubis" then
        Spring.SetUnitDefIcon(udid, "talon_annubis.user")

      elseif ud.name == "armkrypto" then
        Spring.SetUnitDefIcon(udid, "armkrypto.user")

      elseif ud.name == "talon_mythril" then
        Spring.SetUnitDefIcon(udid, "talon_mythril.user")

      elseif ud.name == "talon_scorpion" then
        Spring.SetUnitDefIcon(udid, "talon_scorpion.user")

      elseif ud.name == "armpraet" then
        Spring.SetUnitDefIcon(udid, "armpraet.user")

      --T5 Destroyers
      elseif (ud.name == "armhope") or (ud.name == "cordust") or (ud.name == "corvaliant") or (ud.name == "tllbarbarus") or (ud.name == "talon_gold") then
        Spring.SetUnitDefIcon(udid, "t5ships.user")

      --T5 Crusers
      elseif (ud.name == "arm_broadside") or (ud.name == "cdevastator") or (ud.name == "tllzeppelin") or (ud.name == "tllzeppelin1") or (ud.name == "gok_apocalypse") or (ud.name == "rumad_jafa") or (ud.name == "rumad_lago") then
        Spring.SetUnitDefIcon(udid, "t5bigships.user")

      --T6 Crusers
      elseif (ud.name == "armarch") or (ud.name == "talon_independence") or (ud.name == "gok_squid") or (ud.name == "core_core") then
        Spring.SetUnitDefIcon(udid, "t6ships.user")

      -- T2 Battleships
      elseif (ud.name == "corbats") or (ud.name == "armbats") or (ud.name == "tllviking") or (ud.name == "talon_imperator") or (ud.name == "gok_bats") then
        Spring.SetUnitDefIcon(udid, "bships.user")

      --T3 Battleships
      elseif (ud.name == "corblackhy") or (ud.name == "cortyrnt") or (ud.name == "aseadragon") or (ud.name == "armtrmph") or (ud.name == "armbc") or (ud.name == "tllcaps") or (ud.name == "talon_dread") or (ud.name == "talon_fcar") or (ud.name == "gok_valefor")  then
        Spring.SetUnitDefIcon(udid, "bsships.user")

      --T4 Battleships
      elseif (ud.name == "talon_paladium") or (ud.name == "corurbanus") or (ud.name == "armcentrum") or (ud.name == "tllpliosaurus") then
        Spring.SetUnitDefIcon(udid, "flagship.user")

      -- Factories
      elseif ud.isFactory then
        Spring.SetUnitDefIcon(udid, "square_x_factory.user")

      -- Builders
      elseif ud.isBuilder then
        if (ud.speed > 0) and ud.canMove then
          Spring.SetUnitDefIcon(udid, "cross.user") -- mobile
        else
          Spring.SetUnitDefIcon(udid, "square_+.user") -- immobile
        end

      -- Nuke / Antinuke ( stockpile weapon anyway )
      elseif ud.stockpileWeaponDef ~= nil then
        Spring.SetUnitDefIcon(udid, "nuke.user")

      -- Aircraft
      elseif ud.canFly then
        Spring.SetUnitDefIcon(udid, "tri-up.user")

      -- Immobile shields
      elseif (ud.speed <= 0) and ud.shieldWeaponDef then
        Spring.SetUnitDefIcon(udid, "hemi-up.user")

      -- Metal extractors and makers
      elseif ((ud.extractsMetal > 0) or (ud.makesMetal > 0)) or (ud.name == "armmakr") or (ud.name == "armfmkr") or (ud.name == "ametalmakerlvl1") or (ud.name == "armamaker") or (ud.name == "armmmkr") or (ud.name == "armuwmmm") or (ud.name == "ametalmakerlvl2") or (ud.name == "ametalmakerlvl3") or (ud.name == "cormakr") or (ud.name == "corfmkr") or (ud.name == "cmetalmakerlvl1") or (ud.name == "coramaker") or (ud.name == "cormmkr") or (ud.name == "coruwmmm") or (ud.name == "cmetalmakerlvl2") or (ud.name == "tllmm") or (ud.name == "tlluwconv") or (ud.name == "tllammaker") or (ud.name == "tllwmmohoconv") then
        Spring.SetUnitDefIcon(udid, "m.user")

      -- Energy generators
      elseif (ud.totalEnergyOut > 10) and (ud.speed <= 0) then
        Spring.SetUnitDefIcon(udid, "e.user")

      -- Transports
      elseif ud.isTransport then
        Spring.SetUnitDefIcon(udid, "diamond.user")

      -- Submarines
      elseif (ud.minWaterDepth > 0) and (ud.speed > 0) and (ud.waterline > 10) then
        Spring.SetUnitDefIcon(udid, "tri-down.user")

      -- Ships
      elseif (ud.minWaterDepth > 0) and (ud.speed > 0) then
        Spring.SetUnitDefIcon(udid, "hemi-down.user")

      -- Sensors
      elseif ((ud.radarRadius > 1) or (ud.sonarRadius > 1) or (ud.seismicRadius > 1)) and (ud.speed <= 0) and (#ud.weapons <= 0) then
        Spring.SetUnitDefIcon(udid, "hourglass-side.user")

      -- Jammers
      elseif ((ud.jammerRadius > 1) or (ud.sonarJamRadius > 1)) and (ud.speed <= 0) then
        Spring.SetUnitDefIcon(udid, "hourglass.user")

      --Dragon teeth
      elseif (ud.name == "cordrag") or (ud.name == "corfdrag") or (ud.name == "corfort") or (ud.name == "coredrag")
      or (ud.name == "armdrag") or (ud.name == "armfdrag") or (ud.name == "armfort") or (ud.name == "armedrag")
      or (ud.name == "gok_drag") or (ud.name == "gok_fdrag") or (ud.name == "gok_fort") or (ud.name == "talon_edrag")
      or (ud.name == "talon_drag") or (ud.name == "talon_fdrag") or (ud.name == "talon_fort") or (ud.name == "gok_edrag")
      or (ud.name == "rumad_drag") or (ud.name == "rumad_fdrag") or (ud.name == "rumad_fort") or (ud.name == "rumad_edrag")
      or (ud.name == "tlldtns") or (ud.name == "tlladt") or (ud.name == "tlldt") or (ud.name == "tlledrag") then
        Spring.SetUnitDefIcon(udid, "blank.user")

      -- Defenders and other buildings
      elseif ud.isBuilding or (ud.speed <= 0) then
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
