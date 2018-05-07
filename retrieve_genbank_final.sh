esearch -db nucleotide -query "/country=Mexico NOT(homo sapiens [ORGN] OR viruses [ORGN] OR bacteria [ORGN] or archaea [ORGN] OR protist [ORGN])"


#output
#<ENTREZ_DIRECT>
 # <Db>nucleotide</Db>
 # <WebEnv>NCID_1_128369615_130.14.18.34_9001_1525713592_1383752644_0MetA0_S_MegaStore</WebEnv>
 # <QueryKey>1</QueryKey>
 # <Count>154708</Count>
 # <Step>1</Step>
#</ENTREZ_DIRECT>


#El formato gb (genbank) en modo xml organiza el archivo genbank en bloques definidos con xtract vas escogiendo los bloques y se acomodan en forma tabular 
#-pattern: escoge los bloques que representarán cada fila y de donde se seleccionara cada elemento para las columnas. En este caso cada resultado esta delimitado en un bloque de GBSeq 
#-element sirve para enumerar los elementos de cada resultado (fila o bloque seleccionado con -pattern) para cada columna se seleccionó:
#GBSeq_primary-accession = identificador único de la secuencia 
#GBSeq_primary-accession-version= identificador único de la secuencia con su versión, si se hace algún cambio a la secuencia el identificador, accession se mantiene igual pero se incrementa el número de versión
#GBSeq_locus= Nombre del locus
#GBSeq_length = longitud de la secuencia
#GBSeq_moltype = tipo de seuencia (DNA, RNA, etc)
#GBSeq_sequence = la secuencia 
#GBSeq_source =organismo del que se obtuvo la secuencia, puede incluir el nombre común del organismo
#GBSeq_organism =organismo del que se obtuvo la secuencia (nombre científico)
#GBSeq_taxonomy = descripción taxonómica del organismo
#Los qualifiers, que contienen más información de la anotación del gen están en el bloque GBQualifier y cada uno está formado por el nombre, delimitado por GBQualifier_name y por el valor, delimitado por GBQualifier_value
#Para obtenerlos se usa el formato : 
# -block GBQualifier -if GBQualifier_name -equals nombre_qualifier -element GBQualifier_value 
#Ejemplo de un solo registro:
esearch -db nucleotide -query "MF993434.1" |efetch -format gb -mode xml | xtract -pattern GBSeq -element GBSeq_primary-accession GBSeq_accession-version GBSeq_locus GBSeq_length GBSeq_moltype GBSeq_sequence GBSeq_source GBSeq_organism GBSeq_taxonomy -block GBQualifier -if GBQualifier_name -equals country -element GBQualifier_value -block GBQualifier -if GBQualifier_name -equals lat_lon -element GBQualifier_value -block GBQualifier -if GBQualifier_name -equals altitude -element GBQualifier_value -block GBQualifier -if GBQualifier_name -equals mol_type -element GBQualifier_value -block GBQualifier -if GBQualifier_name -equals product -element GBQualifier_value -block GBQualifier -if GBQualifier_name -equals db_xref -element GBQualifier_value 



#output
#MF993434	MF993434.1	MF993434	554	DNA	tcgtaacaaggtttccgtaggtgaacctgcggaaggatcattacctagagtttgtggacttcggtctgctacctcttacccatgtcttttgagtaccttcgtttcctcggcgggtccgcccgccggttggacaacattcaaaccctttgcagttgcaatcagcgtctgaaaaaacttaatagttacaactttcaacaacggatctcttggttctggcatcgatgaagaacgcagcgaaatgcgataagtagtgtgaattgcagaattcagtgaatcatcgaatctttgaacgcacattgcgccccttggtattccatggggcatgcctgttcgagcgtcatttgtaccttcaagctctgcttggtgttgggtgttttgtctcgcctccgcgcgcagactcgccttaaaacaattggcagccggcgtattgatttcggagcgcagtacatctcgcgctttgcactcataacgacgacgtccaaaagtacatttttacactcttgacctcggatcaggtagggatacccgctgaacttaagcatatcaataagcgg	Epicoccum nigrum	Epicoccum nigrum	Eukaryota; Fungi; Dikarya; Ascomycota; Pezizomycotina; Dothideomycetes; Pleosporomycetidae; Pleosporales; Pleosporineae; Didymellaceae; Epicoccum	Mexico: Michoacan, Los Reyes de Salgado19.61 N 102.48 W	1282 m	genomic DNA	18S ribosomal RNA	internal transcribed spacer 1	5.8S ribosomal RNA	internal transcribed spacer 2	28S ribosomal RNA	taxon:105696





#Obtener todos los de México, quitando homo sapiens, virus, bacteria, archaea y protistas.
esearch -db nucleotide -query "/country=Mexico NOT(homo sapiens [ORGN] OR viruses [ORGN] OR bacteria [ORGN] or archaea [ORGN] OR protist [ORGN])" |efetch -format gb -mode xml | xtract -pattern GBSeq -element GBSeq_primary-accession GBSeq_accession-version GBSeq_locus GBSeq_length GBSeq_moltype GBSeq_sequence GBSeq_source GBSeq_organism GBSeq_taxonomy -block GBQualifier -if GBQualifier_name -equals country -element GBQualifier_value -block GBQualifier -if GBQualifier_name -equals lat_lon -element GBQualifier_value -block GBQualifier -if GBQualifier_name -equals altitude -element GBQualifier_value -block GBQualifier -if GBQualifier_name -equals mol_type -element GBQualifier_value -block GBQualifier -if GBQualifier_name -equals product -element GBQualifier_value -block GBQualifier -if GBQualifier_name -equals db_xref -element GBQualifier_value > mexico_genbank_filteredspecies.tsv
