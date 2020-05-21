Para descargar las secuencias de genbank se usó la herramienta de NCBI entrez utilities. 
Se instala así:
```
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
```

To make the data download more manageable it was divided in parts by groups of organisms, the priority at the moment are eukaryotes:

-metazoa
-viridiplantae
-fungi
-other

The download was made using the CONABIO bioinformatics server Keri. The scripts sent to keri can be found in the keri_scripts folder of this project.

The Entrez commands for executed to download each group of organisms were the following:
The following commands would be run in the folder /data:
For metazoa:
```
esearch -db nucleotide -query '/country="Mexico" NOT(/country="New Mexico") AND metazoa[ORGN]'  |efetch -format gbc | xtract -insd  INSDSeq_primary-accession INSDSeq_locus INSDSeq_length INSDSeq_moltype INSDSeq_sequence INSDSeq_definition INSDSeq_organism INSDSeq_taxonomy source organism mol_type country lat_lon altitude db_xref > genbank_metazoa.tsv
```

For fungi:

```
esearch -db nucleotide -query '/country="Mexico" NOT(/country="New Mexico") AND fungi[ORGN]'  |efetch -format gbc | xtract -insd  INSDSeq_primary-accession INSDSeq_locus INSDSeq_length INSDSeq_moltype INSDSeq_sequence INSDSeq_definition INSDSeq_organism INSDSeq_taxonomy source organism mol_type country lat_lon altitude db_xref > genbank_fungi.tsv
```

For viridiplantae:
```
esearch -db nucleotide -query '/country="Mexico" NOT(/country="New Mexico") AND viridiplantae[ORGN]'  |efetch -format gbc | xtract -insd  INSDSeq_primary-accession INSDSeq_locus INSDSeq_length INSDSeq_moltype INSDSeq_sequence INSDSeq_definition INSDSeq_organism INSDSeq_taxonomy source organism mol_type country lat_lon altitude db_xref > genbank_viridiplantae.tsv
```

For other eukaryotes:
```
esearch -db nucleotide -query '/country="Mexico" NOT(/country="New Mexico" OR fungi[ORGN] OR viridiplantae[ORGN] OR metazoa[ORGN] OR bacteria[ORGN])'  |efetch -format gbc | xtract -insd  INSDSeq_primary-accession INSDSeq_locus INSDSeq_length INSDSeq_moltype INSDSeq_sequence INSDSeq_definition INSDSeq_organism INSDSeq_taxonomy source organism mol_type country lat_lon altitude db_xref > other_genbank.tsv
```

Each of these files can be found in the folder /data/genbank.

With  the following shell instructions these files were joined together into one:

These instructions are run within the folder /data/genbank
```
 
cat fungi_genbank.tsv > genbank_euk.tsv
cat genbank_metazoa.tsv >> genbank_euk.tsv
cat genbank_viridiplantae.tsv >> genbank_euk.tsv
cat other_genbank.tsv >> genbank_euk.tsv

```

This file can also be found at the folder /data/genbank.

