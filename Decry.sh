#!/bin/bash

# Definir variables
HASH="5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8"
DICCIONARIO="rockyou.txt"
FORMATOS=("0" "1000" "1400" "1600" "1800" "18500")

# Función para realizar ataque de fuerza bruta con hashcat
ataque_hashcat() {
  echo "Probando formatos de hash con hashcat..."
  for FORMATO in "${FORMATOS[@]}"; do
    echo "Probando formato $FORMATO..."
    hashcat -m $FORMATO -a 0 $HASH $DICCIONARIO --force
  done
}

# Función para realizar ataque de fuerza bruta con john
ataque_john() {
  echo "Probando con john..."
  john --wordlist=$DICCIONARIO --format=raw-md5 $HASH
}

# Función para descifrar el hash con john
descifrar_hash() {
  echo "Descifrando el hash..."
  john --show $HASH
}

# Realizar ataques de fuerza bruta y descifrar el hash
echo "Iniciando ataques de fuerza bruta y descifrado del hash..."
ataque_hashcat
ataque_john
descifrar_hash

# Mostrar mensaje de finalización
echo "Proceso completado."
