BOLD data files.

1)bold_data.tsv : data downloaded manually directly from BOLD after introducing the query for "Mexico"
2)bold_phylum.txt : list of unique phylums obtained from bold_data.tsv
3)tax_bold.txt : plain text file downloaded from NCBI Taxonomy after uploading the file bold_phylum.txt as a query 
4)taxid.txt : plain text file with the ids for the bold phylums obtained from the file tax_bold.txt. 
5)phylumid_kingdom.tsv: file with all the phylums, their NCBI Taxonomy ids and their Kingdom. 
6)bold_data.csv : the same data contained in bold_data.tsv with some Taxonomy information added manually and the column kingdom added from the data available at NCBI Taxonomy
7)taxinfo_bold.csv : complete taxonomic info from bold data, with data from ncbi for phylum and kingdom (since kingdom wasn't reported in the original data)
8)bold_complete.csv : complete data from bold with the taxonomic information unified to the information on genbank.
9) bold_ph.csv: filters phyla, model organisms and synthesizes the information of the original marker columns into a single column
