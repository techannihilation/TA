-- $Id: featuredefs_post.lua 3171 2008-11-06 09:06:29Z det $
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    featuredefs_post.lua
--  brief:   featureDef post processing
--  author:  Dave Rodgers
--  author:  lurker & jK, heavily modead by TA devs
--
--  Copyright (C) 2008,2009.
--  Licensed under the terms of the GNU GPL, v2 or later.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


local function isbool(x)   return (type(x) == 'boolean') end
local function istable(x)  return (type(x) == 'table')   end
local function isnumber(x) return (type(x) == 'number')  end
local function isstring(x) return (type(x) == 'string')  end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  Per-unitDef featureDefs
--
local UnitDefs = DEFS.unitDefs

local function defaultDamageFunc(ud, coef)
	--nonlinear scaling, makes the the wrecks of low hitpoints units stronger and opposite for strong unit
	bT = 5000 -- threshold, damage values above this value will be lowered, and below increased
	bC = 0.75 -- smoothing coef, 1 won't make any change to the damage, 0 on the other hand, will force the value to be very close to the threshold
	return ((ud.maxdamage / bT) ^ bC) * bT * coef
end

local function defaultMetalFunc(ud, coef)
	return ud.buildcostmetal * coef
end

local featureConfig = 
{
[0] = {
	suffix = " Wreckage", 
	damageFunc = function(ud) 
		return defaultDamageFunc(ud, 0.8)
	end, 
	metalFunc = function(ud) 
		return defaultMetalFunc(ud, 0.75)
	end, 
	}, --dead
[1] = {
	suffix = " Debris", 
	damageFunc = function(ud) 
		return defaultDamageFunc(ud, 1)
	end, 
	metalFunc = function(ud) 
		return defaultMetalFunc(ud, 0.4)
	end, 
	}, --heap ~ dead wreckage
[2] = {
	suffix = " Metal Shards", 
	damageFunc = function(ud) 
		return defaultDamageFunc(ud, 0.5)
	end, 
	metalFunc = function(ud) 
		return defaultMetalFunc(ud, 0.25)
	end, 
	}, --heap2 ~ dead heap
[3] = {
	suffix = " Metal Dust", 
	damageFunc = function(ud) 
		return defaultDamageFunc(ud, 0.4)
	end, 
	metalFunc = function(ud) 
		return defaultMetalFunc(ud, 0.10)
	end, 
	} --heap3 ~ dead heap2
	
-- deeper nesting wont't be accepted
}

local skipUnits = {
	['cormaw'] = true,
	['cordrag'] = true,
	['corfdrag'] = true,
	['corfort'] = true,
	
	['armclaw'] = true,
	['armdrag'] = true,
	['armfdrag'] = true,
	['armfort'] = true,
	
	['tlldtns'] = true,
	['tlladt'] = true,
	['tlldt'] = true,
	
}



local function processFeature(fname, ud, level)
	
	
	config = featureConfig[level]
	if config then
		-- accept only meaningful levels
		fd = FeatureDefs[fname]
		fd.description = (ud.name or "Mysterious") .. config.suffix
		
		if ud.category:find("COMMANDER") then
			return
		end
		
		fd.damage = config.damageFunc(ud)
		fd.metal = config.metalFunc(ud)
	end
end

local function recursiveHeap(fd, ud, heapLevel)
	if isstring(fd.featuredead) then
		fname = fd.featuredead
		innerFd = FeatureDefs[fname]
		--Spring.Echo(innerFd)
		if innerFd then
			-- unitfeature has some featureDead
			processFeature(fname, ud, heapLevel)
			recursiveHeap(innerFd, ud, heapLevel + 1)
		end
		
	end
end

local function processUnitFeatures(ud)
	if skipUnits[ud.unitname or ""] then
		return
	end
	
	--Spring.Echo("PUF")
	if (isstring(ud.corpse) and istable(ud.featuredefs)) then
		fname = ud.corpse
		fd = FeatureDefs[fname]
	--	Spring.Echo(fd)
		if (fd) then
			-- unit has some corpse
			if (ud.corpse:lower():find("heap")) then
				-- lets treat that corpse as a heap
				processFeature(fname, ud, 1)
			else
				-- or as a dead (by default)
				processFeature(fname, ud, 0)
			end
			recursiveHeap(fd, ud, 1)
		end
	end
end


local function ProcessUnitDef(udName, ud)

  local fds = ud.featuredefs
  if (not istable(fds)) then
    return
  end

  -- add this unitDef's featureDefs
  for fdName, fd in pairs(fds) do
    if (isstring(fdName) and istable(fd)) then
      local fullName = udName .. '_' .. fdName
      FeatureDefs[fullName] = fd
      fd.filename = ud.filename
    end
  end

  -- FeatureDead name changes
  for fdName, fd in pairs(fds) do
    if (isstring(fdName) and istable(fd)) then
      if (isstring(fd.featuredead)) then
        local fullName = udName .. '_' .. fd.featuredead:lower()
        if (FeatureDefs[fullName]) then
          fd.featuredead = fullName
        end
      end
    end
  end

  -- convert the unit corpse name
  if (isstring(ud.corpse)) then
    local fullName = udName .. '_' .. ud.corpse:lower()
    local fd = FeatureDefs[fullName]
    if (fd) then
      ud.corpse = fullName
    end
  end

  processUnitFeatures(ud)
 
end


--------------------------------------------------------------------------------
-- Process the unitDefs




for udName, ud in pairs(UnitDefs) do
  if (isstring(udName) and istable(ud)) then
    ProcessUnitDef(udName, ud)
  end
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------