extends StaticBody2D

@onready var npc_sprite: Sprite2D = $npcSprite
var is_viewing: bool = false
var viewed_area: Area2D = null

# Rotates the NPC so it faces what entered its vision area
func turn_to_area(area: Area2D):
	var angle = global_position.angle_to_point(area.global_position)
	var tween = get_tree().create_tween()
	# Corrects the angle to stop tween from looping back
	angle = lerp_angle(rotation, angle, 0.5)
	tween.tween_property(self, "rotation", angle, 0.25)

func _process(_delta: float) -> void:
	if is_viewing:
		turn_to_area(viewed_area)

func _on_npc_vision_area_area_entered(area: Area2D) -> void:
	is_viewing = true
	viewed_area = area

func _on_npc_vision_area_area_exited(_area: Area2D) -> void:
	is_viewing = false
