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

The phyla with the largest number of sequences were chosen from
kingdoms: Metazoa, Viridiplantae and Fungi.

Metazoa:

1)Chordata

2)Arthropoda

Viridiplantae:

1)Magnoliophyta

2)Pinophyta

Fungi:

1)Basidiomycota

2)Ascomycota

Genetic markers available for all organisms:

The following analysis were made after excluding all the records that
did not have any type of genetic sequence available.

For the data retrieved from Genbank, some of the sequences retrieved
span more than one genetic marker, this was annotated accordingly in the
database and is reflected on the marker column.

    ## # A tibble: 96 x 2
    ##    Marker                                      Number_sequences
    ##    <chr>                                                  <int>
    ##  1 other                                                 197753
    ##  2 COI,                                                   16145
    ##  3 CYTB,                                                   5062
    ##  4 5.8S,ITS2,ITS1,ITS,                                     4267
    ##  5 trnL,                                                   2717
    ##  6 18S,5.8S,28S,ITS2,ITS1,ITS,                             2568
    ##  7 16S,                                                    2011
    ##  8 matK,                                                   1884
    ##  9 28S,                                                    1619
    ## 10 psbA,trnH,                                              1328
    ## 11 5.8S,28S,ITS2,ITS1,ITS,                                 1266
    ## 12 18S,                                                     862
    ## 13 18S,5.8S,ITS2,ITS1,ITS,                                  850
    ## 14 26S,                                                     768
    ## 15 Rho,                                                     659
    ## 16 rbcL,                                                    629
    ## 17 26S,18S,5.8S,ITS2,ITS1,ITS,                              489
    ## 18 18S,ITS1,ITS,                                            406
    ## 19 5.8S,28S,ITS2,ITS,                                       397
    ## 20 ycf1,                                                    315
    ## 21 trnT,                                                    269
    ## 22 ITS2,ITS,                                                260
    ## 23 trnH,                                                    204
    ## 24 5.8S,ITS2,ITS1,                                          166
    ## 25 5.8S,ITS2,ITS,                                           164
    ## 26 trnL,trnT,                                               161
    ## 27 trnT,trnD,                                               145
    ## 28 18S,5.8S,ITS2,ITS1,                                      143
    ## 29 ITS1,ITS,                                                124
    ## 30 trnT,trnE,trnY,trnD,                                      99
    ## 31 18S,5.8S,28S,ITS2,ITS1,                                   88
    ## 32 5.8S,ITS1,ITS,                                            86
    ## 33 trnY,                                                     86
    ## 34 18S,5.8S,ITS1,ITS,                                        68
    ## 35 5.8S,28S,ITS2,                                            63
    ## 36 ITS1,                                                     57
    ## 37 18S,28S,                                                  47
    ## 38 26S,18S,                                                  46
    ## 39 ITS,                                                      45
    ## 40 ITS2,                                                     45
    ## 41 trnT,trnE,trnY,                                           45
    ## 42 trnE,trnY,trnD,                                           40
    ## 43 26S,18S,5.8S,ITS2,ITS1,                                   37
    ## 44 psbA,matK,                                                37
    ## 45 26S,5.8S,ITS2,ITS1,ITS,                                   33
    ## 46 26S,5.8S,ITS2,ITS1,                                       32
    ## 47 16S,trnL,                                                 26
    ## 48 trnE,trnY,                                                24
    ## 49 Rho,COI,                                                  21
    ## 50 5.8S,28S,ITS2,ITS1,                                       18
    ## 51 trnT,CYTB,                                                17
    ## 52 26S,Rho,                                                  13
    ## 53 Rho,5.8S,28S,ITS2,ITS1,ITS,                               11
    ## 54 26S,18S,5.8S,ITS2,ITS,                                     9
    ## 55 16S,trnL,trnT,trnH,trnE,trnY,trnD,CYTB,COI,                8
    ## 56 28S,ITS2,ITS,                                              8
    ## 57 trnL,trnH,                                                 6
    ## 58 18S,5.8S,28S,                                              5
    ## 59 5.8S,                                                      5
    ## 60 Rho,5.8S,ITS2,ITS1,ITS,                                    5
    ## 61 trnD,                                                      5
    ## 62 16S,CYTB,                                                  4
    ## 63 18S,5.8S,ITS2,ITS,                                         4
    ## 64 Rho,18S,5.8S,28S,ITS2,ITS1,ITS,                            4
    ## 65 trnL,matK,                                                 4
    ## 66 16S,CYTB,COI,                                              3
    ## 67 26S,5.8S,ITS1,ITS,                                         3
    ## 68 26S,COI,                                                   3
    ## 69 5.8S,28S,ITS1,ITS,                                         3
    ## 70 5.8S,ITS,                                                  3
    ## 71 ITS2,ITS1,ITS,                                             3
    ## 72 Rho,16S,                                                   3
    ## 73 Rho,18S,5.8S,ITS2,ITS1,ITS,                                3
    ## 74 Rho,5.8S,                                                  3
    ## 75 18S,28S,ITS2,ITS1,ITS,                                     2
    ## 76 5.8S,COI,                                                  2
    ## 77 5.8S,CYTB,                                                 2
    ## 78 psbA,                                                      2
    ## 79 Rho,5.8S,ITS1,ITS,                                         2
    ## 80 trnL,COI,                                                  2
    ## 81 16S,18S,                                                   1
    ## 82 16S,COI,                                                   1
    ## 83 16S,ITS2,ITS1,                                             1
    ## 84 18S,5.8S,28S,ITS2,ITS,                                     1
    ## 85 18S,COI,                                                   1
    ## 86 18S,CYTB,                                                  1
    ## 87 18S,ITS1,                                                  1
    ## 88 26S,16S,                                                   1
    ## 89 26S,5.8S,ITS2,ITS,                                         1
    ## 90 26S,CYTB,                                                  1
    ## 91 28S,ITS2,ITS1,ITS,                                         1
    ## 92 Rho,18S,                                                   1
    ## 93 Rho,CYTB,                                                  1
    ## 94 Rho,ITS2,ITS,                                              1
    ## 95 trnT,trnE,                                                 1
    ## 96 trnT,trnE,CYTB,                                            1

Number of sequences per marker for Metazoa

    ## # A tibble: 20 x 2
    ##    Marker                      Number_sequences
    ##    <chr>                                  <int>
    ##  1 other                                 167444
    ##  2 COI,                                   16143
    ##  3 CYTB,                                   5021
    ##  4 16S,                                    1975
    ##  5 28S,                                    1019
    ##  6 Rho,                                     634
    ##  7 18S,                                     422
    ##  8 trnT,                                    257
    ##  9 ITS2,ITS,                                210
    ## 10 trnH,                                    180
    ## 11 5.8S,28S,ITS2,ITS,                       117
    ## 12 5.8S,ITS2,ITS,                           108
    ## 13 18S,ITS1,ITS,                             88
    ## 14 5.8S,28S,ITS2,                            63
    ## 15 18S,5.8S,ITS1,ITS,                        57
    ## 16 18S,5.8S,28S,ITS2,ITS1,ITS,               53
    ## 17 26S,                                      51
    ## 18 trnL,                                     42
    ## 19 16S,trnL,                                 26
    ## 20 Rho,COI,                                  21

    ## # A tibble: 40 x 3
    ## # Groups:   Marker [20]
    ##    Marker                      latlon_info Number_sequences
    ##    <chr>                       <lgl>                  <dbl>
    ##  1 other                       FALSE                 164127
    ##  2 other                       TRUE                    3317
    ##  3 COI,                        FALSE                   6378
    ##  4 COI,                        TRUE                    9765
    ##  5 CYTB,                       FALSE                   4313
    ##  6 CYTB,                       TRUE                     708
    ##  7 16S,                        FALSE                   1661
    ##  8 16S,                        TRUE                     314
    ##  9 28S,                        FALSE                    473
    ## 10 28S,                        TRUE                     546
    ## 11 Rho,                        FALSE                    619
    ## 12 Rho,                        TRUE                      15
    ## 13 18S,                        FALSE                    253
    ## 14 18S,                        TRUE                     169
    ## 15 trnT,                       FALSE                    257
    ## 16 trnT,                       TRUE                       0
    ## 17 ITS2,ITS,                   FALSE                    208
    ## 18 ITS2,ITS,                   TRUE                       2
    ## 19 trnH,                       FALSE                    175
    ## 20 trnH,                       TRUE                       5
    ## 21 5.8S,28S,ITS2,ITS,          FALSE                    117
    ## 22 5.8S,28S,ITS2,ITS,          TRUE                       0
    ## 23 5.8S,ITS2,ITS,              FALSE                    108
    ## 24 5.8S,ITS2,ITS,              TRUE                       0
    ## 25 18S,ITS1,ITS,               FALSE                     88
    ## 26 18S,ITS1,ITS,               TRUE                       0
    ## 27 5.8S,28S,ITS2,              FALSE                     63
    ## 28 5.8S,28S,ITS2,              TRUE                       0
    ## 29 18S,5.8S,ITS1,ITS,          FALSE                     51
    ## 30 18S,5.8S,ITS1,ITS,          TRUE                       6
    ## 31 18S,5.8S,28S,ITS2,ITS1,ITS, FALSE                     53
    ## 32 18S,5.8S,28S,ITS2,ITS1,ITS, TRUE                       0
    ## 33 26S,                        FALSE                     51
    ## 34 26S,                        TRUE                       0
    ## 35 trnL,                       FALSE                     42
    ## 36 trnL,                       TRUE                       0
    ## 37 16S,trnL,                   FALSE                     26
    ## 38 16S,trnL,                   TRUE                       0
    ## 39 Rho,COI,                    FALSE                      3
    ## 40 Rho,COI,                    TRUE                      18

    ## # A tibble: 40 x 3
    ## # Groups:   Marker [20]
    ##    Marker                      locality_info Number_sequences
    ##    <chr>                       <lgl>                    <dbl>
    ##  1 other                       FALSE                    11163
    ##  2 other                       TRUE                    156281
    ##  3 COI,                        FALSE                     5462
    ##  4 COI,                        TRUE                     10681
    ##  5 CYTB,                       FALSE                     2602
    ##  6 CYTB,                       TRUE                      2419
    ##  7 16S,                        FALSE                     1075
    ##  8 16S,                        TRUE                       900
    ##  9 28S,                        FALSE                      482
    ## 10 28S,                        TRUE                       537
    ## 11 Rho,                        FALSE                      382
    ## 12 Rho,                        TRUE                       252
    ## 13 18S,                        FALSE                      301
    ## 14 18S,                        TRUE                       121
    ## 15 trnT,                       FALSE                      244
    ## 16 trnT,                       TRUE                        13
    ## 17 ITS2,ITS,                   FALSE                      128
    ## 18 ITS2,ITS,                   TRUE                        82
    ## 19 trnH,                       FALSE                       24
    ## 20 trnH,                       TRUE                       156
    ## 21 5.8S,28S,ITS2,ITS,          FALSE                      104
    ## 22 5.8S,28S,ITS2,ITS,          TRUE                        13
    ## 23 5.8S,ITS2,ITS,              FALSE                       46
    ## 24 5.8S,ITS2,ITS,              TRUE                        62
    ## 25 18S,ITS1,ITS,               FALSE                       46
    ## 26 18S,ITS1,ITS,               TRUE                        42
    ## 27 5.8S,28S,ITS2,              FALSE                       59
    ## 28 5.8S,28S,ITS2,              TRUE                         4
    ## 29 18S,5.8S,ITS1,ITS,          FALSE                       21
    ## 30 18S,5.8S,ITS1,ITS,          TRUE                        36
    ## 31 18S,5.8S,28S,ITS2,ITS1,ITS, FALSE                       43
    ## 32 18S,5.8S,28S,ITS2,ITS1,ITS, TRUE                        10
    ## 33 26S,                        FALSE                        2
    ## 34 26S,                        TRUE                        49
    ## 35 trnL,                       FALSE                        2
    ## 36 trnL,                       TRUE                        40
    ## 37 16S,trnL,                   FALSE                        1
    ## 38 16S,trnL,                   TRUE                        25
    ## 39 Rho,COI,                    TRUE                        21
    ## 40 Rho,COI,                    FALSE                        0

![](5_EDA_genbank_files/figure-gfm/unnamed-chunk-24-1.png)<!-- -->![](5_EDA_genbank_files/figure-gfm/unnamed-chunk-24-2.png)<!-- -->![](5_EDA_genbank_files/figure-gfm/unnamed-chunk-24-3.png)<!-- -->

Number of sequences per marker for Viridiplantae

    ## # A tibble: 20 x 2
    ##    Marker                      Number_sequences
    ##    <chr>                                  <int>
    ##  1 other                                  11799
    ##  2 trnL,                                   2675
    ##  3 matK,                                   1884
    ##  4 5.8S,ITS2,ITS1,ITS,                     1878
    ##  5 psbA,trnH,                              1328
    ##  6 rbcL,                                    622
    ##  7 26S,18S,5.8S,ITS2,ITS1,ITS,              480
    ##  8 ycf1,                                    315
    ##  9 5.8S,28S,ITS2,ITS1,ITS,                  272
    ## 10 18S,5.8S,28S,ITS2,ITS1,ITS,              258
    ## 11 18S,                                     235
    ## 12 18S,5.8S,ITS2,ITS1,ITS,                  205
    ## 13 trnL,trnT,                               161
    ## 14 5.8S,ITS2,ITS1,                          158
    ## 15 trnT,trnD,                               145
    ## 16 18S,5.8S,ITS2,ITS1,                      140
    ## 17 trnT,trnE,trnY,trnD,                      92
    ## 18 trnY,                                     86
    ## 19 ITS1,ITS,                                 55
    ## 20 ITS2,ITS,                                 47

    ## # A tibble: 40 x 3
    ## # Groups:   Marker [20]
    ##    Marker                      latlon_info Number_sequences
    ##    <chr>                       <lgl>                  <dbl>
    ##  1 other                       FALSE                  11139
    ##  2 other                       TRUE                     660
    ##  3 trnL,                       FALSE                   2467
    ##  4 trnL,                       TRUE                     208
    ##  5 matK,                       FALSE                   1624
    ##  6 matK,                       TRUE                     260
    ##  7 5.8S,ITS2,ITS1,ITS,         FALSE                   1636
    ##  8 5.8S,ITS2,ITS1,ITS,         TRUE                     242
    ##  9 psbA,trnH,                  FALSE                   1002
    ## 10 psbA,trnH,                  TRUE                     326
    ## 11 rbcL,                       FALSE                    518
    ## 12 rbcL,                       TRUE                     104
    ## 13 26S,18S,5.8S,ITS2,ITS1,ITS, FALSE                    423
    ## 14 26S,18S,5.8S,ITS2,ITS1,ITS, TRUE                      57
    ## 15 ycf1,                       FALSE                    249
    ## 16 ycf1,                       TRUE                      66
    ## 17 5.8S,28S,ITS2,ITS1,ITS,     FALSE                    260
    ## 18 5.8S,28S,ITS2,ITS1,ITS,     TRUE                      12
    ## 19 18S,5.8S,28S,ITS2,ITS1,ITS, FALSE                    214
    ## 20 18S,5.8S,28S,ITS2,ITS1,ITS, TRUE                      44
    ## 21 18S,                        FALSE                    173
    ## 22 18S,                        TRUE                      62
    ## 23 18S,5.8S,ITS2,ITS1,ITS,     FALSE                    203
    ## 24 18S,5.8S,ITS2,ITS1,ITS,     TRUE                       2
    ## 25 trnL,trnT,                  FALSE                    161
    ## 26 trnL,trnT,                  TRUE                       0
    ## 27 5.8S,ITS2,ITS1,             FALSE                    158
    ## 28 5.8S,ITS2,ITS1,             TRUE                       0
    ## 29 trnT,trnD,                  FALSE                    145
    ## 30 trnT,trnD,                  TRUE                       0
    ## 31 18S,5.8S,ITS2,ITS1,         FALSE                    140
    ## 32 18S,5.8S,ITS2,ITS1,         TRUE                       0
    ## 33 trnT,trnE,trnY,trnD,        FALSE                     37
    ## 34 trnT,trnE,trnY,trnD,        TRUE                      55
    ## 35 trnY,                       FALSE                     86
    ## 36 trnY,                       TRUE                       0
    ## 37 ITS1,ITS,                   FALSE                     54
    ## 38 ITS1,ITS,                   TRUE                       1
    ## 39 ITS2,ITS,                   FALSE                     47
    ## 40 ITS2,ITS,                   TRUE                       0

    ## # A tibble: 40 x 3
    ## # Groups:   Marker [20]
    ##    Marker                      locality_info Number_sequences
    ##    <chr>                       <lgl>                    <int>
    ##  1 other                       FALSE                     8270
    ##  2 other                       TRUE                      3529
    ##  3 trnL,                       FALSE                     1793
    ##  4 trnL,                       TRUE                       882
    ##  5 matK,                       FALSE                     1361
    ##  6 matK,                       TRUE                       523
    ##  7 5.8S,ITS2,ITS1,ITS,         FALSE                      813
    ##  8 5.8S,ITS2,ITS1,ITS,         TRUE                      1065
    ##  9 psbA,trnH,                  FALSE                      922
    ## 10 psbA,trnH,                  TRUE                       406
    ## 11 rbcL,                       FALSE                      333
    ## 12 rbcL,                       TRUE                       289
    ## 13 26S,18S,5.8S,ITS2,ITS1,ITS, FALSE                      297
    ## 14 26S,18S,5.8S,ITS2,ITS1,ITS, TRUE                       183
    ## 15 ycf1,                       FALSE                      186
    ## 16 ycf1,                       TRUE                       129
    ## 17 5.8S,28S,ITS2,ITS1,ITS,     FALSE                      210
    ## 18 5.8S,28S,ITS2,ITS1,ITS,     TRUE                        62
    ## 19 18S,5.8S,28S,ITS2,ITS1,ITS, FALSE                      192
    ## 20 18S,5.8S,28S,ITS2,ITS1,ITS, TRUE                        66
    ## 21 18S,                        FALSE                      120
    ## 22 18S,                        TRUE                       115
    ## 23 18S,5.8S,ITS2,ITS1,ITS,     FALSE                       85
    ## 24 18S,5.8S,ITS2,ITS1,ITS,     TRUE                       120
    ## 25 trnL,trnT,                  FALSE                       83
    ## 26 trnL,trnT,                  TRUE                        78
    ## 27 5.8S,ITS2,ITS1,             FALSE                       63
    ## 28 5.8S,ITS2,ITS1,             TRUE                        95
    ## 29 trnT,trnD,                  FALSE                      131
    ## 30 trnT,trnD,                  TRUE                        14
    ## 31 18S,5.8S,ITS2,ITS1,         FALSE                       16
    ## 32 18S,5.8S,ITS2,ITS1,         TRUE                       124
    ## 33 trnT,trnE,trnY,trnD,        FALSE                       13
    ## 34 trnT,trnE,trnY,trnD,        TRUE                        79
    ## 35 trnY,                       FALSE                       15
    ## 36 trnY,                       TRUE                        71
    ## 37 ITS1,ITS,                   FALSE                       33
    ## 38 ITS1,ITS,                   TRUE                        22
    ## 39 ITS2,ITS,                   FALSE                       32
    ## 40 ITS2,ITS,                   TRUE                        15

![](5_EDA_genbank_files/figure-gfm/unnamed-chunk-26-1.png)<!-- -->![](5_EDA_genbank_files/figure-gfm/unnamed-chunk-26-2.png)<!-- -->![](5_EDA_genbank_files/figure-gfm/unnamed-chunk-26-3.png)<!-- -->

Number of sequences per marker for Fungi

    ## # A tibble: 20 x 2
    ##    Marker                      Number_sequences
    ##    <chr>                                  <int>
    ##  1 other                                     NA
    ##  2 5.8S,ITS2,ITS1,ITS,                     2373
    ##  3 18S,5.8S,28S,ITS2,ITS1,ITS,             2257
    ##  4 5.8S,28S,ITS2,ITS1,ITS,                  984
    ##  5 26S,                                     713
    ##  6 18S,5.8S,ITS2,ITS1,ITS,                  641
    ##  7 28S,                                     600
    ##  8 18S,ITS1,ITS,                            315
    ##  9 5.8S,28S,ITS2,ITS,                       267
    ## 10 18S,                                     205
    ## 11 5.8S,ITS1,ITS,                            76
    ## 12 ITS1,ITS,                                 67
    ## 13 18S,28S,                                  47
    ## 14 18S,5.8S,28S,ITS2,ITS1,                   47
    ## 15 ITS,                                      38
    ## 16 ITS1,                                     30
    ## 17 5.8S,ITS2,ITS,                            27
    ## 18 Rho,                                      25
    ## 19 5.8S,28S,ITS2,ITS1,                       18
    ## 20 CYTB,                                     13

    ## # A tibble: 40 x 3
    ## # Groups:   Marker [20]
    ##    Marker                      latlon_info Number_sequences
    ##    <chr>                       <lgl>                  <dbl>
    ##  1 other                       FALSE                  16905
    ##  2 other                       TRUE                    2423
    ##  3 5.8S,ITS2,ITS1,ITS,         FALSE                   1766
    ##  4 5.8S,ITS2,ITS1,ITS,         TRUE                     607
    ##  5 18S,5.8S,28S,ITS2,ITS1,ITS, FALSE                   2102
    ##  6 18S,5.8S,28S,ITS2,ITS1,ITS, TRUE                     155
    ##  7 5.8S,28S,ITS2,ITS1,ITS,     FALSE                    780
    ##  8 5.8S,28S,ITS2,ITS1,ITS,     TRUE                     204
    ##  9 26S,                        FALSE                    646
    ## 10 26S,                        TRUE                      67
    ## 11 18S,5.8S,ITS2,ITS1,ITS,     FALSE                    225
    ## 12 18S,5.8S,ITS2,ITS1,ITS,     TRUE                     416
    ## 13 28S,                        FALSE                    591
    ## 14 28S,                        TRUE                       9
    ## 15 18S,ITS1,ITS,               FALSE                    315
    ## 16 18S,ITS1,ITS,               TRUE                       0
    ## 17 5.8S,28S,ITS2,ITS,          FALSE                     80
    ## 18 5.8S,28S,ITS2,ITS,          TRUE                     187
    ## 19 18S,                        FALSE                    196
    ## 20 18S,                        TRUE                       9
    ## 21 5.8S,ITS1,ITS,              FALSE                     73
    ## 22 5.8S,ITS1,ITS,              TRUE                       3
    ## 23 ITS1,ITS,                   FALSE                     66
    ## 24 ITS1,ITS,                   TRUE                       1
    ## 25 18S,5.8S,28S,ITS2,ITS1,     FALSE                     45
    ## 26 18S,5.8S,28S,ITS2,ITS1,     TRUE                       2
    ## 27 18S,28S,                    FALSE                     47
    ## 28 18S,28S,                    TRUE                       0
    ## 29 ITS,                        FALSE                     36
    ## 30 ITS,                        TRUE                       2
    ## 31 ITS1,                       FALSE                     30
    ## 32 ITS1,                       TRUE                       0
    ## 33 5.8S,ITS2,ITS,              FALSE                     25
    ## 34 5.8S,ITS2,ITS,              TRUE                       2
    ## 35 Rho,                        FALSE                     24
    ## 36 Rho,                        TRUE                       1
    ## 37 5.8S,28S,ITS2,ITS1,         FALSE                     18
    ## 38 5.8S,28S,ITS2,ITS1,         TRUE                       0
    ## 39 CYTB,                       FALSE                     13
    ## 40 CYTB,                       TRUE                       0

    ## # A tibble: 40 x 3
    ## # Groups:   Marker [20]
    ##    Marker                      locality_info Number_sequences
    ##    <chr>                       <lgl>                    <dbl>
    ##  1 other                       FALSE                     7097
    ##  2 other                       TRUE                     12231
    ##  3 5.8S,ITS2,ITS1,ITS,         FALSE                     1251
    ##  4 5.8S,ITS2,ITS1,ITS,         TRUE                      1122
    ##  5 18S,5.8S,28S,ITS2,ITS1,ITS, FALSE                     1613
    ##  6 18S,5.8S,28S,ITS2,ITS1,ITS, TRUE                       644
    ##  7 5.8S,28S,ITS2,ITS1,ITS,     FALSE                      773
    ##  8 5.8S,28S,ITS2,ITS1,ITS,     TRUE                       211
    ##  9 26S,                        FALSE                      208
    ## 10 26S,                        TRUE                       505
    ## 11 18S,5.8S,ITS2,ITS1,ITS,     FALSE                      399
    ## 12 18S,5.8S,ITS2,ITS1,ITS,     TRUE                       242
    ## 13 28S,                        FALSE                      502
    ## 14 28S,                        TRUE                        98
    ## 15 18S,ITS1,ITS,               FALSE                        7
    ## 16 18S,ITS1,ITS,               TRUE                       308
    ## 17 5.8S,28S,ITS2,ITS,          FALSE                       25
    ## 18 5.8S,28S,ITS2,ITS,          TRUE                       242
    ## 19 18S,                        FALSE                      147
    ## 20 18S,                        TRUE                        58
    ## 21 5.8S,ITS1,ITS,              FALSE                       62
    ## 22 5.8S,ITS1,ITS,              TRUE                        14
    ## 23 ITS1,ITS,                   FALSE                       36
    ## 24 ITS1,ITS,                   TRUE                        31
    ## 25 18S,5.8S,28S,ITS2,ITS1,     FALSE                        7
    ## 26 18S,5.8S,28S,ITS2,ITS1,     TRUE                        40
    ## 27 18S,28S,                    FALSE                       10
    ## 28 18S,28S,                    TRUE                        37
    ## 29 ITS,                        FALSE                       30
    ## 30 ITS,                        TRUE                         8
    ## 31 ITS1,                       TRUE                        30
    ## 32 ITS1,                       FALSE                        0
    ## 33 5.8S,ITS2,ITS,              FALSE                        9
    ## 34 5.8S,ITS2,ITS,              TRUE                        18
    ## 35 Rho,                        FALSE                        6
    ## 36 Rho,                        TRUE                        19
    ## 37 5.8S,28S,ITS2,ITS1,         FALSE                        8
    ## 38 5.8S,28S,ITS2,ITS1,         TRUE                        10
    ## 39 CYTB,                       TRUE                        13
    ## 40 CYTB,                       FALSE                        0

![](5_EDA_genbank_files/figure-gfm/unnamed-chunk-28-1.png)<!-- -->![](5_EDA_genbank_files/figure-gfm/unnamed-chunk-28-2.png)<!-- -->![](5_EDA_genbank_files/figure-gfm/unnamed-chunk-28-3.png)<!-- -->
