################    CREAR  GRUPO    #####################

#!/bin/bash	


#######################################################


#Funcion LOG

# Fecha y hora del script, se usa para el log.
DATE=`date +%F`
TIME=`date +%H:%M`

# Rura del fichero de LOG
LOG="/var/log/GestionDeUsuairo_$DATE.log"

echo "Se ha creado el grupo $grup el día $DATE a las $TIME">>$LOG

#######################################################


#Funcion no vacio

novacio(){
while [ true ]
do
	echo -n "Ingrese nombre del grupo:"
	read grup

if [ -z $grup ]; then 
	echo -n "No se permiten campos vacios"
	sleep 1 
	clear
		else
		break
fi
done
}
############################################################
clear
echo "..:CREAR GRUPO:.."
echo " "
novacio
echo " "
echo "Creando grupo $grup"
sleep 3

aux=$(grep -w "$grup" /etc/group)
if [ -z $aux ]
	then
		groupadd $grup
		log
		echo " "
		echo "Grupo $grup creado"
		sleep 2
	else
		echo " "
		echo "No se puede realizar, el grupo ya existe."
		sleep 2
		exit
fi



