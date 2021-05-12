##########          NUEVO  USUA2qRIO           #################

#!/bin/bash



#######################################################


# Funcion no vacio
novacio(){
while [ true ]
do
	echo -n "Ingrese nombre del usuario nuevo: "
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
##########################################################
# Funcion no vacio
novacio2(){
while [ true ]
do
	echo -n "Ingrese el numero de GID del grupo: "
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
######################################################
# Funcion no vacio
novacio3(){
while [ true ]
do
	echo -n "Desea tambien ingresar el numero de GID del grupo s/n: "	
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
#######################################################
clear
echo " ..:CREAR USUARIO:.."
echo " "	
novacio
echo " "
echo "Creando Usuario $nom"
sleep 3

aux=$(grep -w "$nom" /etc/passwd)
if [ -z $aux ]
	then	
		echo " "
		useradd $nom 
		log
		echo " "		
		passwd $nom		
		echo " "		
		echo "Usuario $nom creado"
		sleep 2
		echo " "
		novacio3
		if [ $dat = 's' ]
			then
				echo " "
				novacio2
				echo " "
				aux=$(grep -w "$grup" /etc/group)				
				if [ -z $grup ]
					then
						echo " "						
						echo "No se pude realizar, el grupo no existe"
						echo "Presione ENTER para salir"
						sleep 2
					else
						userdel $nom
						echo " "						
						useradd -g $grup $nom 
						log
						echo "Su usuario es $nom y grupo $grup "
						sleep 2
						echo "Presione ENTER para salir"
						sleep 2
		                fi
			else
		
				echo " "
				echo "Presione ENTER para salir"
				sleep 2
		fi		
	else
		echo " "
		echo "No se puede realizar, el usuario ya existe"
		echo "Presione ENTER para salir"
		sleep 2		
	
fi

#######################################################


#Funcion LOG

# Fecha y hora del script, se usa para el log.
DATE=`date +%F`
TIME=`date +%H:%M`

# Rura del fichero de LOG
LOG="/var/log/GestionDeUsuairo_$DATE.log"

echo "Se ha creado el usuario $nom el día $DATE a las $TIME">>$LOG
