--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
					
function widget:GetInfo()
  return {
    name      = "Projectile lights",
    desc      = "Glows them projectiles!",
    author    = "Beherith, Deadnight Warrior",
    date      = "july 2012",
    license   = "GNU GPL, v2 or later",
    layer     = -1,
    enabled   = true  
  }
end

local spGetUnitViewPosition 	= Spring.GetUnitViewPosition
local spGetUnitDefID			= Spring.GetUnitDefID
local spGetGroundHeight			= Spring.GetGroundHeight
local spGetGroundNormal			= Spring.GetGroundNormal
local spGetVisibleProjectiles   = Spring.GetVisibleProjectiles
local spGetProjectilePosition	= Spring.GetProjectilePosition
local spGetProjectileType		= Spring.GetProjectileType
local spGetProjectileDefID		= Spring.GetProjectileDefID
local spGetProjectileVelocity	= Spring.GetProjectileVelocity
local spGetGameFrame 			= Spring.GetGameFrame
local spGetGameSpeed 			= Spring.GetGameSpeed

local glPushMatrix		= gl.PushMatrix
local glTranslate		= gl.Translate
local glRotate			= gl.Rotate
local glScale			= gl.Scale
local glPopMatrix		= gl.PopMatrix
local glBeginEnd		= gl.BeginEnd
local glVertex			= gl.Vertex
local glTexCoord		= gl.TexCoord
local glShape			= gl.Shape
local glTexture			= gl.Texture
local glColor			= gl.Color
local glDepthMask		= gl.DepthMask
local glDepthTest		= gl.DepthTest
local glCallList		= gl.CallList
local glBlending		= gl.Blending
local glCreateList		= gl.CreateList
local glCallList		= gl.CallList
local glDeleteList		= gl.DeleteList
local GL_TRIANGLE_STRIP = GL.TRIANGLE_STRIP
local max, min			= math.max, math.min
local floor				= math.floor
local sqrt				= math.sqrt
local atan2				= math.atan2
local acos, cos			= math.acos, math.cos
local abs				= math.abs
local DegToRad			= 57.295779513082320876798

local TooHigh = true
local HighPing = false
local FPSCount = Spring.GetFPS()
local FPSLimit = 8

local list      
local plighttable = {}
local BlackList, Customlight, Armtrails, Coretrails, Tlltrails, Plasmabatts, Tlltrailssb, Armtrailssb, Coretrailssd = include("Configs/gfx_projectile_lights_defs.lua")	-- weapons that shouldn't use projectile lights
local noise = {--this is so that it flashes a bit, should be addressed with (x+z)%10 +1
	1.1,
	1.0,
	0.9,
	1.3,
	1.2,
	0.8,
	0.9,
	1.1,
	1.0,
	0.7,
	}
local pieceprojectilecolor={1.0, 1.0, 0.5, 0.25} -- This is the color of piece projectiles, set to nil to disable

listC = glCreateList(function()	-- Cannon light decal texture
	glBeginEnd(GL.QUAD_STRIP,function()  
    --point1
    glTexCoord(0.0,0.0)
    glVertex(-4.0,0.0,-4.0)
    --point2
    glTexCoord(0.0,1.0)
    glVertex(4.0,0.0,-4.0)
    --point3
    glTexCoord(0.5,0.0)
    glVertex(-4.0,0.0,4.0)
    --point4
    glTexCoord(0.5,1.0)
    glVertex(4.0,0.0,4.0)
    end)
end)

listL = glCreateList(function()	-- Laser cannon decal texture
	glBeginEnd(GL.QUAD_STRIP,function()  
    --point1
    glTexCoord(0.5,0.0)
    glVertex(-2.0,0.0,-4.0)
    --point2
    glTexCoord(0.5,1.0)
    glVertex(2.0,0.0,-4.0)
    --point3
    glTexCoord(1.0,0.0)
    glVertex(-2.0,0.0,2.0)
    --point4
    glTexCoord(1.0,1.0)
    glVertex(2.0,0.0,2.0)
    end)
end)

function DrawStatus(toohigh,fps,ping)
    TooHigh = toohigh
    FPSCount = fps
    HighPing = ping
end


function widget:Initialize() -- create lighttable
    widgetHandler:RegisterGlobal('DrawManager_projectilelights', DrawStatus)
--[[	local modOptions = Spring.GetModOptions()
	if modOptions and modOptions.lowcpu == "1" then
		Spring.Echo('Low performance mode is on, removing "Projectile lights" widget')
		widgetHandler:RemoveWidget()
	end
--]]
	-- These projectiles should have lights:
		-- Cannon - projectile size: tempsize = 2.0f + std::min(wd.damages[0] * 0.0025f, wd.damageAreaOfEffect * 0.1f);)
		-- EmgCannon - looks a bit shiny when close to ground
		-- LaserCannon - über effects
		-- Flame - a bit iffy cause of long projectile life... but it looks great.
		-- BeamLaser --with Spring 94.1.1163+ super-über-ober effects
		-- LightningCannon --same as BeamLasers
	-- Shouldn't:
		-- Dgun	-- uses dynamic lighting
		-- MissileLauncher	-- already has CEG trails, which have both smoke and ground light
		-- StarburstLauncher	-- same as MissileLauncher
		-- AircraftBomb
		-- Melee, Rifle	-- has no projectile
		-- Shield
		-- TorpedoLauncher
	for w=0, #WeaponDefs do 
		local weaponDef = WeaponDefs[w]
		if not BlackList[weaponDef.name] then	-- prevent projectile light, if the weapon has some other light effect
			if Customlight[weaponDef.name] then
			       --Spring.Echo("Custom lights for :"..weaponDef.name)
			       plighttable[w]=Customlight[weaponDef.name]
			elseif (weaponDef.type == 'Cannon') and Plasmabatts[weaponDef.name] then
				plighttable[w]={0.8,0.6,0,4.0*((weaponDef.size-0.65)/3.0),_,_,((weaponDef.size/2.6)+0.5)}  -- 7th is *size 
			elseif (weaponDef.type == 'Cannon' or weaponDef.type == 'EmgCannon') then
				plighttable[w] = {0.8,0.6,0,1.2*((weaponDef.size-0.65)/2.5)}
			elseif (weaponDef.type == 'LaserCannon') then
				local colour = weaponDef.visuals
				plighttable[w] = {
					colour.colorR, colour.colorG, colour.colorB, 0.6,
					weaponDef.projectilespeed * weaponDef.duration, colour.thickness^0.33333}			
			elseif (weaponDef.type == 'LightningCannon') then
				local colour = weaponDef.visuals
				plighttable[w] = {colour.colorR, colour.colorG, colour.colorB, 0.16, true, 64*colour.thickness^0.50, 1.1}					
			elseif (weaponDef.type == 'BeamLaser') then
				local colour, alpha, thick, blend = weaponDef.visuals, 0.15, 0.18, 0
				if weaponDef.largeBeamLaser==true then
					alpha, thick, blend = 0.25, 0.80, 0.22
				end
				plighttable[w] = {colour.colorR+blend/5, colour.colorG+blend, colour.colorB, alpha, true, 64*colour.thickness^thick, 1.07}
			--Core Missiles 
			elseif (weaponDef.type == 'MissileLauncher') and Coretrails[weaponDef.name] then
				size=WeaponDefs[w]['size']
				plighttable[w]={1,0.2,0.2,0.8*((size-1)/3)}
			--Arm Missiles
			elseif (weaponDef.type == 'MissileLauncher') and Armtrails[weaponDef.name] then
				size=WeaponDefs[w]['size']
				plighttable[w]={0.7,0.7,1,0.8*((size-1)/3)}
			--Tll Missiles
			elseif (weaponDef.type == 'MissileLauncher') and Tlltrails[weaponDef.name] then
				size=WeaponDefs[w]['size']
				plighttable[w]={1,1,0.2,0.8*((size-1)/3)}
			--Other Missiles
			elseif (weaponDef.type == 'MissileLauncher') then
				size=WeaponDefs[w]['size']
				plighttable[w]={1,1,0.8,0.5*((size-1)/3)}
			elseif (weaponDef.type == 'StarburstLauncher') and Coretrailssd[weaponDef.name] then
				size=WeaponDefs[w]['size']
				plighttable[w]={1,0.2,0.2,2*((size-1)/2)}
			elseif (weaponDef.type == 'StarburstLauncher') and Armtrailssb[weaponDef.name] then
				size=WeaponDefs[w]['size']
				plighttable[w]={0.5,0.5,1,2*((size-1)/2)}
			elseif (weaponDef.type == 'StarburstLauncher') and Tlltrailssb[weaponDef.name] then
				size=WeaponDefs[w]['size']
				plighttable[w]={1,1,0.2,2*((size-1)/2)}
			elseif (weaponDef.type == 'StarburstLauncher') then
				plighttable[w]={1,1,0.8,15*size}
			end
		end
	end
end

function widget:Shutdown()
  widgetHandler:DeregisterGlobal('DrawManager_projectilelights', DrawStatus)
end

local plist = {}
local plistlength = 0
local frame = 0
local x1, y1 = 0, 0
local x2, y2 = Game.mapSizeX, Game.mapSizeZ
local x, y, z, dx, dz, nx, ny, nz, ang
local a, f, h = {}, {}, {}
local effectsDisabled = false

function widget:DrawWorldPreUnit()
	
	if TooHigh or (FPSCount < FPSLimit) or HighPing then 
		return
	end
	
	if frame < spGetGameFrame() then
		frame = spGetGameFrame()
		plist = spGetVisibleProjectiles(-1)
		plistlength = #plist
		--Spring.Echo(plistlength)
	end

	if plistlength == 0 then 
		--dont do anything if there are no projectiles in range of view
		return
	end

	if plistlength >= 650 then  --limits memory usage (laser/lightcannons eat memory for breakfast)
		plistlength = 650
	end

	if plistlength > 250 then
		effectsDisabled = true  --disable debree and lighning/laser effect
	else
		effectsDisabled = false
	end


	--enabling both test and mask means they wont be drawn over cliffs when obscured
	--but also means that they will flicker cause of z-fighting when scrolling around...
	--and ESPECIALLY when overlapping
	-- mask=false and test=true is perfect, no overlap flicker, no cliff overdraw
	--BUT it clips into cliffs from the side....
	glTexture('luaui/images/lightmap.tga') --simple white rectangle with alpha white blurred circle and rounded square
	glDepthMask(false)
	--glDepthMask(true)
	glDepthTest(false)
	--glDepthTest(GL.LEQUAL) 
	
	glBlending("alpha_add") --makes it go into +
	local lightparams
	-- AND NOW FOR THE FUN STUFF!
	local stpX, stpY, stpZ, r,g,b,al, w,nf	-- step in x,y,z axis for beam traversing,  RGBA values of lightparams,  light width, noize factor
	local tx,ty,tz,px,py,pz,bx,bz, fa	-- target's x,y,z coordiantes,  x,y,z Position along the beam,  x,z position from iteration Before, alpha factor
	for i=1, plistlength do
		local pID = plist[i]
		local wproj, pproj = spGetProjectileType(pID)

		if pproj then
			if effectsDisabled == false then
				lightparams = {1.0, 0.8, 0.4, 0.3} -- debree from explosions
			end
		elseif wproj and plighttable[spGetProjectileDefID(pID)] and plighttable[spGetProjectileDefID(pID)][5] == true and effectsDisabled == false then
			lightparams = plighttable[spGetProjectileDefID(pID)] -- beamlaser/lightningcannons projectile
		elseif wproj and plighttable[spGetProjectileDefID(pID)] and plighttable[spGetProjectileDefID(pID)][5] == nil then
			lightparams = plighttable[spGetProjectileDefID(pID)] -- weapon projectile
		end

		if lightparams then	-- there is a light defined for this projectile type
			x, y, z = spGetProjectilePosition(pID)
			if (x and y>0.0) then -- projectile is above water					
				if lightparams[5] and type(lightparams[5])=="boolean" then -- BeamLaser and LightningCannon
					tx,ty,tz = spGetProjectileVelocity(pID)
					if tx then
						local dist = sqrt(tx*tx + tz*tz) -- distance from beam start till beam end
						bx, bz = x+tx, z+tz
						local endSeg = max(4, floor(dist/(100-min(50,abs(spGetGroundHeight(bx,bz)-spGetGroundHeight(x+tx*0.5,z+tz*0.5))))))	-- number of segments used for beam neon, min 4 segments
						stpX, stpY, stpZ = tx/endSeg, ty/endSeg, tz/endSeg
						r,g,b,al,w = lightparams[1], lightparams[2], lightparams[3], lightparams[4], lightparams[6]
						nf = noise[floor(x+z+pID)%10+1]
						glPushMatrix()
						glTranslate(x, 0.0, z)
						glRotate(atan2(tx,tz)*DegToRad, 0.0, 1.0, 0.0)	-- align light with beam direction
						bx,bz, px,py,pz = bx+stpX, bz+stpZ, bx, y+ty, bz
						for i=0, endSeg do	-- calculate the size factor, alpha and terrain height of beam neon segments
							if py>0.0 then
								h[i] = max(0.0,spGetGroundHeight(px,pz))	-- above water beam should show on water surface
								if h[i]>0.0 then
									_,fa = spGetGroundNormal(bx,bz)	-- if the ground is not flat, distance to terrain is not relative altitude
									_,ny = spGetGroundNormal(px,pz)	-- average of current and previous section slope
									ny = 0.5*(ny+fa)
								else
									ny = 1.0	-- ny~1 for flat land and water surface, ny~0 for cliffs
								end
								fa = (100.0+(h[i]-py)*ny)*0.01
								if fa<=0.0626 then	-- if the factor <=0.0626, then alpha<=1/255 which is not visible any more
									a[i] = 0.0			-- but may still cause a segment being rendered, this way we prevent that
									f[i] = 0.0
								else
									a[i] = al*fa*fa*nf
									f[i] = max(12.0, (1.1-fa)*w)
								end
							else
								a[i], f[i], h[i] = 0.0, 0.0, 0.0
							end
							bx,bz, px, py, pz = px,pz, px-stpX, py-stpY, pz-stpZ
						end
						local i, j, dStep, de, gh = 0, 1, -dist/endSeg
						local a0 = a[0]
						if a0>0.0 then	-- neon endcap
							local h0, f0 = h[0], f[0]
							glShape(GL_TRIANGLE_STRIP, {
								{	v={-f0,h0,dist+f0},
									t={0.5,0.0},
									c={r,g,b,a0}
								},
								{	v={-f0,h0,dist},
									t={0.25,0.0},
									c={r,g,b,a0}
								},
								{	v={f0,h0,dist+f0},
									t={0.5,1.0},
									c={r,g,b,a0}
								},
								{	v={f0,h0,dist},
									t={0.25,1.0},
									c={r,g,b,a0}
								},
							})
						end
						a0 = a[endSeg]
						if a0>0.0 then	-- neon startcap
							local h0, f0 = h[endSeg], f[endSeg]
							glShape(GL_TRIANGLE_STRIP, {
								{	v={-f0,h0,0.01},
									t={0.25,0.0},
									c={r,g,b,a0}
								},
								{	v={-f0,h0,-f0},
									t={0.0,0.0},
									c={r,g,b,a0}
								},
								{	v={f0,h0,0.01},
									t={0.25,1.0},
									c={r,g,b,a0}
								},
								{	v={f0,h0,-f0},
									t={0.0,1.0},
									c={r,g,b,a0}
								},
							})
						end
						for d=dist, 0.01, dStep do	-- render segments of beam neon with alpha>0
							a0 = a[i]
							if a0>0.0 or a[j]>0.0 then
								de, gh = d+dStep, h[i]
								glShape(GL_TRIANGLE_STRIP, {
									--[[ segment delimiter, only for debuging
									{	v={-f[j],gh,d},
										t={0.75,0.5},
										c={1.0,1.0,1.0,1.0}
									},
									--]]
									{	v={-f[i],gh,d},
										t={0.875,0.0},
										c={r,g,b,a0}
									},
									{	v={-f[j],h[j],de},
										t={0.625,0.0},
										c={r,g,b,a[j]}
									},
									{	v={0.0,gh,d},
										t={0.875,0.5},
										c={r,g,b,a0}
									},
									{	v={f[j],h[j],de},
										t={0.625,1.0},
										c={r,g,b,a[j]}
									},
									{	v={f[i],gh,d},
										t={0.875,1.0},
										c={r,g,b,a0}
									},
									--[[ segment delimiter, only for debuging
									{	v={f[j],gh,d},
										t={0.75,0.5},
										c={1.0,1.0,1.0,1.0}
									},
									--]]
								})
							end
							i, j = i+1, j+1
						end
						glPopMatrix()
					end
				else	-- other weapons
					local height = max(0, spGetGroundHeight(x, z)) --above water projectiles should show on water surface
					local diff = height-y	-- this is usually 5 for land units, 5+cruisehieght for others
											-- the plus 5 is do that it doesn't clip all ugly like, unneeded with depthtest and mask both false!
											-- diff is negative, cause we need to put the lighting under it
											-- diff defines size and diffusion rate)
					local factor = (100.0+diff)*0.01 --factor=1 at when almost touching ground, factor<=0 when above 100 height)
					if (factor > 0.0626 and factor < 1.0) then		-- if factor is <0.0626 then opacity is <1/255 and not visible any more
						dx, _, dz = spGetProjectileVelocity(pID)
						if dx and (dx*dx + dz*dz > 0.1) then		-- when a projectile hits a target above ground, there's an unaligned flash due to velocity being 0
							glColor(lightparams[1], lightparams[2], lightparams[3], lightparams[4]*factor*factor*noise[floor(x+z+pID)%10+1]) -- attentuation is x^2
							factor = 32*(1.1-factor)
							glPushMatrix()
							nx, ny, nz = spGetGroundNormal(x,z)
							if ny<0.995 then						-- don't align with slope on flat surface, less transformations, faster
								glTranslate(x, y, z)
								ang = min(acos(ny)*DegToRad, 60)	-- deg(x) is 4x slower than x*57.295779513082320876798
								if nx>0.0 or nz>0.45 then ang = ang * -1.0 end	-- east/west slope correction
								glRotate(ang, 0.0, 0.0, 1.0)		-- align to ground slope, rather coarse but fast method
								glRotate(atan2(dx,dz)*DegToRad, 0.0, 1.0, 0.0)	-- align light with projectile direction, needed for slope alignment too
								glTranslate(0,diff,0)				-- make light closer to sloped terrain
								if lightparams[5] then
									glScale(factor*lightparams[6], 1.0, factor*lightparams[5]) -- scale it by thickness, duration and height from ground
									glCallList(listL) -- draw laser cannon light
								else
									glScale(factor, 1.0, factor) -- scale it by size and height from ground
									glCallList(listC) -- draw cannon light
								end					
							else
								glTranslate(x, height, z)
								if lightparams[5] then
									glRotate(atan2(dx,dz)*DegToRad, 0.0, 1.0, 0.0)
									glScale(factor*lightparams[6], 1.0, factor*lightparams[5]) -- scale it by thickness, duration and height from ground
									glCallList(listL) -- draw laser cannon light
								else
									glScale(factor, 1.0, factor) -- scale it by size and height from ground
									glCallList(listC) -- draw cannon light
								end					
							end
							glPopMatrix()
						end
					end
				end
			end
		end
	end

	glTexture(false) --be nice, reset stuff 
	glColor(1.0, 1.0, 1.0, 1.0)
	glBlending(false)
	glDepthTest(true)
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------