extends Sprite

export var distanceToProxy = 0
export var waitTime = 0
export var minSatisfaction = 0
export var maxSatisfaction = 0
export var minMoney = 0
export var maxMoney = 0
export var minTime = 90
export var maxTime = 150
onready var me = self
onready var nearestProxy = get_parent()
onready var tweenFinished = true
onready var goodLocationTimed = []
onready var send_antenna = get_parent().get_parent().get_node("Send")
onready var receive_antenna = get_parent().get_parent().get_node("Receive") # Just one small change! That was all I had t do!
onready var timeDone = false

func _ready():
	randomize()
	$Timer2.wait_time = rand_range(minTime,maxTime)
	$Timer2.start()
	yield($Timer2,"timeout")
	me.position = send_antenna.position
	timeDone = true
	tweenFinished = true
	print(timeDone)

func _physics_process(delta):
	if timeDone == true:
		#print(timeDone) # WHYA RENT YOU WORKINGGGGGG YOU HAV EVERYTHING YOU NEED except set values. *inhale* *exhale*
		if tweenFinished:
			#print(timeDone)
			goodLocationTimed.clear() # Workes now.
			if me.position.distance_to(receive_antenna.position) < distanceToProxy: # I HAD PUT SEND ANTNNA NOT RECEIVE AAAAAA
				goodLocationTimed.append(receive_antenna.position)# WHAT ARE... ooooh i hadnt changed the variable name thats why its flying to the moon
				tweenFinished = false
				startTween(true)
				print("detected end server") #OK so its a problem with the IF stsement also note to self addd rop in wait time till drop in
				#end() 
			else:
				for i in 233:
					nearestProxy = get_parent().get_parent().get_node("Proxy Servers/ProxyServer"+str(i))
					if me.position.distance_to(nearestProxy.position) < distanceToProxy and nearestProxy.power: # I used the wrong </> here. AAAAAAAAAAAAAAAAAa
							#print(i)
						goodLocationTimed.append(nearestProxy.position)
				tweenFinished = false
				startTween(false)

func startTween(isEnd):
	if goodLocationTimed.size() > 0:
		$Tween.interpolate_property(me, "position", me.position, goodLocationTimed[randi() % goodLocationTimed.size()], 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tween.start()
		yield($Tween,"tween_completed")
		if isEnd == true:
			end()
		else:
			tweenFinished = true
	else:
		$Timer.start()
		yield($Timer,"timeout")
		if isEnd == true:
			end()
		else:
			tweenFinished = true

func end(): # Original Values for ezport vars: 280, 3, 2, 5, 20, 50. ProjSet: 3000, 75. Countown timer: 2.5. Potential new bvalues (unutested): 100, 3, 1, 3, 10, 20, 	2500, 75	0.5
	randomize()
	ProjectSettings.set_setting("Global/Money", ProjectSettings.get_setting("Global/Money") + round(rand_range(minMoney,maxMoney)))
	ProjectSettings.set_setting("Global/CustomerService", ProjectSettings.get_setting("Global/CustomerService") + round(rand_range(minSatisfaction,maxSatisfaction)))
	# I JUST HAD AN IDEA! An infinite loop! 
	# ToDONE: -Add customer satisfaction degredation, -add proxy cost, -add satisfaction cap, -add packet spawning, -add lose condition
	me.position = send_antenna.position
	if ProjectSettings.get_setting("Global/CustomerService") > 100:
		ProjectSettings.set_setting("Global/CustomerService",100)
	tweenFinished = true
