extends CanvasLayer

@export var planet : PackedScene
@export var planets_list : Array[PlanetInfo]
@export var planets_list2 : Array[PlanetInfo]

@onready var control_panel: CanvasLayer = $"."
@onready var close_button: Button = $Control_Panel_Container/Control_Panel/VBoxContainer/Close_Button
@onready var h_box_container: HBoxContainer = $Control_Panel_Container/Control_Panel/VBoxContainer/HBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	close_button.pressed.connect(close_panel)

	Signals.populate_planets.connect(Callable(self, "populate_planets").bind(planets_list))
	Signals.populate_planets2.connect(Callable(self, "populate_planets").bind(planets_list2))

func close_panel():
	control_panel.hide()
	
	for child in h_box_container.get_children():
		child.queue_free()

func populate_planets(list):
	for info in list:
		var planet_instance = planet.instantiate()
		planet_instance.name = info.planet_name
		planet_instance.texture_normal = info.texture
		h_box_container.add_child(planet_instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
