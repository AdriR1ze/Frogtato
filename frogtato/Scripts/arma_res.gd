extends Resource
class_name Arma
@export var nombre : String
@export var vida : float
@export var dano : float
@export var mov_speed : float
@export var sprite : CompressedTexture2D

func _init(nombre,dano,cooldown,sprite):
	self.nombre = nombre
	self.dano = dano
	self.cooldown = cooldown
	self.sprite = sprite
