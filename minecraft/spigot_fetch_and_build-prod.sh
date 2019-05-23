#! /bin/bash

echo "Building current SpigotMC"

rm BuildTools.jar

if [ ! -f BuildTools.jar ]; then
    wget "https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar" -O BuildTools.jar
fi

#begin build
git config --global --unset core.autocrlf
java -jar BuildTools.jar

#Version handling
versions=($(ls -v spigot-*.jar))
v_len=${#versions[@]}

#prune extra versions
if (($v_len>5)); then
    echo "$v_len versions found, pruning..."
    rm ${versions[0]}
fi

#list verions
echo "Versions:"
printf '%s\n' "${versions[@]}"

#copy latest into place
cp -v ${versions[-1]} spigot.jar
chmod +x spigot.jar
echo "SpigotMC Built and ready to start"
echo "For git history check out https://hub.spigotmc.org/stash/projects/SPIGOT/repos/spigot/commits"

#remove any versions of craftbukkit.jar (will be going away as of 1.14)
if [ -f craftbukkit-*.jar ]; then
    rm craftbukkit-*.jar
fi
