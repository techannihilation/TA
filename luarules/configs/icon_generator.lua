 -- $Id: icon_generator.lua 4354 2009-04-11 14:32:28Z licho $
-----------------------------------------------------------------------
-----------------------------------------------------------------------
--
--  Icon Generator Config File
--

--// Info
if (info) then
  local ratios      = {["1to1"]=(1/1)} --{["16to10"]=(10/16), ["1to1"]=(1/1), ["5to4"]=(4/5)} --, ["4to3"]=(3/4)}
  local resolutions = {{128,128}} --{{128,128},{64,64}}
  local schemes     = {""}

  return schemes,resolutions,ratios
end

-----------------------------------------------------------------------
-----------------------------------------------------------------------

--// filename ext
imageExt = ".png"

--// render into a fbo in 4x size
renderScale = 4

--// faction colors (check (and needs) LuaRules/factions.lua)
factionTeams = {
  arm     = 0,   --// arm
  core    = 1,   --// core
  tll     = 2,   --// tll
  unknown = 3,   --// unknown
}
factionColors = {
  arm     = {0, 0, 1},   --// arm
  core    = {1, 0, 0},   --// core
  tll     = {1,1,0},   --// chicken
  unknown = {0, 1, 0},   --// unknown
}


-----------------------------------------------------------------------
-----------------------------------------------------------------------

--// render options textured
textured = (scheme~="bw")
lightAmbient = {1,1,1}
lightDiffuse = {0,0,0}
lightPos     = {-0.3,0.5,0.6}

--// Ambient Occlusion & Outline settings
aoPower     = ((scheme=="bw") and 1.5) or 1
aoContrast  = ((scheme=="bw") and 2.5) or 1
aoTolerance = 0
olContrast  = ((scheme=="bw") and 5) or 10
olTolerance = 0

--// halo (white)
halo  = false --(scheme~="bw")


-----------------------------------------------------------------------
-----------------------------------------------------------------------

--// backgrounds
background = true
local function Greater30(a)     return a>30;  end
local function GreaterEq15(a)   return a>=15; end
local function GreaterZero(a)   return a>0;   end
local function GreaterEqZero(a) return a>=0;  end
local function GreaterFour(a)   return a>4;   end
local function LessEqZero(a)    return a<=0;  end
local function IsCoreOrChicken(a)
	if a then return a.chicken
	else return false end
end
backgrounds = {

--//subs
  {check={waterline=GreaterEq15,minWaterDepth=GreaterZero},  texture="LuaRules/Images/IconGenBkgs/water.png"},
  {check={floatOnWater=false,minWaterDepth=GreaterFour},          texture="LuaRules/Images/IconGenBkgs/water.png"},
--//sea
  {check={floatOnWater=true,minWaterDepth=GreaterZero},           texture="LuaRules/Images/IconGenBkgs/water.png"},
  
  {check={canFly=true},                                                 texture="LuaRules/Images/IconGenBkgs/sky.png"},
}


-----------------------------------------------------------------------
-----------------------------------------------------------------------

--// default settings for rendering
--//zoom   := used to make all model icons same in size (DON'T USE, it is just for auto-configuration!)
--//offset := used to center the model in the fbo (not in the final icon!) (DON'T USE, it is just for auto-configuration!)
--//rot    := facing direction
--//angle  := topdown angle of the camera (0 degree = frontal, 90 degree = topdown)
--//clamp  := clip everything beneath it (hide underground stuff)
--//scale  := render the model x times as large and then scale down, to replaces missing AA support of FBOs (and fix rendering of very tine structures like antennas etc.))
--//unfold := unit needs cob to unfolds
--//move   := send moving cob events (works only with unfold)
--//attack := send attack cob events (works only with unfold)
--//shotangle := vertical aiming, useful for arties etc. (works only with unfold+attack)
--//wait   := wait that time in gameframes before taking the screenshot (default 300) (works only with unfold)
--//border := free space around the final icon (in percent/100)
--//empty  := empty model (used for fake units in CA)
--//attempts := number of tries to scale the model to fit in the icon

defaults = {unfold=true, attack=true, border=0.05, angle=30, rot="right", clamp=-10000, scale=2, empty=false, attempts=10, wait=300, zoom=1.0, offset={0,0,0},};


-----------------------------------------------------------------------
-----------------------------------------------------------------------

unitConfigs = {
--  [UnitDefNames.eartytank.id]  = { wait = 30 },
}

for i=1,#UnitDefs do
  if (UnitDefs[i].canFly) then
    if (unitConfigs[i]) then
      if (unitConfigs[i].unfold ~= false) then
        unitConfigs[i].unfold = true
        unitConfigs[i].move   = true
      end
    else
      unitConfigs[i] = {unfold = true, move = true}
    end
  elseif (UnitDefs[i].canKamikaze) then
    if (unitConfigs[i]) then
      if (not unitConfigs[i].border) then
        unitConfigs[i].border = 0.156
      end
    else
      unitConfigs[i] = {border = 0.156}
    end
  end
end