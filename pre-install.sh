#!/bin/bash

if [ ! -f /etc/debian_version ]; then
    echo "CentrixOS solo puede instalarse sobre Debian."
    exit 1
fi

while true; do
	clear

cat << "EOF"
  _____         __      _      ____  ____
 / ___/__ ___  / /_____(_)_ __/ __ \/ __/
/ /__/ -_) _ \/ __/ __/ /\ \ / /_/ /\ \  
\___/\__/_//_/\__/_/ /_//_\_\\____/___/ v0.0.1 
                                         
Gracias por confiar en la capa de personalizaciòn de CentrixOS para los sistemas
basados en Debian GNU/Linux.
Este proyecto esta inspirado por Omarchy (Created by: DHH) y Loc-OS (Created by: Locos por Linux).

EOF

cat << "EOF"
*--------------------------------------*
| 1) Instalar capa de personalizaciòn. |
| 0) Salir.                            |
*--------------------------------------*
| Codigo creado por JIRT               |
*--------------------------------------*

*-------------------------------------------------------------------------------*
| No se recomienda ejecutar este script como root o usando sudo,                |
| si usted lo ejecuto de la forma "sudo ./script.sh" le solicitamos             |
| que por favor cancele la ejecuciòn, le asigne permisos y lo ejecute           |
| como su usario personal.                                                      |
| Esto sera corregido para futuras versiones del script, lamento las molestias. |
*-------------------------------------------------------------------------------*

EOF
	read -p "Ingresar su opciòn: " opcionINSTALL
	case $opcionINSTALL in

		1) 
		  bash ~/centrixOS/CUSTOMIZATION/install.sh
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
