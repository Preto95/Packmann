#!/bin/bash

filename="software_backup.txt"

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
		rpm -qa > $filename
		echo "Backup is stored in $(pwd)/$filename"

 	elif [ $choose -eq 4 ]
 	then
		if [ -f $filename ]
		then
        		for i in $(cat $filename);
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
		pacman -Qnq > $filename
		echo "Backup is stored in $(pwd)/$filename"

 	elif [ $choose -eq 4 ]
 	then
		if [ -f $filename ]
		then
        		for i in $(cat $filename);
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
		rpm -qa > $filename
		echo "Backup is stored in $(pwd)/$filename"

 	elif [ $choose -eq 4 ]
 	then
		if [ -f $filename ]
		then
        		for i in $(cat $filename);
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
		apt list --installed > $filename
		echo "Backup is stored in $(pwd)/$filename"

 	elif [ $choose -eq 4 ]
 	then
		if [ -f $filename ]
		then
        		for i in $(cat $filename);
        		do
                		apt install -y $i
        		done
		else
			echo "Keine Backup-Datei gefunden"
		fi

	fi

elif zypper --version	#For SUSE systems
then
	if [ $choose -eq 1 ]
	then
		zypper up

	elif [ $choose -eq 2 ]
	then
		zypper dup

	elif [ $choose -eq 3 ]
	then
		rpm -qa > $filename
		echo "Backup is stored in $(pwd)/$filename"

 	elif [ $choose -eq 4 ]
 	then
		if [ -f $filename ]
		then
        		for i in $(cat $filename);
        		do
                		zypper in $i
        		done
		else
			echo "Keine Backup-Datei gefunden"
		fi

	fi

fi
