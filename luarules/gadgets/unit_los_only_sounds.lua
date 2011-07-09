function gadget:GetInfo()
  return {
    name      = "Los_Only_Sounds",
    desc      = "Plays some builder sounds in LOS only",
    author    = "TheFatController",
    date      = "08 Jan 2011",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end


if gadgetHandler:IsSyncedCode() then

buildSounds = {}
buildSounds[UnitDefNames["corvp"].id] = "sounds/pvehwork.wav"
buildSounds[UnitDefNames["coravp"].id] = "sounds/pvehwork.wav"
buildSounds[UnitDefNames["armvp"].id] = "sounds/pvehwork.wav"
buildSounds[UnitDefNames["armavp"].id] = "sounds/pvehwork.wav"
buildSounds[UnitDefNames["tllvp"].id] = "sounds/pvehwork.wav"
buildSounds[UnitDefNames["tllavp"].id] = "sounds/pvehwork.wav"


buildSounds[UnitDefNames["corap"].id] = "sounds/pairwork.wav"
buildSounds[UnitDefNames["coraap"].id] = "sounds/pairwork.wav"
buildSounds[UnitDefNames["armap"].id] = "sounds/pairwork.wav"
buildSounds[UnitDefNames["armaap"].id] = "sounds/pairwork.wav"
buildSounds[UnitDefNames["tllap"].id] = "sounds/pairwork.wav"
buildSounds[UnitDefNames["tllaap"].id] = "sounds/pairwork.wav"

buildSounds[UnitDefNames["corsy"].id] = "sounds/pshpwork.wav"
buildSounds[UnitDefNames["corasy"].id] = "sounds/pshpwork.wav"
buildSounds[UnitDefNames["armsy"].id] = "sounds/pshpwork.wav"
buildSounds[UnitDefNames["armasy"].id] = "sounds/pshpwork.wav"
buildSounds[UnitDefNames["tllsy"].id] = "sounds/pshpwork.wav"
buildSounds[UnitDefNames["tllasy"].id] = "sounds/pshpwork.wav"

buildSounds[UnitDefNames["corlab"].id] = "sounds/plabwork.wav"
buildSounds[UnitDefNames["coralab"].id] = "sounds/plabwork.wav"
buildSounds[UnitDefNames["armlab"].id] = "sounds/plabwork.wav"
buildSounds[UnitDefNames["armalab"].id] = "sounds/plabwork.wav"
buildSounds[UnitDefNames["tlllab"].id] = "sounds/plabwork.wav"
buildSounds[UnitDefNames["tllalab"].id] = "sounds/plabwork.wav"


buildSounds[UnitDefNames["corech3"].id] = "sounds/radar1.wav"
buildSounds[UnitDefNames["corech18"].id] = "sounds/radar1.wav"
buildSounds[UnitDefNames["corech21"].id] = "sounds/radar1.wav"
buildSounds[UnitDefNames["armrech3"].id] = "sounds/radar1.wav"
buildSounds[UnitDefNames["armrech18"].id] = "sounds/radar1.wav"
buildSounds[UnitDefNames["armrech21"].id] = "sounds/radar1.wav"



local GetUnitBasePosition = Spring.GetUnitBasePosition
local GetUnitDefID = Spring.GetUnitDefID

function gadget:UnitCreated(unitID, unitDefID, unitTeam, builderID)
  if builderID then
	  local builderDefID = GetUnitDefID(builderID)
	  if buildSounds[builderDefID] then
		local x,y,z = GetUnitBasePosition(builderID)
		SendToUnsynced("LOSSound",x,y,z,buildSounds[builderDefID])
	  end
  end
end

-- SYNCED
else
-- UNSYNCED
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local PlaySoundFile = Spring.PlaySoundFile
local GetPositionLosState = Spring.GetPositionLosState
local GetMyAllyTeamID = Spring.GetMyAllyTeamID

function gadget:Initialize()
  gadgetHandler:AddSyncAction("LOSSound", LOSSound)
end

function LOSSound(_,x,y,z,sound)
	local _,inLos = GetPositionLosState(x,y,z,GetMyAllyTeamID())
	if inLos then
		local volume = ((Spring.GetConfigString("snd_volunitreply") or 100) / 100)
		PlaySoundFile(sound,volume,x,y,z)
	end
end
  
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end
