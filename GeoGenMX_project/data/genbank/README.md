#Readme

###Data files:

1) genbank_metazoa.tsv : This file contains all the data with the filters "Mexico" and "Metazoa" directly downloaded from GENBANK. 

2) fungi_genbank.tsv : This file contains all the data with the filters "Mexico" and "Fungi" directly downloaded from GENBANK.

3) genbank_viridiplantae.tsv : This file contains all the data with the filters "Mexico" and "Viridiplantae" directly downloaded from GENBANK.

4) other_genbank.tsv : This file contains all the data with the filters "Mexico" with filters to exclude "bacteria", "viridplantae", "metazoa" and "fungi" directly downloaded from GENBANK.

5)genbank_euk.tsv: this file contains all the data directly downloaded from genbank in files 1, 2, 3 and 4 combined.

6)genbank_euk_Mexico.tsv : This file takes the data from genbank_euk.tsv and filters it to exclude any data that doesn't contain the annotation "Mexico", it also excludes data with the annotation "USA" and "New Mexico".

genbank_euk_Mexico.tsv is divided into three files grouping the data by the number of columns they have:

7)genbank_14.tsv : Data with 14 columns (missing the column "sequence")

8)genbank_15.tsv : Data with 15 columns

9)genbank_16.tsv: Data with 16 columns (has an extra column with an additional ID, which is in most cases a BOLD ID)

10)genbank_euk.csv: This data contains the data from files 7, 8 and 9 combined, after adding the columns that were missing in each data set and filling them with NA. 

11)tax_genbank: list of unique taxon id's from genbank, taken from the file genbank_euk.csv.



12)tax_nongenbank: list of taxon id's that are not from genbank

Tax_processing folder: contains all intermediate files used in the process of downloading and cleaning the additional taxonomic information

13)tax_genbank_info.tsv : 1st tsv file downloaded using the ids in tax_genbank

14)tax_genbank_infou.tsv : it is the tax_genbank_info.tsv after removing duplicated records (for details see 3_taxonomic_info.Rmd)

15)tax_genbank_sorted: ids from file tax_genbank sorted

16)tax_genbank_info_ids: ids from the file tax_genbank_infou.tsv, some of the ids here do not appear in our original list tax_genbank, because there are just some cases where the record has 2 id's, and the list takes the one appearing in the first column (for further details see 3_taxonomic_info.Rmd)

17)missing_tax_ids: list of ids from our original list tax_genbank that are not in our downloaded list of ids tax_genbank_info_ids. Some of this (27 to be exact) are not really missing data, but instead data with two different id's (both of which appear in file 14), however when extracting the id columns from the tsv a different id was captured than the one originally in our list.

18)tax_info_missing.tsv: tsv file with all the information from the 31 ids found in file 17

19)tmp_tax: temporary file used to merge files 14 and 18.

20) taxinfo.tsv: complete information of all the ids, sorted and removing any duplicated records.

21)infotax_ncbi.tsv: data with taxonomic information, in correct format, and with some of the missing data manually added.

22)genbank_complete.csv : data retrieved from genbank, merged with its complete taxonomic information, per individual sequence.

23) taxonomic_info_sk_latlon.csv: contains, the empty fields of data of species with latitude and longitude but incomplete taxonomic information (missing kingdom), the goal is to fill it out by hand little by little or complete it with BOLD information.
