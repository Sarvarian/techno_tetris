class_name Tetromino
extends RigidBody2D


const ANG_DAMP : int = 3
const ROT_SPEED : int = 200000


var target_look : Vector2 = Vector2.RIGHT


func _init() -> void:
	angular_damp = ANG_DAMP
	can_sleep = false


func _physics_process(delta : float) -> void:
	apply_torque_impulse(get_angle_to(global_position + target_look) * delta * ROT_SPEED)


func _input(event : InputEvent) -> void:
	if event.is_action_pressed("rotate_left"):
		target_look = target_look.rotated(deg2rad(-90))
	elif event.is_action_pressed("rotate_right"):
		target_look = target_look.rotated(deg2rad(90))
	elif OS.is_debug_build():
		if event.is_action_pressed("ui_accept"):
			queue_free()
		elif event.is_action_pressed("ui_cancel"):
			get_tree().quit()
