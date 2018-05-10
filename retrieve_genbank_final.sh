#esearch -db nucleotide -query "/country=Mexico NOT(homo sapiens [ORGN] OR viruses [ORGN] OR bacteria [ORGN] or archaea [ORGN] OR protist [ORGN])"


#output
#<ENTREZ_DIRECT>
 # <Db>nucleotide</Db>
 # <WebEnv>NCID_1_128369615_130.14.18.34_9001_1525713592_1383752644_0MetA0_S_MegaStore</WebEnv>
 # <QueryKey>1</QueryKey>
 # <Count>154708</Count>
 # <Step>1</Step>
#</ENTREZ_DIRECT>






#Obtener todos los de México, quitando homo sapiens, virus, bacteria, archaea y protistas.
#El formato gbc te da un formato parecido al de xml pero más fácil de procesar puedes acceder a las propiedades que quieres con el tag que les corresponde (INSDSeq_primary-accession, INSDSeq_locus, etc.)  y también te puedes ir a una región específica que contenga los qualifiers que te interesen, en este caso te vas a source y obtienes la anotación que te interesa en cuanto al organismo, el tipo de molécula, país, latitud y longitud, altitud y el identificador taxonómico.
#INSDXref_id doi de la publicacion 
#INSDReference_pubmed id de pubmed
#INSDReference_title titulo del articulo 
#INSDReference_journal journal de publicación del artículo
#INSDAuthor autores del artículo (separados por tabs)

esearch -db nucleotide -query "/country=Mexico NOT(homo sapiens [ORGN] OR viruses [ORGN] OR bacteria [ORGN] or archaea [ORGN] OR protist [ORGN])" |efetch -format gbc | xtract -insd  INSDSeq_primary-accession INSDSeq_locus INSDSeq_length INSDSeq_moltype INSDSeq_sequence INSDSeq_definition INSDSeq_organism INSDSeq_taxonomy INSDXref_id INSDReference_pubmed INSDReference_title INSDAuthor INSDReference_journal source organism mol_type country lat_lon altitude db_xref> genbank_mexico_filtered.tsv


esearch -db nucleotide -query "/country=Mexico" |efetch -format gbc |  xtract -insd  INSDSeq_primary-accession INSDSeq_locus INSDSeq_length INSDSeq_moltype INSDSeq_sequence INSDSeq_definition INSDSeq_organism INSDSeq_taxonomy INSDXref_id INSDReference_pubmed INSDReference_title INSDAuthor INSDReference_journal source organism mol_type country lat_lon altitude db_xref > genbank_mexico_all.tsv

