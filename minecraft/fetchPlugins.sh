#!/bin/bash
#
#	Global vars
#
if [ "$1" == "-v" ]
	then
		myget="wget";
		mymv="mv -v";
	else
		myget="wget -q";
		mymv="mv";
fi
# Paths
downloadpath="/home/g33k/minecraft/prod/plugins/pending";
pluginpath="/home/g33k/minecraft/prod/plugins";
# Plugins
MVversion="2.6.0";	# Multiverse-* Version
MV="1";
MVPversion="2.5.2"; # Multiverse-Portals Version
MVP="1";
WEversion='7.0.0';	# WorldEdit Version
WEBuild='10819';    # Build NO. from url
WE="1";
WGversion='7.0.0';	# WorldGuard Version
WGBuild='10812';    # Build NO. from url
WG="1";
CBversion='2.5';	# CommandBook Version
CB="0";
CHversion='3.3.2';	# CommandHelper Version
CH="0";
NoCheat='';		# NoCheatPlus
NC="0";
DY="1"          # Dynmap Auto-Downloader
DYWG="1"        # Dynmap-WorldGuard Auto-Downloader
#
#	Global prep
#
cd $downloadpath;
#
#	Multiverse-*
#
if [ $MV -eq 1 ]
then
	echo "Grabbing Multiverse parts";
	for i in Core
		# possible packages: Portals Inventories Adventure
	do
		$myget http://ci.onarandombox.com/job/Multiverse-$i/lastSuccessfulBuild/artifact/target/Multiverse-$i-$MVversion.jar --no-check-certificate
		if [ -a $downloadpath/Multiverse-$i-$MVversion.jar ]
			then
				$mymv $downloadpath/Multiverse-$i-$MVversion.jar $pluginpath/Multiverse-$i.jar
			else
				#rm $downloadpath/Multiverse-$i-$MVversion.jar
				echo "Multiverse-$i not downloaded, double check version number. http://ci.onarandombox.com/job/Multiverse-$i";
		fi
	done
else
	echo "Skipping Multiverse"
fi
#
#   Multiverse-Portals
#
if [ $MVP -eq 1 ]
    then
        echo "Grabbing Multiverse-Portals";
        $myget https://ci.onarandombox.com/job/Multiverse-Portals/lastSuccessfulBuild/artifact/target/Multiverse-Portals-$MVPversion-SNAPSHOT.jar --no-check-certificate
        if [ -a $downloadpath/Multiverse-Portals-$MVPversion-SNAPSHOT.jar ]
            then
                $mymv $downloadpath/Multiverse-Portals-$MVPversion-SNAPSHOT.jar $pluginpath/Multiverse-Portals.jar
            else
            #rm $downloadpath/Multiverse-$i-$MVversion.jar
                echo "Multiverse-Portals not downloaded, double check version number. http://ci.onarandombox.com/job/Multiverse-Portals";
        fi
    else
        echo "Skipping Multiverse-Portals"
fi
#
#	WorldEdit/WorldGuard
#
if [ $WE -eq 1 ]
then
	echo "Grabbing WorldEdit";
    $myget http://builds.enginehub.org/job/worldedit/$WEBuild/download/worldedit-bukkit-$WEversion-SNAPSHOT-dist.jar
	if [ -a $downloadpath/worldedit-bukkit-$WEversion-SNAPSHOT-dist.jar ]
		then
			$mymv $downloadpath/worldedit-bukkit-$WEversion-SNAPSHOT-dist.jar $pluginpath/WorldEdit.jar;
			rm -rf $downloadpath/*
		else
			echo "WorldEdit not downloaded, double check version number. http://builds.enginehub.org/job/worldedit/last-successful?branch=master";
	fi
else
	echo "Skipping WorldEdit";
fi
if [ $WG -eq 1 ]
then
    echo "Grabbing WorldGuard"
    $myget http://builds.enginehub.org/job/worldguard/$WGBuild/download/worldguard-legacy-$WGversion-SNAPSHOT-dist.jar
	if [ -a $downloadpath/worldguard-legacy-$WGversion-SNAPSHOT-dist.jar ]
		then
			$mymv $downloadpath/worldguard-legacy-$WGversion-SNAPSHOT-dist.jar $pluginpath/WorldGuard.jar;
			#rm -rf $downloadpath/*
		else
			echo "WorldGuard not downloaded, double check version number. http://builds.enginehub.org/job/worldguard/last-successful?branch=master";
	fi
else
	echo "Skipping WorldGuard";
fi
#
#	CommandBook
#
if [ $CB -eq 1 ]
then
	echo "Grabbing CommandBook"
    $myget http://builds.enginehub.org/job/commandbook/10189/download/commandbook-$CBversion-SNAPSHOT.zip
	if [ -a $downloadpath/commandbook-$CBversion-SNAPSHOT.zip ]
	        then
			unzip -q $downloadpath/commandbook-$CBversion-SNAPSHOT.zip -d $downloadpath;
	                $mymv $downloadpath/CommandBook.jar $pluginpath/CommandBook.jar;
			rm -rf $downloadpath/*
	        else
	                echo "CommandBook not downloaded, double check version number. http://builds.enginehub.org/job/commandbook/last-successful?branch=master";
	fi
else
	echo "Skipping CommandBook";
fi
#
#	CommandHelper
#
if [ $CH -eq 1 ]
then
	echo "Grabbing CommandHelper"
    $myget http://builds.enginehub.org/job/commandhelper/10314/download/commandhelper-$CHversion-SNAPSHOT.jar
	if [ -a $downloadpath/commandhelper-$CHversion-SNAPSHOT.jar ]
	        then
	                $mymv $downloadpath/commandhelper-$CHversion-SNAPSHOT.jar $pluginpath/CommandHelper.jar;
	        else
	                echo "CommanddHelper not downloaded, double check version number. http://build.sk89q.com/job/CommandHelperc/";
	fi
else
	echo "Skipping CommandHelper";
fi
#	NoCheatPlus Plugin
#
if [ $NC -eq 1 ]
then
        echo "Grabbing the latest dev NoCheatPlus";
	$myget http://ci.md-5.net/job/NoCheatPlus/lastSuccessfulBuild/artifact/target/NoCheatPlus.jar
        if [ -a NoCheatPlus.jar ]
                then
                        $mymv $downloadpath/NoCheatPlus.jar $pluginpath/NoCheatPlus.jar
                else
                        echo "NoCheatPlus not found, double check the source link http://www.nocheatplus.org:8080/job/NoCheatPlus/";
        fi
else
        echo "Skipping NoCheatPlus";
fi
#
#   Dynmap  (http://dynmap.us/releases/)
#
if [ $DY -eq 1 ]
then
    echo "Grabbing Dynmap"
    geturl=$(lynx -dump http://dynmap.us/releases/ | grep -i spigot | cut -d " " -f 3 | sed -e '$!d' );
    $myget "$geturl"
    Dynmap=`echo $geturl | cut -d "/" -f 5`
    if [ -a $downloadpath/$Dynmap ]
    then
        $mymv $downloadpath/$Dynmap $pluginpath/dynmap.jar;
        echo "$Dynmap installed"
        echo "Double check for an updated version:  http://dynmap.us/releases/"
    else
        echo "Dynmap not downloaded, double check version number.  http://dynmap.us/releases/";
    fi
else
    echo "Skipping Dynmap"
fi
#
#   Dynmap-WorldGuard (http://dynmap.us/builds/Dynmap-WorldGuard/)
#
if [ $DYWG -eq 1 ]
then
    echo "Grabbing Dynmap-WorldGuard"
    geturl=$(lynx -dump http://dynmap.us/builds/Dynmap-WorldGuard/ | grep -v HEAD | cut -d " " -f 4 | sed -e '$!d')
    $myget "$geturl"
    DyWg=`echo $geturl | cut -d "/" -f 6`
    if [ -a $downloadpath/$DyWg ]
    then
        $mymv $downloadpath/$DyWg $pluginpath/Dynmap-WorldGuard.jar
        echo "$DyWg installed"
        echo "Double check for an updated version:  http://dynmap.us/builds/Dynmap-WorldGuard/"
    else
        echo "Dynmap-WorldGuard not downloaded, double check version number.  http://dynmap.us/builds/Dynmap-WorldGuard/"
    fi
else
    echo "Skipping Dynmap-WorldGuard"
fi
#
#   Cleanup
#
chmod +x $pluginpath/*.jar
#
#	done
#
