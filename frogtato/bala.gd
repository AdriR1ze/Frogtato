extends Area2D
@export var speed = 600.0
@export var runtime := preload("res://Scripts/resources/runtime.tres")
@onready var player := get_node("/root/MainScene/sapo_prota")

var direction = Vector2.RIGHT
func _process(delta: float) -> void:
	direction = direction.normalized()	
	position += direction * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("grupo_enemigos"):
		body.take_damage(player.dano())
		queue_free()
