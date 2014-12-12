#! /bin/bash
rm BuildTools.jar
wget -O BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
echo "building spigot in screen session spigot_build"
echo "sc spigot_build - to watch"
screen -d -m -S spigot_build java -jar BuildTools.jar
echo "Build located at:  Spigot/Spigot-Server/target/spigot-xxx-xxx-snapshot.jar"
