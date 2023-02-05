extends Node2D

var spaw = 0
var spawnei = false
onready var pre_meteoro = preload("res://cenas/meteoro.tscn")
var tempo = 0
var minut = 0
var timer = 0.4
var decai = 0.1
var back_vel = 1.2

func _process(delta):
	decidir_spaw()
	if spawnei == false:
		spawnar()
		yield(get_tree().create_timer(timer), "timeout")
		spawnei = false
	if minut == 60:
		timer -= decai
		back_vel += 0.1
		$Sprite.material.set_shader_param("velocidade", back_vel)
		minut = 0
	if timer <= 0.2:
		decai = 0.05
	Main.tempo = tempo
	timer = clamp(timer, 0.05, 0.4)
	back_vel = clamp(back_vel, 1.2, 2)
	if Main.stop == true:
		get_tree().call_group("meteoro", "clear")
		$AudioStreamPlayer2D.stream_paused
	if Main.explosion == true:
		$AnimationPlayer.play("explosão")
	pass
	
func _ready():
	Main.stop = false
	Main.pontos = 0
	
func decidir_spaw()->void:
	spaw = rand_range(64, 436)
	
func spawnar()->void:
	var meteoro = pre_meteoro.instance()
	add_child(meteoro)
	meteoro.global_position = Vector2(spaw, 0)
	spawnei = true

func explodir():
	$explosion.play(1)
	Main.explosion = false
func explodiu():
	$explosion.stop()

func _on_Timer_timeout():
	tempo += 1
	minut += 1
	pass # Replace with function body.
