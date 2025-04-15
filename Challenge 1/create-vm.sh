#!/bin/bash

# Verificación de argumentos
if [ $# -ne 7 ]; then
    echo "Uso: $0 <nombre_vm> <num_cpus> <mem_ram_GB> <mem_vram_MB> <tamano_disco_GB> <nombre_sata> <nombre_ide>"
    exit 1
fi

# Argumentos
VM_NAME=$1
CPUS=$2
MEM_RAM_GB=$3
MEM_VRAM_MB=$4
DISK_SIZE_GB=$5
SATA_CONTROLLER=$6
IDE_CONTROLLER=$7

# Convertir memoria de GB a MB
MEM_RAM_MB=$((MEM_RAM_GB * 1024))

# Crear la máquina virtual
VBoxManage createvm --name "$VM_NAME" --ostype "Linux_64" --register

# Configurar CPU y memoria
VBoxManage modifyvm "$VM_NAME" --cpus $CPUS --memory $MEM_RAM_MB --vram $MEM_VRAM_MB

# Crear y asociar el disco duro virtual
VBoxManage createhd --filename "$HOME/VirtualBox VMs/$VM_NAME/${VM_NAME}_disk.vdi" --size $((DISK_SIZE_GB * 1024))

# Crear y agregar el controlador SATA
VBoxManage storagectl "$VM_NAME" --name "$SATA_CONTROLLER" --add sata --controller IntelAhci
VBoxManage storageattach "$VM_NAME" --storagectl "$SATA_CONTROLLER" --port 0 --device 0 --type hdd --medium "$HOME/VirtualBox VMs/$VM_NAME/${VM_NAME}_disk.vdi"

# Crear y agregar el controlador IDE (para CD/DVD)
VBoxManage storagectl "$VM_NAME" --name "$IDE_CONTROLLER" --add ide --controller PIIX4

# Mostrar configuración final
echo ""
echo "=== Configuración de la máquina virtual '$VM_NAME' ==="
VBoxManage showvminfo "$VM_NAME"
