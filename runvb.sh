# !/bin/bash
MACHINENAME=$1



mkdir -p  /Users/$USER/goinfre/download/
mkdir -p  /Users/$USER/goinfre/os/
cd  /Users/$USER/goinfre/download/

echo "download iso";
if [ ! -f ./$MACHINENAME.iso ]; then
    curl -L http://mirror.corbina.net/debian-cd/11.0.0/i386/iso-cd/debian-11.0.0-i386-netinst.iso -o $MACHINENAME.iso
fi

#Create VM
VBoxManage createvm --name $MACHINENAME --ostype "Debian_64" --register --basefolder /Users/$USER/goinfre/os
#Set memory and network
VBoxManage modifyvm $MACHINENAME --ioapic on
VBoxManage modifyvm $MACHINENAME --memory 4096 --vram 128
VBoxManage modifyvm $MACHINENAME --nic1 nat

#Create Disk and connect Debian Iso
VBoxManage createhd --filename /Users/$USER/goinfre/os/$MACHINENAME/$MACHINENAME_DISK.vdi --size 80000 --format VDI
VBoxManage storagectl $MACHINENAME --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach $MACHINENAME --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium  /Users/$USER/goinfre/os/$MACHINENAME/$MACHINENAME_DISK.vdi
VBoxManage storagectl $MACHINENAME --name "IDE Controller" --add ide --controller PIIX4
VBoxManage storageattach $MACHINENAME --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium /Users/$USER/goinfre/download/$MACHINENAME.iso
VBoxManage modifyvm $MACHINENAME --boot1 dvd --boot2 disk --boot3 none --boot4 none

#Enable RDP
VBoxManage modifyvm $MACHINENAME --vrde on
VBoxManage modifyvm $MACHINENAME --vrdemulticon on --vrdeport 10001

#Start the VM
VBoxHeadless --startvm $MACHINENAME
VBoxManage controlvm $MACHINENAME setvideomodehint 1024 768 24