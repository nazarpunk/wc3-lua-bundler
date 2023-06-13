gg_trg_trig1 = nil
gg_trg_trig2 = nil
function InitGlobals()
end

print('main')
function CreateUnitsForPlayer0()
local p = Player(0)
local u
local unitID
local t
local life

u = BlzCreateUnitWithSkin(p, FourCC("Udre"), -161.3, -307.6, 297.084, FourCC("Udre"))
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

-- CUSTOM CODE
print('CC')
function Trig_trig1_Actions()
end

function InitTrig_trig1()
gg_trg_trig1 = CreateTrigger()
TriggerAddAction(gg_trg_trig1, Trig_trig1_Actions)
end

function Trig_trig2_Actions()
FogEnableOn()
end

function InitTrig_trig2()
gg_trg_trig2 = CreateTrigger()
TriggerAddAction(gg_trg_trig2, Trig_trig2_Actions)
end

function InitCustomTriggers()
InitTrig_trig1()
InitTrig_trig2()
end

function RunInitializationTriggers()
ConditionalTriggerExecute(gg_trg_trig1)
ConditionalTriggerExecute(gg_trg_trig2)
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
SetMapDescription("")
SetPlayers(1)
SetTeams(1)
SetGamePlacement(MAP_PLACEMENT_USE_MAP_SETTINGS)
DefineStartLocation(0, 1280.0, 448.0)
InitCustomPlayerSlots()
SetPlayerSlotAvailable(Player(0), MAP_CONTROL_USER)
InitGenericPlayerSlots()
end

