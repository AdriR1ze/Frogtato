extends Resource
class_name Runtime_res
var item_dano_sprite = preload("res://Imagenes/sprites_ONIET/sprites_ONIET/imagenes/objeto_fuerza.png")
@export var Item_dano : ItemEstadistica_Res = ItemEstadistica_Res.new("DANO",100,ItemEstadistica_Res.TipoEstadistica.DANO,"Te duplica el daño", ItemEstadistica_Res.TipoRareza.LEGENDARIO,item_dano_sprite)
var item_simple_sprite = preload("res://Imagenes/sprites_ONIET/sprites_ONIET/imagenes/objeto_fuerza.png")
@export var Item_simple : ItemEstadistica_Res = ItemEstadistica_Res.new("DANO2",10,ItemEstadistica_Res.TipoEstadistica.DANO,"Te duplica el daño", ItemEstadistica_Res.TipoRareza.COMUN, item_simple_sprite)
var item_atk_sprite = preload("res://Imagenes/sprites_ONIET/sprites_ONIET/imagenes/objeto_fuerza.png")
@export var Item_Atk : ItemEstadistica_Res = ItemEstadistica_Res.new("AtkSpeed",50,ItemEstadistica_Res.TipoEstadistica.ATKSPEED,"Te da atk speed", ItemEstadistica_Res.TipoRareza.EPICO, item_atk_sprite)
@export var Items : Array
@export var Itemscomunes : Array
@export var Itemsraros : Array
@export var Itemsepicos : Array

@export var Itemslegendarios : Array

var sapo_mediano_sprite = preload("res://Imagenes/sprites_ONIET/sprites_ONIET/spritesheets/arma_sapo32x32.png")
@export var SapoMediano : ArmaRes = ArmaRes.new("SapoMediano",10,0.5,200, sapo_mediano_sprite)

var sapo_chico_sprite = preload("res://Imagenes/sprites_ONIET/sprites_ONIET/spritesheets/pistola_renacuajos_32x32t.png")
@export var SapoChico : ArmaRes = ArmaRes.new("SapoChico",5,0.1,300, sapo_chico_sprite)

var sapo_grande_sprite = preload("res://Imagenes/sprites_ONIET/sprites_ONIET/spritesheets/sapo_diablo32x32t.png")
@export var SapoGrande : ArmaRes = ArmaRes.new("SapoGrande",30,2,300, sapo_grande_sprite)

@export var Armas : Array



@export var sprite_enemy_1 = preload("res://Imagenes/sprites_ONIET/sprites_ONIET/imagenes/monstruo_babosa.png")
@export var sprite_enemy_2 = preload("res://Imagenes/sprites_ONIET/sprites_ONIET/imagenes/monstruo_babosa.png")
@export var enemy_1 : Enemigo = Enemigo.new("Juan", 400, 10, 200, sprite_enemy_1, load("res://enemy.tscn"))
@export var enemy_2 : Enemigo = Enemigo.new("Pedro", 400, 10, 200, sprite_enemy_2,load("res://enemy.tscn"))
@export var Enemigos : Array



func _init() -> void:

	Items.append(Item_dano)
	Items.append(Item_simple)
	Items.append(Item_Atk)
	Armas.append(SapoMediano)
	Armas.append(SapoChico)
	Armas.append(SapoGrande)
	
	Enemigos.append(enemy_1)
	Enemigos.append(enemy_2)
	
	
	#Asignacion de Items segun rareza
	for item_comun in Items:
		if item_comun.rareza == ItemEstadistica_Res.TipoRareza.COMUN:
			Itemscomunes.append(item_comun)
	for item_raro in Items:
		if item_raro.rareza == ItemEstadistica_Res.TipoRareza.RARO:
			Itemsraros.append(item_raro)
	for item_epico in Items:
		if item_epico.rareza == ItemEstadistica_Res.TipoRareza.EPICO:
			Itemsepicos.append(item_epico)

	for item_legendario in Items:
		if item_legendario.rareza == ItemEstadistica_Res.TipoRareza.LEGENDARIO:
			Itemslegendarios.append(item_legendario)






	
