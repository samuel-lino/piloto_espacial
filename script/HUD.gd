extends CanvasLayer


func _process(delta):
	var hora = Main.tempo/3600
	var minuto = (Main.tempo % 3600)/ 60
	var segundos = (Main.tempo % 3600)%60
	
	$vida.value = Main.vida
	$vida/Pvida.text = '{0}/{1}'.format([Main.vida, Main.vida_max])
	$energia.value = Main.energia
	$energia/Penergia.text = '{0}/{1}'.format([Main.energia, Main.energia_max])
	$pontos.text = str(Main.pontos)
	$Label/tempo.text = '{0}:{1}:{2}'.format([hora, minuto, segundos])
	$kitreparo/quantidade.text = 'X{0}'.format([Main.kitsreparo])
func _on_Button_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://cenas/menu.tscn")
	pass # Replace with function body.
