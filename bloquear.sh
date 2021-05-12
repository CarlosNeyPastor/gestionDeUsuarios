##############    BLOQUEAR  USUARIO    ######################

#!/bin/bash


#######################################################


#Funcion LOG

# Fecha y hora del script, se usa para el log.
DATE=`date +%F`
TIME=`date +%H:%M`

# Rura del fichero de LOG
LOG="/var/log/CMDSoftware_$DATE.log"

echo "Se ha bloqueado en usuario $nom el día $DATE a las $TIME">>$LOG

#######################################################


novacio(){
while [ true ]
do
	echo -n "Ingrese el nombre a bloquear: "
	read nom

if [ -z $nom ]; then 
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
echo "..:BLOQUEAR USUARIO:.."
echo 
y=0
while [[ $y == "0" ]]
	do
	echo " "	
	novacio
	aux=$(grep -w "$nom" /etc/passwd)
	if [ -z $aux ]
		then
			echo " "
			echo "No se puede realizar, el usuario no existe"
			y=0
			echo "Presione ENTER para salir"
			sleep 2
		else
			echo " Prcesando datos "			
			y=1
			usermod -L $nom
			log
			echo "Usuario $nom Bloqueado"
			sleep 3
	fi
done


