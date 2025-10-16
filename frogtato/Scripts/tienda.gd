extends Node

var objeto1 
var objeto2
var objeto3
@onready var runtime = preload("res://Scripts/runtime.gd")
@onready var Objeto_Tienda1 = $ItemTienda1
@onready var Objeto_Tienda2 = $ItemTienda2
@onready var Objeto_Tienda3 = $ItemTienda3
func _ready():
	pass
func tienda_llamada():
	objeto1 = item_random()
	Objeto_Tienda1.get_node("ItemTienda1/Sprite2D").texture = objeto1.sprite
	objeto2 = item_random()
	Objeto_Tienda2.get_node("ItemTienda2/Sprite2D").texture = objeto2.sprite
	objeto3 = item_random()
	Objeto_Tienda3.get_node("ItemTienda3/Sprite2D").texture = objeto3.sprite
	
func item_random():
	var rareza = random_rareza()
	if rareza == Item.TipoRareza.COMUN:
		var num_item =randi_range(1,len(runtime.ItemComunes))
		var item = runtime.ItemComunes[num_item]
		return item
	if rareza == Item.TipoRareza.RARO:
		var num_item =randi_range(1,len(runtime.ItemRaros))
		var item = runtime.ItemComunes[num_item]
		return item
		
	if rareza == Item.TipoRareza.EPICO:
		var num_item =randi_range(1,len(runtime.ItemEpicos))
		var item = runtime.ItemComunes[num_item]
		return item
	if rareza == Item.TipoRareza.LEGENDARIO:
		var num_item =randi_range(1,len(runtime.ItemLegendarios))
		var item = runtime.ItemComunes[num_item]
		return item
func random_rareza():
	#Suerte de Jugador
	pass
