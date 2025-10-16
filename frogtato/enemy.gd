extends CharacterBody2D
@export var runtime := preload("res://Scripts/resources/runtime.tres")
@onready var sapo = get_node("/root/MainScene/sapo_prota")
var enemy_res: Enemigo
var direction = Vector2.ZERO
func _physics_process(delta: float) -> void:
	direction = (sapo.global_position - global_position).normalized()
	velocity = direction * enemy_res.mov_speed
	move_and_slide()
	
func apply_resource(res: Enemigo):
	enemy_res = res
	$Sprite2D.texture = res.sprite
	var vida = res.vida
	var mov_speed = res.mov_speed
	vida_label(vida)
	#modify_label(health)
func vida_label(vidaa: int) -> void:
	$Label.set_text(str(vidaa))
