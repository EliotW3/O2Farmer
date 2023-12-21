extends Node2D

var rng = RandomNumberGenerator.new()

# new variables
var coins = 0
var o2 = 0

var query_apple = false
var appleTimer = 60 # 60 seconds for apples to grow
var appleQuantity = 5 # number of apples grown on timer finish
var appleValue = 10 # value of each apple

@export var Apple : PackedScene

var tulipCost = 100
var tulipMaxProduction = 100
var tulipLevel = 0
var tulipProduction = 0

var greenhousePage = 1 #starting on first page of the greenhouse





# Called when the node enters the scene tree for the first time.
func _ready():
	UpdateUI()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
# function to update UI
func UpdateUI():
	$Background/O2Label.text = str(o2)
	$Background/CoinsLabel.text = str(coins)
	$ShopControl/ShopBackground/ListControl/ListTulipControl/TulipCost.text = str(tulipCost)
	$ShopControl/ShopBackground/ListControl/ListTulipControl/TulipIncrement.text = "+" + str(tulipProduction) + "/sec"
	$ShopControl/ShopBackground/ListControl/ListTulipControl/TulipLevelLabel.text = "L." + str(tulipLevel)
	
	

func setGreenhouse():
	$Background.texture = load("res://Assets/Pixelart/greenhouse2.png")
	$Background/DoorControl/RightButton.show()
	$GreenhouseControl.show()
	$GardenControl.hide()
	$Background/LeftButton.hide()

func setGarden():
	$Background/DoorControl/RightButton.hide()
	$Background.texture = load("res://Assets/Pixelart/garden.png")
	$GreenhouseControl.hide()
	$GardenControl.show()
	$Background/LeftButton.show()

func _on_close_shop_button_button_down():
	$ShopControl.hide()
	$ShopButtonControl/ShopButton.show()


func _on_shop_button_button_down():
	$ShopButtonControl/ShopButton.icon = load("res://Assets/Pixelart/shop_button2.png")
	

func _on_shop_button_button_up():
	$ShopControl.show()
	$ShopButtonControl/ShopButton.icon = load("res://Assets/Pixelart/shop_button1.png")
	$ShopButtonControl.hide()

func _on_tulip_buy_button_button_down():
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



func _on_right_button_button_up():
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
