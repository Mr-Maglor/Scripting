#récupération nom utilisateur actif
$activeUser = Get-LocalUser | Where-Object {$_.Enabled -eq "True" } | Select-Object -ExpandProperty Name

#Message de bienvenue
echo "Bienvenue $activeUser, vous allez pouvoir choisir la méthode de connexion au poste distant SRVWIN01. "

#pause de 2 seconde
Sleep -Seconds 2

#Selection de la méthode à utiliser
$Choix = Read-Host -Prompt "Tapez 1 pour vous connecter via TightVNC ou 2 pour vous connecter via Bureau d'accès à Distance"

If ($choix -eq 2 ) 
{   
    #Confirmation du choix effectué RDP / Bureau d'accès distant
    echo "Lancement de la connexion via le Bureau d'accès à Distance." 
    #pause de 1 seconde
    Sleep -Seconds 1
    #lancement du raccourcit situé sur le bureau de l'utilsateur
    start C:\Users\$activeUser\Desktop\RDP.rdp
    #Affichage message connexion en cours
    echo "Connexion en cours." 
}
elseIf ($choix -eq 1 ) 
{   
    #Confirmation du choix effectué ici TightVNC
    echo "Lancement de la connexion via TightVNC." 
    #pause de 1 seconde
    Sleep -Seconds 1 
    #lancement du raccourcit situé sur le bureau de l'utilsateur
    start C:\Users\$activeUser\Desktop\config_co_pserv.vnc
    #Affichage message connexion en cours
    echo "Connexion en cours." 
}
else
{
    #Affichage message commande inconnue
    echo "Commande inconnue, veuillez recommencer. "
    Sleep -Seconds 2
}
Get-Process | Where-Object {($_.Name -eq "powershell") -or ($_.Name -eq "pwsh")} | Stop-Process

 