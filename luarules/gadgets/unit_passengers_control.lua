--in TechA "commando" unit always survives being shot down during transport
--when a com dies in mid air the damage done is controlled by unit_combomb_full_damage

--several other ways to code this do not work because:
--when UnitDestroyed() is called, Spring.GetUnitIsTransporting is already empty -> meh
--checking newDamage>health in UnitDamaged() does not work because UnitDamaged() does not trigger on selfdestruct -> meh
--with releaseHeld, on death of a transport UnitUnload is called before UnitDestroyed
--when UnitUnloaded is called due to transport death, Spring.GetUnitIsDead (transportID) is still false
--when trans is self d'ed, on the frame it dies it has both Spring.GetUnitHealth(ID)>0 and Spring.UnitSelfDTime(ID)=0
--when trans is crashing it isn't dead
--SO: we wait one frame after UnitUnload and then check if the trans is dead/alive/crashing

--DestroyUnit(ID, true, true) will trigger self d explosion, won't leave a wreck but won't cause an explosion either
--DestroyUnit(ID, true, false) won't leave a wreck but won't cause the self d explosion either
--AddUnitDamage (ID, math.huge) makes a normal death explo but leaves wreck. Calling this for the transportee on the same frame as the trans dies results in a crash.

function gadget:GetInfo()
  return {
    name      = "transport passengers control",
    desc      = "kills units in transports when transports dies (except commandos)",
    author    = "knorke, bluestone",
    date      = "Dec 2012",
    license   = "horse has fallen over",
    layer     = 0,
    enabled   = true
  }
end

if (not gadgetHandler:IsSyncedCode()) then return end

local stunTime = 14 -- need at least 14 sec !

local paraTroopers={
  [UnitDefNames["corpyro"].id] = true,
  [UnitDefNames["armmav"].id] = true,
  [UnitDefNames["tlltraq"].id] = true,
  [UnitDefNames["corcommando"].id] = true,
  [UnitDefNames["armrambo"].id] = true,
  [UnitDefNames["tllgizmo"].id] = true,
  [UnitDefNames["talon_berserker"].id] = true,
  [UnitDefNames["talon_shepherd"].id] = true,
  [UnitDefNames["gok_zealot"].id] = true,
  [UnitDefNames["gok_mask"].id] = true,
}

local crawlingBombs = {
  [UnitDefNames.armvader.id] = true,
  [UnitDefNames.corroach.id] = true,
  [UnitDefNames.corsktl.id] = true,
  [UnitDefNames.tllcrawlb.id] = true,
  [UnitDefNames.coretnt.id] = true,
  [UnitDefNames.talon_herison.id] = true,
  [UnitDefNames.gok_blackheart.id] = true,
}

local toKill = {}
local toStun = {}
local fromtrans = {}
local currentFrame = 0

function gadget:UnitUnloaded(unitID, unitDefID, teamID, transportID)
  currentFrame = Spring.GetGameFrame()
  if (not toKill[currentFrame+1]) then toKill[currentFrame+1] = {} end
  if (not toStun[currentFrame+1]) then toStun[currentFrame+1] = {} end
  if paraTroopers[Spring.GetUnitDefID(unitID)] then
    toStun[currentFrame+1][unitID] = true
  else
    toKill[currentFrame+1][unitID] = true
  end
  if (not fromtrans[currentFrame+1]) then fromtrans[currentFrame+1] = {} end
  fromtrans[currentFrame+1][unitID] = transportID
end

function gadget:GameFrame (currentFrame)
  if (toStun[currentFrame]) then
    for uID,_ in pairs (toStun[currentFrame]) do
      tID = fromtrans[currentFrame][uID]
      if ((not Spring.GetUnitIsDead(uID)) and (Spring.GetUnitIsDead(tID) or (Spring.GetUnitMoveTypeData(tID).aircraftState=="crashing"))) then
        local health,maxHealth,_,_,_ = Spring.GetUnitHealth(uID)
        Spring.SetUnitHealth(uID,{ paralyze = maxHealth + (maxHealth/40)*stunTime, health = 0.40 * health })
        Spring.GiveOrderToUnit(uID, CMD.STOP, {}, {})
      end
    end
  end

  if (toKill[currentFrame]) then
    for uID,_ in pairs (toKill[currentFrame]) do
      tID = fromtrans[currentFrame][uID]
      if ((not Spring.GetUnitIsDead(uID)) and (Spring.GetUnitIsDead(tID) or (Spring.GetUnitMoveTypeData(tID).aircraftState=="crashing"))) then
        if crawlingBombs[Spring.GetUnitDefID(uID)] then
          Spring.DestroyUnit(uID, false, true)
        else
          Spring.DestroyUnit(uID, true, false)
        end
      end
    end
    toStun[currentFrame] = nil
    toKill[currentFrame] = nil
    fromtrans[currentFrame] = nil
  end
end
