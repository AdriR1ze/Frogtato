extends Resource
class_name Enemigo
@export var nombre : String
@export var vida : float
@export var dano : float
@export var mov_speed : float
@export var sprite : CompressedTexture2D

func _init(nombre,vida,dano,mov_speed,sprite):
	self.nombre = nombre
	self.vida = vida
	self.dano = dano
	self.mov_speed = mov_speed
	self.sprite = sprite
