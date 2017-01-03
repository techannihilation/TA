function gadget:GetInfo()
        return {
                name                    = "Projectile Control",
                desc                    = "SetProjectileTarget etc",
                author          		= "knorke",
                date                    = "Mar 2014",
                license  				= "later horses dont be mean.",
                layer            		= 0,
                enabled  = true, --      loaded by default?
        }
end

if (not gadgetHandler:IsSyncedCode()) then return end

local wiggleWeapon = {}
wiggleWeapon[WeaponDefNames["armabad_exp_heavyrocket1"].id] = 1

local redirectProjectiles = {}  -- [frame][projectileID] = table with .targetType .targetX .targetY .targetZ .targetID

function gadget:Initialize()
	Script.SetWatchWeapon (WeaponDefNames["armabad_exp_heavyrocket1"].id, true)
end

 
 function gadget:GameFrame (frame)
--	if frame%60==0 then Spring.Echo ("projectile_test.lua"..frame) end

	if redirectProjectiles[frame] then
		for projectileID,_ in pairs (redirectProjectiles[frame]) do
			if (Spring.GetProjectileType (projectileID)) then
				setTargetTable (projectileID, redirectProjectiles[frame][projectileID])
				--Spring.SetProjectileCEG (projectileID, "custom:35mmHEATmissilesmoke")				
			end
		end
	redirectProjectiles[frame] = nil
	end
end
 



 function gadget:ProjectileCreated(proID, proOwnerID)
	if (wiggleWeapon [Spring.GetProjectileDefID (proID)]) then
		local originalTarget = getTargetTable (proID)
		local tx,ty,tz = getProjectileTargetXYZ (proID)
		local x,y,z = Spring.GetUnitPosition (proOwnerID)

		addProjectileRedirect (proID, makeTargetTable(tx,Spring.GetGroundHeight (tx,tz)+600,tz), 10)
		addProjectileRedirect (proID, originalTarget, 45)
		addProjectileRedirect (proID, makeTargetTable(tx+math.random(-250,250),ty+(200+math.random(0,600)),tz+math.random(-250,250)), 30)

		addProjectileRedirect (proID, makeTargetTable(tx+math.random(-75,75),ty+math.random(-75,75),tz+math.random(-75,75)), 50)

		addProjectileRedirect (proID, originalTarget, 80)
		
		return true
	end
end


function getProjectileTargetXYZ (proID)
	local targetTypeInt, target  = Spring.GetProjectileTarget (proID)
	if targetTypeInt == string.byte('g') then
		return target[1],target[2],target[3]
	end
	if targetTypeInt == string.byte('u') then
		return Spring.GetUnitPosition (target)
	end
	if targetTypeInt == string.byte('f') then
		return Spring.GetFeaturePosition (target)
	end
	if targetTypeInt == string.byte('p') then
		return Spring.GetProjectilePosition (target)
	end
end

function addProjectileRedirect (proID, targetTable, delay)
	local f = Spring.GetGameFrame() + delay
	if not redirectProjectiles[f] then redirectProjectiles[f] = {} end
	redirectProjectiles[f][proID] = targetTable
end

function makeTargetTable (x,y,z)
	return {targetType = string.byte('g'), targetX=x,targetY=y,targetZ=z}
end

function getTargetTable (proID)
	local targetTable = {}
	local targetTypeInt, target  = Spring.GetProjectileTarget (proID)
	if targetTypeInt == string.byte('g') then 	--target is position on ground
		targetTable = {targetType = targetTypeInt, targetX=target[1],targetY=target[2],targetZ=target[3],}	
	else 										--target is unit,feature or projectile
		targetTable = {targetType = targetTypeInt, targetID=target,}		
	end
	return targetTable
end

function setTargetTable (proID, targetTable)	
	if targetTable.targetType == string.byte('g') then
		Spring.SetProjectileTarget (proID, targetTable.targetX, targetTable.targetY, targetTable.targetZ)
	else
		Spring.SetProjectileTarget (proID, targetTable.targetID, targetTable.targetType)		
	end
end