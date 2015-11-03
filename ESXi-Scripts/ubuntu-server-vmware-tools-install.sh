#! /bin/bash
# Mount the disk
sudo mount /dev/cdrom /media/cdrom
# extract the installer
tar -zxvf /media/cdrom/VMwareTools-* -C /tmp/
# go to the install dir
cd /tmp/vmware-tools-distrib
# run with -d to select all defaults
sudo ./vmware-install.pl -d
# cleanup
sudo umount /media/cdrom
