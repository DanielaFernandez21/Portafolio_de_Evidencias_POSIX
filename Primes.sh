#!/bin/bash

is_prime() {
    local num=$1
    if [ $num -le 1 ]; then
        return 1
    fi
    for ((i=2; i*i<=num; i++)); do
        if [ $((num%i)) -eq 0 ]; then
            return 1
        fi
    done
    return 0
}


count=0
for ((num=60000; num<=63000; num++)); do
    if is_prime "$num"; then
        printf "%-8d" "$num"
        count=$((count + 1))
        if ((count % 10 == 0 )); then
            echo
        fi
    fi
done

