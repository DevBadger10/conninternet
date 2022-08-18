extends Node2D

var CurrentProxyToSet
var CurrentProxyNumberToPlace = 0
var CurrentProxyToPlace
var ever = "I can put whatever I like in here EEeeEeEEeeEEeEEeeEeEeeEE"
var runLoop = false

func _ready():
	for i in 233: # Move proxy servers as they can't do it themselves apparently.
		CurrentProxyToSet = get_node("Proxy Servers/ProxyServer" + str(i))
		CurrentProxyToSet.visible = false
		CurrentProxyToSet.position.x = -600
		CurrentProxyToSet.position.y = -600
		print(i)
	#startClickMode()
	#startGameplayLoop()
	runLoop = true

func startClick():#Mode():
	if ProjectSettings.get_setting("Global/Mode") == "create" and get_viewport().get_mouse_position().y < 445: # used to be 5 changed so you cant place them in the dock
		CurrentProxyToPlace = get_node("Proxy Servers/ProxyServer" + str(CurrentProxyNumberToPlace))
		CurrentProxyToPlace.visible = true
		CurrentProxyToPlace.position.x = get_viewport().get_mouse_position().x
		CurrentProxyToPlace.position.y = get_viewport().get_mouse_position().y
		CurrentProxyNumberToPlace += 1

#func startGameplayLoop():
#	while ever == ever:
#		if Input.is_action_just_pressed("left_click"):
#			startClick()

func _physics_process(delta):
	if runLoop:
		#print(get_viewport().get_mouse_position().y)
		if Input.is_action_just_pressed("left_click"):
			startClick()


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
