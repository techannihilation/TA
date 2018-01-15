local moveDatas = {
    AKBOT2 = {
        crushstrength = 50,
        depthmod = 0,
        footprintx = 2,
        footprintz = 2,
        maxslope = 36,
        maxwaterdepth = 5000,
        maxwaterslope = 50,
        allowRawMovement = true
    },
    ATANK3 = {
        crushstrength = 30,
        depthmod = 0,
        footprintx = 3,
        footprintz = 3,
        maxslope = 36,
        maxwaterdepth = 5000,
        maxwaterslope = 80,
        allowRawMovement = true
    },
    BOAT4 = {
        crushstrength = 40,
        footprintx = 4,
        footprintz = 4,
        minwaterdepth = 5,
        allowRawMovement = true
    },
    BOAT5 = {
        crushstrength = 50,
        footprintx = 5,
        footprintz = 5,
        minwaterdepth = 8,
        allowRawMovement = true
    },
    DBOAT6 = {
        crushstrength = 70,
        footprintx = 6,
        footprintz = 6,
        minwaterdepth = 15,
        allowRawMovement = true
    },
    HAKBOT4 = {
        --shiva
        crushstrength = 253,
        depthmod = 0,
        footprintx = 4,
        footprintz = 4,
        maxslope = 36,
        maxwaterdepth = 5000,
        maxwaterslope = 80,
        allowRawMovement = true
    },
    HDBOAT8 = {
        crushstrength = 1400,
        footprintx = 8,
        footprintz = 8,
        minwaterdepth = 15,
        allowRawMovement = true
    },
    HOVER3 = {
        badslope = 22,
        badwaterslope = 255,
        crushstrength = 25,
        footprintx = 3,
        footprintz = 3,
        maxslope = 22,
        maxwaterslope = 255,
        allowRawMovement = true
    },
    HOVER4 = {
        -- 2 units arm/corthovr
        badslope = 22,
        badwaterslope = 255,
        crushstrength = 25,
        footprintx = 4,
        footprintz = 4,
        maxslope = 22,
        maxwaterslope = 255,
        allowRawMovement = true
    },
    HTANK3 = {
        crushstrength = 253,
        footprintx = 3,
        footprintz = 3,
        maxslope = 18,
        maxwaterdepth = 22,
        allowRawMovement = true
    },
    HTANK4 = {
        crushstrength = 253,
        footprintx = 4,
        footprintz = 4,
        maxslope = 18,
        maxwaterdepth = 22,
        allowRawMovement = true
    },
    VHTANK5 = {
        crushstrength = 1400,
        footprintx = 5,
        footprintz = 5,
        maxslope = 18,
        maxwaterdepth = 22,
        allowRawMovement = true
    },
    HKBOT3 = {
        crushstrength = 253,
        footprintx = 3,
        footprintz = 3,
        maxslope = 36,
        maxwaterdepth = 22,
        allowRawMovement = true
    },
    HKBOT4 = {
        crushstrength = 253,
        footprintx = 4,
        footprintz = 4,
        maxslope = 36,
        maxwaterdepth = 22,
        allowRawMovement = true
    },
    HKBOT7 = {
        crushstrength = 12400,
        depthmod = 0,
        footprintx = 7,
        footprintz = 7,
        maxslope = 36,
        maxwaterdepth = 30,
        depthModParams = {
            minHeight = 4,
            linearCoeff = 0.03,
            maxValue = 0.7
        }
    },
    HTKBOT3 = {
        crushstrength = 253,
        footprintx = 3,
        footprintz = 3,
        maxslope = 80,
        maxwaterdepth = 22,
        allowRawMovement = true
    },
    HTKBOT4 = {
        crushstrength = 253,
        footprintx = 4,
        footprintz = 4,
        maxslope = 80,
        maxwaterdepth = 22,
        allowRawMovement = true
    },
    HTKBOT7 = {
        crushstrength = 12400,
        footprintx = 7,
        footprintz = 7,
        maxslope = 80,
        maxwaterdepth = 22,
        allowRawMovement = true
    },
    KBOT1 = {
        crushstrength = 5,
        footprintx = 1,
        footprintz = 1,
        maxslope = 36,
        maxwaterdepth = 5,
        allowRawMovement = true
    },
    KBOT2 = {
        crushstrength = 10,
        footprintx = 2,
        footprintz = 2,
        maxslope = 36,
        maxwaterdepth = 22,
        allowRawMovement = true
    },
    KBOT3 = {
        crushstrength = 30,
        footprintx = 3,
        footprintz = 3,
        maxslope = 36,
        maxwaterdepth = 21,
        allowRawMovement = true
    },
    TANK2 = {
        crushstrength = 15,
        footprintx = 2,
        footprintz = 2,
        maxslope = 18,
        maxwaterdepth = 22,
        allowRawMovement = true
    },
    TANK3 = {
        crushstrength = 30,
        footprintx = 3,
        footprintz = 3,
        maxslope = 18,
        maxwaterdepth = 22,
        allowRawMovement = true
    },
    TANK4 = {
        crushstrength = 30,
        footprintx = 4,
        footprintz = 4,
        maxslope = 18,
        maxwaterdepth = 22,
        allowRawMovement = true
    },
    TKBOT3 = {
        crushstrength = 15,
        footprintx = 3,
        footprintz = 3,
        maxwaterdepth = 22,
        allowRawMovement = true
    },
    VKBOT4 = {
        crushstrength = 1400,
        depthmod = 0,
        footprintx = 4,
        footprintz = 4,
        maxslope = 24,
        maxwaterdepth = 5000,
        maxwaterslope = 30,
        allowRawMovement = true
    },
    VKBOT5 = {
        crushstrength = 1400,
        depthmod = 0,
        footprintx = 5,
        footprintz = 5,
        maxslope = 24,
        maxwaterdepth = 5000,
        maxwaterslope = 30,
        allowRawMovement = true
    },
    VKBOT9 = {
        crushstrength = 12400,
        depthmod = 0,
        footprintx = 9,
        footprintz = 9,
        maxslope = 24,
        maxwaterdepth = 15000,
        maxwaterslope = 30,
        allowRawMovement = true
    },
    UBOAT3 = {
        footprintx = 3,
        footprintz = 3,
        minwaterdepth = 35,
        crushstrength = 5,
        subMarine = 1,
        allowRawMovement = true
    },
    UBOAT5 = {
        footprintx = 5,
        footprintz = 5,
        minwaterdepth = 60,
        crushstrength = 5,
        subMarine = 1,
        allowRawMovement = true
    },
    TANKHOVER3 = {
        crushstrength = 90,
        depthmod = 0,
        footprintx = 3,
        footprintz = 3,
        maxslope = 29,
        badslope = 20,
        maxwaterslope = 255,
        badwaterslope = 255,
        allowRawMovement = true
    },
    TANKHOVER4 = {
        crushstrength = 90,
        depthmod = 0,
        footprintx = 4,
        footprintz = 4,
        maxslope = 29,
        badslope = 20,
        maxwaterslope = 255,
        badwaterslope = 255,
        allowRawMovement = true
    },
    AMPHKBOT = {
        crushstrength = 250,
        footprintx = 3,
        footprintz = 3,
        maxslope = 80,
        maxwaterdepth = 180,
        allowRawMovement = true
    },
    AMPTBOT = {
        crushstrength = 250,
        depthmodparams = {
            minheight = 1,
            linearcoeff = 0.03,
            maxscale = 0.75,
            constantcoeff = 0.015
        },
        footprintx = 3,
        footprintz = 3,
        maxslope = 80,
        maxwaterdepth = 15000
    }
}

--------------------------------------------------------------------------------
-- Final processing / array format
--------------------------------------------------------------------------------
local defs = {}

for moveName, moveData in pairs(moveDatas) do
    moveData.heatmapping =
        (Spring.GetModOptions() and tonumber(Spring.GetModOptions().mo_heatmap) and
        (tonumber(Spring.GetModOptions().mo_heatmap) ~= 0) or
        1)
    moveData.name = moveName
    defs[#defs + 1] = moveData
end

return defs
