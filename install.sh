#!/bin/bash

install() {
	while true; do
		clear

cat << "EOF"
   ____         __       ____
  /  _/__  ___ / /____ _/ / /
 _/ // _ \(_-</ __/ _ `/ / / 
/___/_//_/___/\__/\_,_/_/_/  
                         
*-----------------------------------------------------*
| ¿Desea instalar la capa de personalización?         |
*-----------------------------------------------------*
| 1) Instalar CentrixOS Purple-Swirl.                 |
| 2) Instalar CentrixOS Green-Forest.                 | 
| 0) Exit.                                            |
*-----------------------------------------------------*

*----------------------------------------------*
| Al terminar la personalizaciòn se recomienda |
| reiniciar el sistema.                        |
*----------------------------------------------*

*-----------------------------------------------------------*
| Previo a instalar la capa de personalización,             |
| asegurese de tener instalados los DebianTrixie/Backports. |
|                                                           |
| En caso de no tenerlos instalados, siga los pasos         | 
| de la documentación.                                      |
*-----------------------------------------------------------*
| https://backports.debian.org/uploads/trixie-backports/    |
*-----------------------------------------------------------*
EOF
	read -p "Ingrese su opción: " opcionINSTALL
	case $opcionINSTALL in

		1)
			mkdir -p ~/.config
			mkdir -p ~/.local/share

			sudo apt install -y -t trixie-backports hyprland
    			sudo apt install -y -t trixie-backports xdg-desktop-portal-hyprland
			sudo apt install -y -t trixie-backports waybar

			sudo apt install -y kitty fastfetch swaybg wofi zsh alsa-utils ranger wlogout curl wget starship btop grim chromium fonts-jetbrains-mono

			REAL_USER=${SUDO_USER:-$USER}
			sudo chsh -s /usr/bin/zsh "$REAL_USER"

			cp ~/centrixOS/Purple-Swirl/config/.zshrc ~/.zshrc
		 	cp -rf ~/centrixOS/Purple-Swirl/config/hypr ~/.config/
			cp -rf ~/centrixOS/Purple-Swirl/config/kitty ~/.config/
			cp -rf ~/centrixOS/Purple-Swirl/config/waybar ~/.config/
			cp -rf ~/centrixOS/Purple-Swirl/config/wofi ~/.config/
			cp ~/centrixOS/Purple-Swirl/config/starship.toml ~/.config/
			cp -rf ~/centrixOS/Purple-Swirl/config/wlogout ~/.config/
			cp -rf ~/centrixOS/Purple-Swirl/config/applications ~/.local/share
			cp -rf ~/centrixOS/Purple-Swirl/config/fastfetch ~/.config
		 exit 0
		;;

		2)
		 	mkdir -p ~/.config
			mkdir -p ~/.local/share

			sudo apt install -y -t trixie-backports hyprland
    			sudo apt install -y -t trixie-backports xdg-desktop-portal-hyprland
			sudo apt install -y -t trixie-backports waybar

			sudo apt install -y kitty fastfetch swaybg wofi zsh alsa-utils ranger wlogout curl wget starship btop grim chromium fonts-jetbrains-mono

			REAL_USER=${SUDO_USER:-$USER}
			sudo chsh -s /usr/bin/zsh "$REAL_USER"
		
			cp ~/centrixOS/Green-Forest/config/.zshrc ~/.zshrc
			cp -rf ~/centrixOS/Green-Forest/config/hypr ~/.config/
			cp -rf ~/centrixOS/Green-Forest/config/kitty ~/.config/
			cp -rf ~/centrixOS/Green-Forest/config/waybar ~/.config/
			cp -rf ~/centrixOS/Green-Forest/config/wofi ~/.config/
			cp ~/centrixOS/Green-Forest/config/starship.toml ~/.config/
			cp -rf ~/centrixOS/Green-Forest/config/wlogout ~/.config/
			cp -rf ~/centrixOS/Green-Forest/config/applications ~/.local/share
			cp -rf ~/centrixOS/Green-Forest/config/fastfetch ~/.config
		exit 0

		;;

		0)
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
  _____         __      _      ____  ____
 / ___/__ ___  / /_____(_)_ __/ __ \/ __/
/ /__/ -_) _ \/ __/ __/ /\ \ / /_/ /\ \  
\___/\__/_//_/\__/_/ /_//_\_\\____/___/  

*--------------------------------------*
| 1) Instalar capa de personalización. |
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

		0)
		  exit 0
		;;

		*)
		  echo "Orden no encontrada."
		  sleep 1
		;;

esac
done
