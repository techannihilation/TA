--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    callins.lua
--  brief:   array and map of call-ins
--  author:  Dave Rodgers
--
--  Copyright (C) 2007.
--  Licensed under the terms of the GNU GPL, v2 or later.
--
--  functions listed here are reserved and not allowed to be RegisterGlobal()'ed
--  they are set to 'nil' if not used by any gadget, see gadgetHandler:UpdateCallIn
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

CALLIN_MAP = {}
CALLIN_LIST = {
	-- Save/Load
	"Save",
	"Load",

	-- called when Lua is disabled or this client exits
	"Shutdown",

	-- game callins
	"GameSetup",               -- FIXME: not implemented by base GH
	"GamePreload",
	"GameStart",
	"GameLoadLua",
	"GameStartPlaying",
	"GameOver",
	"GameFrame",
	"GameFramePost",
	"GameProgress",            -- FIXME: not implemented by base GH
	"GameID",

	-- player callins
	"PlayerChanged",
	"PlayerAdded",
	"PlayerRemoved",

	-- team callins
	"TeamDied",
	"TeamChanged",

	-- unit callins
	"UnitCreated",
	"UnitFinished",
	"UnitFromFactory",
	"UnitReverseBuilt",
	"UnitDestroyed",
	"UnitDestroyedByTeam",
	"RenderUnitDestroyed",
	"UnitExperience",
	"UnitIdle",
	"UnitCmdDone",
	"UnitPreDamaged",
	"UnitDamaged",
	"UnitTaken",
	"UnitGiven",
	"UnitEnteredRadar",
	"UnitEnteredLos",
	"UnitLeftRadar",
	"UnitLeftLos",
	"UnitSeismicPing",
	"UnitLoaded",
	"UnitUnloaded",
	"UnitHarvestStorageFull",
	"UnitCloaked",
	"UnitDecloaked",
	"UnitUnitCollision",
	"UnitFeatureCollision",
	"UnitMoveFailed",
	"UnitMoved",               -- FIXME: not exposed to Lua yet (as of 95.0)
	"UnitEnteredAir",          -- FIXME: not implemented by base GH
	"UnitLeftAir",             -- FIXME: not implemented by base GH
	"UnitEnteredWater",        -- FIXME: not implemented by base GH
	"UnitLeftWater",           -- FIXME: not implemented by base GH
	"UnitCommand",             -- FIXME: not implemented by base GH
	"UnitBlocked",
	"UnitSale",
	"UnitSold",
	"MetaUnitAdded",
	"MetaUnitRemoved",
	"VisibleUnitAdded",
	"VisibleUnitRemoved",
	"VisibleUnitsChanged",
	"AlliedUnitAdded",
	"AlliedUnitRemoved",
	"AlliedUnitsChanged",

	-- weapon callins
	"StockpileChanged",

	-- feature callins
	"FeatureCreated",
	"FeatureDestroyed",
	--"FeatureDamaged",
	"FeatureMoved",            -- FIXME: not exposed to Lua yet (as of 95.0)
	--"FeaturePreDamaged",

	-- projectile callins
	"ProjectileCreated",
	"ProjectileDestroyed",

	-- shield callins
	"ShieldPreDamaged",

	-- misc synced LuaRules callins
	"AllowCommand",
	"AllowStartPosition",
	"AllowUnitCreation",
	"AllowUnitTransfer",
	"AllowUnitTransportLoad",
	"AllowUnitTransportUnload",
	"AllowUnitBuildStep",
	"AllowUnitCaptureStep",
	"AllowFeatureBuildStep",
	"AllowFeatureCreation",
	"AllowResourceLevel",
	"AllowResourceTransfer",
	"AllowDirectUnitControl",
	"AllowWeaponTargetCheck",
	"AllowWeaponTarget",

	"Explosion",
	"CommandFallback",
	"MoveCtrlNotify",
	"TerraformComplete",

	-- synced message callins
	"GotChatMsg",
	"RecvLuaMsg",

	-- unsynced callins
	"Update",
	"UnsyncedHeightMapUpdate", -- FIXME: not implemented by base GH

	"DrawGenesis",
	"DrawGroundDeferred",
	"DrawWorld",
	"DrawWorldPreUnit",
	"DrawPreDecals",
	"DrawWorldPreParticles",
	"DrawWorldShadow",
	"DrawWorldReflection",
	"DrawWorldRefraction",
	"DrawUnitsPostDeferred",
	"DrawFeaturesPostDeferred",
	"DrawGroundPreForward",
	"DrawGroundPostForward",
	"DrawGroundPreDeferred",
	"DrawGroundPostDeferred",
	"DrawScreenEffects",
	"DrawScreenPost",
	"DrawScreen",
	"DrawInMiniMap",
	"DrawOpaqueUnitsLua",
	"DrawOpaqueFeaturesLua",
	"DrawAlphaUnitsLua",
	"DrawAlphaFeaturesLua",
	"DrawShadowUnitsLua",
	"DrawShadowFeaturesLua",

	"DrawUnit",
	"DrawFeature",
	"DrawShield",
	"DrawProjectile",

	-- unsynced message callins
	"RecvFromSynced",
	"RecvSkirmishAIMessage",
	"Pong",

	"DefaultCommand",
	"ActiveCommandChanged",
	"CameraRotationChanged",
	"CameraPositionChanged",
	"CommandNotify",

	"ViewResize", -- FIXME ?
	"LayoutButtons",
	"ConfigureLayout",

	"AddConsoleLine",
	"GroupChanged",
	"LanguageChanged",
	"FontsChanged",
	"SunChanged",

	-- moved from LuaUI
	"KeyPress",
	"KeyRelease",
	"TextInput",
	"TextEditing",
	"MousePress",
	"MouseRelease",
	"MouseMove",
	"MouseWheel",
	"ControllerAdded",
	"ControllerRemoved",
	"ControllerConnected",
	"ControllerDisconnected",
	"ControllerRemapped",
	"ControllerButtonUp",
	"ControllerButtonDown",
	"ControllerAxisMotion",

	"IsAbove",
	"GetTooltip",

	"WorldTooltip",            -- FIXME: not implemented by base GH
	"MapDrawCmd",              -- FIXME: not implemented by base GH
	"ShockFront",              -- FIXME: not implemented by base GH
	"VisibleExplosion",
	"Barrelfire",
	"CrashingAircraft",
	"ClearMapMarks",

	"CobCallback",

	"DownloadQueued",
	"DownloadStarted",
	"DownloadFinished",
	"DownloadFailed",
	"DownloadProgress",
}

for callinIdx, callinName in ipairs(CALLIN_LIST) do
	CALLIN_MAP[callinName] = callinIdx
end

CallInsList = CALLIN_LIST
CallInsMap = CALLIN_MAP

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
