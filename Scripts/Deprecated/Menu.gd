extends Node2D

func _on_PlayButton_button_down(): #These dont work.
	pass # Replace with function body.


func _on_QuitButton_button_down():
	# startFadeout()
	pass


func _on_InfoButton_button_down():
	pass # Replace with function body.


func _on_SettingButton_button_down():
	pass # Replace with function body.


func _on_ExtraSettingsButton_button_down():
	pass # Replace with function body.


func _on_CreditsButton_button_down():
	pass # Replace with function body. 


func startFadeout():
	print("Starting Fadeout")
	$InFront/FadeEffect.set_position(Vector2(0,-1))
	for i in 256:
		$InFront/FadeEffect.color = Color(36,100,190,i/100) # Color(36,100,190,i)


func _on_PlayButton_pressed():
	pass # Replace with function body.


func _on_QuitButton_pressed():
	startFadeout()


func _on_InfoButton_pressed():
	pass # Replace with function body.


func _on_SettingButton_pressed():
	pass # Replace with function body.


func _on_ExtraSettingsButton_pressed():
	pass # Replace with function body.


func _on_CreditsButton_pressed():
	pass # Replace with function body.
