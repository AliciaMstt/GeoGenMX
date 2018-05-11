
#File descriptions


#bold_data.tsv contiene los registros descargados de BOLD, no se excluyo ningun grupo de organismos. 

#Archivos generados con el script que permite que no se desfacen las columnas, incompletos por ahora
#genbank_mexico_all.tsv
#genbank_mexico_filtered.tsv

sed 's/,/;/g' bold_data.tsv > bold_data1.tsv
sed 's/\t/,/g' bold_data1.tsv > bold_data.csv


#get phylum names from bold

cat bold_data.tsv | awk -F "\t" '{print $10}' | sort | uniq > bold_phylum.txt
#esta lista la introduje en la pagina de taxonomy para obtener los ids y con estos recuperar los reinos de cada phylum
 cat tax_bold.txt | awk -F "\t" '{print  $7}' | sort | uniq > taxid.txt
