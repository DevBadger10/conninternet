extends Node2D

var fullscreen = false
var settings = ConfigFile.new()

# I coudnt find out how to make a checkbox box bigger so heres a bodgey solution that works very well

func _on_TextureButton_pressed():
	pass # Replace with function body.


func _on_Fullscreen_toggled(button_pressed):
	print(button_pressed)
	OS.window_fullscreen = button_pressed
	fullscreen = button_pressed
	ProjectSettings.set_setting("Global/Fullscreen", fullscreen)
	save()

func _on_Music_value_changed(value):
	ProjectSettings.set_setting("Global/MusicVolume", value)
	save()

func _on_SFX_value_changed(value):
	ProjectSettings.set_setting("Global/SFXVolume", value)
	print(ProjectSettings.get_setting("Global/SFXVolume"))
	save()

func save():
	settings.set_value("settings", "fullscreen", ProjectSettings.get_setting("Global/Fullscreen")) # Used to be fullscreen variable but now I can use this in other scripts.
	settings.set_value("settings", "musicvolume", ProjectSettings.get_setting("Global/MusicVolume"))
	settings.set_value("settings", "sfxvolume", ProjectSettings.get_setting("Global/SFXVolume"))
	settings.set_value("extrasettings", "mod", ProjectSettings.get_setting("Global/ModPathToLoad"))
	settings.set_value("other", "tutorialcompleted", ProjectSettings.get_setting("Global/Tutorial"))
	settings.save("user://settings.cfg")


func _ready():
	save() # This was added for debugging perpouses so i can check contents of settings.cfg.
