extends Node2D



func _process(delta):
	$GridContainer/pontuacao.text = '1º: {0} pontos'.format([Main.score["1"]])
	$GridContainer/pontuacao2.text = '2º: {0} pontos'.format([Main.score["2"]])
	$GridContainer/pontuacao3.text = '3º: {0} pontos'.format([Main.score["3"]])
	$GridContainer/pontuacao4.text = '4º: {0} pontos'.format([Main.score["4"]])
	$GridContainer/pontuacao5.text = '5º: {0} pontos'.format([Main.score["5"]])
	$GridContainer/pontuacao6.text = '6º: {0} pontos'.format([Main.score["6"]])
	$GridContainer/pontuacao7.text = '7º: {0} pontos'.format([Main.score["7"]])
	$GridContainer/pontuacao8.text = '8º: {0} pontos'.format([Main.score["8"]])
	$GridContainer/pontuacao9.text = '9º: {0} pontos'.format([Main.score["9"]])
	$GridContainer/pontuacao10.text = '10º: {0} pontos'.format([Main.score["10"]])


func _on_sair_pressed():
	get_tree().change_scene("res://cenas/menu.tscn")
	pass # Replace with function body.
