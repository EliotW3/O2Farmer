extends Node2D

var speed = 150

var rng = RandomNumberGenerator.new()
var endPositionY = rng.randf_range(28, 31)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

signal collect

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if position.y <= endPositionY:
		position += transform.y * speed * delta


# for clicking on apples, make invisible, play coin animation, increase coin count
func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.is_pressed():
		CollectApple()
		
func CollectApple():
	$Area2D.hide()
	collect.emit()
	queue_free()
