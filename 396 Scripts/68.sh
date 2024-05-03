#!/bin/bash
# for-loopcmd.sh: for-loop with [list]
# generated by command substitution.

NUMBERS="9 7 3 8 37.53"

# Utilizamos $() para la sustitución de comandos en lugar de comillas inversas
for number in $(echo "$NUMBERS")  # for number in 9 7 3 8 37.53
do
  echo -n "$number "
done

echo 
exit 0