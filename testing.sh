#!/bin/bash

# Function to validate a password
validate_password() {
    local password="$1"

    # Check length
    if [ ${#password} -lt 8 ]; then
        echo "Weak: Password must be at least 8 characters long."
        return 1
    fi

    # Check for at least one numeric character
    if ! [[ "$password" =~ [0-9] ]]; then
        echo "Weak: Password must contain at least one numeric character (0-9)."
        return 1
    fi

    if ! [[ "$password" =~ [\@\#\$\%\&\*\+\-\=] ]]; then
    echo "Weak: Password must contain at least one special character (@, #, $, %, &, *, +, -, =)."
    return 1
    fi

    # If all conditions are met, password is strong
    echo "Strong: Password meets the criteria."
    return 0
}

# Main 
echo "Please enter your password:"
read -s password 

echo
validate_password "$password"
exit $?
