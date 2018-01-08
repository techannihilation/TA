
if addon.InGetInfo then
	return {
		name    = "Main",
		desc    = "displays a simple loadbar",
		author  = "jK",
		date    = "2012,2013",
		license = "GPL2",
		layer   = 0,
		depend  = {"LoadProgress"},
		enabled = true,
	}
end

------------------------------------------

local lastLoadMessage = ""
local infoMessage = {}

--table.insert(infoMessage, "Spring Engine version 101.0.1-201 or above is needed for this version")

--table.insert(infoMessage, "Merry Xmas From TECHA 1st morph is free")

--table.insert(infoMessage, "To Switch to OTA style icon use option widget")

if Spring.GetModOptions() then 
	if Spring.GetModOptions().deathmode then
		if Spring.GetModOptions().deathmode == "com" then
    		message = "Game Objective Destroy All Enemy Commanders To Win"
  		elseif Spring.GetModOptions().deathmode == "killall" then
	    	message = "Game Objective Destroy All Enemy Units To Win"
  		elseif Spring.GetModOptions().deathmode == "neverend" then
			message = "No Game Objective The Game Never Ends"
		end
	table.insert(infoMessage, message)
	end
	if Spring.GetModOptions().startenergy ~= nil then
  		startenergy = tostring(Spring.GetModOptions().startenergy)
	end
	if Spring.GetModOptions().startmetal ~= nil then
  		startmetal = tostring(Spring.GetModOptions().startmetal)
  	end
  	if (startenergy and startenergy ~= "1000") or (startmetal and startmetal ~= "1000") then
  		message = "Each Player will start with "..startmetal.." Metal and "..startenergy.." Energy Units"
  		table.insert(infoMessage, message)
  	end
  	if Spring.GetModOptions().mo_greenfields == "1" then
    	message = "Metal Extraction Disabled"
    	table.insert(infoMessage, message)
	end
	if Spring.GetModOptions().mo_terraforming == "1" then
  		message = "Advanced Planetary Terraforming Enabled"
  		table.insert(infoMessage, message)
	end
	if Spring.GetModOptions().disablemapdamage == "1" then
  		message = "Weapon Deformation Dampeners Enabled"
  		table.insert(infoMessage, message)
	end
	if Spring.GetModOptions().mo_comgate == "1" then
  		message = "Trans-Dimensional Phase Shifting Matter Transfer Beam Actived"
  		table.insert(infoMessage, message)
	end
	if Spring.GetModOptions().mo_nanoframedecay == "1" then
  		message = "Nano frames Decay disabled"
  		table.insert(infoMessage, message)
	end
end

--Spring.Echo ("Message length == ",#infoMessage)
function addon.LoadProgress(message, replaceLastLine)
	lastLoadMessage = message
end

------------------------------------------

local font = gl.LoadFont("FreeSansBold.otf", 50, 20, 1.95)
local font2 = gl.LoadFont("luaui/fonts/instruction_bold.ttf", 60, 8, 3)


function addon.DrawLoadScreen()
	local loadProgress = SG.GetLoadProgress()

	local vsx, vsy = gl.GetViewSizes()
	local xDiv, yDiv, texy, ar = SG.GetDiv()
	
	-- draw progressbar
	local hbw = 3.5/vsx
	local vbw = 3.5/vsy
	local hsw = 0.2
	local vsw = 0.2
	
	gl.PushMatrix()
	gl.Scale(.4,.4,1)
	gl.Translate(-0.1,0,0)
	
	gl.BeginEnd(GL.QUADS, function()
		--shadow topleft
		gl.Color(0,0,0,0)
			gl.Vertex(0.2-hsw, 0.2    )
			gl.Vertex(0.2-hsw, 0.2+vsw)
			gl.Vertex(0.2    , 0.2+vsw)
		gl.Color(0,0,0,0.5)
			gl.Vertex(0.2    , 0.2)

		--shadow top
		gl.Color(0,0,0,0)
			gl.Vertex(0.2, 0.2+vsw)
			gl.Vertex(0.8, 0.2+vsw)
		gl.Color(0,0,0,0.5)
			gl.Vertex(0.8, 0.2)
			gl.Vertex(0.2, 0.2)

		--shadow topright
		gl.Color(0,0,0,0)
			gl.Vertex(0.8    , 0.2+vsw)
			gl.Vertex(0.8+hsw, 0.2+vsw)
			gl.Vertex(0.8+hsw, 0.2)
		gl.Color(0,0,0,0.5)
			gl.Vertex(0.8    , 0.2)

		--shadow right
		gl.Color(0,0,0,0)
			gl.Vertex(0.8+hsw, 0.2)
			gl.Vertex(0.8+hsw, 0.15)
		gl.Color(0,0,0,0.5)
			gl.Vertex(0.8    , 0.15)
			gl.Vertex(0.8    , 0.2)

		--shadow btmright
		gl.Color(0,0,0,0)
			gl.Vertex(0.8    , 0.15-vsw)
			gl.Vertex(0.8+hsw, 0.15-vsw)
			gl.Vertex(0.8+hsw, 0.15)
		gl.Color(0,0,0,0.5)
			gl.Vertex(0.8    , 0.15)

		--shadow btm
		gl.Color(0,0,0,0)
			gl.Vertex(0.2, 0.15-vsw)
			gl.Vertex(0.8, 0.15-vsw)
		gl.Color(0,0,0,0.5)
			gl.Vertex(0.8, 0.15)
			gl.Vertex(0.2, 0.15)

		--shadow btmleft
		gl.Color(0,0,0,0)
			gl.Vertex(0.2-hsw, 0.15    )
			gl.Vertex(0.2-hsw, 0.15-vsw)
			gl.Vertex(0.2    , 0.15-vsw)
		gl.Color(0,0,0,0.5)
			gl.Vertex(0.2    , 0.15)

		--shadow left
		gl.Color(0,0,0,0)
			gl.Vertex(0.2-hsw, 0.2)
			gl.Vertex(0.2-hsw, 0.15)
		gl.Color(0,0,0,0.5)
			gl.Vertex(0.2    , 0.15)
			gl.Vertex(0.2    , 0.2)

		--bar bg
		gl.Color(0,0,0,0.85)
			gl.Vertex(0.2, 0.2)
			gl.Vertex(0.8, 0.2)
			gl.Vertex(0.8, 0.15)
			gl.Vertex(0.2, 0.15)

		--progress
		gl.Color(1,1,1,0.7)
			gl.Vertex(0.2, 0.2)
			gl.Vertex(0.2 + math.max(0, loadProgress-0.01) * 0.6, 0.2)
			gl.Vertex(0.2 + math.max(0, loadProgress-0.01) * 0.6, 0.15)
			gl.Vertex(0.2, 0.15)
		gl.Color(1,1,1,0.7)
			gl.Vertex(0.2 + math.max(0, loadProgress-0.01) * 0.6, 0.2)
			gl.Vertex(0.2 + math.max(0, loadProgress-0.01) * 0.6, 0.15)
		gl.Color(1,1,1,0)
			gl.Vertex(0.2 + math.min(1, math.max(0, loadProgress+0.01)) * 0.6, 0.15)
			gl.Vertex(0.2 + math.min(1, math.max(0, loadProgress+0.01)) * 0.6, 0.2)

		--bar borders
		gl.Color(1,1,1,1)
			gl.Vertex(0.2, 0.2)
			gl.Vertex(0.8, 0.2)
			gl.Vertex(0.8, 0.2-vbw)
			gl.Vertex(0.2, 0.2-vbw)
		gl.Color(1,1,1,1)
			gl.Vertex(0.2, 0.15)
			gl.Vertex(0.8, 0.15)
			gl.Vertex(0.8, 0.15+vbw)
			gl.Vertex(0.2, 0.15+vbw)
		gl.Color(1,1,1,1)
			gl.Vertex(0.2, 0.2)
			gl.Vertex(0.2, 0.15)
			gl.Vertex(0.2+hbw, 0.15)
			gl.Vertex(0.2+hbw, 0.2)
		gl.Color(1,1,1,1)
			gl.Vertex(0.8, 0.2)
			gl.Vertex(0.8, 0.15)
			gl.Vertex(0.8-hbw, 0.15)
			gl.Vertex(0.8-hbw, 0.2)
	end)

--[[
	gl.Color(0,0,0,1)
	gl.Rect(0.2,0.15,0.8,0.2)
	gl.Color(1,1,1,1)
	gl.Rect(0.2,0.15,0.2 + math.max(0, loadProgress) * 0.6,0.2)
	gl.LineWidth(5)
	gl.PolygonMode(GL.FRONT_AND_BACK, GL.LINE)
	gl.Rect(0.2,0.15,0.8,0.2)
	gl.PolygonMode(GL.FRONT_AND_BACK, GL.FILL)
	gl.LineWidth(1)
	gl.Color(1,1,1,1)
--]]

	-- progressbar text
	gl.PushMatrix()
	gl.Scale(1/vsx,1/vsy,1)
		local barTextSize = vsy * (0.05 - 0.015)
		local InfoTextSize = vsy * (0.08 - 0.005)
		
		local posy = 0.5 * (vsy-vsx/ar)
		
		local y0 = vsy * 0.222 + posy -- vsy-texy > 300 and vsy-texy or vsy * 0.25
		local y1 = y0 + vsy * 0.3
		local dy = 4
		
		--Spring.Echo("XY:",yDiv,vsy * 0.2,yDiv > 0.1,y0,y1,yDiv*vsy,vsx/ar,posy)
		
		--font:Print(lastLoadMessage, vsx * 0.5, vsy * 0.3, 50, "sc")
		--font:Print(Game.gameName, vsx * 0.5, vsy * 0.95, vsy * 0.07, "sca")
		font:Print(lastLoadMessage, vsx * 0.2, vsy * 0.14, barTextSize, "sa")
		if loadProgress>0 then
			font:Print(("%.0f%%"):format(loadProgress * 100), vsx * 0.5, vsy * 0.165, barTextSize, "oc")
		else
			font:Print("Loading...", vsx * 0.5, vsy * 0.165, barTextSize, "oc")
		end

		--Spring.Echo("XY:",vsx,vsy)
		--Pre Game Info
		--Todo Scale bar to depening on massage count
		gl.Color(0.0,0.0,0.0,0.6)
		local vsy_depth = (InfoTextSize *1.02) * #infoMessage 
		gl.Rect(0,vsy/2,vsx*4,vsy/2+vsy_depth)
	
		--gl.Color(1,1,1,0.5)
		--gl.Rect(0,vsy/2,4*vsx,vsy/2+2)
		--gl.Rect(0,vsy/2+(,4*vsx,vsy/2+vsy_depth)
		
		gl.Color(1,1,1,1)
		
		font2:Begin()
		font2:SetTextColor({1, 1, 1, 0.9 })
		--Spring.Echo("infoMessage:",#infoMessage)
		local y2 = (vsy/2)
		local ls = vsy * 0.07
		for line, text in pairs(infoMessage) do
			--Spring.Echo(InfoTextSize)
			font2:Print(text,vsx * 0.2,y2 + ((line-1)*InfoTextSize)+((InfoTextSize/2)+2),InfoTextSize,'vo')
		end
		font2:End()
		
	gl.PopMatrix()
	
	gl.PopMatrix()
end


function addon.MousePress(...)
	--Spring.Echo(...)
end


function addon.Shutdown()
	gl.DeleteFont(font)
end
