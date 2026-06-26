#!/bin/bash

change() {
	while true; do
		clear

cat << "EOF"
  _______                        ________                
 / ___/ /  ___ ____  ___ ____   /_  __/ /  ___ __ _  ___ 
/ /__/ _ \/ _ `/ _ \/ _ `/ -_)   / / / _ \/ -_)  ' \/ -_)
\___/_//_/\_,_/_//_/\_, /\__/   /_/ /_//_/\__/_/_/_/\__/ 
                   /___/                                 

*----------------------------------------*
| ¿Que tema desea utilizar en CentrixOS? |
*----------------------------------------*
| 1) Purple-Swirl.                       |
| 2) Green-Forest.                       |
| 0) Exit.                               |
*----------------------------------------*

*----------------------------------------*
| Al momento de seleccionar un nuevo     |
| tema de CentrixOS se eliminaran TODAS  |
| las modificaciones esteticas que haya  |
| realizado.                             |
| Se recomienda hacer un backup.         |
*----------------------------------------*
EOF
	read -p "Ingrese su opción: " opcionCHANGE
	case $opcionCHANGE in

		1)
			cp -rf ~/centrixOS/themes/Purple-Swirl/config/hypr ~/.config/
			cp -rf ~/centrixOS/themes/Purple-Swirl/config/kitty ~/.config/
			cp -rf ~/centrixOS/themes/Purple-Swirl/config/waybar ~/.config/
			cp -rf ~/centrixOS/themes/Purple-Swirl/config/wofi ~/.config/
			cp -rf ~/centrixOS/themes/Purple-Swirl/config/wlogout ~/.config/
			cp -rf ~/centrixOS/themes/Purple-Swirl/config/applications ~/.local/share
			cp -rf ~/centrixOS/themes/Purple-Swirl/config/fastfetch ~/.config

			cp ~/centrixOS/themes/Purple-Swirl/config/starship.toml ~/.config/
			cp ~/centrixOS/themes/Purple-Swirl/config/.zshrc ~/.zshrc
		;;

		2)
			cp -rf ~/centrixOS/themes/Green-Forest/config/hypr ~/.config/
			cp -rf ~/centrixOS/themes/Green-Forest/config/kitty ~/.config/
			cp -rf ~/centrixOS/themes/Green-Forest/config/waybar ~/.config/
			cp -rf ~/centrixOS/themes/Green-Forest/config/wofi ~/.config/
			cp -rf ~/centrixOS/themes/Green-Forest/config/wlogout ~/.config/
			cp -rf ~/centrixOS/themes/Green-Forest/config/applications ~/.local/share
			cp -rf ~/centrixOS/themes/Green-Forest/config/fastfetch ~/.config

			cp ~/centrixOS/themes/Green-Forest/config/starship.toml ~/.config/
			cp ~/centrixOS/themes/Green-Forest/config/.zshrc ~/.zshrc

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
| 1) Instalar CentrixOS base (Purple-Swirl).          |
| 0) Exit.                                            |
*-----------------------------------------------------*

*-----------------------------------------------------*
| Al terminar la personalizaciòn se recomienda        |
|reiniciar el sistema.                                |
*-----------------------------------------------------*

*-----------------------------------------------------*
| Previo a instalar la capa de personalización,       |
| asegurese de tener instalados los Trixie/Backports. |
|                                                     |
| En caso de no tenerlos instalados, siga los pasos   | 
| de la documentación oficial.                        |
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

			sudo apt install -y kitty fastfetch swaybg wofi zsh alsa-utils ranger wlogout curl wget starship btop grim chromium fonts-jetbrains-mono

			REAL_USER=${SUDO_USER:-$USER}
			sudo chsh -s /usr/bin/zsh "$REAL_USER"

			
		 	cp -rf ~/centrixOS/themes/Purple-Swirl/config/hypr ~/.config/
			cp -rf ~/centrixOS/themes/Purple-Swirl/config/kitty ~/.config/
			cp -rf ~/centrixOS/themes/Purple-Swirl/config/waybar ~/.config/
			cp -rf ~/centrixOS/themes/Purple-Swirl/config/wofi ~/.config/
			cp -rf ~/centrixOS/themes/Purple-Swirl/config/wlogout ~/.config/
			cp -rf ~/centrixOS/themes/Purple-Swirl/config/applications ~/.local/share
			cp -rf ~/centrixOS/themes/Purple-Swirl/config/fastfetch ~/.config

			cp ~/centrixOS/themes/Purple-Swirl/config/starship.toml ~/.config/
			cp ~/centrixOS/themes/Purple-Swirl/config/.zshrc ~/.zshrc
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
| 1) Instalar capa de personalización. |
| 2) Cambiar tema de CentrixOS.        |
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
