extends Area2D
@export var runtime := preload("res://Scripts/resources/runtime.tres")
@export var tiempo_aparicion := 1.0
var contador_aparicion = 0.0
func enemigo_random():
	var random_enemies = randi_range(0, len(runtime.Enemigos)-1)

	return runtime.Enemigos[random_enemies]

func spawn_enemy():
	var random_enemigo = enemigo_random()
	var enemigo = random_enemigo.scene.instantiate()
	enemigo.apply_resource(random_enemigo)
	var x = self.global_position
	enemigo.position = x
	get_tree().current_scene.add_child(enemigo)
	enemigo.add_to_group("grupo_enemigos")
	
func _process(delta: float) -> void:
	contador_aparicion += delta
	if contador_aparicion>= tiempo_aparicion:
		spawn_enemy()
		contador_aparicion = 0.0
		self.queue_free()
