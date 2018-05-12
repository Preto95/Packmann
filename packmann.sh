#!/bin/bash

echo "<1> Update the Repos"
echo "<2> Update the System"
echo "<3> Backup installed programs"
echo "<4> Restore programs"

read choose

if dnf --version	#For systems with fedora
then
	if [ $choose -eq 1 ]
	then
		dnf check-update

	elif [ $choose -eq 2 ]
	then
		dnf distro-sync

	elif [ $choose -eq 3 ]
	then
		rpm -qa > Software_Backup.txt
		echo "Backup is stored in $(pwd)/Software_Backup.txt"

 	elif [ $choose -eq 4 ]
 	then
		if [ -f Software_Backup.txt ]
		then
        		for i in $(cat Software_Backup.txt);
        		do
                		dnf install -y $i
        		done
		else
			echo "Keine Backup-Datei gefunden"
		fi

	fi

elif pacman --version	#For Arch-based systems
then
	if [ $choose -eq 1 ]
	then
		pacman -Sy

	elif [ $choose -eq 2 ]
	then
		pacman -Syu

	elif [ $choose -eq 3 ]
	then
		pacman -Qnq > Software_Backup_pacman.txt
		echo "Backup is stored in $(pwd)/Software_Backup.txt"

 	elif [ $choose -eq 4 ]
 	then
		if [ -f Software_Backup_pacman.txt ]
		then
        		for i in $(cat Software_Backup.txt);
        		do
                		pacman -S --needed --noconfirm $i
        		done
		else
			echo "Keine Backup-Datei gefunden"
		fi

	fi

elif yum --version	#For CentOS etc. systems
then
	if [ $choose -eq 1 ]
	then
		yum check-update

	elif [ $choose -eq 2 ]
	then
		yum distro-sync

	elif [ $choose -eq 3 ]
	then
		rpm -qa > Software_Backup.txt
		echo "Backup is stored in $(pwd)/Software_Backup.txt"

 	elif [ $choose -eq 4 ]
 	then
		if [ -f Software_Backup.txt ]
		then
        		for i in $(cat Software_Backup.txt);
        		do
                		yum install -y $i
        		done
		else
			echo "Keine Backup-Datei gefunden"
		fi

	fi

elif apt --version	#For Debian based systems
then
	if [ $choose -eq 1 ]
	then
		apt update

	elif [ $choose -eq 2 ]
	then
		apt dist-upgrade

	elif [ $choose -eq 3 ]
	then
		apt -list --installed > Software_Backup.txt
		echo "Backup is stored in $(pwd)/Software_Backup.txt"

 	elif [ $choose -eq 4 ]
 	then
		if [ -f Software_Backup.txt ]
		then
        		for i in $(cat Software_Backup.txt);
        		do
                		apt install -y $i
        		done
		else
			echo "Keine Backup-Datei gefunden"
		fi

	fi

elif zypper --version	#For openSUSE systems
then
	
fi
