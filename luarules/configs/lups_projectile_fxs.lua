local MergeTable = Spring.Utilities.MergeTable

local fx = {
}


local tbl = {
   --armsnipe_armsnipe_weapon = {
    --{class = "ribbon", options = fx.sonic_blast},
 --},
 
}
local tbl2 = {}

for weaponName, data in pairs(tbl) do
  local weaponDef = WeaponDefNames[weaponName] or {}
  local weaponID = weaponDef.id
  if weaponID then
    tbl2[weaponID] = data
  end
end

return tbl2