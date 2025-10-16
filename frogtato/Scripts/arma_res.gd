extends Resource
class_name ArmaRes

@export var nombre : String
@export var daño : int
@export var cooldown : float
@export var rango : int
@export var sprite : CompressedTexture2D


func _init(nombre,daño,cooldown,rango,sprite) -> void:
	self.nombre = nombre
	self.daño = daño
	self.cooldown = cooldown
	self.rango = rango
	self.sprite = sprite

func _to_string() -> String:
	return self.nombre
	
