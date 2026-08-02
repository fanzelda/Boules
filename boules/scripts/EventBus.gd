extends Node
#Déjà mis en autoload 

#permet de communiquer un lancement de dialogue  	
signal dialogue_requested() 

#permet de communiquer un lancement de mind_control 	
signal mind_control_attempted() 

#permet de communiquer un ramassage de collectible 	
signal collectible_picked_up(collectible_type : String) 
	  
#permet de communiquer le changement du nombre de collectible 
signal collectible_count_changed(collectible_count : int) 
 
#permet de communiquer un lancement du mode build
signal build_attempted()

#permet de communiquer l'atteinte de la limite de build 
signal max_build_reached()

#permet de communiquer une ouverture de paramètres
signal settings_opened()
