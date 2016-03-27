#! /bin/bash
#
#	Usage:
#	./spigot_fetch_and_build.sh		- To watch everything live
#	or
#	./spigot_fetch_and_build.sh screen	- To Build in screen, in case of flaky ssh connections
#
#
rm BuildTools.jar craftbukkit*.jar spigot*.jar 
wget -O BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
if [ "$1" == "screen" ]
	then
		echo "building spigot in screen session spigot_build"
		echo "sc spigot_build - to watch"
		screen -d -m -S spigot_build java -jar BuildTools.jar
	else
		java -jar BuildTools.jar
fi