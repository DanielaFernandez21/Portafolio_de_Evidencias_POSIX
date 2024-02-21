#!/bin/bash

# Verificar que se pase un argumento al script
if [ $# -ne 1 ]; then
    echo "Uso: $0 <nombre_del_archivo>"
    exit 1
fi

# Nombre del archivo
archivo="$1"

# Verificar si el archivo existe
if [ ! -e "$archivo" ]; then
    echo "El archivo '$archivo' no existe."
    exit 1
fi

# Información del archivo con el comando ls
info_archivo=$(ls -al "$archivo")

# Permisos del archivo
permisos=$(echo "$info_archivo" | awk '{print $1}')

# Tipo de archivo
tipo=$(echo "$info_archivo" | cut -c 1)

# Usuario y el grupo
usuario=$(echo "$info_archivo" | awk '{print $3}')
grupo=$(echo "$info_archivo" | awk '{print $4}')

# Ruta absoluta del archivo
ruta_absoluta=$(realpath "$archivo")

# Tamaño en bytes
tamanio_bytes=$(echo "$info_archivo" | awk '{print $5}')

# Fecha de creación del archivo
fecha_creacion=$(echo "$info_archivo" | awk '{print $6, $7, $8}')

# Imprimir el detalle del archivo
echo "Nombre: $archivo"
echo "Tipo: $(if [ $tipo == "-" ]; then echo "archivo"; else echo "directorio"; fi)"
echo "Fecha de creacion: $fecha_creacion"
echo "Tamaño en bytes: $tamanio_bytes bytes"
echo "Permisos:"
echo "    User($usuario): $(if [ ${permisos:1:1} == "r" ]; then echo "Lectura,"; fi) $(if [ ${permisos:2:1} == "w" ]; then echo "Escritura,"; fi) $(if [ ${permisos:3:1} == "x" ]; then echo "Ejecucion"; fi)"
echo "    Group($grupo): $(if [ ${permisos:4:1} == "r" ]; then echo "Lectura,"; fi) $(if [ ${permisos:5:1} == "w" ]; then echo "Escritura,"; fi) $(if [ ${permisos:6:1} == "x" ]; then echo "Ejecucion"; fi)"
echo "    Others: $(if [ ${permisos:7:1} == "r" ]; then echo "Lectura,"; fi) $(if [ ${permisos:8:1} == "w" ]; then echo "Escritura,"; fi) $(if [ ${permisos:9:1} == "x" ]; then echo "Ejecucion"; fi)"
