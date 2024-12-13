#!/bin/bash


USER_FILE="users.txt"


while IFS=: read -r username group shell homedir; do
    if id "$username" &>/dev/null; then
       
        usermod -g "$group" -s "$shell" -d "$homedir" "$username"
        echo "Utilisateur $username modifié."
    else
        
        sudo useradd -m -g "$group" -s "$shell" -d "$homedir" "$username"
        echo "Utilisateur $username ajouté."
    fi

    
    password=$(openssl rand -base64 12)
    echo "$username:$password" | chpasswd
    echo "Mot de passe pour $username: $password"

   
done < "$USER_FILE"