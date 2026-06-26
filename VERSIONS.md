# Registro de cambios:
<!--
Aries, Tauro, Géminis, Cáncer, Leo, Virgo, Libra, Escorpio, Sagitario, Capricornio, Acuario, Piscis.
-->


### Notas v0.0.5 "Tauro" (Inestable):
- CentrixOS Tauro representa la primer version con nomenclatura "Inestable" y representa una nueva etapa para el desarrollo del proyecto de CentrixOS. Esta versión se diseña para renovar la experiencia visual del proyecto y agregar nuevas funcionalidades que las versiones experimentales no incorporaban. 
- Nueva función del script de instalacion de CentrixOS para poder elegir entre dos variantes de personalización para Hyprland (Purple-Swirl y Green-Forest).
- Se removio la utilidad de Calcurse para tener un calendario via terminal.
- ASCII art personalizado para fastfetch.
- Se esta trabajando en una opción para poder alternar entre los entornos de escritorio.
- Planeamos implementar en el menu de instalación de CentrixOS la opción de instalar el sistema con OpenBox como entorno de escritorio junto a Hyprland. Se esta analizando remplazar Hyprland en futuras versiones para tener OpenBox como entorno de escritorio principal.

### Notas v0.0.4 "Aries" (Experimental):
- Se agrego Chromium como navegador web remplazando a Brave Browser.
- Nuevas modificaciones para el script de instalación.
- Se implementaron nombres clave para las versiones de CentrixOS a partir de la v0.0.4 inspirados en los signos zodiacales.
- Se implemento una configuración de Fastfetch personalizado y el comando `VERSION` para visualizar la version que se utiliza de CentrixOS.
- Se modifico la función `--app` para los agentes de inteligencia artificial para que los mismos funcionen con Chromium Browser.
- Se habilito por defecto la opción `resize_on_border` para poder redimensionar las ventanas cuando se encuentran en modo floating.

### Notas v0.0.3 (Experimental):
- Se realizaron mejoras en el script de instalación.
- Se unificaron los scripts de `pre-install.sh` e `install.sh` en un solo script de instalación.
- Se modificaron los nombres de los directorios internos.
- Se esta trabajando en un proceso de actualización para el script.

### Notas v0.0.2 (Experimental):
- Se agrego Brave Browser como navegador (Necesario para ciertas funciones).
- Nuevas personalizaciones en Wofi y Waybar.
- Se agrego calcurse y btop como programas de terminal y Grim para realizar screenshots .
- Incorporamos nuevos archivos ***.desktop*** dentro del direcotrio de **~/.local/share/applications** para poder ejecutar modelos de IA (ChatGPT, ClaudeCode y Google Gemini) mediante la funcion **--app** que nos ofrecen los navegadores base Chromium.
- Se recomienda realizar pruebas de CentrixOS en Virtual Machines previo a realizar una instalación sobre hardware fisico.

### Notas v0.0.1 (Experimental):
- CentrixOS no es una distribución de GNU/Linux independiente ni basada en alguna ya existente, es unicamente una capa de personalización.
- Este proyecto aún está en fase de desarrollo por lo que no se recomienda confiar ciegamente en el proceso de instalación, se esta trabajando en las mejoras y correcciones.
- El objetivo principal del mismo es ser una capa de personalización sobre Debian usando paquetería de repositorios oficiales y de Trixie/Backports.
- Se necesita tener configurados los repositorios de Trixie/Backports previo a la ejecución del script.
- NO se debe de ejecutar el script como root ni usando sudo, se recomienda asignarle permisos de ejecución mediante `chmod +x`.
- La customización emplea ***zsh*** como shell del sistema con personalización de ***StarShip***.
- Todas las fallas serán corregidas con el desarrollo de las versiones nuevas.
