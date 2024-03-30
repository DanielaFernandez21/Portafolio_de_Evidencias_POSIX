#!/bin/bash

# Función para imprimir una línea decorativa
function imprimir_linea_decorativa {
    echo "********************************************"
}

# Función para mostrar las preguntas y opciones
function mostrar_pregunta {
    clear
    imprimir_linea_decorativa
    echo "Pregunta $((pregunta_actual + 1)): ${preguntas[$pregunta_actual]}"
    echo "Opciones:"
    for ((i=0; i<5; i++)); do
        echo "$((i+1))) ${respuestas[$pregunta_actual * 5 + i]}"
    done
    imprimir_linea_decorativa
}

# Función para realizar el turno de un jugador
function turno_jugador {
    local jugador="$1"
    local puntos_variable="puntos_$jugador"
    local errores_variable="errores_$jugador"
    local respuestas_correctas="respuestas_correctas_$jugador"

    for ((pregunta_actual=0; pregunta_actual<15; pregunta_actual++)); do
        mostrar_pregunta
        while true; do
            echo "Introduce el número de tu respuesta (1-5):"
            read respuesta

            # Verificar si la entrada es un número válido
            if ! [[ "$respuesta" =~ ^[1-5]$ ]]; then
                echo "Respuesta inválida. Introduce un número del 1 al 5."
                continue
            fi

            # Verificar si la respuesta es correcta
            local respuesta_correcta=${respuestas_correctas_indices[$pregunta_actual]}
            if [[ "$respuesta" -eq "$(($respuesta_correcta + 1))" ]]; then
                ((puntos_$jugador+=10))
                echo "¡Respuesta correcta! Has ganado 10 puntos."
            else
                ((errores_$jugador++))
                echo "Respuesta incorrecta."
            fi
            break # Salir del bucle mientras
        done
    done
}

# Inicialización de variables
preguntas=("¿Cuál es el comando para listar el contenido de un directorio en Bash?" "¿Cómo se crea un nuevo directorio en Bash?" "¿Cuál es el comando para eliminar un archivo en Bash?" "¿Cómo se cambia el nombre de un archivo en Bash?" "¿Qué comando se utiliza para mostrar el contenido de un archivo en Bash?" "¿Cómo se comprime un archivo en Bash?" "¿Cómo se descomprime un archivo comprimido en Bash?" "¿Cuál es el comando para buscar un archivo en Bash?" "¿Cómo se muestran las primeras líneas de un archivo en Bash?" "¿Cómo se muestra el manual de un comando en Bash?" "¿Cuál es el comando para detener un proceso en Bash?" "¿Cómo se calcula el espacio utilizado por un archivo en Bash?" "¿Qué comando se utiliza para buscar y reemplazar texto en un archivo en Bash?" "¿Cómo se lista todos los procesos en ejecución en Bash?" "¿Qué comando se utiliza para cambiar permisos de archivos en Bash?")
respuestas=(
    "1. ls"
    "2. dir"
    "3. cd"
    "4. cp"
    "5. mv"
    "1. create"
    "2. newdir"
    "3. mkdir"
    "4. touch"
    "5. mkfile"
    "1. rm"
    "2. del"
    "3. erase"
    "4. remove"
    "5. rmdir"
    "1. rename"
    "2. move"
    "3. change"
    "4. mv"
    "5. cp"
    "1. view"
    "2. cat"
    "3. display"
    "4. open"
    "5. less"
    "1. zip"
    "2. gzip"
    "3. tar"
    "4. rar"
    "5. compress"
    "1. unzip"
    "2. gunzip"
    "3. untar"
    "4. unrar"
    "5. uncompress"
    "1. find"
    "2. search"
    "3. locate"
    "4. grep"
    "5. query"
    "1. head"
    "2. top"
    "3. first"
    "4. begin"
    "5. start"
    "1. help"
    "2. manual"
    "3. man"
    "4. info"
    "5. guide"
    "1. halt"
    "2. stop"
    "3. kill"
    "4. end"
    "5. terminate"
    "1. size"
    "2. space"
    "3. used"
    "4. du"
    "5. df"
    "1. replace"
    "2. search"
    "3. sed"
    "4. grep"
    "5. awk"
    "1. list"
    "2. ps"
    "3. show"
    "4. processes"
    "5. running"
    "1. chmod"
    "2. chown"
    "3. chperm"
    "4. perm"
    "5. permiss"
)
respuestas_correctas_indices=(0 2 0 3 4 2 1 0 4 4 0 3 2 3 4)

# Inicialización de puntuaciones y errores
puntos_Jugador1=0
puntos_Jugador2=0
errores_Jugador1=0
errores_Jugador2=0

# Turno del primer jugador
turno_jugador "Jugador1"

# Turno del segundo jugador
turno_jugador "Jugador2"

# Determinar al ganador
puntos_totales_Jugador1=$((puntos_Jugador1))
puntos_totales_Jugador2=$((puntos_Jugador2))

# Imprimir resultados
clear
echo "Fin del juego"
echo "Puntuación final:"
echo "Jugador 1: $puntos_totales_Jugador1 puntos"
echo "Jugador 2: $puntos_totales_Jugador2 puntos"
if ((puntos_totales_Jugador1 > puntos_totales_Jugador2)); then
    echo "¡Jugador 1 gana!"
elif ((puntos_totales_Jugador2 > puntos_totales_Jugador1)); then
    echo "¡Jugador 2 gana!"
else
    echo "¡Es un empate!"
fi
