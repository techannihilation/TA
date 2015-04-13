function widget:GetInfo()
  return {
    name      = "Game los color",
    desc      = "Replace engine default los color",
    author    = "nixtux",
    date      = "Feb 5",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--	        Red , Green, Blue
local fog   = { 0.20, 0.20 , 0.20 }
local los   = { 0.35, 0.35 , 0.35 }
local radar = { 0.00, 0.00 , 1.00 }
local jam   = { 0.30, 0.00 , 0.00 }
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

function widget:Initialize()
	Spring.SetLosViewColors(
		{ fog[1], los[1], radar[1], jam[1]},  --Red
		{ fog[2], los[2], radar[2], jam[2]},  --Green
		{ fog[3], los[3], radar[3], jam[3]}   --Blue
	)
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------