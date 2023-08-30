-- This file includes common functionality that should be available globally

-- Universal Lua functions applicable to any Lua code
-- These add missing base lua functionality
VFS.Include('common/numberfunctions.lua')
VFS.Include('common/stringFunctions.lua')
VFS.Include('common/tablefunctions.lua')
Json = Json or VFS.Include('common/luaUtilities/json.lua')

VFS.Include('common/springOverrides.lua')

local environment = Script.GetName and Script.GetName() or "LuaParser"

local commonFunctions = {
	spring = {
		LuaMenu   = true,
		LuaIntro  = true,
		LuaParser = true,
		LuaRules  = true,
		LuaGaia   = true,
		LuaUI     = true,
	},
}

if commonFunctions.spring[environment] then
	local springFunctions = VFS.Include('common/springFunctions.lua')
	Spring.Utilities = Spring.Utilities or springFunctions.Utilities
	Spring.Debug = Spring.Debug or springFunctions.Debug
end