
function widget:GetInfo()
	return {
		name      = 'Energy Conversion Info',
		desc      = 'Displays energy conversion info',
		author    = 'Niobium (mod by Finkky)',
		date      = 'May 2011',
		license   = 'GNU GPL v2.1',
		layer     = 0,
		enabled   = true,
	}
end

--------------------------------------------------------------------------------
-- Var
--------------------------------------------------------------------------------
local alterLevelFormat = string.char(137) .. '%i'

local px, py = 500, 100
local sx, sy = 180, 70

local hoverLeft = 53
local hoverRight = sx - 7
local hoverBottom = 23 + 16
local hoverTop = 35 + 16
local barBottom = 28 + 16
local barTop = 30 + 16

--------------------------------------------------------------------------------
-- Speedups
--------------------------------------------------------------------------------
local format = string.format

local glColor = gl.Color
local glRect = gl.Rect
local glPushMatrix = gl.PushMatrix
local glPopMatrix = gl.PopMatrix
local glTranslate = gl.Translate
local glBeginText = gl.BeginText
local glEndText = gl.EndText
local glText = gl.Text

local spGetMyTeamID = Spring.GetMyTeamID
local spGetTeamRulesParam = Spring.GetTeamRulesParam
local spSendLuaRulesMsg = Spring.SendLuaRulesMsg
local spGetSpectatingState = Spring.GetSpectatingState



local eThresholds = { 
	{title="AAA", color={0.1, 1, 0, 0.5}, e=0.0178}, 
	{title="AA", color={0.4, 1, 0, 0.5}, e=0.0168}, 
	{title="A", color={0.6, 1, 0, 0.5}, e=0.0158}, 
	{title="B", color={0.8, 1, 0, 0.5}, e=0.0148}, 
	{title="C", color={1, 0.8, 0, 0.5}, e=0.0138}, 
	{title="D", color={1, 0.4, 0, 0.5}, e=0.0128}, 
	{title="E", color={0.8, 0, 0, 0.5}, e=0.0118}, 
	{title="EE", color={0.6, 0, 0, 0.5}, e=0.0108}, 
	{title="EEE", color={0.4, 0, 0, 0.5}, e=0.001}, 
	{title="UKN", color={0, 0, 0, 0.5}, e=-0.001}, 
}

--table.sort(eThresholds, function(a,b) return a.e>b.e end)

local function getLetter(effi)

	for a, v in ipairs(eThresholds) do
		if (effi > v.e) then 
			return v
		end
	end
	return eThresholds[#eThresholds-1]
end 

--------------------------------------------------------------------------------
-- Funcs
--------------------------------------------------------------------------------
function widget:Initialize()
	local playerID = Spring.GetMyPlayerID()
	local _, _, spec, _, _, _, _, _ = Spring.GetPlayerInfo(playerID)
		
	if ( spec == true ) then
		Spring.Echo("<Energy Conversion Info> Spectator mode. Widget removed.")
		widgetHandler:RemoveWidget()
	end
end

function widget:DrawScreen()
    
    -- Var
    local myTeamID = spGetMyTeamID()
    local curLevel = spGetTeamRulesParam(myTeamID, 'mmLevel')
    local curUsage = spGetTeamRulesParam(myTeamID, 'mmUse')
    local curCapacity = spGetTeamRulesParam(myTeamID, 'mmCapacity')
	--local curAvgEfficiency = spGetTeamRulesParam(myTeamID, 'mmAvgEfficiency')
	local curAvgEffi = spGetTeamRulesParam(myTeamID, 'mmAvgEffi')
	-- local curLevel=0.2
	-- local curUsage = 20
	-- local curCapacity = 20
	-- local curAvgEfficiency=20
	-- local curAvgEffi  = 20
    
    -- Positioning
    glPushMatrix()
        glTranslate(px, py, 0)
        
        -- Panel
        glColor(0, 0, 0, 0.5)
        glRect(0, 0, sx, sy)
        
		
		local currentRating  = getLetter(curAvgEffi)
		
		glColor(currentRating.color)
		glRect(sx, 0, sx+sy, sy)
		
		
        -- Text
        glBeginText()
			glColor(1, 0, 1, 0.5)
            glText('Energy Conversion', 64, 53, 12, 'cd')
            glText('Hover:', 5, 37, 12, 'd')
            glText('Usage:', 5, 21, 12, 'd')
			glText('Efficiency:', 5, 5, 12, 'd')
            glText(format('%i / %i', curUsage, curCapacity), 175, 21, 12, 'dr')
			glText(format('%.2f%s (x1000) : %.1f', curAvgEffi * 1000, '%', curAvgEffi * curUsage), 175, 5, 12, 'dr')
			glText(currentRating.title, sx+sy/2, sy/2 - 9, 26, 'co') --
	    glEndText()

		
		
		glColor(1, 1, 1, 1)
        -- Bar
        glRect(hoverLeft, barBottom, hoverRight, barTop)
        
        -- Slider
        local sliderX = hoverLeft + (hoverRight - hoverLeft) * curLevel
        glColor(1, 0, 0, 0.75)
        glRect(sliderX - 2, hoverBottom, sliderX + 2, hoverTop)
        
    glPopMatrix()
end

function widget:MousePress(mx, my, mButton)
    if mButton == 2 or mButton == 3 then
        if mx >= px and my >= py and mx < px + sx and my < py + sy then
            return true
        end
    elseif mButton == 1 and not spGetSpectatingState() then
        local dx, dy = mx - px, my - py
        if dx >= hoverLeft and dy >= hoverBottom and dx < hoverRight and dy < hoverTop then
            local newShare = 100 * (dx - hoverLeft) / (hoverRight - hoverLeft) -- [0, 100)
            spSendLuaRulesMsg(format(alterLevelFormat, newShare))
            return true
        end
    end
end

function widget:MouseMove(mx, my, dx, dy, mButton)
    -- Dragging
    if mButton == 2 or mButton == 3 then
        px = px + dx
        py = py + dy
    end
end

function widget:GetConfigData()
	local vsx, vsy = gl.GetViewSizes()
	return {px / vsx, py / vsy}
end
function widget:SetConfigData(data)
	local vsx, vsy = gl.GetViewSizes()
	px = math.floor(math.max(0, vsx * math.min(data[1] or 0, 0.95)))
	py = math.floor(math.max(0, vsy * math.min(data[2] or 0, 0.95)))
end
