extends Resource

@export var Items : Array
@export var Armas : Array
@export var Enemigos : Array
@export var enemigo1 : Enemigo
@export var item_dano : Item
@export var item_movspeed : Item
@export var item_atkspeed : Item
@export var item_suerte : Item

@export var ItemComunes : Array
@export var ItemRaros : Array
@export var ItemEpicos : Array
@export var ItemLegendarios : Array
func _init() -> void:
	Items.append(item_movspeed)
	Items.append(item_suerte)
	Items.append(item_atkspeed)
	Items.append(item_dano)
	for a in Items:
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
			ItemLegendarios.append(a)
	
