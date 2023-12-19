extends Node2D

# variables
var oxygen = 100 # starting value of o2, enough for first plant

var greenhousePage = 1 #starting on first page of the greenhouse

# daisy
# max daisy level = 5, daisy timer = 1sec
var daisyLevel = 0
var daisyProduction = 0
var daisyMaxProduction = 10
var daisyCost = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	UpdateUI()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
# function to update UI
func UpdateUI():
	$Background/O2Label.text = str(oxygen)
	$ShopControl/ShopBackground/ListControl/ListDaisyControl/DaisyCost.text = str(daisyCost)
	$ShopControl/ShopBackground/ListControl/ListDaisyControl/DaisyIncrement.text = "+" + str(daisyProduction) + "/sec"
	




func _on_close_shop_button_button_down():
	$ShopControl.hide()
	$ShopButtonControl/ShopButton.show()


func _on_shop_button_button_down():
	$ShopControl.show()
	$ShopButtonControl/ShopButton.hide()


func _on_daisy_buy_button_button_down():
	if daisyLevel < 5: # max daisy level = 5
		# increment daisy level, increase production, increase daisy price, remove oxygen
		if daisyCost <= oxygen:
			# purchase allowed
			oxygen = oxygen - daisyCost
			daisyLevel += 1
			daisyProduction += (daisyMaxProduction/5)
			
			if daisyLevel == 1:
				$GreenhouseControl/VisiblePlantsControl/Plant1Control/Daisy.texture = load("res://Assets/daisy1.png")
				$Plant1Timer.start()
			if daisyLevel == 2:
				$GreenhouseControl/VisiblePlantsControl/Plant1Control/Daisy.texture = load("res://Assets/daisy2.png")
			if daisyLevel == 3:
				$GreenhouseControl/VisiblePlantsControl/Plant1Control/Daisy.texture = load("res://Assets/daisy3.png")
			
			if daisyLevel == 4:
				$GreenhouseControl/VisiblePlantsControl/Plant1Control/Daisy.texture = load("res://Assets/daisy4.png")
			
			if daisyLevel == 5:
				$GreenhouseControl/VisiblePlantsControl/Plant1Control/Daisy.texture = load("res://Assets/daisy5.png")
				# change button for buy daisy to say max.
				$ShopControl/ShopBackground/ListControl/ListDaisyControl/DaisyBuyButtonControl.hide()
								
			daisyCost = daisyCost * 1.2
			
			UpdateUI()


func _on_plant_1_timer_timeout():
	$GreenhouseControl/VisiblePlantsControl/Plant1Control/Plant1Bubbles.play()
	oxygen += daisyProduction
	UpdateUI()
	$Plant1Timer.start()
