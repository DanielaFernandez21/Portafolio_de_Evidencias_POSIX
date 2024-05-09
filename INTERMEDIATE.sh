#!/bin/bash

read -p "Coeficiente A: " A
read -p "Coeficiente B: " B
read -p "Coeficiente C: " C

# Si A es cero
if [ "$(echo "$A == 0" | bc)" -eq 1 ]; then
    echo "Coeficiente A no puede ser cero, no es una ecuación cuadrática."
    exit 1
fi

# Dentro de la raíz
discriminante=$(echo "scale=5; $B * $B - 4 * $A * $C" | bc)

if [ "$(echo "$discriminante < 0" | bc)" -eq 1 ]; then
    echo "No tiene raíces reales"
    exit 0
fi

# Si raíz es 0
if [ "$(echo "$discriminante == 0" | bc)" -eq 1 ]; then
    res1=$(echo "scale=5; -($B) / (2 * $A)" | bc -l)
    printf "RES: %.5f\n" $res1
    exit 0
fi

# Formula general
res1=$(echo "scale=5; (-($B) + sqrt($discriminante)) / (2 * $A)" | bc -l)
res2=$(echo "scale=5; (-($B) - sqrt($discriminante)) / (2 * $A)" | bc -l)

printf "RES 1: %.5f\n" $res1
printf "RES 2: %.5f\n" $res2


