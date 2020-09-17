#!/usr/bin/bash
clear
tput setaf 1; echo " "
pkg install figlet
pkg install ruby
gem install lolcat
pkg install zip
pkg install wget
cd $PREFIX/bin
if [ -f msfconsoel ]
then 
	tput setaf 2; echo " METASPLOIT FOUND!"
else
	cd && wget https://raw.githubusercontent.com/Hax4us/Metasploit_termu
x/master/metasploit.sh && chmod +x metasploit.sh && ./metasploit.sh
fi
cd
cd androrat && rm -rf install.sh
