extends Sprite

export var distanceToProxy = 0
export var waitTime = 0
export var minSatisfaction = 0
export var maxSatisfaction = 0
export var minMoney = 0
export var maxMoney = 0
onready var me = self
onready var nearestProxy = get_parent()
onready var tweenFinished = true
onready var goodLocation = []
onready var send_antenna = get_parent().get_parent().get_node("Send")
onready var receive_antenna = get_parent().get_parent().get_node("Receive") # Just one small change! That was all I had t do!

func _physics_process(delta):
	if tweenFinished:
		goodLocation.clear() # Workes now.
		for i in 233:
			if me.position.distance_to(send_antenna.position) < distanceToProxy:
				end()
			else:
				nearestProxy = get_parent().get_parent().get_node("Proxy Servers/ProxyServer"+str(i))
				if me.position.distance_to(nearestProxy.position) < distanceToProxy and nearestProxy.power: # I used the wrong </> here. AAAAAAAAAAAAAAAAAa
					#print(i)
					goodLocation.append(nearestProxy.position)
		tweenFinished = false
		startTween()


func startTween():
	if goodLocation.size() > 0:
		$Tween.interpolate_property(me, "position", me.position, goodLocation[randi() % goodLocation.size()], 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tween.start()
		yield($Tween,"tween_completed")
		tweenFinished = true
	else:
		$Timer.start()
		yield($Timer,"timeout")
		tweenFinished = true

func end():
	randomize()
	ProjectSettings.set_setting("Global/Money", ProjectSettings.get_setting("Global/Money") + rand_range(minMoney,maxMoney))
	ProjectSettings.set_setting("Global/CustomerService", ProjectSettings.get_setting("Global/CustomerService") + rand_range(minSatisfaction,maxSatisfaction))
	# I JUST HAD AN IDEA! An infinite loop! 
	# ToDONE: -Add customer satisfaction degredation, -add proxy cost, -add satisfaction cap, -add packet spawning, -add lose condition
	me.position = receive_antenna.Position
	if ProjectSettings.get_setting("Global/CustomerService") > 100:
		ProjectSettings.set_setting("Global/CustomerService",100)
