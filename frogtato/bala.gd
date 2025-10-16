extends Area2D
@export var speed = 600.0
@export var runtime := preload("res://Scripts/resources/runtime.tres")
var direction = Vector2.RIGHT
func _process(delta: float) -> void:
	direction = direction.normalized()	
	position += direction * speed * delta

func _on_body_entered(body: Node2D) -> void:
	print(body.get_groups())
	if body.is_in_group("grupo_enemigos"):
		print("aaaaaaaaaaaaaaaaaaaaaaaa")
		queue_free()# Replace with function body.
