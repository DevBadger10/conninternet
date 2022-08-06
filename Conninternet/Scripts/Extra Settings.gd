extends Node2D

var settings = ConfigFile.new()

func _ready():
	pass

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
