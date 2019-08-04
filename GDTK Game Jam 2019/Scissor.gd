extends Area2D

var forward = Vector2(1,0)
var velocity_scale = 1.0
var screen_width = 1920
var screen_height = 1080


func _ready():
	#calculate the viewport size (should be based on the device instead)
	screen_width = get_viewport().size.x
	screen_height = get_viewport().size.y
	
func _process(delta):
	var parent = get_parent()
	position += (velocity_scale * forward)
	
	if(bounds_check()):
		parent.remove_child(self)
	

	
#retuns true if the scissor is out of the screen's bounds
func bounds_check():
	var x = position.x
	var y = position.y

	if( x > screen_width or x < 0 or y < 0 or y > screen_height):
		return true
	else:
		return false
