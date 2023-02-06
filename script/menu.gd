extends Node2D


func _on_sair_pressed():
	Main.salvar()
	get_tree().quit()
	pass # Replace with function body.


func _on_jogar_pressed():
	get_tree().change_scene("res://cenas/espaço.tscn")
	pass # Replace with function body.

func _process(delta):
	pass

func _ready():
	$AudioStreamPlayer2D.play(1)




func _on_pontuacao_pressed():
	get_tree().change_scene("res://cenas/score.tscn")
	pass # Replace with function body.


func _on_duvidas_pressed():
	get_tree().change_scene("res://cenas/sobre.tscn")
	pass # Replace with function body.


func _on_informaoes_pressed():
	get_tree().change_scene("res://cenas/creditos.tscn")
	pass # Replace with function body.
