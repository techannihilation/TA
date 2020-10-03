function gadget:GetInfo()
	return {
		name = "Disable Tech Level", --based on "Disable Buildoptions" made by quantum
		desc = "",
		author = "Silver",
		version = "",
		date = "2020",
		license = "GNU GPL, v2 or later",
		layer = -20,
		enabled = true
	}
end

if (gadgetHandler:IsSyncedCode()) then
	--------------------------------------------------------------------------------
	-- BEGIN SYNCED
	--------------------------------------------------------------------------------
	local maxtech = tonumber(Spring.GetModOptions().mo_maxtech) or 0
	local EditUnitCmdDesc = Spring.EditUnitCmdDesc
	local FindUnitCmdDesc = Spring.FindUnitCmdDesc
	local warncolor = "\255\255\64\64"

	local Builders = {
		-- ARM --
		[UnitDefNames.armalab.id] = 2, -- T2 Kbot
		[UnitDefNames.spiderlab.id] = 2, -- T2 All-Terrian
		[UnitDefNames.armavp.id] = 2, -- T2 Veh Lab
		[UnitDefNames.aahp.id] = 2, -- T2 Hovercraft
		[UnitDefNames.armaap.id] = 2, -- T2 Aircraft
		[UnitDefNames.armplat.id] = 2, -- T2 Seaplane
		[UnitDefNames.aahpns.id] = 2, -- T2 Hovercraft NS
		[UnitDefNames.armasy.id] = 2, -- T2 Shipyard
		[UnitDefNames.asubpen.id] = 2, -- T2 Subs

		[UnitDefNames.armshltx.id] = 3, -- T3 Kbot
		[UnitDefNames.armevp.id] = 3, -- T3 Veh
		[UnitDefNames.armeap.id] = 3, -- T3 Kbot
		[UnitDefNames.arm_mech_lab.id] = 4, -- T4 Kbot
		[UnitDefNames.ashipyardlvl3.id] = 5, -- T5 HERO 

		-- CORE --
		[UnitDefNames.coralab.id] = 2, -- T2 Kbot
		[UnitDefNames.cortlab.id] = 2, -- T2 All-Terrian
		[UnitDefNames.coravp.id] = 2, -- T2 Veh Lab
		[UnitDefNames.cahp.id] = 2, -- T2 Hovercraft
		[UnitDefNames.coraap.id] = 2, -- T2 Aircraft
		[UnitDefNames.corplat.id] = 2, -- T2 Seaplane
		[UnitDefNames.cahpns.id] = 2, -- T2 Hovercraft NS
		[UnitDefNames.corasy.id] = 2, -- T2 Shipyard
		[UnitDefNames.csubpen.id] = 2, -- T2 Subs

		[UnitDefNames.corgant.id] = 3, -- T3 Kbot
		[UnitDefNames.corevp.id] = 3, -- T3 Veh
		[UnitDefNames.coreap.id] = 3, -- T3 Kbot
		[UnitDefNames.core_hexapod_lab.id] = 4, -- T4 Kbot
		[UnitDefNames.cshipyardlvl4.id] = 5, -- T5 HERO 

		-- TLL --
		[UnitDefNames.tllalab.id] = 2, -- T2 Kbot
		[UnitDefNames.tllturtle_lab.id] = 2, -- T2 All-Terrian
		[UnitDefNames.tllavp.id] = 2, -- T2 Veh
		[UnitDefNames.tllahp.id] = 2, -- T2 Hovercraft 
		[UnitDefNames.tllaap.id] = 2, -- T2 Aircraft
		[UnitDefNames.tllplat.id] = 2, -- T2 Seaplane
		[UnitDefNames.tllahpns.id] = 2, -- T2 Hovercraft NS
		[UnitDefNames.tllasy.id] = 2, -- T2 Shipyard
		[UnitDefNames.tllsubpen.id] = 2, -- T2 Subs

		[UnitDefNames.tllhtcp.id] = 3, -- T3 Kbot
		[UnitDefNames.tllevp.id] = 3, -- T3 Veh
		[UnitDefNames.tlleap.id] = 3, -- T3 Aircraft 
		[UnitDefNames.tllprototype.id] = 4, -- T4 Kbot
		[UnitDefNames.tllshipyardlvl3.id] = 5 -- T5 HERO 
	}

	GG.ignoredBuilders = Builders

	local function DisableBuildButton(unitID,buildoptionID,tooltip)
		local cmdDescID = FindUnitCmdDesc(unitID,-buildoptionID) -- even this can be cached too.

		if (cmdDescID) then
			local cmdArray = {
				disabled = true,
				tooltip = tooltip
			}

			EditUnitCmdDesc(unitID,cmdDescID,cmdArray)
		end
	end

	function gadget:UnitCreated(unitID,unitDefID)
		if maxtech == 0 or maxtech > 4 then return end
		local unitDef = UnitDefs[unitDefID] -- it is not great now, cache units with build options in next version.

		if unitDef.buildOptions then
			for _,buildoptionID in ipairs(unitDef.buildOptions) do
				if Builders[buildoptionID] and Builders[buildoptionID] > maxtech then
					tooltip = warncolor .. "T" .. Builders[buildoptionID] .. " TECHNOLOGY IS DISABLED"
					DisableBuildButton(unitID,buildoptionID,tooltip)
				end
			end
		end
	end
	--------------------------------------------------------------------------------
	-- END SYNCED
	-- BEGIN UNSYNCED
	--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
-- END UNSYNCED
--------------------------------------------------------------------------------