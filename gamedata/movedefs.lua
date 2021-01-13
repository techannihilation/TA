local moveDatas = {
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
        allowrawmovement = true,
		crushstrength = 30,
        depthmod = 0,
        footprintx = 3,
        footprintz = 3,
        maxslope = 36,
        maxwaterdepth = 5000,
        maxwaterslope = 80
    },
    BOAT4 = {
        allowrawmovement = true,
        allowterraincollisions = false,
        crushstrength = 40,
        footprintx = 4,
        footprintz = 4,
        minwaterdepth = 5
    },
    BOAT5 = {
        allowrawmovement = true,
        allowterraincollisions = false,
        crushstrength = 50,
        footprintx = 5,
        footprintz = 5,
        minwaterdepth = 8
    },
    DBOAT6 = {
        allowrawmovement = true,
        allowterraincollisions = false,
        crushstrength = 70,
        footprintx = 6,
        footprintz = 6,
        minwaterdepth = 15
    },
    HAKBOT4 = {
        allowrawmovement = true,
        allowterraincollisions = false,
        crushstrength = 253,
        depthmod = 0,
        footprintx = 4,
        footprintz = 4,
        maxslope = 36,
        maxwaterdepth = 5000,
        maxwaterslope = 80
    },
    HDBOAT8 = {
        allowrawmovement = true,
        allowterraincollisions = false,
        crushstrength = 1400,
        footprintx = 8,
        footprintz = 8,
        minwaterdepth = 15
    },
    HOVER3 = {
        allowrawmovement = true,
		badslope = 22,
        badwaterslope = 255,
        crushstrength = 25,
        footprintx = 3,
        footprintz = 3,
        maxslope = 22,
        maxwaterslope = 255
    },
    HOVER4 = {
        allowrawmovement = true,
        allowterraincollisions = false,
        badslope = 22,
        badwaterslope = 255,
        crushstrength = 25,
        footprintx = 4,
        footprintz = 4,
        maxslope = 22,
        maxwaterslope = 255
    },
    HTANK3 = {
        allowrawmovement = true,
        crushstrength = 253,
        footprintx = 3,
        footprintz = 3,
        maxslope = 18,
        maxwaterdepth = 22
    },
    HTANK4 = {
        allowrawmovement = true,
        allowterraincollisions = false,
        crushstrength = 253,
        footprintx = 4,
        footprintz = 4,
        maxslope = 18,
        maxwaterdepth = 22
    },
    HTANK5 = {
        allowrawmovement = true,
        allowterraincollisions = false,
        crushstrength = 253,
        footprintx = 5,
        footprintz = 5,
        maxslope = 18,
        maxwaterdepth = 22
    },
    HTANK8 = {
        allowrawmovement = true,
        allowterraincollisions = false,
        crushstrength = 253,
        footprintx = 8,
        footprintz = 8,
        maxslope = 18,
        maxwaterdepth = 22
    },
    VHTANK5 = {
        allowrawmovement = true,
        allowterraincollisions = false,
        crushstrength = 1400,
        footprintx = 5,
        footprintz = 5,
        maxslope = 18,
        maxwaterdepth = 22
    },
    HKBOT3 = {
        allowrawmovement = true,
        crushstrength = 253,
        footprintx = 3,
        footprintz = 3,
        maxslope = 36,
        maxwaterdepth = 22
    },
    HKBOT4 = {
        allowrawmovement = true,
        allowterraincollisions = false,
        crushstrength = 253,
        footprintx = 4,
        footprintz = 4,
        maxslope = 36,
        maxwaterdepth = 22
    },
    HKBOT5 = {
            allowrawmovement = true,
            allowterraincollisions = false,
            crushstrength = 253,
            footprintx = 5,
            footprintz = 5,
            maxslope = 36,
            maxwaterdepth = 22
    },
    HKBOT7 = {
        allowrawmovement = true,
        allowterraincollisions = false,
        crushstrength = 12400,
        depthmod = 0,
        depthModParams = {
	    	minHeight = 4,
            linearCoeff = 0.03,
            maxValue = 0.7
        },
        footprintx = 7,
        footprintz = 7,
        maxslope = 36,
        maxwaterdepth = 30
    },
    HKBOT8 = {
        allowrawmovement = true,
        allowterraincollisions = false,
        crushstrength = 14500,
        depthmod = 0,
        depthModParams = {
     	       minHeight = 4,
            linearCoeff = 0.03,
            maxValue = 0.7
        },
        footprintx = 8,
        footprintz = 8,
        maxslope = 38,
        maxwaterdepth = 32
    },
    HTKBOT3 = {
        allowrawmovement = true,
        crushstrength = 253,
        footprintx = 3,
        footprintz = 3,
        maxslope = 80,
        maxwaterdepth = 22
    },
    HTKBOT4 = {
        allowrawmovement = true,
        allowterraincollisions = false,
        crushstrength = 253,
        footprintx = 4,
        footprintz = 4,
        maxslope = 80,
        maxwaterdepth = 22
    },
    HTKBOT5 = {
        allowrawmovement = true,
        allowterraincollisions = false,
        crushstrength = 253,
        footprintx = 5,
        footprintz = 5,
        maxslope = 80,
        maxwaterdepth = 22
    },
    HTKBOT7 = {
        allowrawmovement = true,
        allowterraincollisions = false,
        crushstrength = 12400,
        footprintx = 7,
        footprintz = 7,
        maxslope = 80,
        maxwaterdepth = 22
    },
    KBOT1 = {
        allowrawmovement = true,
        crushstrength = 5,
        footprintx = 1,
        footprintz = 1,
        maxslope = 36,
        maxwaterdepth = 5
    },
    KBOT2 = {
        allowrawmovement = true,
        crushstrength = 10,
        footprintx = 2,
        footprintz = 2,
        maxslope = 36,
        maxwaterdepth = 22
    },
    KBOT3 = {
        allowrawmovement = true,
        crushstrength = 30,
        footprintx = 3,
        footprintz = 3,
        maxslope = 36,
        maxwaterdepth = 21
    },
    KBOT4 = {
        allowrawmovement = true,
        crushstrength = 30,
        footprintx = 4,
        footprintz = 4,
        maxslope = 36,
        maxwaterdepth = 21
    },
    TANK2 = {
        allowrawmovement = true,
        crushstrength = 15,
        footprintx = 2,
        footprintz = 2,
        maxslope = 18,
        maxwaterdepth = 22
    },
    TANK3 = {
        allowrawmovement = true,
        crushstrength = 30,
        footprintx = 3,
        footprintz = 3,
        maxslope = 18,
        maxwaterdepth = 22
    },
    TANK4 = {
        allowrawmovement = true,
        allowterraincollisions = false,
        crushstrength = 30,
        footprintx = 4,
        footprintz = 4,
        maxslope = 18,
        maxwaterdepth = 22
    },
    TKBOT3 = {
        allowrawmovement = true,
        crushstrength = 15,
        footprintx = 3,
        footprintz = 3,
        maxwaterdepth = 22
    },
    TKBOT4 = {
        allowrawmovement = true,
        allowterraincollisions = false,
        crushstrength = 15,
        footprintx = 4,
        footprintz = 4,
        maxwaterdepth = 22
    },
    VKBOT4 = {
        allowrawmovement = true,
        allowterraincollisions = false,
        crushstrength = 1400,
        depthmod = 0,
        footprintx = 4,
        footprintz = 4,
        maxslope = 24,
        maxwaterdepth = 5000,
        maxwaterslope = 30
    },
    VKBOT5 = {
        allowrawmovement = true,
        allowterraincollisions = false,
        crushstrength = 1400,
        depthmod = 0,
        footprintx = 5,
        footprintz = 5,
        maxslope = 24,
        maxwaterdepth = 5000,
        maxwaterslope = 30
    },
    VKBOT9 = {
        allowrawmovement = true,
        allowterraincollisions = false,
        crushstrength = 12400,
        depthmod = 0,
        footprintx = 9,
        footprintz = 9,
        maxslope = 24,
        maxwaterdepth = 15000,
        maxwaterslope = 30
    },
    UBOAT3 = {
        allowrawmovement = true,
		footprintx = 3,
        footprintz = 3,
        minwaterdepth = 35,
        crushstrength = 5,
        subMarine = 1
    },
    UBOAT5 = {
        allowrawmovement = true,
        allowterraincollisions = false,
		footprintx = 5,
        footprintz = 5,
        minwaterdepth = 60,
        crushstrength = 5,
        subMarine = 1
    },
    TANKHOVER3 = {
        allowrawmovement = true,
		crushstrength = 90,
        depthmod = 0,
        footprintx = 3,
        footprintz = 3,
        maxslope = 29,
        badslope = 20,
        maxwaterslope = 255,
        badwaterslope = 255
    },
    TANKHOVER4 = {
        allowrawmovement = true,
        allowterraincollisions = false,
		crushstrength = 90,
        depthmod = 0,
        footprintx = 4,
        footprintz = 4,
        maxslope = 29,
        badslope = 20,
        maxwaterslope = 255,
        badwaterslope = 255
    },
    AMPHKBOT = {
        allowrawmovement = true,
		crushstrength = 250,
        footprintx = 3,
        footprintz = 3,
        maxslope = 80,
        maxwaterdepth = 180
    },
    AMPTBOT = {
        allowrawmovement = true,
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
    if Spring.GetModOptions() ~= nil then
        moveData.heatmapping = (Spring.GetModOptions() and tonumber(Spring.GetModOptions().mo_heatmap) and (tonumber(Spring.GetModOptions().mo_heatmap) ~= 0))
    else
        moveData.heatmapping = true
    end
    moveData.name = moveName
    defs[#defs + 1] = moveData
end

return defs
