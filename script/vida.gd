extends Area2D

var nome = 'vida'

func _process(delta):
	translate(Vector2(0, 1) * 50 * delta)

func _on_vida_body_entered(body):
	Main.kitsreparo += 1
	queue_free()
	pass # Replace with function body.


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.
