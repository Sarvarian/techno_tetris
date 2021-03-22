extends Node2D


export(Array, PackedScene) var tetrominos : Array

var rng : RandomNumberGenerator = RandomNumberGenerator.new()


func _init() -> void:
	rng.randomize()


func _physics_process(_delta : float) -> void:
	if get_child_count() == 0:
		spawn()


func spawn() -> void:
	add_child(tetrominos[random_index()].instance())


func random_index() -> int:
	return rng.randi_range(0, tetrominos.size()-1)
