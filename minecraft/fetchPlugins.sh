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
WEversion='5.4.3';	# WorldEdit Version
WE="1";
WGversion='5.5.4';	# WorldGuard Version
WG="1";
CBversion='2.2';	# CommandBook Version
CB="1";
CHversion='3.3.1';	# CommandHelper Version
CH="0";
mChatSuite='1.3.1-R2.1';	# mChatSuite Version
MC="1";
Spout='NA';		# SpoutPlugin Version
SP="1";
# Das Bukkit
bukkitvers='dev';	# Bukkit Version <dev|rb>
BK="0";
bukkitplusplus='1.3.2-R1-SNAPSHOT';	# CraftBukkit++ version
BP="1";
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
	echo "Grabbing mChatSuit";
	$myget http://ci.mdev.in/job/mChatSuite/lastSuccessfulBuild/artifact/target/MChat-$mChatSuite.jar
	if [ -a MChat-$mChatSuite.jar ]
	        then
	                $mymv $downloadpath/MChat-$mChatSuite.jar $pluginpath/mChatSuite.jar
	        else
	                echo "mChat update not found, double check the source link http://ci.mdev.in/job/mChatSuite/";
	fi
else
	echo "Skipping mChatSuite"
fi
#
#	Spout Plugin
#
if [ $SP -eq 1 ]
then
	echo "Grabbing the latest dev SpoutPlugin";
	$myget http://spout.in/plugindev
	if [ -a plugindev ]
		then
			$mymv $downloadpath/plugindev $pluginpath/SpoutPlugin.jar
		else
			echo "SpoutPlugin not found, double check the source link http://ci.spout.org/job/SpoutPlugin/";
	fi
else
	echo "Skipping SpoutPlugin";
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
#	CraftBukkit++
#
if [ $BP -eq 1 ]
then
        echo "Grabbing the latest CraftBukket++";
        $myget "http://build.spout.org/job/CraftBukkit++/lastSuccessfulBuild/artifact/target/craftbukkit-$bukkitplusplus.jar"
        if [ -a craftbukkit-$bukkitplusplus.jar ]
                then
                        $mymv $downloadpath/craftbukkit-$bukkitplusplus.jar $pluginpath/../craftbukkit.jar
                else
                        echo "Latest Bukket not found, double check the source link http://build.spout.org/job/CraftBukkit++/";
        fi
else
        echo "Skipping CraftBukkit";
fi
#
#	done
#
