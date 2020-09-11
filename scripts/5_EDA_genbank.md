EDA GENBANK DATA
================

Number of sequences per kingdom:

    ##            kingdom    n()
    ## 1          Archaea   4883
    ## 2        Chromista      3
    ## 3            Fungi  31294
    ## 4          Metazoa 211438
    ## 5 Plantae/Protista    670
    ## 6         Protista   3365
    ## 7    Viridiplantae  24910
    ## 8            Virus   6533
    ## 9             <NA> 125994

![](5_EDA_genbank_files/figure-gfm/kingplot-1.png)<!-- -->![](5_EDA_genbank_files/figure-gfm/kingplot-2.png)<!-- -->

Information available for latitude and longitude:

    ## # A tibble: 17 x 3
    ## # Groups:   kingdom [9]
    ##    kingdom          latlon_info num_seqs
    ##    <chr>            <lgl>          <int>
    ##  1 Archaea          FALSE           2929
    ##  2 Archaea          TRUE            1954
    ##  3 Chromista        FALSE              3
    ##  4 Fungi            FALSE          27153
    ##  5 Fungi            TRUE            4141
    ##  6 Metazoa          FALSE         194727
    ##  7 Metazoa          TRUE           16711
    ##  8 Plantae/Protista FALSE            553
    ##  9 Plantae/Protista TRUE             117
    ## 10 Protista         FALSE           2571
    ## 11 Protista         TRUE             794
    ## 12 Viridiplantae    FALSE          22668
    ## 13 Viridiplantae    TRUE            2242
    ## 14 Virus            FALSE           6456
    ## 15 Virus            TRUE              77
    ## 16 <NA>             FALSE          11520
    ## 17 <NA>             TRUE          114474

![](5_EDA_genbank_files/figure-gfm/kin_latlon_plot-1.png)<!-- -->

![](5_EDA_genbank_files/figure-gfm/kin_latlon_plot2-1.png)<!-- -->

Sequences from kingdom Metazoa

    ## # A tibble: 18 x 2
    ## # Groups:   phylum [18]
    ##    phylum          num_seqs
    ##    <chr>              <int>
    ##  1 Arthropoda        172338
    ##  2 Chordata           33054
    ##  3 Mollusca            2244
    ##  4 Platyhelminthes     1322
    ##  5 Nematoda             834
    ##  6 Cnidaria             411
    ##  7 Rotifera             404
    ##  8 Annelida             327
    ##  9 Echinodermata        307
    ## 10 Acanthocephala       111
    ## 11 Porifera              36
    ## 12 Ctenophora            16
    ## 13 Xenacoelomorpha       14
    ## 14 Nemertea              11
    ## 15 Gastrotricha           3
    ## 16 Nematomorpha           3
    ## 17 Bryozoa                2
    ## 18 NA                     1

![](5_EDA_genbank_files/figure-gfm/phyl_metplot-1.png)<!-- -->

![](5_EDA_genbank_files/figure-gfm/phyl_metplot2-1.png)<!-- -->

Sequences from kingdom Viridiplantae

    ## # A tibble: 9 x 2
    ## # Groups:   phylum [9]
    ##   phylum           num_seqs
    ##   <chr>               <int>
    ## 1 Magnoliophyta       20737
    ## 2 Pinophyta            2176
    ## 3 Pteridophyta          655
    ## 4 Streptophyta          533
    ## 5 Chlorophyta           287
    ## 6 Marchantiophyta       191
    ## 7 Bryophyta             147
    ## 8 Cycadophyta           144
    ## 9 Anthocerotophyta       40

![](5_EDA_genbank_files/figure-gfm/phyl_plantae-1.png)<!-- -->

![](5_EDA_genbank_files/figure-gfm/phyl_plantae2-1.png)<!-- -->

    ## # A tibble: 12 x 2
    ## # Groups:   phylum [12]
    ##    phylum             num_seqs
    ##    <chr>                 <int>
    ##  1 Ascomycota            22980
    ##  2 Basidiomycota          5975
    ##  3 Glomeromycotina        1945
    ##  4 NA                      223
    ##  5 Zygomycota              100
    ##  6 Mucoromycota             43
    ##  7 Chytridiomycota           8
    ##  8 Microsporidia             7
    ##  9 Blastocladiomycota        5
    ## 10 Cryptomycota              4
    ## 11 Olpidiomycota             3
    ## 12 Zoopagomycota             1

``` r
phyl_fungi
```

![](5_EDA_genbank_files/figure-gfm/phyl_fungi-1.png)<!-- -->

``` r
phyl_fungi2
```

![](5_EDA_genbank_files/figure-gfm/phyl_fungi2-1.png)<!-- -->

Sequences from kingdom Archaea

    ## # A tibble: 5 x 3
    ## # Groups:   phylum [5]
    ##   phylum                    kingdom num_seqs
    ##   <chr>                     <chr>      <int>
    ## 1 Crenarchaeota             Archaea     2350
    ## 2 Euryarchaeota             Archaea     1793
    ## 3 Candidatus Bathyarchaeota Archaea      576
    ## 4 Thaumarchaeota            Archaea      158
    ## 5 Candidatus Micrarchaeota  Archaea        6

![](5_EDA_genbank_files/figure-gfm/unnamed-chunk-13-1.png)<!-- -->

Sequences from kingdom Protista

    ## # A tibble: 16 x 3
    ## # Groups:   phylum [16]
    ##    phylum               kingdom          num_seqs
    ##    <chr>                <chr>               <int>
    ##  1 Heterokontophyta     Protista             1148
    ##  2 Apicomplexa          Protista              979
    ##  3 Rhodophyta           Plantae/Protista      670
    ##  4 Ochrophyta           Protista              387
    ##  5 Pyrrophycophyta      Protista              380
    ##  6 Ciliophora           Protista              242
    ##  7 Protista             Protista              119
    ##  8 Bacillariophyta      Protista               62
    ##  9 Perkinsozoa          Protista               14
    ## 10 Chlorarachniophyceae Protista               12
    ## 11 Haptophyta           Protista                6
    ## 12 Heterolobosea        Protista                6
    ## 13 Cercozoa             Protista                4
    ## 14 Choanozoa            Protista                4
    ## 15 Euglenida            Protista                1
    ## 16 Heterokonta          Protista                1

![](5_EDA_genbank_files/figure-gfm/unnamed-chunk-15-1.png)<!-- -->

    ## # A tibble: 2 x 3
    ## # Groups:   phylum [2]
    ##   phylum          kingdom num_seqs
    ##   <chr>           <chr>      <int>
    ## 1 Negarnaviricota Virus       5692
    ## 2 Virus           Virus        841

Sequences from kingdom Virus
![](5_EDA_genbank_files/figure-gfm/unnamed-chunk-17-1.png)<!-- -->

``` r
#Analysis of available geographic information

#nota 24 de marzo borrar filas repetidas tanto en genbank como en bold
```
