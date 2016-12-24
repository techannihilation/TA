-- all tags that are not specific to a weapon type

toSetTagsU = {
    -- we set these tags for all weapons
}

toDefaultTagsU = {
    -- we leave these alone
    name = 1,
    description = 1,
    buildpic = 1,
    objectname = 1,
    script = 1,
    
    mass = 1,
    repairable = 1,
    capturable = 1,
    reclaimable = 1,
    maxrepairspeed = 1,
    
    icontype = 1,
    corpse = 1,
    
    harveststorage = 1,
    extractsmetal = 1,
    makesmetal = 1,
    
    onoffable = 1,
    activatewhenbuilt = 1,
    
    losemitheight = 1,
    radaremitheight = 1,
    stealth = 1,
    sonarstealth = 1,
    seismicdistance = 1,
    seismicsignature = 1,
    
    initcloaked = 1,
    decloakspherical = 1,
    decloakonfire = 1,
    cloaktimeout = 1,
    
    canmove = 1,
    canattack = 1,
    canpatrol = 1,
    canguard = 1,
    canrepeat = 1,
    canselfdestruct = 1,
    movestate = 1,
    firestate = 1,
    noautofire = 1,
    canmanualfire = 1,
    canrestore = 1,
    canrepair = 1,
    canreclaim = 1,
    canressurect = 1,
    
    builder = 1,
    buildrange3d = 1,
    canassist = 1,
    canbeassisted = 1,
    canselfrepair = 1,
    shownanospray = 1,
    nanocolor = 1,
    fullhealthfactory = 1,
    isairbase = 1,
    footprintx = 1,
    footprintz = 1,
    yardmap = 1,
    levelground = 1,
    movementclass = 1,
    canhover = 1,
    floater = 1,
    upright = 1,
    
    minwaterdepth = 1,
    maxwaterdepth = 1,
    waterline = 1,
    mincollisionspeed = 1,
    pushresistant = 1,
    mygravity = 1,
    turninplace = 1,
    turninplacespeedlimit = 1,
    turninplaceanglelimit = 1,
    blocking = 1,
    crushresistance = 1,
    
    -- everything about flanking
    -- everything about aircraft
    -- everything about flares
    -- everything about transports
    -- everything about categories
    -- everything about decals
    -- everything about colvols
    
    kamikaze = 1,
    kamikazeidstance = 1,
    kamikazeuselos = 1,
    strafetoattack = 1,
   
    decoyfor = 1,
    selfdestructcountdown = 1,
    
    istargetingupgrade = 1,
    isfeature = 1,
    hidedamage = 1,
    showplayername = 1,
    shownanoframe = 1,
    unitrestricted = 1,
    power = 1,
    
    -- all the rest
}

toChooseTagsU = {
    -- we modify these tags
    maxdamage = "float",
    
    autoheal = "floatif",
    idleautohoeal = "floatif",
    idletime = "floatif",
    
    buildcostmetal = "float",
    buildcostenergy = "float",
    buildtime = "float",
    
    metalstorage = "floatif",
    energystorage = "floatif",
    
    windgenerator = "floatif",
    tidalgenerator = "floatif",
    
    metaluse = "floatif",
    energyuse = "floatif",
    metalmake = "floatif",
    energymake = "floatif",
    
    sightdistance = "floatif",
    airsightdistance = "floatif",
    radardistance = "floatif",
    sonardistance = "floatif",
    radardistancejam = "floatif",
    sonardistancejam = "floatif",
    
    builddistance = "floatif",
    workertime = "floatif",
    repairspeed = "floatif",
    reclaimspeed = "floatif",
    resurrectspeed = "floatif",
    terraformspeed = "floatif",

    maxslope = "floatif",
    maxvelocity = "floatif",
    maxreversevelocity = "floatif",
    acceleration = "floatif",
    brakerate = "floatif",
    turnrate = "floatif",
    
    damagemodifier = "proportion",
    
} 

toChooseSoundsU = {
    -- we modify these tags with sounds

}

toChooseExplosionsU = {
    -- we modify these tags with cegs
    explodeas = 1,
    selfdestructas = 1,
}

toChooseSpecialU = {
    -- we set these tags specially
    cancloak = "bool",
    cloakcost = "float",
    cloakcostmoving = "float",
    mincloackdistance = "float",
    
    cancapture = "bool",
    capturespeed = "floatif",

    hightrajectory = "bool",    
}
