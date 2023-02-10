extends KinematicBody2D

var direction = Vector2.ZERO
var velocidade = 100
var vida_max = 100
var energia_max = 50
var vida = 100
var energia = 50
onready var pre_laser = preload("res://cenas/laser.tscn")
var recargaE = 1

func _ready():
	atualizar()
	vida = vida_max
	energia = energia_max
	Main.vida = vida
	Main.energia = energia
	

func _physics_process(delta):
	var movimento = Vector2(Input.get_action_strength("direita") - Input.get_action_strength("esquerda"), Input.get_action_strength("tras") - Input.get_action_strength("frente"))
	direction = movimento * velocidade
	move_and_slide(direction).normalized()
	global_position.x = clamp(global_position.x, 60, 440)
	global_position.y = clamp(global_position.y, 15, 685)
	if vida_max != Main.vida_max or energia_max != Main.energia_max:
		atualizar()
	mudar_status()
	if Input.is_action_just_pressed("atirar"):
		if energia >= 5:
			atirar()
	if vida < 0:
		Main.classificque(Main.pontos)
		Main.stop = true
		get_tree().paused = true
		$HUD/game_over.visible = true
		$HUD/AudioStreamPlayer2D.stream_paused = false
	if vida < vida_max:
		reparar()
	energia = clamp(energia, 0, energia_max)
	vida = clamp(vida, 0, vida_max)
	
func atualizar()->void:
	vida_max = Main.vida_max
	energia_max = Main.energia_max
	
func mudar_status()->void:
	Main.vida = vida
	Main.energia = energia
	
func atirar()->void:
	var laser = pre_laser.instance()
	get_parent().add_child(laser)
	laser.global_position = $laser.global_position
	energia -= 5
	$laser2.play(0.1)

func _on_Timer_timeout():
	energia += recargaE
	pass # Replace with function body.

func reparar()->void:
	if Main.kitsreparo > 0:
		vida += 10
		Main.kitsreparo -= 1

