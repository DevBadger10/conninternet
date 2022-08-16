extends Sprite
export var pickRandom = false # Decides whether to pick a random proxy server in range or go to the closest one.

func _on_Button_pressed():
	if ProjectSettings.get_setting("Global/Mode") == "delete":
		wipe()
	if ProjectSettings.get_setting("Global/Mode") == "change":
		pickRandom = not pickRandom
		print(pickRandom)

func _ready():
	wipe()

func wipe():
	self.visible == false
	self.position.x == -500
	self.position.y == -500
