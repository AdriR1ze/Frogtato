extends CharacterBody2D

@export var speed = 400
@onready var animated_sprite = $Sprite2D
var direction = Input.get_axis("a", "d")

func get_input():
	var input_direction = Input.get_vector("a", "d", "w", "s")
	velocity = input_direction * speed
	
func _physics_process(delta):
	get_input()
	move_and_slide()
	if Input.is_action_pressed("w") or Input.is_action_pressed("a") or Input.is_action_pressed("s") or Input.is_action_pressed("d"):
		animated_sprite.play("camina")
	else:
		animated_sprite.play("quieto")
	if Input.is_action_pressed("d"):
		animated_sprite.flip_h = false
	elif Input.is_action_pressed("a"):
			animated_sprite.flip_h = true
