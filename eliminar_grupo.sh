#############    ELIMINAR  GRUPO   ##################		

#!/bin/bash


#######################################################


#Funcion LOG

# Fecha y hora del script, se usa para el log.
DATE=`date +%F`
TIME=`date +%H:%M`

# Rura del fichero de LOG
LOG="/var/log/GestionDeUsuairo_$DATE.log"

echo "Se elimino el grupo $grup el día $DATE a las $TIME">>$LOG

#######################################################


#Funcion no vacio

novacio(){
while [ true ]
do
	echo -n "Ingrese nombre del grupo a eliminar:"
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
####################################################

clear
echo "..:ELIMINAR GRUPO:.."
echo ""
novacio
echo " "
echo "Eliminando grupo $grup"
sleep 3
aux=$(grep -w "$grup" /etc/group)
if [ -z $aux ]
	then
		echo " "
		echo "No se puede realizar, el grupo no existe"
		sleep 2
	else
		groupdel $grup
		log
		echo " "
		echo "Grupo $grup fue eliminado"			
		sleep 2

fi

