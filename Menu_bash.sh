#!/bin/bash

mostrar_menu() {
    echo "Menú"
    echo "1. Crear árbol de directorios"
    echo "2. Ejecutar script de Hola Mundo"
    echo "3. Ejecutar script de Saludo usando variables"
    echo "4. Salir"
    echo "Ingrese su opción:"
}

crear_arbol_directorios() {
    echo "Creando árbol de directorios..."
  
    	sudo mkdir /home/danielafd/Escritorio/Arbol
	cd /home/danielafd/Escritorio/Arbol
	sudo mkdir Home
	cd Home
	sudo mkdir user
	cd user
	sudo mkdir biblia
	sudo touch corintios-4-16-txt
	sudo touch efecios-1-3.pdf
	sudo mkdir Tareas
	cd Tareas
	sudo mkdir las-de-tuxtter
	cd las-de-tuxtter
	sudo touch tarea-posix-xd.jpg
	sudo touch ss-vm-linux.jpg
	sudo touch carta-de-amor.txt
	cd ..
	sudo mkdir las-x
	cd las-x
	sudo touch Proyecto-terminal.pdf
	cd /home/danielafd/Escritorio/Arbol
	sudo mkdir user
	cd user
	sudo touch test.txt
	cd ..
	sudo mkdir urse
	cd urse
	sudo touch test2.txt
	cd ..
	sudo mkdir usuario
	cd usuario
	sudo mkdir escritorio
	cd escritorio
	sudo touch chrome.exe
	cd /home/danielafd/Escritorio/Arbol
	sudo mkdir hume
	cd hume
	sudo mkdir tareas
	cd tareas
	sudo mkdir primito
	cd primito
	sudo mkdir cocomelon
	cd cocomelon
	sudo touch SKIBIDO-TOILET-LA-PELI.mp4
	sudo touch Roblox.exe
	}

ejecutar_hola_mundo() {
    cd /
    cd $HOME
    pwd
    ls -al
    touch test.txt
    cp /home/danielafd/test.txt /home/danielafd/test2.txt
    mv /home/danielafd/test2.txt /home/danielafd/test3.txt
    rm /home/danielafd/test2.txt
    mkdir prueba
    mv /home/danielafd/test3.txt /home/danielafd/prueba
    cp -r /home/danielafd/prueba /home/danielafd/prueba2
    rm -r /home/danielafd/prueba
    mv /home/danielafd/test.txt /home/danielafd/prueba2
    cd /home/danielafd/prueba2
    vi /home/danielafd/test3.txt
    vi /home/danielafd/test4.txt
    cat /home/danielafd/test3.txt /home/danielafd/test4.txt > /home/danielafd/test4.txt
    clear
    whoami
    cat /home/danielafd/test3.txt
    netstat --help
    }

ejecutar_saludo_variables() {
    echo "Ingrese su nombre:"
    read nombre
    echo "¡Hola, $nombre!"
}

# Ciclo del menú
while true; do
    mostrar_menu
    read opcion

    case $opcion in
        1) crear_arbol_directorios ;;
        2) ejecutar_hola_mundo ;;
        3) ejecutar_saludo_variables ;;
        4) echo "Saliendo del menú. ¡Hasta luego!"; exit ;;
        *) echo "Opción inválida. Por favor, seleccione una opción válida." ;;
    esac
done
