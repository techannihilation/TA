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

table.insert(infoMessage, "Merry Xmas From TECHA.")
-- table.insert(infoMessage, "Halloween is comming on TECHA.")

local defaultModoptions = VFS.Include("modoptions.lua")
local modoptionsDefault = {}
for _, value in ipairs(defaultModoptions) do
    modoptionsDefault[value.key] = {
        name = value.name,
        desc = value.desc,
        def  = value.def
    }
end

local currentModOptions = Spring.GetModOptions() or {}

local function GetModOption(key)
    local val = currentModOptions[key]
    if val == nil and modoptionsDefault[key] then
        return tostring(modoptionsDefault[key].def)
    end
    return val
end

-- Game End Mode (deathmode)
local deathmode = GetModOption("deathmode")
if deathmode == "com" then
    table.insert(infoMessage, {text = "Game Objective: Destroy All Enemy Commanders To Win"})
elseif deathmode == "killall" then
    table.insert(infoMessage, {text = "Game Objective: Destroy All Enemy Units To Win"})
elseif deathmode == "neverend" or deathmode == "none" then
    table.insert(infoMessage, {text = "No Game Objective: The Game Never Ends"})
end

-- Starting Resources
local startenergy = tostring(GetModOption("startenergy"))
local startmetal  = tostring(GetModOption("startmetal"))
if startenergy ~= "1000" or startmetal ~= "1000" then
    local message = "Each Player will start with "..startmetal.." Metal and "..startenergy.." Energy Units"
    table.insert(infoMessage, {text = message})
end

-- Greenfields
if GetModOption("mo_greenfields") == "1" then
    table.insert(infoMessage, {text = "Metal Extraction Disabled"})
end

-- Map Damage
if GetModOption("disablemapdamage") == "1" then
    table.insert(infoMessage, {text = "Weapon Deformation Dampeners Enabled"})
end

-- Commander teleport effect
if GetModOption("mo_comgate") == "1" then
    table.insert(infoMessage, {text = "Trans-Dimensional Phase Shifting Matter Transfer Beam Actived"})
end

-- Nanoframe Decay
if GetModOption("mo_nanoframedecay") == "1" then
    table.insert(infoMessage, {text = "Nanoframe Decay Disabled"})
end

-- Super Economy Start
if GetModOption("mo_superecostart") == "1" then
    table.insert(infoMessage, {text = "Super Economy Start Enabled", color = {0, 0, 1, 1}})
end

-- Spam Limit
if GetModOption("exp_spamlimit") == "1" then
    table.insert(infoMessage, {text = "Anti-Spam System Enabled: Mass Production Monitoring Active"})
end

-- Disable Bombers
if GetModOption("disable_bombers") == "1" then
    table.insert(infoMessage, {text = "Bomber Units Disabled", color = {1, 0, 0, 1}})
end

-- Disable Air
if GetModOption("noair") == "1" then
    table.insert(infoMessage, {text = "All Air Units Disabled", color = {1, 0, 0, 1}})
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
    local hbw = 3.5 / vsx
    local vbw = 3.5 / vsy
    local hsw = 0.2
    local vsw = 0.2

    gl.PushMatrix()
    gl.Scale(0.4, 0.4, 1)
    gl.Translate(-0.1, 0, 0)

    gl.BeginEnd(GL.QUADS, function()
        -- shadow topleft
        gl.Color(0, 0, 0, 0)
            gl.Vertex(0.2 - hsw, 0.2)
            gl.Vertex(0.2 - hsw, 0.2 + vsw)
            gl.Vertex(0.2, 0.2 + vsw)
        gl.Color(0, 0, 0, 0.5)
            gl.Vertex(0.2, 0.2)
        -- shadow top
        gl.Color(0, 0, 0, 0)
            gl.Vertex(0.2, 0.2 + vsw)
            gl.Vertex(0.8, 0.2 + vsw)
        gl.Color(0, 0, 0, 0.5)
            gl.Vertex(0.8, 0.2)
            gl.Vertex(0.2, 0.2)
        -- shadow topright
        gl.Color(0, 0, 0, 0)
            gl.Vertex(0.8, 0.2 + vsw)
            gl.Vertex(0.8 + hsw, 0.2 + vsw)
            gl.Vertex(0.8 + hsw, 0.2)
        gl.Color(0, 0, 0, 0.5)
            gl.Vertex(0.8, 0.2)
        -- shadow right
        gl.Color(0, 0, 0, 0)
            gl.Vertex(0.8 + hsw, 0.2)
            gl.Vertex(0.8 + hsw, 0.15)
        gl.Color(0, 0, 0, 0.5)
            gl.Vertex(0.8, 0.15)
            gl.Vertex(0.8, 0.2)
        -- shadow btmright
        gl.Color(0, 0, 0, 0)
            gl.Vertex(0.8, 0.15 - vsw)
            gl.Vertex(0.8 + hsw, 0.15 - vsw)
            gl.Vertex(0.8 + hsw, 0.15)
        gl.Color(0, 0, 0, 0.5)
            gl.Vertex(0.8, 0.15)
        -- shadow btm
        gl.Color(0, 0, 0, 0)
            gl.Vertex(0.2, 0.15 - vsw)
            gl.Vertex(0.8, 0.15 - vsw)
        gl.Color(0, 0, 0, 0.5)
            gl.Vertex(0.8, 0.15)
            gl.Vertex(0.2, 0.15)
        -- shadow btmleft
        gl.Color(0, 0, 0, 0)
            gl.Vertex(0.2 - hsw, 0.15)
            gl.Vertex(0.2 - hsw, 0.15 - vsw)
            gl.Vertex(0.2, 0.15 - vsw)
        gl.Color(0, 0, 0, 0.5)
            gl.Vertex(0.2, 0.15)
        -- shadow left
        gl.Color(0, 0, 0, 0)
            gl.Vertex(0.2 - hsw, 0.2)
            gl.Vertex(0.2 - hsw, 0.15)
        gl.Color(0, 0, 0, 0.5)
            gl.Vertex(0.2, 0.15)
            gl.Vertex(0.2, 0.2)
        -- bar bg
        gl.Color(0, 0, 0, 0.85)
            gl.Vertex(0.2, 0.2)
            gl.Vertex(0.8, 0.2)
            gl.Vertex(0.8, 0.15)
            gl.Vertex(0.2, 0.15)
        -- progress
        gl.Color(1, 1, 1, 0.7)
            gl.Vertex(0.2, 0.2)
            gl.Vertex(0.2 + math.max(0, loadProgress - 0.01) * 0.6, 0.2)
            gl.Vertex(0.2 + math.max(0, loadProgress - 0.01) * 0.6, 0.15)
            gl.Vertex(0.2, 0.15)
        gl.Color(1, 1, 1, 0.7)
            gl.Vertex(0.2 + math.max(0, loadProgress - 0.01) * 0.6, 0.2)
            gl.Vertex(0.2 + math.max(0, loadProgress - 0.01) * 0.6, 0.15)
        gl.Color(1, 1, 1, 0)
            gl.Vertex(0.2 + math.min(1, math.max(0, loadProgress + 0.01)) * 0.6, 0.15)
            gl.Vertex(0.2 + math.min(1, math.max(0, loadProgress + 0.01)) * 0.6, 0.2)
        -- bar borders
        gl.Color(1, 1, 1, 1)
            gl.Vertex(0.2, 0.2)
            gl.Vertex(0.8, 0.2)
            gl.Vertex(0.8, 0.2 - vbw)
            gl.Vertex(0.2, 0.2 - vbw)
        gl.Color(1, 1, 1, 1)
            gl.Vertex(0.2, 0.15)
            gl.Vertex(0.8, 0.15)
            gl.Vertex(0.8, 0.15 + vbw)
            gl.Vertex(0.2, 0.15 + vbw)
        gl.Color(1, 1, 1, 1)
            gl.Vertex(0.2, 0.2)
            gl.Vertex(0.2, 0.15)
            gl.Vertex(0.2 + hbw, 0.15)
            gl.Vertex(0.2 + hbw, 0.2)
        gl.Color(1, 1, 1, 1)
            gl.Vertex(0.8, 0.2)
            gl.Vertex(0.8, 0.15)
            gl.Vertex(0.8 - hbw, 0.15)
            gl.Vertex(0.8 - hbw, 0.2)
    end)

    -- progressbar text
    gl.PushMatrix()
    gl.Scale(1 / vsx, 1 / vsy, 1)
    local barTextSize = vsy * (0.05 - 0.015)
    local InfoTextSize = vsy * (0.08 - 0.005)
    local posy = 0.5 * (vsy - vsx / ar)
    local y0 = vsy * 0.222 + posy
    local y1 = y0 + vsy * 0.3
    local dy = 4

    -- font message
    font:Print(lastLoadMessage, vsx * 0.2, vsy * 0.14, barTextSize, "sa")
    if loadProgress > 0 then
        font:Print(("%.0f%%"):format(loadProgress * 100), vsx * 0.5, vsy * 0.165, barTextSize, "oc")
    else
        font:Print("Loading...", vsx * 0.5, vsy * 0.165, barTextSize, "oc")
    end

    -- Pre Game Info
    gl.Color(0.0, 0.0, 0.0, 0.6)
    local vsy_depth = (InfoTextSize * 1.02) * #infoMessage
    gl.Rect(0, vsy / 2, vsx * 4, vsy / 2 + vsy_depth)
    gl.Color(1, 1, 1, 1)

    font2:Begin()
    local y2 = vsy / 2
    for i, msg in ipairs(infoMessage) do
        local messageText = msg.text or msg
        local msgColor = msg.color or {1, 1, 1, 0.9}
        font2:SetTextColor(msgColor)
        font2:Print(messageText, vsx * 0.2, y2 + ((i - 1) * InfoTextSize) + ((InfoTextSize / 2) + 2), InfoTextSize, 'vo')
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
