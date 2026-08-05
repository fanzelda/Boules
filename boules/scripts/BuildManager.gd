extends Node

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
func BuildLockWorld(canva,selected_build_item,x,y):
	assert(selected_build_item in BuildItems.values(), "selected_build_item must be a valid BuildItems value")
	assert(0 <= x and x < size_building_canva, "x must be within the canva bounds")
	assert(0 <= y and y < size_building_canva, "y must be within the canva bounds")
	canva[x][y] = selected_build_item
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
		canva.append([0] * size)
	return canva


"""
Draw a Canva for the player. Maybe useless, depends if Godot can do it by itself or not
@param canva (2D-list)
return None
"""
func DrawCanva(canva):
	pass
	
"""
Verify if the canva made by the player is in the patern list
@param canva (2D-list) 
@param list_patern (list of 2D-list)
return bool 

#list_patern = [
	[[0, 0, 0, 0, 0, 0, 0, 0, 0],
	 [0, 1, 1, 1, 1, 1, 1, 1, 0],
	 [0, 1, 2, 2, 2, 2, 2, 1, 0],
	 [0, 1, 2, 3, 3, 3, 2, 1, 0],
	 [0, 1, 2, 3, 4, 3, 2, 1, 0],
	 [0, 1, 2, 3, 3, 3, 2, 1, 0],
	 [0, 1, 2, 2, 2, 2, 2, 1, 0],
	 [0, 1, 1, 1, 1 ,1 ,1 ,1 ,0],
	 [0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0]],
	 
	[[...], [...], [...], [...], [...], [...], [...], [...], [...]]
]

# Bon bah jsp l'a cancel rip verifypatern, petit ange partie trop tôt
"""
func VerifyPatern(canva,list_patern):
	if canva in list_patern:
		return true
	return false



#function for testing things 
func _ready():
	var my_canva = CreationCanva()
	var build_item = BuildItems.WHITE
	print(my_canva) 
	print((build_item == 1)) #true
	BuildLockWorld(my_canva,build_item,0,0)
	print(my_canva)