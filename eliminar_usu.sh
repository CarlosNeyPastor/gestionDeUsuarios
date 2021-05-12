##############    ELIMINAR  UASUARIO    ###################
	
#!/bin/bash


#######################################################


#Funcion no vacio

novacio(){
while [ true ]
do
	echo -n "Ingrese nombre del usuario a eliminar: "
	read usu

if [ -z $usu ]; then 
	echo -n "No se permiten campos vacios"
	sleep 1 
	clear
		else
		break
fi
done
}

#############################################################
#Funcion no vacio

novacio2(){
while [ true ]
do
	echo -n echo "Desea tambien borrar los datos de usuario ?(s/n)"
	read dat

if [ -z $dat ]; then 
	echo -n "No se permiten campos vacios"
	sleep 1 
	clear
		else
		break
fi
done
}
##############################################################

clear
echo "..:ELIMINAR USUARIO:.."
echo " "
novacio
echo " "
echo "Procesando datos "
sleep 3

aux=$(grep -w "$usu" /etc/group)
if [ -z $aux ]
	then
		echo " "
		echo "No se puede realizar, el usuario no existe"
		echo "Presione ENTER para salir"
		sleep 2
	else
		echo " "
		novacio2
		if [ $dat = 's' ]
			then
				echo " Borrando Datos del Usuaio $usu "
				sleep 2
				userdel -r $usu 
				echo " Eliminado "
				sleep 2
			else
				echo " Borrando Usuario " 
				sleep 2
				userdel $usu
				log
				echo " Usuario Borrado"
				sleep 2		
		fi
fi
echo " "
echo "Gracias"
sleep 2




#######################################################


#Funcion LOG

# Fecha y hora del script, se usa para el log.
DATE=`date +%F`
TIME=`date +%H:%M`

# Rura del fichero de LOG
LOG="/var/log/GestionDeUsuairo_$DATE.log"

echo "Se ha eliminado el usuario $usu el día $DATE a las $TIME">>$LOG