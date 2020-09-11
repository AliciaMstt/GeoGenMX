
---
title: "EDA GENBANK DATA"
output: rmarkdown::github_document
---
```{r, echo=FALSE, message=FALSE, warning=FALSE}
library(tidyr)
library(magrittr)
library(dplyr)
library(readr)
#Obtain number of sequences per kingdom and per phylum

genbank<-read_csv("../data/genbank/genbank_complete.csv")
```
Number of sequences per kingdom:
```{r, echo=FALSE, error=FALSE, message=FALSE}
#change name of plantae/Protista to Plantae/Protista and Plantae/protista to Plantae/Protista
genbank[which(genbank$kingdom=="plantae/Protista"),19]<-"Plantae/Protista"
genbank[which(genbank$kingdom=="Plantae/protista"),19]<-"Plantae/Protista"
king_phyl<-genbank%>% group_by(phylum_name, kingdom) %>% summarise(n())
colnames(king_phyl)<-c("phylum", "kingdom", "num_seqs") 
king_phyl<-king_phyl %>% arrange(desc(num_seqs))
king_seqs<-genbank%>%group_by(kingdom)%>%summarise(n())



```


```{r, echo=FALSE, error=F, message=FALSE}
genbank_nlatlon<-genbank[genbank$`lat-lon`=="-",]
genbank$latlon_info<-NA
genbank$latlon_info<-genbank$`lat-lon`!="-"
latlon_kin<-genbank%>%group_by(kingdom, latlon_info)%>%summarise(n())
colnames(latlon_kin)<-c("kingdom", "latlon_info", "num_seqs")
```



```{r, echo=FALSE, error=FALSE, message= FALSE}
#The data show that there are 114,502 data entries with information on latitude and longitude and no information on kingdom, these where further explored. 
#data frame of sequences without kingdom and with lat-lon information
gb_sk_latlon<-genbank[which(is.na(genbank$kingdom) & genbank$latlon_info==T),]
# A lot of these are metagenomes or uncultured organisms
#Index list of metagenomes and uncultured organisms
meta_unc<-grep("metagenome|uncultured organism|virus|environmental sample", gb_sk_latlon$taxonomy, invert = T)

gb_sk_latlon2<-gb_sk_latlon[meta_unc,]
#Remove the ones with no taxonomic information at on any field
gb_sk_latlon2<-gb_sk_latlon2[!(is.na(gb_sk_latlon2$phylum_name)) |
                             !(is.na(gb_sk_latlon2$class_name)) |
                               !(is.na(gb_sk_latlon2$order_name)) |
                                !(is.na(gb_sk_latlon2$family_name))|
                                !(is.na(gb_sk_latlon2$subfamily_name))|
                                !(is.na(gb_sk_latlon2$genus_name))|
                                !(is.na(gb_sk_latlon2$species_name)),]
#Once metagenomes and environmental samples as well as data with zero taxonomic information are excluded 1367 species remain sequences remain. 
#Take these tax ids and repeat steps necessary to fill their taxonomic information
tax_info_sk_latlon<-gb_sk_latlon2[,c(8:10,16:24)]
tax_info_sk_latlon<-unique(tax_info_sk_latlon)

#Using the column taxonomy and grep, keep only the rows that had species from metazoa, viridiplantae or fungi.
ind_metvirfun<-grep("Metazoa|Viridiplantae|Fungi", tax_info_sk_latlon$taxonomy)
tax_info_sk_latlon<-tax_info_sk_latlon[ind_metvirfun,]
tax_info_sk_latlon<-unique(tax_info_sk_latlon)
#save to review at a later time
write_csv(tax_info_sk_latlon,"../data/genbank/taxonomic_info_sk_latlon.csv")


```


```{r, echo=FALSE, warning=FALSE, message=FALSE}
library(ggplot2) 
king_phyl<-king_phyl%>% mutate(kingdom=replace_na(kingdom, "NA")) %>% mutate(phylum=replace_na(phylum, "NA")) %>% arrange(desc(num_seqs))

kingplot<-ggplot(data=king_phyl, aes(x=kingdom, y=num_seqs))+
           geom_bar(stat="identity", fill="skyblue")+
  ggtitle("Number of sequences per kingdom") + xlab("Kingdom") + ylab("Number of sequences") +
  coord_flip() + theme(legend.position = "none") + theme_bw() +theme(plot.title=element_text(hjust = .5))


kingdont<-genbank %>% group_by(kingdom) %>% count()%>% 
ungroup() %>% 
arrange(desc(n))
king_other<-c("Virus, Archaea, Chromista, Protista", sum(kingdont[5:9,2]))
kingdont[2,1]<-"NA"
kingdont<-rbind(kingdont[1:4,],king_other) %>% mutate(n=as.numeric(n)) %>% arrange(desc(n))
kingdont<-kingdont%>%mutate(percentage=round(n/sum(n),4)*100,     lab.pos=cumsum(percentage)-percentage*.5)



kingdonut<-ggplot(data=kingdont, 
       aes(x=2, y=(percentage), fill=reorder(kingdom,n)))+
      geom_bar(stat="identity")+
       coord_polar(theta="y")+
      xlim(c(1, 2.5))+
  scale_fill_brewer(palette=4) +
  ggtitle("Sequences per kingdom")+
  labs(fill="Kingdom")+
  geom_text(aes(y=lab.pos, label=paste(percentage, "%" , sep="")), col="black") +theme_void()+theme(plot.title=element_text(hjust = .5))






```

```{r kingplot, echo=FALSE, warning=FALSE, message=FALSE}

as.data.frame(king_seqs)
kingplot
kingdonut

```

```{r, warning=F, message=F, echo=F}

kin_latlon_plot<-ggplot(latlon_kin, aes(factor(kingdom), num_seqs, fill=latlon_info)) +
 geom_bar(stat="identity", position = "dodge") + 
  scale_fill_brewer(palette ="Pastel1") + ggtitle("Data with coordinates per Kingdom") +
  theme(axis.text.x = element_text(angle = 90)) + xlab("Kingdom") + ylab ("Number of sequences") + labs (fill="Information on coordinates") +coord_flip()+ theme_bw()+theme(plot.title = element_text(hjust = 0.5))

kin_latlon_plot2<-ggplot(latlon_kin %>% filter(kingdom != "Metazoa" && !is.na(kingdom)), aes(factor(kingdom), num_seqs, fill=latlon_info)) + geom_bar(stat="identity", position = "dodge") + scale_fill_brewer(palette = "Pastel1") + ggtitle("Data with coordinates per kingdom") + theme(axis.text.x = element_text(angle = 90))+ xlab("Kingdom") + ylab ("Number of sequences")  + labs(caption="*Data with Metazoa or NA at kingdom column were excluded from this plot.", fill="Information on coordinates")+coord_flip()+ theme_bw()+ theme(plot.title = element_text(hjust = 0.5))



```

Information available for latitude and longitude:

```{r message=F, warning=F, echo=F}
latlon_kin
```

```{r kin_latlon_plot, message=FALSE, warning=FALSE, echo=FALSE}
kin_latlon_plot
```


```{r kin_latlon_plot2, message=FALSE, warning=FALSE, echo=FALSE}
kin_latlon_plot2
```

Sequences from kingdom Metazoa

```{r message=F, warning=F, error=F, echo=F}

phyl_metplot<-ggplot(data=king_phyl[which(king_phyl$kingdom=="Metazoa" & !is.na(king_phyl$phylum)),], aes(x=phylum, y=num_seqs, fill=reorder(phylum,n)))+
           geom_bar(stat="identity", fill="skyblue") + ggtitle("Number of sequences per phylum for Metazoa") + xlab("Phylum") + ylab ("Number of sequences")  + theme_bw() + theme(plot.title = element_text(hjust = 0.5)) +coord_flip()


phyl_metplot2<-ggplot(data=king_phyl[which(king_phyl$kingdom=="Metazoa" & king_phyl$phylum!="Arthropoda" & king_phyl$phylum!="Chordata" & !is.na(king_phyl$phylum)),], aes(x=phylum, y=num_seqs, fill=phylum))+
           geom_bar(stat="identity", fill="skyblue")+theme(axis.text.x=element_text(angle=90)) + ggtitle("Sequences per phylum for Metazoa") + xlab("Phylum") + ylab ("Number of sequences")  + labs(caption = "*For this plot the phyla Chordata and Arthropoda were excluded.") + coord_flip() + theme_bw() + theme(plot.title = element_text(hjust = 0.5)) + theme(plot.caption = element_text(hjust = .5))


metdont<-genbank %>% filter(kingdom=="Metazoa")%>% group_by(phylum_name) %>% count()%>% ungroup() %>% 
arrange(desc(n))
other_met<- c("Other phyla", sum(metdont[3:18,2]))
metdont1<-rbind(metdont[1:2,], other_met)
metdont2<-metdont[3:18,]
othermet2<-c(" 
               Porifera
               Ctenophora 
               Xenacoelomorpha
               Nemertea
               Gastrotricha 
               Nematomorpha 
               Bryozoa
               NA", sum(metdont[11:18,2]))
metdont2<-rbind(metdont[3:8,], othermet2)

metdont1<-metdont1 %>% mutate(n=as.numeric(n))%>% mutate(percentage=round(n/sum(n),4)*100,lab.pos=cumsum(percentage)-percentage*.5) 

metdont2<-metdont2 %>% mutate(n=as.numeric(n))%>% mutate(percentage=round(n/sum(n),4)*100,lab.pos=cumsum(percentage)-percentage*.5) 



metdonut1<-ggplot(data=metdont1, 
       aes(x=2, y=(percentage), fill=reorder(phylum_name, n)))+
      geom_bar(stat="identity")+
       coord_polar(theta="y")+
      xlim(c(1, 2.5))+
  scale_fill_brewer(palette="Paired", direction = -1) +
  ggtitle("Sequences per phylum for Metazoa")+
  labs(fill="Kingdom")+
  geom_text(aes(y=lab.pos, label=paste(percentage, "%" , sep="")), col="black") +theme_void()+theme(plot.title=element_text(hjust = .5))


metdonut2<-ggplot(data=metdont2, 
       aes(x=2, y=(percentage), fill=reorder(phylum_name, n)))+
      geom_bar(stat="identity")+
       coord_polar(theta="y")+
      xlim(c(1, 2.5))+
  scale_fill_brewer(palette="Pastel1") +
  ggtitle("Other phyla")+
  labs(fill="Kingdom")+
  geom_text(aes(y=lab.pos, label=paste(percentage, "%" , sep="")), col="black") +theme_void()+theme(plot.title=element_text(hjust = .5))






king_phyl[which(king_phyl$kingdom=="Metazoa"), c(1,3)]
```

```{r phyl_metplot, message=F, warning=F, echo=F}
phyl_metplot
```

```{r phyl_metplot2, message=F, warning=F, echo=F}
phyl_metplot2


```


```{r, message=F, echo=F, warning=FALSE}
#metdonut1
#metdonut2
```

Sequences from kingdom Viridiplantae

```{r, message=F, echo=F, warning=FALSE}

phyl_plantae<-ggplot(data=king_phyl[which(king_phyl$kingdom=="Viridiplantae"),], aes(x=phylum, y=num_seqs))+
           geom_bar(stat="identity", fill="skyblue")+theme(axis.text.x=element_text(angle=90)) + ggtitle("Number of sequences per phylum for Viridiplantae")  + xlab("Phylum") + ylab ("Number of  sequences")  + coord_flip() + theme_bw()+ theme(plot.title = element_text(hjust = 0.5)) 

phyl_plantae2<-ggplot(data=king_phyl[which(king_phyl$kingdom=="Viridiplantae"&king_phyl$phylum!="Magnoliophyta"),], aes(x=phylum, y=num_seqs)) +
     geom_bar(stat="identity", fill="skyblue") + 
    theme(axis.text.x=element_text(angle=90)) + 
    ggtitle("Number of sequences per phylum for Viridiplantae") + 
    xlab("Phylum") + 
    ylab ("Number of  sequences")  + 
    coord_flip() + 
    theme_bw() + 
    theme(plot.title = element_text(hjust = 0.5)) + labs(caption="*Phylum Magnoliophyta was excluded from this plot.") + theme(plot.caption = element_text(hjust = 0.5))

king_phyl[which(king_phyl$kingdom=="Viridiplantae"),c(1,3)]
```

```{r phyl_plantae, message=F, warning=F, echo=FALSE}
phyl_plantae
```


```{r phyl_plantae2, message=F, warning=F, echo=FALSE}
phyl_plantae2
```

```{r, echo=F, message=F, warning=F}
phyl_fungi<-ggplot(data=king_phyl[which(king_phyl$kingdom=="Fungi" & !is.na(king_phyl$phylum)),], aes(x=phylum, y=num_seqs))+
           geom_bar(stat="identity", fill="skyblue")+theme(axis.text.x=element_text(angle=90)) + ggtitle("Sequences per phylum for Fungi") + coord_flip()+ theme_bw()+ theme(plot.title = element_text(hjust = 0.5))  + xlab("Phylum") + ylab ("Number of sequences")

phyl_fungi2<-ggplot(data=king_phyl[which(king_phyl$kingdom=="Fungi" & king_phyl$phylum!="Ascomycota" & king_phyl$phylum!="Basidiomycota" & !is.na(king_phyl$phylum)),], aes(x=phylum, y=num_seqs))+
           geom_bar(stat="identity", fill="skyblue")+theme(axis.text.x=element_text(angle=90)) + ggtitle("Sequences per phylum for Fungi") + coord_flip()+ theme_bw()+theme(plot.title = element_text(hjust = 0.5)) +labs(caption = "*Phylum Ascomycota and Basidiomycota were excluded from this plot")  + xlab("Phylum") + ylab ("Number of sequences") +theme(plot.caption = element_text(hjust = 0.5))


fun_phyl<-king_phyl[which(king_phyl$kingdom=="Fungi"),c(1,3)]
other_fun<-fun_phyl[4:12,]
fundont1<-fun_phyl[1:3,]
fundont1[4,1]<-"Other phyla"
fundont1[4,2]<-sum(other_fun$num_seqs)
fundont2<-other_fun[1:3,]
fundont2[4,1]<-paste0("\t \n",other_fun[4,1],"\t \n",  other_fun[5,1],"\t \n", other_fun[6,1], "\t \n", other_fun[7,1], "\t \n", other_fun[8,1], "\t \n", other_fun[9,1] , "\t \n", sep = " \n")
fundont2[4,2]<-sum(other_fun[4:8,2])



fun_phyl
```

```{r phyl_fungi, message=F, warning=F}
phyl_fungi
```


```{r phyl_fungi2, message=F, warning=F}
phyl_fungi2
```


Sequences from kingdom Archaea

```{r, echo=F, message=F, warning=F}
king_phyl[king_phyl$kingdom=="Archaea",]
phyl_arc<-ggplot(data=king_phyl[which(king_phyl$kingdom=="Archaea" & !is.na(king_phyl$phylum)),], aes(x=phylum, y=num_seqs))+
           geom_bar(stat="identity", fill="skyblue") + ggtitle("Sequences per phylum for Archaea") + coord_flip() + theme_bw() + theme(plot.title = element_text(hjust = 0.5)) + xlab("Phylum") + ylab ("Number of sequences")
```
```{r, echo=F, message=F, warning=F}

phyl_arc

```

Sequences from kingdom Protista
```{r, echo=F, message=F, warning=F}
king_phyl[which(king_phyl$kingdom=="Protista" & !is.na(king_phyl$phylum) | king_phyl$kingdom=="Plantae/Protista"),]
```

```{r, echo=F, message=F, warning=F}
phyl_prot<-ggplot(data=king_phyl[which(king_phyl$kingdom=="Protista" & !is.na(king_phyl$phylum) | king_phyl$kingdom=="Plantae/Protista"),], aes(x=phylum, y=num_seqs))+
           geom_bar(stat="identity", fill="skyblue")+theme(axis.text.x=element_text(angle=90)) + ggtitle("Sequences per phylum for Protista") + coord_flip()+theme_bw()+ theme(plot.title = element_text(hjust = 0.5))  + xlab("Phylum") + ylab ("Number of sequences")  + labs (caption="*Phylum Rhodophyta (included in this plot) is the only phylum with kingdom classification Plantae/Protista") + theme(plot.caption = element_text(hjust = 0.5))
phyl_prot
```

```{r, echo=F, message=F, warning=F}
king_phyl[which(king_phyl$kingdom=="Virus"),]
```

Sequences from kingdom Virus
```{r, echo=F, message=F, warning=F}
phyl_vir<-ggplot(data=king_phyl[which(king_phyl$kingdom=="Virus" & !is.na(king_phyl$phylum)),], aes(x=phylum, y=num_seqs))+
           geom_bar(stat="identity", fill="skyblue")+theme_bw()+ coord_flip() + ggtitle("Sequences per phylum for Virus") + theme(plot.title = element_text(hjust = 0.5))  + xlab("Phylum") + ylab ("Number of sequences")
phyl_vir
```


```{r}
#Analysis of available geographic information

#nota 24 de marzo borrar filas repetidas tanto en genbank como en bold
```