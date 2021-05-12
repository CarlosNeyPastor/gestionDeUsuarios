###########        MENU  MODIFICAR    ############

#!/bin/bash
clear


#######################################################


#Funcion LOG

# Fecha y hora del script, se usa para el log.
DATE=`date +%F`
TIME=`date +%H:%M`

# Rura del fichero de LOG
LOG="/var/log/GestionDeUsuairo_$DATE.log"

echo "Se accedio al Menu Modificar el día $DATE a las $TIME">>$LOG

#######################################################


opcion=9                                                                                                         

while [ $opcion != "0" ]
do
	clear 
	echo  "..:MENU MODIFICAR:.."
	echo " "
	echo "1) Cambiar Nombre"
	echo "2) Cambiar Password"
	echo "3) Asignar Grupo al Usuario"
	echo "4) Bloquear Usuario"
	echo "5) Desbloquear Usuario"	
	echo "6) Atras"	
	echo "0) Salir"
	echo " "	
	echo -n "SELECCIONE LA OPCION DESEADA:"
	read opcion
	case $opcion in                                                                        
		1) /bin/bash ./nuevo_nombre.sh 
		;;
		2) /bin/bash ./nuevo_pass.sh
		;;
		3) /bin/bash ./asignar.sh
		;;		
		4) /bin/bash ./bloquear.sh
		;;		
		5) /bin/bash ./desbloquear.sh
		;;
		6) /bin/bash ./menu_usuario.sh
		;;
		0) 
		echo "Fin"		
		echo "Presione ENTER para salir"
		sleep 2
		;;
		*) 
		echo "No se puede realizar, opcion incorrecta, vuelva a intentarlo"
		echo "Presione ENTER para salir"
		sleep 2
	esac
done




