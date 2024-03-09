read -p "Quelle est votre choix de Boisson : Café, Thé, Chocolat ou x pour sortir :" Choix

if [ $Choix == "café" ] || [ $Choix == "thé" ] || [ $Choix == "chocolat" ]; then
	  echo "vous avez choisit " $Choix
	else
	  echo "Choix invalide" $Choix
 	  read -p " refait ton choix connard :" Choix
	  while [ $Choix != "x" ] && [ $Choix != "café" ] && [ $Choix != "thé" ] && [ $Choix != "chocolat" ]; do
	   read -p " c'est tjr pas bon :" Choix
	   done	
 fi 
