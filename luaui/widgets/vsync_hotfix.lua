
function widget:GetInfo()
return {
	name    = "Vsync HotFix",
	desc    = "",
	author  = "Nixtux",
	date    = "September 2017",
	layer   = 2,
	enabled = true,
}
end

--SAVE / LOAD CONFIG FILE
function widget:GetConfigData()
	local data = {}
	data["vsync"] = true
	return data
end

function widget:SetConfigData(data) 
	if (data ~= nil) then
		if ( data["vsync"] == nil ) then
			--Nothing todo
		else
			if Spring.GetConfigInt("Vsync",1) == 1 then
				Spring.SendCommands("Vsync "..0)
				Spring.SetConfigInt("Vsync",0)
			end
		end

	end
end
--END OF SAFE CONFIG FILE
