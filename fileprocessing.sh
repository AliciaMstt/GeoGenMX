
#File descriptions


#bold_data.tsv contiene los registros descargados de BOLD, no se excluyo ningun grupo de organismos. 

#Archivos generados con el script que permite que no se desfacen las columnas, incompletos por ahora
#genbank_mexico_all.tsv
#genbank_mexico_filtered.tsv

sed 's/,/;/g' genbank_mexico_filtered.tsv > genbank_filtered0.tsv
sed 's/\t/,/g' genbank_filtered0.tsv > genbank_filtered1.csv
sed 's/-//g' genbank_filtered1.csv > genbank_filtered.csv




cat bold_data.tsv | awk -F "\t" '{print $10}' | sort | uniq > bold_phylum.txt
#esta lista la introduje en la pagina de taxonomy para obtener los ids y con estos recuperar los reinos de cada phylum
 cat tax_bold.txt | awk -F "\t" '{print  $7}' | sort | uniq > taxid.txt

]


#Quitar de la lista los identificadores de otras bases de datos (e.g. BOLD) 
cat tax_genbank | grep -P "^[[:digit:]]"  > tax_genbank1


#Poner los taxon de genebank en una linea con comas *aclarar bien como hace el reemplazo de newline
cat tax_genbank1 | awk '{printf "%s,",$0} END {print ""}' > tax_genbank.txt


