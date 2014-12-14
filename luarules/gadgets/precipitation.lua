--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    precipitation.lua
--  brief:   precipitation shader gadget
--  author:  Dave Rodgers
--
--  Copyright (C) 2007.
--  Licensed under the terms of the GNU GPL, v2 or later.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "Precipitation, v0.3",
    desc      = "Precipitation shader gadget",
    author    = "trepan, and others",
    date      = "August 27, 2009",
    license   = "GNU GPL, v2 or later",
    layer     = -24,
    enabled   = true  --  loaded by default?
  }
end

-------------------------------------------------------------------------------
--------------------------------------------------------------------------------
if (gadgetHandler:IsSyncedCode()) then
	return false
else

local particleType = 2 -- 1 for rain, 2 for snow, 3 for clouds (when they finally work)
--local particleDensity = 50 * 1024  -- how many particles?  Limit for performance!

--Rain Color Control
local function ColorFunc()
	local rainColorR = 0.0
	local rainColorG = math.random(2,10)/10
	local rainColorB = 1.0
	local rainAlpha = 0.5
	return rainColorR,rainColorG,rainColorB,rainAlpha
end

--particleOne
local particleOneGravity = 75 -- how fast does it fall?
local particleOneDriftX = -10 -- how fast does it move on the X axis?  Can be positive or negative.
local particleOneDriftZ = -10 -- how fast does it move on the Z axis?  Can be positive or negative.
local particleOneTexture = 'LuaRules/Images/snowflake.tga'  -- what bitmap are we using?
local particleOneScale = 6000  -- scale, see GLSL for details

local particleTwoGravity = 65 -- how fast does it fall?
local particleTwoDriftX = -20 -- how fast does it move on the X axis?  Can be positive or negative.
local particleTwoDriftZ = 10 -- how fast does it move on the Z axis?  Can be positive or negative.
local particleTwoTexture = 'LuaRules/Images/snowflake.tga'   -- what bitmap are we using?
local particleTwoScale = 6000  -- scale, see GLSL for details

local particleThreeGravity = 85 -- how fast does it fall?
local particleThreeDriftX = -30 -- how fast does it move on the X axis?  Can be positive or negative.
local particleThreeDriftZ = 10 -- how fast does it move on the Z axis?  Can be positive or negative.
local particleThreeTexture = 'LuaRules/Images/snowflake.tga'  -- what bitmap are we using?
local particleThreeScale = 6000  -- scale, see GLSL for details

local cloudTextureOne = 'bitmaps/dust01.tga'  -- what bitmap are we using?
local cloudTextureTwo = 'bitmaps/dust02.tga'  -- what bitmap are we using?
local cloudTextureThree = 'bitmaps/dust03.tga'  -- what bitmap are we using?

local math_random = math.random
local math_randomseed = math.randomseed

local enabled 
local shader
local rainshader
local shaderTimeLoc
local shaderCamPosLoc
local shaderScaleLoc
local shaderSpeedLoc

local startTimer = Spring.GetTimer()
local diffTime = 0

local rainparticleOneList
local rainparticleTwoList
local rainparticleThreeList

local particleDensity 	= Game.tidal * 1024
local rainScale 	= 5000
local rainSpeed 	= 30
local rainTexture 	= 'LuaRules/Images/snowflake2.tga'

local firstPos = 0
local secondPos = 0
local thirdPos = 0
local camX,camY,camZ

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--OpenGL stuff.
	local glBeginEnd           = gl.BeginEnd
	local glVertex = gl.Vertex
	local glColor              = gl.Color
	local glBlending           = gl.Blending
	local glTranslate          = gl.Translate
	local glCallList = gl.CallList
	local glDepthTest          = gl.DepthTest
	local glCreateList         = gl.CreateList
	local glDeleteList         = gl.DeleteList
	local glTexture            = gl.Texture
	local glGetShaderLog       = gl.GetShaderLog
	local glCreateShader       = gl.CreateShader
	local glDeleteShader       = gl.DeleteShader
	local glUseShader          = gl.UseShader
	local glUniformMatrix      = gl.UniformMatrix
	local glUniformInt         = gl.UniformInt
	local glUniform            = gl.Uniform
	local glGetUniformLocation = gl.GetUniformLocation
	local glGetActiveUniforms  = gl.GetActiveUniforms
	local glBeginEnd = gl.BeginEnd
	local glPointSprite = gl.PointSprite
	local glPointSize = gl.PointSize
	local glPointParameter = gl.PointParameter
	local glResetState = gl.ResetState
	local GL_POINTS = GL.POINTS

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function gadget:Shutdown()
	--glDeleteList(particleOneSubList)
	glDeleteList(particleOneList)
end

local function CreateParticleOneList()
  particleOneList = gl.CreateList(function()
    local tmpRand = math.random()
    math.randomseed(1)
    gl.BeginEnd(GL.POINTS, function()
      for i = 1, particleDensity do
        local x = math.random()
        local y = math.random()
        local z = math.random()
        local w = math.random()
        gl.Vertex(x, y, z, w)
      end
    end)
    math.random(1e9 * tmpRand)
  end)
end

local function CreateParticleTwoList()
  particleTwoList = gl.CreateList(function()
    local tmpRand = math.random()
    math.randomseed(2)
    gl.BeginEnd(GL.POINTS, function()
      for i = 1, particleDensity do
        local x = math.random()
        local y = math.random()
        local z = math.random()
        local w = math.random()
        gl.Vertex(x, y, z, w)
      end
    end)
    math.random(1e9 * tmpRand)
  end)
end

local function CreateParticleThreeList()
  particleThreeList = gl.CreateList(function()
    local tmpRand = math.random()
    math.randomseed(3)
    gl.BeginEnd(GL.POINTS, function()
      for i = 1, particleDensity do
        local x = math.random()
        local y = math.random()
        local z = math.random()
        local w = math.random()
        gl.Vertex(x, y, z, w)
      end
    end)
    math.random(1e9 * tmpRand)
  end)
end

local function CreateCloudList()
	cloudOneList = gl.CreateList(function()

    gl.BeginEnd(GL.POINTS, function()
glVertex(-30,0,40)
glVertex(-40,30,-20)
glVertex(-40,-20,0)
glVertex(-30,-40,30)
glVertex(-30,10,-20)
glVertex(-20,0,-20)
glVertex(-10,-20,-30)
glVertex(-20,50,50)
glVertex(-20,40,0)
glVertex(-20,-30,40)
glVertex(-30,-50,10)
glVertex(30,10,30)
glVertex(30,-30,10)
glVertex(20,-10,40)
glVertex(20,-50,30)
glVertex(30,50,-10)
glVertex(20,20,-20)
glVertex(20,-20,10)
glVertex(0,70,-50)
glVertex(0,-40,30)
glVertex(0,-10,10)
glVertex(0,-20,-20)
glVertex(0,-60,50)
glVertex(0,-40,0)
glVertex(0,-30,80)
glVertex(0,20,0)
glVertex(0,40,60)
glVertex(0,-20,30)
    end)
  end)
end


local function CreateRainDrops()
  rainparticleOneList = glCreateList(function()
    local tmpRand = math_random()
    math_randomseed(6)
    glBeginEnd(GL.LINES, function()
      for i = 1, particleDensity do
        local x = math_random(-3000,3000)
        local y = math_random(-5000,10000)
        local z = math_random(-3000,3000)
	glColor(ColorFunc())
	glVertex(x,y,z)
	glVertex(x,y- math_random(20,40),z)
      end
    end)
    math_random(1e9 * tmpRand)
  end)

  rainparticleTwoList = glCreateList(function()
    local tmpRand = math_random()
    math_randomseed(6)
    glBeginEnd(GL.LINES, function()
      for i = 1, particleDensity do
        local x = math_random(-3000,3000)
        local y = math_random(-5000,20000)
        local z = math_random(-3000,3000)
	glColor(ColorFunc())
	glVertex(x,y,z)
	glVertex(x,y- math_random(20,40),z)
      end
    end)
    math_random(1e9 * tmpRand)
  end)

  rainparticleThreeList = glCreateList(function()
    local tmpRand = math_random()
    math_randomseed(6)
    glBeginEnd(GL.LINES, function()
      for i = 1, particleDensity do
        local x = math_random(-3000,3000)
        local y = math_random(-5000,30000)
        local z = math_random(-3000,3000)
	glColor(ColorFunc())
	glVertex(x,y,z)
	glVertex(x,y- math_random(20,40),z)
      end
    end)
    math_random(1e9 * tmpRand)
  end)

  if (rainparticleOneList == nil) then
    return false
  end
  return true
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:Initialize()
	if (glCreateShader == nil) then
		Spring.Echo("[Weather Particles:Initialize] no shader support")
		gadgetHandler:RemoveGadget()
		return
    end	

	shader = glCreateShader({

    vertex = [[
		uniform float time;
		uniform float scale;
		uniform vec3 speed;
		uniform vec3 camPos;
		void main(void)
		{
		vec3 scalePos = vec3(gl_Vertex) * scale;

		gl_FrontColor = vec4(0.8,0.8,0.9,0.0 + 0.8 * cos(scalePos.y));

		vec3 pos = scalePos - mod(camPos, scale);
		pos.y -= time * 0.5 * (speed.x * (2.0 + gl_Vertex.w));
		pos.x += (sin(time)*10.0) + (time * speed.y);
		pos.z += (cos(time)*10.0) + (time * speed.z);
		pos = mod(pos, scale) - (scale * 0.5) + camPos;
		if (pos.y < 0.0) {
		  	gl_FrontColor *= 1.0 + 2.0 * (pos.y / scale);
		  	pos.y = 0.0;
		}
		vec4 eyePos = gl_ModelViewMatrix * vec4(pos, 1.0);
				
		gl_PointSize = (1.0 + gl_Vertex.w) * 5000.0 / length(eyePos);

		gl_Position = gl_ProjectionMatrix * eyePos;
		}
	]],
	uniform = {
		time   = diffTime,
		scale  = 0,
		speed  = {0,0,0},
		camPos = {0,0,0},
    		},
  	})

rainshader = glCreateShader({
    vertex = [[
		void main(void)
		{
			gl_FrontColor = gl_Color;
			gl_Position = ftransform();
		}
	]],
  	})

cloudshader = glCreateShader({
    vertex = [[
		uniform vec3 camPos;
		void main(void)
		{
		
		//float myLength = distance(gl_Vertex.xyz, camPos.xyz);
		//gl_PointSize = 100.0 / myLength / 1000;
		gl_Position = ftransform();

		}
	]],
	uniform = {
		camPos = {0,0,0},
    		},
  	})

	if (shader == nil) then
		Spring.Echo("[Weather Particles:Initialize] particle shader compilation failed")
		Spring.Echo(glGetShaderLog())
		gadgetHandler:RemoveGadget()
		return
	end

	if (rainshader == nil) then
		Spring.Echo("[Weather Particles:Initialize] rain shader compilation failed")
		Spring.Echo(glGetShaderLog())
		gadgetHandler:RemoveGadget()
		return
	end

	if (cloudshader == nil) then
		Spring.Echo("[Weather Particles:Initialize] cloud shader compilation failed")
		Spring.Echo(glGetShaderLog())
		gadgetHandler:RemoveGadget()
		return
	end
	
	shaderTimeLoc   = glGetUniformLocation(shader, 'time')
	shaderCamPosLoc = glGetUniformLocation(shader, 'camPos')

	shaderScaleLoc   = glGetUniformLocation(shader, 'scale')
	shaderSpeedLoc = glGetUniformLocation(shader, 'speed')

	cloudShaderCamPosLoc = glGetUniformLocation(cloudshader, 'camPos')

	CreateParticleOneList()
	CreateParticleTwoList()
	CreateParticleThreeList()
	CreateCloudList()
	CreateRainDrops()

	Spring.Echo("Finished Snow / Rain Shader")
end



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function gadget:DrawWorld()
	if (not enabled) then
		--return
	end
    


	if particleType == 1 then
		camX,camY,camZ = Spring.GetCameraPosition()
		glDepthTest(GL.LEQUAL)
		glBlending(GL.SRC_ALPHA, GL.ONE)
		gl.DepthMask(false)
		glUseShader(rainshader)

		firstPos = firstPos - particleOneGravity
		if firstPos <= camY-10000 then
			firstPos = camY + 100
		end
	
		gl.Translate(camX,firstPos,camZ)
		glCallList(rainparticleOneList)
		
		secondPos = secondPos - particleTwoGravity
		if secondPos <= camY-20000 then
			secondPos = camY + 300
		end
		gl.Translate(camX,secondPos,camZ)
		glCallList(rainparticleTwoList)


		thirdPos = thirdPos - particleThreeGravity
		if thirdPos <= camY-30000 then
			thirdPos = camY + 500
		end
		gl.Translate(camX,thirdPos,camZ)
		glCallList(rainparticleThreeList)
	end

	if particleType == 2 then
		glUseShader(shader)	
		camX,camY,camZ = Spring.GetCameraPosition()
		diffTime = Spring.DiffTimers(Spring.GetTimer(), startTimer)
		--Spring.Echo(diffTime,camX,camY,camZ)
		glUniform(shaderTimeLoc,diffTime * 1)
		glUniform(shaderCamPosLoc, camX, camY, camZ)

		glDepthTest(true)
		glBlending(GL.SRC_ALPHA, GL.ONE)
		
		gl.PointSprite(true, true)
		gl.PointSize(10.0)
		gl.PointParameter(0, 0, 0.001, 0, 1e9, 1)
		
		glTexture(particleOneTexture)
		glUniform(shaderScaleLoc,  particleOneScale)
		glUniform(shaderSpeedLoc, particleOneGravity,particleOneDriftX, particleOneDriftZ)
		glCallList(particleOneList)	
		
	
		glTexture(particleTwoTexture)
		glUniform(shaderScaleLoc, particleTwoScale)
		glUniform(shaderSpeedLoc, particleTwoGravity, particleTwoDriftX, particleTwoDriftZ)
		glCallList(particleTwoList)

		glTexture(particleThreeTexture)
		glUniform(shaderScaleLoc, particleThreeScale)
		glUniform(shaderSpeedLoc, particleThreeGravity, particleThreeDriftX, particleThreeDriftZ)
		glCallList(particleThreeList)
	end

	if particleType == 3 then
		glColor(1.0,1.0,1.0,1.0)
		glUseShader(cloudshader)
		camX,camY,camZ = Spring.GetCameraPosition()
		glUniform(cloudShaderCamPosLoc, camX, camY, camZ)
		diffTime = Spring.DiffTimers(Spring.GetTimer(), startTimer)

		--glUniform(shaderTimeLoc,diffTime * 1)
		glDepthTest(true)
		--glTexture(cloudTextureThree)
		glBlending(GL.SRC_ALPHA, GL.ONE)
		
		gl.PointSprite(true, true)
		gl.PointSize(1)
		gl.PointParameter(0, 0, 0, 0, 1, 1)
		gl.Translate(500,1500,500)
		glCallList(cloudOneList)
	end

	gl.PointParameter(1, 0, 0, 0, 1e9, 1)
	gl.PointSize(1.0)
	gl.PointSprite(false, false)
	glResetState()
	glUseShader(0)
end

end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
