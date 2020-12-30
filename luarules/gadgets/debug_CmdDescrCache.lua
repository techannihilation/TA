function gadget:GetInfo()
	return {
		name = "Debug_CmdDescrCache",
		desc = "Debug_CmdDescrCache",
		author = "[MOL]Silver",
		date = "",
		license = "",
		layer = 0,
		enabled = true
	}
end

local mo_debug = tonumber(Spring.GetModOptions().mo_debug) or 0
if mo_debug == 0 then return end

if gadgetHandler:IsSyncedCode() then
	local GetUnitCmdDescs = Spring.GetUnitCmdDescs
	local uniqueCommand_Descriptions = {}
	local uniqueUnits = {}

	function gadget:UnitCreated(unitID, unitDefID)
		local cmdDescs = GetUnitCmdDescs(unitID)
		uniqueUnits[unitDefID] = true

		for _, v in pairs(cmdDescs) do
			uniqueCommand_Descriptions[v.id] = true
		end
	end

	function gadget:UnitDestroyed(unitID)
		local cmdDescs = GetUnitCmdDescs(unitID)

		for _, v in pairs(cmdDescs) do
			uniqueCommand_Descriptions[v.id] = nil
		end
	end

	function gadget:GameFrame(f)
		if f % 30 == 0 then
			local cmdDescCount = 0
			local uniqueUnitsCount = 0

			for v in pairs(uniqueCommand_Descriptions) do
				cmdDescCount = cmdDescCount + 1
			end

			for v in pairs(uniqueUnits) do
				uniqueUnitsCount = uniqueUnitsCount + 1
			end

			_G.uniqueUnitsCount = uniqueUnitsCount
			_G.cmdDescCount = cmdDescCount
			SendToUnsynced("update")
		end
	end
else --UnsizeYnced part
	local posX, posY = 400, 50
	local sizeX, sizeY = 220, 46
	local glColor = gl.Color
	local glRect = gl.Rect
	local glPushMatrix = gl.PushMatrix
	local glPopMatrix = gl.PopMatrix
	local glTranslate = gl.Translate
	local glBeginText = gl.BeginText
	local glEndText = gl.EndText
	local glText = gl.Text
	local min = math.min
	local max = math.max
	local floor = math.floor
	local uniqueUnitsCount = 0

	function gadget:Initialize()
		gadgetHandler:AddSyncAction("update", update)
		update()
	end

	function gadget:ShutDown()
		gadgetHandler:RemoveSyncAction("update")
	end

	function update()
		uniqueUnitsCount = SYNCED.uniqueUnitsCount or 0
		cmdDescCount = SYNCED.cmdDescCount or 0
	end

	local function drawBorder(x0, y0, x1, y1, t)
		glRect(x0, y0, x1, y0 + t)
		glRect(x0, y1, x1, y1 - t)
		glRect(x0, y0 + t, x0 + t, y1 - t)
		glRect(x1 - t, y0 + t, x1, y1 - t)
	end

	function gadget:GameFrame(frame)
	end

	local sizeY2 = sizeY / 2

	function gadget:DrawScreen()
		-- Positioning
		glPushMatrix()
		glTranslate(posX, posY, 0)
		-- Panel
		glColor(0.0, 0.0, 0.2, 0.6)
		glRect(0, 0, sizeX, sizeY)
		glColor(0, 0, 0, 0)
		drawBorder(0, 0, sizeX, sizeY, 1)
		-- Text
		glBeginText()
		glText('Unique command-descriptions: ' .. cmdDescCount, 7, sizeY2 + 5, 12)
		glText('Unique units in dataStack: ' .. uniqueUnitsCount, 7, sizeY2 - 10, 12)
		glColor(0, 0, 0, 0)
		glEndText()
		glPopMatrix()
	end

	function gadget:MousePress(mx, my, mButton)
		if mButton == 2 or mButton == 3 then
			if mx >= posX and my >= posY and mx < posX + sizeX and my < posY + sizeY then return true end
		end
	end

	function gadget:MouseMove(mx, my, dx, dy, mButton)
		if mButton == 2 or mButton == 3 then
			posX = posX + dx
			posY = posY + dy
		end
	end
end