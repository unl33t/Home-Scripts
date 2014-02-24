echo "Fetching x64 dropbox"
cd ~/
wget -O dropbox.tar.gz "http://www.dropbox.com/download/?plat=lnx.x86_64"
tar -zxvf dropbox.tar.gz

echo "Starting dropboxd - Ctrl-C to kill once registered"
sleep 20
~/.dropbox-dist/dropboxd

echo "copying dropbox init scropt to /etc/init.d"
sudo cp dropbox-init-script /etc/init.d/dropbox
sudo chown root:root /etc/init.d/dropbox
sudo chmod +x /etc/init.d/dropbox
sudo update-rc.d dropbox defaults
sudo service dropbox start

echo "Fetching dropbox script"
wget -O ~/.dropbox/dropbox.py "http://www.dropbox.com/download?dl=packages/dropbox.py"
chmod +x ~/.dropbox/dropbox.py
~/.dropbox/dropbox.py status

