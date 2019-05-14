#!/usr/bin/python3
import urllib2

# Paths
DownloadPath = "~/minecraft/prod/plugins/pending"
PluginPath = "~/minecraft/prod/plugins"

# plugins
PluginList = {
    "MVCore":{
            "Enabled":"0",
            "Version":"3.0.0-SNAPSHOT",
            "DLName":"Multiverse-Core-3.0.0-SNAPSHOT.jar",
            "CPName":"MultiVerse-Core.jar",
            "Build":"",
            "URL":"https://ci.onarandombox.com/job/Multiverse-Core/lastSuccessfulBuild/artifact/target/DLName",
            "ErrorLink":"http://ci.onarandombox.com/job/Multiverse-Core"
            },
    "MVPortals":{
            "Enabled":"0",
            "Version":"3.0.0-SNAPSHOT",
            "DLName":"Multiverse-Portals-3.0.0-SNAPSHOT.jar",
            "CPName":"Multiverse-Portals.jar",
            "Build":"",
            "URL":"https://ci.onarandombox.com/job/Multiverse-Portals/lastSuccessfulBuild/artifact/target/[DLName]",
            "ErrorLink":"http://ci.onarandombox.com/job/Multiverse-Portals"
            },
    "MVInvantory":{
            "Enabled":"0",
            "Version":"3.0.0-SNAPSHOT",
            "DLName":"Multiverse-Invantories-3.0.0-SNAPSHOT.jar",
            "CPName":"Multiverse-Invantories.jarf",
            "Build":"",
            "URL":"https://ci.onarandombox.com/job/Multiverse-Portals/lastSuccessfulBuild/artifact/target/[DLNae]",
            "ErrorLink":"http://ci.onarandombox.com/job/Multiverse-Invantories"
            },
    "WorldEdit":{
            "Enabled":"0",
            "Version":"7.0.0",
            "DLName":"worldedit-bukkit-7.0.0-SNAPSHOT-dist.jar",
            "CPName":"worldedit.jar",
            "Build":"10819",
            "URL":"http://builds.enginehub.org/job/worldedit/[Build]/download/[DLName]",
            "ErrorLink":""
            },
    "WorldGuard":{
            "Enabled":"0",
            "Version":"7.0.0",
            "DLName":"worldguard-legacy-7.0.0-SNAPSHOT-dist.jar",
            "CPName":"worldguard.jar",
            "Build":"10812",
            "URL":"http://builds.enginehub.org/job/worldguard/[Build]/download/[DLName]",
            "ErrorLink":""
            },
    "CommandBook":{
            "Enabled":"0",
            "Version":"2.5-SNAPSHOT",
            "DLName":"commandbook-2.5.zip",
            "CPName":"CommandBook.jar",
            "Build":"10189",
            "URL":"http://builds.enginehub.org/job/commandbook/[Build]/download/commandbook-[Version].zip",
            "ErrorLink":"http://builds.enginehub.org/job/commandbook/last-successful?branch=master"
            },
    "NoCheatPlus":{
            "Enabled":"0",
            "Version":"",
            "DLName":"NoCheatPlus.jar",
            "CPName":"NoCheatPlus.jar",
            "Build":"",
            "URL":"http://ci.md-5.net/job/NoCheatPlus/lastSuccessfulBuild/artifact/target/NoCheatPlus.jar",
            "ErrorLink":"http://www.nocheatplus.org:8080/job/NoCheatPlus/"
            }
    }
Dynmap = {
        "Enabled":"0",
        "Version":"",
        "DLName":"",
        "CPName":"",
        "Build":"",
        "URL":"http://dynmap.us/releases/",
        "ErrorLink":"http://dynmap.us/releases/"
        }
DynmapWB = {
        "Enabled":"0",
        "Version":"",
        "DLName":"",
        "CPName":"",
        "Build":"",
        "URL":"http://dynmap.us/builds/Dynmap-WorldGuard/",
        "ErrorLink":"http://dynmap.us/builds/Dynmap-WorldGuard/"
        }


# for each plugin in loop
for plugin in PluginList.items():
    print("\nDownloading "+plugin[0]+": ")
    print(plugin[1]['Enabled'])
    print(plugin[1]['Version'])
    print(plugin[1]['DLName'])
    print(plugin[1]['CPName'])
    print(plugin[1]['Build'])
    print(plugin[1]['URL'])
    print(plugin[1]['ErrorLink'])

    wget.download(plugin[1]['URL'], plugin[1]['DLName'])
