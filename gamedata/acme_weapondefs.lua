-- all tags that are not specific to a weapon type

toSetTagsW = {
    -- we set these tags for all weapons
    camerashake = false,
    soundtrigger = nil,

    tolerance = 32000,
    firetolerance = 32000,    
}

toDefaultTagsW = {
    -- tags that we don't worry about
    cegtag = 1,
    mygravity = 1,
    impactonly = 1,
    noexplode = 1,
    interceptedbyshieldtype = 1,
    avoidground = 1,
    avoidfriendly = 1,
    avoidneutral = 1,
    collideenemy = 1,
    collidefriendly = 1,
    collidefeature = 1,
    collideneutral = 1,
    collideground = 1,
    collisionsize = 1,
    commandfire = 1,
    canattackground = 1,
    targetborder = 1,
    cylindertargeting = 1,
    allownonblockingaim = 1,
    targetmoveerror = 1,
    leadlimit = 1,
    leadbonus = 1,
    predictboost = 1,
    heightmod = 1,
    proximitypriority = 1,
    accuracy = 1,
    movingaccuracy = 1,
    ownerexpaccweight = 1,
    targetable = 1,
    interceptor = 1,
    interceptsolo = 1,
    coverage = 1,
    bounceslip = 1,
    craterareaofeffect = 1,
    explosionspeed = 1,
    cratermult = 1,
    craterboost = 1,
    dyndamageexp = 1,
    dyndamagemin = 1,
    dyndamagerange = 1,
    dyndamageinverted = 1,
    explosionscar = 1,
    alwaysvisible = 1,
    texture1 = 1,
    texture2 = 1,
    texture3 = 1,
    texture4 = 1,

    turret = 1,
    waterweapon = 1,
    firesubmersed = 1,
}

toChooseTagsW = {
    -- we modify these tags

    range = "floatif",
    reloadtime = "floatif",

    weaponvelocity = "floatif",
    
    burnblow = "bool",
    firestarter = "bool",

    --stockpile = "bool",
    --stockpiletime = "float",
    metalpershot = "floatif",
    energypershot = "floatif",    

    --paralyzer = "bool",
    --paralyzetime = "floatif",

    waterbounce = "bool",
    groundbounce = "bool",
    bouncerebound = "proportion",
    numbounce = "natural",

    areaofeffect = "floatif",
    edgeeffectiveness = "proportion",
    impulsefactor = "floatif",
    impulseboost = "floatif",
    
    burst = "natural",
    burstrate = "floatif",
    projectiles = "natural",
    sprayangle = "floatif",   
    
    intensity = "floatif",    
} 

toChooseSoundsW = {
    -- we modify these tags with sounds
    soundstart = 1,
    soundhitdry = 1,
    soundhitwet = 1,
}

toChooseCEGsW = {
    -- we modify these tags with cegs
    explosiongenerator = 1,
    bounceexplosiongenerator = 1,
}

toChooseSpecialW = {
    -- we set these tags specially
    name = true,
 
    model = 1, 

    rgbcolor = 1,

    damage = "subtable",
    shield = "subtable",
}

