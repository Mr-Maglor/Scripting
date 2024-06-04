# Importez le module ActiveDirectory si nécessaire
# Import-Module ActiveDirectory

# Définir les variables pour les serveurs et les partages
$departementServer = "\\nom_du_serveur_departement\partage_departement"
$serviceServer = "\\nom_du_serveur_service\partage_service"

# Récupérer le nom d'utilisateur
$username = $env:USERNAME

# Récupérer les informations de l'utilisateur à partir d'Active Directory
$user = Get-ADUser $username -Properties department, extensionAttribute1

# Récupérer le nom du département et du service à partir des attributs Active Directory
$departement = $user.department
$service = $user.extensionAttribute1

# Définir les lettres de lecteurs réseau à mapper
$departementDrive = "D:"
$serviceDrive = "S:"

# Vérifier si les lecteurs réseaux existent déjà et les déconnecter si nécessaire
if (Test-Path $departementDrive) {
    Get-WmiObject -Query "SELECT * FROM Win32_LogicalDisk WHERE DeviceID='$departementDrive'" |
        ForEach-Object {
            $_.Provider.InvokeMethod("Disconnect", $null)
        }
}

if (Test-Path $serviceDrive) {
    Get-WmiObject -Query "SELECT * FROM Win32_LogicalDisk WHERE DeviceID='$serviceDrive'" |
        ForEach-Object {
            $_.Provider.InvokeMethod("Disconnect", $null)
        }
}

# Mapper les lecteurs réseau
New-PSDrive -Name $departementDrive -PSProvider FileSystem -Root "$departementServer\$departement" -Persist
New-PSDrive -Name $serviceDrive -PSProvider FileSystem -Root "$serviceServer\$service" -Persist
