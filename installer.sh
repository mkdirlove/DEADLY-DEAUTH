#!/bin/sh

function check_sudo() {
  if [[ "$EUID" -ne 0 ]]; then
    clear
    echo "    Deadly Deauther" | figlet -f slant
    printf "%b\n" "ERROR!!! This script must be run as root. Use sudo." >&2
    exit 1
  fi
}

function banner() {
	echo
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

function install() {
    banner
    echo "    --------------------------------------------------------------"
	echo "    [       CODED BY  : JAYSON CABRILLAS SAN BUENAVENTURA        ]"
	echo "    [       GITHUB    : http://github.com/mkdirlove              ]"
	echo "    [       FACEBOOK  : https://www.facebook.com/mkdirlove.git   ]"
	echo "    --------------------------------------------------------------"
	echo ""
    check_sudo
    apt update  
    apt install -y mdk3 macchanger
    echo " [!] Installation Complete!"
}
