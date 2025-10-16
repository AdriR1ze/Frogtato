extends Resource
class_name Item
enum TipoRareza {
	COMUN,
	RARO,
	EPICO,
	LEGENDARIO
}

@export var nombre : String
@export var modificador : float
@export var rareza : TipoRareza
@export var sprite : CompressedTexture2D

func _init(nombre,modificador,rareza,sprite):
	self.nombre = nombre
	self.modificador = modificador
	self.rareza = rareza
	self.sprite = sprite
