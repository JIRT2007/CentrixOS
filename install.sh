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
	read -p "Ingrese su opción: " opcionINSTALL
	case $opcionINSTALL in

		1)
			mkdir -p ~/.config
			mkdir -p ~/.local/share

			sudo apt install -y -t trixie-backports hyprland
    			sudo apt install -y -t trixie-backports xdg-desktop-portal-hyprland
			#sudo apt install -t trixie-backports waybar

			sudo apt install -y kitty fastfetch waybar swaybg wofi zsh alsa-utils ranger wlogout curl wget starship calcurse btop grim chromium

			REAL_USER=${SUDO_USER:-$USER}
			sudo chsh -s /usr/bin/zsh "$REAL_USER"

			cp ~/centrixOS/config/.zshrc ~/.zshrc
		 	cp -rf ~/centrixOS/config/hypr ~/.config/
			cp -rf ~/centrixOS/config/kitty ~/.config/
			cp -rf ~/centrixOS/config/waybar ~/.config/
			cp -rf ~/centrixOS/config/wofi ~/.config/
			cp ~/centrixOS/config/starship.toml ~/.config/
			cp -rf ~/centrixOS/config/wlogout ~/.config/
			cp -rf ~/centrixOS/config/applications ~/.local/share
			cp -rf ~/centrixOS/config/fastfetch ~/.config
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
| 2) Actualizar a la siguiente versión.|
| 0) Exit.                             |
*--------------------------------------*
| Code developed by JIRT2007           |
*--------------------------------------*

EOF
	read -p "Ingresar su opciòn: " opcionMENU
	case $opcionMENU in

		1) 
		  install
		;;

		2)
		  update
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
