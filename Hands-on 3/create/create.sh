#!/bin/bash

echo "Hola Mundo" > mytext.txt
echo "Archivo mytext.txt creado."

echo "Contenido de mytext.txt:"
cat mytext.txt

if [ ! -d "backup" ]; then
    mkdir backup
    echo "Directorio backup creado."
else
    echo "El directorio backup ya existe."
fi


cp mytext.txt backup/
echo "Archivo copiado a backup."

echo "Contenido del directorio backup:"
ls backup

rm backup/mytext.txt
echo "Archivo mytext.txt eliminado de backup."

rmdir backup
echo "Directorio backup eliminado."

read -p "Presiona Enter para salir..."