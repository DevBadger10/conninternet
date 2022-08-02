extends Node2D


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
		get_tree().change_scene(new_scene)


func _on_PlayButton_pressed():
	print("playbuttonpressed") # THE TEXT WAS BLOCKING THE BUTTON GRRR
	startFadeout("Insert scene path here")


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_InfoButton_pressed():
	startFadeout("Insert scene path here")


func _on_SettingButton_pressed():
	startFadeout("Insert scene path here")


func _on_ExtraSettingsButton_pressed():
	startFadeout("Insert scene path here")


func _on_CreditsButton_pressed():
	startFadeout("Insert scene path here")
