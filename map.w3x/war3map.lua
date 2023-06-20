udg_unit = nil
gg_trg_udg = nil
gg_unit_Udre_0002 = nil
function InitGlobals()
end

function CreateUnitsForPlayer0()
local p = Player(0)
local u
local unitID
local t
local life

u = BlzCreateUnitWithSkin(p, FourCC("hfoo"), 15.7, 160.0, 273.733, FourCC("hfoo"))
gg_unit_Udre_0002 = BlzCreateUnitWithSkin(p, FourCC("Udre"), -161.3, -307.6, 297.084, FourCC("Udre"))
u = BlzCreateUnitWithSkin(p, FourCC("hfoo"), -348.2, 38.8, 72.347, FourCC("hfoo"))
u = BlzCreateUnitWithSkin(p, FourCC("hfoo"), -515.4, -282.4, 50.451, FourCC("hfoo"))
u = BlzCreateUnitWithSkin(p, FourCC("hfoo"), -469.1, -682.0, 339.971, FourCC("hfoo"))
u = BlzCreateUnitWithSkin(p, FourCC("hfoo"), 13.0, -817.8, 161.086, FourCC("hfoo"))
u = BlzCreateUnitWithSkin(p, FourCC("hfoo"), 316.8, -666.8, 49.297, FourCC("hfoo"))
u = BlzCreateUnitWithSkin(p, FourCC("hfoo"), 399.1, -393.9, 277.172, FourCC("hfoo"))
end

function CreatePlayerBuildings()
end

function CreatePlayerUnits()
CreateUnitsForPlayer0()
end

function CreateAllUnits()
CreatePlayerBuildings()
CreatePlayerUnits()
end

function Trig_udg_Actions()
udg_unit = gg_unit_Udre_0002
end

function InitTrig_udg()
gg_trg_udg = CreateTrigger()
TriggerAddAction(gg_trg_udg, Trig_udg_Actions)
end

function InitCustomTriggers()
InitTrig_udg()
end

function RunInitializationTriggers()
ConditionalTriggerExecute(gg_trg_udg)
end

function InitCustomPlayerSlots()
SetPlayerStartLocation(Player(0), 0)
SetPlayerColor(Player(0), ConvertPlayerColor(0))
SetPlayerRacePreference(Player(0), RACE_PREF_HUMAN)
SetPlayerRaceSelectable(Player(0), true)
SetPlayerController(Player(0), MAP_CONTROL_USER)
end

function InitCustomTeams()
SetPlayerTeam(Player(0), 0)
end

function main()
SetCameraBounds(-2048.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), -2048.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 2048.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 2048.0 - GetCameraMargin(CAMERA_MARGIN_TOP), -2048.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 2048.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 2048.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), -2048.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
NewSoundEnvironment("Default")
SetAmbientDaySound("SunkenRuinsDay")
SetAmbientNightSound("SunkenRuinsNight")
SetMapMusic("Music", true, 0)
CreateAllUnits()
InitBlizzard()
InitGlobals()
InitCustomTriggers()
RunInitializationTriggers()
end

function config()
SetMapName("TRIGSTR_001")
SetMapDescription("TRIGSTR_005")
SetPlayers(1)
SetTeams(1)
SetGamePlacement(MAP_PLACEMENT_USE_MAP_SETTINGS)
DefineStartLocation(0, 1280.0, 448.0)
InitCustomPlayerSlots()
SetPlayerSlotAvailable(Player(0), MAP_CONTROL_USER)
InitGenericPlayerSlots()
end

