extends Node2D

func _ready():
	fadeIn()

func _on_BackButton_pressed():
	fadeOut("res://Scenes/Menu.tscn")

func fadeIn():
	$FadeText.interpolate_property($"Info Text", "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$FadeButton.interpolate_property($BackButton, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$FadeText.start()
	$FadeButton.start()

func fadeOut(new_scene):
	$FadeText.interpolate_property($"Info Text", "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$FadeButton.interpolate_property($BackButton, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$FadeText.start()
	$FadeButton.start()
	$Wait.start()
	yield($Wait, "timeout")
	get_tree().change_scene(new_scene)
