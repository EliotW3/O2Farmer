extends Node2D

# variables
var oxygen = 100 # starting value of o2, enough for first plant

# daisy
var daisyLevel = 0
var daisyProduction = 1
var daisyCost = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
# function to update UI
func UpdateUI():
	pass
	





func _on_close_shop_button_button_down():
	$ShopControl.hide()
	$ShopButtonControl/ShopButton.show()


func _on_shop_button_button_down():
	$ShopControl.show()
	$ShopButtonControl/ShopButton.hide()
