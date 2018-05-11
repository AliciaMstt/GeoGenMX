setwd( "/home/lmalpica/Desktop/CONABIO")
library(readr)
bold_data <- read_delim("~/Desktop/CONABIO/bold_data.tsv", "\t", escape_double = FALSE, trim_ws = TRUE)
bold_data<-as.data.frame(bold_data)
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

#sacar lista de secuencias por phylum 
phylum_seqs<-as.data.frame(table(as.factor(bold_data$phylum_name)))
colnames(phylum_seqs)<-c("Phylum", "Num_seqs")
seqs_no_phyl<-nrow(bold_data)-sum(phylum_seqs$Freq)

#Hacer un subset de los datos que tienen lat y lon
bold_latlon<-bold_data[!is.na(bold_data$lon),]
bold_latlon<-bold_latlon[!is.na(bold_latlon$lat),]
#sacar cuantas secuencias hay sin lat lon
seqs_sin_latlon<-nrow(bold_data)-nrow(bold_latlon)


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

