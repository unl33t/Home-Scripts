#! /bin/bash
mcversions=$(lynx -dump https://hub.spigotmc.org/stash/projects/SPIGOT/repos/spigot/commits | grep "Update to Minecraft" | cut -d " " -f 5-)
echo "latest versions:"
echo "  $mcversions"
read -p "Which version would you like: " spv

#spv="1.14.1"  #Spigot DEV versio to grab

echo "Building SpigotMC $spv"

#rm BuildTools.jar

if [ ! -f BuildTools.jar ]; then
    wget "https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar" -O BuildTools.jar
fi

#begin build
git config --global --unset core.autocrlf
java -jar BuildTools.jar --rev $spv

#move into place
echo "Moving new versions into place"
mv -v spigot-$spv.jar spigot.jar
chmod +x spigot.jar
echo "SpigotMC $spv Built and ready to test"
echo "For git history check out https://hub.spigotmc.org/stash/projects/SPIGOT/repos/spigot/commits"
