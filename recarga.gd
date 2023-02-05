extends Area2D
var nome = 'recarga'

func _process(delta):
	translate(Vector2(0, 1) * 50 * delta)

func _on_recarga_body_entered(body):
	body.recargaE += 1
	queue_free()
	pass # Replace with function body.


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.
