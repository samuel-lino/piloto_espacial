extends Area2D

var velocidade = 500

func _process(delta):
	translate(Vector2(0, -1) * velocidade * delta)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.


func _on_laser_area_entered(area):
	if area.nome == 'meteoro':
		area.atingiu()
		area.upgrads()
		area.pontos()
	queue_free()
	pass # Replace with function body.
