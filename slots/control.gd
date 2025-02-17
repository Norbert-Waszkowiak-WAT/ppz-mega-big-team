extends Control

var image_paths = [
	"res://img/i-brick.png",
	"res://img/j-brick.png",
	"res://img/l-brick.png",
	"res://img/o-brick.png",
	"res://img/s-brick.png",
	"res://img/t-brick.png",
	"res://img/z-brick.png",
]

@onready var boxes = $boxes.get_children()

var is_spinning = false
var spin_count = 50
var speed = 0.15
var speed_change = 0.01

# set texture at start
func _ready():
	for box in boxes:
		box.get_node("img1").texture = load(image_paths[randi() % image_paths.size()]) as Texture2D
		box.get_node("img2").texture = load(image_paths[randi() % image_paths.size()]) as Texture2D

func _on_button_pressed():
	if not is_spinning:
		start_spin()

func start_spin():
	is_spinning = true
	var cycles_left = spin_count
	var current_speed = speed
	
	while cycles_left > 0:
		var animations = []
		for box in boxes:
			animations.append(animate_spin(box, current_speed))
		for animation in animations:
			await animation.finished

		# Gradually increase speed in the first half, then slow it down
		if cycles_left > 40:
			current_speed = current_speed - speed_change
		elif cycles_left < 10:
			current_speed += 2*speed_change
		cycles_left -= 1
		

	# Final cycle to stop with the final texture
	is_spinning = false

func animate_spin(box: Control,anim_speed: float) -> Tween:
	var img1 = box.get_node("img1")
	var img2 = box.get_node("img2")
	
	if img1.position.y == 0:
		img2.texture = load(image_paths[randi() % image_paths.size()]) as Texture2D
	else:
		img1.texture = load(image_paths[randi() % image_paths.size()]) as Texture2D
		

	var tween = create_tween()

	# Slide Img1 and Img2 down
	if img1.position.y == 0:
		tween.parallel().tween_property(img1, "position:y", 100, anim_speed)
		tween.parallel().tween_property(img2, "position:y", 0, anim_speed)
	else:
		tween.parallel().tween_property(img2, "position:y", 100, anim_speed)
		tween.parallel().tween_property(img1, "position:y", 0, anim_speed)
	# Once the animation finishes, reset positions
	tween.finished.connect(reset_positions)
	return tween

# Reset positions after a single spin step
func reset_positions():
	for box in boxes:
		var img1 = box.get_node("img1")
		var img2 = box.get_node("img2")
		if img1.position.y >= 100:
			img1.position = Vector2(0, -100)  # Move Img1 back to the top
		elif img2.position.y >= 100:
			img2.position = Vector2(0, -100)  # Move Img2 back to the top
