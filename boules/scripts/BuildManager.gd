extends Node2D

enum BuildItems {
	BLACK,
	WHITE,
	YELLOW,
	BLUE,
	RED,
	GREEN,
	BROWN,
	PURPLE
}


var size_building_canva = 9 
var cell_size = 70 # Size of each cell in pixels
var canva_global = CreationCanva()
var selected_build_item = BuildItems.WHITE
var list_patern = [
	[[0, 0, 0, 0, 0, 0, 0, 0, 1],
	 [0, 0, 0, 0, 0, 0, 0, 1, 1],
	 [0, 0, 0, 0, 0, 0, 1, 1, 1],
	 [0, 0, 0, 0, 0, 1, 1, 1, 1],
	 [0, 0, 0, 0, 1, 1, 1, 1, 1],
	 [0, 0, 0, 1, 1, 1, 1, 1, 1],
	 [0, 0, 1, 1, 1, 1, 1, 1, 1],
	 [0, 1, 1, 1, 1 ,1 ,1 ,1 ,1],
	 [1 ,1 ,1 ,1 ,1 ,1 ,1 ,1 ,1]],

	 [[0, 0, 0, 0, 0, 0, 0, 0, 0],
	 [0, 2, 2, 2, 2, 2, 2, 2, 0],
	 [0, 0, 0, 0, 0, 0, 0, 0, 0],
	 [0, 0, 0, 0, 0, 0, 0, 0, 0],
	 [0, 0, 0, 0, 0, 0, 0, 0, 0],
	 [0, 0, 0, 0, 0, 0, 0, 0, 0],
	 [0, 0, 0, 0, 0, 0, 0, 0, 0],
	 [0, 0, 0, 0, 0, 0, 0, 0, 0],
	 [0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0]], 

	[[0, 0, 0, 0, 0, 0, 0, 0, 0],
	 [0, 0, 0, 0, 4, 0, 0, 0, 0],
	 [0, 0, 0, 0, 4, 0, 0, 0, 0],
	 [0, 0, 0, 0, 4, 0, 0, 0, 0],
	 [0, 0, 0, 0, 4, 0, 0, 0, 0],
	 [0, 0, 0, 0, 0, 0, 0, 0, 0],
	 [0, 0, 0, 0, 4, 0, 0, 0, 0],
	 [0, 0, 0, 0, 0, 0, 0, 0, 0],
	 [0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0]]
]



"""
Create a block in the sidescroller world
@param
return 
"""
func BuildOpenWorld():

	#build_attempted.emit()
	
	pass
"""
Delete a block in the sidescroller world
@param
return
"""
func EraseOpenWorld():

	pass
	

"""
Create a block of color in the tetris view (canva)
@param canva (2D-list)
@param selected_build_item (type : BuildItems.BLACK, BuildItems.WHITE, etc...)
@param x (int)
@param y (int)
return canva (2D-list)
"""
func BuildLockWorld(canva,select_build_item,x,y):
	assert(select_build_item in BuildItems.values(), "select_build_item must be a valid BuildItems value")
	assert(0 <= x and x < size_building_canva, "x must be within the canva bounds")
	assert(0 <= y and y < size_building_canva, "y must be within the canva bounds")
	canva[x][y] = select_build_item
	return canva
	
"""
Delete a block of color in the tetris view (canva)
@param canva (2D-list)
@param x (int)
@param y (int)
return canva (2D-list)
"""
func EraseLockWorld(canva,x,y):
	assert(0 <= x and x < size_building_canva, "x must be within the canva bounds")
	assert(0 <= y and y < size_building_canva, "y must be within the canva bounds")
	canva[x][y] = BuildItems.BLACK
	return canva

"""
Create an empty canva 
An empty canva is a 9*9 2D-list made of 0 (0 = black)
@param 
return canva (2D-list)
"""
func CreationCanva(size = size_building_canva):
	var canva = []
	for i in range(size):
		var line = [0,0,0,0,0,0,0,0,0]
		canva.append(line)
	return canva



"""
Verify if the canva made by the player is in the patern list
@param canva (2D-list) 
@param list_patern (list of 2D-list)
return bool 



"""
func VerifyPatern(canva,patern_list):
	if canva in patern_list:
		return true
	return false

"""
Choose a build item for the player
@param item (type : BuildItems.BLACK, BuildItems.WHITE, etc...)
return None
"""
func ChooseBuildItem(item):
	assert(item in BuildItems.values(), "item must be a valid BuildItems value")
	selected_build_item = item
	

"""
Draw a Canva for the player. Maybe useless, depends if Godot can do it by itself or not
@param canva (2D-list)
return None
"""
func DrawCanva(new_canva):
	assert(new_canva.size() == size_building_canva, "canva must be size %s" % size_building_canva)
	canva_global = new_canva
	queue_redraw() 

func get_color_for_item(item):
	match item:
		BuildItems.BLACK:
			return Color.BLACK
		BuildItems.WHITE:
			return Color.WHITE
		BuildItems.YELLOW:
			return Color(1, 1, 0)
		BuildItems.BLUE:
			return Color(0, 0.5, 1)
		BuildItems.RED:
			return Color(1, 0.2, 0.2)
		BuildItems.GREEN:
			return Color(0.2, 1, 0.2)
		_:
			return Color(0.2, 0.2, 0.2)

func _draw():
	for x in range(size_building_canva):
		for y in range(size_building_canva):
			var item = canva_global[x][y]
			var rect = Rect2(y * cell_size, x * cell_size, cell_size, cell_size)
			
			draw_rect(rect, get_color_for_item(item))
			draw_rect(rect, Color.BLACK, false, 1)
			
	var grid_size = size_building_canva * cell_size
	draw_rect(Rect2(0, 0, grid_size, grid_size), Color.TRANSPARENT, false, 2)

func _unhandled_input(event):
	if event is InputEventMouseButton or event is InputEventMouseMotion:
		
		var position_souris = get_local_mouse_position()
		
		var grid_x = int(position_souris.y / cell_size)
		var grid_y = int(position_souris.x / cell_size)
		
		if grid_x in range(size_building_canva) and grid_y in range(size_building_canva):
			if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
				BuildLockWorld(canva_global, selected_build_item, grid_x, grid_y)
				queue_redraw()
			elif Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
				EraseLockWorld(canva_global, grid_x, grid_y)
				queue_redraw()


#function for testing things 
func _ready():
	"""
	var my_canva = CreationCanva()
	DrawCanva(my_canva)
	"""
	DrawCanva(canva_global)

func _on_button_yellow_pressed() -> void:
	selected_build_item = BuildItems.YELLOW

func _on_button_blue_pressed() -> void:
	selected_build_item = BuildItems.BLUE

func _on_button_red_pressed() -> void:
	selected_build_item = BuildItems.RED


func _on_button_verify_pressed() -> void:
	if VerifyPatern(canva_global, list_patern):
		print("Canva matches a pattern!")
	else:
		print("Canva does not match any pattern.")


func _on_button_clear_pressed() -> void:
	canva_global = CreationCanva()
	queue_redraw()
