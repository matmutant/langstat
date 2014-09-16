#!/bin/bash
#titre
clear
echo -e "\033[1;31mLanguage statistics script for Linux\033[0m"
echo
#teste la présence d'au moins un paramètre
if [ -z $1 ]; then
	echo -e "\033[1;31mIl faut au moins 1 paramètre\033[0m"
        echo "Afficher l'aide avec le paramètre --help"
	exit 1
else
	echo -e "Vous avez lancé $0, il y a $#  paramètre(s)"
	echo -e "Le paramètre 1 est $1"
fi
#affiche l'aide
#NB: en cas d'absence de second paramètre une erreur est retournée, celle-ci est automatiquement eliminée
if [ $1 = "--help" ] || [ $2 = "--help" ] 2> /dev/null
	then
	echo
	echo -e "\033[1;31mAide et Support\033[0m"
	echo -e "Les paramètres disponibles :"
	echo -e "syntaxe : \033[1m./langstat.sh \033[0;31m \033[0;4mfichier\033[0m [\033[0;4moptions\033[0m]"
	echo
	echo -e "le fichier à traiter dans le répertoire courant (ex : dico.txt)"
	echo -e "	--osef pour afficher le résultat sans tri décroissant préalable"
	echo -e "	--help pour afficher l'aide"
	echo
	exit 1
fi
#vérifie que le paramètre 1 est bien un fichier.
if [ ! -f $1 ] ; then
	echo -e "\033[1;31mLe fichier n'existe pas\033[0m"
	echo -e "Recommencez avec un nom de fichier valide"
exit 1
else
#Choix du type d'affichage en fonction du second paramètre.
	if [ -z $2 ]; then
#arrange par ordre décroissant : 
		echo -e "Affichage des resultats par ordre décroissant."
		for lettre in {A..Z}; do
			echo "`grep -c $lettre $1` - $lettre"
		done | sort -rn

	elif [ $2 = "--osef" ]; then

		echo -e "Affichage des resultats sans tri."
		for lettre in {A..Z}; do
			echo "`grep -c $lettre $1` - $lettre"
		done

#si les paramètres ne correspondent pas une erreur est retournée
	else
		echo -e "\033[1;31m ERREUR DE SAISIE\033[0m"
	fi
fi
echo
exit 1
