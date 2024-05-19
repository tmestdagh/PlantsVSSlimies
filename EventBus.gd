extends Node

signal spawn_slime(position)
signal sunshine
signal gameover
signal sols_update(sols)
signal retry
signal sale
signal grid_item_selected(grid_item)
signal plant(grid_item, plant)
signal plant_selected(plant)

signal set_current_wave(wave: Wave)

signal waves_completed
signal level_completed

signal spawn_entity(card: Card)

signal inventory_card_selected(card: Card)

signal play_card(card: Card, location: GridItem)

signal game_state_updated(game_state)
