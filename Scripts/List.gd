extends Node2D

func _ready(): # Note to self: document this in the project section! VERY IMPORTANT!!!!!!
	fadein()
	ProjectSettings.set_setting("Global/ProceedToGameOrToInfoScreen",false)
	setup_variables()

func setup_variables():
	pass # Do file stuff here to check what they have or haven't completed.

func _on_Menu_pressed():
	fadeout("res://Scenes/Menu.tscn")

func fadein():
	#$Backround2/Tween.interpolate_property($Backround2, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	#$Menu/Tween.interpolate_property($Menu, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	#$Info1/Tween.interpolate_property($Info1, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	#$Info2/Tween.interpolate_property($Info2, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	#$Info3/Tween.interpolate_property($Info3, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	#$Info4/Tween.interpolate_property($Info4, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	#$Info5/Tween.interpolate_property($Info5, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	#$Info6/Tween.interpolate_property($Info6, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.interpolate_property($screen, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	#$Backround2/Tween.start()
	#$Menu/Tween.start()
	#$Info1/Tween.start()
	#$Info2/Tween.start()
	#$Info3/Tween.start()
	#$Info4/Tween.start()
	#$Info6/Tween.start()
	#$Info5/Tween.start()
	$Tween.start()

func fadeout(newscene):
	#$Backround2/Tween.interpolate_property($Backround2, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	#$Menu/Tween.interpolate_property($Menu, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	#$Info1/Tween.interpolate_property($Info1, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	#$Info2/Tween.interpolate_property($Info2, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	#$Info3/Tween.interpolate_property($Info3, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	#$Info4/Tween.interpolate_property($Info4, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	#$Info5/Tween.interpolate_property($Info5, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	#$Info6/Tween.interpolate_property($Info6, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.interpolate_property($screen, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	#$Backround2/Tween.start()
	#$Menu/Tween.start()
	#$Info1/Tween.start()
	#$Info2/Tween.start()
	#$Info3/Tween.start()
	#$Info4/Tween.start()
	#$Info6/Tween.start()
	#$Info5/Tween.start()
	$Tween.start() #before the text wasnt set up
	$Wait.start()
	yield($Wait, "timeout")
	get_tree().change_scene(newscene)


func _on_Info1_pressed():
	fadeout("res://Scenes/How To Play/InfoOne.tscn")


func _on_Info2_pressed():
	fadeout("res://Scenes/How To Play/InfoOne.tscn")


func _on_Info3_pressed():
	fadeout("res://Scenes/How To Play/InfoOne.tscn")


func _on_Info4_pressed():
	fadeout("res://Scenes/How To Play/InfoOne.tscn")


func _on_Info5_pressed():
	fadeout("res://Scenes/How To Play/InfoOne.tscn")


func _on_Info6_pressed():
	fadeout("res://Scenes/How To Play/InfoOne.tscn")
