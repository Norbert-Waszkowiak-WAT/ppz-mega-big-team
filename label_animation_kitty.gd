extends Label

func _ready():
	pivot_offset = size / 2 
	$AnimationPlayer.play("Pulse")
