-- for wi=0,n,32 do because in 95 weapon numbers start from 0
--zK 1.11.13 with spring 95: units can jump over the wall (they kind of glitch/bounce around)
--zK 1.11.13 with spring 91: works
function gadget:GetInfo()
  return {
    name      = "walls",
    desc      = "ist der wallin auch ling dicht?",
    author    = "knorke",
    date      = "2011",
    license   = "weeeeeee iam on horse",
    layer     = -3,
    enabled   = true
  }
end

local enabled = tonumber(Spring.GetModOptions().mo_wall) or 0
if (enabled == 0) then --or wallHeight > mapHeight then
  return false
end

--local gl.Vertex = gl.Vertex
local SpringGetUnitBasePosition = Spring.GetUnitBasePosition   
local SpringGetUnitTeam = Spring.GetUnitTeam

if (gadgetHandler:IsSyncedCode()) then
local GetGaiaTeamID  = Spring.GetGaiaTeamID ()
local wallHeight = #UnitDefs
local wallActive = true
local blockWeapons = true
local seeEverything = true
local mapHeight = 0x38

local wallTime = 10 * 60 --in seconds
local walls = {}
walls[1] = {} walls[1].z= Game.mapSizeZ*0.45
walls[2] = {} walls[2].z= Game.mapSizeZ*0.55

_G.walls = walls
_G.wallActive = wallActive
--_G.wallTime = wallTime
_G.wallText = "ready up!"

function gadget:Initialize()
	local minutes = Spring.GetModOptions()["wall_time"] or 10
	wallTime = minutes * 60
	
	local p = Spring.GetModOptions()["wall_size"] or 45
	p = p / 100
	walls[1].z= Game.mapSizeZ *p
	walls[2].z= Game.mapSizeZ *(1-p)
	
	local los = Spring.GetModOptions()["los"] or '1'
	if (los == '1') then seeEverything = true else seeEverything = false end
		
	local weapons = Spring.GetModOptions()["weapons"] or '1' 
	if (weapons == '2') then blockWeapons = false end
		
	Spring.Echo ("wallTime in seconds: " .. wallTime .. " | " .. "P=" .. p)
end



function gadget:GameFrame (f)
	if (wallActive and f%10==0) then		
		wallCheck ()
	end
	if (f%30==0) then 

		if (wallTime > 0) then
			--Spring.Echo (wallTime)
			wallTime = wallTime-1
		else		
			wallActive = false 
			RevertAlwaysVisible()
			UnlockWeapons()
			gadgetHandler:RemoveGadget()
		end
		_G.wallText = SecondsToClock (wallTime)
		--sec2Min (wallTime)
		_G.wallActive = wallActive
		--_G.wallTime = wallTime
	end	
end

function wallCheck ()
	local all_units = Spring.GetAllUnits ()
	for i in pairs(all_units) do
		x,y,z = SpringGetUnitBasePosition   (all_units[i])
		local unitTeam = SpringGetUnitTeam (all_units[i])
		if (unitTeam ~= GetGaiaTeamID and x and y and z) then
			if (z < Game.mapSizeZ/2) then
				if (z > walls[1].z) then
					Spring.MoveCtrl.Enable(all_units[i])
					Spring.MoveCtrl.SetPosition (all_units[i],x,y,walls[1].z-10)
					Spring.MoveCtrl.Disable(all_units[i])					
				end
			else
				if (z < walls[2].z) then
					Spring.MoveCtrl.Enable(all_units[i])
					Spring.MoveCtrl.SetPosition (all_units[i],x,y,walls[2].z+10)
					Spring.MoveCtrl.Disable(all_units[i])
				end
			end
		end
	end
end

function gadget:AllowUnitCreation(unitDefID, builderID, builderTeam, x, y, z)
	if (wallActive and builderTeam ~= GetGaiaTeamID) then
		if (x and y and z) then
			if (z < Game.mapSizeZ/2) then
				if (z > walls[1].z) then
					return false
				end
			else
				if (z < walls[2].z) then
					return false
				end
			end
		end
	end
	return true
end


function gadget:UnitCreated(unitID, unitDefID, teamID, builderID)
	if (wallActive and blockWeapons) then
		local n = #UnitDefs[unitDefID].weapons
		--Spring.Echo ("n="..n)
		for wi=0,32,1 do-- was: n-
			--Spring.SetUnitWeaponState (unitID, wi,{aimReady=0})
			Spring.SetUnitWeaponState (unitID, wi,{reloadFrame=99999})
		end
	end
	if (wallActive and seeEverything) then
	Spring.SetUnitAlwaysVisible (unitID, true)
	end
end

function UnlockWeapons ()
	local all_units = Spring.GetAllUnits ()
	for i in pairs(all_units) do
		for wi=0,32,1 do
			Spring.SetUnitWeaponState (all_units[i], wi,{reloadFrame=0, reloadState=0})
		end
	end
end

function RevertAlwaysVisible ()
	local all_units = Spring.GetAllUnits ()
	for i in pairs(all_units) do
		Spring.SetUnitAlwaysVisible (all_units[i], false)
	end
end


function SecondsToClock(sSeconds)
nSeconds = (sSeconds or 0) +0
nHours = string.format("%02.f", math.floor(nSeconds/3600));
nMins = string.format("%02.f", math.floor(nSeconds/60 - (nHours*60)));
nSecs = string.format("%02.f", math.floor(nSeconds - nHours*3600 - nMins *60));
return nMins..":"..nSecs
end


else --- UNSYCNED:

local wallText, wallActive, walls

function gadget:Initialize()
	walls = SYNCED.walls
	walls_z_half = walls[1].z/1.6
	wallActive = SYNCED.wallActive
	wallText = SYNCED.wallText
end

function gadget:GameFrame(frame)
	--if frame%10==0 then
		wallActive = SYNCED.wallActive
		wallText = SYNCED.wallText
	--end
end

function gadget:DrawWorld ()
	if (not wallActive) then return end
	drawWall(walls[1].z)
	drawWall(walls[2].z)
	draw3DText(wallText,walls_z_half,250,walls[1].z,250)
	draw3DText(wallText,walls_z_half,250,walls[2].z,250)
end


function drawWall (z)
	gl.PushAttrib(GL.ALL_ATTRIB_BITS)
	gl.DepthTest(true)
	gl.DepthMask(true)	
	gl.Texture(":a:luarules\\images\\wall.png")-- Texture file	
	--gl.Color(red,green,blue,alpha)	
	gl.Color(0,1,1,0.25)
	gl.BeginEnd(GL.QUADS,drawWallVertices,  z)
	gl.Texture(false)
	gl.DepthMask(false)
	gl.DepthTest(false)	
	gl.PopAttrib()
end

function drawWallVertices (z)
  local s = 5
  local y = 600
  local x = Game.mapSizeX
  gl.TexCoord(-s*10,-s)
  gl.Vertex(0 ,0, z)
  
  gl.TexCoord(-s*10,s)
  gl.Vertex(0,y,z)
  
  gl.TexCoord(s*10,s)
  gl.Vertex(x,y,z)
  
  gl.TexCoord(s*10,-s)
  gl.Vertex(x,0,z)
end


function draw3DText(text,ux,uy,uz,textSize)  
  gl.PushMatrix()
  gl.Translate(ux, uy, uz)
  --gl.Billboard()
  --gl.MultiTexCoord(1, 1)  
  --gl.Color(1, 1, 0)  
  gl.Text(text, 100, 100, textSize, "oc")  
  gl.PopMatrix()
end


------------------

function DrawGroundHuggingSquare(red,green,blue,alpha,  x1,z1,x2,z2,   HoverHeight)
	gl.PushAttrib(GL.ALL_ATTRIB_BITS)
	gl.DepthTest(true)
	gl.DepthMask(true)	
	gl.Texture(":a:LuaRules\\Gadgets\\lava2.png")-- Texture file	
	gl.Color(red,green,blue,alpha)	
	gl.BeginEnd(GL.QUADS,DrawGroundHuggingSquareVertices,  x1,z1, x2,z2,  HoverHeight)
	gl.Texture(false)
	gl.DepthMask(false)
	gl.DepthTest(false)	
	gl.PopAttrib()
end


function DrawGroundHuggingSquareVertices(x1,z1, x2,z2,   HoverHeight)
  local y=HoverHeight--+Spring.GetGroundHeight(x,z)  
  local s = 2
  gl.TexCoord(-s,-s)
  gl.Vertex(x1 ,y, z1)
  
  gl.TexCoord(-s,s) 
  gl.Vertex(x1,y,z2)
  
  gl.TexCoord(s,s)
  gl.Vertex(x2,y,z2)
  
  gl.TexCoord(s,-s)
  gl.Vertex(x2,y,z1)
end

end--ende unsync