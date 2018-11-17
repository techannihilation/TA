   function gadget:GetInfo()
      return {
        name      = "Reclaim flash",
        desc      = "Nice tree reclaim effect",
        author    = "Beherith",
        date      = "July 2011",
        license   = "PD",
        layer     = 0,
        enabled   = true,
      }
    end


local SpSpawnCEG = Spring.SpawnCEG
local SpGetFeatureResources = Spring.GetFeatureResources
local SpGetFeaturePosition = Spring.GetFeaturePosition


if (not gadgetHandler:IsSyncedCode()) then
  return
end

function gadget:FeatureDestroyed(featureID, _)
	fx,fy,fz=SpGetFeaturePosition(featureID)
	--Spring.Echo(allyteam)
	if (fx ~= nil) then
		rm, mm, re, me, rl = SpGetFeatureResources(featureID)
		if (rm ~= nil) then
			if mm==0 and re == 0 then
				SpSpawnCEG("sparklegreen", fx, fy, fz)
			end
		end
	end
end

