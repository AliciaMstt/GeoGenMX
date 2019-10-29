#!/bin/bash
 
#SBATCH -p keri 
#SBATCH -n 1
#SBATCH --mem=16000


esearch -db nucleotide -query '/country="Mexico" NOT(/country="New Mexico" OR fungi[ORGN] OR viridiplantae[ORGN] OR metazoa[ORGN] OR bacteria[ORGN])'  |efetch -format gbc | xtract -insd  INSDSeq_primary-accession INSDSeq_locus INSDSeq_length INSDSeq_moltype INSDSeq_sequence INSDSeq_definition INSDSeq_organism INSDSeq_taxonomy source organism mol_type country lat_lon altitude db_xref > other_genbank.tsv
