extends Area2D
var mouse_position

# Called when the node enters the scene tree for the first time.
func _ready():

	mouse_position = get_viewport().get_mouse_position();
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)  #hides the cursor
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _process(delta):
	mouse_position = get_viewport().get_mouse_position();
	#print(str(mouse_position.x) + "," + str(mouse_position.y))
	position = mouse_position
	
	
func hit_scissor(object_collided):	
	if(object_collided.get_name() == "Hand"):
		get_parent().gamewon = false


