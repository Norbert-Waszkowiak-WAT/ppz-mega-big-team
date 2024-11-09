extends Label  # Możesz również użyć Particles3D, jeśli pracujesz z cząsteczkami 3D

var tween




func _ready():
	for i in range(texts.size()):
		visible_ratio = 0
		self.text = texts[i]
		tween = create_tween()
		tween.tween_property(self, "visible_ratio", 9.5, 10.0).set_trans(Tween.TRANS_LINEAR)
		
		tween.kill()
