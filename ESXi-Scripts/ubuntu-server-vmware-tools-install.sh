#! /bin/bash
#make a choice (open-vm-tools or vmwaretools from disk?)
echo "Which method do you want to use?"
echo "1) apt-get open-vm-tools"
echo "2) VMWare Tools from Disk"
echo "Press [Enter] to bail"
choice="0"
read choice
case "$choice" in
    '0' )
        echo "You chose not to make a choice, bravo"
        ;;
    '1' )
        sudo apt install open-vm-tools
        ;;
    '2' )
        echo "Make sure you've mounted the iso!"
        sudo mount /dev/cdrom /media/cdrom
        tar -zxvf /media/cdrom/VMwareTools-* -C /tmp/
        cd /tmp/vmware-tools-distrib
        sudo ./vmware-install.pl -d
        cd
        sudo umount /media/cdrom
        sudo rm -rf /tmp/vmware-tools-distrib
        ;;
esac;
