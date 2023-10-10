# ael03 works with adae dataset

    Code
      cat(export_as_txt(res[1:50, ], lpp = 100))
    Output
                                                                                                Date of    
                                                                               Adverse        First Study  
                                                                             Event MedDRA         Drug     
      Center/Patient ID            Age/Sex/Race              Treatment      Preferred Term   Administration
      —————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-1/134           47/M/WHITE                       A: Drug X        dcd A.1.1.1.2    04NOV2020     
                                                                            dcd A.1.1.1.2    04NOV2020     
      BRA-1/141           35/F/WHITE                       C: Combination   dcd A.1.1.1.2    25JUL2020     
                                                                            dcd D.1.1.1.1    25JUL2020     
      BRA-1/236           32/M/BLACK OR AFRICAN AMERICAN   B: Placebo       dcd B.1.1.1.1    15JAN2021     
                                                                            dcd B.1.1.1.1    15JAN2021     
                                                                            dcd B.1.1.1.1    15JAN2021     
      BRA-1/265           25/M/WHITE                       C: Combination   dcd D.1.1.1.1    07OCT2019     
      BRA-1/42            36/M/BLACK OR AFRICAN AMERICAN   A: Drug X        dcd D.1.1.1.1    01JAN2020     
                                                                            dcd A.1.1.1.2    01JAN2020     
                                                                            dcd B.2.2.3.1    01JAN2020     
                                                                            dcd A.1.1.1.2    01JAN2020     
                                                                            dcd B.1.1.1.1    01JAN2020     
                                                                            dcd A.1.1.1.2    01JAN2020     
                                                                            dcd B.1.1.1.1    01JAN2020     
      BRA-1/65            25/F/BLACK OR AFRICAN AMERICAN   B: Placebo       dcd B.1.1.1.1    15JUL2019     
      BRA-1/93            34/F/ASIAN                       A: Drug X        dcd D.1.1.1.1    20JUN2020     
                                                                            dcd B.1.1.1.1    20JUN2020     
                                                                            dcd B.2.2.3.1    20JUN2020     
      BRA-11/321          33/F/ASIAN                       C: Combination   dcd A.1.1.1.2    06OCT2020     
                                                                            dcd B.1.1.1.1    06OCT2020     
      BRA-11/345          37/F/WHITE                       A: Drug X        dcd B.1.1.1.1    18AUG2020     
      BRA-11/397          38/M/ASIAN                       A: Drug X        dcd D.1.1.1.1    27JUN2020     
                                                                            dcd B.1.1.1.1    27JUN2020     
      BRA-11/50           26/M/BLACK OR AFRICAN AMERICAN   A: Drug X        dcd A.1.1.1.2    28APR2019     
      BRA-11/9            40/M/ASIAN                       C: Combination   dcd B.2.2.3.1    26MAR2019     
                                                                            dcd D.1.1.1.1    26MAR2019     
                                                                            dcd B.1.1.1.1    26MAR2019     
                                                                            dcd B.2.2.3.1    26MAR2019     
      BRA-12/59           36/M/BLACK OR AFRICAN AMERICAN   B: Placebo       dcd D.1.1.1.1    26NOV2019     
                                                                            dcd B.2.2.3.1    26NOV2019     
      BRA-13/177          24/M/WHITE                       A: Drug X        dcd B.1.1.1.1    30AUG2020     
                                                                            dcd B.1.1.1.1    30AUG2020     
      BRA-14/120          33/F/ASIAN                       C: Combination   dcd A.1.1.1.2    19SEP2020     
                                                                            dcd A.1.1.1.2    19SEP2020     
                                                                            dcd A.1.1.1.2    19SEP2020     
                                                                            dcd A.1.1.1.2    19SEP2020     
                                                                            dcd A.1.1.1.2    19SEP2020     
                                                                            dcd B.2.2.3.1    19SEP2020     
      BRA-15/36           38/F/ASIAN                       A: Drug X        dcd B.1.1.1.1    08JAN2020     
                                                                            dcd A.1.1.1.2    08JAN2020     
      BRA-2/101           34/M/ASIAN                       B: Placebo       dcd A.1.1.1.2    26JUN2020     
      BRA-2/296           44/F/ASIAN                       A: Drug X        dcd A.1.1.1.2    22JAN2021     
                                                                            dcd A.1.1.1.2    22JAN2021     
                                                                            dcd B.1.1.1.1    22JAN2021     
      BRA-3/8             25/F/BLACK OR AFRICAN AMERICAN   B: Placebo       dcd A.1.1.1.2    13MAR2020     
      BRA-4/368           46/M/BLACK OR AFRICAN AMERICAN   C: Combination   dcd D.1.1.1.1    25FEB2020     
                                                                            dcd B.1.1.1.1    25FEB2020     
      BRA-4/383           30/F/ASIAN                       B: Placebo       dcd A.1.1.1.2    18JAN2020     
                                                                            dcd A.1.1.1.2    18JAN2020     
      \s\n                                                                                                   
                                                                            Study       AE        Most   
                                                                            Day of   Duration    Extreme 
      Center/Patient ID            Age/Sex/Race              Treatment      Onset    in Days    Intensity
      ———————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-1/134           47/M/WHITE                       A: Drug X         322       149      MODERATE 
                                                                             394        43      MODERATE 
      BRA-1/141           35/F/WHITE                       C: Combination    900       139      MODERATE 
                                                                             1094       3       SEVERE   
      BRA-1/236           32/M/BLACK OR AFRICAN AMERICAN   B: Placebo         33       615      SEVERE   
                                                                             271       776      SEVERE   
                                                                             1052       7       SEVERE   
      BRA-1/265           25/M/WHITE                       C: Combination    686        37      SEVERE   
      BRA-1/42            36/M/BLACK OR AFRICAN AMERICAN   A: Drug X          65       630      SEVERE   
                                                                             160       260      MODERATE 
                                                                             292        51      MILD     
                                                                             460       195      MODERATE 
                                                                             470       131      SEVERE   
                                                                             476       113      MODERATE 
                                                                             642        15      SEVERE   
      BRA-1/65            25/F/BLACK OR AFRICAN AMERICAN   B: Placebo        349       442      SEVERE   
      BRA-1/93            34/F/ASIAN                       A: Drug X         317       250      SEVERE   
                                                                             524        24      SEVERE   
                                                                             597        10      MILD     
      BRA-11/321          33/F/ASIAN                       C: Combination    428       335      MODERATE 
                                                                             893        58      SEVERE   
      BRA-11/345          37/F/WHITE                       A: Drug X         1010       35      SEVERE   
      BRA-11/397          38/M/ASIAN                       A: Drug X         517       441      SEVERE   
                                                                             1012       30      SEVERE   
      BRA-11/50           26/M/BLACK OR AFRICAN AMERICAN   A: Drug X         1008       68      MODERATE 
      BRA-11/9            40/M/ASIAN                       C: Combination    441        53      MILD     
                                                                             445       598      SEVERE   
                                                                             644        42      SEVERE   
                                                                             669       100      MILD     
      BRA-12/59           36/M/BLACK OR AFRICAN AMERICAN   B: Placebo         9        233      SEVERE   
                                                                             230       160      MILD     
      BRA-13/177          24/M/WHITE                       A: Drug X         249       470      SEVERE   
                                                                             1013       33      SEVERE   
      BRA-14/120          33/F/ASIAN                       C: Combination     4        246      MODERATE 
                                                                              75       393      MODERATE 
                                                                              93       329      MODERATE 
                                                                             208       190      MODERATE 
                                                                             251       143      MODERATE 
                                                                             505        7       MILD     
      BRA-15/36           38/F/ASIAN                       A: Drug X         372       154      SEVERE   
                                                                             574       134      MODERATE 
      BRA-2/101           34/M/ASIAN                       B: Placebo        650       301      MODERATE 
      BRA-2/296           44/F/ASIAN                       A: Drug X         204       488      MODERATE 
                                                                             289       259      MODERATE 
                                                                             1043       53      SEVERE   
      BRA-3/8             25/F/BLACK OR AFRICAN AMERICAN   B: Placebo         48        98      MODERATE 
      BRA-4/368           46/M/BLACK OR AFRICAN AMERICAN   C: Combination    837       114      SEVERE   
                                                                             842       247      SEVERE   
      BRA-4/383           30/F/ASIAN                       B: Placebo        253       212      MODERATE 
                                                                             286       191      MODERATE 
      \s\n                                                                                                     
                                                                            Caused by                      
                                                                              Study     Outcome   Treatment
      Center/Patient ID            Age/Sex/Race              Treatment        Drug        (1)      for AE  
      —————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-1/134           47/M/WHITE                       A: Drug X        No             5      Yes      
                                                                            No             5      No       
      BRA-1/141           35/F/WHITE                       C: Combination   No             4      Yes      
                                                                            Yes            1      No       
      BRA-1/236           32/M/BLACK OR AFRICAN AMERICAN   B: Placebo       Yes            1      No       
                                                                            Yes            1      Yes      
                                                                            Yes            1      Yes      
      BRA-1/265           25/M/WHITE                       C: Combination   Yes            1      No       
      BRA-1/42            36/M/BLACK OR AFRICAN AMERICAN   A: Drug X        Yes            1      No       
                                                                            No             2      Yes      
                                                                            No             3      No       
                                                                            No             5      Yes      
                                                                            Yes            1      No       
                                                                            No             4      Yes      
                                                                            Yes            1      Yes      
      BRA-1/65            25/F/BLACK OR AFRICAN AMERICAN   B: Placebo       Yes            1      No       
      BRA-1/93            34/F/ASIAN                       A: Drug X        Yes            1      No       
                                                                            Yes            1      No       
                                                                            No             3      Yes      
      BRA-11/321          33/F/ASIAN                       C: Combination   No             3      No       
                                                                            Yes            1      Yes      
      BRA-11/345          37/F/WHITE                       A: Drug X        Yes            1      No       
      BRA-11/397          38/M/ASIAN                       A: Drug X        Yes            1      No       
                                                                            Yes            1      Yes      
      BRA-11/50           26/M/BLACK OR AFRICAN AMERICAN   A: Drug X        No             3      Yes      
      BRA-11/9            40/M/ASIAN                       C: Combination   No             5      No       
                                                                            Yes            1      No       
                                                                            Yes            1      No       
                                                                            No             5      Yes      
      BRA-12/59           36/M/BLACK OR AFRICAN AMERICAN   B: Placebo       Yes            1      Yes      
                                                                            No             3      No       
      BRA-13/177          24/M/WHITE                       A: Drug X        Yes            1      No       
                                                                            Yes            1      No       
      BRA-14/120          33/F/ASIAN                       C: Combination   No             2      No       
                                                                            No             6      No       
                                                                            No             6      No       
                                                                            No             5      No       
                                                                            No             3      No       
                                                                            No             4      No       
      BRA-15/36           38/F/ASIAN                       A: Drug X        Yes            1      Yes      
                                                                            No             3      Yes      
      BRA-2/101           34/M/ASIAN                       B: Placebo       No             5      Yes      
      BRA-2/296           44/F/ASIAN                       A: Drug X        No             5      Yes      
                                                                            No             2      Yes      
                                                                            Yes            1      No       
      BRA-3/8             25/F/BLACK OR AFRICAN AMERICAN   B: Placebo       No             3      Yes      
      BRA-4/368           46/M/BLACK OR AFRICAN AMERICAN   C: Combination   Yes            1      No       
                                                                            Yes            1      No       
      BRA-4/383           30/F/ASIAN                       B: Placebo       No             2      No       
                                                                            No             4      Yes      
      \s\n                                                                                 Reason  
                                                                            Action   Classified
                                                                            Taken    as Serious
      Center/Patient ID            Age/Sex/Race              Treatment       (2)        (3)    
      —————————————————————————————————————————————————————————————————————————————————————————
      BRA-1/134           47/M/WHITE                       A: Drug X          2      4         
                                                                              5      5         
      BRA-1/141           35/F/WHITE                       C: Combination     2      4         
                                                                              6      1         
      BRA-1/236           32/M/BLACK OR AFRICAN AMERICAN   B: Placebo         6      1         
                                                                              6      1         
                                                                              6      1         
      BRA-1/265           25/M/WHITE                       C: Combination     6      1         
      BRA-1/42            36/M/BLACK OR AFRICAN AMERICAN   A: Drug X          6      1         
                                                                              2      4         
                                                                              2      4         
                                                                              2      5         
                                                                              6      1         
                                                                              2      4         
                                                                              6      1         
      BRA-1/65            25/F/BLACK OR AFRICAN AMERICAN   B: Placebo         6      1         
      BRA-1/93            34/F/ASIAN                       A: Drug X          6      1         
                                                                              6      1         
                                                                              2      4         
      BRA-11/321          33/F/ASIAN                       C: Combination     2      2         
                                                                              6      1         
      BRA-11/345          37/F/WHITE                       A: Drug X          6      1         
      BRA-11/397          38/M/ASIAN                       A: Drug X          6      1         
                                                                              6      1         
      BRA-11/50           26/M/BLACK OR AFRICAN AMERICAN   A: Drug X          2      5         
      BRA-11/9            40/M/ASIAN                       C: Combination     2      3         
                                                                              6      1         
                                                                              6      1         
                                                                              2      3         
      BRA-12/59           36/M/BLACK OR AFRICAN AMERICAN   B: Placebo         6      1         
                                                                              2      3         
      BRA-13/177          24/M/WHITE                       A: Drug X          6      1         
                                                                              6      1         
      BRA-14/120          33/F/ASIAN                       C: Combination     5      6         
                                                                              2      6         
                                                                              2      3         
                                                                              3      4         
                                                                              5      4         
                                                                              7      6         
      BRA-15/36           38/F/ASIAN                       A: Drug X          6      1         
                                                                              2      3         
      BRA-2/101           34/M/ASIAN                       B: Placebo         2      4         
      BRA-2/296           44/F/ASIAN                       A: Drug X          2      4         
                                                                              2      3         
                                                                              6      1         
      BRA-3/8             25/F/BLACK OR AFRICAN AMERICAN   B: Placebo         3      4         
      BRA-4/368           46/M/BLACK OR AFRICAN AMERICAN   C: Combination     6      1         
                                                                              6      1         
      BRA-4/383           30/F/ASIAN                       B: Placebo         6      5         
                                                                              7      3         

# ael03 can handle all missing values

    Code
      cat(export_as_txt(res[1:50, ], lpp = 100))
    Output
                                                                                           Date of    
                                                                          Adverse        First Study  
                                                                        Event MedDRA         Drug     
      Center/Patient ID            Age/Sex/Race            Treatment   Preferred Term   Administration
      ————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-1/134           47/M/WHITE                       <Missing>   <Missing>        04NOV2020     
                                                                       <Missing>        04NOV2020     
      BRA-1/141           35/F/WHITE                       <Missing>   <Missing>        25JUL2020     
                                                                       <Missing>        25JUL2020     
      BRA-1/236           32/M/BLACK OR AFRICAN AMERICAN   <Missing>   <Missing>        15JAN2021     
                                                                       <Missing>        15JAN2021     
                                                                       <Missing>        15JAN2021     
      BRA-1/265           25/M/WHITE                       <Missing>   <Missing>        07OCT2019     
      BRA-1/42            36/M/BLACK OR AFRICAN AMERICAN   <Missing>   <Missing>        01JAN2020     
                                                                       <Missing>        01JAN2020     
                                                                       <Missing>        01JAN2020     
                                                                       <Missing>        01JAN2020     
                                                                       <Missing>        01JAN2020     
                                                                       <Missing>        01JAN2020     
                                                                       <Missing>        01JAN2020     
      BRA-1/65            25/F/BLACK OR AFRICAN AMERICAN   <Missing>   <Missing>        15JUL2019     
      BRA-1/93            34/F/ASIAN                       <Missing>   <Missing>        20JUN2020     
                                                                       <Missing>        20JUN2020     
                                                                       <Missing>        20JUN2020     
      BRA-11/321          33/F/ASIAN                       <Missing>   <Missing>        06OCT2020     
                                                                       <Missing>        06OCT2020     
      BRA-11/345          37/F/WHITE                       <Missing>   <Missing>        18AUG2020     
      BRA-11/397          38/M/ASIAN                       <Missing>   <Missing>        27JUN2020     
                                                                       <Missing>        27JUN2020     
      BRA-11/50           26/M/BLACK OR AFRICAN AMERICAN   <Missing>   <Missing>        28APR2019     
      BRA-11/9            40/M/ASIAN                       <Missing>   <Missing>        26MAR2019     
                                                                       <Missing>        26MAR2019     
                                                                       <Missing>        26MAR2019     
                                                                       <Missing>        26MAR2019     
      BRA-12/59           36/M/BLACK OR AFRICAN AMERICAN   <Missing>   <Missing>        26NOV2019     
                                                                       <Missing>        26NOV2019     
      BRA-13/177          24/M/WHITE                       <Missing>   <Missing>        30AUG2020     
                                                                       <Missing>        30AUG2020     
      BRA-14/120          33/F/ASIAN                       <Missing>   <Missing>        19SEP2020     
                                                                       <Missing>        19SEP2020     
                                                                       <Missing>        19SEP2020     
                                                                       <Missing>        19SEP2020     
                                                                       <Missing>        19SEP2020     
                                                                       <Missing>        19SEP2020     
      BRA-15/36           38/F/ASIAN                       <Missing>   <Missing>        08JAN2020     
                                                                       <Missing>        08JAN2020     
      BRA-2/101           34/M/ASIAN                       <Missing>   <Missing>        26JUN2020     
      BRA-2/296           44/F/ASIAN                       <Missing>   <Missing>        22JAN2021     
                                                                       <Missing>        22JAN2021     
                                                                       <Missing>        22JAN2021     
      BRA-3/8             25/F/BLACK OR AFRICAN AMERICAN   <Missing>   <Missing>        13MAR2020     
      BRA-4/368           46/M/BLACK OR AFRICAN AMERICAN   <Missing>   <Missing>        25FEB2020     
                                                                       <Missing>        25FEB2020     
      BRA-4/383           30/F/ASIAN                       <Missing>   <Missing>        18JAN2020     
                                                                       <Missing>        18JAN2020     
      \s\n                                                                                              
                                                                       Study       AE        Most   
                                                                       Day of   Duration    Extreme 
      Center/Patient ID            Age/Sex/Race            Treatment   Onset    in Days    Intensity
      ——————————————————————————————————————————————————————————————————————————————————————————————
      BRA-1/134           47/M/WHITE                       <Missing>    322       149      <Missing>
                                                                        394        43      <Missing>
      BRA-1/141           35/F/WHITE                       <Missing>    900       139      <Missing>
                                                                        1094       3       <Missing>
      BRA-1/236           32/M/BLACK OR AFRICAN AMERICAN   <Missing>     33       615      <Missing>
                                                                        271       776      <Missing>
                                                                        1052       7       <Missing>
      BRA-1/265           25/M/WHITE                       <Missing>    686        37      <Missing>
      BRA-1/42            36/M/BLACK OR AFRICAN AMERICAN   <Missing>     65       630      <Missing>
                                                                        160       260      <Missing>
                                                                        292        51      <Missing>
                                                                        460       195      <Missing>
                                                                        470       131      <Missing>
                                                                        476       113      <Missing>
                                                                        642        15      <Missing>
      BRA-1/65            25/F/BLACK OR AFRICAN AMERICAN   <Missing>    349       442      <Missing>
      BRA-1/93            34/F/ASIAN                       <Missing>    317       250      <Missing>
                                                                        524        24      <Missing>
                                                                        597        10      <Missing>
      BRA-11/321          33/F/ASIAN                       <Missing>    428       335      <Missing>
                                                                        893        58      <Missing>
      BRA-11/345          37/F/WHITE                       <Missing>    1010       35      <Missing>
      BRA-11/397          38/M/ASIAN                       <Missing>    517       441      <Missing>
                                                                        1012       30      <Missing>
      BRA-11/50           26/M/BLACK OR AFRICAN AMERICAN   <Missing>    1008       68      <Missing>
      BRA-11/9            40/M/ASIAN                       <Missing>    441        53      <Missing>
                                                                        445       598      <Missing>
                                                                        644        42      <Missing>
                                                                        669       100      <Missing>
      BRA-12/59           36/M/BLACK OR AFRICAN AMERICAN   <Missing>     9        233      <Missing>
                                                                        230       160      <Missing>
      BRA-13/177          24/M/WHITE                       <Missing>    249       470      <Missing>
                                                                        1013       33      <Missing>
      BRA-14/120          33/F/ASIAN                       <Missing>     4        246      <Missing>
                                                                         75       393      <Missing>
                                                                         93       329      <Missing>
                                                                        208       190      <Missing>
                                                                        251       143      <Missing>
                                                                        505        7       <Missing>
      BRA-15/36           38/F/ASIAN                       <Missing>    372       154      <Missing>
                                                                        574       134      <Missing>
      BRA-2/101           34/M/ASIAN                       <Missing>    650       301      <Missing>
      BRA-2/296           44/F/ASIAN                       <Missing>    204       488      <Missing>
                                                                        289       259      <Missing>
                                                                        1043       53      <Missing>
      BRA-3/8             25/F/BLACK OR AFRICAN AMERICAN   <Missing>     48        98      <Missing>
      BRA-4/368           46/M/BLACK OR AFRICAN AMERICAN   <Missing>    837       114      <Missing>
                                                                        842       247      <Missing>
      BRA-4/383           30/F/ASIAN                       <Missing>    253       212      <Missing>
                                                                        286       191      <Missing>
      \s\n                                                                                                
                                                                       Caused by                      
                                                                         Study     Outcome   Treatment
      Center/Patient ID            Age/Sex/Race            Treatment     Drug        (1)      for AE  
      ————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-1/134           47/M/WHITE                       <Missing>   No             5      Yes      
                                                                       No             5      No       
      BRA-1/141           35/F/WHITE                       <Missing>   No             4      Yes      
                                                                       Yes            1      No       
      BRA-1/236           32/M/BLACK OR AFRICAN AMERICAN   <Missing>   Yes            1      No       
                                                                       Yes            1      Yes      
                                                                       Yes            1      Yes      
      BRA-1/265           25/M/WHITE                       <Missing>   Yes            1      No       
      BRA-1/42            36/M/BLACK OR AFRICAN AMERICAN   <Missing>   Yes            1      No       
                                                                       No             2      Yes      
                                                                       No             3      No       
                                                                       No             5      Yes      
                                                                       Yes            1      No       
                                                                       No             4      Yes      
                                                                       Yes            1      Yes      
      BRA-1/65            25/F/BLACK OR AFRICAN AMERICAN   <Missing>   Yes            1      No       
      BRA-1/93            34/F/ASIAN                       <Missing>   Yes            1      No       
                                                                       Yes            1      No       
                                                                       No             3      Yes      
      BRA-11/321          33/F/ASIAN                       <Missing>   No             3      No       
                                                                       Yes            1      Yes      
      BRA-11/345          37/F/WHITE                       <Missing>   Yes            1      No       
      BRA-11/397          38/M/ASIAN                       <Missing>   Yes            1      No       
                                                                       Yes            1      Yes      
      BRA-11/50           26/M/BLACK OR AFRICAN AMERICAN   <Missing>   No             3      Yes      
      BRA-11/9            40/M/ASIAN                       <Missing>   No             5      No       
                                                                       Yes            1      No       
                                                                       Yes            1      No       
                                                                       No             5      Yes      
      BRA-12/59           36/M/BLACK OR AFRICAN AMERICAN   <Missing>   Yes            1      Yes      
                                                                       No             3      No       
      BRA-13/177          24/M/WHITE                       <Missing>   Yes            1      No       
                                                                       Yes            1      No       
      BRA-14/120          33/F/ASIAN                       <Missing>   No             2      No       
                                                                       No             6      No       
                                                                       No             6      No       
                                                                       No             5      No       
                                                                       No             3      No       
                                                                       No             4      No       
      BRA-15/36           38/F/ASIAN                       <Missing>   Yes            1      Yes      
                                                                       No             3      Yes      
      BRA-2/101           34/M/ASIAN                       <Missing>   No             5      Yes      
      BRA-2/296           44/F/ASIAN                       <Missing>   No             5      Yes      
                                                                       No             2      Yes      
                                                                       Yes            1      No       
      BRA-3/8             25/F/BLACK OR AFRICAN AMERICAN   <Missing>   No             3      Yes      
      BRA-4/368           46/M/BLACK OR AFRICAN AMERICAN   <Missing>   Yes            1      No       
                                                                       Yes            1      No       
      BRA-4/383           30/F/ASIAN                       <Missing>   No             2      No       
                                                                       No             4      Yes      
      \s\n                                                                            Reason  
                                                                       Action   Classified
                                                                       Taken    as Serious
      Center/Patient ID            Age/Sex/Race            Treatment    (2)        (3)    
      ————————————————————————————————————————————————————————————————————————————————————
      BRA-1/134           47/M/WHITE                       <Missing>     2      4         
                                                                         5      5         
      BRA-1/141           35/F/WHITE                       <Missing>     2      4         
                                                                         6      1         
      BRA-1/236           32/M/BLACK OR AFRICAN AMERICAN   <Missing>     6      1         
                                                                         6      1         
                                                                         6      1         
      BRA-1/265           25/M/WHITE                       <Missing>     6      1         
      BRA-1/42            36/M/BLACK OR AFRICAN AMERICAN   <Missing>     6      1         
                                                                         2      4         
                                                                         2      4         
                                                                         2      5         
                                                                         6      1         
                                                                         2      4         
                                                                         6      1         
      BRA-1/65            25/F/BLACK OR AFRICAN AMERICAN   <Missing>     6      1         
      BRA-1/93            34/F/ASIAN                       <Missing>     6      1         
                                                                         6      1         
                                                                         2      4         
      BRA-11/321          33/F/ASIAN                       <Missing>     2      2         
                                                                         6      1         
      BRA-11/345          37/F/WHITE                       <Missing>     6      1         
      BRA-11/397          38/M/ASIAN                       <Missing>     6      1         
                                                                         6      1         
      BRA-11/50           26/M/BLACK OR AFRICAN AMERICAN   <Missing>     2      5         
      BRA-11/9            40/M/ASIAN                       <Missing>     2      3         
                                                                         6      1         
                                                                         6      1         
                                                                         2      3         
      BRA-12/59           36/M/BLACK OR AFRICAN AMERICAN   <Missing>     6      1         
                                                                         2      3         
      BRA-13/177          24/M/WHITE                       <Missing>     6      1         
                                                                         6      1         
      BRA-14/120          33/F/ASIAN                       <Missing>     5      6         
                                                                         2      6         
                                                                         2      3         
                                                                         3      4         
                                                                         5      4         
                                                                         7      6         
      BRA-15/36           38/F/ASIAN                       <Missing>     6      1         
                                                                         2      3         
      BRA-2/101           34/M/ASIAN                       <Missing>     2      4         
      BRA-2/296           44/F/ASIAN                       <Missing>     2      4         
                                                                         2      3         
                                                                         6      1         
      BRA-3/8             25/F/BLACK OR AFRICAN AMERICAN   <Missing>     3      4         
      BRA-4/368           46/M/BLACK OR AFRICAN AMERICAN   <Missing>     6      1         
                                                                         6      1         
      BRA-4/383           30/F/ASIAN                       <Missing>     6      5         
                                                                         7      3         

# ael03 functions work as expected

    Code
      cat(export_as_txt(res[1:50, ], lpp = 100))
    Output
                                                                                                Date of    
                                                                               Adverse        First Study  
                                                                             Event MedDRA         Drug     
      Center/Patient ID            Age/Sex/Race              Treatment      Preferred Term   Administration
      —————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-1/134           47/M/WHITE                       A: Drug X        dcd A.1.1.1.2    04NOV2020     
                                                                            dcd A.1.1.1.2    04NOV2020     
      BRA-1/141           35/F/WHITE                       C: Combination   dcd A.1.1.1.2    25JUL2020     
                                                                            dcd D.1.1.1.1    25JUL2020     
      BRA-1/236           32/M/BLACK OR AFRICAN AMERICAN   B: Placebo       dcd B.1.1.1.1    15JAN2021     
                                                                            dcd B.1.1.1.1    15JAN2021     
                                                                            dcd B.1.1.1.1    15JAN2021     
      BRA-1/265           25/M/WHITE                       C: Combination   dcd D.1.1.1.1    07OCT2019     
      BRA-1/42            36/M/BLACK OR AFRICAN AMERICAN   A: Drug X        dcd D.1.1.1.1    01JAN2020     
                                                                            dcd A.1.1.1.2    01JAN2020     
                                                                            dcd B.2.2.3.1    01JAN2020     
                                                                            dcd A.1.1.1.2    01JAN2020     
                                                                            dcd B.1.1.1.1    01JAN2020     
                                                                            dcd A.1.1.1.2    01JAN2020     
                                                                            dcd B.1.1.1.1    01JAN2020     
      BRA-1/65            25/F/BLACK OR AFRICAN AMERICAN   B: Placebo       dcd B.1.1.1.1    15JUL2019     
      BRA-1/93            34/F/ASIAN                       A: Drug X        dcd D.1.1.1.1    20JUN2020     
                                                                            dcd B.1.1.1.1    20JUN2020     
                                                                            dcd B.2.2.3.1    20JUN2020     
      BRA-11/321          33/F/ASIAN                       C: Combination   dcd A.1.1.1.2    06OCT2020     
                                                                            dcd B.1.1.1.1    06OCT2020     
      BRA-11/345          37/F/WHITE                       A: Drug X        dcd B.1.1.1.1    18AUG2020     
      BRA-11/397          38/M/ASIAN                       A: Drug X        dcd D.1.1.1.1    27JUN2020     
                                                                            dcd B.1.1.1.1    27JUN2020     
      BRA-11/50           26/M/BLACK OR AFRICAN AMERICAN   A: Drug X        dcd A.1.1.1.2    28APR2019     
      BRA-11/9            40/M/ASIAN                       C: Combination   dcd B.2.2.3.1    26MAR2019     
                                                                            dcd D.1.1.1.1    26MAR2019     
                                                                            dcd B.1.1.1.1    26MAR2019     
                                                                            dcd B.2.2.3.1    26MAR2019     
      BRA-12/59           36/M/BLACK OR AFRICAN AMERICAN   B: Placebo       dcd D.1.1.1.1    26NOV2019     
                                                                            dcd B.2.2.3.1    26NOV2019     
      BRA-13/177          24/M/WHITE                       A: Drug X        dcd B.1.1.1.1    30AUG2020     
                                                                            dcd B.1.1.1.1    30AUG2020     
      BRA-14/120          33/F/ASIAN                       C: Combination   dcd A.1.1.1.2    19SEP2020     
                                                                            dcd A.1.1.1.2    19SEP2020     
                                                                            dcd A.1.1.1.2    19SEP2020     
                                                                            dcd A.1.1.1.2    19SEP2020     
                                                                            dcd A.1.1.1.2    19SEP2020     
                                                                            dcd B.2.2.3.1    19SEP2020     
      BRA-15/36           38/F/ASIAN                       A: Drug X        dcd B.1.1.1.1    08JAN2020     
                                                                            dcd A.1.1.1.2    08JAN2020     
      BRA-2/101           34/M/ASIAN                       B: Placebo       dcd A.1.1.1.2    26JUN2020     
      BRA-2/296           44/F/ASIAN                       A: Drug X        dcd A.1.1.1.2    22JAN2021     
                                                                            dcd A.1.1.1.2    22JAN2021     
                                                                            dcd B.1.1.1.1    22JAN2021     
      BRA-3/8             25/F/BLACK OR AFRICAN AMERICAN   B: Placebo       dcd A.1.1.1.2    13MAR2020     
      BRA-4/368           46/M/BLACK OR AFRICAN AMERICAN   C: Combination   dcd D.1.1.1.1    25FEB2020     
                                                                            dcd B.1.1.1.1    25FEB2020     
      BRA-4/383           30/F/ASIAN                       B: Placebo       dcd A.1.1.1.2    18JAN2020     
                                                                            dcd A.1.1.1.2    18JAN2020     
      \s\n                                                                                                   
                                                                            Study       AE        Most   
                                                                            Day of   Duration    Extreme 
      Center/Patient ID            Age/Sex/Race              Treatment      Onset    in Days    Intensity
      ———————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-1/134           47/M/WHITE                       A: Drug X         322       149      MODERATE 
                                                                             394        43      MODERATE 
      BRA-1/141           35/F/WHITE                       C: Combination    900       139      MODERATE 
                                                                             1094       3       SEVERE   
      BRA-1/236           32/M/BLACK OR AFRICAN AMERICAN   B: Placebo         33       615      SEVERE   
                                                                             271       776      SEVERE   
                                                                             1052       7       SEVERE   
      BRA-1/265           25/M/WHITE                       C: Combination    686        37      SEVERE   
      BRA-1/42            36/M/BLACK OR AFRICAN AMERICAN   A: Drug X          65       630      SEVERE   
                                                                             160       260      MODERATE 
                                                                             292        51      MILD     
                                                                             460       195      MODERATE 
                                                                             470       131      SEVERE   
                                                                             476       113      MODERATE 
                                                                             642        15      SEVERE   
      BRA-1/65            25/F/BLACK OR AFRICAN AMERICAN   B: Placebo        349       442      SEVERE   
      BRA-1/93            34/F/ASIAN                       A: Drug X         317       250      SEVERE   
                                                                             524        24      SEVERE   
                                                                             597        10      MILD     
      BRA-11/321          33/F/ASIAN                       C: Combination    428       335      MODERATE 
                                                                             893        58      SEVERE   
      BRA-11/345          37/F/WHITE                       A: Drug X         1010       35      SEVERE   
      BRA-11/397          38/M/ASIAN                       A: Drug X         517       441      SEVERE   
                                                                             1012       30      SEVERE   
      BRA-11/50           26/M/BLACK OR AFRICAN AMERICAN   A: Drug X         1008       68      MODERATE 
      BRA-11/9            40/M/ASIAN                       C: Combination    441        53      MILD     
                                                                             445       598      SEVERE   
                                                                             644        42      SEVERE   
                                                                             669       100      MILD     
      BRA-12/59           36/M/BLACK OR AFRICAN AMERICAN   B: Placebo         9        233      SEVERE   
                                                                             230       160      MILD     
      BRA-13/177          24/M/WHITE                       A: Drug X         249       470      SEVERE   
                                                                             1013       33      SEVERE   
      BRA-14/120          33/F/ASIAN                       C: Combination     4        246      MODERATE 
                                                                              75       393      MODERATE 
                                                                              93       329      MODERATE 
                                                                             208       190      MODERATE 
                                                                             251       143      MODERATE 
                                                                             505        7       MILD     
      BRA-15/36           38/F/ASIAN                       A: Drug X         372       154      SEVERE   
                                                                             574       134      MODERATE 
      BRA-2/101           34/M/ASIAN                       B: Placebo        650       301      MODERATE 
      BRA-2/296           44/F/ASIAN                       A: Drug X         204       488      MODERATE 
                                                                             289       259      MODERATE 
                                                                             1043       53      SEVERE   
      BRA-3/8             25/F/BLACK OR AFRICAN AMERICAN   B: Placebo         48        98      MODERATE 
      BRA-4/368           46/M/BLACK OR AFRICAN AMERICAN   C: Combination    837       114      SEVERE   
                                                                             842       247      SEVERE   
      BRA-4/383           30/F/ASIAN                       B: Placebo        253       212      MODERATE 
                                                                             286       191      MODERATE 
      \s\n                                                                                                     
                                                                            Caused by                      
                                                                              Study     Outcome   Treatment
      Center/Patient ID            Age/Sex/Race              Treatment        Drug        (1)      for AE  
      —————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-1/134           47/M/WHITE                       A: Drug X        No             5      Yes      
                                                                            No             5      No       
      BRA-1/141           35/F/WHITE                       C: Combination   No             4      Yes      
                                                                            Yes            1      No       
      BRA-1/236           32/M/BLACK OR AFRICAN AMERICAN   B: Placebo       Yes            1      No       
                                                                            Yes            1      Yes      
                                                                            Yes            1      Yes      
      BRA-1/265           25/M/WHITE                       C: Combination   Yes            1      No       
      BRA-1/42            36/M/BLACK OR AFRICAN AMERICAN   A: Drug X        Yes            1      No       
                                                                            No             2      Yes      
                                                                            No             3      No       
                                                                            No             5      Yes      
                                                                            Yes            1      No       
                                                                            No             4      Yes      
                                                                            Yes            1      Yes      
      BRA-1/65            25/F/BLACK OR AFRICAN AMERICAN   B: Placebo       Yes            1      No       
      BRA-1/93            34/F/ASIAN                       A: Drug X        Yes            1      No       
                                                                            Yes            1      No       
                                                                            No             3      Yes      
      BRA-11/321          33/F/ASIAN                       C: Combination   No             3      No       
                                                                            Yes            1      Yes      
      BRA-11/345          37/F/WHITE                       A: Drug X        Yes            1      No       
      BRA-11/397          38/M/ASIAN                       A: Drug X        Yes            1      No       
                                                                            Yes            1      Yes      
      BRA-11/50           26/M/BLACK OR AFRICAN AMERICAN   A: Drug X        No             3      Yes      
      BRA-11/9            40/M/ASIAN                       C: Combination   No             5      No       
                                                                            Yes            1      No       
                                                                            Yes            1      No       
                                                                            No             5      Yes      
      BRA-12/59           36/M/BLACK OR AFRICAN AMERICAN   B: Placebo       Yes            1      Yes      
                                                                            No             3      No       
      BRA-13/177          24/M/WHITE                       A: Drug X        Yes            1      No       
                                                                            Yes            1      No       
      BRA-14/120          33/F/ASIAN                       C: Combination   No             2      No       
                                                                            No             6      No       
                                                                            No             6      No       
                                                                            No             5      No       
                                                                            No             3      No       
                                                                            No             4      No       
      BRA-15/36           38/F/ASIAN                       A: Drug X        Yes            1      Yes      
                                                                            No             3      Yes      
      BRA-2/101           34/M/ASIAN                       B: Placebo       No             5      Yes      
      BRA-2/296           44/F/ASIAN                       A: Drug X        No             5      Yes      
                                                                            No             2      Yes      
                                                                            Yes            1      No       
      BRA-3/8             25/F/BLACK OR AFRICAN AMERICAN   B: Placebo       No             3      Yes      
      BRA-4/368           46/M/BLACK OR AFRICAN AMERICAN   C: Combination   Yes            1      No       
                                                                            Yes            1      No       
      BRA-4/383           30/F/ASIAN                       B: Placebo       No             2      No       
                                                                            No             4      Yes      
      \s\n                                                                                 Reason  
                                                                            Action   Classified
                                                                            Taken    as Serious
      Center/Patient ID            Age/Sex/Race              Treatment       (2)        (3)    
      —————————————————————————————————————————————————————————————————————————————————————————
      BRA-1/134           47/M/WHITE                       A: Drug X          2      4         
                                                                              5      5         
      BRA-1/141           35/F/WHITE                       C: Combination     2      4         
                                                                              6      1         
      BRA-1/236           32/M/BLACK OR AFRICAN AMERICAN   B: Placebo         6      1         
                                                                              6      1         
                                                                              6      1         
      BRA-1/265           25/M/WHITE                       C: Combination     6      1         
      BRA-1/42            36/M/BLACK OR AFRICAN AMERICAN   A: Drug X          6      1         
                                                                              2      4         
                                                                              2      4         
                                                                              2      5         
                                                                              6      1         
                                                                              2      4         
                                                                              6      1         
      BRA-1/65            25/F/BLACK OR AFRICAN AMERICAN   B: Placebo         6      1         
      BRA-1/93            34/F/ASIAN                       A: Drug X          6      1         
                                                                              6      1         
                                                                              2      4         
      BRA-11/321          33/F/ASIAN                       C: Combination     2      2         
                                                                              6      1         
      BRA-11/345          37/F/WHITE                       A: Drug X          6      1         
      BRA-11/397          38/M/ASIAN                       A: Drug X          6      1         
                                                                              6      1         
      BRA-11/50           26/M/BLACK OR AFRICAN AMERICAN   A: Drug X          2      5         
      BRA-11/9            40/M/ASIAN                       C: Combination     2      3         
                                                                              6      1         
                                                                              6      1         
                                                                              2      3         
      BRA-12/59           36/M/BLACK OR AFRICAN AMERICAN   B: Placebo         6      1         
                                                                              2      3         
      BRA-13/177          24/M/WHITE                       A: Drug X          6      1         
                                                                              6      1         
      BRA-14/120          33/F/ASIAN                       C: Combination     5      6         
                                                                              2      6         
                                                                              2      3         
                                                                              3      4         
                                                                              5      4         
                                                                              7      6         
      BRA-15/36           38/F/ASIAN                       A: Drug X          6      1         
                                                                              2      3         
      BRA-2/101           34/M/ASIAN                       B: Placebo         2      4         
      BRA-2/296           44/F/ASIAN                       A: Drug X          2      4         
                                                                              2      3         
                                                                              6      1         
      BRA-3/8             25/F/BLACK OR AFRICAN AMERICAN   B: Placebo         3      4         
      BRA-4/368           46/M/BLACK OR AFRICAN AMERICAN   C: Combination     6      1         
                                                                              6      1         
      BRA-4/383           30/F/ASIAN                       B: Placebo         6      5         
                                                                              7      3         

