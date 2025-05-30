extends CharacterBody2D

@export var speed = 700
@export var gravity = 30
@export var jump = 700

func _physics_process(delta): 
		
	var horizontal = Input.get_axis("ui_left", "ui_right")
	
	velocity.x = speed * horizontal
	velocity.y += gravity
	
	if Input.is_action_just_pressed("ui_select"):
		velocity.y = -700
	
	move_and_slide()


func killPlayer():
	position = %RespawnPoint.position

func _on_death_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	killPlayer()
