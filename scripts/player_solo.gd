extends CharacterBody2D

@export var gravity = 1000.0
@export var walk_speed = 300
@export var jump_speed = -400

const dashSpeed = 5
var crouch_speed = 120

var is_dashing = false
var dash_duration_timer = 0.0
const DASH_DURATION = 0.5
var dash_cooldown_timer = 0.0
const DASH_COOLDOWN = 3.0

var is_crouching = false
var jump_count = 0
var max_jump = 2

# Animation
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
#	Gravity
	velocity.y += delta * gravity
	
# 	Animation
	var direction := Input.get_axis('ui_left', 'ui_right')

# 	Movement
#	Jump
	#if is_on_floor() and Input.is_action_just_pressed('ui_accept') or Input.is_action_just_pressed('ui_up'):
		#velocity.y = jump_speed
		
# 	DOUBLE JUMP (gk boleh lebih dari 2 kali jump)
	#if !is_on_floor() and Input.is_action_just_pressed('ui_accept') or Input.is_action_just_pressed('ui_up'):
		#velocity.y = jump_speed
	if is_on_floor():
		jump_count = 0
		
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_up"):
		if jump_count < max_jump:
			velocity.y = jump_speed
			jump_count += 1
	
# CROUCH (hold-based)
	is_crouching = is_on_floor() and Input.is_action_pressed("ui_down")

	var current_speed = walk_speed
	if is_crouching:
		current_speed = crouch_speed
	
# Dash
	dash_cooldown_timer = max(dash_cooldown_timer - delta, 0.0)
	dash_duration_timer = max(dash_duration_timer - delta, 0.0)
	if dash_duration_timer <= 0:
		is_dashing = false
		
# Jalan Kanan Kiri dan Dash
	if Input.is_action_pressed("ui_left"):
		velocity.x = -current_speed
		if Input.is_action_pressed("dash") and dash_cooldown_timer <= 0 and not is_dashing:
			is_dashing = true
			dash_cooldown_timer = DASH_COOLDOWN
			dash_duration_timer = DASH_DURATION
		if is_dashing:
			velocity.x = -current_speed * dashSpeed
		handle_animation(direction)
	elif Input.is_action_pressed("ui_right"):
		velocity.x = current_speed
		if Input.is_action_pressed("dash") and dash_cooldown_timer <= 0 and not is_dashing:
			is_dashing = true
			dash_cooldown_timer = DASH_COOLDOWN
			dash_duration_timer = DASH_DURATION
		if is_dashing:
			velocity.x = current_speed * dashSpeed
		handle_animation(direction)
	else:
		velocity.x = 0
		handle_animation(direction)

	# "move_and_slide" already takes delta time into account.
	move_and_slide()
	
#	RESET ke start kalo mati (jatuh ke bawah gituuu)
	if position.y > 500:
		get_tree().reload_current_scene()

func handle_animation(direction):
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true

	if is_dashing:
		animated_sprite_2d.play("dash")
	elif is_crouching:
		animated_sprite_2d.play("crouch")
	elif is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("walk")


func _on_animated_sprite_2d_frame_changed() -> void:
	# pastikan hanya di animasi walk
	if animated_sprite_2d.animation != "walk":
		return
