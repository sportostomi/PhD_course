#!bin/bash

# Count total number of species ids and show them in descending order from given file
# Usage: bash homework4.sh filename number_to_show

grep -v "species_id" "$1" | awk -F',' '$6{print $0}' | cut -d , -f 6 | sort -n | uniq -c | sort -r > results4.csv
# fejléc eltávolítása $1 fájlból | üres sorok eltüntetése, ahol nincs species_id | species_id oszlop | sorbarendezés, hogy a uniq működjön | összegzés uniq-kal | csökkenő sorbarendezés > eredmény mentése

echo "A leggyakoribb" $2 "megfigyelt faj a következő fájlban: " $1
head -n "$2" results4.csv | awk '{print $2}'
# $2 argumentumban megadott számú eredmény kiírása, kizárólag a species_id-kat listázva
echo "Az összes megfigyelés eredményét megtalálja a "results4.csv" fájlban."
