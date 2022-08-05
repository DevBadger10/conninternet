extends Node2D

onready var settings = null
onready var err = null

# I didn't know how to set the transparency of buttons before.

func startFadeout(new_scene):
	#print("starting fadeout")
	#for i in 10:
		#$BigButtons/PlayButton.modulate = Color(0, 0, 0, i / 100)
		#$Wait.start()
		#yield($Wait, "timeout")
		$Tweens/PlayButton.interpolate_property($BigButtons/PlayButton, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tweens/PlayButtonText.interpolate_property($BigButtons/PlayText, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tweens/QuitButton.interpolate_property($BigButtons/QuitButton, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tweens/QuitButtonText.interpolate_property($BigButtons/QuitText, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tweens/InfoButton.interpolate_property($SmallButtons/InfoButton, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tweens/SettingsButton.interpolate_property($SmallButtons/SettingButton, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tweens/ExtraSettingsButton.interpolate_property($SmallButtons/ExtraSettingsButton, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tweens/CreditsButton.interpolate_property($SmallButtons/CreditsButton, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tweens/TitleText.interpolate_property($Title, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tweens/PlayButton.start()
		$Tweens/PlayButtonText.start()
		$Tweens/QuitButton.start()
		$Tweens/QuitButtonText.start()
		$Tweens/InfoButton.start()
		$Tweens/SettingsButton.start()
		$Tweens/ExtraSettingsButton.start()
		$Tweens/CreditsButton.start()
		$Tweens/TitleText.start()
		$Wait.start()
		yield($Wait, "timeout")
		get_tree().change_scene(new_scene)


func _on_PlayButton_pressed():
	print("playbuttonpressed") # THE TEXT WAS BLOCKING THE BUTTON GRRR
	startFadeout("Insert scene path here")


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_InfoButton_pressed():
	startFadeout("res://Scenes/Info.tscn")


func _on_SettingButton_pressed():
	startFadeout("Insert scene path here")


func _on_ExtraSettingsButton_pressed():
	startFadeout("Insert scene path here")


func _on_CreditsButton_pressed():
	startFadeout("Insert scene path here")


func fadeIn():
	#print("starting fadeout")
	#for i in 10:
		#$BigButtons/PlayButton.modulate = Color(0, 0, 0, i / 100)
		#$Wait.start()
		#yield($Wait, "timeout")
		$Tweens/PlayButton.interpolate_property($BigButtons/PlayButton, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tweens/PlayButtonText.interpolate_property($BigButtons/PlayText, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tweens/QuitButton.interpolate_property($BigButtons/QuitButton, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tweens/QuitButtonText.interpolate_property($BigButtons/QuitText, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tweens/InfoButton.interpolate_property($SmallButtons/InfoButton, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tweens/SettingsButton.interpolate_property($SmallButtons/SettingButton, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tweens/ExtraSettingsButton.interpolate_property($SmallButtons/ExtraSettingsButton, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tweens/CreditsButton.interpolate_property($SmallButtons/CreditsButton, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tweens/TitleText.interpolate_property($Title, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tweens/PlayButton.start()
		$Tweens/PlayButtonText.start()
		$Tweens/QuitButton.start()
		$Tweens/QuitButtonText.start()
		$Tweens/InfoButton.start()
		$Tweens/SettingsButton.start()
		$Tweens/ExtraSettingsButton.start()
		$Tweens/CreditsButton.start()
		$Tweens/TitleText.start()
		$Wait.start()
		yield($Wait, "timeout")

func _ready():
	loadGlobal()
	fadeIn()


func loadGlobal():
	settings = ConfigFile.new()
	err = settings.load("user://settings.cfg") # I had forgot to change this from the deafult so it didnt work AAAAA
	if err != OK:
		return
	print(settings.get_value("settings", "fullscreen"))
	ProjectSettings.set_setting("Global/Fullscreen",settings.get_value("settings", "fullscreen"))
	ProjectSettings.set_setting("Global/SFXVolume",settings.get_value("settings", "sfxvolume"))
	ProjectSettings.set_setting("Global/MusicVolume",settings.get_value("settings", "musicvolume"))
	ProjectSettings.set_setting("Global/ModPathToLoad",settings.get_value("extrasettings", "mod")) # I had forgot to change this to extrasettings.
	setupSettings()

func setupSettings():
	OS.window_fullscreen = ProjectSettings.get_setting("Global/Fullscreen")
	# Now do mod stuff!
