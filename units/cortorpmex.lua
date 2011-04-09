-- UNITDEF -- CORTORPMEX --
--------------------------------------------------------------------------------

local unitName = "cortorpmex"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 6542,
  buildCostEnergy    = 11650,
  buildCostMetal     = 1821,
  builder            = false,
  buildTime          = 28415,
  canAttack          = true,
  canstop            = 1,
  category           = [[ALL NOTLAND NOTSUB NOWEAPON NOTSHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[armtorpmex_dead]],
  description        = [[Extracts Metal]],
  designation        = [[CP-CTM]],
  downloadable       = 1,
  energyStorage      = 0,
  energyUse          = 20,
  explodeAs          = [[SMALL_BUILDINGEX]],
  extractsMetal      = 0.0060,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Extracteur de métal sous-marin armé]],
  frenchname         = [[Extracteur sous-marin lance-torpilles]],
  germandescription  = [[erzeugt Metall]],
  germanname         = [[Metalextraktor mit Torpedowerfer]],
  maxDamage          = 3152,
  maxSlope           = 18,
  metalStorage       = 0,
  minWaterDepth      = 20,
  name               = [[Torpedo Metal Extractor]],
  noAutoFire         = false,
  objectName         = [[cortorpmex]],
  onoffable          = true,
  radarDistance      = 0,
  selfDestructAs     = [[SMALL_BUILDING]],
  side               = [[CORE]],
  sightDistance      = 120,
  TEDClass           = [[METAL]],
  threed             = 1,
  unitname           = [[cortorpmex]],
  unitnumber         = 3205,
  version            = 1.2,
  workerTime         = 0,
  yardMap            = [[ooooooooo]],
  zbuffer            = 1,
  sounds = {
    activate           = [[waterex2]],
    canceldestruct     = [[cancel2]],
    deactivate         = [[waterex2]],
    underattack        = [[warning1]],
    working            = [[waterex2]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    select = {
      [[waterex2]],
    },
  },
  weapons = {
    [1]  = {
      def                = [[COAX_TORPEDO]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  COAX_TORPEDO = {
    areaOfEffect       = 16,
    avoidFriendly      = false,
    burnblow           = true,
    collideFriendly    = false,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:FLASH2]],
    guidance           = true,
    impactonly         = 1,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lineOfSight        = true,
    model              = [[torpedo]],
    name               = [[Level1TorpedoLauncher]],
    noSelfDamage       = true,
    propeller          = 1,
    range              = 600,
    reloadtime         = 1.9,
    renderType         = 1,
    selfprop           = true,
    soundHit           = [[xplodep2]],
    soundStart         = [[torpedo1]],
    startVelocity      = 200,
    tracks             = true,
    turnRate           = 2500,
    turret             = true,
    waterWeapon        = true,
    weaponAcceleration = 40,
    weaponTimer        = 3,
    weaponType         = [[TorpedoLauncher]],
    weaponVelocity     = 320,
    damage = {
      commanders         = 260,
      default            = 280,
      krogoth            = 260,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
