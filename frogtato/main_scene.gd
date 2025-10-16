extends Node2D
@export var runtime := preload("res://Scripts/resources/runtime.tres")
var spawnpoint_enemigo = preload("res://spawnpoint_enemigos.tscn")
var aparicion_timer = 1.0
var aparicion_contador = 0.0
@onready var musica_juego = $AudioStreamPlayer
func spawn_spawnpoint():
	var newSpawnpoint = spawnpoint_enemigo.instantiate()
	var screen_size = get_viewport_rect().size
	var random_x = randf_range(0, screen_size.x)
	var random_y = randf_range(0, screen_size.y)
	newSpawnpoint.position = Vector2(random_x, random_y)
	get_tree().current_scene.add_child(newSpawnpoint)
	

func _process(delta: float) -> void:
	
	aparicion_contador += delta
	if aparicion_contador >= aparicion_timer:
		spawn_spawnpoint()
		aparicion_contador = 0.0
	$Label.set_text(str($Timer.get_time_left()).pad_decimals(0))
func _ready():
	musica_juego.play()
	
