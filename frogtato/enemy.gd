extends CharacterBody2D
@export var runtime := preload("res://Scripts/resources/runtime.tres")
@onready var sapo = get_node("/root/MainScene/sapo_prota")
@onready var main_scene = get_node("/root/MainScene")
@onready var tienda = get_tree().current_scene.get_node("/root/MainScene/Tienda")
@onready var label_nodo = get_node("/root/MainScene/sapo_prota")
var enemy_res: Enemigo
var direction = Vector2.ZERO
var current_health
func _physics_process(delta: float) -> void:
	direction = (sapo.global_position - global_position).normalized()
	velocity = direction * enemy_res.mov_speed
	move_and_slide()


func take_damage(amount):
	current_health -= amount
	#print(current_health)
	#print(amount)
	if current_health <= 0:
		die()
	vida_label(current_health)

func die():
	queue_free()
func apply_resource(res: Enemigo):
	enemy_res = res
	$Sprite2D.texture = res.sprite
	var vida = res.vida
	var mov_speed = res.mov_speed 
	#var vida = res.vida * tienda.dificultada()
	#var mov_speed = res.mov_speed * tienda.dificultada() - (tienda.dificultada() - 1) / 4
	current_health = vida
	vida_label(vida)
	
	
func vida_label(vidaa: float) -> void:
	print(vidaa)
	$Label.set_text(str(vidaa))
