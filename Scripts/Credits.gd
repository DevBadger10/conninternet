extends Node2D

func _ready(): # Note to future me: Add, like 5 seconds of stillness at the start of the credits.
	fadeIn()
	$Credits.play()


func _on_back_pressed():
	fadeOut()
	$Timer.start()
	yield($Timer,"timeout")
	get_tree().change_scene("res://Scenes/Menu.tscn")

func fadeIn():
	$Tween.interpolate_property($Credits, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween2.interpolate_property($back, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	$Tween2.start()

func fadeOut():
	$Tween.interpolate_property($Credits, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween2.interpolate_property($back, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	$Tween2.start()
