###########        MENU USUARIO       ############

#!/bin/bash
clear


#######################################################


#Funcion LOG

# Fecha y hora del script, se usa para el log.
DATE=`date +%F`
TIME=`date +%H:%M`

# Rura del fichero de LOG
LOG="/var/log/GestionDeUsuairo_$DATE.log"

echo "Se accedio al Menu Usuario el día $DATE a las $TIME">>$LOG

#######################################################


opcion=9                                                                                                         

while [ $opcion != "0" ]
do
	clear 
	echo  "..:GESTION  USUARIOS:.."
	echo " "
	echo "1) Agregar Usuario"
	echo "2) Eliminar Usuario"
	echo "3) Visualizar todos los Usuarios"
	echo "4) Modificar Usuario"	
	echo "5) Atras"
	echo "0) Salir"	
	echo " "
	echo -n "SELECCIONE LA OPCION DESEADA:"
	read opcion
	case $opcion in                                                                        
		1) /bin/bash ./nuevo_usu.sh 
		;;
		2) /bin/bash ./eliminar_usu.sh
		;;
		3) /bin/bash ./ver_usu.sh
		;;		
		4) /bin/bash ./menu_modificar.sh
		;;
		5) /bin/bash ./menu.sh
		;;		
		0) 
		echo "Fin"		
		echo "Presione ENTER para salir"
		sleep 2
		;;
		*) 
		echo "Opcion incorrecta, vuelva a intentarlo"
		echo "Presione ENTER para salir"
		sleep 2
	esac
done

