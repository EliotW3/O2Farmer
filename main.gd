extends Node2D

var rng = RandomNumberGenerator.new()

# variables
var coins = 1000000
var o2 = 0

var query_apple = false
var appleTimer = 60 # 60 seconds for apples to grow
var appleQuantity = 5 # number of apples grown on timer finish
var appleValue = 10 # value of each apple

# apple tree upgrades

var query_compost = false # compost upgrade adds a multiplier to apple value
var compostMultiplier = 1.5
var compostCost = 8000 # apple tree upgrades in o2 not coins - will increase by 6x 
var compostLevel = 0 # max of 10



@export var Apple : PackedScene

# flowers
var tulipCost = 100
var tulipMaxProduction = 100
var tulipLevel = 0
var tulipProduction = 0

var irisCost = 1000
var irisMaxProduction = 60000
var irisLevel = 0
var irisProduction = 0

var sunflowerCost = 16000
var sunflowerMaxProduction = 120000
var sunflowerLevel = 0
var sunflowerProduction = 0

var marigoldCost = 30000
var marigoldMaxProduction = 6000 # second
var marigoldLevel = 0
var marigoldProduction = 0

var azaleaCost = 60000
var azaleaMaxProduction = 450000 # min
var azaleaLevel = 0
var azaleaProduction = 0

var daisyCost = 450000
var daisyMaxProduction = 120000 # sec
var daisyLevel = 0
var daisyProduction = 0

var daffodilsCost = 756000
var daffodilsMaxProduction = 900000 # min
var daffodilsLevel = 0
var daffodilsProduction = 0

var alyssumCost = 900000
var alyssumMaxProduction = 1400000 # min
var alyssumLevel = 0
var alyssumProduction = 0

var geraniumCost = 1400000
var geraniumMaxProduction = 888888 # sec
var geraniumLevel = 0
var geraniumProduction = 0

var perennialCost = 64640000
var perennialMaxProduction = 999999 # sec
var perennialLevel = 0
var perennialProduction = 0

var cornflowerCost = 80000000
var cornflowerMaxProduction = 10000000 # min
var cornflowerLevel = 0
var cornflowerProduction = 0

var roseCost = 999999999
var roseMaxProduction = 5000000 # sec
var roseLevel = 0
var roseProduction = 0

var greenhousePage = 1 #starting on first page of the greenhouse





# Called when the node enters the scene tree for the first time.
func _ready():
	UpdateUI()



# function to update UI
func UpdateUI():
	$Background/O2Label.text = str(o2)
	$Background/CoinsLabel.text = str(coins)
	
	$ShopControl/ShopBackground/ListControl/ListTulipControl/TulipCost.text = str(tulipCost)
	$ShopControl/ShopBackground/ListControl/ListTulipControl/TulipIncrement.text = "+" + str(tulipProduction) + "/sec"
	$ShopControl/ShopBackground/ListControl/ListTulipControl/TulipLevelLabel.text = "L." + str(tulipLevel)
	
	$ShopControl/ShopBackground/ListControl/ListIrisControl/IrisCost.text = str(irisCost)
	$ShopControl/ShopBackground/ListControl/ListIrisControl/IrisIncrement.text = "+" + str(irisProduction) + "/min"
	$ShopControl/ShopBackground/ListControl/ListIrisControl/IrisLevelLabel.text = "L." + str(irisLevel)
	
	$ShopControl/ShopBackground/ListControl/ListSunflowerControl/SunflowerCost.text = str(sunflowerCost)
	$ShopControl/ShopBackground/ListControl/ListSunflowerControl/SunflowerIncrement.text = "+" + str(sunflowerProduction) + "/min"
	$ShopControl/ShopBackground/ListControl/ListSunflowerControl/SunflowerLevelLabel.text = "L." + str(sunflowerLevel)
	
	$ShopControl/ShopBackground/ListControl/ListMarigoldControl/MarigoldCost.text = str(marigoldCost)
	$ShopControl/ShopBackground/ListControl/ListMarigoldControl/MarigoldIncrement.text = "+" + str(marigoldProduction) + "/sec"
	$ShopControl/ShopBackground/ListControl/ListMarigoldControl/MarigoldLevelLabel.text = "L." + str(marigoldLevel)
	
	$ShopControl/ShopBackground/ListControl/ListAzaleaControl/AzaleaCost.text = str(azaleaCost)
	$ShopControl/ShopBackground/ListControl/ListAzaleaControl/AzaleaIncrement.text = "+" + str(azaleaProduction) + "/min"
	$ShopControl/ShopBackground/ListControl/ListAzaleaControl/AzaleaLevelLabel.text = "L." + str(azaleaLevel)
	
	$ShopControl/ShopBackground/ListControl/ListDaisyControl/DaisyCost.text = str(daisyCost)
	$ShopControl/ShopBackground/ListControl/ListDaisyControl/DaisyIncrement.text = "+" + str(daisyProduction) + "/sec"
	$ShopControl/ShopBackground/ListControl/ListDaisyControl/DaisyLevelLabel.text = "L." + str(daisyLevel)
	
	$ShopControl/ShopBackground/ListControl/ListDaffodilsControl/DaffodilsCost.text = str(daffodilsCost)
	$ShopControl/ShopBackground/ListControl/ListDaffodilsControl/DaffodilsIncrement.text = "+" + str(daffodilsProduction) + "/min"
	$ShopControl/ShopBackground/ListControl/ListDaffodilsControl/DaffodilsLevelLabel.text = "L." + str(daffodilsLevel)
	
	$ShopControl/ShopBackground/ListControl/ListAlyssumControl/AlyssumCost.text = str(alyssumCost)
	$ShopControl/ShopBackground/ListControl/ListAlyssumControl/AlyssumIncrement.text = "+" + str(alyssumProduction) + "/min"
	$ShopControl/ShopBackground/ListControl/ListAlyssumControl/AlyssumLevelLabel.text = "L." + str(alyssumLevel)
	
	$ShopControl/ShopBackground/ListControl/ListGeraniumControl/GeraniumCost.text = str(geraniumCost)
	$ShopControl/ShopBackground/ListControl/ListGeraniumControl/GeraniumIncrement.text = "+" + str(geraniumProduction) + "/sec"
	$ShopControl/ShopBackground/ListControl/ListGeraniumControl/GeraniumLevelLabel.text = "L." + str(geraniumLevel)
	
	$ShopControl/ShopBackground/ListControl/ListPerennialControl/PerennialCost.text = str(perennialCost)
	$ShopControl/ShopBackground/ListControl/ListPerennialControl/PerennialIncrement.text = "+" + str(perennialProduction) + "/sec"
	$ShopControl/ShopBackground/ListControl/ListPerennialControl/PerennialLevelLabel.text = "L." + str(perennialLevel)
	
	$ShopControl/ShopBackground/ListControl/ListCornflowerControl/CornflowerCost.text = str(cornflowerCost)
	$ShopControl/ShopBackground/ListControl/ListCornflowerControl/CornflowerIncrement.text = "+" + str(cornflowerProduction) + "/min"
	$ShopControl/ShopBackground/ListControl/ListCornflowerControl/CornflowerLevelLabel.text = "L." + str(cornflowerLevel)
	
	$ShopControl/ShopBackground/ListControl/ListRoseControl/RoseCost.text = str(roseCost)
	$ShopControl/ShopBackground/ListControl/ListRoseControl/RoseIncrement.text = "+" + str(roseProduction) + "/sec"
	$ShopControl/ShopBackground/ListControl/ListRoseControl/RoseLevelLabel.text = "L." + str(roseLevel)
	
	$ShopControl2/ShopBackground2/ListControl2/ListCompostControl/CompostCost.text = str(compostCost)
	$ShopControl2/ShopBackground2/ListControl2/ListCompostControl/CompostLevelLabel.text = "L." + str(compostLevel)


func setGreenhouse():
	$Background.texture = load("res://Assets/Pixelart/greenhouse2.png")
	$Background/DoorControl/RightButton.show()
	$GreenhouseControl.show()
	$GardenControl.hide()
	$Background/LeftControl.hide()
	$ShopControl2.hide()
	
	$ShopButtonControl2.hide()
	$ShopButtonControl.show()
	
	greenhousePage = 1

func setGarden():
	$Background/DoorControl/RightButton.hide()
	$Background.texture = load("res://Assets/Pixelart/garden.png")
	$GreenhouseControl.hide()
	$GardenControl.show()
	$Background/LeftControl.show()
	$ShopControl.hide()
	$ShopButtonControl2.show()
	$ShopButtonControl.hide()
	
	greenhousePage = 2

func _on_close_shop_button_button_down():
	$ShopControl/ShopBackground/CloseShopControl/CloseShopButton.icon = load("res://Assets/Pixelart/Buttons/x_button2.png")
	


func _on_shop_button_button_down():
	$ShopButtonControl/ShopButton.icon = load("res://Assets/Pixelart/Buttons/shop_button2.png")
	

func _on_shop_button_button_up():
	$ShopControl.show()
	$ShopButtonControl/ShopButton.icon = load("res://Assets/Pixelart/Buttons/shop_button.png")
	$ShopButtonControl.hide()

func _on_tulip_buy_button_button_down():
	$ShopControl/ShopBackground/ListControl/ListTulipControl/TulipBuyButtonControl/TulipBuyButton.icon = load("res://Assets/buy_button.png")
	



func _on_right_button_button_up():
	$Background/DoorControl/RightButton.icon = load("res://Assets/Pixelart/greenhouse_door.png")
	setGarden()


func _on_apple_timer_timeout():
	$GardenControl/Area2D/AppleTree.texture = load("res://Assets/Pixelart/appletree_grown.png")
	query_apple = true


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and query_apple == true \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.is_pressed():
		ShakeTree()

func ShakeTree():
	# shake tree animation, start apples falling, and replace.
	query_apple = false
	$GardenControl/Area2D.hide()
	$GardenControl/AppleAnimation.show()
	$GardenControl/AppleAnimation.play()
	DropApples()
	
	$AppleWait.start()
	
	


func _on_apple_wait_timeout():
	$GardenControl/Area2D.show()
	$GardenControl/Area2D/AppleTree.texture = load("res://Assets/Pixelart/appletree_ungrown.png")
	$GardenControl/AppleAnimation.hide()
	$AppleTimer.start()
	
	
func DropApples():
	
	# pick a random spot along the length of the tree, instantiate a new apple, have it fall and stop on a random spot within the range
	
	for n in range(0,appleQuantity):
		var spawnPositionX = rng.randf_range(13, 33)
		var endPositionX = spawnPositionX

		
		$GardenControl/Area2D/AppleMarker.position = Vector2(spawnPositionX,17.3)
		
		
		
		var apple = Apple.instantiate()

		$GardenControl.add_child(apple)
		
		apple.collect.connect(appleCollected)
		apple.transform = $GardenControl/Area2D/AppleMarker.transform
		apple.scale = Vector2(0.049,0.049)

func appleCollected():
	coins += appleValue
	$Background/CoinsLabel.text = str(coins)

# timers

func _on_tulip_timer_timeout():
	# play animation
	o2 += tulipProduction
	UpdateUI()
	$TulipTimer.start()


func _on_left_button_button_down():
	setGreenhouse()


func _on_iris_buy_button_button_down():
	if irisLevel < 100: # max iris level = 100
		# increment iris level, increase production, increase iris price, remove oxygen
		if irisCost <= coins:
			# purchase allowed
			coins = coins - irisCost
			irisLevel += 1
			irisProduction += (irisMaxProduction/100)
			
			if irisLevel == 1:
				$GreenhouseControl/VisiblePlantsControl/IrisControl.show()
				$IrisTimer.start()
				
				
			
			if irisLevel == 100:
				# change button for buy iris to say max.
				$ShopControl/ShopBackground/ListControl/ListIrisControl/IrisBuyButtonControl.hide()
				$ShopControl/ShopBackground/ListControl/ListIrisControl/IrisMax.show()
				$ShopControl/ShopBackground/ListControl/ListIrisControl/IrisLevelLabel.hide()
								
			irisCost = int(irisCost * 1.1)
			
			UpdateUI()



func _on_iris_timer_timeout():
	# play animation
	o2 += irisProduction
	UpdateUI()
	$IrisTimer.start()


func _on_sunflower_buy_button_button_down():
	if sunflowerLevel < 100: # max sunflower level = 100
		# increment sunflower level, increase production, increase sunflower price, remove oxygen
		if sunflowerCost <= coins:
			# purchase allowed
			coins = coins - sunflowerCost
			sunflowerLevel += 1
			sunflowerProduction += (sunflowerMaxProduction/100)
			
			if sunflowerLevel == 1:
				$GreenhouseControl/VisiblePlantsControl/SunflowerControl.show()
				$SunflowerTimer.start()
				
				
			
			if sunflowerLevel == 100:
				# change button for buy sunflower to say max.
				$ShopControl/ShopBackground/ListControl/ListSunflowerControl/SunflowerBuyButtonControl.hide()
				$ShopControl/ShopBackground/ListControl/ListSunflowerControl/SunflowerMax.show()
				$ShopControl/ShopBackground/ListControl/ListSunflowerControl/SunflowerLevelLabel.hide()
								
			sunflowerCost = int(sunflowerCost * 1.1)
			
			UpdateUI()


func _on_sunflower_timer_timeout():
	# play animation
	o2 += sunflowerProduction
	UpdateUI()
	$SunflowerTimer.start()


func _on_marigold_timer_timeout():
	# play animation
	o2 += marigoldProduction
	UpdateUI()
	$MarigoldTimer.start()


func _on_azalea_timer_timeout():
	# play animation
	o2 += azaleaProduction
	UpdateUI()
	$AzaleaTimer.start()


func _on_daisy_timer_timeout():
	# play animation
	o2 += daisyProduction
	UpdateUI()
	$DaisyTimer.start()


func _on_daffodils_timer_timeout():
	# play animation
	o2 += daffodilsProduction
	UpdateUI()
	$DaffodilsTimer.start()


func _on_alyssum_timer_timeout():
	# play animation
	o2 += alyssumProduction
	UpdateUI()
	$AlyssumTimer.start()


func _on_geranium_timer_timeout():
	# play animation
	o2 += geraniumProduction
	UpdateUI()
	$GeraniumTimer.start()


func _on_perennial_timer_timeout():
	# play animation
	o2 += perennialProduction
	UpdateUI()
	$PerennialTimer.start()


func _on_cornflower_timer_timeout():
	# play animation
	o2 += cornflowerProduction
	UpdateUI()
	$CornflowerTimer.start()


func _on_rose_timer_timeout():
	# play animation
	o2 += roseProduction
	UpdateUI()
	$RoseTimer.start()





func _on_marigold_buy_button_button_down():
	if marigoldLevel < 100: # max marigold level = 100
		# increment marigold level, increase production, increase marigold price, remove oxygen
		if marigoldCost <= coins:
			# purchase allowed
			coins = coins - marigoldCost
			marigoldLevel += 1
			marigoldProduction += (marigoldMaxProduction/100)
			
			if marigoldLevel == 1:
				$GreenhouseControl/VisiblePlantsControl/MarigoldControl.show()
				$MarigoldTimer.start()
				
				
			
			if marigoldLevel == 100:
				# change button for buy marigold to say max.
				$ShopControl/ShopBackground/ListControl/ListMarigoldControl/MarigoldBuyButtonControl.hide()
				$ShopControl/ShopBackground/ListControl/ListMarigoldControl/MarigoldMax.show()
				$ShopControl/ShopBackground/ListControl/ListMarigoldControl/MarigoldLevelLabel.hide()
								
			marigoldCost = int(marigoldCost * 1.1)
			
			UpdateUI()


func _on_azalea_buy_button_button_down():
	if azaleaLevel < 100: # max azalea level = 100
		# increment azalea level, increase production, increase azalea price, remove oxygen
		if azaleaCost <= coins:
			# purchase allowed
			coins = coins - azaleaCost
			azaleaLevel += 1
			azaleaProduction += (azaleaMaxProduction/100)
			
			if azaleaLevel == 1:
				$GreenhouseControl/VisiblePlantsControl/AzaleaControl.show()
				$AzaleaTimer.start()
				
				
			
			if azaleaLevel == 100:
				# change button for buy azalea to say max.
				$ShopControl/ShopBackground/ListControl/ListAzaleaControl/AzaleaBuyButtonControl.hide()
				$ShopControl/ShopBackground/ListControl/ListAzaleaControl/AzaleaMax.show()
				$ShopControl/ShopBackground/ListControl/ListAzaleaControl/AzaleaLevelLabel.hide()
								
			azaleaCost = int(azaleaCost * 1.1)
			
			UpdateUI()


func _on_daisy_buy_button_button_down():
	if daisyLevel < 100: # max daisy level = 100
		# increment daisy level, increase production, increase daisy price, remove oxygen
		if daisyCost <= coins:
			# purchase allowed
			coins = coins - daisyCost
			daisyLevel += 1
			daisyProduction += (daisyMaxProduction/100)
			
			if daisyLevel == 1:
				$GreenhouseControl/VisiblePlantsControl/DaisyControl.show()
				$DaisyTimer.start()
				
				
			
			if daisyLevel == 100:
				# change button for buy daisy to say max.
				$ShopControl/ShopBackground/ListControl/ListDaisyControl/DaisyBuyButtonControl.hide()
				$ShopControl/ShopBackground/ListControl/ListDaisyControl/DaisyMax.show()
				$ShopControl/ShopBackground/ListControl/ListDaisyControl/DaisyLevelLabel.hide()
								
			daisyCost = int(daisyCost * 1.1)
			
			UpdateUI()


func _on_daffodils_buy_button_button_down():
	if daffodilsLevel < 100: # max daffodils level = 100
		# increment daffodils level, increase production, increase daffodils price, remove oxygen
		if daffodilsCost <= coins:
			# purchase allowed
			coins = coins - daffodilsCost
			daffodilsLevel += 1
			daffodilsProduction += (daffodilsMaxProduction/100)
			
			if daffodilsLevel == 1:
				$GreenhouseControl/VisiblePlantsControl/DaffodilsControl.show()
				$DaffodilsTimer.start()
				
				
			
			if daffodilsLevel == 100:
				# change button for buy daffodils to say max.
				$ShopControl/ShopBackground/ListControl/ListDaffodilsControl/DaffodilsBuyButtonControl.hide()
				$ShopControl/ShopBackground/ListControl/ListDaffodilsControl/DaffodilsMax.show()
				$ShopControl/ShopBackground/ListControl/ListDaffodilsControl/DaffodilsLevelLabel.hide()
								
			daffodilsCost = int(daffodilsCost * 1.1)
			
			UpdateUI()


func _on_alyssum_buy_button_button_down():
	if alyssumLevel < 100: # max alyssum level = 100
		# increment alyssum level, increase production, increase alyssum price, remove oxygen
		if alyssumCost <= coins:
			# purchase allowed
			coins = coins - alyssumCost
			alyssumLevel += 1
			alyssumProduction += (alyssumMaxProduction/100)
			
			if alyssumLevel == 1:
				$GreenhouseControl/VisiblePlantsControl/AlyssumControl.show()
				$AlyssumTimer.start()
				
				
			
			if alyssumLevel == 100:
				# change button for buy alyssum to say max.
				$ShopControl/ShopBackground/ListControl/ListAlyssumControl/AlyssumBuyButtonControl.hide()
				$ShopControl/ShopBackground/ListControl/ListAlyssumControl/AlyssumMax.show()
				$ShopControl/ShopBackground/ListControl/ListAlyssumControl/AlyssumLevelLabel.hide()
								
			alyssumCost = int(alyssumCost * 1.1)
			
			UpdateUI()


func _on_geranium_buy_button_button_down():
	if geraniumLevel < 100: # max geranium level = 100
		# increment geranium level, increase production, increase geranium price, remove oxygen
		if geraniumCost <= coins:
			# purchase allowed
			coins = coins - geraniumCost
			geraniumLevel += 1
			geraniumProduction += (geraniumMaxProduction/100)
			
			if geraniumLevel == 1:
				$GreenhouseControl/VisiblePlantsControl/GeraniumControl.show()
				$GeraniumTimer.start()
				
				
			
			if geraniumLevel == 100:
				# change button for buy geranium to say max.
				$ShopControl/ShopBackground/ListControl/ListGeraniumControl/GeraniumBuyButtonControl.hide()
				$ShopControl/ShopBackground/ListControl/ListGeraniumControl/GeraniumMax.show()
				$ShopControl/ShopBackground/ListControl/ListGeraniumControl/GeraniumLevelLabel.hide()
								
			geraniumCost = int(geraniumCost * 1.1)
			
			UpdateUI()


func _on_perennial_buy_button_button_down():
	if perennialLevel < 100: # max perennial level = 100
		# increment perennial level, increase production, increase perennial price, remove oxygen
		if perennialCost <= coins:
			# purchase allowed
			coins = coins - perennialCost
			perennialLevel += 1
			perennialProduction += (perennialMaxProduction/100)
			
			if perennialLevel == 1:
				$GreenhouseControl/VisiblePlantsControl/PerennialControl.show()
				$PerennialTimer.start()
				
				
			
			if perennialLevel == 100:
				# change button for buy perennial to say max.
				$ShopControl/ShopBackground/ListControl/ListPerennialControl/PerennialBuyButtonControl.hide()
				$ShopControl/ShopBackground/ListControl/ListPerennialControl/PerennialMax.show()
				$ShopControl/ShopBackground/ListControl/ListPerennialControl/PerennialLevelLabel.hide()
								
			perennialCost = int(perennialCost * 1.1)
			
			UpdateUI()


func _on_cornflower_buy_button_button_down():
	if cornflowerLevel < 100: # max cornflower level = 100
		# increment cornflower level, increase production, increase cornflower price, remove oxygen
		if cornflowerCost <= coins:
			# purchase allowed
			coins = coins - cornflowerCost
			cornflowerLevel += 1
			cornflowerProduction += (cornflowerMaxProduction/100)
			
			if cornflowerLevel == 1:
				$GreenhouseControl/VisiblePlantsControl/CornflowerControl.show()
				$CornflowerTimer.start()
				
				
			
			if cornflowerLevel == 100:
				# change button for buy cornflower to say max.
				$ShopControl/ShopBackground/ListControl/ListCornflowerControl/CornflowerBuyButtonControl.hide()
				$ShopControl/ShopBackground/ListControl/ListCornflowerControl/CornflowerMax.show()
				$ShopControl/ShopBackground/ListControl/ListCornflowerControl/CornflowerLevelLabel.hide()
								
			cornflowerCost = int(cornflowerCost * 1.1)
			
			UpdateUI()

func _on_rose_buy_button_button_down():
	if roseLevel < 100: # max rose level = 100
		# increment rose level, increase production, increase rose price, remove oxygen
		if roseCost <= coins:
			# purchase allowed
			coins = coins - roseCost
			roseLevel += 1
			roseProduction += (roseMaxProduction/100)
			
			if roseLevel == 1:
				$GreenhouseControl/VisiblePlantsControl/RoseControl.show()
				$RoseTimer.start()
				
				
			
			if roseLevel == 100:
				# change button for buy rose to say max.
				$ShopControl/ShopBackground/ListControl/ListRoseControl/RoseBuyButtonControl.hide()
				$ShopControl/ShopBackground/ListControl/ListRoseControl/RoseMax.show()
				$ShopControl/ShopBackground/ListControl/ListRoseControl/RoseLevelLabel.hide()
								
			roseCost = int(roseCost * 1.1)
			
			UpdateUI()


func _on_compost_buy_button_button_down():
	# compost purchase
	if compostLevel < 20:
		# uses oxygen instead
		if compostCost <= o2:
			# purchase allowed
			o2 = o2 - compostCost
			compostLevel += 1
			appleValue = appleValue * 1.5
			
			if compostLevel == 1:
				# show the compost sprite
				pass
				
			
			if compostLevel == 20:
				
				$ShopControl2/ShopBackground2/ListControl2/ListCompostControl/CompostBuyButtonControl.hide()
				$ShopControl2/ShopBackground2/ListControl2/ListCompostControl/CompostMax.show()
				$ShopControl2/ShopBackground2/ListControl2/ListCompostControl/CompostLevelLabel.hide()
								
			compostCost = int(compostCost * 6)
			
			UpdateUI()


func _on_shop_button_2_button_down():
	$ShopButtonControl2/ShopButton2.icon = load("res://Assets/Pixelart/Buttons/shop_button2.png")

func _on_shop_button_2_button_up():
	$ShopButtonControl2/ShopButton2.icon = load("res://Assets/Pixelart/Buttons/shop_button.png")
	$ShopControl2.show()
	$ShopButtonControl2.hide()


# function to make the door pop out and be highlighted when hovered over
func _on_right_button_mouse_entered():
	$Background/DoorControl/RightButton.icon = load("res://Assets/Pixelart/greenhouse_door2.png")
	


func _on_right_button_mouse_exited():
	$Background/DoorControl/RightButton.icon = load("res://Assets/Pixelart/greenhouse_door.png")


func _on_close_shop_button_button_up():
	$ShopControl/ShopBackground/CloseShopControl/CloseShopButton.icon = load("res://Assets/Pixelart/Buttons/x_button1.png")
	$ShopControl.hide()
	$ShopButtonControl.show()

func _on_close_shop_button_2_button_down():
	$ShopControl2/ShopBackground2/CloseShopControl2/CloseShopButton2.icon = load("res://Assets/Pixelart/Buttons/x_button2.png")
	


func _on_close_shop_button_2_button_up():
	
	$ShopControl2/ShopBackground2/CloseShopControl2/CloseShopButton2.icon = load("res://Assets/Pixelart/Buttons/x_button1.png")
	$ShopControl2.hide()
	$ShopButtonControl2.show()





func _on_tulip_buy_button_button_up():
	$ShopControl/ShopBackground/ListControl/ListTulipControl/TulipBuyButtonControl/TulipBuyButton.icon = load("res://Assets/buy_button2.png")
	if tulipLevel < 100: # max tulip level = 100
		# increment tulip level, increase production, increase tulip price, remove oxygen
		if tulipCost <= coins:
			# purchase allowed
			coins = coins - tulipCost
			tulipLevel += 1
			tulipProduction += (tulipMaxProduction/100)
			
			if tulipLevel == 1:
				$GreenhouseControl/VisiblePlantsControl/TulipControl.show()
				$TulipTimer.start()
				
				
			
			if tulipLevel == 100:
				# change button for buy tulip to say max.
				$ShopControl/ShopBackground/ListControl/ListTulipControl/TulipBuyButtonControl.hide()
				$ShopControl/ShopBackground/ListControl/ListTulipControl/TulipMax.show()
				$ShopControl/ShopBackground/ListControl/ListTulipControl/TulipLevelLabel.hide()
								
			tulipCost = int(tulipCost * 1.1)
			
			UpdateUI()
