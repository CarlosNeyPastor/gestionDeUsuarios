#!/bin/bash

###########        MENU PRINCIPAL       ############

#######################################################


#Funcion LOG

# Fecha y hora del script, se usa para el log.
DATE=`date +%F`
TIME=`date +%H:%M`

# Rura del fichero de LOG
LOG="/var/log/GestionDeUsuairo_$DATE.log"

echo "Se inicio el Script el día $DATE a las $TIME">>$LOG

#######################################################

clear
	echo  "..:GESTION DE USUARIOS Y GRUPOS:..

		1) Usuarios
		2) Grupos
		0) Salir
	"
	echo -n "SELECCIONE LA OPCION DESEADA:"

read opcion
case $opcion in
	1) clear
	/bin/bash ./menu_usuario.sh 
	;;
	2) clear
	/bin/bash ./menu_grupo.sh
	;;
	0) echo "Saliendo"		
	sleep 2
	opcion=0
	;;
	*) 
	echo "Opcion incorrecta, vuelva a intentarlo"
	sleep 2
esac




