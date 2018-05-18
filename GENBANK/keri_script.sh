#!/bin/bash
 
#SBATCH -p keri 
#SBATCH -n 1
#SBATCH --mem=3000

esearch -db nucleotide -query '/country="Mexico" NOT(homo sapiens [ORGN] OR viruses [ORGN] OR bacteria [ORGN] OR archaea [ORGN] OR protist [ORGN]) NOT(/country="New Mexico")'  |efetch -format gbc | xtract -insd  INSDSeq_primary-accession INSDSeq_locus INSDSeq_length INSDSeq_moltype INSDSeq_sequence INSDSeq_definition INSDSeq_organism INSDSeq_taxonomy source organism mol_type country lat_lon altitude db_xref> genbank_filtered.tsv

esearch -db nucleotide -query '/country="Mexico" NOT(/country="New Mexico")'  |efetch -format gbc | xtract -insd  INSDSeq_primary-accession INSDSeq_locus INSDSeq_length INSDSeq_moltype INSDSeq_sequence INSDSeq_definition INSDSeq_organism INSDSeq_taxonomy source organism mol_type country lat_lon altitude db_xref> genbank_all.tsv
