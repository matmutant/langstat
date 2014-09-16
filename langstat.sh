#!/bin/bash
#titre
echo -e "\033[1;31mLanguage statistics script for Linux\033[0m"
#test la présence d'au moins un paramètre
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
	echo -e "\033[1;31mAide et Support\033[0m"
	echo -e "Les paramètres disponibles"
	echo -e "syntaxe : \033[1m./langstat.sh \033[0;31m \033[0;4mfichier\033[0m [\033[0;4moptions\033[0m]"
	echo -e "le fichier à traiter dans le répertoire courant (ex : dico.txt)"
	echo -e "	--osef pour afficher le résultat sans tri préalable"
	echo -e "	--help pour afficher l'aide"
elif [ -z $2 ]; then
	if [ $1 = dico.txt ]; then
#créé le fichier temporaire
		touch resultat.txt
#récupre le contenu du fichier source
		texte="$(cat $1)"
#déclare l'array
		declare -A HODOR
#coupe le texte et transforme chaque ligne en variable pour la boucle imbriquée
		for word in $texte; do 
#recherche la présence des lettres dans chaque mot et incrémente
			for x in {A..Z}; do
			count="$(echo "$word" | grep -o "$x" | wc -l)"
        		if [[ "$count" != 0 ]]; then
        		    ((HODOR["$x"]++))
      			fi
    			done
		done
#ajoute le résultat à une nouvelle ligne
		for i in "${!HODOR[@]}"; do
 		   echo "${HODOR[$i]} : $i" >> resultat.txt
		done
	

#arrange par ordre décroissant : 
sort -rn ./resultat.txt

	else
		echo "plop"
	fi
elif [ $2 = "--osef" ]; then
	if [ $1 = dico2.txt ]; then
		echo -e "Affichage des resultats sans tri."
#créé le fichier temporaire
		touch resultat.txt
#récupère le contenu du fichier source
		texte="$(cat $1)"
#déclare l'array
		declare -A HODOR
#coupe le texte et transforme chaque ligne en variable pour la boucle imbriquée
		for word in $texte; do 
#recherche la présence des lettres dans chaque mot et incrémente
			for x in {A..Z}; do
			count="$(echo "$word" | grep -o "$x" | wc -l)"
        		if [[ "$count" != 0 ]]; then
        		    ((HODOR["$x"]++))
      			fi
    			done
		done
#ajoute le résultat à une nouvelle ligne
		for i in "${!HODOR[@]}"; do
 		   echo "${HODOR[$i]} : $i"
		done
	fi
#si les paramètres ne correspondent pas une erreur est retournée
else
	echo -e "\033[1;31m ERREUR DE SAISIE"
	exit 1
fi
rm -i resultat.txt
exit 1
