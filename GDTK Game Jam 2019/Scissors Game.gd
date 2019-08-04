extends Node

var scissorImport
var x_off = 0
var y_off = 0
var seconds_since_spawn
var rng = RandomNumberGenerator.new()
const screen_middle = Vector2(960, 540)
const default_forward = Vector2(1,0)
const spawn_frequency = 1.0
var gamewon
const gameLength = 8.0
var gameTime

#dictionay which holds the random locations for the scissor spawning
var random_coords = {
	0: Vector2(480,0),
	1: Vector2(1440,0),
	2: Vector2(1900,0),
	3: Vector2(0,270),
	4: Vector2(0,810),
	5: Vector2(0,1050),
	6: Vector2(480,1050),
	7: Vector2(1440,1050),
	8: Vector2(1900,810),
	9: Vector2(1900,270)}


# Called when the node enters the scene tree for the first time.
func _ready():
	gamewon = true
	gameTime = 0
	rng.randomize()
	seconds_since_spawn = 0
	scissorImport = load("res://Scissor.tscn")
	#spawn_scissor(Vector2(x_off, y_off), true)

func spawn_scissor(vector_location,init):
	var newScissor = scissorImport.instance()
	newScissor.position = vector_location
	
	var spawn_to_middle = screen_middle - vector_location
	var theta = acos(default_forward.dot(spawn_to_middle) / (spawn_to_middle.length()*default_forward.length()))
	var cross_product = default_forward.cross(spawn_to_middle)
	
	newScissor.forward = spawn_to_middle.normalized()
	newScissor.velocity_scale = 20.0
	
	if(cross_product <= 0.0):
		theta = -theta
	newScissor.rotation = theta
	
	if(init):
		get_parent().call_deferred("add_child",newScissor)
	else:
		get_parent().add_child(newScissor)
	newScissor.connect("area_entered", get_node("Hand"), "hit_scissor")
	
func get_random_spawn():
	var spawn_key = rng.randi_range(0,9)
	return random_coords[spawn_key]
		
func _process(delta):
	if seconds_since_spawn > spawn_frequency and gameTime < gameLength:
		spawn_scissor(get_random_spawn(),false)
		seconds_since_spawn = 0
	else:
		seconds_since_spawn += delta
	gameTime += delta
	
	if gameTime > (gameLength+0.5):
		var manager = get_tree().get_root().get_node("Level Manager")
		manager.scissor_desk_return()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if gamewon == false:
		var manager = get_tree().get_root().get_node("Level Manager")
		manager.scissor_desk_return()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)