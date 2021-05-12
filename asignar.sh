###############      ASIGNAR GRUPO PRIMARIO AL USUARIO   #############

#!/bin/bash


#######################################################


#Funcion LOG

# Fecha y hora del script, se usa para el log.
DATE=`date +%F`
TIME=`date +%H:%M`

# Rura del fichero de LOG
LOG="/var/log/GestionDeUsuairo_$DATE.log"

echo "El Script se inicio el día $DATE a las $TIME">>$LOG

#######################################################

#Funcion no vacio

novacio(){
while [ true ]
do
	echo -n "Ingrese el nombre del usuario a modificar:"
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
#Funcion no vacio

novacio2(){
while [ true ]
do
	echo -n "Ingrese el GID del grupo para el usuario:"
	read gid

if [ -z $gid ]; then 
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
echo "..:ASIGNAR GRUPO PRIMARIO AL USUARIO:.."
echo " "
novacio
aux=$(grep -w "$nom" /etc/passwd)
if [ -z $aux ]
	then
		echo " "
		echo "No se puede realizar, el usuario no existe"
		sleep 3	
	else
		echo " "
		novacio2
		aux=$(grep -w "$gid" /etc/group)
		if [ -z $aux ]
			then
				echo " "
				echo "No se puede realizar, el grupo no existe"
				sleep 3
			else
				echo " "
				echo "Asignando grupo primario"
				sleep 3
				usermod -g $gid $nom
				log
				echo "Usuario $nom GID $gid "	
				sleep 3
		fi
fi
		

