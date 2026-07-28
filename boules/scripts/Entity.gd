extends Node

var id : int
var components : Array[Component]
var dictComponents = {"State": 0, "Saveable": 1, "Build": 2, }

func addComponent(component : Component) -> void :
	components[component.getType()] = component

func getComponent(indice : int) -> Component :
	return components[indice]

func removeComponent(component : Component) -> Component : 
	pass

func hasComponent(component : Component) -> boolean :
	pass
