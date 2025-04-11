extends StaticBody2D

@onready var npc_sprite: Sprite2D = $npcSprite
var is_focusing: bool = false
var focused_area: Area2D = null

# Rotates the NPC so it faces what entered its area
func turn_to_area(area: Area2D):
	var angle = global_position.angle_to_point(area.global_position)
	var tween = get_tree().create_tween()
	# Corrects the angle to stop tween from looping back
	angle = lerp_angle(rotation, angle, 0.5)
	tween.tween_property(self, "rotation", angle, 0.25)

func _process(_delta: float) -> void:
	if is_focusing:
		turn_to_area(focused_area)

func _on_npc_interactive_area_area_entered(area: Area2D) -> void:
	is_focusing = true
	focused_area = area

func _on_npc_interactive_area_area_exited(area: Area2D) -> void:
	is_focusing = false
