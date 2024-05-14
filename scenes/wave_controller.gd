class_name WaveController extends HBoxContainer

var waves: Array[Node]
var current_wave_index: int = 0
var current_wave: Wave

func setup_signals():
	for wave: Wave in waves:
		wave.wave_started.connect(_on_wave_started)

func _ready():
	print("HUD#ready")
	waves = find_waves()
	print(waves)
	setup_signals()
	#start()

func find_waves():
	return find_children("","Wave")
	
func set_current_wave(index: int):
	current_wave_index = index
	current_wave = waves[current_wave_index]
	EventBus.set_current_wave.emit(current_wave)

func start():
	set_current_wave(current_wave_index)
	print("HUD#Starting wave %s" % current_wave)
	current_wave.start()

func _on_wave_started(wave: Wave):
	print("WaveController#Wave %s started" % wave)

func _on_wave_ended(wave: Wave):
	print("WaveController#Wave Ended %s" % wave)
	if current_wave_index +1 < waves.size():
		set_current_wave(current_wave_index +1)
	else:
		EventBus.level_completed.emit()

func _on_timer_timeout():
	print("WaveController#timeout")

func _on_card_spawn_entity(card: Card):
	print("on_card_spawn_entity")
	EventBus.spawn_entity.emit(card)
