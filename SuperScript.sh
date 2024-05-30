################################################################################################################################################################################################################

################################################################################################################################################################################################################

# Script Bash pour Maintenance et Information sur Poste Distant Linux

# Version 1.0

# Réalisé en collaboration par Anais Lenglet, Bruno Serna, Grégory Dubois, Patrick Baggiolini et Thomas Scotti

# Dernière mise à jour le  08 / 04 / 2024

# Historique version

# V1.0 -- 22 / 04 / 2024 : Version finale

# V0.9 -- 21 / 04 / 2024 : Correction syntaxique + Colorisation

# V0.8 -- 08 / 04 / 2024 : Finalisation chemin pour enregistrement fichier information utilisateur/computeur

# V0.75 -- 05 / 04 / 2024 : Création répertoire "Documents" et création var pour chemin enregistrement info utilisateur/computeur

# V0.7 -- 04 / 04 / 2024 : Ajout Fonction information ordinateur

# V0.6 -- 04 / 04 / 2024 : Ajout log event / Fonction action ordinateur / Fonction action utilisateur Et  Fonction information utilisateur

# V0.5 -- 03 / 04 / 2024 : Création script

################################################################################################################################################################################################################

################################################################################################################################################################################################################



####################################################

########### Fonction Menu Principal ################

####################################################



############## DEBUT FONCTION ######################



# Définition des codes de couleur ANSI

RED='\033[0;31m'

BLUEL='\033[0;36m'

BLUED='\033[0;34m'

GREEN='\033[0;32m'

YELLOW='\033[0;33m'

NC='\033[0m' # No Color



# Définition couleur du Background

BG_YELLOW='\033[43m'



# Fonction menu principal

Menu_Principal() {

    while true; do

        # Effacer l'écran

        clear

        # Demande de premier choix ACTION / INFORMATION ou QUITTER

        echo "==================================================="

        echo -e "${BG_YELLOW}                   MENU PRINCIPAL                  ${NC}"

        echo "==================================================="

        echo ""

        echo "Poste distant : $nom_distant@$ip_distante"

        echo ""

        echo "Bonjour, voici les différents choix possibles à effectuer sur le poste distant :"

        echo ""

        echo "[1] Menu ACTION"

        echo "[2] Menu INFORMATION"

        echo ""

        echo "[X] Arrêter le script "

        echo ""

        read -p "Faites votre choix parmi la sélection ci-dessus : " choixMenuPrincipal

        case $choixMenuPrincipal in

        1)

            # Envoie vers MENU ACTION

            echo ""

            echo "Vous avez choisi ACTION" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-ACTION choisi" >>/var/log/log_evt.log

            Menu_Action

            ;;

        2)

            # Envoie vers MENU INFORMATION

            echo ""

            echo "Vous avez choisi INFORMATION" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-INFORMATION choisi" >>/var/log/log_evt.log

            Menu_Information

            ;;

        X)

            # Arrêt script

            echo ""

            echo "Arrêt du script" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Sortie de Script" >>/var/log/log_evt.log

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-********EndScript********" >>/var/log/log_evt.log

            exit 0

            ;;

        *)

            # Erreur de commande

            echo ""

            echo "Choix incorrect - Veuillez recommencer"

            echo ""

            read -p "Appuyez sur Entrée pour continuer ..." && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-erreur de commande" >>/var/log/log_evt.log

            ;;

        esac

    done

}



# Fonction menu Action

Menu_Action() {

    while true; do

        # Effacer l'écran

        clear

        # Demande choix ACTION UTILISATEUR / ACTION POSTE DISTANT / retour menu principal

        echo "=============================================="

        echo -e "${BG_YELLOW}                     ACTION                   ${NC}"

        echo "=============================================="

        echo ""

        echo "Poste distant : $nom_distant@$ip_distante"

        echo ""

        echo "[1] ACTION sur UTILISATEUR"

        echo "[2] ACTION sur POSTE"

        echo ""

        echo "[X] Retour menu principal "

        echo ""

        read -p "Faites votre choix parmi la sélection ci-dessus : " choixMenuAction

        case $choixMenuAction in

        1)

            echo ""

            echo "Vous avez choisi ACTION sur UTILISATEUR" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-ACTION sur UTILISATEUR choisi" >>/var/log/log_evt.log

            Menu_Action_Utilisateur

            ;;

        2)

            echo ""

            echo "Vous avez choisi ACTION sur POSTE" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-ACTION sur POSTE choisi" >>/var/log/log_evt.log

            Menu_Action_Ordinateur

            ;;

        X)

            echo ""

            echo "Retour au menu principal" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Retour au menu principal choisi" >>/var/log/log_evt.log

            return

            ;;

        *)

            echo ""

            echo "Choix incorrect - Veuillez recommencer"

            echo ""

            read -p "Appuyez sur Entrée pour continuer ..." && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-erreur de commande" >>/var/log/log_evt.log

            ;;

        esac

    done

}



# Fonction menu Information

Menu_Information() {

    while true; do

        # Effacer l'écran

        clear

        # Demande choix INFORMATION UTILISATEUR / ACTION POSTE DISTANT / retour menu principal

        echo "==============================================="

        echo -e "${BG_YELLOW}                   INFORMATION                 ${NC}"

        echo "==============================================="

        echo ""

        echo "Poste distant : $nom_distant@$ip_distante"

        echo ""

        echo "[1] INFORMATION sur UTILISATEUR"

        echo "[2] INFORMATION sur POSTE"

        echo ""

        echo "[X] Retour menu principal"

        echo ""

        read -p "Faites votre choix parmi la sélection ci-dessus : " choixMenuInformation

        case $choixMenuInformation in

        1)

            echo ""

            echo "Vous avez choisi INFORMATION sur UTILISATEUR" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-INFORMATION sur UTILISATEUR choisi" >>/var/log/log_evt.log

            Menu_Information_Utilsateur

            ;;

        2)

            echo ""

            echo "Vous avez choisi INFORMATION sur POSTE" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-INFORMATION sur POSTE choisi" >>/var/log/log_evt.log

            Menu_Information_Ordinateur

            ;;

        X)

            echo ""

            echo "Retour au menu principal" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Retour au menu principal choisi" >>/var/log/log_evt.log

            return

            ;;

        *)

            echo ""

            echo "Choix incorrect - Veuillez recommencer"

            echo ""

            read -p "Appuyez sur Entrée pour continuer ..." && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-erreur de commande" >>/var/log/log_evt.log

            ;;

        esac

    done

}



############## FIN FONCTION ######################



####################################################

########### Fonction Menu Action ###################

####################################################



############## DEBUT FONCTION ######################



# Fonction menu Action Utilisateur

Menu_Action_Utilisateur() {

    while true; do

        # Effacer l'écran

        clear

        #Demande choix ACTION UTILISATEUR / retour menu précédent / retour menu principal

        echo "=================================================="

        echo -e "${BG_YELLOW}             ACTION UTILISATEUR DISTANT           ${NC}"

        echo "=================================================="

        echo ""

        echo "Poste distant : $nom_distant@$ip_distante"

        echo ""

        echo "[1] Création d'un compte utilisateur local"

        echo "[2] Suppresion d'un compte utilisateur local"

        echo "[3] Désactivation d'un compte utilisateur local"

        echo "[4] Modification d'un mot de passe"

        echo "[5] Ajout d'un compte à un groupe d'administration"

        echo "[6] Ajout d'un compte à un groupe local"

        echo "[7] Sortie d'un compte à un groupe local"

        echo ""

        echo "[0] Retour au menu précédent"

        echo "[X] Retour au menu principal"

        echo ""

        # Demande du choix action

        read -p "Faites votre choix parmi la sélection ci-dessus : " choixMenuActionUser

        # Traitement de l'action choisie

        case $choixMenuActionUser in

        1)

            echo ""

            echo "Vous avez choisi de créer un compte utilisateur local" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Création d'un compte utilisateur local choisi" >>/var/log/log_evt.log

            créer_utilisateur

            ;;

        2)

            echo ""

            echo "Vous avez choisi de supprimer un compte utilisateur local" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Suppression d'un compte utilisateur local choisi" >>/var/log/log_evt.log

            supprimer_utilisateur

            ;;

        3)

            echo ""

            echo "Vous avez choisi de désactiver un compte utilisateur local" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Désactivation d'un compte utilisateur choisi" >>/var/log/log_evt.log

            désactiver_utilisateur

            ;;

        4)

            echo ""

            echo "Vous avez choisi de modifier un mot de passe" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Modification de mot de passe choisi" >>/var/log/log_evt.log

            changer_mdp

            ;;

        5)

            echo ""

            echo "Vous avez choisi d'ajouter un compte utilisateur à un groupe d'administration" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Ajout d'un compte à un groupe d'administration choisi" >>/var/log/log_evt.log

            ajouter_groupe_admin

            ;;

        6)

            echo ""

            echo "Vous avez choisi d'ajouter un compte utilisateur à un groupe local" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Ajout d'un compte à un groupe local choisi" >>/var/log/log_evt.log

            ajout_utilisateur_groupe

            ;;

        7)

            echo ""

            echo "Vous avez choisi de retirer un compte utilisateur d'un groupe local" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Retrait d'un compte à un groupe local choisi" >>/var/log/log_evt.log

            supprimer_utilisateur_groupe

            ;;

        0)

            echo ""

            echo "Retour au menu précédent" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-retour au menu précédent choisi" >>/var/log/log_evt.log

            return

            ;;

        X)

            echo ""

            echo "Retour au menu principal" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Retour au menu principal choisi" >>/var/log/log_evt.log

            Menu_Principal

            ;;

        *)

            echo ""

            echo "Choix incorrect - Veuillez recommencer"

            echo ""

            read -p "Appuyez sur Entrée pour continuer ..." && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-erreur de commande" >>/var/log/log_evt.log

            ;;

        esac

    done

}



# Fonction pour afficher le menu Ordinateur

Menu_Action_Ordinateur() {

    while true; do

        # Effacer l'écran1

        clear

        # Demande choix INFORMATION UTILISATEUR / ACTION POSTE DISTANT / retour menu principal

        echo "==================================================="

        echo -e "${BG_YELLOW}                ACTION POSTE DISTANT               ${NC}"

        echo "==================================================="

        echo ""

        echo "Poste distant : $nom_distant@$ip_distante"

        echo ""

        echo "[1]  Arrêt"

        echo "[2]  Redémarrage"

        echo "[3]  Vérouillage"

        echo "[4]  MàJ du système"

        echo "[5]  Création de repertoire"

        echo "[6]  Suppression de repertoire"

        echo "[7]  Prise de main à distance"

        echo "[8]  Activation du pare-feu"

        echo "[9]  Désactivation du pare-feu"

        echo "[10] Règles du pare-feu"

        echo "[11] Installation d'un logiciel"

        echo "[12] Désinstallation d'un logiciel"

        echo "[13] Exécution d'un script sur la machine distante"

        echo ""

        echo "[0]  Retour au menu précédent"

        echo "[X]  Retour au menu principal"

        echo ""

        # Demande du choix action

        read -p "Faites votre choix parmi la sélection ci-dessus : " choixMenuActionOrdinateur

        # Traitement de l'action choisie

        case $choixMenuActionOrdinateur in

        1)

            echo ""

            echo "Vous avez choisi d'arrêter le poste" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Arrêt du poste choisi" >>/var/log/log_evt.log

            shutdown

            ;;



        2)

            echo ""

            echo "Vous avez choisi de redémarrer le poste" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Redémarrage du poste choisi" >>/var/log/log_evt.log

            reboot

            ;;



        3)

            echo ""

            echo "Vous avez choisi de vérouiller le poste" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Vérouillage du poste choisi" >>/var/log/log_evt.log

            lock

            ;;



        4)

            echo ""

            echo "Vous avez choisi de mettre à jour le poste" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Mise à jour du poste choisi" >>/var/log/log_evt.log

            update

            ;;



        5)

            echo ""

            echo "Vous avez choisi de créer un dossier sur le poste" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Création d'un dossier sur le poste choisi" >>/var/log/log_evt.log

            create_directory

            ;;



        6)

            echo ""

            echo "Vous avez choisi de supprimer un dossier sur le poste" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Suppression d'un dossier sur le poste choisi" >>/var/log/log_evt.log

            remove_directory

            ;;



        7)

            echo ""

            echo "Vous avez choisi de prendre la main sur le poste" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Prise de main à distance sur poste choisi" >>/var/log/log_evt.log

            remote_control

            ;;



        8)

            echo ""

            echo "Vous avez choisi d'activer le pare-feu sur le poste" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Activation du pare-feu du poste choisi" >>/var/log/log_evt.log

            firewall_on

            ;;



        9)

            echo ""

            echo "Vous avez choisi de désactiver le pare-feu sur le poste" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Désactivation du pare-feu du poste choisi" >>/var/log/log_evt.log

            firewall_off

            ;;



        10)

            echo ""

            echo "Vous avez choisi de modifier les règles du pare-feu sur le poste" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Modification de règle du pare-feu du poste choisi" >>/var/log/log_evt.log

            firewall_rules

            ;;



        11)

            echo ""

            echo "Vous avez choisi d'installer d'un logiciel sur le poste" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Installation d'un logiciel choisi sur le poste choisi" >>/var/log/log_evt.log

            install_app

            ;;



        12)

            echo ""

            echo "Vous avez choisi de désinstaller d'un logiciel sur le poste" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Désinstallation d'un logiciel sur le poste choisi" >>/var/log/log_evt.log

            uninstall_app

            ;;



        13)

            echo ""

            echo "Vous avez choisi d'éxécuter un script sur le poste" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Exécution d'un script sur le poste choisi" >>/var/log/log_evt.log

            remote_script

            ;;

        0)

            echo ""

            echo "Retour au menu précédent" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-retour au menu précédent choisi" >>/var/log/log_evt.log

            return

            ;;

        X)

            echo ""

            echo "Retour au menu principal" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Retour au menu principal choisi" >>/var/log/log_evt.log

            Menu_Principal

            ;;

        *)

            echo ""

            echo "Choix incorrect - Veuillez recommencer"

            echo ""

            read -p "Appuyez sur Entrée pour continuer ..." && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-erreur de commande" >>/var/log/log_evt.log

            ;;

        esac

    done

}



############## FIN FONCTION ######################



####################################################

########### Fonction Menu iNFORMATION ##############

####################################################



############## DEBUT FONCTION ######################



# Fonction menu Information Utilisateur

Menu_Information_Utilsateur() {

    while true; do

        # Effacer l'écran

        clear

        #Demande choix INFOMRATION UTILISATEUR / retour menu précédent / retour menu principal

        echo "============================================="

        echo -e "${BG_YELLOW}       INFORMATION UTILISATEUR DISTANT       ${NC}"

        echo "============================================="

        echo ""

        echo "Poste distant : $nom_distant@$ip_distante"

        echo ""

        echo "[1] Date de la dernière connexion de l'utilisateur"

        echo "[2] Date de la dernière modification du mot de passe de l'utilisateur"

        echo "[3] Liste des session utilisateurs ouvertes"

        echo "[4] Droits/permissions sur un dossier"

        echo "[5] Droits/permissions sur un fichier"

        echo ""

        echo "[0] Retour au menu précédent"

        echo "[X] Retour au menu principal"

        echo ""

        # Demande du choix action

        read -p "Faites votre choix parmi la sélection ci-dessus : " choixMenuInformationUser

        # Traitement de l'action choisie

        case $choixMenuInformationUser in

        1)

            echo ""

            echo "Vous avez choisi de consulter la date de la dernière connexion de l'utilisateur" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Date dernière connexion utilisateur choisi" >>/var/log/log_evt.log

            info_connexion

            ;;

        2)

            echo ""

            echo "Vous avez choisi de consulter la date de la dernière modification du mot de passe de l'utilisateur" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Date dernière modificaiton mot de passe utilisateur choisi" >>/var/log/log_evt.log

            info_modification

            ;;

        3)

            echo ""

            echo "Vous avez choisi de consulter la liste des sessions utilisateurs ouvertes" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Liste des session utilisateurs ouvertes choisi" >>/var/log/log_evt.log

            liste_sessions

            ;;

        4)

            echo ""

            echo "Vous avez choisi de consulter les droits et permissions sur un dossier" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Droits/permission sur un dossier choisi" >>/var/log/log_evt.log

            droits_dossier

            ;;

        5)

            echo ""

            echo "Vous avez choisi de consulter les droits et permissions sur un fichier" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Droits/permission sur un fichier choisi" >>/var/log/log_evt.log

            droits_fichier

            ;;

        0)

            echo ""

            echo "Retour au menu précédent" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-retour au menu précédent choisi" >>/var/log/log_evt.log

            return

            ;;

        X)

            echo ""

            echo "Retour au menu principal" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Retour au menu principal choisi" >>/var/log/log_evt.log

            Menu_Principal

            ;;

        *)

            echo ""

            echo "Choix incorrect - Veuillez recommencer"

            echo ""

            read -p "Appuyez sur Entrée pour continuer ..." && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-erreur de commande" >>/var/log/log_evt.log

            ;;

        esac

    done

}



# Fonction menu Information ordinateur

Menu_Information_Ordinateur() {



    while true; do

        # Effacer l'écran

        clear

        #Demande choix INFOMRATION UTILISATEUR / retour menu précédent / retour menu principal

        echo "============================================="

        echo -e "${BG_YELLOW}         INFORMATION POSTE DISTANT        ${NC}"

        echo "============================================="

        echo ""

        echo "Poste distant : $nom_distant@$ip_distante"

        echo ""

        echo "[1]  Version de l'OS"

        echo "[2]  Nombre d'interfaces réseaux"

        echo "[3]  Adresse IP de chaque interface réseau"

        echo "[4]  Adresse MAC de chaque interface réseau"

        echo "[5]  Liste des applications / paquets installés"

        echo "[6]  Liste des utilisateurs locaux"

        echo "[7]  Informations CPU"

        echo "[8]  Mémoire RAM totale & Utilisation"

        echo "[9]  Utilisation du/des disque(s)"

        echo "[10] Utilisation du processeur"

        echo "[11] Statut du pare-feu & Liste des ports ouverts"

        echo ""

        echo "[0] Retour au menu précédent"

        echo "[X] Retour au menu principal"

        echo ""

        # Demande du choix action

        read -p "Faites votre choix parmi la sélection ci-dessus : " choixMenuInformationOrdinateur

        # Traitement de l'action choisie

        case $choixMenuInformationOrdinateur in

        1)

            echo ""

            echo "Vous avez choisi de consulter la version de l'OS" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Information Version de l'OS choisi" >>/var/log/log_evt.log

            GetOs

            ;;

        2)

            echo ""

            echo "Vous avez choisi de consulter le nombre d'interfaces réseaux" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Information Interfaces réseaux choisi" >>/var/log/log_evt.log

            NbrCarte

            ;;

        3)

            echo ""

            echo "Vous avez choisi de consulter l'adresse IP de chaque interface réseau" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Information Adresse IP de chaque interface choisi" >>/var/log/log_evt.log

            IPdemande

            ;;

        4)

            echo ""

            echo "Vous avez choisi de consulter l'adresse MAC de chaque interface réseau" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Information Adresse MAC de chaque interface choisi" >>/var/log/log_evt.log

            MACdemande

            ;;

        5)

            echo ""

            echo "Vous avez choisi de consulter la liste des applications/paquets installés" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Information Liste applicattions/paquets choisi" >>/var/log/log_evt.log

            Application

            ;;

        6)

            echo ""

            echo "Vous avez choisi de consulter la liste des utilisateurs locaux" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Information Liste utilisateurs locaux choisi" >>/var/log/log_evt.log

            Userlist

            ;;

        7)

            echo ""

            echo "Vous avez choisi de consulter la liste des informations CPU" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Information CPU choisi" >>/var/log/log_evt.log

            GetCpu

            ;;

        8)

            echo ""

            echo "Vous avez choisi de consulter la mémoire RAM totale et son utilisation" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Information RAM totale et utilisation choisi" >>/var/log/log_evt.log

            RamInfo

            ;;

        9)

            echo ""

            echo "Vous avez choisi de consulter l'utilisation du/des disque(s)" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Information Utilisation du/des disque(s) choisi" >>/var/log/log_evt.log

            DiskInfo

            ;;

        10)

            echo ""

            echo "Vous avez choisi de consulter l'utilisation du processeur" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Information Utilisation du processeur choisi" >>/var/log/log_evt.log

            ProcesseurInfo

            ;;



        11)

            echo ""

            echo "Vous avez choisi de consulter le statut du pare-feu et la liste des ports ouverts" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Information Statut du pare-feu et Liste des ports ouverts choisi" >>/var/log/log_evt.log

            StatusPare_feu

            ;;

        0)

            echo ""

            echo "Retour au menu précédent" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-retour au menu précédent choisi" >>/var/log/log_evt.log

            return

            ;;

        X)

            echo ""

            echo "Retour au menu principal" && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Retour au menu principal choisi" >>/var/log/log_evt.log

            Menu_Principal

            ;;

        *)

            echo ""

            echo "Choix incorrect - Veuillez recommencer"

            echo ""

            read -p "Appuyez sur Entrée pour continuer ..." && sleep 2s

            echo $(date +%Y%m%d-%H%M%S)"-$Operateur-erreur de commande" >>/var/log/log_evt.log

            ;;

        esac

    done

}



############## FIN FONCTION ######################



####################################################

########### Fonction Action Utilisateur ############

####################################################



############## DEBUT FONCTION ######################



# Création de compte utilisateur local

créer_utilisateur() {

    clear

    # Demande quel utilisateur à créer

    read -p "Quel compte utilisateur souhaitez-vous créer ? " newUser

    # Vérification si l'utilisateur existe

    if ssh $nom_distant@$ip_distante cat /etc/passwd | grep $newUser >/dev/null; then

        #Si oui -> sortie du script

        echo -e "${RED}L'utilisateur existe déjà${NC}" && sleep 2s

    else

        #Création de l'utilsateur

        ssh $nom_distant@$ip_distante sudo -S useradd $newUser >/dev/null

        #Confirmation de la création

        echo -e "${GREEN}Compte $newUser créé${NC}" && sleep 2s

    fi

}



# Changement de mot de passe

changer_mdp() {

    clear

    # Demande changment mot de passe -> pour quel utilisateur?

    read -p "Pour quel compte utilisateur souhaitez-vous modifier le mot de passe ? " user_mdp



    # Est-ce que le nom existe sur le systeme ?

    if ssh $nom_distant@$ip_distante cat /etc/passwd | grep $user_mdp >/dev/null; then

        # si oui -> modifier le mot de passe

        ssh $nom_distant@$ip_distante sudo -S passwd $user_mdp

        echo -e "${GREEN}Le mot de passe a bien été bien modifié${NC}" && sleep 2s

    else

        # si non -> sortie du script

        echo -e "${RED}L'utilisateur $user_mpd n'existe pas${NC}" && sleep 2s

    fi

}



# Suppression de compte utilisateur local

supprimer_utilisateur() {

    clear

    # Demande quel compte utilisateur à supprimer

    read -p "Quel compte utilisateur souhaitez-vous supprimer ? " user_del

    # Vérification si l'utilisateur existe

    if ssh $nom_distant@$ip_distante cat /etc/passwd | grep $user_del >/dev/null; then

        # Si oui -> demande de confirmation

        echo "Voulez-vous vraiment supprimer le compte $user_del ? (Oui/Non)"

        read confirmation

        #Si oui -> suppresion du compte

        if [ "$confirmation" == "Oui" ]; then

            ssh $nom_distant@$ip_distante sudo -S deluser $user_del

            echo -e "${GREEN}Le compte $user_del a été supprimé${NC}" && sleep 2s

        else

            # Si non -> sortie du script

            echo -e "${RED}Supression annulée${NC}" && sleep 2s

        fi

    else

        # Si le compte n'existe pas

        echo -e " ${RED}Le compte utilisateur $user_del n'existe pas${NC}" && sleep 2s

    fi

}



# Désactivation de compte utilisateur local

désactiver_utilisateur() {

    clear

    # Demande quel compte utilisateur à désactiver

    read -p "Quel compte utilisateur souhaitez-vous désactiver ? " user_lock



    # Vérification si l'utilisateur existe

    if ssh $nom_distant@$ip_distante cat /etc/passwd | grep $user_lock >/dev/null; then

        # Si l'utilisateur existe -> demande de confirmation

        echo "Voulez-vous vraiment désactiver le compte $user_lock? (Oui/Non)"

        read confirmation

        # Si oui -> désactivation du compte

        if [ "$confirmation" == "Oui" ]; then

            ssh $nom_distant@$ip_distante sudo -S usermod -L $user_lock

            # Vérification de la désactivation du compte

            if ssh $nom_distant@$ip_distante sudo -S cat /etc/shadow | grep $user_lock | grep ! >/dev/null; then

                echo -e "${GREEN}L'utilisateur $user_lock a été désactivé${NC}" && sleep 2s

                ssh $nom_distant@$ip_distante sudo -S sudo cat /etc/shadow | grep $user_lock | grep ! && sleep 2s

            else

                echo -e "${RED}L'utilisateur est toujours activé${NC}" && sleep 2s

            fi

        else

            # Si non -> sortie du script

            echo -e "${RED}Désactivation annulée${NC}" && sleep 2s

        fi

    else

        # Si l'utilisateur n'existe pas

        echo -e "${RED}L'utilisateur $user_lock n'existe pas${NC}" && sleep 2s

    fi

}



# Ajout utilisateur à un groupe d'administration

ajouter_groupe_admin() {

    clear

    # Demande quel compte utilisateur à ajouter

    read -p "Quel compte utilisateur souhaitez-vous ajouter au groupe d'administration ? " user_adm



    # Vérification si l'utilisateur existe

    if ssh $nom_distant@$ip_distante cat /etc/passwd | grep $user_adm >/dev/null; then

        # Si l'utilisateur existe -> ajout au compte sudo

        ssh $nom_distant@$ip_distante sudo -S usermod -aG sudo $user_adm

        echo -e "${GREEN}Le compte $user_adm est ajouté au groupe d'administration sudo${NC}" && sleep 2s

    else

        # Si non sortie du script

        echo -e "${RED}Le compte utilisateur $user_adm n'existe pas${NC}" && sleep 2s

    fi

}



# Ajout utilsiateur à un groupe local

ajout_utilisateur_groupe() {

    clear

    # Demande quel compte à ajouter au groupe local

    read -p "Quel compte utilisateur souhaitez-vous ajouter à un groupe local ? " user_addgroup

    # Vérification si l'utilisateur existe

    if ssh $nom_distant@$ip_distante cat /etc/passwd | grep $user_addgroup >/dev/null; then

        # Si l'utilisateur existe -> demande quel groupe?

        read -p "A quel groupe souhaiter-vous ajouter l'utilisateur $user_addgroup?" choix_add_group

        if ssh $nom_distant@$ip_distante cat /etc/group | grep $choix_add_group >/dev/null; then

            ssh $nom_distant@$ip_distante sudo -S usermod -aG $choix_add_group $user_addgroup

            echo -e "${GREEN}Le compte $user_addgroup a été ajouté au groupe $choix_add_group.${NC}" && sleep 2s

            # Affichage des groupes de cet utilisateur (pour vérification)

            echo "Affichage des groupes de l'utilisateur $user_addgroup : "

            ssh $nom_distant@$ip_distante groups $user_addgroup && sleep 2s

        else

            echo -e "${RED}Le groupe n'existe pas${NC}" && sleep 2s

        fi

    else

        # Si non sortie du script

        echo -e "${RED}Le compte utilisateur $user_addgroup n'existe pas.${NC}" && sleep 2s

    fi

}



# Suppression utilisateur d'un groupe local

supprimer_utilisateur_groupe() {

    clear

    # Demande quel compte à supprimer d'un compte local

    read -p "Quel compte utilisateur souhaitez-vous supprimer d'un groupe local ? " user_delgroup



    # Vérification si l'utilisateur existe

    if ssh $nom_distant@$ip_distante cat /etc/passwd | grep $user_delgroup >/dev/null; then

        # Si l'utilisateur existe -> demande quel groupe?

        read -p "De quel groupe souhaitez-vous supprimer l'utilisateur $user_delgroup ? " choix_del_group

        if ssh $nom_distant@$ip_distante cat /etc/group | grep $choix_del_group >/dev/null; then

            ssh $nom_distant@$ip_distante sudo -S deluser $user_delgroup $choix_del_group

            echo -e "${GREEN}L'utilisateur $user_delgroup a été supprimé du groupe $choix_del_group.${NC}" && sleep 2s

            # Affichage des groupes de cet utilisateur (pour vérification)

            echo "Affichage des groupes de l'utilisateur $user_delgroup : "

            ssh $nom_distant@$ip_distante groups $user_delgroup && sleep 2s

        else

            echo -e "${RED}Le groupe n'existe pas${NC}" && sleep 2s

        fi

    else

        # Si non sortie du script

        echo -e "${RED}Le compte utilisateur $user_delgroup n'existe pas${NC}" && sleep 2s

    fi

}



############## FIN FONCTION ######################



####################################################

########### Fonction Action Ordinateur ############

####################################################



############## DEBUT FONCTION ######################



# Fonction "Arrêt"

shutdown() {



    # Demande de confrmation

    clear

    read -p "Confirmez-vous l'arrêt de la machine distante ? [O pour valider] " conf_shutdown

    echo ""

    # Si confirmation OK, affichage du sous-menu de la fonction "Arrêt"

    if [ $conf_shutdown = O ]; then

        while true; do

        clear

        echo "=============================================================="

        echo -e "${BG_YELLOW}                             ARRÊT                            ${NC}"

        echo "=============================================================="

        echo ""

        echo " [1] Arrêt instantané de la machine"

        echo " [2] Arrêt planifié de la machine avec message d'avertissement"

        echo " [3] Arrêt planifié de la machine sans message d'avertissement"

        echo ""

        echo " [X] Revenir au menu précédent"

        echo ""

        # Demande de choix pour le sous-menu de la fonction "Arrêt"

            read -p "Faites votre choix parmi la sélection ci-dessus : " conf_message_s

            echo ""

            case $conf_message_s in

            1)

                echo "Arrêt instantanné en cours"

                sleep 1s

                ssh $nom_distant@$ip_distante sudo -S shutdown

                return

                ;;

            2)

                echo "Arrêt planifié en cours"

                echo ""

                sleep 1s

                read -p "Indiquer l'heure de l'arrêt [hh:mm] " timer_s1

                ssh $nom_distant@$ip_distante notify-send "Extinction_prévue_à_$timer_s1 Pensez_à_sauvegarder_votre_travail"

                echo "Message d'avertissement envoyé"

                echo ""

                sleep 1s

                ssh $nom_distant@$ip_distante sudo -S shutdown $timer_s1

                echo "Arrêt planifié pour $timer_s1"

                sleep 3s

                return

                ;;

            3)

                echo "Arrêt planifié en cours"

                echo ""

                sleep 1s

                read -p "Indiquer l'heure de l'arrêt [hh:mm] " timer_s2

                ssh $nom_distant@$ip_distante sudo -S shutdown $timer_s2

                sleep 3s

                return

                ;;

            X)

                echo "Retour au menu précédent"

                sleep 1s

                echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Retour au menu pprécédent choisi" >>/var/log/log_evt.log

                return

                ;;

            *)

                echo "Choix incorrect - Veuillez recommencer"

                echo ""

                read -p "Appuyez sur Entrée pour continuer ..."

                sleep 1s

                echo $(date +%Y%m%d-%H%M%S)"-$Operateur-erreur de commande" >>/var/log/log_evt.log

                ;;



            esac

        done

        # Si confirmation NOK, sortie de la fonction "Arrêt"

    else

        echo "Opération annulée - Retour au menu précédent"

        sleep 2s

        return

    fi

}



# Fonction "Redémarrage"

reboot() {

    clear

    # Demande de confrmation

    read -p "Confirmez-vous l'arrêt de la machine distante ? [O pour valider] " conf_reboot

    # Si confirmation OK, affichage du sous-menu de la fonction "Redémarrage"

    if [ $conf_reboot = O ]; then

        while true; do

        clear

        echo ""

        echo "===================================================================="

        echo -e "${BG_YELLOW}                            REDEMARRAGE                             ${NC}"

        echo "===================================================================="

        echo " [1] Redémarrage instantané de la machine"

        echo " [2] Redémarrage planifié de la machine avec message d'avertissement"

        echo " [3] Redémarrage planifié de la machine sans message d'avertissement"

        echo ""

        echo " [X] Revenir au menu précédent"

        echo ""

        # Demande de choix pour le sous-menu de la fonction "Redémarrage"

            read -p "Faites votre choix parmi la sélection ci-dessus : " conf_message_r

            echo ""

            case $conf_message_r in

            1)

                echo -e "${GREEN}Redémarrage instantanné en cours${NC}"

                sleep 1s

                ssh $nom_distant@$ip_distante sudo -S shutdown -r now

                return

                ;;

            2)

                echo -e "${GREEN}Redémarrage planifié en cours${NC}"

                sleep 1s

                echo ""

                read -p "Indiquer l'heure du redémarrage [hh:mm] " timer_r1

                sleep 1s

                ssh $nom_distant@$ip_distante notify-send "Redémarrage_prévu_pour_$timer_r1 Pensez_à_sauvegarder_votre_travail"

                echo "Message d'avertissement envoyé"

                sleep 1s

                ssh $nom_distant@$ip_distante sudo -S shutdown -r $timer_r1

                sleep 3s

                return

                ;;

            3)

                echo -e "${GREEN}Redémarrage planifié en cours${NC}"

                sleep 1s

                echo ""

                read -p "Indiquer l'heure de l'arrêt [hh:mm] " timer_r2

                ssh $nom_distant@$ip_distante sudo -S shutdown -r $timer_r2

                sleep 3s

                return

                ;;

            X)

                echo ""

                echo "Retour au menu principal" && sleep 2s

                echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Retour au menu principal choisi" >>/var/log/log_evt.log

                Menu_Principal

                ;;

            *)

                echo ""

                echo "Choix incorrect - Veuillez recommencer"

                echo ""

                read -p "Appuyez sur Entrée pour continuer ..." && sleep 2s

                echo $(date +%Y%m%d-%H%M%S)"-$Operateur-erreur de commande" >>/var/log/log_evt.log

                ;;

            esac

        done

        # Si confirmation NOK, sortie de la fonction "Redémarrage"

    else

        echo "Opération annulée - Retour au menu précédent"

        sleep 1s

        return

    fi

}



# Fonction "Vérouillage"

lock() {

    clear

    # Demande de confrmation

    read -p "Confirmez-vous le vérouillage de la session de la machine distante ? [O pour valider] " conf_lock

    echo ""

    # Si confirmation OK, exécution de la commande "Vérouillage"

    if [ $conf_lock = O ]; then

        ssh $nom_distant@$ip_distante sudo -S skill -KILL -u $nom_distant

        echo -e "${GREEN}La session de la machine distante a été vérouillée${NC}"

        sleep 2s

        return

        # Si confirmation NOK, sortie de la fonction "Vérouillage"

    else

        echo -e "${RED}Opération annulée - Retour au menu précédent${NC}"

        sleep 1s

        return

    fi

}



# Fonction MàJ

update() {

    clear

    # Demande de confrmation

    read -p "Confirmez-vous la mise-à-jour du système de la machine distante ? [O pour valider] " conf_update

    echo ""

    # Si confirmation OK, exécution de la commande "MàJ"

    if [ $conf_update = O ]; then

        ssh $nom_distant@$ip_distante sudo -S apt update && sudo -S apt upgrade -y

        echo -e "${GREEN}La mise-à-jour du système de la machine distante a été effectuée${NC}"

        sleep 2s

        return

        # Si confirmation NOK, sortie de la fonction "MàJ"

    else

        echo -e "${RED}Opération annulée - Retour au menu précédent${NC}"

        sleep 1s

        return

    fi

}



# Fonction "Création Dossier"

create_directory() {

    clear

    # Demande de confrmation

    read -p "Confirmez-vous la création d'un dossier ? [O pour valider] " conf_create_directory

    echo ""

    # Si confirmation OK, exécution de la commande "Création Dossier"

    if [ $conf_create_directory = O ]; then

        # Demande du nom du dossier à créer

        read -p "Quel est le nom du dossier à créer ? " name_directory

        echo ""

        # Si aucun nom rentré, sortie de la fonction "Création Dossier"

        if [ -z $name_directory ]; then

            echo -e "${RED}Vous n'avez pas indiqué de nom de dossier, retour au menu précédent${NC}"

            sleep 1s

            return

        fi

        # Demande du chemin de destination du dossier à créer

        read -p "Quel est le chemin de destination de votre dossier (Si pas de chemin indiqué, chemin courant utilisé) : " path_directory

        echo ""

        if ssh $nom_distant@$ip_distante [ -z "$path_directory" ]; then

            # Si le dossier existe à l'emplacement actuel, sortie de la fonction "Création Dossier"

            if ssh $nom_distant@$ip_distante "[ -d \"$name_directory\" ]"; then

                echo -e "${RED}Le dossier existe déja${NC}"

                echo "Retour au menu précédent"

                sleep 1s

                return

                # Si le dossier n'existe pas, et que le chemin n'est pas spécifié, création du dossier à l'emplacement actuel

            else

                echo "Le dossier n'existe pas."

                ssh $nom_distant@$ip_distante mkdir "$name_directory"

                echo -e "${GREEN}Le dossier $name_directory sera créé à l'emplacement actuel${NC}"

                sleep 2s

            fi

        else

            # Si le dossier existe dans l'emplacement spécifié, sortie de la fonction "Création Dossier"

            if ssh $nom_distant@$ip_distante "[ -d \"$path_directory/$name_directory\" ]"; then

                echo "Le dossier existe déjà"

                echo ""

                echo -e "${RED}Retour au menu précédent${NC}"

                sleep 1s

                return

                # Si le dossier n'existe pas, et que le chemin est spécifié, création du dossier à cet emplacement

            else

                echo "Le dossier n'existe pas"

                echo ""

                ssh $nom_distant@$ip_distante mkdir -p "$path_directory/$name_directory"

                echo -e "${GREEN}Le dossier $name_directory a été créé à l'emplacement $path_directory.${NC}"

                sleep 2s

            fi

        fi

        # Si confirmation NOK, sortie de la fonction "Création Dossier"

    else

        echo -e "${RED}Opération annulée - Retour au menu précédent${NC}"

        sleep 1s

        return

    fi

}



# Fonction "Suppression Dossier"

remove_directory() {

    clear

    # Demande de confrmation

    read -p "Confirmez-vous la suppression d'un dossier ? [O pour valider] " conf_remove_directory

    echo ""

    # Si confirmation OK, exécution de la commande "Suppression Dossier"

    if [ $conf_remove_directory = O ]; then

        # Demande du nom du dossier à supprimer

        read -p "Quel est le nom du dossier à supprimer ? " name_directory_2

        echo ""

        # Si aucun nom rentré, sortie de la fonction "Suppression Dossier"

        if [ -z "$name_directory_2" ]; then

            echo -e "${RED}Vous n'avez pas indiqué de nom de dossier, retour au menu précédent${NC}"

            return

        fi

        # Demande du chemin de destination du dossier à supprimer

        read -p "Quel est le chemin de votre dossier : " path_directory_2

        echo ""

        # Si le dossier existe à l'emplacement spécifié, demande de confirmation de la suppression du dossier

        if ssh $nom_distant@$ip_distante [ -d "$path_directory_2/$name_directory_2" ]; then

            read -p "Le dossier suivant $path_directory_2/$name_directory_2 sera supprimé, confirmez-vous ? [O pour valider] " conf_remove_directory_2

            echo ""

            # Si confirmation OK, éxécution de la commande de suppression de dossier

            if [ $conf_remove_directory_2 = O ]; then

                ssh $nom_distant@$ip_distante sudo -S rm -r "$path_directory_2/$name_directory_2"

                echo -e "${GREEN}Le dossier suivant $path_directory_2/$name_directory_2 a été supprimé${NC}"

                sleep 2s

                return

                # Si confirmation NOK, sortie de la fonction "Suppression Dossier"

            else

                echo -e "${RED}Opération annulée - Retour au menu précédent${NC}"

                sleep 1s

                return

            fi

            # Si le dossier n'existe pas à l'emplacement spécifié, sortie de la fonction "Suppression Dossier"

        else

            echo -e "${RED}Le dossier $path_directory_2/$name_directory_2 n'existe pas - Retour au menu précédent${NC}"

            sleep 2s



            return

        fi

    fi

}

# Fonction "Prise de main à distance"

remote_control() {

    clear

    # Demande de confirmation + Avertissement concernant la sortie du script dès l'éxécution de cette fonction

    echo -e "${RED}ATTENTION : Cette commande vous sortira momentanément du script${NC}"

    echo ""

    read -p "Confirmez-vous ? [O pour valider] : " conf_remote

    echo ""

    # Si confirmation OK, exécution de la commande "Prise de main à distance" + Sortie du script

    if [ $conf_remote = O ]; then

        echo -e "Accès à la commande de la machine distante : "

        echo ""

        sleep 2s

        ssh $nom_distant@$ip_distante

        # Si confirmation NOK, sortie de la fonction "Prise de main à distance"

    else

        echo -e "${RED}Opération annulée - Retour au menu précédent${NC}"

        sleep 1s

        return

    fi

}



# Fonction "Activation du pare-feu"

firewall_on() {

    clear

    # Demande de confirmation + Avertissement

    echo -e "${RED}ATTENTION : Cette commande peut impacter l'éxécution du script${NC}"

    echo ""

    read -p "Confirmez-vous l'activation du pare-feu sur la machine distante ? [O pour valider ] : " conf_fw_on

    echo ""

    # Si confirmation OK, éxécution de la commande "Activation du pare-feu"

    if [ $conf_fw_on = O ]; then

        ssh $nom_distant@$ip_distante sudo -S ufw enable

        ssh $nom_distant@$ip_distante sudo -S ufw status | cat

        echo -e "${GREEN}Le pare-feu de la machine distante a été activé${NC}"

        sleep 2s

        return

        # Si confirmation NOK, sortie de la fonction "Activation du pare-feu"

    else

        echo -e "${RED}Opération annulée - Retour au menu précédent${NC}"

        sleep 1s

        return

    fi

}



# Fonction "Désactivation du pare-feu"

firewall_off() {

    clear

    # Demande de confirmation + Avertissement

    echo -e "${RED}ATTENTION : Cette commande peut impacter la vulnérabilité de la machine distante${NC}"

    echo ""

    read -p "Confirmez-vous la désactivation du pare-feu sur la machine distante ? [O pour valider ] : " conf_fw_off

    echo ""

    # Si confirmation OK, éxécution de la commande "Désactivation du pare-feu

    if [ $conf_fw_off = O ]; then

        ssh $nom_distant@$ip_distante sudo -S ufw disable

        ssh $nom_distant@$ip_distante sudo -S ufw status | cat

        echo -e "${GREEN}Le pare-feu de la machine distante a été désactivé${NC}"

        sleep 2s

        return

        # Si confirmation NOK, sortie de la fonction "Désactivation du pare-feu"

    else

        echo -e "${RED}Opération annulée - Retour au menu précédent${NC}"

        sleep 1s

        return

    fi

}



# Fonction "Règles du pare-feu"

firewall_rules() {

    clear

    # Demande de confirmation + Avertissement concernant la sortie du script dès l'éxécution de cette fonction

    echo -e "${RED}ATTENTION : Les commandes suivantes sont reservées à un public averti${NC}"

    echo ""

    read -p "Confirmez-vous l'accès à la modification des régles du pare-feu ? [O Pour valider] : " conf_fw_rules

    echo ""

    # Si confirmation OK, affichage du sous-menu de la fonction "Règles du pare-feu

    if [ $conf_fw_rules = O ]; then

        while true; do

        clear

        echo "======================================================"

        echo -e "${BG_YELLOW}                       PARE-FEU                       ${NC}"

        echo "======================================================"

        echo " [1] Affichage de l'état actuel des règles du pare-feu"

        echo " [2] Ouverture d'un port (UDP et TCP)"

        echo " [3] Fermeture d'un port (UDP et TCP)"

        echo " [4] Activer la journalisation"

        echo " [5] Désactiver la journalisation"

        echo " [6] Réinitialiser le pare-feu"

        echo ""

        echo " [X] Revenir au menu précédent"

        echo ""

            read -p "Faites votre choix parmi la sélection ci-dessus : " conf_message_fw

            echo ""

            case $conf_message_fw in

            # Affichage de l'état actuel du pare-feu

            1)

                echo -e "Affichage de l'état actuel des règles du pare-feu"

                ssh $nom_distant@$ip_distante sudo -S ufw status verbose

                sleep 2s

                ;;

                # Exécution de la commande d'ouverture de port

            2)

                echo -e "${GREEN}Ouverture d'un port${NC}"

                sleep 2s

                read -p "Indiquer le n° du port à ouvrir : " port_1

                echo "Ouverture du port $port_1"

                sleep 2s

                ssh $nom_distant@$ip_distante sudo -S ufw allow $port_1

                echo "$port_1 ouvert"

                sleep 2s

                ;;

                # Exécution de la commande de fermeture de port

            3)

                echo -e "${GREEN}Fermeture d'un port${NC}"

                sleep 2s

                read -p "Indiquer le n° du port à fermer : " port_2

                echo "Fermeture du port $port_2"

                sleep 2s

                ssh $nom_distant@$ip_distante sudo -S ufw allow $port_2

                echo "$port_2 fermé"

                sleep 2s

                ;;

                # Exécution de la commande d'activation de la journalisation

            4)

                echo -e "${GREEN}Activation de la journalisation${NC}"

                sleep 2s

                ssh $nom_distant@$ip_distante sudo -S ufw logging on

                sleep 2s

                ;;

                # Exécution de la commande de désactivation de la journalisation

            5)

                echo -e "${GREEN}Désactivation de la journalisation${NC}"

                sleep 2s

                ssh $nom_distant@$ip_distante sudo -S ufw logging off

                sleep 2s

                ;;

                # Exécution de la commande de réinitialisation du pare-feu + Avertissement

            6)

                echo -e "${GREEN}Réinitialisation du pare-feu${NC}"

                echo "ATTENTION, cette commande peut compromettre la connexion à distance"

                read -p "Souhaitez-vous tout de même continuer ? [O pour valider] : " conf_reset_fw

                # Si confirlation OK, exécution de la commande de réinitialisation du pare-feu

                if [ $conf_reset_fw = O ]; then

                    sleep 1s

                    $nom_distant@$ip_distante sudo -S ufw reset

                    echo "Le pare-feu a été réinitialisé"

                    sleep 2s

                    return

                    # Si confirmation NOK, sortie de la fonction "Règles du pare-feu"

                else

                    echo -e "${RED}Opération annulée - Retour au menu précédent${NC}"

                    sleep 1s

                fi

                ;;

            X)

                echo ""

                echo "Retour au menu principal" && sleep 2s

                echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Retour au menu principal choisi" >>/var/log/log_evt.log

                Menu_Principal

                ;;

            *)

                echo ""

                echo "Choix incorrect - Veuillez recommencer"

                echo ""

                read -p "Appuyez sur Entrée pour continuer ..." && sleep 2s

                echo $(date +%Y%m%d-%H%M%S)"-$Operateur-erreur de commande" >>/var/log/log_evt.log

                ;;

            esac

        done

    fi

}

# Fonction "Installation Application"

install_app() {

    clear

    # Demande de confirmation

    read -p "Confirmez-vous l'accès à l'installation de logiciels ? [O Pour valider] : " conf_install

    echo ""

    # Si confirmation OK, affichage du sous-menu de la fonction "Installation Application"

    if [ $conf_install = O ]; then

        while true; do

        clear

        echo " [1] Installation via APT"

        echo " [2] Installation via SNAP"

        echo ""

        echo " [X] Revenir au menu précédent"

        echo ""

            read -p "Faites votre choix parmi la sélection ci-dessus : " conf_message_install

            echo ""

            case $conf_message_install in

            # Exécution de la commande "Installation via APT"

            1)

                read -p "Quel logiciel souhaitez-vous installer via APT : " apt_install

                echo ""

                echo "Vous avez choisi d'installer le logiciel $apt_install"

                echo ""

                sleep 1s

                ssh $nom_distant@$ip_distante sudo -S apt install $apt_install

                sleep 1s

                echo -e "${GREEN}Le logiciel $apt_install a été installé${NC}"

                sleep 2s

                return

                ;;

                # Exécution de la commande "Installation via SNAP"

            2)

                read -p "Quel logiciel souhaitez-vous installer via SNAP : " snap_install

                echo ""

                echo "Vous avez choisi d'installer le logiciel $snap_install"

                echo ""

                sleep 1s

                ssh $nom_distant@$ip_distante sudo -S snap install $snap_install

                sleep 1s

                echo -e "${GREEN}Le logiciel $snap_install a été installé${NC}"

                sleep 2s

                return

                ;;

                # Si autre/mauvais choix, sortie de la fonction "Installation Application"

            X)

                echo ""

                echo "Retour au menu principal" && sleep 2s

                echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Retour au menu principal choisi" >>/var/log/log_evt.log

                Menu_Principal

                ;;

            *)

                echo ""

                echo "Choix incorrect - Veuillez recommencer"

                echo ""

                read -p "Appuyez sur Entrée pour continuer ..." && sleep 2s

                echo $(date +%Y%m%d-%H%M%S)"-$Operateur-erreur de commande" >>/var/log/log_evt.log

                ;;

            esac

        done

    fi

}

# Fonction "Désinstallation Application"

uninstall_app() {

    clear

    # Demande de confirmation

    read -p "Confirmez-vous l'accès à la désinstallation de logiciels ? [O Pour valider] : " conf_uninstall

    echo ""

    # Si confirmation OK, affichage du sous-menu de la fonction "Installation Application"

    if [ $conf_uninstall = O ]; then

        while true; do

        clear

        echo " [1] Désinstallation via APT"

        echo " [2] Désinstallation via SNAP"

        echo ""

        echo " [X] Revenir au menu précédent"

        echo ""

            read -p "Faites votre choix parmi la sélection ci-dessus : " conf_message_uninstall

            echo ""

            case $conf_message_uninstall in

            # Exécution de la commande "Installation via APT"

            1)

                read -p "Quel logiciel souhaitez-vous désinstaller via APT : " apt_uninstall

                echo ""

                echo "Vous avez choisi de désinstaller le logiciel $apt_uninstall"

                echo ""

                sleep 1s

                ssh $nom_distant@$ip_distante sudo -S apt remove $apt_uninstall

                sleep 1s

                echo -e "${GREEN}Le logiciel $apt_uninstall a été désinstallé${NC}"

                sleep 2s

                return

                ;;

                # Exécution de la commande "Installation via SNAP"

            2)

                read -p "Quel logiciel souhaitez-vous désinstaller via SNAP : " snap_uninstall

                echo ""

                echo "Vous avez choisi de désinstaller le logiciel $snap_uninstall"

                echo ""

                sleep 1s

                ssh $nom_distant@$ip_distante sudo -S snap install $snap_uninstall

                sleep 1s

                echo -e "${GREEN}Le logiciel $snap_uninstall a été désinstallé${NC}"

                sleep 2s

                return

                ;;

                # Si autre/mauvais choix, sortie de la fonction "Désinstallation Application"

            X)

                echo ""

                echo "Retour au menu principal" && sleep 2s

                echo $(date +%Y%m%d-%H%M%S)"-$Operateur-Retour au menu principal choisi" >>/var/log/log_evt.log

                Menu_Principal

                ;;

            *)

                echo ""

                echo "Choix incorrect - Veuillez recommencer"

                echo ""

                read -p "Appuyez sur Entrée pour continuer ..." && sleep 2s

                echo $(date +%Y%m%d-%H%M%S)"-$Operateur-erreur de commande" >>/var/log/log_evt.log

                ;;

            esac

        done

    fi

}

# Fonction "Script à distance"

remote_script() {

    clear

    # Demande de confirmation

    read -p "Confirmez-vous l'éxécution d'un script sur la machine distante ? [O pour valider ] : " conf_script

    echo ""

    # Si confirmation OK, éxécution de la commande "Script à distance""

    if [ $conf_script = O ]; then

        # Demande du nom et du chemin du script à éxécuter

        read -p "Quel est le nom du script ? : " name_script

        echo ""

        read -p "Quel est le chemin du script ? : " path_script

        echo ""

        # Vérification de l'existence du script à l'emplacement spécifié

        if ssh $nom_distant@$ip_distante test -e "$path_script/$name_script"; then

            # Si le script existe, il va être exécuté

            echo "Le script $name_script existe."

            echo ""

            echo -e "${GREEN}Le script $name_script va être éxécuté${NC}"

            echo ""

            sleep 1s

            # Changement des permissions du script pour le rendre exécutable

            ssh $nom_distant@$ip_distante chmod +x "$path_script/$name_script"

            # Ajout des arguments du script si besoin

            read -p "Si besoin, indiquez les arguments du script : " arg_script

            echo ""

            ssh $nom_distant@$ip_distante "$path_script/$name_script" $arg_script

            read -p "Appuyez sur Entrée pour continuer ..."

            sleep 1s

        else

            # Si le script n'existe pas, sortie de la fonction "Script à distance"

            echo "Le script $name_script n'existe pas dans le répertoire spécifié."

            echo ""

            echo -e "${RED}Opération annulée - Retour au menu précédent.${NC}"

            sleep 2s

            return

        fi

        # Si confirmation NOK, sortie de la fonction "Script à distance"

    else

        echo -e "${RED}Opération annulée - Retour au menu précédent${NC}"

        sleep 1s

        return

    fi



}



############## FIN FONCTION ######################



####################################################

######## Fonction Information Utilisateur ###########

####################################################



############## DEBUT FONCTION ######################



# Fonctions Informations utilisateur

info_connexion() {

    clear

    # Demande quel utilisateur

    echo ""

    echo "Date de dernière connexion"

    echo ""

    read -p "Indiquez le nom de l'utilisateur souhaité : " user_inf



    # Est-ce que le nom existe sur le systeme ?

    if ssh $nom_distant@$ip_distante cat /etc/passwd | grep $user_inf >/dev/null; then

        # si oui -> affichage dernière connexion

        ssh $nom_distant@$ip_distante last $user_inf | head -n 1 && sleep 2s

        echo $nom_distant@$ip_distante "Dernière connexion : " >>"$path_info_file""Info_""$user_inf""_$(date +%Y-%m-%d).txt"

        ssh $nom_distant@$ip_distante last $user_inf | head -n 1 >>"$path_info_file""Info_""$user_inf""_$(date +%Y-%m-%d).txt"

        echo ""

        echo -e "Les données sont enregistrées dans le fichier" "${GREEN}$path_info_file""Info_""$user_inf""_$(date +%Y-%m-%d).txt${NC}" && sleep 3s

    else

        # si non -> sortie du script

        echo -e "${RED}L'utilisateur $user_mpd n'existe pas${NC}" && sleep 2s

    fi

}



# Fonctions Informations dernière modification de mot de passe

info_modification() {

    clear

    # Demande quel utilisateur

    echo ""

    echo "Date de dernière modification du mot de passe"

    echo ""

    read -p "Indiquez le nom de l'utilisateur souhaité : " user_inf



    # Est-ce que le nom existe sur le systeme ?

    if ssh $nom_distant@$ip_distante cat /etc/passwd | grep $user_inf >/dev/null; then

        # si oui -> affichage dernière modification

        ssh $nom_distant@$ip_distante sudo -S chage -l $user_inf | head -n 1 && sleep 2s

        echo "Dernière modification du mot de passe : " >>"$path_info_file""Info_""$user_inf""_$(date +%Y-%m-%d).txt"

        ssh $nom_distant@$ip_distante sudo -S chage -l $user_inf | head -n 1 >>"$path_info_file""Info_""$user_inf""_$(date +%Y-%m-%d).txt"

        echo ""

        echo -e "Les données sont enregistrées dans le fichier" "${GREEN}$path_info_file""Info_""$user_inf""_$(date +%Y-%m-%d).txt${NC}" && sleep 3s

    else

        # si non -> sortie du script

        echo -e "${RED}L'utilisateur $user_mpd n'existe pas${NC}" && sleep 2s

    fi



}



liste_sessions() {

    clear

    # Demande quel utilisateur

    echo ""

    echo "Liste des sessions ouvertes pour l'utilisateur"

    echo ""

    read -p "Indiquez le nom de l'utilisateur souhaité : " user_inf



    # Est-ce que le nom existe sur le systeme ?

    if ssh $nom_distant@$ip_distante cat /etc/passwd | grep $user_inf >/dev/null; then

        # si oui -> affichage des sessions

        ssh $nom_distant@$ip_distante last $user_inf && sleep 2s

        echo "Liste des sessions : " >>"$path_info_file""Info_""$user_inf""_$(date +%Y-%m-%d).txt"

        ssh $nom_distant@$ip_distante last $user_inf >>"$path_info_file""Info_""$user_inf""_$(date +%Y-%m-%d).txt"

        echo ""

        echo -e "Les données sont enregistrées dans le fichier" "${GREEN}$path_info_file""Info_""$user_inf""_$(date +%Y-%m-%d).txt${NC}" && sleep 3s



    else

        # si non -> sortie du script

        echo -e "${RED}L'utilisateur $user_inf n'existe pas${NC}" && sleep 2s

    fi



}



droits_dossier() {

    clear

    # Demande quel utilisateur

    echo ""

    echo "Visualisation des droits/permissions sur un dossier"

    echo ""

    read -p "Indiquez le nom de l'utilisateur souhaité : " user_inf

    echo ""



    # Est-ce que le nom existe sur le systeme ?

    if ssh $nom_distant@$ip_distante cat /etc/passwd | grep $user_inf >/dev/null; then

        # si oui -> demande quel dossier à verifier

        read -p "Sur quel dossier souhaitez-vous vérifier les droits/permissions (Spécifier le chemin) ? " dossier_a

        if ssh $nom_distant@$ip_distante [ -d $dossier_a ]; then

            # affichage des droits

            ssh $nom_distant@$ip_distante ls -ld $dossier_a/ && sleep 2s

            echo "Droits/permissions sur le dossier $dossier_a/ : " >>"$path_info_file""Info_""$user_inf""_$(date +%Y-%m-%d).txt"

            ssh $nom_distant@$ip_distante ls -ld $dossier_a/ >>"$path_info_file""Info_""$user_inf""_$(date +%Y-%m-%d).txt"

            echo ""

            echo -e "Les données sont enregistrées dans le fichier" "${GREEN}$path_info_file""Info_""$user_inf""_$(date +%Y-%m-%d).txt${NC}" && sleep 3s

        else

            # si non -> sortie du script

            echo -e "${RED}Le dossier $dossier_a n'existe pas${NC}" && sleep 2s

        fi

    else

        # si non -> sortie du script

        echo -e "${RED}L'utilisateur $user_inf n'existe pas${NC}" && sleep 2s

    fi

}



droits_fichier() {

    clear

    # Demande quel utilisateur

    echo ""

    echo "Visualisation des droits/permissions sur un fichier"

    echo ""

    read -p "Indiquez le nom de l'utilisateur souhaité : " user_inf

    echo ""



    # Est-ce que le nom existe sur le systeme ?

    if ssh $nom_distant@$ip_distante cat /etc/passwd | grep $user_inf >/dev/null; then

        # si oui -> demande quel dossier à verifier

        read -p "Sur quel fichier souhaitez-vous vérifier les droits/permissions (Spécifier le chemin) ? " fichier_a

        echo ""

        if ssh $nom_distant@$ip_distante [ -f $fichier_a ]; then

            # affichage des droits

            ssh $nom_distant@$ip_distante ls -l $fichier_a && sleep 2s

            echo "Droits/permissions sur le fichier $fichier_a/ : " >>"$path_info_file""Info_""$user_inf""_$(date +%Y-%m-%d).txt"

            ssh $nom_distant@$ip_distante ls -l $fichier_a >>"$path_info_file""Info_""$user_inf""_$(date +%Y-%m-%d).txt"

            echo ""

            echo -e "Les données sont enregistrées dans le fichier" "${GREEN}$path_info_file""Info_""$user_inf""_$(date +%Y-%m-%d).txt${NC}" && sleep 3s

        else

            # si non -> sortie du script

            echo -e "${RED}Le fichier $fichier_a n'existe pas${NC}" && sleep 2s

        fi

    else

        # si non -> sortie du script

        echo -e "${RED}L'utilisateur $user_inf n'existe pas${NC}" && sleep 2s

    fi



}



############## FIN FONCTION ######################



####################################################

######## Fonction Information Ordinateur ############

####################################################



############## DEBUT FONCTION ######################



# Fonction pour avoir la version de l'OS

GetOs() {

    clear

    read -p "Voulez-vous voir la version de l'OS [O pour valider] ? " ConfOS

    echo ""

    if [ "$ConfOS" = "O" ]; then

        clear

        ssh $nom_distant@$ip_distante lsb_release -a

        ssh $nom_distant@$ip_distante lsb_release -a >>"$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt"

        echo ""

        echo -e "Les données sont enregistrées dans le fichier" "${GREEN}$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt${NC}" && sleep 5s

        return

    else

        clear

        echo -e "${RED}Mauvais choix - Retour au menu précédent${NC}"

        sleep 2s

        return

    fi

}



# Fonction pour avoir le nombre d'interfaces

NbrCarte() {

    clear

    read -p "Voulez-vous voir le nombre d'interfaces présentes sur cette machine [O pour valider] ? " NbrI

    echo ""

    if [ "$NbrI" = "O" ]; then

        clear

        echo "Voici la liste des interfaces présentes sur cette machine : "

        echo ""

        ssh $nom_distant@$ip_distante ifconfig -a | grep UP | cut -d : -f1

        echo "Liste des cartes" >>"$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt"

        ssh $nom_distant@$ip_distante ifconfig -a | grep UP | cut -d : -f1 >>"$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt"

        echo ""

        echo -e "Les données sont enregistrées dans le fichier" "${GREEN}$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt${NC}" && sleep 5s

    fi

}



#Fonction demande adresse IP

IPdemande() {

    clear

    read -p "Quelle carte choisissez-vous ? " CartIp

    echo ""

    ssh $nom_distant@$ip_distante echo "$CartIp" 

    ssh $nom_distant@$ip_distante  ifconfig "$CartIp" | awk ' /inet /{print $2, $3 ,$4, $5, $6}'

    echo "L'adresse ip de la carte "$CartIp" est : " >>"$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt"

    ssh $nom_distant@$ip_distante ifconfig "$CartIp" | awk ' /inet /{print $2, $3 ,$4, $5, $6}' >>"$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt"

    echo ""

    echo -e "Les données sont enregistrées dans le fichier" "${GREEN}$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt${NC}" && sleep 5s

}



#Fonction demande adresse Mac

MACdemande() {

    clear

    read -p "Quelle carte choisissez-vous ? " CartMac

    echo ""

    ssh $nom_distant@$ip_distante echo "$CartMac" 

    ssh $nom_distant@$ip_distante ifconfig "$CartMac" | awk ' /ether /{print $2}'

    echo "L'adresse mac de la carte "$CartMac" est: " >>"$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt"

    ssh $nom_distant@$ip_distante ifconfig "$CartMac" | awk ' /ether /{print $2}' >>"$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt"

    echo ""

    echo -e "Les données sont enregistrées dans le fichier" "${GREEN}$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt${NC}" && sleep 5s

}



# Fonction qu'est-ce qui est installé?

Application() {

    clear

    read -p "Voulez-vous la liste des applications et paquets installés [O pour valider] ? " app

    if [ "$app" = "O" ]; then

        clear

        echo "Voici la liste des applications et paquets présents sur cette machine : "

        echo ""

        ssh $nom_distant@$ip_distante ls /usr/share/applications | awk -F '.desktop' ' { print $1}'

        echo "Liste des applications : " >>"$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt"

        ssh $nom_distant@$ip_distante ls /usr/share/applications | awk -F '.desktop' ' { print $1}' >>"$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt"

        echo ""

        echo -e "Les données sont enregistrées dans le fichier" "${GREEN}$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt${NC}" && sleep 5s

        return

    else

        clear

        echo -e "${RED}Mauvais choix - Retour au menu précédent${NC}"

        sleep 2s

        return

    fi

}



# Fonction liste des utilisateurs locaux

Userlist() {

    clear

    read -p "Voulez-vous voir la liste des utilisateurs locaux [O pour valider] ? " ListU

    if [ "$ListU" = "O" ]; then

        clear

        echo "Voici la liste des utilisateurs locaux : "

        echo ""

        ssh $nom_distant@$ip_distante cut -d: -f1 /etc/passwd

        echo "Liste des utilisateurs : " >>"$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt"

        ssh $nom_distant@$ip_distante cut -d: -f1 /etc/passwd >>"$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt"

        echo ""

        echo -e "Les données sont enregistrées dans le fichier" "${GREEN}$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt${NC}" && sleep 5s

        return

    else

        clear

        echo -e "${RED}Mauvais choix - Retour au menu précédent${NC}"

        sleep 2s

        return

    fi

}



# Fonction Type de CPU, nombre de cœurs, etc.

GetCpu() {

    clear

    read -p "Voulez-vous voir les détails du CPU [O pour valider] ? " Gcpu

    if [ "$Gcpu" = "O" ]; then

        clear

        echo "Voici les détails du CPU de la machine : "

        echo ""

        ssh $nom_distant@$ip_distante lscpu | head -n15

        echo "Détail du CPU : " >>"$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt"

        ssh $nom_distant@$ip_distante lscpu | head -n15 >>"$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt"

        echo ""

        echo -e "Les données sont enregistrées dans le fichier" "${GREEN}$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt${NC}" && sleep 5s

        return

    else

        clear

        echo -e "${RED}Mauvais choix - Retour au menu précédent${NC}"

        sleep 2s

        return

    fi

}



# Fonction mémoire RAM et utilisation

RamInfo() {

    clear

    read -p "Voulez-vous voir les détails de la RAM [O pour valider] ? " RamInf

    if [ "$RamInf" = "O" ]; then

        clear

        echo "Voici les détails de la RAM sur cette machine : "

        ssh $nom_distant@$ip_distante free -m | head -n2

        echo "Détail de la RAM : " >>"$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt"

        ssh $nom_distant@$ip_distante free -m | head -n2 >>"$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt"

        echo ""

        echo -e "Les données sont enregistrées dans le fichier" "${GREEN}$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt${NC}" && sleep 5s

        return

    else

        clear

        echo -e "${RED}Mauvais choix - Retour au menu précédent${NC}"

        sleep 2s

        return

    fi

}



# Fonction Utilisation du disque

DiskInfo() {

    clear

    read -p "Voulez-vous voir les détails du/des disque(s) [O pour valider] ? " DiskInf

    if [ "$DiskInf" = "O" ]; then

        clear

        echo "Voici les détails du/des disque(s) de cette machine : "

        ssh $nom_distant@$ip_distante df -h

        echo "Détail du/des disque(s) : " >>"$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt"

        ssh $nom_distant@$ip_distante df -h >>"$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt"

        echo ""

        echo -e "Les données sont enregistrées dans le fichier" "${GREEN}$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt${NC}" && sleep 5s

        return

    else

        clear

        echo -e "${RED}Mauvais choix - Retour au menu précédent${NC}"

        sleep 2s

        return

    fi

}



# Fonction Utilisation du processeur

ProcesseurInfo() {

    clear

    read -p "Voulez-vous voir les détails du processeur [O pour valider] ? " ProcesseurInf

    if [ "$ProcesseurInf" = "O" ]; then

        clear

        echo "Voici les détails du processeur de cette machine : "

        ssh $nom_distant@$ip_distante mpstat

        echo "Les détails du processeur : " >>"$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt"

        ssh $nom_distant@$ip_distante mpstat >>"$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt"

        echo ""

        echo -e "Les données sont enregistrées dans le fichier" "${GREEN}$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt${NC}" && sleep 5s

        return

    else

        clear

        echo -e "${RED}Mauvais choix - Retour au menu précédent${NC}"

        sleep 2s

        return

    fi

}



# Fonction Statut du pare-feu et liste des ports ouverts

StatusPare_feu() {

    clear

    read -p "Voulez-vous voir les informations liées au pare-feu [O pour valider] ? " FireW

    if [ "$FireW" = "O" ]; then

        clear

        echo "Voici les détails du pare-feu de cette machine : "

        ssh $nom_distant@$ip_distante sudo -S ufw status

        ssh $nom_distant@$ip_distante sudo -S ufw status >>"$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt"

        echo ""

        echo -e "Les données sont enregistrées dans le fichier" "${GREEN}$path_info_file""Info_""$ip_distante""_$(date +%Y-%m-%d).txt${NC}" && sleep 5s

        return

    else

        clear

        echo -e "${RED}Mauvais choix - Retour au menu précédent${NC}"

        sleep 2s

        return

    fi

}



############## FIN FONCTION ######################



####################################################

################ Début script  #####################

####################################################



# Prérequis

# Création répertoire Documents

path_info_file=~/Documents/

if [ ! -d "$path_info_file" ]; then

    # Si le dossier existe pas le créér

    mkdir "$path_info_file"

fi



#Demande d'infos sur la machine distante

echo "=================================================="

echo -e "${BG_YELLOW}        Initialisation script pour connexion      ${NC}"

echo "=================================================="

echo ""

# Demande du nom d'utilisateur de la machine distante

read -p "Veuillez entrer le nom d'utilisateur du poste distant : " nom_distant

echo ""

# Demande de l'adresse IP de la machine distante

read -p "Veuillez entrer l'adresse IP du poste distant : " ip_distante

echo ""

# Demande d'identification

read -p "Veuillez vous identifier : " Operateur



# Début enregistrement evennement

echo $(date +%Y%m%d-%H%M%S)"-$Operateur-********StartScript********" >>/var/log/log_evt.log



#appel Fonction Principal

Menu_Principal



# Fin enregistrement evennement

echo $(date +%Y%m%d-%H%M%S)"-$Operateur-********EndScript********" >>/var/log/log_evt.log

# Fin de script

exit 0



####################################################

################ Fin script  #######################

####################################################

