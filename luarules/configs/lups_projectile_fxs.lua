local lups_effects = {
   cbrutus_cbrutus_missile = {
    {class = "Ribbon", options={width=3, size=8, color = {1,0,0,1}}},
    --{class = "JitterParticles2", options={width=3, size=80,emitVector = {0,0,-1}}},
    },
}
local projectile_effects = {}

for weaponName, data in pairs(lups_effects) do
  local weaponDef = WeaponDefNames[weaponName] or {}
  local weaponID = weaponDef.id
  if weaponID then
    projectile_effects[weaponID] = data
  end
end

return projectile_effects