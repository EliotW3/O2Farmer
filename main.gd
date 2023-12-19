extends Node2D

# variables
var oxygen = 10000 # starting value of o2, enough for first plant

var greenhousePage = 1 #starting on first page of the greenhouse

# daisy
# max daisy level = 60, daisy timer = 1sec
var daisyLevel = 0
var daisyProduction = 0
var daisyMaxProduction = 60
var daisyCost = 100

# jade
# max level = 120, timer = 1 min
var jadeLevel = 0
var jadeProduction = 0
var jadeMaxProduction = 12000
var jadeCost = 600


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
	$ShopControl/ShopBackground/ListControl/ListDaisyControl/DaisyLevelLabel.text = "L." + str(daisyLevel)
	
	$ShopControl/ShopBackground/ListControl/ListJadeControl/JadeCost.text = str(jadeCost)
	$ShopControl/ShopBackground/ListControl/ListJadeControl/JadeIncrement.text = "+" + str(jadeProduction) + "/min"
	$ShopControl/ShopBackground/ListControl/ListJadeControl/JadeLevelLabel.text = "L." + str(jadeLevel)
	




func _on_close_shop_button_button_down():
	$ShopControl.hide()
	$ShopButtonControl/ShopButton.show()


func _on_shop_button_button_down():
	$ShopControl.show()
	$ShopButtonControl/ShopButton.hide()


func _on_daisy_buy_button_button_down():
	if daisyLevel < 60: # max daisy level = 60
		# increment daisy level, increase production, increase daisy price, remove oxygen
		if daisyCost <= oxygen:
			# purchase allowed
			oxygen = oxygen - daisyCost
			daisyLevel += 1
			daisyProduction += (daisyMaxProduction/60)
			
			if daisyLevel == 1:
				$GreenhouseControl/VisiblePlantsControl/Plant1Control/Daisy.texture = load("res://Assets/daisy1 - Copy.png")
				$Plant1Timer.start()
				# open option to buy plant 2
				$GreenhouseControl/VisiblePlantsControl/Plant2Control.show()
				$ShopControl/ShopBackground/ListControl/ListJadeControl.show()
				
			if daisyLevel == 21:
				$GreenhouseControl/VisiblePlantsControl/Plant1Control/Daisy.texture = load("res://Assets/daisy2 - Copy.png")
			if daisyLevel == 41:
				$GreenhouseControl/VisiblePlantsControl/Plant1Control/Daisy.texture = load("res://Assets/daisy3 - Copy.png")
			
			if daisyLevel == 60:
				# change button for buy daisy to say max.
				$ShopControl/ShopBackground/ListControl/ListDaisyControl/DaisyBuyButtonControl.hide()
								
			daisyCost = int(daisyCost * 1.1)
			
			UpdateUI()


func _on_plant_1_timer_timeout():
	$GreenhouseControl/VisiblePlantsControl/Plant1Control/Plant1Bubbles.play()
	oxygen += daisyProduction
	UpdateUI()
	$Plant1Timer.start()


func _on_jade_buy_button_button_down():
	if jadeLevel < 120: # max jade level = 120
		# increment level, increase production, increase price, remove oxygen
		if jadeCost <= oxygen:
			# purchase allowed
			oxygen = oxygen - jadeCost
			jadeLevel += 1
			jadeProduction += (jadeMaxProduction/120)
			
			if jadeLevel == 1:
				$GreenhouseControl/VisiblePlantsControl/Plant2Control/Jade.texture = load("res://Assets/jade1.png")
				$Plant2Timer.start()
				# open option to buy plant 3
				
				
			if jadeLevel == 21:
				$GreenhouseControl/VisiblePlantsControl/Plant2Control/Jade.texture = load("res://Assets/jade2.png")
			if jadeLevel == 41:
				$GreenhouseControl/VisiblePlantsControl/Plant2Control/Jade.texture = load("res://Assets/jade3.png")
			if jadeLevel == 61:
				$GreenhouseControl/VisiblePlantsControl/Plant2Control/Jade.texture = load("res://Assets/jade4.png")
			if jadeLevel == 81:
				$GreenhouseControl/VisiblePlantsControl/Plant2Control/Jade.texture = load("res://Assets/jade5.png")
			if jadeLevel == 101:
				$GreenhouseControl/VisiblePlantsControl/Plant2Control/Jade.texture = load("res://Assets/jade6.png")
			if jadeLevel == 120:
				# change button for buy daisy to say max.
				$ShopControl/ShopBackground/ListControl/ListJadeControl/JadeBuyButtonControl.hide()
								
			jadeCost = int(jadeCost * 1.15)
			
			UpdateUI()


func _on_plant_2_timer_timeout():
	$GreenhouseControl/VisiblePlantsControl/Plant2Control/Plant2Bubbles.play()
	oxygen += jadeProduction
	UpdateUI()
	$Plant2Timer.start()
