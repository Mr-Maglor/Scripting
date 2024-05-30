

$VM_name= read-host  "nom VM "
$VM_ram= read-host  "cb ram "
$num_vms= read-host  "nombre de vm "

# Emplacement du disque dur template

$template_disk_path="D:\_Machine Virtuelle\Template\Template Ubuntu\Ubuntu-disk001.vdi"

  for ($i = 1; $i -le $num_vms; $i++) {
    if ($num_vms -eq 1) {
        $final_vm_name = $vm_name
    } else {
        $final_vm_name = "${vm_name}_${i}"
    }
 
    # Emplacement du nouveau disque dur cloné

    $new_disk_path="D:\_Machine Virtuelle\${final_vm_name}\${final_vm_name}_1.vdi"

# Création du dossier pour la nouvelle VM

  new-item -ItemType Directory  "D:\_Machine Virtuelle\${final_vm_name}"



# Création de la VM vide

. D:\VirtualBox\vboxmanage.exe createvm --name $final_vm_name --ostype "Ubuntu_64" --register

# Configuration de la mémoire RAM, de la mémoire vidéo, et du contrôleur graphique

. D:\VirtualBox\vboxmanage.exe modifyvm $final_vm_name --memory $vm_ram --vram 16 --graphicscontroller VMSVGA

# Création du contrôleur SATA

. D:\VirtualBox\vboxmanage.exe storagectl $final_vm_name --name "SATA Controller" --add sata --controller IntelAhci

# Ajout d'un lecteur CDrom

. D:\VirtualBox\vboxmanage.exe storagectl $final_vm_name --name "IDE Controller" --add ide

# Attachement du lecteur CD-ROM au contrôleur IDE

. D:\VirtualBox\vboxmanage.exe storageattach $final_vm_name --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium emptydrive


# Clonage du disque dur template

D:\VirtualBox\vboxmanage.exe clonemedium $template_disk_path $new_disk_path


 # Attachement du disque dur cloné à la VM

D:\VirtualBox\vboxmanage.exe storageattach $final_vm_name --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium $new_disk_path


# # Configuration de la carte réseau en NAT

. D:\VirtualBox\vboxmanage.exe modifyvm $vm_name --nic1 nat
}