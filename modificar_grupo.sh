############### MODIFICAR GRUPO ##################

# !/bin/bash


#######################################################


#Funcion LOG

# Fecha y hora del script, se usa para el log.
DATE=`date +%F`
TIME=`date +%H:%M`

# Rura del fichero de LOG
LOG="/var/log/GestionDeUsuairo_$DATE.log"

echo "Se accedio al menu Modificar Grupo el día $DATE a las $TIME">>$LOG

#######################################################


#Funcion no vacio

novacio(){

while [ true ]
do
	echo -n "Ingrese nombre del grupo a modificar:"
	read old

if [ -z $old ]; then 
	echo -n "No se permiten campos vacios"
	sleep 1 
	clear
		else
		break
fi
done
}
###########################################################
novacio2(){

while [ true ]
do
	echo -n "Ingrese nuevo nombre del grupo:"
	read new

if [ -z $new ]; then 
	echo -n "No se permiten campos vacios"
	sleep 1 
	clear
		else
		break
fi
done
}

####################################################

clear
echo "..:MODIFICAR NOMBRE DEL GRUPO:.."
echo " "
novacio
echo " "
echo "Borrando Nombre del Grupo $old"
sleep 2
aux=$(grep -w "$old" /etc/group)
if [ -z $aux ]
	then
		echo " "		
		echo "No se puede realizar, el grupo no existe."
		sleep 2
	else
		echo " "		
		novacio2
		echo " "	
		aux=$(grep -w "$new" /etc/group)
		if [ -z $aux ]
			then	
				echo "Guardando Nuevo Nombre "
				sleep 2
				groupmod -n $new $old
				log
				echo " "
				echo "Su nuevo nombre es $new "
				sleep 2
			else
				echo " "
				echo "No se puede realizar, el grupo ya existe."
				sleep 2
		fi
fi


