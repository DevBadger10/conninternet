extends Node2D

var settings = ConfigFile.new()

func _ready():
	loadSettings()
	fadeIn()

func _on_FileSelectButton_pressed():
	$FileSelect.popup()

func _on_OK_pressed():
	ProjectSettings.set_setting("Global/ModPathToLoad",$Path.text)
	save()

func _on_FileSelect_file_selected(path):
	$Path.text = path

func save():
	settings.set_value("settings", "fullscreen", ProjectSettings.get_setting("Global/Fullscreen")) # Used to be fullscreen variable but now I can use this in other scripts.
	settings.set_value("settings", "musicvolume", ProjectSettings.get_setting("Global/MusicVolume"))
	settings.set_value("settings", "sfxvolume", ProjectSettings.get_setting("Global/SFXVolume"))
	settings.set_value("extrasettings", "mod", ProjectSettings.get_setting("Global/ModPathToLoad"))
	settings.set_value("other", "tutorialcompleted", ProjectSettings.get_setting("Global/Tutorial"))
	settings.save("user://settings.cfg")
	requestRestart()

func requestRestart():
	$Restart.visible = true
	$Timer.start()
	yield($Timer,"timeout")
	get_tree().quit() # I wrote all of this MYSELF! AAAAAAAAA YAY I AM EXPERIENCE GDSCRIPT CODER



func fadeIn():
	$Tweens/BackButtonTween.interpolate_property($Back, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tweens/WarningTextTween.interpolate_property($Warning, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tweens/PathTextTween.interpolate_property($Path, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tweens/FileSelectTween.interpolate_property($FileSelectButton, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tweens/OKButtonTween.interpolate_property($OK, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tweens/BackButtonTween.start()
	$Tweens/WarningTextTween.start()
	$Tweens/PathTextTween.start()
	$Tweens/FileSelectTween.start()
	$Tweens/OKButtonTween.start()

func fadeOut():
	$Tweens/BackButtonTween.interpolate_property($Back, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tweens/WarningTextTween.interpolate_property($Warning, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tweens/PathTextTween.interpolate_property($Path, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tweens/FileSelectTween.interpolate_property($FileSelectButton, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tweens/OKButtonTween.interpolate_property($OK, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tweens/BackButtonTween.start()
	$Tweens/WarningTextTween.start()
	$Tweens/PathTextTween.start()
	$Tweens/FileSelectTween.start()
	$Tweens/OKButtonTween.start()

func _on_Back_pressed():
	fadeOut()
	$Wait.start()
	yield($Wait, "timeout")
	get_tree().change_scene("res://Scenes/Menu.tscn")

func loadSettings():
	$Path.text = ProjectSettings.get_setting("Global/ModPathToLoad")
