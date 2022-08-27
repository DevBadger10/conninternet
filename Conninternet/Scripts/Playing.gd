extends Node2D

var CurrentProxyToSet
var CurrentProxyNumberToPlace = 0
var CurrentProxyToPlace
var ever = "I can put whatever I like in here EEeeEeEEeeEEeEEeeEeEeeEE"
var runLoop = false
var makethegamenotlag = 0
var runRepeat = true

func _ready():
	$FadeIn.visible = true
	$FadeIn/Tween.interpolate_property($FadeIn, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$FadeIn/Tween.start()
	for i in 233: # Move proxy servers as they can't do it themselves apparently.
		CurrentProxyToSet = get_node("Proxy Servers/ProxyServer" + str(i))
		CurrentProxyToSet.visible = false
		CurrentProxyToSet.position.x = -600
		CurrentProxyToSet.position.y = -600
		#print(i)
	#startClickMode()
	#startGameplayLoop()
	runLoop = true

func startClick():#Mode():
	if ProjectSettings.get_setting("Global/Mode") == "create" and get_viewport().get_mouse_position().y < 445 and ProjectSettings.get_setting("Global/Money") > 0: # used to be 5 changed so you cant place them in the dock
		CurrentProxyToPlace = get_node("Proxy Servers/ProxyServer" + str(CurrentProxyNumberToPlace))
		CurrentProxyToPlace.visible = true
		CurrentProxyToPlace.position.x = get_viewport().get_mouse_position().x
		CurrentProxyToPlace.position.y = get_viewport().get_mouse_position().y
		CurrentProxyNumberToPlace += 1
		ProjectSettings.set_setting("Global/Money",ProjectSettings.get_setting("Global/Money") - 300) # I got htis value form the first result online.

#func startGameplayLoop():
#	while ever == ever:
#		if Input.is_action_just_pressed("left_click"):
#			startClick()

func _physics_process(delta):
	if runLoop:
		repeat()
		if makethegamenotlag == 0: # without this you get like 5 fps XD now i can add the managing for that into the packets BOOM BABY why did i write that actually I know the answer: coding insanity i have coded to much i am  turning to programmer goo hiss there is light coming in through the window if a == b: a == not b print(a) print(b)                       var a = true var b = true                                   False True                                                                 wait first i need to make antenna
			$Labels/MoneyLabel.text = "Money: $" + str(ProjectSettings.get_setting("Global/Money"))
			$Labels/CustomerSatisfactionLabel.text = "Satisaction:    " + str(ProjectSettings.get_setting("Global/CustomerService"))
			if ProjectSettings.get_setting("Global/CustomerService") > 70:
				$Labels/Smiley.texture_normal = load("res://Resources/Smiley.png")
			elif ProjectSettings.get_setting("Global/CustomerService") < 30:
				$Labels/Smiley.texture_normal = load("res://Resources/Sad.png")
			else:
				$Labels/Smiley.texture_normal = load("res://Resources/Neutral.png")
			makethegamenotlag = 1
			reset_lag()
			#print("reset lag triggered")
		#print(get_viewport().get_mouse_position().y)
		if Input.is_action_just_pressed("left_click"):
			startClick()
		if Input.is_action_pressed("dev_all"):
			ProjectSettings.set_setting("Global/Money",999999999)
			ProjectSettings.set_setting("Global/CustomerService",100)
		if Input.is_action_pressed("dev_money"):
			ProjectSettings.set_setting("Global/Money",999999999)
		if Input.is_action_pressed("dev_satisfaction"):
			ProjectSettings.set_setting("Global/CustomerService",100)
		if ProjectSettings.get_setting("Global/CustomerService") < 0:
			$LoseText.visible = true
			$PleaseQuit.visible = true
			get_tree().paused = true

func _on_AddButton_pressed():
	ProjectSettings.set_setting("Global/Mode", "create")
	$AddButton.texture_normal = load("res://Resources/AddButtonHighlighted.png")
	$DeleteButton.texture_normal = load("res://Resources/DeleteButton(RedNotWhite).png")
	$ChangeButton.texture_normal = load("res://Resources/ChangeButton.png")


func _on_DeleteButton_pressed():
	ProjectSettings.set_setting("Global/Mode", "delete")
	$AddButton.texture_normal = load("res://Resources/AddButton.png")
	$DeleteButton.texture_normal = load("res://Resources/DeleteButtonHighlighted.png")
	$ChangeButton.texture_normal = load("res://Resources/ChangeButton.png")


func _on_ChangeButton_pressed():
	ProjectSettings.set_setting("Global/Mode", "change")
	$AddButton.texture_normal = load("res://Resources/AddButton.png")
	$DeleteButton.texture_normal = load("res://Resources/DeleteButton(RedNotWhite).png")
	$ChangeButton.texture_normal = load("res://Resources/ChangeButtonHighlighted.png")

func _on_TextureButton_pressed():
	get_tree().quit()

func reset_lag():
	$Timer.start()
	yield($Timer,"timeout")
	makethegamenotlag = 0


func _on_Smiley_pressed():
	get_tree().change_scene("res://Scenes/Ping.tscn")

func repeat():
	if runRepeat:
		runRepeat = false
		$Timer2.start()
		yield($Timer2,"timeout")
		ProjectSettings.set_setting("Global/CustomerService", ProjectSettings.get_setting("Global/CustomerService") - 1)
		runRepeat = true
