# Scripts créés durant ma formation TSSR en 2024.

## Powershell 

- **Script_VM_Virtualbox_1.ps1** et **Script_VM_Virtualbox_2.ps1**  
Script permettant de gérer Virtualbox depuis Powershell (création/modification/supression de VM et équipement virtualisé sur la VM).  

- **Script_assitance.ps1**  
Script développé sur le premier projet TSSR, permet de lancer automatiquement une connexion sur un poste distant via RDP ou TightVNC.  

- **SuperScript.ps1**  
Script dévelloppé en collaboration pour le projet 2 TSSR pour maintenance et information sur Poste Distant Windows.  

- **Script_mise_en_forme_CSV.ps1** et **Script_mise_en_forme_CSV_S14.ps1**  
Script développé sur le troisième projet TSSR, il permet de mettre en forme un fichier **XLSX** (**s09_Pharmgreen.xlsx** et **s14_Pharmgreen.xlsx**)  en **CSV**, fichier contenant des informations utilisateurs pour les rajouter/modifier dans un Active Directory.  

- **Script_Ou_Auto.ps1**  
Script développé sur le troisième projet TSSR, il permet de créer/modifier automatiquement des Organizations Units et sous Organizations Units utilisateurs/ordinateurs dans un Active Directory.  
Le tout depuis un fichier **CSV** contenant des informations utilisateurs.  

- **Script_Groupe_auto_Users.ps1**  
Script développé sur le troisième projet TSSR, il permet de créer automatiquement des groupes et sous-groupes utilisateurs dans un Active Directory et de les affecter automatiquement dans des Organizations Units.  
Le tout depuis un fichier **CSV** fichier contenant des informations utilisateurs.  

- **Script_Ajout_Utilisateurs_Groupe.ps1**  
Script développé sur le troisième projet TSSR, il permet d'affecter automatiquement des utilisateurs dans un groupe d'un Active Directory.  
Le tout depuis un fichier **CSV** fichier contenant des informations utilisateurs.  

- **Script_Utilisateur_auto.ps1** et **Script_Modif_Utilisateur_auto.ps1**.  
Script développé sur le troisième projet TSSR, ils permettent de créer/modifier des utilisateurs dans Active Directory selon les information contenue dans un fichier CSV (manager, numéro de téléphone, date de naissance, ...).  

- **Script_Difference_User.ps1**  
Script développé sur le troisième projet TSSR, il permet de répertorier les différences entre deux fichier CSV et les compiler dans un autre fichier CSV.  
Utilisation principal : permet de voir les différences entre deux fichiers utilisateurs pour ensuite faire une mise à jour d'un Active Directory.  
Peut être utiliser avec **Script_Suppression_Utilisateur.ps1**, pour supprimer automatiquement des utilisateurs d'un Active Directory.  

- **script_AD-DS.ps1**  
Script développé sur le troisième projet TSSR, il permet depuis un fichier source **configAD-DS.csv** d'ajouter directement un Serveur Windows Core dans un Domaine et d'installer les base pour qu'il puisse passer en Controler de Domaine.  

## Bash 

- **script_saving_folder.sh**  
Script utilisé pour créer un dossier de sauvegarde de fichier et les déplacer.  

- **script_Cafe.sh**   
Script simulant une mahcine de distribution de boisson.  

- **SuperScript.sh**  
Script dévelloppé en collaboration pour le projet 2 TSSR pour maintenance et information sur Poste Distant Linux.  

- **Script_glpi_install.sh**  
Script dévelloppé en collaboration pour le projet 3 TSSR pour installer directement un serveur GLPI sur une machine Debian.  

