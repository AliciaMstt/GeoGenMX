


#Quitar de la lista los identificadores de otras bases de datos (e.g. BOLD) 
cat tax_genbank | grep -P "^[[:digit:]]"  > tax_genbank1


#Poner los taxon de genebank en una linea con comas *aclarar bien como hace el reemplazo de newline
cat tax_genbank1 | awk '{printf "%s,",$0} END {print ""}' > tax_genbank.txt


