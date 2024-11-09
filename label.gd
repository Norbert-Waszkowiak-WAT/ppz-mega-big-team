extends Label

func wait_for_key_press(action_name):
	while not Input.is_action_just_pressed(action_name):
		await get_tree().process_frame



var texts = [
	"Witaj w Demonicznym kasynie.",
	"Pozwol, ze wprowadze Cie w gre.",
	"Kim jestem?",
	"Traktuj mnie jako twojego wszechwiedzacego przewodnika.",
	"Oto twoj lore:",
	"Jestes biedna sierota. Twoj ojciec popelnil samobojstwo
	i zostawil sie z ogromnymi dlugami.",
	"Teraz musisz odkuc sie grajac w kasynie.",
	"Brzmi swietnie co nie?",
]

func _play_aniamtion():
	$AnimationPlayer.play("label_animation")


func _ready():
	for i in range(texts.size()):
		self.text = texts[i]
		print(self.text)
		_play_aniamtion()
		await get_tree().create_timer(3).timeout
	await wait_for_key_press("ui_accept")
	print("gówno")
	get_tree().change_scene_to_file("res://scenes/scena_3.tscn")
