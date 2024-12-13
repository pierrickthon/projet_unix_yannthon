#!/bin/bash

INACTIVITY_PERIOD=$((10 * 24 * 60 * 60))  # 10 jours en secondes

UTILISATEURS=("Yann" "Nathan" "Kevin")

OLD_DATE=$(date -v -10d +%s)


for USER in "${UTILISATEURS[@]}"
do
    LAST_LOGIN=$(last -n 1 "$USER" | awk 'NR==1{print $5" "$6" "$7}')

    if [ -n "$LAST_LOGIN" ]; then
        LAST_LOGIN_TIMESTAMP=$(date -j -f "%b %d %Y" "$LAST_LOGIN" +%s)

        if [ "$LAST_LOGIN_TIMESTAMP" -lt "$OLD_DATE" ]; then
            echo "L'utilisateur $USER est inactif depuis plus de 90 jours. Suppression en cours..."

            sudo dscl . -delete "/Users/$USER"
            
            echo "L'utilisateur $USER a été supprimé."
        else
            echo "L'utilisateur $USER est actif ou n'est pas inactif depuis plus de 90 jours."
        fi
    else
        echo "L'utilisateur $USER est actif."
    fi
done
