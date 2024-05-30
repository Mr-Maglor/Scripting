#!/bin/bash
###############################
# Script utilisé pour créer un dossier de sauvegarde de fichier et les déplacer.
###############################


#Demande de sauvegarde des fichiers 
while   [ "$Sauvegarde" != "O" ]; do
	read -p " Voulez vous sauvegarder des fichiers (O/N) ? :" Sauvegarde
	
	
	# Demande du dossier à enregistrer
	read -p "Quel dossier voulez vous enregistrer :" NomDossier

	# Vérificaiton que le dossier existe
	if [ -d "$NomDossier" ]; then

	    # Emplacement où sauvegarder le fichier
	    read -p "Ou vous voulez vous enregistrer votre fichier :" EmplacementSauvegarde
	    # Vérificaiton que le dossier de sauvegarde n'existe pas
	    if [ -d "$EmplacementSauvegarde" ]; then
		read -p "Dossier déjà existant, voulez vous l'écraser ? (O/N) :" Choix2
		          if [ "$Choix2" == "N" ]; then
		              read -p "Quel nouveau dossier voulez vous créér ? :" EmplacementSauvegarde
		          else
		              echo "Le dossier sera ecrasé"
		          fi
	    fi

	    # confirmation emplacement de sauvegarde    
	    read -p "Etes vous sur de vouloire sauvegarder $NomDossier dans $EmplacementSauvegarde ? (O/N) :" Choix1 

	      # création du dossier de sauvegarde
	    if [ "$Choix1" == "O" ]; then
		echo " Création du répèretoire $EmplacementSauvegarde en cours"
		mkdir -p $EmplacementSauvegarde
		sleep 3s
		echo " Création du répèretoire $EmplacementSauvegarde confirmé"
		  
	     # Copie du dossier
		echo "Sauvegarde du fichier en cours"
		sleep 1s
		cp -R $NomDossier $EmplacementSauvegarde
	     	  
	     	# Vérification état sauvgerde
	     	if [ $? -eq 0 ]; then
		    echo "Sauvegarde effectuée OK."
		else
		    echo "Sauvegarde NOK."
		fi
	      # Commande incorrect ou annulation de la sauvegarde
	    else
		echo " Commande incorrect ou sauvegarde annulée"
		sleep 1s
		echo " Veuillez reprendre depuis le début"
	    fi
	else
	  echo "votre dossier n'existe pas"
	fi
done 
 echo "sauvegarde annulée"
