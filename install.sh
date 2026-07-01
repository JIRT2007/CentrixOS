#!/bin/bash

change_wallpaper(){
	THEME="$1"

	case $THEME in

		"Purple-Swirl")
		 	pkill swaybg 2>/dev/null
			swaybg -i ~/centrixOS/themes/Purple-Swirl/config/Wallpaper/city.jpg -m fill &
		;;

		"Green-Forest")
			pkill swaybg 2>/dev/null
			swaybg -i ~/centrixOS/themes/Green-Forest/config/Wallpaper/Forest.jpg -m fill &
		;;

		"Shadow-Dance")
			pkill swaybg 2>/dev/null
			swaybg -i ~/centrixOS/themes/Shadow-Dance/config/Wallpaper/GirlAnime.png -m fill &
		;;

		"Blue-Depression")
			pkill swaybg 2>/dev/null
			swaybg -i ~/centrixOS/themes/Blue-Depression/config/Wallpaper/Wallpaper.jpg -m fill &
	esac
}

apply_theme(){
	THEME="$1"

	cp -rf ~/centrixOS/themes/$THEME/config/hypr ~/.config/
 	cp -rf ~/centrixOS/themes/$THEME/config/kitty ~/.config/
	cp -rf ~/centrixOS/themes/$THEME/config/wofi ~/.config/
	cp -rf ~/centrixOS/themes/$THEME/config/wlogout ~/.config/
	cp -rf centrixOS/themes/$THEME/config/btop.conf ~/.config/btop
	cp ~/centrixOS/themes/$THEME/config/starship.toml ~/.config/

	kitten @ load-config

	change_wallpaper "$THEME"
	hyprctl reload
}

change() {
	while true; do
		clear

cat << "EOF"
  _______                        ________                
 / ___/ /  ___ ____  ___ ____   /_  __/ /  ___ __ _  ___ 
/ /__/ _ \/ _ `/ _ \/ _ `/ -_)   / / / _ \/ -_)  ' \/ -_)
\___/_//_/\_,_/_//_/\_, /\__/   /_/ /_//_/\__/_/_/_/\__/ 
                   /___/                                 

*---------------------------------------------*
| What theme do you want to use in CentrixOS? |
*---------------------------------------------*
| 1) Purple-Swirl.                            |
| 2) Green-Forest.                            |
| 3) Shadow-Dance.                            |
| 4) Blue-Depression.                         |
| 0) Exit.                                    |
*---------------------------------------------*

*---------------------------------------------*
| When selecting a new CentrixOS theme, ALL   |
| the aesthetic modifications you have made   |
| will be deleted. A backup is recommended.   |
*---------------------------------------------*
EOF
	read -p "Ingrese su opción: " opcionCHANGE
	case $opcionCHANGE in

		1)
		  apply_theme "Purple-Swirl"
		;;

		2)
		  apply_theme "Green-Forest"
		;;

		3)
		  apply_theme "Shadow-Dance"
		;;

		4)
		  apply_theme "Blue-Depression"
		;;

		0)
		 clear
		 exit 0
		;;

		*)
		 echo "Orden no encontrada."
		 sleep 1
		;;

esac
done
}

install() {
	while true; do
		clear

cat << "EOF"
   ____         __       ____
  /  _/__  ___ / /____ _/ / /
 _/ // _ \(_-</ __/ _ `/ / / 
/___/_//_/___/\__/\_,_/_/_/  
                         
*-----------------------------------------------------*
| Do you want to install the customization layer?     |
*-----------------------------------------------------*
| 1) Yes, install CentrixOS.                          |
| 0) Exit.                                            |
*-----------------------------------------------------*

*-----------------------------------------------------*
| At the end of the customization it is recommended   |
| restart the system.                                 |
*-----------------------------------------------------*
EOF
	read -p "Ingrese su opción: " opcionINSTALL
	case $opcionINSTALL in

		1)
			mkdir -p ~/.config
			mkdir -p ~/.local/share

			sudo apt install -y -t trixie-backports hyprland
    			sudo apt install -y -t trixie-backports xdg-desktop-portal-hyprland
			sudo apt install -y -t trixie-backports waybar

			sudo apt install -y \
				kitty \
				fastfetch \
				swaybg \
				wofi \
				zsh \
				alsa-utils \
				ranger wlogout \
				curl \
				wget \
				starship \
				btop \
				grim \
				chromium \
				fonts-jetbrains-mono

			REAL_USER=${SUDO_USER:-$USER}
			sudo chsh -s /usr/bin/zsh "$REAL_USER"
			
			apply_theme "Purple-Swirl"	

			cp -rf ~/centrixOS/config_basic/waybar ~/.config
			cp -rf ~/centrixOS/config_basic/applications ~/.local/share
			cp -rf ~/centrixOS/config_basic/fastfetch ~/.config
			cp ~/centrixOS/config_basic/.zshrc ~/.zshrc
		 exit 0
		;;

		0)
		 clear
		 exit 0 
		;;

		*)
		 echo "Orden no encontrada."
		 sleep 1
		;;

esac
done
}


while true; do
	clear

cat << "EOF"
 
 ██████████████████████████████████
 ██                              ██
 ██  ██████████████████████████
 ██  ██                      ██
 ██  ██  ██████████████████  ██
 ██  ██  ██              ██  ██
 ██  ██  ██  ██████████████  ██
 ██  ██  ██              ██  ██
 ██  ██  ██████████████  ██  ██
 ██  ██  ██              ██  ██
 ██  ██  ██████████████████  ██
 ██  ██                      ██
 ██  ██████████████████████████
 ██                              ██
 ██████████████████████████████████

*--------------------------------------*
| 1) Install CentrixOS.                |
| 2) Change theme.                     |
| 3) Enable Debian Trixie/Backports.   |
| 0) Exit.                             |
*--------------------------------------*
| Code developed by JIRT2007           |
*--------------------------------------*
EOF
	read -p "Ingresar su opción: " opcionMENU
	case $opcionMENU in

		1) 
		  install
		;;

		2)
		  change
		;;

		3)
		  sudo cp ~/centrixOS/config_basic/debian-backports.sources  /etc/apt/sources.list.d/
		  sudo apt-get update
		;;

		0)
		 clear
		  exit 0
		;;

		*)
		  echo "Orden no encontrada."
		  sleep 1
		;;

esac
done
