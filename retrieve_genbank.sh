##Entrez Direct (EDirect) installation.
##Instalación de Entrez Direct de acuerdo al manual tomado de https://www.ncbi.nlm.nih.gov/books/NBK25501/pdf/Bookshelf_NBK25501.pdf el 29 de abril de 2018
 cd ~
 /bin/bash
 perl -MNet::FTP -e \
 '$ftp = new Net::FTP("ftp.ncbi.nlm.nih.gov", Passive => 1);
 $ftp->login; $ftp->binary;
 $ftp->get("/entrez/entrezdirect/edirect.tar.gz");'
 gunzip -c edirect.tar.gz | tar xf -
 rm edirect.tar.gz
 builtin exit
 export PATH=${PATH}:$HOME/edirect >& /dev/null || setenv PATH "${PATH}:$HOME/edirect"
 ./edirect/setup.sh


echo "source ~/.bash_profile" >> $HOME/.bashrc
echo "export PATH=\${PATH}:/home/lmalpica/edirect" >> $HOME/.bash_profile


 
#Busqueda
# esearch -db indica la base de datos se seleccionó nucleotide 
#El query fue Mexico y esta primera búsqueda arrojó un conteo de 1406277 resultados (ver 29-04-2018_shell_output.txt) 
#El primer filtro fue excluir secuencias de homo sapiens, de virus bacteria arquea y protistas, ya que incluir estos grupos de organismos en el análisis de biodiversidad va más allá del scope de este trabajo, con este filtro el conteo se redujo a 666239 resultados
#Ya teniendo el filtro efetch permite jalar todos los resultados, para esto se escogió el formato docsum, que te da los resultados en formato parecido a xml, este formato permite aplicar la funcion xtract
#Con la función xtract se transformaron los resultados anteriores a una forma tabular 
#Con -element se puede escoger que elementos del xml se quieren conservar y serán los nombres de las columnas para esto se seleccionaron los siguientes campos:
#AccessionVersion  te da el Accession (ID único en todo NCBI) de tu resultado 
#Id                Id de la secuencia en la base de datos nucleotide
#Organism          Organismo del que proviene la secuencia
#Subtype y Subname Estos tienen una serie de campos separados por tabuladores que varian de resultado a resultado en Subtype viene el nombre del campo y en Subname el valor, para los registros que cuentan con país y/o latitud-longitud aquí se puede encontrar
#Biomol MolType    Dicen el tipo de secuencia del que se trata (rna, dna, etc.) y de donde viene (mitocondria, genoma, etc.)
#Ya teniendo estos campos se filtró a conservar solamente los registros que tengan incluido el campo "country"
#Se vio que algunos de estos resultados tenían como valor en "country" otros paises entonces se filtró a que apareciera Mexico en el resultado
#Como en algunos casos Mexico aparece en campos diferentes se volverá a checar, al estandarizar el formato de las columnas, que el país efectivamente sea México, despues se filtro para excluir todo lo que tuviera como region New Mexico



##se tardo aproximadamente 1 hora en mi computadora y se recuperaron 398835 registros

esearch -db nucleotide -query "Mexico NOT(homo sapiens [ORGN] OR Viruses [ORGN] OR Bacteria [ORGN] or Archaea [ORGN] OR Protists [ORGN])" | efetch -format docsum  | xtract -pattern DocumentSummary -element AccessionVersion Id Organism SubType SubName Biomol MolType | grep "country" | grep "Mexico" | grep  -v "USA:New Mexico"  > genbank_mexico.out


esearch -db nucleotide -query "Mexico NOT(homo sapiens [ORGN] OR Viruses [ORGN] OR Bacteria [ORGN] or Archaea [ORGN] OR Protists [ORGN])" | efetch -format docsum  | xtract -pattern DocumentSummary -element AccessionVersion Id Organism SubType SubName Biomol MolType | grep "country" | grep "Mexico" | grep  -v "USA:New Mexico" | grep "" -c
cat genbank_mexico.out | grep "" -c


##De lo que pude notar al echarle un vistazo a los resultados, sigue habiendo mucho por depurar ya que las especies mas estudiadas dan muchas secuencias diferentes y aunque se excluyeron bacterias, virus, arqueas y protistas, me parece que algunas secuencias de estudios metagenómicos o de parásitos se colaron en los resultados, por ejemplo secuencias que tienen en el nombre del organismo "uncultured diatom clone", o resultados que en la anotación tienen una sección que indica el host. Me imagino que estos corresponden a hongos ver que filtros puedo aplicarles para quitar estos resultados. 


