#!/bin/bash

while true; do
    clear
    echo "===== MENÚ DE SERVICIOS ====="
    echo "1. Listar el contenido de una carpeta"
    echo "2. Crear un archivo de texto con una línea"
    echo "3. Comparar dos archivos de texto"
    echo "4. Mostrar ejemplo con 'awk'"
    echo "5. Mostrar ejemplo con 'grep'"
    echo "6. Salir"
    echo "============================="
    read -p "Elige una opción (1-6): " opcion

    case $opcion in
        1)
            read -p "Introduce la ruta absoluta del directorio: " ruta
            if [ -d "$ruta" ]; then
                echo "Contenido de $ruta:"
                ls "$ruta"
            else
                echo "El directorio no existe."
            fi
            ;;
        2)
            read -p "Introduce el nombre del archivo (con extensión): " archivo
            read -p "Introduce la línea de texto a guardar: " linea
            echo "$linea" > "$archivo"
            echo "Archivo '$archivo' creado con el contenido."
            ;;
        3)
            read -p "Introduce la ruta del primer archivo: " archivo1
            read -p "Introduce la ruta del segundo archivo: " archivo2
            if [ -f "$archivo1" ] && [ -f "$archivo2" ]; then
                echo "Comparando archivos..."
                diff "$archivo1" "$archivo2"
            else
                echo "Uno o ambos archivos no existen."
            fi
            ;;
        4)
            echo "Ejemplo con awk:"
            echo -e "nombre edad\nDiana 23\nLuis 30" > datos.txt
            echo "Contenido del archivo 'datos.txt':"
            cat datos.txt
            echo "Usando awk para mostrar solo los nombres:"
            awk '{print $1}' datos.txt
            ;;
        5)
            echo "Ejemplo con grep:"
            echo -e "Hola mundo\nAdiós mundo\nHola Diana" > saludos.txt
            echo "Contenido del archivo 'saludos.txt':"
            cat saludos.txt
            echo "Buscando líneas que contienen 'Hola':"
            grep "Hola" saludos.txt
            ;;
        6)
            echo "¡Hasta luego!"
            break
            ;;
        *)
            echo "Opción no válida. Intenta de nuevo."
            ;;
    esac

    echo ""
    read -p "Presiona Enter para continuar..."
done
