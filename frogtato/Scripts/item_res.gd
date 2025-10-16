extends Resource
class_name ItemEstadistica_Res

enum TipoEstadistica {
	DANO,
	ATKSPEED,
	VELOCIDAD,
	SUERTE,
	
}
enum TipoRareza {
	COMUN,
	RARO,
	EPICO,

	LEGENDARIO
}
@export var nombre : String
@export var modificador : int
@export var tipo_estadistica : TipoEstadistica	
@export var descripcion : String
@export var rareza : TipoRareza
@export var sprite : CompressedTexture2D
func _init(nombre,modificador,tipo_estadistica,descripcion, rareza, sprite) -> void:
	self.nombre = nombre
	self.modificador = modificador
	self.tipo_estadistica = tipo_estadistica
	self.descripcion = descripcion
	self.rareza = rareza
	self.sprite = sprite

func _to_string() -> String:
	return self.nombre
