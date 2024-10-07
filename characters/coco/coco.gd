extends CharacterBody2D


const SPEED = 50


@onready var animation_tree: AnimationTree = $AnimationTree

var input_vector: Vector2 = Vector2.ZERO

var attr = 10

const Balloon = preload("res://dialogues/balloon.tscn")

var summoned_creature_name = "未音"

func _ready() -> void:
	animation_tree.active = true


func _unhandled_input(_event: InputEvent) -> void:
	test_speak()
	# test_modified_speek()
	
	var x_axis: float = Input.get_axis("ui_left", "ui_right")
	var y_axis: float = Input.get_axis("ui_up", "ui_down")
	if x_axis:
		input_vector = x_axis * Vector2.RIGHT
	elif y_axis:
		input_vector = y_axis * Vector2.DOWN
	else:
		input_vector = Vector2.ZERO

func test_speak() -> void:
	if Input.is_action_just_pressed("ui_accept"):
		DialogueManager.show_dialogue_balloon(load("res://dialogues/another_test_dialogue.dialogue"), "start")

func test_modified_speek() -> void:
	var balloon: Node = Balloon.instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.start(load("res://dialogues/test_dialogue.dialogue"), "this_is_a_node_title")

func do_something() -> void:
	print("Coco do something...Like ignite a bomb.")
	print(attr)


func _physics_process(_delta: float) -> void:
	if input_vector.length() > 0:
		velocity = input_vector * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)
	
	move_and_slide()
	
	if velocity.length() > 0:
		animation_tree.set("parameters/idle/blend_position", velocity)
		animation_tree.set("parameters/walk/blend_position", velocity)
		animation_tree.get("parameters/playback").travel("walk")
	else:
		animation_tree.get("parameters/playback").travel("idle")
