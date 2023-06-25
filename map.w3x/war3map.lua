udg_unit = nil
gg_trg_udg = nil
gg_unit_Udre_0002 = nil
function InitGlobals()
end

function CreateBuildingsForPlayer0()
local p = Player(0)
local u
local unitID
local t
local life

gg_unit_Udre_0002 = BlzCreateUnitWithSkin(p, FourCC("Udre"), -161.3, -307.6, 297.084, FourCC("Udre"))
SetUnitColor(gg_unit_Udre_0002, ConvertPlayerColor(2))
end

function CreateUnitsForPlayer0()
local p = Player(0)
local u
local unitID
local t
local life

u = BlzCreateUnitWithSkin(p, FourCC("hfoo"), 15.7, 160.0, 273.733, FourCC("hfoo"))
u = BlzCreateUnitWithSkin(p, FourCC("hfoo"), -348.2, 38.8, 72.347, FourCC("hfoo"))
u = BlzCreateUnitWithSkin(p, FourCC("hfoo"), -515.4, -282.4, 50.451, FourCC("hfoo"))
u = BlzCreateUnitWithSkin(p, FourCC("hfoo"), -469.1, -682.0, 339.971, FourCC("hfoo"))
u = BlzCreateUnitWithSkin(p, FourCC("hfoo"), 13.0, -817.8, 161.086, FourCC("hfoo"))
u = BlzCreateUnitWithSkin(p, FourCC("hfoo"), 316.8, -666.8, 49.297, FourCC("hfoo"))
u = BlzCreateUnitWithSkin(p, FourCC("hfoo"), 399.1, -393.9, 277.172, FourCC("hfoo"))
end

function CreatePlayerBuildings()
CreateBuildingsForPlayer0()
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

function InitUpgrades_Player0()
SetPlayerTechMaxAllowed(Player(0), FourCC("Rhme"), 0)
SetPlayerTechResearched(Player(0), FourCC("Rhra"), 1)
SetPlayerTechResearched(Player(0), FourCC("Rhhb"), 1)
end

function InitUpgrades_Player1()
SetPlayerTechResearched(Player(1), FourCC("Rura"), 2)
end

function InitUpgrades()
InitUpgrades_Player0()
InitUpgrades_Player1()
end

function InitTechTree_Player0()
SetPlayerAbilityAvailable(Player(0), FourCC("AHds"), false)
SetPlayerAbilityAvailable(Player(0), FourCC("AHbn"), false)
SetPlayerTechMaxAllowed(Player(0), FourCC("hpea"), 0)
SetPlayerTechMaxAllowed(Player(0), FourCC("hrif"), 0)
SetPlayerTechMaxAllowed(Player(0), FourCC("halt"), 0)
end

function InitTechTree()
InitTechTree_Player0()
end

function InitCustomPlayerSlots()
SetPlayerStartLocation(Player(0), 0)
SetPlayerColor(Player(0), ConvertPlayerColor(0))
SetPlayerRacePreference(Player(0), RACE_PREF_HUMAN)
SetPlayerRaceSelectable(Player(0), false)
SetPlayerController(Player(0), MAP_CONTROL_USER)
SetPlayerStartLocation(Player(1), 1)
ForcePlayerStartLocation(Player(1), 1)
SetPlayerColor(Player(1), ConvertPlayerColor(1))
SetPlayerRacePreference(Player(1), RACE_PREF_UNDEAD)
SetPlayerRaceSelectable(Player(1), false)
SetPlayerController(Player(1), MAP_CONTROL_USER)
end

function InitCustomTeams()
SetPlayerTeam(Player(0), 0)
SetPlayerTeam(Player(1), 1)
end

function InitAllyPriorities()
SetStartLocPrioCount(0, 1)
SetStartLocPrio(0, 0, 1, MAP_LOC_PRIO_HIGH)
SetStartLocPrioCount(1, 1)
SetStartLocPrio(1, 0, 0, MAP_LOC_PRIO_HIGH)
end

function main()
local we

SetCameraBounds(-2048.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), -2048.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 2048.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 2048.0 - GetCameraMargin(CAMERA_MARGIN_TOP), -2048.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 2048.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 2048.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), -2048.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
SetTerrainFogEx(0, 3000.0, 5000.0, 0.500, 0.000, 0.000, 0.000)
SetWaterBaseColor(255, 0, 0, 255)
we = AddWeatherEffect(Rect(-2048.0, -2048.0, 2048.0, 2048.0), FourCC("RAhr"))
EnableWeatherEffect(we, true)
NewSoundEnvironment("Dungeon")
SetAmbientDaySound("SunkenRuinsDay")
SetAmbientNightSound("SunkenRuinsNight")
SetMapMusic("Music", true, 0)
InitUpgrades()
InitTechTree()
CreateAllUnits()
InitBlizzard()
InitGlobals()
InitCustomTriggers()
RunInitializationTriggers()
end

function config()
SetMapName("TRIGSTR_001")
SetMapDescription("TRIGSTR_005")
SetPlayers(2)
SetTeams(2)
SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)
DefineStartLocation(0, 1280.0, 448.0)
DefineStartLocation(1, 256.0, 1408.0)
InitCustomPlayerSlots()
InitCustomTeams()
InitAllyPriorities()
end

