extends Area2D

var nome = 'energia'

func _process(delta):
	translate(Vector2(0, 1) * 50 * delta)

func _on_energia_body_entered(body):
	Main.energia_max += 10
	queue_free()
	pass # Replace with function body.


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.
