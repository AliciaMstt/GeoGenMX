EDA GENBANK DATA
================

Number of sequences per kingdom:

    ##            Kingdom Number_sequences
    ## 1          Metazoa           211502
    ## 2               NA           126342
    ## 3            Fungi            31295
    ## 4    Viridiplantae            24846
    ## 5            Virus             6533
    ## 6          Archaea             4883
    ## 7         Protista             3017
    ## 8 Plantae/Protista              670
    ## 9        Chromista                3

![](5_EDA_genbank_files/figure-gfm/kingplot-1.png)<!-- -->![](5_EDA_genbank_files/figure-gfm/kingplot-2.png)<!-- -->

Information available for latitude and longitude:

    ## # A tibble: 18 x 3
    ## # Groups:   kingdom [9]
    ##    kingdom          latlon_info num_seqs
    ##    <chr>            <lgl>          <int>
    ##  1 Metazoa          FALSE         194791
    ##  2 Metazoa          TRUE           16711
    ##  3 NA               FALSE          11812
    ##  4 NA               TRUE          114530
    ##  5 Fungi            FALSE          27153
    ##  6 Fungi            TRUE            4142
    ##  7 Viridiplantae    FALSE          22604
    ##  8 Viridiplantae    TRUE            2242
    ##  9 Virus            FALSE           6456
    ## 10 Virus            TRUE              77
    ## 11 Archaea          FALSE           2929
    ## 12 Archaea          TRUE            1954
    ## 13 Protista         FALSE           2279
    ## 14 Protista         TRUE             738
    ## 15 Plantae/Protista FALSE            553
    ## 16 Plantae/Protista TRUE             117
    ## 17 Chromista        FALSE              3
    ## 18 Chromista        TRUE               0

![](5_EDA_genbank_files/figure-gfm/kin_latlon_plot-1.png)<!-- -->

![](5_EDA_genbank_files/figure-gfm/kin_latlon_plot2-1.png)<!-- -->

Information available for locality:

    ## # A tibble: 18 x 3
    ## # Groups:   kingdom [9]
    ##    kingdom          locality_info num_seqs
    ##    <chr>            <lgl>            <int>
    ##  1 Metazoa          FALSE            25012
    ##  2 Metazoa          TRUE            186490
    ##  3 NA               FALSE           121906
    ##  4 NA               TRUE              4436
    ##  5 Fungi            FALSE            14544
    ##  6 Fungi            TRUE             16751
    ##  7 Viridiplantae    FALSE            16285
    ##  8 Viridiplantae    TRUE              8561
    ##  9 Virus            FALSE             5438
    ## 10 Virus            TRUE              1095
    ## 11 Archaea          FALSE             2085
    ## 12 Archaea          TRUE              2798
    ## 13 Protista         FALSE             2709
    ## 14 Protista         TRUE               308
    ## 15 Plantae/Protista FALSE              161
    ## 16 Plantae/Protista TRUE               509
    ## 17 Chromista        FALSE                3
    ## 18 Chromista        TRUE                 0

![](5_EDA_genbank_files/figure-gfm/kin_loc_plot-1.png)<!-- -->

![](5_EDA_genbank_files/figure-gfm/kin_loc_plot2-1.png)<!-- -->

Sequences from kingdom Metazoa

    ## # A tibble: 18 x 2
    ## # Groups:   phylum [18]
    ##    phylum          num_seqs
    ##    <chr>              <int>
    ##  1 Arthropoda        172402
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
    ## 1 Magnoliophyta       20676
    ## 2 Pinophyta            2176
    ## 3 Pteridophyta          655
    ## 4 Streptophyta          530
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
    ##  4 NA                      224
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

    ## # A tibble: 15 x 3
    ## # Groups:   phylum [15]
    ##    phylum               kingdom          num_seqs
    ##    <chr>                <chr>               <int>
    ##  1 Heterokontophyta     Protista             1149
    ##  2 Apicomplexa          Protista              979
    ##  3 Rhodophyta           Plantae/Protista      670
    ##  4 Pyrrophycophyta      Protista              380
    ##  5 Ciliophora           Protista              242
    ##  6 Protista             Protista              119
    ##  7 Bacillariophyta      Protista               62
    ##  8 Ochrophyta           Protista               39
    ##  9 Perkinsozoa          Protista               14
    ## 10 Chlorarachniophyceae Protista               12
    ## 11 Haptophyta           Protista                6
    ## 12 Heterolobosea        Protista                6
    ## 13 Cercozoa             Protista                4
    ## 14 Choanozoa            Protista                4
    ## 15 Euglenida            Protista                1

![](5_EDA_genbank_files/figure-gfm/unnamed-chunk-15-1.png)<!-- -->

Sequences from kingdom Virus.

    ## # A tibble: 2 x 3
    ## # Groups:   phylum [2]
    ##   phylum          kingdom num_seqs
    ##   <chr>           <chr>      <int>
    ## 1 Negarnaviricota Virus       5692
    ## 2 Virus           Virus        841

![](5_EDA_genbank_files/figure-gfm/unnamed-chunk-17-1.png)<!-- -->
