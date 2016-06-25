local Commanders = {
	["corcom"] = true,
	["corcom1"] = true,
	["corcom3"] = true,
	["corcom5"] = true,
	["corcom6"] = true,
	["corcom7"] = true,
	["armcom"] = true,
	["armcom1"] = true,
	["armcom4"] = true,
	["armcom5"] = true,
	["armcom6"] = true,
	["armcom7"] = true,
	["tllcom"] = true,
	["tllcom3"] = true,
	["tllcom5"] = true,
	["tllcom6"] = true,
	["tllcom7"] = true,
}

local WTimeUnits = {
	arm = {
		["armaap"] = true,
		["armaca"] = true,
		["armack"] = true,
		["armacsub"] = true,
		["armacv"] = true,
		["armalab"] = true,
		["armap"] = true,
		["armasp"] = true,
		["armasy"] = true,
		["armavp"] = true,
		["armbeaver"] = true,
		["armblab"] = true,
		["armca"] = true,
		["armcarry"] = true,
		["armch"] = true,
		["armck"] = true,
		["armcom"] = true,
		["armcom1"] = true,
		["armcom4"] = true,
		["armcom5"] = true,
		["armcom6"] = true,
		["armcom7"] = true,
		["armcp"] = true,
		["armcs"] = true,
		["armcsa"] = true,
		["armcspid"] = true,
		["armcv"] = true,
		["armesy"] = true,
		["armevp"] = true,
		["armfark"] = true,
		["armfark1"] = true,
		["armfhp"] = true,
		["armgant"] = true,
		["armhcar"] = true,
		["armfnanotc"] = true,
		["armfnanotc1"] = true,
		["armfnanotc2"] = true,
		["armfnanotc3"] = true,
		["armhp"] = true,
		["armlab"] = true,
		["armmechl"] = true,
		["armmls"] = true,
		["armmlspd"] = true,
		["armmlv"] = true,
		["armnanotc"] = true,
		["armnanotc1"] = true,
		["armnanotc2"] = true,
		["armnanotc3"] = true,
		["armplat"] = true,
		["armrecl"] = true,
		["armrectr"] = true,
		["armrezspd"] = true,
		["armshltx"] = true,
		["armshltx1"] = true,
		["armsy"] = true,
		["armtick"] = true,
		["armvp"] = true,
		["aahp"] = true,
		["aahpns"] = true,
		["aach"] = true,
		["abuilderlvl1"] = true,
		["abuilderlvl2"] = true,
		["abuilderlvl3"] = true,
		["acovertopscentre"] = true,
		["ananotower"] = true,
		["ashipyardlvl3"] = true,
		["asubpen"] = true,
		["consul1"] = true,
		["spiderlab"] = true,
		["armeap"] = true,
	},
	core = {
		["coraap"] = true,
		["coraca"] = true,
		["corack"] = true,
		["coracsub"] = true,
		["coracv"] = true,
		["coralab"] = true,
		["corap"] = true,
		["corasp"] = true,
		["corasy"] = true,
		["coravp"] = true,
		["corca"] = true,
		["corcarry"] = true,
		["corch"] = true,
		["corck"] = true,
		["corcom"] = true,
		["corcom1"] = true,
		["corcom3"] = true,
		["corcom5"] = true,
		["corcom6"] = true,
		["corcom7"] = true,
		["corcs"] = true,
		["corcsa"] = true,
		["corcv"] = true,
		["corehpad"] = true,
		["coresy"] = true,
		["corevp"] = true,
		["corfast"] = true,
		["corfast1"] = true,
		["corfhp"] = true,
		["corgant"] = true,
		["corgant1"] = true,
		["corhcar"] = true,
		["corfnanotc"] = true,
		["corfnanotc1"] = true,
		["corfnanotc2"] = true,
		["corfnanotc3"] = true,
		["corhp"] = true,
		["corjurgen"] = true,
		["corlab"] = true,
		["cormls"] = true,
		["cormlv"] = true,
		["cormuskrat"] = true,
		["cornanotc"] = true,
		["cornanotc1"] = true,
		["cornanotc2"] = true,
		["cornanotc3"] = true,
		["cornecro"] = true,
		["corplat"] = true,
		["correcl"] = true,
		["corsy"] = true,
		["corvp"] = true,
		["cahp"] = true,
		["cahpns"] = true,
		["cach"] = true,
		["cbuilderlvl1"] = true,
		["cbuilderlvl2"] = true,
		["cbuilderlvl3"] = true,
		["ccovertopscentre"] = true,
		["cnanotower"] = true,
		["commando"] = true,
		["corassis"] = true,
		["cshipyardlvl4"] = true,
		["csubpen"] = true,
		["coreap"] = true,
	},
	tll = {
		["tllaap"] = true,
		["tllaca"] = true,
		["tllack"] = true,
		["tllacs"] = true,
		["tllacsub"] = true,
		["tllacv"] = true,
		["tllalab"] = true,
		["tllap"] = true,
		["tllarchnano"] = true,
		["tllasp"] = true,
		["tllaspns"] = true,
		["tllasy"] = true,
		["tllavp"] = true,
		["tllca"] = true,
		["tllchover"] = true,
		["tllck"] = true,
		["tllcom"] = true,
		["tllcom3"] = true,
		["tllcom5"] = true,
		["tllcom6"] = true,
		["tllcom7"] = true,
		["tllcs"] = true,
		["tllcsa"] = true,
		["tllcsub"] = true,
		["tllcv"] = true,
		["tllevp"] = true,
		["tllgiant"] = true,
		["tllfnanotc"] = true,
		["tllfnanotc1"] = true,
		["tllfnanotc2"] = true,
		["tllhp"] = true,
		["tllhpns"] = true,
		["tllhtcb"] = true,
		["tllhtcp"] = true,
		["tlllab"] = true,
		["tllnanotc"] = true,
		["tllnanotc1"] = true,
		["tllnanotc2"] = true,
		["tllplat"] = true,
		["tllsham"] = true,
		["tllsubpen"] = true,
		["tllsy"] = true,
		["tllvp"] = true,
	}
}
	
local Nanos = {
	armnanotc = true,
	armnanotc1 = true,
	armnanotc2 = true,
	armnanotc3 = true,
	cornanotc = true,
	cornanotc1 = true,
	cornanotc2 = true,
	cornanotc3 = true,
	tllnanotc = true,
	tllnanotc1 = true,
	tllnanotc2 = true,	
	armfnanotc = true,
	armfnanotc1 = true,
	armfnanotc2 = true,
	armfnanotc3 = true,
	corfnanotc = true,
	corfnanotc1 = true,
	corfnanotc2 = true,
	corfnanotc3 = true,
	tllfnanotc = true,
	tllfnanotc1 = true,
	tllfnanotc2 = true,
}


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
-- ud.customparams IS NEVER NIL
--[[
for _, ud in pairs(UnitDefs) do
    if not ud.customparams then
        ud.customparams = {}
    end
 end
 --]]
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


if (Spring.GetModOptions) then
	local modOptions = Spring.GetModOptions()
	
--------------------------------------------------------------------------------
----Set com options
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--

if (modOptions.mo_transportenemy == "notcoms") then
  for name,ud in pairs(UnitDefs) do  
    if Commanders[ud.unitname] then
      ud.transportbyenemy = false
    end
  end
  elseif (modOptions.mo_transportenemy == "none") then
    for name, ud in pairs(UnitDefs) do  
      ud.transportbyenemy = false
    end
end  

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--

   if (modOptions.mo_storageowner == "com") then
    for name, ud in pairs(UnitDefs) do  
     if (name == "armcom" or name == "corcom" or name =="tllcom") then
      ud.energyStorage = modOptions.startenergy or 1000
      ud.metalStorage = modOptions.startmetal or 1000
     end
    end
   end

	for name, ud in pairs(UnitDefs) do  
		if (not Commanders[ud.unitname]) then
			ud.mass = math.max(ud.maxdamage / 6.0, ud.buildcostmetal)
		end
	end

--VFS.Include("gamedata/unitdefs_post_save_to_customparams.lua")

end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--[[
      
        --[[

local WorkerTimeThresholds = { 
	g = {
		{wt = 2000,		color={r = 0.8, g = 1.0, 	b = 0.8}},
		{wt = 1000,		color={r = 0.5, g = 0.9, 	b = 0.5}},
		{wt = 250, 		color={r = 0.2, g = 0.6, 	b = 0.2}},
		{wt = 0, 		color={r = 0.0, g = 0.4, 	b = 0.0}}
	},
	b = {
		{wt = 2000,		color={r = 0.8, g = 1.0, 	b = 1.0}},
		{wt = 1000,		color={r = 0.5, g = 0.85, 	b = 0.85}},
		{wt = 250, 		color={r = 0.2, g = 0.55, 	b = 0.55}},
		{wt = 0, 		color={r = 0.0, g = 0.35, 	b = 0.35}}
	},
	y = {
		{wt = 2000,		color={r = 1.0, g = 1.0, 	b = 0.8}},
		{wt = 1000,		color={r = 0.85, g = 0.85, 	b = 0.5}},
		{wt = 250, 		color={r = 0.55, g = 0.55, 	b = 0.2}},
		{wt = 0, 		color={r = 0.35, g = 0.35, 	b = 0.0}}
	},
	w = {
		{wt = 2000,		color={r = 1.0, g = 1.0, 	b = 1.0}},
		{wt = 1000,		color={r = 0.8, g = 0.8, 	b = 0.8}},
		{wt = 250, 		color={r = 0.5, g = 0.5, 	b = 0.5}},
		{wt = 0, 		color={r = 0.3, g = 0.3, 	b = 0.3}}
	}
}
local NanoCoefs = {
	reclaimCoef = 0.832,
	repairCoef = 0.875
}

function WorkerTimeThresholds:getColor(wt, c)
	local nearestHigherT, nearestLowerT

	for _, v in ipairs(self[c]) do
		if (wt >= v.wt) then
			nearestLowerT = v
			break
		end
		nearestHigherT = v
	end
	
	if not nearestLowerT then 
		nearestLowerT = self[c][#(self[c])]
	end
	
	local rel
	if not nearestHigherT then 
		nearestHigherT = nearestLowerT 
		rel = 0
	else
		rel = (wt - nearestLowerT.wt) / (nearestHigherT.wt -  nearestLowerT.wt)
	end
	
	return 
		(nearestLowerT.color.r + rel * (nearestHigherT.color.r - nearestLowerT.color.r)), 
		(nearestLowerT.color.g + rel * (nearestHigherT.color.g - nearestLowerT.color.g)), 
		(nearestLowerT.color.b + rel * (nearestHigherT.color.b - nearestLowerT.color.b))
end


-- Setting nanocolor
for name, ud in pairs(UnitDefs) do
	if ((ud.workertime or 0) > 0) then
		udwt = ud.workertime
		if(Nanos[ud.unitname]) then
			ud.repairspeed = math.pow(udwt, NanoCoefs.repairCoef)
			ud.reclaimspeed = math.pow(udwt, NanoCoefs.reclaimCoef)
		end
		if(WTimeUnits.tll[ud.unitname]) then
			ud.nanocolor = {WorkerTimeThresholds:getColor(udwt, "y")}
		elseif (WTimeUnits.core[ud.unitname]) then
			ud.nanocolor = {WorkerTimeThresholds:getColor(udwt, "b")}
		elseif (WTimeUnits.arm[ud.unitname]) then
			ud.nanocolor = {WorkerTimeThresholds:getColor(udwt, "g")}
		else
			ud.nanocolor = {WorkerTimeThresholds:getColor(udwt, "w")}
		end
	end
end

--Needed for Unit Wiki
for name, ud in pairs(UnitDefs) do
		if ud.buildpic then
		  ud.customparams.buildpic = ud.buildpic
		end
end


for name, ud in pairs(UnitDefs) do
	if ud.turnrate and (ud.movementclass and (ud.movementclass:find("TANK",1,true))) and ud.turnrate < 250 then
		Spring.Echo("low turnate in unit ",name,ud.turnrate)
	end
end
--]]

for name, ud in pairs(UnitDefs) do
	if (ud.sfxtypes == nil) then
		ud.sfxtypes = {}
	end
	ud.sfxtypes["pieceExplosionGenerators"] = {}
	ud.sfxtypes["pieceExplosionGenerators"][1] = [[piecetrail0]]
	ud.sfxtypes["pieceExplosionGenerators"][2] = [[piecetrail1]]
	ud.sfxtypes["pieceExplosionGenerators"][3] = [[piecetrail2]]
	ud.sfxtypes["pieceExplosionGenerators"][4] = [[piecetrail3]]
	ud.sfxtypes["pieceExplosionGenerators"][5] = [[piecetrail4]]
	ud.sfxtypes["pieceExplosionGenerators"][6] = [[piecetrail5]]
end

--[[
for name, ud in pairs(UnitDefs) do
	if ud.damagemodifier then
		  Spring.Echo("## [" .. ud.name .. "](" .. ud.unitname .. ")")
		  if ud.buildpic then
			  Spring.Echo("![](https://github.com/n3wm1nd/TA/raw/master/unitpics/" .. string.lower(ud.buildpic) ..")")
		  else 
		  	  Spring.Echo("![](https://github.com/n3wm1nd/TA/raw/master/unitpics/" .. ud.unitname ..".png)")
		  end
		  Spring.Echo("")
		  Spring.Echo("Take " .. ud.damagemodifier .. "% of damage when Closed")
	end
end

--]]