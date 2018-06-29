---
title: "EDA BOLD"
author: "Lorena Malpica"
date: "17 de mayo de 2018"
output: html_document
---

# Datos de BOLD

El dataset se descargó directamente desde la página de BOLD, haciendo la búsqueda para "México". 

El script EDA_bold.R se ocupó para hacer la primera exploración de los datos. Las partes de este script se irán explicando a continuación:

```{r}
setwd( "/home/lmalpica/Desktop/CONABIO")
library(readr)
library(dplyr)
library(tidyr)

bold_data <- read_delim("~/Desktop/CONABIO/bold_data.tsv", "\t", escape_double = FALSE, trim_ws = TRUE)
bold_data<-as.data.frame(bold_data)


```

En los pasos que siguen se vio una discrepancia entre los nombres de algunos phylum en BOLD y en NCBI, como la mayoría de los reinos se obtuvieron de taxonomy NCBI y además pensando en que despues todo va a ser una única base de datos, se modificaron a mano estos nombres:

```{r}

bold_data[bold_data$phylum_name=="Chlorarachniophyta", 10]<-"Chlorarachniophyceae"
bold_data[bold_data$phylum_name=="Glomeromycota",10]<-"Glomeromycotina"
bold_data[bold_data$phylum_name=="Phoronida",10]<-"Phoroniformea"


```


El script fileprocessing.sh contiene one-liners de bash que se ocuparon para buscar descargar los reinos de ncbi. 

Primero se generó una lista de los phylum:

```
cat bold_data.tsv | awk -F "\t" '{print $10}' | sort | uniq > bold_phylum.txt
```

Esta lista se introdujo en la página de taxonomy para crear una lista de los ids de cada phylum. Este archivo es tax_bold y tiene el id en la columna 7.

```
cat tax_bold.txt | awk -F "\t" '{print  $7}' | sort | uniq > taxid.txt
```

Con estos ids, utilizando entrez utilities se obtuvieron los reinos para cada phylum. Esto se hizo con el script retrieve_taxbold.sh


```
efetch -db taxonomy -id 10190,10232,120557,1224,1264859,13809,1760,183924,20117414504,27563,2763,2836,287987,28889,29178,29197,3041,3195,3208,3398,35493,451507,451827,451828,4890,5204,58020,5878,6040,6073,6157,6231,6340,6447,6656,7586,7711 -format xml | xtract -pattern Taxon -element TaxId ScientificName -block "*/Taxon" -if Rank -equals kingdom -element ScientificName > phylumid_kingdom.tsv
```

Se importan los datos de los reinos de cada phylum:

```{r}
phylumid_kingdom <- read_delim("~/Desktop/CONABIO/phylumid_kingdom.tsv",  "\t", escape_double = FALSE, col_names = FALSE, trim_ws = TRUE)
colnames(phylumid_kingdom)<-c("phylum_id", "phylum_name", "kingdom")

```

Ahora éstos se revisaron a mano y se modificaron algunos detalles:

Actinobacteria esta repetida porque al extraer los ids, NCBI lo regresa dos veces con ids diferentes uno en el que se refieren a:
1)Actinobacteria como phylum (id:201174)  
2)Actinobacteria como clase, este ultimo se elimino

```{r}
phylumid_kingdom<-phylumid_kingdom[-7,]
```


Algunos phylum no tienen información del kingdom en NCBI únicamente de superkingdom, además algunos tenían nada de información de ninguna de las dos cosas, en estos casos se buscó a mano y se puso la información encontrada en wiki por el momento, después se hará una búsqueda más detallada en la literatura.

Rhodophyta = Taxonomy NCBI solo tiene superkingdom eukarya wiki pone plantae/protista
Bacillariophyta =Taxonomy NCBI pone superkingdom eukarya wiki pone protista.
Foraminifera= Taxonomy NCBI pone eukarya wiki pone protista.
Chlorarachniophyceae= Taxonomy NCBI pone eukarya wiki pone protista.
Ciliophora=Taxonomy NCBI pone eukarya wiki protista.

Para Archea y Bacteria, Taxonomy NCBI las considera superkingdoms, por el momento se pusieron como kingdoms. 

```{r}
phylumid_kingdom$kingdom[12]<-"Protista"
phylumid_kingdom$kingdom[13]<-"Protista"
phylumid_kingdom$kingdom[16]<-"Protista"
phylumid_kingdom$kingdom[17]<-"Protista"
phylumid_kingdom$kingdom[29]<-"Protista"
phylumid_kingdom$kingdom[4]<-"Bacteria"
phylumid_kingdom$kingdom[7]<-"Archaea"
phylumid_kingdom$kingdom[8]<-"Bacteria"
phylumid_kingdom$kingdom[15]<-"Archaea"
```

Los siguientes phylum no aparecen en NCBI, la información por el momento viene de wiki, posteriormente se revisará la literatura. En el caso de Zygomicota en NCBI aparecen únicamente 4 subfilos, y son marcados como que pertenecen al reino Fungi.

```{r}
phylumid_kingdom[39,]<-c(NA, "Cryptophycophyta", "Protista")
phylumid_kingdom[40,]<-c(NA, "Heterokontophyta", "Protista")
phylumid_kingdom[41,]<-c(NA, "Ochrophyta", "Protista")
phylumid_kingdom[42,]<-c(NA, "Pinophyta", "Viridiplantae")
phylumid_kingdom[43,]<-c(NA, "Pteridophyta", "Viridiplantae")
phylumid_kingdom[44,]<-c(NA, "Pyrrophycophyta", "Protista")
phylumid_kingdom[45,]<-c(NA, "Zygomycota", "Fungi")

```

Se agrega la columna kingdom a los datos de BOLD:

```{r}
matched_phylum<-match(bold_data$phylum_name, phylumid_kingdom$phylum_name)
bold_data$kingdom<-phylumid_kingdom$kingdom[matched_phylum]
write.csv(bold_data, "/home/lmalpica/Desktop/CONABIO/bold_data_complete")

```

Obtener la lista de secuencias por especie y el número de secuencias sin nombre de la especie:

```{r}

species_seqs<-as.data.frame(table(as.factor(bold_data$species_name)))
colnames(species_seqs)<- c("species_name", "number_seqs")
seqs_nospecies<-nrow(bold_data)-sum(species_seqs$number_seqs)
species_seqs<-cbind(as.character(species_seqs$species_name), species_seqs$number_seqs)
species_seqs<-as.data.frame(species_seqs)
nospecies<-cbind("No_species", seqs_nospecies)
colnames(nospecies)<-c("species_name", "number_seqs")
colnames(species_seqs)<-c("species_name", "number_seqs")
species_seqs<-rbind(species_seqs, nospecies)

species_seqs
```

Agrupar los resultados por phylum y kingdom y hacer conteo:

```{r}
bold_phyl_king<-bold_data%>% group_by(phylum_name, kingdom) %>% summarise(n())
colnames(bold_phyl_king)<-c("Phylum", "Kingdom", "Num_seqs")
king_seqs<-bold_phyl_king%>%group_by(Kingdom)%>%summarise(sum(Num_seqs))
colnames(king_seqs)<-c("kingdom", "num_seqs")

```
Sacar lista de secuencias por phylum:

```{r}
phylum_seqs<-as.data.frame(table(as.factor(bold_data$phylum_name)))
colnames(phylum_seqs)<-c("Phylum", "Num_seqs")
seqs_no_phyl<-nrow(bold_data)-sum(phylum_seqs$Num_seqs)
```

Plots:
```{r}

library(ggplot2)
library(plotly)
library(grid)
library(gridExtra)

king_plot1<-ggplot(data=king_seqs, aes(x=kingdom, y=num_seqs, fill=kingdom)) +
     geom_bar(stat="identity")+ theme(axis.text.x = element_text(angle = 90))
king_plot2<-ggplot(data=king_seqs[-4,], aes(x=kingdom, y=num_seqs, fill=kingdom)) +
  geom_bar(stat="identity")+ theme(axis.text.x = element_text(angle = 90))



```

```{r king_plot1, echo=FALSE, warning=FALSE}
king_plot1
```

```{r king_plot2, echo=FALSE, warning=FALSE}
king_plot2
```


```{r}
library(ggplot2)
library(plotly)
library(grid)
library(gridExtra)
phylum_plot1<-ggplot(data=phylum_seqs[phylum_seqs$Num_seqs<=30,], aes(x=Phylum, y=Num_seqs, fill=Phylum)) +
  geom_bar(stat="identity")+ theme(axis.text.x = element_text(angle = 90))
phylum_plot2<-ggplot(data=phylum_seqs[phylum_seqs$Num_seqs>30 & phylum_seqs$Num_seqs<200,], aes(x=Phylum, y=Num_seqs, fill=Phylum)) +
  geom_bar(stat="identity")+ theme(axis.text.x = element_text(angle = 90)) 
phylum_plot3<-ggplot(data=phylum_seqs[phylum_seqs$Num_seqs>=200 & phylum_seqs$Num_seqs<1000,], aes(x=Phylum, y=Num_seqs, fill=Phylum)) +
  geom_bar(stat="identity")+ theme(axis.text.x = element_text(angle = 90)) 
phylum_plot4<-ggplot(data=phylum_seqs[phylum_seqs$Num_seqs>=1000,], aes(x=Phylum, y=Num_seqs, fill=Phylum)) +
  geom_bar(stat="identity")+ theme(axis.text.x = element_text(angle = 90)) 


```

```{r phylum_plot1, echo=FALSE, warning=FALSE}
phylum_plot1
```

```{r phylum_plot2, echo=FALSE, warning=FALSE}
phylum_plot2
```

```{r phylum_plot3, echo=FALSE, warning=FALSE}
phylum_plot3
```

```{r phylum_plot4, echo=FALSE, warning=FALSE}
phylum_plot4
```

Conteos de secuencias por clase para cada reino:

```{r}
bold_class_king<-bold_data%>% group_by(class_name, kingdom) %>% summarise(n())
colnames(bold_class_king)<-c("Class", "Kingdom", "Num_seqs")
classes_metazoa<-bold_class_king[bold_class_king$Kingdom=="Metazoa",]
classes_viridiplantae<-bold_class_king[bold_class_king$Kingdom=="Viridiplantae",]
classes_protista<-bold_class_king[bold_class_king$Kingdom=="Protista",]
classes_fungi<-bold_class_king[bold_class_king$Kingdom=="Fungi",]
classes_archaea<-bold_class_king[bold_class_king$Kingdom=="Archaea",]
classes_bacteria<-bold_class_king[bold_class_king$Kingdom=="Bacteria",]


```


Separar los datos que tienen información sobre latitud y longitud:
```{r}
bold_latlon<-bold_data[!is.na(bold_data$lon),]
bold_latlon<-bold_latlon[!is.na(bold_latlon$lat),]
```
