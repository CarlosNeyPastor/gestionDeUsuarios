#########        MODIFICAR PASSWORD      ##################

#!/bin/bash


#######################################################


#Funcion LOG

# Fecha y hora del script, se usa para el log.
DATE=`date +%F`
TIME=`date +%H:%M`

# Rura del fichero de LOG
LOG="/var/log/GestionDeUsuairo_$DATE.log"

echo "Se ha modificado el password del usuario $usu el día $DATE a las $TIME">>$LOG

#######################################################


novacio(){
while [ true ]
do
	echo -n "Nombre del usuario para modificar su password: "
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
############################################################
novacio2(){
while [ true ]
do
	echo -n "Ingrese el password:  "
	read pass

if [ -z $pass ]; then 
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
echo "..:MODIFICAR PASSWORD:.."
echo ""
novacio
aux=$(grep -w "$usu" /etc/passwd)
if [ -z $aux ]
	then
		echo " "
		echo "No se puede realizar, el usuario no existe"
		sleep 2
	else
		echo " "
		passwd $usu	
		sleep 2
fi








