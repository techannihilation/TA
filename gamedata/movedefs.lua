local moveDatas = {
  AKBOT1 = {
      crushstrength = 25,
      depthmod = 0,
      footprintx = 1,
      footprintz = 1,
      maxslope = 36,
      maxwaterdepth = 5000,
      maxwaterslope = 50
  },
    AKBOT2 = {
        crushstrength = 50,
        depthmod = 0,
        footprintx = 2,
        footprintz = 2,
        maxslope = 36,
        maxwaterdepth = 5000,
        maxwaterslope = 50
    },
    ATANK3 = {
        crushstrength = 50,
        depthmod = 0,
        footprintx = 3,
        footprintz = 3,
        maxslope = 36,
        maxwaterdepth = 5000,
        maxwaterslope = 80
    },
    ATANK4 = {
        -- Tigre & Rex Amphibious
        crushstrength = 250,
        depthmod = 0,
        footprintx = 4,
        footprintz = 4,
        maxslope = 36,
        maxwaterdepth = 5000,
        maxwaterslope = 80
    },
    ATANK8 = {
        crushstrength = 250,
        depthmod = 0,
        footprintx = 8,
        footprintz = 8,
        maxslope = 36,
        maxwaterdepth = 5000,
        maxwaterslope = 80
    },
    ATANK14 = {
        crushstrength = 10000,
        depthmod = 0,
        footprintx = 14,
        footprintz = 16,
        maxslope = 36,
        maxwaterdepth = 5000,
        maxwaterslope = 80
    },
    ATANK20 = {
        crushstrength = 10000,
        depthmod = 0,
        footprintx = 20,
        footprintz = 20,
        maxslope = 36,
        maxwaterdepth = 5000,
        maxwaterslope = 80
    },
    BOAT4 = {
        allowterraincollisions = false,
        crushstrength = 50,
        footprintx = 4,
        footprintz = 4,
        minwaterdepth = 5
    },
    BOAT5 = {
        allowterraincollisions = false,
        crushstrength = 50,
        footprintx = 5,
        footprintz = 5,
        minwaterdepth = 8
    },
    DBOAT6 = {
        allowterraincollisions = false,
        crushstrength = 50,
        footprintx = 6,
        footprintz = 6,
        minwaterdepth = 15
    },
    HAKBOT4 = {
        allowterraincollisions = false,
        crushstrength = 250,
        depthmod = 0,
        footprintx = 4,
        footprintz = 4,
        maxslope = 36,
        maxwaterdepth = 5000,
        maxwaterslope = 80
    },
    HDBOAT8 = {
        allowterraincollisions = false,
        crushstrength = 250,
        footprintx = 8,
        footprintz = 8,
        minwaterdepth = 15
    },
    HDBOAT10 = {
        allowterraincollisions = false,
        crushstrength = 250,
        footprintx = 10,
        footprintz = 10,
        minwaterdepth = 16
    },
    HDBOAT12 = {
        allowterraincollisions = false,
        crushstrength = 250,
        footprintx = 12,
        footprintz = 12,
        minwaterdepth = 18
    },
    HOVER1 = {
        badslope = 22,
        badwaterslope = 255,
        crushstrength = 50,
        footprintx = 1,
        footprintz = 1,
        maxslope = 22,
        maxwaterslope = 255
    },
    HOVER2 = {
        badslope = 22,
        badwaterslope = 255,
        crushstrength = 50,
        footprintx = 2,
        footprintz = 2,
        maxslope = 22,
        maxwaterslope = 255
    },
    HOVER3 = {
        badslope = 22,
        badwaterslope = 255,
        crushstrength = 50,
        footprintx = 3,
        footprintz = 3,
        maxslope = 22,
        maxwaterslope = 255
    },
    HOVER4 = {
        allowterraincollisions = false,
        badslope = 22,
        badwaterslope = 255,
        crushstrength = 50,
        footprintx = 4,
        footprintz = 4,
        maxslope = 22,
        maxwaterslope = 255
    },
    HTANK3 = {
        crushstrength = 250,
        footprintx = 3,
        footprintz = 3,
        maxslope = 18,
        maxwaterdepth = 22
    },
    HTANK4 = {
        allowterraincollisions = false,
        crushstrength = 250,
        footprintx = 4,
        footprintz = 4,
        maxslope = 18,
        maxwaterdepth = 22
    },
    HTANK5 = {
        allowterraincollisions = false,
        crushstrength = 250,
        footprintx = 5,
        footprintz = 5,
        maxslope = 18,
        maxwaterdepth = 22
    },
    HTANK6 = {
        allowterraincollisions = false,
        crushstrength = 250,
        footprintx = 6,
        footprintz = 6,
        maxslope = 18,
        maxwaterdepth = 22
    },
    HTANK6CRUSH = {
        allowterraincollisions = false,
        crushstrength = 1000,
        footprintx = 6,
        footprintz = 6,
        maxslope = 18,
        maxwaterdepth = 22
    },
    HTANK8 = {
        allowterraincollisions = false,
        crushstrength = 1000,
        footprintx = 8,
        footprintz = 8,
        maxslope = 18,
        maxwaterdepth = 22
    },
    HTANK10 = {
        allowterraincollisions = false,
        crushstrength = 1000,
        footprintx = 10,
        footprintz = 10,
        maxslope = 18,
        maxwaterdepth = 22
    },
    HTANK12 = {
        allowterraincollisions = false,
        crushstrength = 10000,
        footprintx = 12,
        footprintz = 12,
        maxslope = 18,
        maxwaterdepth = 22
    },
    HTANK15 = {
        allowterraincollisions = false,
        crushstrength = 10000,
        footprintx = 15,
        footprintz = 15,
        maxslope = 18,
        maxwaterdepth = 30
    },
    HKBOT3 = {
        crushstrength = 250,
        footprintx = 3,
        footprintz = 3,
        maxslope = 36,
        maxwaterdepth = 22
    },
    HKBOT4 = {
        allowterraincollisions = false,
        crushstrength = 250,
        footprintx = 4,
        footprintz = 4,
        maxslope = 36,
        maxwaterdepth = 22
    },
    HKBOT5 = {
        allowterraincollisions = false,
        crushstrength = 250,
        footprintx = 5,
        footprintz = 5,
        maxslope = 36,
        maxwaterdepth = 22
    },
    HKBOT6 = {
        allowterraincollisions = false,
        crushstrength = 250,
        footprintx = 6,
        footprintz = 6,
        maxslope = 36,
        maxwaterdepth = 22
    },
    HKBOT7 = {
        allowterraincollisions = false,
        crushstrength = 1000,
        depthmod = 0,
        footprintx = 7,
        footprintz = 7,
        maxslope = 36,
        maxwaterdepth = 30
    },
    HKBOT8 = {
        allowterraincollisions = false,
        crushstrength = 1000,
        depthmod = 0,
        footprintx = 8,
        footprintz = 8,
        maxslope = 38,
        maxwaterdepth = 32
    },
    HTKBOT2 = {
        crushstrength = 50,
        depthmod = 0,
        footprintx = 2,
        footprintz = 2,
        maxslope = 80,
        maxwaterdepth = 5000,
        maxwaterslope = 50
    },
    HTKBOT3 = {
        crushstrength = 250,
        footprintx = 3,
        footprintz = 3,
        maxslope = 80,
        maxwaterdepth = 22
    },
    HTKBOT4 = {
        allowterraincollisions = false,
        crushstrength = 250,
        footprintx = 4,
        footprintz = 4,
        maxslope = 80,
        maxwaterdepth = 22
    },
    HTKBOT5 = {
        allowterraincollisions = false,
        crushstrength = 250,
        footprintx = 5,
        footprintz = 5,
        maxslope = 80,
        maxwaterdepth = 22
    },
    HTKBOT6 = {
        allowterraincollisions = false,
        crushstrength = 250,
        footprintx = 6,
        footprintz = 6,
        maxslope = 80,
        maxwaterdepth = 28
    },
    HTKBOT7 = {
        allowterraincollisions = false,
        crushstrength = 1000,
        footprintx = 7,
        footprintz = 7,
        maxslope = 80,
        maxwaterdepth = 22
    },
    HTKBOT9 = {
        allowterraincollisions = false,
        crushstrength = 1000,
        footprintx = 9,
        footprintz = 9,
        maxslope = 80,
        maxwaterdepth = 22
    },
    KBOT1 = {
        crushstrength = 50,
        footprintx = 1,
        footprintz = 1,
        maxslope = 36,
        maxwaterdepth = 5
    },
    KBOT2 = {
        crushstrength = 50,
        footprintx = 2,
        footprintz = 2,
        maxslope = 36,
        maxwaterdepth = 22
    },
    KBOT3 = {
        crushstrength = 50,
        footprintx = 3,
        footprintz = 3,
        maxslope = 36,
        maxwaterdepth = 21
    },
    KBOT4 = {
        crushstrength = 50,
        footprintx = 4,
        footprintz = 4,
        maxslope = 36,
        maxwaterdepth = 21
    },
    KBOT5 = {
        crushstrength = 50,
        footprintx = 5,
        footprintz = 5,
        maxslope = 36,
        maxwaterdepth = 21
    },
    TANK2 = {
        crushstrength = 50,
        footprintx = 2,
        footprintz = 2,
        maxslope = 18,
        maxwaterdepth = 22
    },
    TANK3 = {
        crushstrength = 50,
        footprintx = 3,
        footprintz = 3,
        maxslope = 18,
        maxwaterdepth = 22
    },
    TANK4 = {
        allowterraincollisions = false,
        crushstrength = 50,
        footprintx = 4,
        footprintz = 4,
        maxslope = 18,
        maxwaterdepth = 22
    },
    TANK5 = {
        allowterraincollisions = false,
        crushstrength = 50,
        footprintx = 5,
        footprintz = 5,
        maxslope = 18,
        maxwaterdepth = 22
    },
    TANK6 = {
        allowterraincollisions = false,
        crushstrength = 250,
        footprintx = 6,
        footprintz = 6,
        maxslope = 18,
        maxwaterdepth = 36,
    },
    TANK8 = {
        allowterraincollisions = false,
        crushstrength = 250,
        footprintx = 8,
        footprintz = 8,
        maxslope = 18,
        maxwaterdepth = 36,
    },
    TKBOT2 = {
        crushstrength = 50,
        footprintx = 2,
        footprintz = 2,
        maxwaterdepth = 22
    },
    TKBOT3 = {
        crushstrength = 50,
        footprintx = 3,
        footprintz = 3,
        maxwaterdepth = 22
    },
    TKBOT4 = {
        allowterraincollisions = false,
        crushstrength = 50,
        footprintx = 4,
        footprintz = 4,
        maxwaterdepth = 22
    },
    TKBOT6 = {
        allowterraincollisions = false,
        crushstrength = 1000,
        footprintx = 6,
        footprintz = 6,
        maxwaterdepth = 36,
    },
    TKBOT8 = {
        -- Core Adamantoise. Kill T3 fortification.
        allowterraincollisions = false,
        crushstrength = 7500,
        footprintx = 8,
        footprintz = 8,
        maxwaterdepth = 36,
    },
    VKBOT4 = {
        allowterraincollisions = false,
        crushstrength = 250,
        depthmod = 0,
        footprintx = 4,
        footprintz = 4,
        maxslope = 24,
        maxwaterdepth = 5000,
        maxwaterslope = 30
    },
    VKBOT5 = {
        allowterraincollisions = false,
        crushstrength = 250,
        depthmod = 0,
        footprintx = 5,
        footprintz = 5,
        maxslope = 24,
        maxwaterdepth = 5000,
        maxwaterslope = 30
    },
    VKBOT6 = {
        allowterraincollisions = false,
        crushstrength = 250,
        depthmod = 0,
        footprintx = 6,
        footprintz = 6,
        maxslope = 24,
        maxwaterdepth = 5000,
        maxwaterslope = 30
    },
    VKBOT8 = {
        allowterraincollisions = false,
        crushstrength = 1000,
        depthmod = 0,
        footprintx = 8,
        footprintz = 8,
        maxslope = 24,
        maxwaterdepth = 15000,
        maxwaterslope = 30
    },
    VKBOT9 = {
        allowterraincollisions = false,
        crushstrength = 1000,
        depthmod = 0,
        footprintx = 9,
        footprintz = 9,
        maxslope = 24,
        maxwaterdepth = 15000,
        maxwaterslope = 30
    },
    VKBOT12 = {
        allowterraincollisions = false,
        crushstrength = 10000,
        depthmod = 0,
        footprintx = 12,
        footprintz = 12,
        maxslope = 24,
        maxwaterdepth = 15000,
        maxwaterslope = 30
    },
    VKBOT20 = {
        allowterraincollisions = false,
        crushstrength = 10000,
        depthmod = 0,
        footprintx = 20,
        footprintz = 20,
        maxslope = 24,
        maxwaterdepth = 15000,
        maxwaterslope = 30
    },
    VKBOT25 = {
        allowterraincollisions = false,
        crushstrength = 10000,
        depthmod = 0,
        footprintx = 25,
        footprintz = 25,
        maxslope = 24,
        maxwaterdepth = 15000,
        maxwaterslope = 30
    },
    VKBOT28 = {
        allowterraincollisions = false,
        crushstrength = 50000,
        depthmod = 0,
        footprintx = 28,
        footprintz = 28,
        maxslope = 36,
        maxwaterdepth = 15000,
        maxwaterslope = 30
    },
    UBOAT2 = {
        footprintx = 2,
        footprintz = 2,
        minwaterdepth = 25,
        crushstrength = 50,
        subMarine = 1
    },
    UBOAT3 = {
        footprintx = 3,
        footprintz = 3,
        minwaterdepth = 35,
        crushstrength = 50,
        subMarine = 1
    },
    UBOAT5 = {
        allowterraincollisions = false,
        footprintx = 5,
        footprintz = 5,
        minwaterdepth = 60,
        crushstrength = 50,
        subMarine = 1
    },
    UBOAT8 = {
        allowterraincollisions = false,
        footprintx = 8,
        footprintz = 8,
        minwaterdepth = 70,
        crushstrength = 100,
        subMarine = 1
    },
    TANKHOVER3 = {
        crushstrength = 50,
        depthmod = 0,
        footprintx = 3,
        footprintz = 3,
        maxslope = 29,
        badslope = 20,
        maxwaterslope = 255,
        badwaterslope = 255
    },
    TANKHOVER4 = {
        allowterraincollisions = false,
        crushstrength = 50,
        depthmod = 0,
        footprintx = 4,
        footprintz = 4,
        maxslope = 29,
        badslope = 20,
        maxwaterslope = 255,
        badwaterslope = 255
    },
    TANKHOVER8 = {
        allowterraincollisions = false,
        crushstrength = 1000,
        depthmod = 0,
        footprintx = 8,
        footprintz = 8,
        maxslope = 29,
        badslope = 20,
        maxwaterslope = 255,
        badwaterslope = 255
    },
    TANKHOVER12 = {
        allowterraincollisions = false,
        crushstrength = 1000,
        depthmod = 0,
        footprintx = 12,
        footprintz = 12,
        maxslope = 29,
        badslope = 20,
        maxwaterslope = 255,
        badwaterslope = 255
    },
    AMPHKBOT = {
        crushstrength = 250,
        footprintx = 3,
        footprintz = 3,
        maxslope = 80,
        maxwaterdepth = 180
    },
    AMPTBOT = {
        crushstrength = 250,
        footprintx = 3,
        footprintz = 3,
        maxslope = 80,
        maxwaterdepth = 15000
    },
    AMPTBOT4 = {
        crushstrength = 250,
        footprintx = 4,
        footprintz = 4,
        maxslope = 80,
        maxwaterdepth = 15000
    },
    AMPTBOT5 = {
        crushstrength = 250,
        footprintx = 5,
        footprintz = 5,
        maxslope = 80,
        maxwaterdepth = 15000
    },
    AMPTBOT8 = {
        crushstrength = 1000,
        footprintx = 5,
        footprintz = 5,
        maxslope = 80,
        maxwaterdepth = 15000
    },
}

--------------------------------------------------------------------------------
-- Final processing / array format
--------------------------------------------------------------------------------
local defs = {}

for moveName, moveData in pairs(moveDatas) do
    moveData.heatmapping = true
    moveData.name = moveName
    moveData.allowRawMovement = true
    moveData.allowTerrainCollisions = false
    defs[#defs + 1] = moveData
end

return defs
