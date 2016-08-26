#!/bin/bash
vh="vhusbdarm"
rm $vh
wget http://www.virtualhere.com/sites/default/files/usbserver/$vh
chmod +x ./$vh
sudo ./$vh -b
