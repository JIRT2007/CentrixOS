#!/bin/bash

while true; do 
	clear

cat << "EOF"

*-----------------------------------------------------*
| ¿Usted tiene instalado los DebianTrixie/Backports?  |
*-----------------------------------------------------*
| 1) Si, estan instalados (Seguir con la instalación).|
| 0) No estan instalados.                             |
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
	read -p "Ingrese su opciòn: " opcionCUSTOM
	case $opcionCUSTOM in

		1)
			mkdir -p ~/.config
			mkdir -p ~/.local/share

			sudo apt install -t trixie-backports hyprland
    			sudo apt install -t trixie-backports xdg-desktop-portal-hyprland
			#sudo apt install -t trixie-backports waybar

			sudo apt install kitty fastfetch waybar swaybg wofi zsh alsa-utils ranger wlogout curl wget starship calcurse btop

			REAL_USER=${SUDO_USER:-$USER}
			sudo chsh -s /usr/bin/zsh "$REAL_USER"

			cp ~/centrixOS/CUSTOMIZATION/configuraciones/.zshrc ~/.zshrc
		  	cp -rf ~/centrixOS/CUSTOMIZATION/configuraciones/hypr ~/.config/
			cp -rf ~/centrixOS/CUSTOMIZATION/configuraciones/kitty ~/.config/
			cp -rf ~/centrixOS/CUSTOMIZATION/configuraciones/waybar ~/.config/
			cp -rf ~/centrixOS/CUSTOMIZATION/configuraciones/wofi ~/.config/
			cp ~/centrixOS/CUSTOMIZATION/configuraciones/starship.toml ~/.config/
			cp -rf ~/centrixOS/CUSTOMIZATION/configuraciones/wlogout ~/.config/
			cp -rf ~/centrixOS/CUSTOMIZATION/configuraciones/applications ~/.local/share
			cp -rf ~/centrixOS/CUSTOMIZATION/configuraciones/fastfetch ~/.config

			curl -fsS https://dl.brave.com/install.sh | sh
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


