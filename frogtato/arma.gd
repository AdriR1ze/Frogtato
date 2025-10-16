extends Node2D
class_name Arma
@onready var spawnpoint_nodo = $spawnpoint
@onready var bala_escena = preload("res://bala.tscn")
@export var runtime := preload("res://Scripts/resources/runtime.tres")
var direction = Vector2.RIGHT
var cooldown = 1.0
var anterior_disparo = 0.0

func apuntar(target_pos: Vector2) -> void:
	var direction = (target_pos - global_position).normalized()
	rotation = direction.angle()

func enemigo_mas_cercano(enemigo):
	pass

func _process(delta: float) -> void:
	
	anterior_disparo += delta
	var mouse_pos = get_global_mouse_position()
	apuntar(mouse_pos)

	if anterior_disparo >= cooldown:
		disparar()
		anterior_disparo = 0.0
	
func disparar() -> void:
	var bala_instanciada = bala_escena.instantiate()
	get_tree().current_scene.add_child(bala_instanciada)
	bala_instanciada.position = spawnpoint_nodo.global_position
	bala_instanciada.rotation = rotation
	bala_instanciada.direction = Vector2.RIGHT.rotated(rotation)
