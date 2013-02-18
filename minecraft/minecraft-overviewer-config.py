#	Worlds
worlds['World'] = "/home/g33k/minecraft/prod/Minecraft/Worlds/World"
worlds['Hunting_Grounds'] = "/home/g33k/minecraft/prod/Minecraft/Worlds/Hunting Grounds"
worlds['Build_Lands'] = "/home/g33k/minecraft/prod/Minecraft/Worlds/Build Lands"
worlds['Nether'] = "/home/g33k/minecraft/prod/Minecraft/Worlds/Nether"
worlds['The_End'] = "/home/g33k/minecraft/prod/Minecraft/Worlds/The End"

#	Day Rneders
renders["worldday"] = {
    "world": "World",
    "title": "World Daytime",
    "rendermode": smooth_lighting,
    "dimension": "overworld",
}
renders["hgday"] = {
    "world": "Hunting_Grounds",
    "title": "Hunting Grounds Daytime",
    "rendermode": smooth_lighting,
    "dimension": "overworld",
}
renders["blday"] = {
    "world": "Build_Lands",
    "title": "Build Lands Daytime",
    "rendermode": smooth_lighting,
    "dimension": "overworld",
}

#       Night Renders
renders["worldnight"] = {
    "world": "World",
    "title": "World Nighttime",
    "rendermode": smooth_night,
    "dimension": "overworld",
}
renders["hgnight"] = {
    "world": "Hunting_Grounds",
    "title": "Hunting Grounds Nighttime",
    "rendermode": smooth_night,
    "dimension": "overworld",
}
renders["blnight"] = {
    "world": "Build_Lands",
    "title": "Build Lands Nighttime",
    "rendermode": smooth_night,
    "dimension": "overworld",
}

#	Nether Renders
renders["nether"] = {
    "world": "Nether",
    "title": "The Nether",
    "rendermode": nether,
    "dimension": "nether",
}

#	The End Renders
renders["theend"] = {
    "world": "The_End",
    "title": "The End",
    "rendermode": lighting,
    "dimension": "end",
}

#	Defaults
outputdir = "/sites/mc/maps"
texturepath = "/home/g33k/minecraft/prod/Minecraft/plugins/dynmap/texturepacks/johnsmith.zip"
processes = 2
