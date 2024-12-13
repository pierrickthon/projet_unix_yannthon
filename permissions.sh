#!/bin/bash

REPERTOIRE_RH="/bin/zsh"
REPERTOIRE_MARKETING="/bin/zsh" 
REPERTOIRE_DEV="/bin/zsh"

sudo chmod +a "group:RH read" "$REPERTOIRE_RH"

sudo chmod +a "group:Marketing read,write" "$REPERTOIRE_MARKETING"

sudo chmod +a "group:Developpement read,execute" "$REPERTOIRE_DEV"

# Vérification des ACL
echo "Vérification des ACL pour le répertoire RH :"
ls -le "$REPERTOIRE_RH"
echo "Vérification des ACL pour le répertoire Marketing :"
ls -le "$REPERTOIRE_MARKETING"
echo "Vérification des ACL pour le répertoire Développement :"
ls -le "$REPERTOIRE_DEV"


# Utiliser le dscl sudo read pour lire les infos sur un groupe ou repertoire 
