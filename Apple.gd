extends Node2D

var speed = 300

var rng = RandomNumberGenerator.new()
var endPositionY = rng.randf_range(28, 31)

var bounced = false

signal collect


func _physics_process(delta):
	if position.y <= endPositionY:
		position += transform.y * speed * delta
	else:
		if bounced == false:
			bounce()

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
	

func bounce():
	# set speed negative to send it up, wait a second and then return speed back to normal to send it back down
	# "bounce" the apple up by marginally changeing the position.y value
	bounced = true
	position.y = position.y - 1
	speed = -100
	$bounceTimer.start()
	
	


func _on_bounce_timer_timeout():
	speed = 100
