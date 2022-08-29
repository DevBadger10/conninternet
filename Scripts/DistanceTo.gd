extends Sprite

onready var pos = self.position
onready var text = get_node("../RichTextLabel")

func _physics_process(delta):
	text.text = str(pos.distance_to(get_viewport().get_mouse_position())) # Distance To returns half of the pixels to the location!
