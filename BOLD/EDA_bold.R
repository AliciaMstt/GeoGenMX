setwd( "/home/lmalpica/Desktop/CONABIO/BOLD")
library(readr)
library(dplyr)
library(tidyr)

#Esto se corre 1 sola vez para limpiar los datos y generar un csv con los datos corregidos 
bold_data <- read_delim("./bold_data.tsv", "\t", escape_double = FALSE, trim_ws = TRUE)
bold_data<-as.data.frame(bold_data)



#Cuando se hizo la consulta en ncbi por id de los phylum algunos  salieron con nombre diferente en el output 
#para facilidad en caso de volver a consultar ncbi se cambio el nombre al que arrojaba ncbi

bold_data[bold_data$phylum_name=="Chlorarachniophyta", 10]<-"Chlorarachniophyceae"
bold_data[bold_data$phylum_name=="Glomeromycota",10]<-"Glomeromycotina"
bold_data[bold_data$phylum_name=="Phoronida",10]<-"Phoroniformea"


#importar datos con los reinos 

phylumid_kingdom <- read_delim("~/Desktop/CONABIO/phylumid_kingdom.tsv",  "\t", escape_double = FALSE, col_names = FALSE, trim_ws = TRUE)
colnames(phylumid_kingdom)<-c("phylum_id", "phylum_name", "kingdom")
#Actinobacteria esta repetida porque al extraer los ids, NCBI lo regresa dos veces con ids diferentes uno en el que se refieren a
#Actinobacteria como phylum (id:201174) y el otro en el que se refieren a Actinobacteria como clase, este ultimo se elimino
phylumid_kingdom<-phylumid_kingdom[-7,]


#Algunos phylum presentaban ambiguedad o en lugar de kingdom solo tenian superkingdom, para los NA busque a mano en la base de taxonomy o en alguna otra fuente 
#Rhodophyta = Taxonomy ncbi solo tiene superkingdom eukarya wiki pone plantae/protista
#Bacillariophyta =Taxonomy ncbi  superkingdom eukarya wiki pone protistas
#Foraminifera= Taxonomy ncbi eukarya wiki protista
#Chlorarachniophyceae= Taxonomy ncbi eukarya wiki protista
#Ciliophora=Taxonomy ncbi eukarya wiki protista
# superkingdom de acuerdo a ncbi taxonomy o kingdom de acuerdo a wiki para protistas y protista_plantae
phylumid_kingdom$kingdom[12]<-"Protista"
phylumid_kingdom$kingdom[13]<-"Protista"
phylumid_kingdom$kingdom[16]<-"Protista"
phylumid_kingdom$kingdom[17]<-"Protista"
phylumid_kingdom$kingdom[29]<-"Protista"

phylumid_kingdom$kingdom[4]<-"Bacteria"
phylumid_kingdom$kingdom[7]<-"Archaea"
phylumid_kingdom$kingdom[8]<-"Bacteria"
phylumid_kingdom$kingdom[15]<-"Archaea"

#no salen en ncbi agregar a mano
#Cryptophycophyta
#Heterokontophyta
#ochrophyta
#pinophyta
#pteridophyta
#pyrrophycophyta
#zygomycota de este solo aparecieron sus 4 subfilos en ncbi 
phylumid_kingdom[39,]<-c(NA, "Cryptophycophyta", "Protista")
phylumid_kingdom[40,]<-c(NA, "Heterokontophyta", "Protista")
phylumid_kingdom[41,]<-c(NA, "Ochrophyta", "Protista")
phylumid_kingdom[42,]<-c(NA, "Pinophyta", "Viridiplantae")
phylumid_kingdom[43,]<-c(NA, "Pteridophyta", "Viridiplantae")
phylumid_kingdom[44,]<-c(NA, "Pyrrophycophyta", "Protista")
phylumid_kingdom[45,]<-c(NA, "Zygomycota", "Fungi")

#Agrego columna kingdom
#get positions of matching phylum 
matched_phylum<-match(bold_data$phylum_name, phylumid_kingdom$phylum_name)
bold_data$kingdom<-phylumid_kingdom$kingdom[matched_phylum]

#Termina lo que se corre una sola vez para limpiar los datos 
#

#Sacar lista de secuencias por especie:
species_seqs<-as.data.frame(table(as.factor(bold_data$species_name)))
colnames(species_seqs)<- c("species_name", "number_seqs")
#Sacar numero de secuencias sin nombre de especie y agregarlas al data frame anterior
seqs_nospecies<-nrow(bold_data)-sum(species_seqs$number_seqs)
species_seqs<-cbind(as.character(species_seqs$species_name), species_seqs$number_seqs)
species_seqs<-as.data.frame(species_seqs)
nospecies<-cbind("No_species", seqs_nospecies)
colnames(nospecies)<-c("species_name", "number_seqs")
colnames(species_seqs)<-c("species_name", "number_seqs")
species_seqs<-rbind(species_seqs, nospecies)

#Agrupar resultados por phylum y kingdom y hacer conteo 
bold_phyl_king<-bold_data%>% group_by(phylum_name, kingdom) %>% summarise(n())
colnames(bold_phyl_king)<-c("Phylum", "Kingdom", "Num_seqs")
king_seqs<-bold_phyl_king%>%group_by(Kingdom)%>%summarise(sum(Num_seqs))
colnames(king_seqs)<-c("kingdom", "num_seqs")

#sacar lista de secuencias por phylum 
phylum_seqs<-as.data.frame(table(as.factor(bold_data$phylum_name)))
colnames(phylum_seqs)<-c("Phylum", "Num_seqs")
seqs_no_phyl<-nrow(bold_data)-sum(phylum_seqs$Num_seqs)


#Bar plot para seqs per phylum 
library(ggplot2)
library(plotly)
#que significa el stat="identity"
phylum_plot1<-ggplot(data=phylum_seqs[phylum_seqs$Num_seqs<=30,], aes(x=Phylum, y=Num_seqs, fill=Phylum)) +
  geom_bar(stat="identity")+ theme(axis.text.x = element_text(angle = 90))
phylum_plot2<-ggplot(data=phylum_seqs[phylum_seqs$Num_seqs>30 & phylum_seqs$Num_seqs<200,], aes(x=Phylum, y=Num_seqs, fill=Phylum)) +
  geom_bar(stat="identity")+ theme(axis.text.x = element_text(angle = 90)) 
phylum_plot3<-ggplot(data=phylum_seqs[phylum_seqs$Num_seqs>=200 & phylum_seqs$Num_seqs<1000,], aes(x=Phylum, y=Num_seqs, fill=Phylum)) +
  geom_bar(stat="identity")+ theme(axis.text.x = element_text(angle = 90)) 
phylum_plot4<-ggplot(data=phylum_seqs[phylum_seqs$Num_seqs>=1000,], aes(x=Phylum, y=Num_seqs, fill=Phylum)) +
  geom_bar(stat="identity")+ theme(axis.text.x = element_text(angle = 90)) 

king_plot1<-ggplot(data=king_seqs, aes(x=kingdom, y=num_seqs, fill=kingdom)) +
     geom_bar(stat="identity")+ theme(axis.text.x = element_text(angle = 90))
king_plot2<-ggplot(data=king_seqs[-4,], aes(x=kingdom, y=num_seqs, fill=kingdom)) +
  geom_bar(stat="identity")+ theme(axis.text.x = element_text(angle = 90))

#Hacer un subset de los datos que tienen lat y lon
bold_latlon<-bold_data[!is.na(bold_data$lon),]
bold_latlon<-bold_latlon[!is.na(bold_latlon$lat),]
#sacar cuantas secuencias hay sin lat lon
seqs_sin_latlon<-nrow(bold_data)-nrow(bold_latlon)

