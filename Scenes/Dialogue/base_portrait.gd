class_name BasePortrait extends AnimatedSprite2D

func emote(tags: Array) -> void:
	for tag in tags:
		if tag == "happy":
			frame = 0
		if tag == "angry":
			frame = 1
		
			
func happy() -> void:
	frame = 0
	
func angry() -> void:
	frame = 1
