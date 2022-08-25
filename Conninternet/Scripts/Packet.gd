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

func _physics_process(delta):
	if tweenFinished:
		goodLocation.clear() # Workes now.
		for i in 233:
			nearestProxy = get_parent().get_parent().get_node("Proxy Servers/ProxyServer"+str(i))
			if me.position.distance_to(nearestProxy.position) < distanceToProxy and nearestProxy.power: # I used the wrong </> here. AAAAAAAAAAAAAAAAAa
				print(i)
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
