#!/bin/bash

if [ ! -f /etc/debian_version ]; then
    echo "CentrixOS solo puede instalarse sobre Debian."
    exit 1
fi

instalacion() {
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

			sudo apt install kitty fastfetch waybar swaybg wofi zsh alsa-utils ranger wlogout curl wget starship calcurse btop grim

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

}


while true; do
	clear

cat << "EOF"
  _____         __      _      ____  ____
 / ___/__ ___  / /_____(_)_ __/ __ \/ __/
/ /__/ -_) _ \/ __/ __/ /\ \ / /_/ /\ \  
\___/\__/_//_/\__/_/ /_//_\_\\____/___/  
                                         
Gracias por confiar en la capa de personalización de CentrixOS para los sistemas
basados en Debian GNU/Linux.
Este proyecto esta inspirado por Omarchy (Created by: DHH) y Loc-OS (Created by: Locos por Linux).

EOF

cat << "EOF"
*--------------------------------------*
| 1) Instalar capa de personalización. |
| 0) Salir.                            |
*--------------------------------------*
| Codigo creado por JIRT2007           |
*--------------------------------------*

*-------------------------------------------------------------------------------*
| No se recomienda ejecutar este script como root o usando sudo,                |
| si usted lo ejecuto de la forma "sudo ./script.sh" le solicitamos             |
| que por favor cancele la ejecución, le asigne permisos y lo ejecute           |
| como su usario personal.                                                      |
| Esto sera corregido para futuras versiones del script, lamento las molestias. |
*-------------------------------------------------------------------------------*

EOF
	read -p "Ingresar su opciòn: " opcionINSTALL
	case $opcionINSTALL in

		1) 
		  instalacion
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
