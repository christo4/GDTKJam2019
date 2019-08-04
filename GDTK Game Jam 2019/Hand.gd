extends Area2D
var mouse_position

# Called when the node enters the scene tree for the first time.
func _ready():
	var scissorNode = get_parent().get_node("Scissor")
	scissorNode.connect("area_entered", self, "hit_scissor")
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)  #hides the cursor


func _process(delta):
	mouse_position = get_viewport().get_mouse_position();
	position = mouse_position
	
	
func hit_scissor(object_collided):
	print("Hit scissor")


