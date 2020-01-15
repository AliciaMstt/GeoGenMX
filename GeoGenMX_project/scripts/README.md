Scripts
1) 1_retrieve_genbank.md: Contains all the instructions to download the data from genbank, and the files generated.
2) 2_clean_genbank.Rmd: Contains all the instructions to clean and process the raw data downloaded from genbank.
3) 3_taxonomic_info.Rmd: The taxonomic information is downloaded, then processed and formatted, and some of the missing information is manually added. 
4) 3.1_entrez_edirect_note.sh: Note on running Entrez utilities.
5) 4_merge_all_genbank.Rmd: Merges the data collected  on taxonomic information with the data retrieved from genbank and writes it out to the file genbank_complete.csv
6) 5_EDA_genbank.Rmd: explore the data and view missing fields, write file taxonomic_info_sk_latlon.csv which contains, the empty fields of data of species with latitude and longitude but incomplete taxonomic information (missing kingdom)