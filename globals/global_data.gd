extends Node

var attr: int = 10

var irrawa_intimacy = 100
var lord_intimacy = 100

func show_attr() -> void:
	print(attr)

func set_attr(new_attr: int) -> void:
	attr = new_attr
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
