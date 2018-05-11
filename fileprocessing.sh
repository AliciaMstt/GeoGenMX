
#File descriptions


#bold_data.tsv contiene los registros descargados de BOLD, no se excluyo ningun grupo de organismos. 

#Archivos generados con el script que permite que no se desfacen las columnas, incompletos por ahora
#genbank_mexico_all.tsv
#genbank_mexico_filtered.tsv

sed 's/,/;/g' bold_data.tsv > bold_data1.tsv
sed 's/\t/,/g' bold_data1.tsv > bold_data.csv




cat bold_data.tsv | awk -F "\t" '{print $10}' | sort | uniq > bold_phylum.txt
#esta lista la introduje en la pagina de taxonomy para obtener los ids y con estos recuperar los reinos de cada phylum
 cat tax_bold.txt | awk -F "\t" '{print  $7}' | sort | uniq > taxid.txt

]


#Ejemplo sacar reino de un solo phylum
efetch -db taxonomy -id 7711 -format xml | xtract -pattern Taxon -block "*/Taxon" -if Rank -equals kingdom -element ScientificName

#sacar los reinos para los demas phylum
efetch -db taxonomy -id 10190,10232,120557,1224,1264859,13809,1760,183924,20117414504,27563,2763,2836,287987,28889,29178,29197,3041,3195,3208,3398,35493,451507,451827,451828,4890,5204,58020,5878,6040,6073,6157,6231,6340,6447,6656,7586,7711 -format xml | xtract -pattern Taxon -element TaxId ScientificName -block "*/Taxon" -if Rank -equals kingdom -element ScientificName > phylumid_kingdom.tsv

