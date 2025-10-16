extends CharacterBody2D
class_name Player
@export var speed = 500
@export var attack_speed = 1.0
@export var items_comprados : Array
@export var lista_armas : Array 
var armass = preload("res://arma.tscn")
@export var runtime = preload("res://Scripts/resources/runtime.tres")
@onready var animated_sprite = $Sprite2D

func _ready() -> void:
	pass

	
func AgregarItem(item: ItemEstadistica_Res ) -> void:
	items_comprados.append(item)
func AgregarArma(arma: Arma) -> void:
	lista_armas.append(arma)
	var armasss = armass.instantiate()
	get_tree().current_scene.add_child(armasss)
	armasss.position = Vector2(20,90)
	armasss.get_node("ani").play(arma.nombre)


func dano():
	var dano = 100
	for a in items_comprados:
		if a.tipo_estadistica == ItemEstadistica_Res.TipoEstadistica.DANO:
			pass
			#dano += a.modificador
	return(dano)
func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO
	if Input.is_anything_pressed():
		if Input.is_action_pressed("w"):
			direction.y -= 1
			
			animated_sprite.play("camina")
		if Input.is_action_pressed("s"):
			direction.y += 1
			animated_sprite.play("camina")
		if Input.is_action_pressed("d"):
			direction.x += 1
			animated_sprite.flip_h = true
			animated_sprite.play("camina")
		if Input.is_action_pressed("a"):
			direction.x -= 1
			animated_sprite.flip_h = true
			animated_sprite.play("camina")
	else:
		animated_sprite.play("quieto")
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		
	velocity = direction * speed
	move_and_slide()
	

func suerte():
	return 1
		
	
