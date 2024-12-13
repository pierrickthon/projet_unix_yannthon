#!/bin/bash

utilisateurs=("Yann" "Kevin" "Tom" "Yanis")

for utilisateur in "${utilisateurs[@]}"; do
    echo "Création de l'utilisateur : $utilisateur"
    sudo useradd -m -s /bin/bash "$utilisateur"

    if [ $? -eq 0 ]; then
        echo "Utilisateur $utilisateur créé avec succès !"
    else
        echo "Erreur lors de la création de l'utilisateur $utilisateur."
    fi
done

echo "Tous les utilisateurs ont été crées."