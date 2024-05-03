#!/bin/bash

while true; do
    echo -e "\nBienvenido al menú de opciones"
    echo "Seleccione una opción del Capítulo:"
    echo -e "\e[32m2. Cap 2\e[0m"
    echo -e "\e[33m3. Cap 3\e[0m"
    echo -e "\e[34m4. Cap 4\e[0m"
    echo -e "\e[35m5. Cap 5\e[0m"
    echo -e "\e[36m6. Cap 6\e[0m"
    echo -e "\e[37m7. Cap 7\e[0m"
    echo -e "\e[31m8. Cap 8\e[0m"
    echo -e "\e[32m9. Cap 9\e[0m"
    echo -e "\e[33m10. Cap 10\e[0m"
    echo -e "\e[34m11. Cap 11\e[0m"
    echo -e "\e[35m12. Cap 12\e[0m"
    echo -e "\e[36m13. Cap 13\e[0m"
    echo -e "\e[37m15. Cap 15\e[0m"
    echo -e "\e[31m16. Cap 16\e[0m"
    echo -e "\e[32m17. Cap 17\e[0m"
    echo -e "\e[33m19. Cap 19\e[0m"
    echo -e "\e[34m20. Cap 20\e[0m"
    echo -e "\e[35m21. Cap 21\e[0m"
    echo -e "\e[36m22. Cap 22\e[0m"
    echo -e "\e[37m23. Cap 23\e[0m"
    echo -e "\e[31m24. Cap 24\e[0m"
    echo -e "\e[32m25. Cap 25\e[0m"
    echo -e "\e[33m26. Cap 26\e[0m"
    echo -e "\e[34m27. Cap 27\e[0m"
    echo -e "\e[35m28. Cap 28\e[0m"
    echo -e "\e[36m29. Cap 29\e[0m"
    echo -e "\e[37m30. Cap 30\e[0m"
    echo -e "\e[31m31. Cap 31\e[0m"
    echo -e "\e[32m32. Cap 32\e[0m"
    echo -e "\e[33m34. Cap 34\e[0m"
    echo -e "\e[34m36. Cap 36\e[0m"
    echo -e "\e[35m37. Cap 37\e[0m"
    echo -e "\e[31mSalir. Salir del menú\e[0m"

    read -p "Seleccione una opción: " opcion

    case $opcion in
        2) sudo ./2.sh ;;
        3) sudo ./6.sh ;;
        4) sudo ./8.sh ;;
        5) sudo ./15.sh ;;
        6) sudo ./19.sh ;;
        7) sudo ./22.sh ;;
        8) sudo ./28.sh ;;
        9) sudo ./50.sh ;;
        10) sudo ./62.sh ;;
        11) sudo ./94.sh ;;
        12) sudo ./131.sh ;;
        13) sudo ./97.sh ;;
        15) sudo ./124.sh ;;
        16) sudo ./187.sh ;;
        17) sudo ./210.sh ;;
        19) sudo ./224.sh ;;
        20) sudo ./225.sh ;;
        21) sudo ./228.sh ;;
        22) sudo ./229.sh ;;
        23) sudo ./231.sh ;;
        24) sudo ./249.sh ;;
        25) 
            read -p "Introduzca el primer argumento: " arg1
            read -p "Introduzca el segundo argumento: " arg2
            sudo ./250.sh "$arg1" "$arg2"
            ;;
        26) sudo ./259.sh ;;
        27) sudo ./270.sh ;;
        28) sudo ./275.sh ;;
        29) sudo ./277.sh ;;
        30) sudo ./279.sh ;;
        31) sudo ./287.sh ;;
        32) sudo ./290.sh ;;
        34) sudo ./292.sh ;;
        36) sudo ./305.sh ;;
        37) sudo ./316.sh ;;
        Salir) 
            echo "Saliendo del menú..."
            break ;;
        *) echo "Opción no válida";;
    esac

    sleep 2
done


