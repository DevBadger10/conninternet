extends Sprite
export var power = true 
export var hacked = false

var me = self

func _on_Button_pressed():
	if ProjectSettings.get_setting("Global/Mode") == "delete":
		wipe()
		wipethathopefullyactuallyworks()
		print("Hello, yes, the function is being triggered right now. Yay debugging why delete doesnt work is so fun!!!! YAAAAAAAAAAAAY!")
	if ProjectSettings.get_setting("Global/Mode") == "change":
		power = not power
		hacked = false
		print(power)

func _ready():
	#wipe()
	wipethathopefullyactuallyworks()

func wipe():
	self.visible == false
	self.position.x == -500
	self.position.y == -500

func wipethathopefullyactuallyworks():
#	var me = self
	me.position.x = -600
	me.position.y = -600
	me.visible = false

func _physics_process(delta):
	if power == false and not hacked:
		me.texture = load("res://Resources/PoweredOffProxy.png")
	elif power == true and not hacked:
		me.texture = load("res://Resources/Proxy.png")
	if hacked == true:
		me.texture = load("res://Resources/HackedProxyWithSmokeAsHackersAreForcingItToMineCrypto.png")
	if ProjectSettings.get_setting("Global/Stage") > 3:
		randomize()
		if round(rand_range(1,10000)) > 9999:
			hacked = true
			power = true # Tested this works
