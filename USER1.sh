#!/bin/bash

echo "Bienvenido al Chat de la Unicaribe"
echo ""

ip="127.0.0.1"
port="12345"

while true; do
    read -p "User1: " message

    echo "$message" | nc -q 0 $ip $port

    received_message=$(nc -l -p $port)
    echo "User2: $received_message"
done

