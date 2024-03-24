function gadget:GetInfo()
  return {
    name      = "Build Icons Slowy (/luarules buildiconslow)",
    desc      = "builds them all slow-like, 1 per minute for hours on end",
    author    = "Beherith",
    date      = "2015",
    license   = "Horses",
    layer     = 0,
    enabled   = false  --  loaded by default?
  }
end

if (not gadgetHandler:IsSyncedCode()) then
	return
end

local startframe = 1000000000
local index=1
local counter = 1
local unitnames={}
local timedelay=40*10 --yeah this crap takes 8 hours, for a total of 427 units :D

function buildslowly(_,_,params)
	if #params == 1 then
		if type(tonumber(params[1])) == "number" then
			index = tonumber(params[1])
		end
	end
	Spring.Echo('building icons all slow-like, starting from '..index)
	startframe=Spring.GetGameFrame()
end


function gadget:Initialize()
	gadgetHandler:AddChatAction('buildiconslow', buildslowly, "")
	
	for i=1,#UnitDefs do
  	local unitDefID = UnitDefs[i]
    	if (unitDefID.minWaterDepth and unitDefID.minWaterDepth> 0) and unitDefID.waterline then
    	--if unitDefID.canFly then
    	--if unitDefID.isFactory then

    		--Spring.Echo('unitdefname',unitDefID.name)
        	unitnames[#unitnames+1]=unitDefID.name
        end
	end
end

function gadget:GameFrame(n)
	--Spring.Echo(n,startframe,index)
	if (n>startframe+timedelay*counter and index <=#unitnames) then 
		-- Spring.Echo(" Drawing unit ",index,UnitDefNames[index]["name"])
		--if UnitDefs[unitnames[index]].id then
		--end
		Spring.Echo(" Drawing unit ",index,unitnames[index]," out of ", #unitnames)
		Spring.SendCommands("luarules buildicon "..unitnames[index])
		index=index+1
		counter=counter+1
	end
end

function gadget:Shutdown()
	gadgetHandler:RemoveChatAction('buildiconslow')
end
