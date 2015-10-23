SECONDS = 60
MINUTES = 3600
GAME_DAY = 25000

require("defines")
require("util")
require("water_drain")

local function OnGameInit()
	modHasInitialised = true
	WaterDrain.OnInit()
end

local function OnGameLoad()
	WaterDrain.OnLoad()
end

local function OnGameSave()
	WaterDrain.OnSave()
end

local function OnPlayerCreated( player_index )
end

local function OnEntityBuilt( entity )
	WaterDrain.OnBuiltEntity(entity)
end

local function OnEntityDestroy( entity )
	WaterDrain.OnDestroyEntity(entity)
end

local function OnTick()
	WaterDrain.OnTick()
end

game.on_init(OnGameInit)
game.on_load(OnGameLoad)
game.on_save(OnGameSave)

game.on_event(defines.events.on_built_entity, function(event) OnEntityBuilt(event.created_entity) end)
game.on_event(defines.events.on_robot_built_entity, function(event) OnEntityBuilt(event.created_entity) end)

game.on_event(defines.events.on_entity_died, function(event) OnEntityDestroy(event.entity) end)
game.on_event(defines.events.on_preplayer_mined_item, function(event) OnEntityDestroy(event.entity) end)
game.on_event(defines.events.on_robot_pre_mined, function(event) OnEntityDestroy(event.entity) end)

game.on_event(defines.events.on_player_created, function(event) OnPlayerCreated(event.player_index) end)
game.on_event(defines.events.on_tick, OnTick)