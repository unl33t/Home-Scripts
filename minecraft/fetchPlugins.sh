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
downloadpath="/home/g33k/minecraft/prod/Minecraft/plugins/pending";
pluginpath="/home/g33k/minecraft/prod/Minecraft/plugins";
# Plugins
MVversion="2.5";	# Multiverse-* Version
MV="1";
WEversion='5.5.2';	# WorldEdit Version
WE="1";
WGversion='5.7.2';	# WorldGuard Version
WG="1";
CBversion='2.2.1';	# CommandBook Version
CB="1";
CHversion='3.3.1';	# CommandHelper Version
CH="0";
mChatSuite='MChat-1.4.5-R0.1.12.jar';	# mChat Version
MC="1";
NoCheat='';		# NoCheatPlus
NC="1";
HawkEye='';		# Hawkeye Reloaded
HE="1";
# Das Bukkit
bukkitvers='dev';	# Bukkit Version <dev|rb>
BK="0";
spigot='spigot.jar';	# Spigot version
SPGT="1";
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
	for i in Core Portals Inventories Adventure 
	do
		$myget "http://ci.onarandombox.com/job/Multiverse-$i/lastSuccessfulBuild/artifact/target/Multiverse-$i-$MVversion.jar";
		#mysize=$(ls -l $downloadpath/Multiverse-$i-$MVversion.jar | cut -d " " -f 5);
		#echo $mysize;
		if [ -a $downloadpath/Multiverse-$i-$MVversion.jar ]
		#if [ $mysize -gt 3000 ]
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
#	WorldEdit/WorldGuard
#
if [ $WE -eq 1 ]
then
	echo "Grabbing WorldEdit/WorldGuard";
	$myget http://build.sk89q.com/job/WorldEdit/lastSuccessfulBuild/artifact/target/worldedit-$WEversion-SNAPSHOT.zip;
	if [ -a $downloadpath/worldedit-$WEversion-SNAPSHOT.zip ]
		then
			unzip -q $downloadpath/worldedit-$WEversion-SNAPSHOT.zip -d $downloadpath;
			$mymv $downloadpath/WorldEdit.jar $pluginpath/WorldEdit.jar;
			rm -rf $downloadpath/*
		else
			echo "WorldEdit not downloaded, double check version number. http://build.sk89q.com/job/WorldEdit/";
	fi
else
	echo "Skipping WorldEdit";
fi
if [ $WG -eq 1 ]
then
	$myget http://build.sk89q.com/job/WorldGuard/lastSuccessfulBuild/artifact/target/worldguard-$WGversion-SNAPSHOT.zip;
	if [ -a $downloadpath/worldguard-$WGversion-SNAPSHOT.zip ]
		then
			unzip -q $downloadpath/worldguard-$WGversion-SNAPSHOT.zip -d $downloadpath;
			$mymv $downloadpath/WorldGuard.jar $pluginpath/WorldGuard.jar;
			rm -rf $downloadpath/*
		else
			echo "WorldGuard not downloaded, double check version number. http://build.sk89q.com/job/WorldGuard/";
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
	$myget http://build.sk89q.com/job/CommandBook/lastSuccessfulBuild/artifact/target/commandbook-$CBversion-SNAPSHOT.zip;
	if [ -a $downloadpath/commandbook-$CBversion-SNAPSHOT.zip ]
	        then
			unzip -q $downloadpath/commandbook-$CBversion-SNAPSHOT.zip -d $downloadpath;
	                $mymv $downloadpath/CommandBook.jar $pluginpath/CommandBook.jar;
			rm -rf $downloadpath/*
	        else
	                echo "CommandBook not downloaded, double check version number. http://build.sk89q.com/job/CommandBook/";
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
	$myget http://build.sk89q.com/job/CommandHelper/lastSuccessfulBuild/artifact/target/commandhelper-$CHversion-SNAPSHOT.jar
	if [ -a $downloadpath/commandhelper-$CHversion-SNAPSHOT.jar ]
	        then
	                $mymv $downloadpath/commandhelper-$CHversion-SNAPSHOT.jar $pluginpath/CommandHelper.jar;
	        else
	                echo "CommanddHelper not downloaded, double check version number. http://build.sk89q.com/job/CommandHelperc/";
	fi
else
	echo "Skipping CommandHelper";
fi
#
#	mChatSuit
#
if [ $MC -eq 1 ]
then
	echo "Grabbing mChat";
	$myget http://ci.mdev.in/job/MChat/lastSuccessfulBuild/artifact/target/$mChatSuite
	if [ -a $mChatSuite ]
	        then
	                $mymv $downloadpath/$mChatSuite $pluginpath/mChat.jar
	        else
	                echo "mChat update not found, double check the source link http://ci.mdev.in/job/MChat/";
	fi
else
	echo "Skipping mChatSuite"
fi
#	NoCheatPlus Plugin
#
if [ $NC -eq 1 ]
then
        echo "Grabbing the latest dev NoCheatPlus";
        $myget http://www.nocheatplus.org:8080/job/NoCheatPlus/lastSuccessfulBuild/artifact/target/NoCheatPlus.jar
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
#       HawkEye Plugin
#
if [ $HE -eq 1 ]
then
        echo "Grabbing the latest dev HawkEye";
        $myget http://ci.danru.com.br:8080/job/Hawkeye-Reload/lastSuccessfulBuild/artifact/target/HawkEye.jar
        if [ -a HawkEye.jar ]
                then
                        $mymv $downloadpath/HawkEye.jar $pluginpath/HawkEye.jar
                else
                        echo "HawkEye not found, double check the source link http://ci.danru.com.br:8080/job/Hawkeye-Reload/";
        fi
else
        echo "Skipping HawkEye";
fi
#
#	das bukket
#
if [ $BK -eq 1 ]
then
	echo "Grabbing the latest $bukkitvers Bukket";
	$myget "http://dl.bukkit.org/latest-$bukkitvers/craftbukkit.jar"
	if [ -a craftbukkit.jar ]
		then
			$mymv $downloadpath/craftbukkit.jar $pluginpath/../craftbukkit.jar
		else
			echo "Latest Bukket not found, double check the source link http://http://repo.bukkit.org/index.html#nexus-search;quick~craftbukkit/";
	fi
else
	echo "Skipping CraftBukkit";
fi
#
#	Spigot
#
if [ $SPGT -eq 1 ]
then
        echo "Grabbing the latest CraftBukket++";
        $myget "http://ci.ecocitycraft.com/job/Spigot/lastSuccessfulBuild/artifact/Spigot/target/$spigot"
        if [ -a $spigot ]
                then
                        $mymv $downloadpath/$spigot $pluginpath/../craftbukkit.jar
                else
                        echo "Latest Bukket not found, double check the source link http://ci.ecocitycraft.com/job/Spigot/";
        fi
else
        echo "Skipping CraftBukkit";
fi
#
#	done
#
