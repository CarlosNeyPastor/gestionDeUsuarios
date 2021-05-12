###########        MENU GRUPO       ############

#!/bin/bash
clear


#######################################################


#Funcion LOG

# Fecha y hora del script, se usa para el log.
DATE=`date +%F`
TIME=`date +%H:%M`

# Rura del fichero de LOG
LOG="/var/log/GestionDeUsuairo_$DATE.log"

echo "Se accedio a Menu de grupo el día $DATE a las $TIME">>$LOG

#######################################################


opcion=9                                                                                                         

while [ $opcion != "0" ]
do
	clear 
	echo  "..:GESTION GRUPOS:.."
	echo " "
	echo "1) Crear Grupo"
	echo "2) Modificar Grupo"
	echo "3) Eliminar Grupo"		
	echo "4) Visualizar Todos los Grupos"
	echo "5) Atras "
	echo "0) salir"
	echo " "
	echo -n "SELECCIONE LA OPCION DESEADA:"
	read opcion
	case $opcion in                                                                        
		1) /bin/bash ./nuevo_grupo.sh 
		;;
		2) /bin/bash ./modificar_grupo.sh
		;;
		3) /bin/bash ./eliminar_grupo.sh
		;;
		4) /bin/bash ./ver_grupo.sh
		;;
		5) /bin/bash ./menu.sh
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

