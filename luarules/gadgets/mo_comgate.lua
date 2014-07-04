function gadget:GetInfo()
  return {
    name      = "Teleport",
    desc      = "Teleport effect.",
    author    = "quantum, TheFatController, Nixtux",
    date      = "June 22, 2007",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

local enabled = tonumber(Spring.GetModOptions().mo_comgate) or 0

if (enabled == 0) then 
  return false
end

--synced
if (gadgetHandler:IsSyncedCode()) then

local hiddenUnits = {}
local gameStart = false
local gaiaTeamID = Spring.GetGaiaTeamID()


function gadget:UnitCreated(unitID, unitDefID, teamID)
	if (not gameStart) and not hiddenUnits[unitID] then
		local x,y,z = Spring.GetUnitPosition(unitID)
		hiddenUnits[unitID] = {x,y,z,teamID}
		Spring.SetUnitNoDraw(unitID,true) 
	end
end

function gadget:GameFrame(n)
  if (not gameStart) and (n > 5) then
    gameStart = true
  end
  if (n == 6) then
    for unitID,data in pairs(hiddenUnits) do
		Spring.CallCOBScript(unitID, "TeleportControl", 0)
    end
  end
  if (n == 140) then
    for unitID,_ in pairs(hiddenUnits) do
		Spring.SetUnitNoDraw(unitID,false)
    end
  end
  if (n == 170) then
    gadgetHandler:RemoveGadget()
  end
end

function gadget:AllowCommand(unitID, unitDefID, unitTeam, cmdID, cmdParams, cmdOptions, cmdTag, synced)
	local n = Spring.GetGameFrame()
	if n < 140 then return false end
	return true
end

--unsynced
else

local myPlayerID = Spring.GetMyPlayerID()
local _,_,spec,_ = Spring.GetPlayerInfo(myPlayerID) 
local vsx,vsy = Spring.GetViewGeometry()
local GateInfo
local GateInfo2

local tackyfont = gl.LoadFont("luarules/fonts/LCD2U___.TTF",72, 1.9, 40)
local msg = ""
local colorString = "\255\255\255\255"
local colorString2 = "\255\100\001\001"


function gadget:DrawScreen()
    if not spec then 
	if Spring.GetGameFrame() > 20 then 
		if GateInfo then 
			gl.DeleteList(GateInfo)
		end
	end
	
	if Spring.GetGameFrame() > 170 then 
		if GateInfo2 then 
			gl.DeleteList(GateInfo2)
		end
		gadgetHandler:RemoveGadget()
		return
	end
	
	if Spring.GetGameFrame() > 140 and GateInfo2 then
		--gl.CallList(GateInfo2)
	end
	if Spring.GetGameFrame() < 130 and GateInfo then --use frame 10
		gl.CallList(GateInfo)
	end
   end
end

function gadget:GameOver()
		if GateInfo then 
			gl.DeleteList(GateInfo)
			gl.DeleteList(GateInfo2)
		end
		gadgetHandler:RemoveGadget()	
end

function gadget:Initialize()
	local textSize = 72
	local dx = vsx*0.5
	local dy = vsy*0.72
	GateInfo2 = gl.CreateList(function()
	
		-- First message
		msg = "Teleport Complete"
		tackyfont:Begin()
		tackyfont:Print(colorString2 .. msg, dx, dy, 72,'cb')
		tackyfont:End()
	end)
	GateInfo = gl.CreateList(function()
	
		-- Second Message
		msg = "Teleport Activated"
		tackyfont:Begin()
		tackyfont:Print(colorString .. msg, dx, dy, 72,'cb')
		tackyfont:End()
	end)
end

end