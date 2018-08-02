#! /bin/bash
#
#	Usage:
#	./spigot_fetch_and_build.sh		- To watch everything live
#	or
#	./spigot_fetch_and_build.sh screen	- To Build in screen, in case of flaky ssh connections
#
#

#rm BuildTools.jar
rm craftbukkit*.jar
rm spigot*.jar

if [ ! -f BuildTools.jar ]; then
    wget "https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar" -O BuildTools.jar
fi

if [ "$1" == "screen" ]
	then
		echo "building spigot in screen session spigot_build"
		echo "sc spigot_build - to watch"
		screen -d -m -S spigot_build java -jar BuildTools.jar
    else if [[ $1 = *"."* ]] || [[ $1 = *"latest"* ]]; then
		java -jar BuildTools.jar --rev $1
    else
        java -jar BuildTools.jar
    fi
fi

echo "For git history check out https://hub.spigotmc.org/stash/projects/SPIGOT/repos/spigot/commits"
