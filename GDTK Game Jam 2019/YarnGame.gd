extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng = RandomNumberGenerator.new()
var yarn1  = false
var yarn2  = false
var yarn3  = false
var yarn4  = false
var yarn5  = false

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	var rnum = rng.randi_range(1,10)
	match rnum:
		1:
			yarn1 = true
			yarn2 = true
		2:
			yarn1 = true
			yarn3 = true
		3:
			yarn1 = true
			yarn4 = true
		4:
			yarn1 = true
			yarn5 = true
		5:
			yarn2 = true
			yarn3 = true
		6:
			yarn2 = true
			yarn4 = true
		7:
			yarn2 = true
			yarn5 = true
		8:
			yarn3 = true
			yarn4 = true
		9:
			yarn3 = true
			yarn5 = true
		10:
			yarn4 = true
			yarn5 = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
