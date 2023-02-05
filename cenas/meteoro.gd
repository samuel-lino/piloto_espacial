extends Area2D
var nome = 'meteoro'
var velocidade = 100
var direction = 1
var scala = 1
var coletaveis:Dictionary = {
	"vida" : [
		[1, 10],
		preload("res://cenas/vida.tscn")
	],
	"recarga": [
		[30, 31],
		preload("res://cenas/recarga.tscn")
	],
	"energia": [
		[36, 38],
		preload("res://cenas/energia.tscn")
	]
}
var bateu = false
var escolha 
func _ready():
	E_velocidade()
	$textura.scale = Vector2(scala, scala)
	$CollisionShape2D.scale = Vector2(scala, scala)
	$Sprite.scale = Vector2(scala, scala)
func _process(delta):
	translate(Vector2(0, (direction * velocidade * delta)))
	$textura.rotation_degrees += 5

func E_velocidade()->void:
	velocidade = rand_range(100, 200)
	scala = rand_range(1, 3.1)

func _on_VisibilityNotifier2D_screen_exited():
	if bateu == false:
		Main.pontos += 10
		queue_free()
	pass # Replace with function body.


func pontos()->void:
	Main.pontos += 10 * int(scala)

func _on_meteoro_body_entered(body):
	bateu = true
	body.vida -= int(scala) * 10
	atingiu()
	pass # Replace with function body.
func upgrads()->void:
	for item in coletaveis.keys():
		pegar_coletavel(item)

func pegar_coletavel(item_key:String)->void:
	var numero_aleatorio: int = randi() % 100 + 1
	var item_chance: Array = coletaveis[item_key][0]
	
	var minimo:int = item_chance[0]
	var maximo:int = item_chance[1]
	
	if numero_aleatorio >= minimo and numero_aleatorio <= maximo:
		var drop = coletaveis[item_key][1].instance()
		get_parent().add_child(drop)
		drop.global_position = global_position
func destruir()->void:
	pontos()
	queue_free()
func atingiu()->void:
	$AnimationPlayer.play("destruição")
	Main.explosion = true
	
func clear():
	queue_free()

