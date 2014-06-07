function widget:GetInfo()
	return {
		name = "Set Hotkeys",
		desc = "Binds y for Set Target and j for Cancel Target and o for Jump" ,
		author = "Bluestone",
		date = "14/05/2013",
		license = "Horses",
		layer = 1,
		enabled = true
	}
end

function widget:Initialize()
	Spring.SendCommands("bind y settarget")
	Spring.SendCommands("bind j canceltarget")
	Spring.SendCommands("bind o jump")
end

function widget:Shutdown()
	Spring.SendCommands("unbind y settarget")
	Spring.SendCommands("unbind j canceltarget")
	Spring.SendCommands("unbind o jump")
end
