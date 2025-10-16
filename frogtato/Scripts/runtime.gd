extends Resource
class_name Runtime_res
@export var Items : Array
@export var Armas : Array
@export var Enemigos : Array
#@export var enemigo1 : Enemigo
@export var item_dano : Item
@export var item_movspeed : Item
@export var item_atkspeed : Item
@export var item_suerte : Item

@export var ItemComunes : Array
@export var ItemRaros : Array
@export var ItemEpicos : Array
@export var ItemLegendarios : Array

var sprite_enemigo_1 = preload("res://Imagenes/sprites_ONIET/sprites_ONIET/imagenes/monstruo_babosa.png")	
var enemigo_1 := Enemigo.new("Babosa", 100.0, 20.0, 200.0, sprite_enemigo_1, load("res://enemy.tscn"))


func _init() -> void:
	Enemigos.append(enemigo_1)
	Items.append(item_movspeed)
	Items.append(item_suerte)
	Items.append(item_atkspeed)
	Items.append(item_dano)
	"""for a in Items:
		if a.rareza == Item.TipoRareza.COMUN:
			ItemComunes.append(a)
	for a in Items:
		if a.rareza == Item.TipoRareza.RARO:
			ItemRaros.append(a)
	for a in Items:
		if a.rareza == Item.TipoRareza.EPICO:
			ItemEpicos.append(a)
	for a in Items:
		if a.rareza == Item.TipoRareza.LEGENDARIO:
			ItemLegendarios.append(a)"""
	
