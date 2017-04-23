--------------------------
-- DOCUMENTATION
-------------------------

-- TA contains weapondefs in its unitdef files
-- Standalone weapondefs are only loaded by Spring after unitdefs are loaded
-- So, if we want to do post processing and include all the unit+weapon defs, and have the ability to bake these changes into files, we must do it after both have been loaded
-- That means, ALL UNIT AND WEAPON DEF POST PROCESSING IS DONE HERE

-- What happens:
-- unitdefs_post.lua calls the _Post functions for unitDefs and any weaponDefs that are contained in the unitdef files
-- unitdefs_post.lua writes the corresponding unitDefs to customparams (if wanted)
-- weapondefs_post.lua fetches any weapondefs from the unitdefs, 
-- weapondefs_post.lua fetches the standlaone weapondefs, calls the _post functions for them, writes them to customparams (if wanted)
-- strictly speaking, alldefs.lua is a misnomer since this file does not handle armordefs, featuredefs or movedefs

-- Switch for when we want to save defs into customparams as strings (so as a widget can then write them to file)
-- The widget to do so can be found in 'etc/Lua/bake_unitdefs_post'

SaveDefsToCustomParams = false

local iswater = {
	["armfnanotc1"] = true,
	["tllwhale"] = true,
	["armmship"] = true,
	["csubpen"] = true,
	["asubpen"] = true,
	["armhls"] = true,
	["corfhlt"] = true,
	["tllacsub"] = true,
	["corcarry"] = true,
	["armtl"] = true,
	["coruwlightfus"] = true,
	["coracsub"] = true,
	["cormls"] = true,
	["armuwfus1"] = true,
	["armcs"] = true,
	["armfnanotc"] = true,
	["cahpns"] = true,
	["aahpns"] = true,
	["tllsonar"] = true,
	["armmarlin"] = true,
	["uppercut"] = true,
	["tllwmmohoconv"] = true,
	["tllwmconv"] = true,
	["armacsub"] = true,
	["tllvisitor"] = true,
	["tllviolator"] = true,
	["tllotter"] = true,
	["tlluwmstorage"] = true,
	["tlluwmex"] = true,
	["tlluwjam"] = true,
	["tllorc"] = true,
	["tlluwfusion"] = true,
	["tlluwestorage"] = true,
	["tlltrid"] = true,
	["armrecl"] = true,
	["corcs"] = true,
	["armason"] = true,
	["armsjam"] = true,
	["tlltide"] = true,
	["tllsy"] = true,
	["tllsubpen"] = true,
	["tlllmtns"] = true,
	["tllsting"] = true,
	["tllsr"] = true,
	["tllsquid"] = true,
	["armbats"] = true,
	["corfrt"] = true,
	["armatidal"] = true,
	["tllshark"] = true,
	["armmls"] = true,
	["tllradarns"] = true,
	["armhevsenan"] = true,
	["tllcs"] = true,
	["tllplunger"] = true,
	["tllfnanotc2"] = true,
	["tllviking"] = true,
	["cortyrnt"] = true,
	["corenaa"] = true,
	["corpt"] = true,
	["corasy"] = true,
	["tllgiant"] = true,
	["corbats"] = true,
	["armuwes"] = true,
	["armatl"] = true,
	["coratidal"] = true,
	["tllhcar"] = true,
	["armfrad"] = true,
	["tllasonar"] = true,
	["armtide"] = true,
	["corsy"] = true,
	["decade"] = true,
	["tllfnanotc1"] = true,
	["armpt"] = true,
	["coratl"] = true,
	["tllatidal"] = true,
	["armuwlightfus"] = true,
	["corason"] = true,
	["corfnanotc1"] = true,
	["coruwmmm"] = true,
	["armsy"] = true,
	["tllhltns"] = true,
	["corhevsenan"] = true,
	["coresupp"] = true,
	["coruwfus"] = true,
	["tllfnanotc"] = true,
	["armfatf"] = true,
	["tllesy"] = true,
	["tllequalizer"] = true,
	["armthovr"] = true,
	["corfnanotc2"] = true,
	["corfatf"] = true,
	["tllcsub"] = true,
	["armroy"] = true,
	["tllacs"] = true,
	["armuwmme"] = true,
	["corfdrag"] = true,
	["corsub"] = true,
	["corfmkr"] = true,
	["armesy"] = true,
	["armflosh"] = true,
	["tllmanta"] = true,
	["tllswordfish"] = true,
	["tllboat2"] = true,
	["corfrad"] = true,
	["tllbats2"] = true,
	["crnns"] = true,
	["armsub"] = true,
	["tllatorp"] = true,
	["armuwmex"] = true,
	["tllasgard"] = true,
	["tllasship"] = true,
	["tllaspns"] = true,
	["corplat"] = true,
	["tllasy"] = true,
	["corfnanotc3"] = true,
	["tllambassador"] = true,
	["tllauwmex"] = true,
	["corblackhy"] = true,
	["armfmkr"] = true,
	["armtship"] = true,
	["armbc"] = true,
	["coruwmme"] = true,
	["corroy"] = true,
	["tlldtns"] = true,
	["tlltorp"] = true,
	["armfnanotc3"] = true,
	["tllplat"] = true,
	["corfhp"] = true,
	["cortl"] = true,
	["armuwmmm"] = true,
	["coruwes"] = true,
	["armcarry"] = true,
	["armhcar"] = true,
	["armfflak"] = true,
	["tllfgate"] = true,
	["tllkrak"] = true,
	["cormship"] = true,
	["corsjam"] = true,
	["coruwms"] = true,
	["coruwmex"] = true,
	["cortship"] = true,
	["corthovr"] = true,
	["corssub"] = true,
	["cortide"] = true,
	["armcrus"] = true,
	["correcl"] = true,
	["armfhp"] = true,
	["coresy"] = true,
	["tllsolarns"] = true,
	["tllfflak"] = true,
	["armsonar"] = true,
	["armsubk"] = true,
	["tawf009"] = true,
	["corasship"] = true,
	["armhevsenan"] = true,
	["corhcar"] = true,
	["tllhpns"] = true,
	["armasy"] = true,
	["corsonar"] = true,
	["armuwms"] = true,
	["armuwfus"] = true,
	["armplat"] = true,
	["tlldcsta"] = true,
	["tllmixer"] = true,
	["aseadragon"] = true,
	["corarch"] = true,
	["armfnanotc2"] = true,
	["tllnssam"] = true,
	["corcrus"] = true,
	["corfnanotc"] = true,
	["armfdrag"] = true,
	["corshark"] = true,
	["armfhlt"] = true,
	["armfrt"] = true,
	["armtrmph"] = true,
	["armaas"] = true,
	["corflshd"] = true,
	}

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

local cons = {
	['armcv'] = true,
	['armacv']  = true,
	['consul'] = true,
	['armbeaver'] = true,
	['armch'] = true,
	['armmarv'] = true,
	['aach'] = true,

	['corcv'] = true,
	['coracv'] = true,
	['cormuskrat'] = true,
	['corch'] = true,
	['corfred'] = true,
	['corassis'] = true,
	['cach'] = true,

	
	['tllcv'] = true,
	['tllacv'] = true,
	['tllhtcb'] = true,
	}

local turninplacebots= {
	['corck'] = true,
	['corack'] = true,
	['corfast'] = true,
	['armck'] = true,
	['armack'] = true,
	['armfark'] = true,
	['tllck'] = true,
	['tllack'] = true,
	}

local pplants = {
	["aafus"] = true,
	["afusionplant"] = true,
	["amgeo"] = true,
	["armadvsol"] = true,
	["armckfus"] = true,
	["armfor"] = true,
	["armfus"] = true,
	["armgeo"] = true,
	["armgmm"] = true,
	["armsolar"] = true,
	["armtide"] = true,
	["armuwfus"] = true,
	["armuwfus1"] = true,
	["armwin"] = true,
	["cafus"] = true,
	["cfusionplant"] = true,
	["cmgeo"] = true,
	["coradvsol"] = true,
	["corbhmth"] = true,
	["corbhmth1"] = true,
	["corfus"] = true,
	["corgeo"] = true,
	["corsfus"] = true,
	["corsolar"] = true,
	["cortide"] = true,
	["coruwfus"] = true,
	["corwin"] = true,
	["crnns"] = true,
	["tlladvsolar"] = true,
	["tllatidal"] = true,
	["tllcoldfus"] = true,
	["tllgeo"] = true,
	["tllmedfusion"] = true,
	["tllmegacoldfus"] = true,
	["tllmohogeo"] = true,
	["tllsolar"] = true,
	["tllsolarns"] = true,
	["tlltide"] = true,
	["tlluwfusion"] = true,
	["tllwindtrap"] = true,
	["corawin"] = true,
	["armawin"] = true,
	["coratidal"] = true,
	["armatidal"] = true,
	["armlightfus"] = true,
	["armuwlightfus"] = true,
	["corlightfus"] = true,
	["coruwlightfus"] = true,
	["armgen"] = true,
	["corgen"] = true,
	["armsolar"] = true,
	["corsolar"] = true,
	["crnns"] = true,
	["tllsolar"] = true,
	["tllsolarns"] = true,
	["tlladvsolar"] = true,
	["armestor"] = true,
	["armuwadves"] = true,
	["armses"] = true,
	["armuwes"] = true,
	["corestor"] = true,
	["coruwadves"] = true,
	["corses"] = true,
	["coruwes"] = true,
	["tllestor"] = true,
	["tllemstor"] = true,
	["tlluwestorage"] = true,
}

-------------------------
-- DEFS POST PROCESSING
-------------------------

-- process unitdef
function UnitDef_Post(name, uDef)

--[[	
if uDef.buildoptions then
		local tablesize = #uDef.buildoptions
			local optionswater = {}
			local optionsother = {}
			Spring.Echo("buildoption found in ",uDef.unitname)
			local a ,b = 1,1

			for i,units in ipairs(uDef.buildoptions) do
				if not iswater[units] then
					Spring.Echo(a,units," other")
					optionsother[a]=units
					a=a+1
				end
			end
			for i,units in ipairs(uDef.buildoptions) do
				if iswater[units] then
					Spring.Echo(a,units," water")
					optionsother[a]=units
					a=a+1
				end
			end
			uDef.buildoptions={}
			for i=1,tablesize do
				uDef.buildoptions[i]=optionsother[i]
				Spring.Echo("new order ",i,optionsother[i])
			end
		end

--[[
	if (not Commanders[uDef.unitname]) then
		uDef.mass = math.max(uDef.maxdamage / 6.0, uDef.buildcostmetal)
	end


	
	if (uDef.maxvelocity) then 
		uDef.turninplacespeedlimit = (uDef.maxvelocity*0.66) or 0
		uDef.turninplaceanglelimit = 140
	end
	
	--todo: build these into the unitdefs
	if (uDef.hoverattack) then
		uDef.turninplaceanglelimit = 360
	end
	
	if uDef.movementclass and (uDef.movementclass:find("TANK",1,true) or uDef.movementclass:find("HOVER",1,true)) then
		--Spring.Echo('tank or hover:',uDef.name,uDef.movementclass)
		if cons[name] then
			--Spring.Echo('tank or hover con:',uDef.name,uDef.moveData)
			uDef.turninplace=1
			uDef.turninplaceanglelimit=60
		elseif (uDef.maxvelocity) then 
			uDef.turninplace = 0
			uDef.turninplacespeedlimit = (uDef.maxvelocity*0.66) or 0
		end
	elseif uDef.movementclass and (uDef.movementclass:find("KBOT",1,true)) then
		if turninplacebots[name] then
			--Spring.Echo('turninplacekbot:',uDef.name)
			uDef.turninplace=1
			uDef.turninplaceanglelimit=60
		elseif (uDef.maxvelocity) then 
			uDef.turninplaceanglelimit = 140
		end
	end



		if uDef.buildpic then
		  uDef.customparams.buildpic = uDef.buildpic
		end




	if (uDef.sfxtypes == nil) then
		uDef.sfxtypes = {}
	end
	uDef.sfxtypes["pieceexplosiongenerators"] = {}
	if (pplants[uDef.unitname]) then
		Spring.Echo("energy unit ",uDef.unitname)
	    uDef.sfxtypes["pieceexplosiongenerators"][1] = [[piecetrail5]]
		--uDef.sfxtypes["pieceexplosiongenerators"][2] = [[piecetrail5]]
		--uDef.sfxtypes["pieceexplosiongenerators"][3] = [[piecetrail4]]
		--uDef.sfxtypes["pieceexplosiongenerators"][4] = [[piecetrail6]]
	    --else
	    --Spring.Echo("others unit ",uDef.unitname)
	    --uDef.sfxtypes["pieceexplosiongenerators"][1] = [[piecetrail0]]
		--uDef.sfxtypes["pieceexplosiongenerators"][2] = [[piecetrail1]]
		--uDef.sfxtypes["pieceexplosiongenerators"][3] = [[piecetrail2]]
		--uDef.sfxtypes["pieceexplosiongenerators"][4] = [[piecetrail3]]
		--uDef.sfxtypes["pieceexplosiongenerators"][5] = [[piecetrail4]]
		--uDef.sfxtypes["pieceexplosiongenerators"][6] = [[piecetrail5]]
		--uDef.sfxtypes["pieceexplosiongenerators"][6] = [[piecetrail6]]
	--end
	--Uncomment to clean pieces
	--uDef.sfxtypes.pieceexplosiongenerators = nil
	--[[
	if not uDef.customparams then
        	uDef.customparams = {}
   	end


	uDef.buildpic=uDef.unitname..".dds"



	if uDef.side then
		--Spring.Echo(uDef.name,uDef.side)
		uDef.customparams.faction=uDef.side
--]]
end

-- process weapondef
function WeaponDef_Post(name, WeaponDefs)

end


--------------------------
-- MODOPTIONS
-------------------------

-- process modoptions (last, because they should not get baked)

function ModOptions_Post(UnitDefs, WeaponDefs)
--[[

	for name,ud in pairs(UnitDefs) do
		if ud.buildoptions then
		local tablesize = #ud.buildoptions
			local optionswater = {}
			local optionsother = {}
			Spring.Echo("buildoption found in ",ud.unitname)
			local a ,b = 1,1

			for i,units in ipairs(ud.buildoptions) do
				if not iswater[units] then
					Spring.Echo(a,units," other")
					optionsother[a]=units
					a=a+1
				end
			end
			for i,units in ipairs(ud.buildoptions) do
				if iswater[units] then
					Spring.Echo(a,units," water")
					optionsother[a]=units
					a=a+1
				end
			end
			ud.buildoptions={}
			for i=1,tablesize do
				ud.buildoptions[i]=optionsother[i]
				Spring.Echo("new order ",i,optionsother[i])
			end
		end
	end

--]]


	if (Spring.GetModOptions) then
	local modOptions = Spring.GetModOptions()

	-- transporting enemy coms
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
		
		if (modOptions.mo_storageowner == "com") then
			for name, ud in pairs(UnitDefs) do  
				if (name == "armcom" or name == "corcom" or name =="tllcom") then
					ud.energyStorage = modOptions.startenergy or 1000
					ud.metalStorage = modOptions.startmetal or 1000
				end
			end
		end
	end
	--]]
end