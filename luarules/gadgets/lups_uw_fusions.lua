-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "Lups UnderWater Fusion",
    desc      = "Distorts water around underwater fusion with LUPS",
    author    = "nixtux",
    date      = "Nov, 2018",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true,  --  loaded by default?
  }
end

if (gadgetHandler:IsSyncedCode()) then
-------------------------------------------------------------------------------------
-- -> SYNCED
-------------------------------------------------------------------------------------
else
-------------------------------------------------------------------------------------
-- -> UNSYNCED
-------------------------------------------------------------------------------------
  GG.LUPS = GG.LUPS or {}

  local update = 4.0
  local fusions = {}
  local UWFusions = {
  [UnitDefNames["armuwfus"].id] = {size = 60, offsetx = 0, offsety = 40, offsetz = 0},
  [UnitDefNames["coruwfus"].id] = {size = 70, offsetx = 10, offsety = 40, offsetz = -20},
  }

  local distortFX = {
    count         = 1,
    emitVector    = {0,1,0},
    emitRotSpread = 45,
    force         = {0,0.5,0},
    priority      = 4,

    life          = 60,
    lifeSpread    = 5,

    speed           = 0.25,
    speedSpread     = 0.25,
    speedExp        = 7,

    size            = 125,
    sizeSpread      = 40,
    sizeGrowth      = 0.5,
    sizeExp         = 2.5,

    strength      = 2.0,
    scale         = 5.0,
    animSpeed     = 0.25,
    heat          = 16,

    texture       = "bitmaps/GPL/Lups/mynoise2.png",
    }


  function gadget:UnitCreated(unitID, unitDefID, unitTeam)
    if (UWFusions[unitDefID]) then
      fusions[unitID] = UWFusions[unitDefID]
    end
  end


  function gadget:UnitTaken(unitID, unitDefID, unitTeam)
    if (UWFusions[unitDefID]) then 
      fusions[unitID] = UWFusions[unitDefID]
    end
  end


  function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
    if (UWFusions[unitDefID]) then 
      fusions[unitID] = nil
    end
  end

local timeCounter = math.huge -- force the first update


function gadget:Update(deltaTime)
  if (Spring.GetGameFrame()<1) then return end
  if (timeCounter < update) then
    timeCounter = timeCounter + deltaTime
    return
  end    
  if tonumber(Spring.GetConfigInt("Water",1) or 1) > 2 then
    canDraw = false
  else
   	canDraw = true
  end
end

  function gadget:GameFrame(frame)
    if (frame%30==0) and canDraw then 
      for unitID, thing in pairs(fusions) do
        Spring.Echo(fusions[unitID].size)
        local myTeamID = Spring.GetMyTeamID()
        if not Spring.IsUnitIcon(unitID) and (CallAsTeam(myTeamID, Spring.IsUnitInView, unitID)) then
          local posx, posy, posz  = Spring.GetUnitPosition(unitID,true)
          distortFX.size = fusions[unitID].size
          posx = posx - fusions[unitID].offsetx
          posy = posy - fusions[unitID].offsety
          posz = posz - fusions[unitID].offsetz
          distortFX.pos = {posx, posy, posz}
          GG.Lups.AddParticles('JitterParticles2', distortFX)
        end
      end
    end
  end

  function gadget:Initialize()
    for _, unitID in ipairs(Spring.GetAllUnits()) do
      local unitDefID = Spring.GetUnitDefID(unitID)
      if (UWFusions[unitDefID]) then
        fusions[unitID] = UWFusions[unitDefID]
      end
    end
  end

-------------------------------------------------------------------------------------
-- -> END
-------------------------------------------------------------------------------------
end