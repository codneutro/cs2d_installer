#!/bin/bash
# CS2D Default Installer for dedicated software
# Version: _1002

msg()
{
	echo -e "\033[33m$1 \033[0m"
}

msg "CS2D Default Installer is starting..."

if [ $USER != "root" ]
then
	msg "Run this script as root please !"
	exit 0
fi

msg "Checking grep"
apt-get install -qq grep

if [ $# -gt 0 ]
then
	if [ $1 = "-clean" ]
	then
		msg "Running clean mode"
		ls|grep -v cs2d_installer.sh|xargs rm -rf
	else
		msg "Unknown argument <$1>"
		exit 0
	fi
fi


msg "Checking CPU.."

out=$(uname -a|grep "x86_64"|wc -l)
if [ $out = 1 ] 
then
	msg "CPU 64 bits detected"
	cpu64=true
else
	msg "CPU 32 bits detected"
	cpu64=false
fi

msg "Checking dependencies"

dependencies=("unzip" "screen" "libstdc++6" "nohup")

if $cpu64
then
	dependencies[5]="lib32stdc++6"
	dependencies[6]="ia32-libs"
fi

for dep in ${dependencies[*]}
do
	msg  "Checking $dep"
	out=$(dpkg -s $dep|grep "installed"|wc -l)
	if [ $out = 0 ]
	then
		apt-get -qq install $dep
	fi
done

msg "Downloading CS2D Linux dedicated..."
wget -q http://www.unrealsoftware.de/files_pub/cs2d_dedicated_linux.zip
unzip cs2d_dedicated_linux.zip

msg "Downloading CS2D Files..."
wget https://github.com/codneutro/cs2d_installer/archive/master.zip
unzip master.zip

msg "Clean up"
rm -f "Dedicated Readme.txt"
rm -f cs2d_dedicated_linux.zip
rm -f master.zip

msg "CS2D Server has been installed"
msg "If you have any problems report them on usgn.de"

msg "Would you like to configure your server ? [Y/n]:"
read continue
if [ $continue != 'Y' ] && [ $continue != 'y' ]
then
	exit 0
fi

nano sys/server.cfg

exit 0
