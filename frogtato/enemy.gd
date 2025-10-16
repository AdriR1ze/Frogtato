extends CharacterBody2D
@export var runtime := preload("res://Scripts/resources/runtime.tres")
@onready var sapo = get_node("/root/MainScene/sapo_prota")
@onready var main_scene = get_node("/root/MainScene")
@onready var tienda = get_node("/root/MainScene/Tienda")
var enemy_res: Enemigo
var direction = Vector2.ZERO
var current_health
func _ready() -> void:
	print(tienda)
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

func die():
	queue_free()
func apply_resource(res: Enemigo):
	enemy_res = res
	$Sprite2D.texture = res.sprite
	# Podés inicializar cualquier otra variable, como:
	var vida = res.vida
#	current_health = vida
	var mov_speed = res.mov_speed 
	#enemy_res = res
	$Sprite2D.texture = res.sprite
	#var vida = res.vida * tienda.dificultad
#	var mov_speed = res.mov_speed * tienda.dificultada() - (tienda.dificultada() - 1) / 4
	current_health = vida
	vida_label(vida)
	
	
func vida_label(vidaa: float) -> void:
	$Label.set_text(str(vidaa))
