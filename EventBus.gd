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

signal spawn_entity(card: Card)

signal inventory_card_selected(card: Card)

signal play_card(card: Card, location: GridItem)
