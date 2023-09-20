# ael02 works with adae dataset

    Code
      cat(export_as_txt(res[1:50, ], lpp = 100))
    Output
                                                                                                 Date of    
                                                                                Adverse        First Study  
                                                                              Event MedDRA         Drug     
      Center/Patients ID            Age/Sex/Race              Treatment      Preferred Term   Administration
      ——————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-1/134            47/M/WHITE                       A: Drug X        dcd B.2.1.2.1    2020-11-04    
                                                                             dcd D.1.1.4.2    2020-11-04    
                                                                             dcd A.1.1.1.2    2020-11-04    
                                                                             dcd A.1.1.1.2    2020-11-04    
      BRA-1/141            35/F/WHITE                       C: Combination   dcd B.2.1.2.1    2020-07-25    
                                                                             dcd D.2.1.5.3    2020-07-25    
                                                                             dcd A.1.1.1.1    2020-07-25    
                                                                             dcd A.1.1.1.2    2020-07-25    
                                                                             dcd A.1.1.1.1    2020-07-25    
                                                                             dcd D.1.1.1.1    2020-07-25    
      BRA-1/236            32/M/BLACK OR AFRICAN AMERICAN   B: Placebo       dcd B.1.1.1.1    2021-01-15    
                                                                             dcd B.1.1.1.1    2021-01-15    
                                                                             dcd B.1.1.1.1    2021-01-15    
      BRA-1/265            25/M/WHITE                       C: Combination   dcd C.2.1.2.1    2019-10-07    
                                                                             dcd D.1.1.4.2    2019-10-07    
                                                                             dcd D.1.1.1.1    2019-10-07    
                                                                             dcd C.1.1.1.3    2019-10-07    
      BRA-1/42             36/M/BLACK OR AFRICAN AMERICAN   A: Drug X        dcd C.2.1.2.1    2020-01-01    
                                                                             dcd D.1.1.1.1    2020-01-01    
                                                                             dcd C.2.1.2.1    2020-01-01    
                                                                             dcd A.1.1.1.2    2020-01-01    
                                                                             dcd B.2.2.3.1    2020-01-01    
                                                                             dcd A.1.1.1.2    2020-01-01    
                                                                             dcd B.1.1.1.1    2020-01-01    
                                                                             dcd A.1.1.1.2    2020-01-01    
                                                                             dcd C.1.1.1.3    2020-01-01    
                                                                             dcd B.1.1.1.1    2020-01-01    
      BRA-1/65             25/F/BLACK OR AFRICAN AMERICAN   B: Placebo       dcd C.2.1.2.1    2019-07-15    
                                                                             dcd D.2.1.5.3    2019-07-15    
                                                                             dcd B.1.1.1.1    2019-07-15    
                                                                             dcd C.1.1.1.3    2019-07-15    
      BRA-1/93             34/F/ASIAN                       A: Drug X        dcd D.1.1.4.2    2020-06-20    
                                                                             dcd D.2.1.5.3    2020-06-20    
                                                                             dcd A.1.1.1.1    2020-06-20    
                                                                             dcd D.2.1.5.3    2020-06-20    
                                                                             dcd C.1.1.1.3    2020-06-20    
                                                                             dcd D.1.1.1.1    2020-06-20    
                                                                             dcd B.1.1.1.1    2020-06-20    
                                                                             dcd D.2.1.5.3    2020-06-20    
                                                                             dcd B.2.2.3.1    2020-06-20    
      BRA-11/237           64/F/ASIAN                       C: Combination   dcd D.2.1.5.3    2020-03-10    
                                                                             dcd C.1.1.1.3    2020-03-10    
                                                                             dcd B.2.1.2.1    2020-03-10    
      BRA-11/321           33/F/ASIAN                       C: Combination   dcd A.1.1.1.1    2020-10-06    
                                                                             dcd A.1.1.1.1    2020-10-06    
                                                                             dcd C.2.1.2.1    2020-10-06    
                                                                             dcd D.2.1.5.3    2020-10-06    
                                                                             dcd A.1.1.1.2    2020-10-06    
                                                                             dcd D.2.1.5.3    2020-10-06    
                                                                             dcd A.1.1.1.1    2020-10-06    
      \s\n                                                                                                  
                                                                             Study       AE             
                                                                             Day of   Duration          
      Center/Patients ID            Age/Sex/Race              Treatment      Onset    in Days    Serious
      ——————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-1/134            47/M/WHITE                       A: Drug X         162       174      No     
                                                                              197       166      No     
                                                                              322       149      Yes    
                                                                              394        43      Yes    
      BRA-1/141            35/F/WHITE                       C: Combination    388        11      No     
                                                                              455       629      No     
                                                                              739        36      No     
                                                                              900       139      Yes    
                                                                              952        66      No     
                                                                              1094       3       Yes    
      BRA-1/236            32/M/BLACK OR AFRICAN AMERICAN   B: Placebo         33       615      Yes    
                                                                              271       776      Yes    
                                                                              1052       7       Yes    
      BRA-1/265            25/M/WHITE                       C: Combination     84        79      No     
                                                                              349       285      No     
                                                                              686        37      Yes    
                                                                              706        66      No     
      BRA-1/42             36/M/BLACK OR AFRICAN AMERICAN   A: Drug X          39       507      No     
                                                                               65       630      Yes    
                                                                               95       307      No     
                                                                              160       260      Yes    
                                                                              292        51      Yes    
                                                                              460       195      Yes    
                                                                              470       131      Yes    
                                                                              476       113      Yes    
                                                                              497       162      No     
                                                                              642        15      Yes    
      BRA-1/65             25/F/BLACK OR AFRICAN AMERICAN   B: Placebo        217       360      No     
                                                                              286       174      No     
                                                                              349       442      Yes    
                                                                              697        7       No     
      BRA-1/93             34/F/ASIAN                       A: Drug X          44        47      No     
                                                                               79       300      No     
                                                                              136        78      No     
                                                                              260       306      No     
                                                                              281       107      No     
                                                                              317       250      Yes    
                                                                              524        24      Yes    
                                                                              567        40      No     
                                                                              597        10      Yes    
      BRA-11/237           64/F/ASIAN                       C: Combination    157       564      No     
                                                                              341       239      No     
                                                                              1069       13      No     
      BRA-11/321           33/F/ASIAN                       C: Combination     37       129      No     
                                                                              320       481      No     
                                                                              406       395      No     
                                                                              427       328      No     
                                                                              428       335      Yes    
                                                                              627       389      No     
                                                                              640       168      No     
      \s\n                                                                                                      
                                                                               Most      Caused by          
                                                                              Extreme      Study     Outcome
      Center/Patients ID            Age/Sex/Race              Treatment      Intensity     Drug        (1)  
      ——————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-1/134            47/M/WHITE                       A: Drug X        MODERATE    No             5   
                                                                             MODERATE    No             5   
                                                                             MODERATE    No             5   
                                                                             MODERATE    No             5   
      BRA-1/141            35/F/WHITE                       C: Combination   MODERATE    No             3   
                                                                             MILD        Yes            3   
                                                                             MILD        No             4   
                                                                             MODERATE    No             4   
                                                                             MILD        No             5   
                                                                             SEVERE      Yes            1   
      BRA-1/236            32/M/BLACK OR AFRICAN AMERICAN   B: Placebo       SEVERE      Yes            1   
                                                                             SEVERE      Yes            1   
                                                                             SEVERE      Yes            1   
      BRA-1/265            25/M/WHITE                       C: Combination   MODERATE    Yes            2   
                                                                             MODERATE    No             3   
                                                                             SEVERE      Yes            1   
                                                                             SEVERE      Yes            4   
      BRA-1/42             36/M/BLACK OR AFRICAN AMERICAN   A: Drug X        MODERATE    Yes            2   
                                                                             SEVERE      Yes            1   
                                                                             MODERATE    Yes            5   
                                                                             MODERATE    No             2   
                                                                             MILD        No             3   
                                                                             MODERATE    No             5   
                                                                             SEVERE      Yes            1   
                                                                             MODERATE    No             4   
                                                                             SEVERE      Yes            5   
                                                                             SEVERE      Yes            1   
      BRA-1/65             25/F/BLACK OR AFRICAN AMERICAN   B: Placebo       MODERATE    Yes            2   
                                                                             MILD        Yes            3   
                                                                             SEVERE      Yes            1   
                                                                             SEVERE      Yes            6   
      BRA-1/93             34/F/ASIAN                       A: Drug X        MODERATE    No             5   
                                                                             MILD        Yes            5   
                                                                             MILD        No             3   
                                                                             MILD        Yes            5   
                                                                             SEVERE      Yes            5   
                                                                             SEVERE      Yes            1   
                                                                             SEVERE      Yes            1   
                                                                             MILD        Yes            6   
                                                                             MILD        No             3   
      BRA-11/237           64/F/ASIAN                       C: Combination   MILD        Yes            3   
                                                                             SEVERE      Yes            4   
                                                                             MODERATE    No             3   
      BRA-11/321           33/F/ASIAN                       C: Combination   MILD        No             5   
                                                                             MILD        No             5   
                                                                             MODERATE    Yes            4   
                                                                             MILD        Yes            4   
                                                                             MODERATE    No             3   
                                                                             MILD        Yes            5   
                                                                             MILD        No             3   
      \s\n                                                                                         
                                                                                         Action
                                                                             Treatment   Taken 
      Center/Patients ID            Age/Sex/Race              Treatment       for AE      (2)  
      —————————————————————————————————————————————————————————————————————————————————————————
      BRA-1/134            47/M/WHITE                       A: Drug X        Yes           2   
                                                                             No            2   
                                                                             Yes           2   
                                                                             No            5   
      BRA-1/141            35/F/WHITE                       C: Combination   Yes           1   
                                                                             No            1   
                                                                             Yes           3   
                                                                             Yes           2   
                                                                             No            1   
                                                                             No            6   
      BRA-1/236            32/M/BLACK OR AFRICAN AMERICAN   B: Placebo       No            6   
                                                                             Yes           6   
                                                                             Yes           6   
      BRA-1/265            25/M/WHITE                       C: Combination   Yes           5   
                                                                             Yes           7   
                                                                             No            6   
                                                                             Yes           7   
      BRA-1/42             36/M/BLACK OR AFRICAN AMERICAN   A: Drug X        No            6   
                                                                             No            6   
                                                                             No            2   
                                                                             Yes           2   
                                                                             No            2   
                                                                             Yes           2   
                                                                             No            6   
                                                                             Yes           2   
                                                                             Yes           2   
                                                                             Yes           6   
      BRA-1/65             25/F/BLACK OR AFRICAN AMERICAN   B: Placebo       Yes           2   
                                                                             Yes           2   
                                                                             No            6   
                                                                             No            3   
      BRA-1/93             34/F/ASIAN                       A: Drug X        Yes           2   
                                                                             No            3   
                                                                             Yes           2   
                                                                             No            2   
                                                                             Yes           2   
                                                                             No            6   
                                                                             No            6   
                                                                             No            3   
                                                                             Yes           2   
      BRA-11/237           64/F/ASIAN                       C: Combination   No            6   
                                                                             No            5   
                                                                             No            3   
      BRA-11/321           33/F/ASIAN                       C: Combination   No            2   
                                                                             No            2   
                                                                             No            2   
                                                                             No            6   
                                                                             No            2   
                                                                             No            2   
                                                                             Yes           2   

# ael02 can handle all missing values

    Code
      cat(export_as_txt(res[1:50, ], lpp = 100))
    Output
                                                                                            Date of    
                                                                           Adverse        First Study  
                                                                         Event MedDRA         Drug     
      Center/Patients ID            Age/Sex/Race            Treatment   Preferred Term   Administration
      —————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-1/134            47/M/WHITE                       <Missing>   <Missing>        2020-11-04    
                                                                        <Missing>        2020-11-04    
                                                                        <Missing>        2020-11-04    
                                                                        <Missing>        2020-11-04    
      BRA-1/141            35/F/WHITE                       <Missing>   <Missing>        2020-07-25    
                                                                        <Missing>        2020-07-25    
                                                                        <Missing>        2020-07-25    
                                                                        <Missing>        2020-07-25    
                                                                        <Missing>        2020-07-25    
                                                                        <Missing>        2020-07-25    
      BRA-1/236            32/M/BLACK OR AFRICAN AMERICAN   <Missing>   <Missing>        2021-01-15    
                                                                        <Missing>        2021-01-15    
                                                                        <Missing>        2021-01-15    
      BRA-1/265            25/M/WHITE                       <Missing>   <Missing>        2019-10-07    
                                                                        <Missing>        2019-10-07    
                                                                        <Missing>        2019-10-07    
                                                                        <Missing>        2019-10-07    
      BRA-1/42             36/M/BLACK OR AFRICAN AMERICAN   <Missing>   <Missing>        2020-01-01    
                                                                        <Missing>        2020-01-01    
                                                                        <Missing>        2020-01-01    
                                                                        <Missing>        2020-01-01    
                                                                        <Missing>        2020-01-01    
                                                                        <Missing>        2020-01-01    
                                                                        <Missing>        2020-01-01    
                                                                        <Missing>        2020-01-01    
                                                                        <Missing>        2020-01-01    
                                                                        <Missing>        2020-01-01    
      BRA-1/65             25/F/BLACK OR AFRICAN AMERICAN   <Missing>   <Missing>        2019-07-15    
                                                                        <Missing>        2019-07-15    
                                                                        <Missing>        2019-07-15    
                                                                        <Missing>        2019-07-15    
      BRA-1/93             34/F/ASIAN                       <Missing>   <Missing>        2020-06-20    
                                                                        <Missing>        2020-06-20    
                                                                        <Missing>        2020-06-20    
                                                                        <Missing>        2020-06-20    
                                                                        <Missing>        2020-06-20    
                                                                        <Missing>        2020-06-20    
                                                                        <Missing>        2020-06-20    
                                                                        <Missing>        2020-06-20    
                                                                        <Missing>        2020-06-20    
      BRA-11/237           64/F/ASIAN                       <Missing>   <Missing>        2020-03-10    
                                                                        <Missing>        2020-03-10    
                                                                        <Missing>        2020-03-10    
      BRA-11/321           33/F/ASIAN                       <Missing>   <Missing>        2020-10-06    
                                                                        <Missing>        2020-10-06    
                                                                        <Missing>        2020-10-06    
                                                                        <Missing>        2020-10-06    
                                                                        <Missing>        2020-10-06    
                                                                        <Missing>        2020-10-06    
                                                                        <Missing>        2020-10-06    
      \s\n                                                                                             
                                                                        Study       AE             
                                                                        Day of   Duration          
      Center/Patients ID            Age/Sex/Race            Treatment   Onset    in Days    Serious
      —————————————————————————————————————————————————————————————————————————————————————————————
      BRA-1/134            47/M/WHITE                       <Missing>    162       174      No     
                                                                         197       166      No     
                                                                         322       149      Yes    
                                                                         394        43      Yes    
      BRA-1/141            35/F/WHITE                       <Missing>    388        11      No     
                                                                         455       629      No     
                                                                         739        36      No     
                                                                         900       139      Yes    
                                                                         952        66      No     
                                                                         1094       3       Yes    
      BRA-1/236            32/M/BLACK OR AFRICAN AMERICAN   <Missing>     33       615      Yes    
                                                                         271       776      Yes    
                                                                         1052       7       Yes    
      BRA-1/265            25/M/WHITE                       <Missing>     84        79      No     
                                                                         349       285      No     
                                                                         686        37      Yes    
                                                                         706        66      No     
      BRA-1/42             36/M/BLACK OR AFRICAN AMERICAN   <Missing>     39       507      No     
                                                                          65       630      Yes    
                                                                          95       307      No     
                                                                         160       260      Yes    
                                                                         292        51      Yes    
                                                                         460       195      Yes    
                                                                         470       131      Yes    
                                                                         476       113      Yes    
                                                                         497       162      No     
                                                                         642        15      Yes    
      BRA-1/65             25/F/BLACK OR AFRICAN AMERICAN   <Missing>    217       360      No     
                                                                         286       174      No     
                                                                         349       442      Yes    
                                                                         697        7       No     
      BRA-1/93             34/F/ASIAN                       <Missing>     44        47      No     
                                                                          79       300      No     
                                                                         136        78      No     
                                                                         260       306      No     
                                                                         281       107      No     
                                                                         317       250      Yes    
                                                                         524        24      Yes    
                                                                         567        40      No     
                                                                         597        10      Yes    
      BRA-11/237           64/F/ASIAN                       <Missing>    157       564      No     
                                                                         341       239      No     
                                                                         1069       13      No     
      BRA-11/321           33/F/ASIAN                       <Missing>     37       129      No     
                                                                         320       481      No     
                                                                         406       395      No     
                                                                         427       328      No     
                                                                         428       335      Yes    
                                                                         627       389      No     
                                                                         640       168      No     
      \s\n                                                                                                 
                                                                          Most      Caused by          
                                                                         Extreme      Study     Outcome
      Center/Patients ID            Age/Sex/Race            Treatment   Intensity     Drug        (1)  
      —————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-1/134            47/M/WHITE                       <Missing>   <Missing>   No             5   
                                                                        <Missing>   No             5   
                                                                        <Missing>   No             5   
                                                                        <Missing>   No             5   
      BRA-1/141            35/F/WHITE                       <Missing>   <Missing>   No             3   
                                                                        <Missing>   Yes            3   
                                                                        <Missing>   No             4   
                                                                        <Missing>   No             4   
                                                                        <Missing>   No             5   
                                                                        <Missing>   Yes            1   
      BRA-1/236            32/M/BLACK OR AFRICAN AMERICAN   <Missing>   <Missing>   Yes            1   
                                                                        <Missing>   Yes            1   
                                                                        <Missing>   Yes            1   
      BRA-1/265            25/M/WHITE                       <Missing>   <Missing>   Yes            2   
                                                                        <Missing>   No             3   
                                                                        <Missing>   Yes            1   
                                                                        <Missing>   Yes            4   
      BRA-1/42             36/M/BLACK OR AFRICAN AMERICAN   <Missing>   <Missing>   Yes            2   
                                                                        <Missing>   Yes            1   
                                                                        <Missing>   Yes            5   
                                                                        <Missing>   No             2   
                                                                        <Missing>   No             3   
                                                                        <Missing>   No             5   
                                                                        <Missing>   Yes            1   
                                                                        <Missing>   No             4   
                                                                        <Missing>   Yes            5   
                                                                        <Missing>   Yes            1   
      BRA-1/65             25/F/BLACK OR AFRICAN AMERICAN   <Missing>   <Missing>   Yes            2   
                                                                        <Missing>   Yes            3   
                                                                        <Missing>   Yes            1   
                                                                        <Missing>   Yes            6   
      BRA-1/93             34/F/ASIAN                       <Missing>   <Missing>   No             5   
                                                                        <Missing>   Yes            5   
                                                                        <Missing>   No             3   
                                                                        <Missing>   Yes            5   
                                                                        <Missing>   Yes            5   
                                                                        <Missing>   Yes            1   
                                                                        <Missing>   Yes            1   
                                                                        <Missing>   Yes            6   
                                                                        <Missing>   No             3   
      BRA-11/237           64/F/ASIAN                       <Missing>   <Missing>   Yes            3   
                                                                        <Missing>   Yes            4   
                                                                        <Missing>   No             3   
      BRA-11/321           33/F/ASIAN                       <Missing>   <Missing>   No             5   
                                                                        <Missing>   No             5   
                                                                        <Missing>   Yes            4   
                                                                        <Missing>   Yes            4   
                                                                        <Missing>   No             3   
                                                                        <Missing>   Yes            5   
                                                                        <Missing>   No             3   
      \s\n                                                                                    
                                                                                    Action
                                                                        Treatment   Taken 
      Center/Patients ID            Age/Sex/Race            Treatment    for AE      (2)  
      ————————————————————————————————————————————————————————————————————————————————————
      BRA-1/134            47/M/WHITE                       <Missing>   Yes           2   
                                                                        No            2   
                                                                        Yes           2   
                                                                        No            5   
      BRA-1/141            35/F/WHITE                       <Missing>   Yes           1   
                                                                        No            1   
                                                                        Yes           3   
                                                                        Yes           2   
                                                                        No            1   
                                                                        No            6   
      BRA-1/236            32/M/BLACK OR AFRICAN AMERICAN   <Missing>   No            6   
                                                                        Yes           6   
                                                                        Yes           6   
      BRA-1/265            25/M/WHITE                       <Missing>   Yes           5   
                                                                        Yes           7   
                                                                        No            6   
                                                                        Yes           7   
      BRA-1/42             36/M/BLACK OR AFRICAN AMERICAN   <Missing>   No            6   
                                                                        No            6   
                                                                        No            2   
                                                                        Yes           2   
                                                                        No            2   
                                                                        Yes           2   
                                                                        No            6   
                                                                        Yes           2   
                                                                        Yes           2   
                                                                        Yes           6   
      BRA-1/65             25/F/BLACK OR AFRICAN AMERICAN   <Missing>   Yes           2   
                                                                        Yes           2   
                                                                        No            6   
                                                                        No            3   
      BRA-1/93             34/F/ASIAN                       <Missing>   Yes           2   
                                                                        No            3   
                                                                        Yes           2   
                                                                        No            2   
                                                                        Yes           2   
                                                                        No            6   
                                                                        No            6   
                                                                        No            3   
                                                                        Yes           2   
      BRA-11/237           64/F/ASIAN                       <Missing>   No            6   
                                                                        No            5   
                                                                        No            3   
      BRA-11/321           33/F/ASIAN                       <Missing>   No            2   
                                                                        No            2   
                                                                        No            2   
                                                                        No            6   
                                                                        No            2   
                                                                        No            2   
                                                                        Yes           2   

# ael02 functions work as expected

    Code
      cat(export_as_txt(res[1:50, ], lpp = 100))
    Output
                                                                                                 Date of    
                                                                                Adverse        First Study  
                                                                              Event MedDRA         Drug     
      Center/Patients ID            Age/Sex/Race              Treatment      Preferred Term   Administration
      ——————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-1/134            47/M/WHITE                       A: Drug X        dcd B.2.1.2.1    2020-11-04    
                                                                             dcd D.1.1.4.2    2020-11-04    
                                                                             dcd A.1.1.1.2    2020-11-04    
                                                                             dcd A.1.1.1.2    2020-11-04    
      BRA-1/141            35/F/WHITE                       C: Combination   dcd B.2.1.2.1    2020-07-25    
                                                                             dcd D.2.1.5.3    2020-07-25    
                                                                             dcd A.1.1.1.1    2020-07-25    
                                                                             dcd A.1.1.1.2    2020-07-25    
                                                                             dcd A.1.1.1.1    2020-07-25    
                                                                             dcd D.1.1.1.1    2020-07-25    
      BRA-1/236            32/M/BLACK OR AFRICAN AMERICAN   B: Placebo       dcd B.1.1.1.1    2021-01-15    
                                                                             dcd B.1.1.1.1    2021-01-15    
                                                                             dcd B.1.1.1.1    2021-01-15    
      BRA-1/265            25/M/WHITE                       C: Combination   dcd C.2.1.2.1    2019-10-07    
                                                                             dcd D.1.1.4.2    2019-10-07    
                                                                             dcd D.1.1.1.1    2019-10-07    
                                                                             dcd C.1.1.1.3    2019-10-07    
      BRA-1/42             36/M/BLACK OR AFRICAN AMERICAN   A: Drug X        dcd C.2.1.2.1    2020-01-01    
                                                                             dcd D.1.1.1.1    2020-01-01    
                                                                             dcd C.2.1.2.1    2020-01-01    
                                                                             dcd A.1.1.1.2    2020-01-01    
                                                                             dcd B.2.2.3.1    2020-01-01    
                                                                             dcd A.1.1.1.2    2020-01-01    
                                                                             dcd B.1.1.1.1    2020-01-01    
                                                                             dcd A.1.1.1.2    2020-01-01    
                                                                             dcd C.1.1.1.3    2020-01-01    
                                                                             dcd B.1.1.1.1    2020-01-01    
      BRA-1/65             25/F/BLACK OR AFRICAN AMERICAN   B: Placebo       dcd C.2.1.2.1    2019-07-15    
                                                                             dcd D.2.1.5.3    2019-07-15    
                                                                             dcd B.1.1.1.1    2019-07-15    
                                                                             dcd C.1.1.1.3    2019-07-15    
      BRA-1/93             34/F/ASIAN                       A: Drug X        dcd D.1.1.4.2    2020-06-20    
                                                                             dcd D.2.1.5.3    2020-06-20    
                                                                             dcd A.1.1.1.1    2020-06-20    
                                                                             dcd D.2.1.5.3    2020-06-20    
                                                                             dcd C.1.1.1.3    2020-06-20    
                                                                             dcd D.1.1.1.1    2020-06-20    
                                                                             dcd B.1.1.1.1    2020-06-20    
                                                                             dcd D.2.1.5.3    2020-06-20    
                                                                             dcd B.2.2.3.1    2020-06-20    
      BRA-11/237           64/F/ASIAN                       C: Combination   dcd D.2.1.5.3    2020-03-10    
                                                                             dcd C.1.1.1.3    2020-03-10    
                                                                             dcd B.2.1.2.1    2020-03-10    
      BRA-11/321           33/F/ASIAN                       C: Combination   dcd A.1.1.1.1    2020-10-06    
                                                                             dcd A.1.1.1.1    2020-10-06    
                                                                             dcd C.2.1.2.1    2020-10-06    
                                                                             dcd D.2.1.5.3    2020-10-06    
                                                                             dcd A.1.1.1.2    2020-10-06    
                                                                             dcd D.2.1.5.3    2020-10-06    
                                                                             dcd A.1.1.1.1    2020-10-06    
      \s\n                                                                                                  
                                                                             Study       AE             
                                                                             Day of   Duration          
      Center/Patients ID            Age/Sex/Race              Treatment      Onset    in Days    Serious
      ——————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-1/134            47/M/WHITE                       A: Drug X         162       174      No     
                                                                              197       166      No     
                                                                              322       149      Yes    
                                                                              394        43      Yes    
      BRA-1/141            35/F/WHITE                       C: Combination    388        11      No     
                                                                              455       629      No     
                                                                              739        36      No     
                                                                              900       139      Yes    
                                                                              952        66      No     
                                                                              1094       3       Yes    
      BRA-1/236            32/M/BLACK OR AFRICAN AMERICAN   B: Placebo         33       615      Yes    
                                                                              271       776      Yes    
                                                                              1052       7       Yes    
      BRA-1/265            25/M/WHITE                       C: Combination     84        79      No     
                                                                              349       285      No     
                                                                              686        37      Yes    
                                                                              706        66      No     
      BRA-1/42             36/M/BLACK OR AFRICAN AMERICAN   A: Drug X          39       507      No     
                                                                               65       630      Yes    
                                                                               95       307      No     
                                                                              160       260      Yes    
                                                                              292        51      Yes    
                                                                              460       195      Yes    
                                                                              470       131      Yes    
                                                                              476       113      Yes    
                                                                              497       162      No     
                                                                              642        15      Yes    
      BRA-1/65             25/F/BLACK OR AFRICAN AMERICAN   B: Placebo        217       360      No     
                                                                              286       174      No     
                                                                              349       442      Yes    
                                                                              697        7       No     
      BRA-1/93             34/F/ASIAN                       A: Drug X          44        47      No     
                                                                               79       300      No     
                                                                              136        78      No     
                                                                              260       306      No     
                                                                              281       107      No     
                                                                              317       250      Yes    
                                                                              524        24      Yes    
                                                                              567        40      No     
                                                                              597        10      Yes    
      BRA-11/237           64/F/ASIAN                       C: Combination    157       564      No     
                                                                              341       239      No     
                                                                              1069       13      No     
      BRA-11/321           33/F/ASIAN                       C: Combination     37       129      No     
                                                                              320       481      No     
                                                                              406       395      No     
                                                                              427       328      No     
                                                                              428       335      Yes    
                                                                              627       389      No     
                                                                              640       168      No     
      \s\n                                                                                                      
                                                                               Most      Caused by          
                                                                              Extreme      Study     Outcome
      Center/Patients ID            Age/Sex/Race              Treatment      Intensity     Drug        (1)  
      ——————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-1/134            47/M/WHITE                       A: Drug X        MODERATE    No             5   
                                                                             MODERATE    No             5   
                                                                             MODERATE    No             5   
                                                                             MODERATE    No             5   
      BRA-1/141            35/F/WHITE                       C: Combination   MODERATE    No             3   
                                                                             MILD        Yes            3   
                                                                             MILD        No             4   
                                                                             MODERATE    No             4   
                                                                             MILD        No             5   
                                                                             SEVERE      Yes            1   
      BRA-1/236            32/M/BLACK OR AFRICAN AMERICAN   B: Placebo       SEVERE      Yes            1   
                                                                             SEVERE      Yes            1   
                                                                             SEVERE      Yes            1   
      BRA-1/265            25/M/WHITE                       C: Combination   MODERATE    Yes            2   
                                                                             MODERATE    No             3   
                                                                             SEVERE      Yes            1   
                                                                             SEVERE      Yes            4   
      BRA-1/42             36/M/BLACK OR AFRICAN AMERICAN   A: Drug X        MODERATE    Yes            2   
                                                                             SEVERE      Yes            1   
                                                                             MODERATE    Yes            5   
                                                                             MODERATE    No             2   
                                                                             MILD        No             3   
                                                                             MODERATE    No             5   
                                                                             SEVERE      Yes            1   
                                                                             MODERATE    No             4   
                                                                             SEVERE      Yes            5   
                                                                             SEVERE      Yes            1   
      BRA-1/65             25/F/BLACK OR AFRICAN AMERICAN   B: Placebo       MODERATE    Yes            2   
                                                                             MILD        Yes            3   
                                                                             SEVERE      Yes            1   
                                                                             SEVERE      Yes            6   
      BRA-1/93             34/F/ASIAN                       A: Drug X        MODERATE    No             5   
                                                                             MILD        Yes            5   
                                                                             MILD        No             3   
                                                                             MILD        Yes            5   
                                                                             SEVERE      Yes            5   
                                                                             SEVERE      Yes            1   
                                                                             SEVERE      Yes            1   
                                                                             MILD        Yes            6   
                                                                             MILD        No             3   
      BRA-11/237           64/F/ASIAN                       C: Combination   MILD        Yes            3   
                                                                             SEVERE      Yes            4   
                                                                             MODERATE    No             3   
      BRA-11/321           33/F/ASIAN                       C: Combination   MILD        No             5   
                                                                             MILD        No             5   
                                                                             MODERATE    Yes            4   
                                                                             MILD        Yes            4   
                                                                             MODERATE    No             3   
                                                                             MILD        Yes            5   
                                                                             MILD        No             3   
      \s\n                                                                                         
                                                                                         Action
                                                                             Treatment   Taken 
      Center/Patients ID            Age/Sex/Race              Treatment       for AE      (2)  
      —————————————————————————————————————————————————————————————————————————————————————————
      BRA-1/134            47/M/WHITE                       A: Drug X        Yes           2   
                                                                             No            2   
                                                                             Yes           2   
                                                                             No            5   
      BRA-1/141            35/F/WHITE                       C: Combination   Yes           1   
                                                                             No            1   
                                                                             Yes           3   
                                                                             Yes           2   
                                                                             No            1   
                                                                             No            6   
      BRA-1/236            32/M/BLACK OR AFRICAN AMERICAN   B: Placebo       No            6   
                                                                             Yes           6   
                                                                             Yes           6   
      BRA-1/265            25/M/WHITE                       C: Combination   Yes           5   
                                                                             Yes           7   
                                                                             No            6   
                                                                             Yes           7   
      BRA-1/42             36/M/BLACK OR AFRICAN AMERICAN   A: Drug X        No            6   
                                                                             No            6   
                                                                             No            2   
                                                                             Yes           2   
                                                                             No            2   
                                                                             Yes           2   
                                                                             No            6   
                                                                             Yes           2   
                                                                             Yes           2   
                                                                             Yes           6   
      BRA-1/65             25/F/BLACK OR AFRICAN AMERICAN   B: Placebo       Yes           2   
                                                                             Yes           2   
                                                                             No            6   
                                                                             No            3   
      BRA-1/93             34/F/ASIAN                       A: Drug X        Yes           2   
                                                                             No            3   
                                                                             Yes           2   
                                                                             No            2   
                                                                             Yes           2   
                                                                             No            6   
                                                                             No            6   
                                                                             No            3   
                                                                             Yes           2   
      BRA-11/237           64/F/ASIAN                       C: Combination   No            6   
                                                                             No            5   
                                                                             No            3   
      BRA-11/321           33/F/ASIAN                       C: Combination   No            2   
                                                                             No            2   
                                                                             No            2   
                                                                             No            6   
                                                                             No            2   
                                                                             No            2   
                                                                             Yes           2   

