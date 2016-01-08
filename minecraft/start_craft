#!/usr/bin/perl
if ( -f "/home/g33k/minecraft/prod/minecraft_server.pid" ) {
	print "spigot is running!\n";
	}
	else {
		print "spigot is dead jim...\n";
		if ( `/bin/ps -ef | /bin/grep -v grep | /bin/grep -i screen | /bin/grep -i prod` ) {
			print "...but a screen scession is running.\n";	
			}
			else {
				print "...starting a new screen session for minecraft/mcmyadmin/bukkit/thing...\n";
				exec('cd /home/g33k/minecraft/prod; /usr/bin/screen -d -m -S spigot /home/g33k/minecraft/prod/MCMA2_Linux_x86_64') or print STDERR " crap! $! \n";
				}
		}
if ( `/bin/ps -ef | /bin/grep -v grep | /bin/grep -i screen | /bin/grep -i forge` ) {
	print "forge is running!\n";
	}
        else {
        	print "...starting a new screen session for minecraft/forge/thing...\n";
		exec('cd /home/g33k/minecraft/sponge; /usr/bin/screen -d -m -S forge java -jar forge-1.8-11.14.3.1499-universal.jar') or print STDERR " crap! $! \n";
                }

