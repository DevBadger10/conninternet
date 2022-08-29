extends Node2D
#var cfg
#var err
#onready var NextArrow = load("res://Resources/NextArrow.png")
#onready var BackButton = load("res://Resources/Button_Back.png")

func _ready():
	#cfg = ConfigFile.new()
	#err = cfg.load("user://tutorial.cfg")
	#if err != OK:
	#	print("Not OK!") # why this no work
	#if ProjectSettings.get_setting("Global/ProceedToGameOrToInfoScreen"): #and cfg.get_value("fullcompleted", "one"):# Cant do the cfg right now its too hard and godot cant create empty files #completed is access and fullcompleted is if it has been accessed through gameplay
	#	get_tree().change_scene("res://Scenes/Playing.tscn")
	#else:
	fadein()
	#if ProjectSettings.get_setting("Global/ProceedToGameOrToInfoScreen"):
	#	Print(ProjectSettings.get_setting("Global/ProceedToGameOrToInfoScreen"))
	#	$TextureButton.texture_normal = NextArrow
	#if not ProjectSettings.get_setting("Global/ProceedToGameOrToInfoScreen"):
	#	Print(ProjectSettings.get_setting("Global/ProceedToGameOrToInfoScreen"))
	#	$TextureButton.texture_normal = BackButton
	

func fadein():
	$Tween.interpolate_property($RichTextLabel, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween2.interpolate_property($RichTextLabel2, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween3.interpolate_property($RichTextLabel3, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween4.interpolate_property($C2s, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween5.interpolate_property($ReceiveAntennaVersion2, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween6.interpolate_property($SendAttenna, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween7.interpolate_property($Proxy, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween8.interpolate_property($AddButton, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween9.interpolate_property($ChangeButton, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween10.interpolate_property($PoweredOffProxy, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween11.interpolate_property($"DeleteButton(RedNotWhite)", "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween12.interpolate_property($TextureButton, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	$Tween2.start()
	$Tween3.start()
	$Tween4.start()
	$Tween5.start()
	$Tween6.start()
	$Tween7.start()
	$Tween8.start()
	$Tween9.start()
	$Tween10.start()
	$Tween11.start()
	$Tween12.start()

func Print(string):
	print(str(string))

func _on_TextureButton_pressed():
	#if ProjectSettings.get_setting("Global/ProceedToGameOrToInfoScreen"):
	#	fadeout("res://Scenes/Playing.tscn")
	#if not ProjectSettings.get_setting("Global/ProceedToGameOrToInfoScreen"):
	#	fadeout("res://Scenes/Info.tscn")
	fadeout("res://Scenes/How To Play/InfoTwo.tscn")

func fadeout(path):
	$Tween.interpolate_property($RichTextLabel, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween2.interpolate_property($RichTextLabel2, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween3.interpolate_property($RichTextLabel3, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween4.interpolate_property($C2s, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween5.interpolate_property($ReceiveAntennaVersion2, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween6.interpolate_property($SendAttenna, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween7.interpolate_property($Proxy, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween8.interpolate_property($AddButton, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween9.interpolate_property($ChangeButton, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween10.interpolate_property($PoweredOffProxy, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween11.interpolate_property($"DeleteButton(RedNotWhite)", "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween12.interpolate_property($TextureButton, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	$Tween2.start()
	$Tween3.start()
	$Tween4.start()
	$Tween5.start()
	$Tween6.start()
	$Tween7.start()
	$Tween8.start()
	$Tween9.start()
	$Tween10.start()
	$Tween11.start()
	$Tween12.start() # I had forgotten to add this ex dee
	$Wait.start()
	yield($Wait,"timeout")
	get_tree().change_scene(path)
