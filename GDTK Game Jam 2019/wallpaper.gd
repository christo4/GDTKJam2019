extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var audio

# Called when the node enters the scene tree for the first time.
func _ready():
	audio = AudioStreamPlayer.new()
	self.add_child(audio)
	audio.stream = load("res://Sounds/rustle.wav")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
