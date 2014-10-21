function widget:GetInfo()
	return {
		name = "TechA Custom Hotkeys",
		desc = "Binds keys for settarget/jump/morph gadget" ,
		author = "Nixtux",
		date = "14/05/2013",
		license = "Horses",
		layer = 1,
		enabled = true
	}
end

function widget:Initialize()
	Spring.SendCommands("bind y settarget")
	Spring.SendCommands("bind j canceltarget")
	--Spring.SendCommands("bind o jump")
	Spring.SendCommands("bind / morph")
end

function widget:Shutdown()
	Spring.SendCommands("unbind y settarget")
	Spring.SendCommands("unbind j canceltarget")
	--Spring.SendCommands("unbind o jump")
	Spring.SendCommands("unbind / morph")
end
