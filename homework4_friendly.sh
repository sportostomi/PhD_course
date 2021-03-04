#!bin/bash

# Count total number of species ids and show the given count of result in descending order from given file
# Usage: bash homework4_friendly.sh and follow the instructions

echo
read -p "Adja meg az elemezni kívánt fájl nevét! " filevar 
# argumentum helyett változóként olvastatom be a fájlnevet
echo
read -p "Adja meg a megjelenítendő eredmények számát! " count
# argumentum helyett változóként olvastatom be a kiírandó eredmények számát
echo
grep -v "species_id" $filevar | awk -F',' '$6{print $0}' | cut -d , -f 6 | sort -n | uniq -c | sort -r > results4.csv
# hasonlóan működik, mint a homework4.sh, csak a megadott változókra hivatkozom
echo "A leggyakoribb" $count "megfigyelt faj a következő fájlban: " $filevar
head -n $count results4.csv | awk '{print $2}'
echo
read -p "Szeretné megjeleníteni a megfigyelések számát is az egyes fajok mellett? (i/n) " choice
echo
case "$choice" in
	i|I ) head -n $count results4.csv;;
	n|N ) echo "Az eredményeket a későbbiekben is megtalálja a 'results4.csv' fájlban";;
	* ) echo "rossz gombot nyomott meg";;
esac
