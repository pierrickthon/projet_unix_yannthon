#!/bin/bash

sudo dscl . -create /Groups/RH
sudo dscl . -create /Groups/Marketing
sudo dscl . -create /Groups/Developpement
sudo dscl . -create /Groups/Informatique #ce groupe est vide; le supprimer pendant la démo
echo "Les groupes suivants ont été créés : RH, Marketing et Developpement"


sudo dscl . -append /Groups/RH GroupMembership Yann
sudo dscl . -append /Groups/Marketing GroupMembership Kévin
sudo dscl . -append /Groups/Developpement GroupMembership Tom
echo "Les utilisateurs Yann, Kévin et Tom ont été ajoutés à leurs groupes." 


