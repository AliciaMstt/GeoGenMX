setwd( "/home/lmalpica/Desktop/CONABIO")
library(readr)
library(tidyr)
library(magrittr)

#Lo que empieza a partir de aquí hasta la línea 89 se corrio una sola vez para corregir errores que surgieron en los datos 
#crudos
#Correcciones al tsv 
genbank_final <- read_delim("~/Desktop/CONABIO/genbank_final.tsv", 
                            "\t", escape_double = FALSE, col_names = FALSE, 
                            trim_ws = TRUE)

#Checar que no se hayan movido las columnas
unique(genbank_final$X5)
unique(genbank_final$X11)
#Separar las que estuvieran desfasadas 
genbank_final1<-genbank_final[genbank_final$X11!="Mexico",]
genbank_final2<-genbank_final[genbank_final$X11=="Mexico",]

#Quite las filas que tuvieran mexico en esa posicion y agregar columna para secuencias con NA
genbank_final1<-genbank_final[genbank_final$X11!="Mexico",]
genbank_final2<-genbank_final[genbank_final$X11=="Mexico",]
genbank2_1<-genbank_final2[,1:5]
genbank2_1$sequence<-NA
genbank2_2<-genbank_final2[,6:14]
genbank2<-cbind(genbank2_1,genbank2_2)
#Checar que no este desfasado 
unique(genbank2$X10)


#Asignar nombres de columnas y unir para tener de nuevo 1 solo df
colnames(genbank_final1)<-c("accession_v", "accession", "locus", "seq_len", "molecule", "sequence", "definition", "organism", "lineage", 
                            "organism_name", "mol_type", "country", "lat_lon", "altitude", "tax_id")
colnames(genbank2)<-c("accession_v", "accession", "locus", "seq_len", "molecule", "sequence", "definition", "organism", "lineage", 
                            "organism_name", "mol_type", "country", "lat_lon", "altitude", "tax_id")

genbank_df<-rbind(genbank_final1, genbank2)
write.csv(genbank_df, file="genbank_final.csv")



#Importar el nuevo csv y checar que no haya ningun warning 
genbank_final <- read_csv("~/Desktop/CONABIO/genbank_final.csv")
genbank_final<-as.data.frame(genbank_final)
#El unico warning fue para la primera columna que le puso el nombre X1
genbank_final<-genbank_final[,-1]

