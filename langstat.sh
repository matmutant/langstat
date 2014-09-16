#!/bin/bash
#title
clear
echo -e "\033[1;31mLanguage statistics script for Linux\033[0m"
echo
#test if at least one option is present
if [ -z $1 ]; then
	echo -e "\033[1;31mNeeds at least 1 option\033[0m"
        echo "Display Help with --help"
	exit 1
else
	echo -e "You launched $0, there is $#  parameter(s)"
	echo -e "the first parameter is $1"
fi
#Displays Help
#NB: When there is no second option, an error is returned, but trashed automatically
if [ $1 = "--help" ] || [ $2 = "--help" ] 2> /dev/null
	then
	echo
	echo -e "\033[1;31mHelp\033[0m"
	echo -e "Available options:"
	echo -e "syntax : \033[1m./langstat.sh \033[0;31m \033[0;4mfile\033[0m [\033[0;4moptions\033[0m]"
	echo
	echo -e "The file to work on is in current folder (ex : dico.txt)"
	echo -e "	--osef To display results with no specific order"
	echo -e "	--help To display help"
	echo
	exit 1
fi
#makes sure that second option is really a file.
if [ ! -f $1 ] ; then
	echo -e "\033[1;31mFile does not exist\033[0m"
	echo -e "Retry with a valid file name"
exit 1
else
#Choice for display type depending on second option.
	if [ -z $2 ]; then
#order by higher>lower:
		echo -e "Results displayed from higher to lower."
		for letter in {A..Z}; do
			echo "`grep -c $letter $1` - $letter"
		done | sort -rn

	elif [ $2 = "--osef" ]; then

		echo -e "Results displayed by alphabetical order."
		for letter in {A..Z}; do
			echo "`grep -c $letter $1` - $letter"
		done
#If invalid options : error returned
	else
		echo -e "\033[1;31m SYNTAX ERROR\033[0m"
	fi
fi
echo
exit 1
