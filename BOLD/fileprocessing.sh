#File descriptions


#bold_data.tsv contiene los registros descargados de BOLD, no se excluyo ningun grupo de organismos. 
#Genera lista con nombres de los phylu, 
cat bold_data.tsv | awk -F "\t" '{print $10}' | sort | uniq > bold_phylum.txt

#Esta lista la introduje en la pagina de taxonomy para obtener los ids y con estos recuperar los reinos de cada phylum
#Genera lista con ids de los phylum 
 cat tax_bold.txt | awk -F "\t" '{print  $7}' | sort | uniq > taxid.txt

