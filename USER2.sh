#!/bin/bash

echo "Bienvenido al Chat de la Unicaribe"
echo ""

ip="127.0.0.1"
port="12345"

# Bucle principal
while true; do
    received_message=$(nc -l -p $port)
    echo "User1: $received_message"

    read -p "User2: " message

    echo "$message" | nc -q 0 $ip $port
done

