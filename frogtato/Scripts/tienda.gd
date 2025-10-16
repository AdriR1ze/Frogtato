extends Node2D
@onready var main_scene = get_node("/root/MainScene")
@onready var player = get_node("/root/MainScene/sapo_prota")
@onready var enemigo = get_node("/root/MainScene/enemigo") 
# Variables normales
var random_objeto1: int
var random_objeto2: int
var random_objeto3: int
var objeto1
var objeto2
var objeto3
var contador_tienda = 15
var dificultad = 1
@export var runtime = preload("res://Scripts/resources/runtime.tres")


var Objeto_tienda1
var Objeto_tienda2
var Objeto_tienda3
var contador = 0


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	
	tienda_llamada()

func _process(delta: float) -> void:

	if int(main_scene.get_node("Timer").time_left) < 56:
		main_scene.get_node("Timer").start()
		tienda_llamada()

func tienda_llamada():
	Objeto_tienda1 = $ItemTienda1
	Objeto_tienda2 = $ItemTienda2
	Objeto_tienda3 = $ItemTienda3
	
	get_tree().paused = true
	visible = true  	
	objeto1 = ItemEstadistica_Res_random()
	Objeto_tienda1.get_node("Sprite2D").texture = objeto1.sprite
	objeto2 = ItemEstadistica_Res_random()
	Objeto_tienda2.get_node("Sprite2D").texture = objeto2.sprite
	objeto3 = ItemEstadistica_Res_random()
	Objeto_tienda3.get_node("Sprite2D").texture = objeto3.sprite

func dificultada():
	return dificultad

func _on_button_pressed() -> void:
	player.AgregarItem(objeto1)
	
	tienda_cerrar()

func _on_button_2_pressed() -> void:
	player.AgregarItem(objeto2)

	tienda_cerrar()

func _on_button_3_pressed() -> void:
	player.AgregarItem(objeto3)

	tienda_cerrar()


func tienda_cerrar():
	get_tree().paused = false
	visible = false
	dificultad += 0.15
	

func arma_random():
	var random_number = randi_range(0, len(runtime.Armas) - 1)
	return runtime.Armas[random_number]

func ItemEstadistica_Res_random():
	var rareza = get_random_rareza(player.suerte())
	var lista = []

	match rareza:
		ItemEstadistica_Res.TipoRareza.COMUN: lista = runtime.Itemscomunes
		ItemEstadistica_Res.TipoRareza.RARO: lista = runtime.Itemsraros
		ItemEstadistica_Res.TipoRareza.EPICO: lista = runtime.Itemsepicos
		ItemEstadistica_Res.TipoRareza.LEGENDARIO: lista = runtime.Itemslegendarios

	if lista.is_empty():
		lista = runtime.Items

	var random_number = randi_range(0, lista.size() - 1)
	return lista[random_number]

func get_random_rareza(luck_value: float) -> ItemEstadistica_Res.TipoRareza:
	var suerte_normalizada = luck_value / (luck_value + 100.0)
	var base = {
		ItemEstadistica_Res.TipoRareza.COMUN: 60.0,
		ItemEstadistica_Res.TipoRareza.RARO: 25.0,
		ItemEstadistica_Res.TipoRareza.EPICO: 10.0,

		ItemEstadistica_Res.TipoRareza.LEGENDARIO: 5.0
	}
	var mult = {
		ItemEstadistica_Res.TipoRareza.COMUN: lerp(1.0, 0.3, suerte_normalizada),
		ItemEstadistica_Res.TipoRareza.RARO: lerp(1.0, 1.3, suerte_normalizada),
		ItemEstadistica_Res.TipoRareza.EPICO: lerp(1.0, 1.7, suerte_normalizada),

		ItemEstadistica_Res.TipoRareza.LEGENDARIO: lerp(1.0, 3.0, suerte_normalizada)
	}
	var total = 0.0
	var pesos = {}
	for r in base.keys():
		pesos[r] = base[r] * mult[r]
		total += pesos[r]

	var num = randf() * total
	var acum = 0.0
	for r in pesos.keys():
		acum += pesos[r]
		if num <= acum:
			return r

	return ItemEstadistica_Res.TipoRareza.COMUN
