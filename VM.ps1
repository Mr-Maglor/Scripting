

$VM_name= read-host  "nom VM "
$VM_ram= read-host  "nom ram "
$iso_path=  "D:\_Machine Virtuelle\ISO\ubuntu-22.04.4-desktop-amd64-002.iso"

# Création de la VM vide

. D:\VirtualBox\vboxmanage.exe createvm --name $vm_name --ostype "Ubuntu_64" --register


# Configuration de la mémoire RAM, de la mémoire vidéo, et du contrôleur graphique

. D:\VirtualBox\vboxmanage.exe modifyvm $vm_name --memory $vm_ram --vram 16 --graphicscontroller VMSVGA


# Création du contrôleur SATA

. D:\VirtualBox\vboxmanage.exe storagectl $vm_name --name "SATA Controller" --add sata --controller IntelAhci

# Création du disque dur

. D:\VirtualBox\vboxmanage.exe createmedium disk --filename "D:\_Machine Virtuelle\$vm_name\$vm_name" --size 30000 --format VMDK --size 30000 --format VMDK

# Attachement du disque dur crée à la VM

. D:\VirtualBox\vboxmanage.exe storageattach $vm_name --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "D:\_Machine Virtuelle\$vm_name\$vm_name.vmdk"


# Ajout d'un lecteur CDrom

. D:\VirtualBox\vboxmanage.exe storagectl $vm_name --name "IDE Controller" --add ide

# Insertion de l'image d'installation dans le lecteur CDrom

. D:\VirtualBox\vboxmanage.exe storageattach $vm_name --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium $iso_path


# # Configuration de la carte réseau en NAT

. D:\VirtualBox\vboxmanage.exe modifyvm $vm_name --nic1 nat


# Démarrage de la VM

. D:\VirtualBox\vboxmanage.exe startvm "$vm_name" --type gui