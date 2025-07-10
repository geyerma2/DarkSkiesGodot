extends Node


func _on_dialogue_option_1_button_down() -> void:
	var sprite = $AnimatedSprite2D
	var characterDialogue = $CharacterDialogue
	sprite.frame = 0
	characterDialogue.text = "Okay"


func _on_dialogue_option_2_button_down() -> void:
	var sprite = $AnimatedSprite2D
	var characterDialogue = $CharacterDialogue
	sprite.frame = 1
	characterDialogue.text = "That makes me mad"
