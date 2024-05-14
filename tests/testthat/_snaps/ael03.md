# ael03 works with adae dataset

    Code
      cat(export_as_txt(res[1:50, ], lpp = 100))
    Output
                                                                                                 Date of    
                                                                                Adverse        First Study  
                                                                              Event MedDRA         Drug     
      Center/Patients ID            Age/Sex/Race              Treatment      Preferred Term   Administration
      ——————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   A: Drug X        dcd A.1.1.1.2    28APR2019     
      BRA-11/9             40/M/ASIAN                       C: Combination   dcd B.2.2.3.1    26MAR2019     
                                                                             dcd D.1.1.1.1    26MAR2019     
                                                                             dcd B.1.1.1.1    26MAR2019     
                                                                             dcd B.2.2.3.1    26MAR2019     
      CAN-1/341            43/F/ASIAN                       B: Placebo       dcd A.1.1.1.2    23MAY2019     
                                                                             dcd B.1.1.1.1    23MAY2019     
                                                                             dcd A.1.1.1.2    23MAY2019     
                                                                             dcd A.1.1.1.2    23MAY2019     
                                                                             dcd A.1.1.1.2    23MAY2019     
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   B: Placebo       dcd A.1.1.1.2    10APR2019     
                                                                             dcd B.2.2.3.1    10APR2019     
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   C: Combination   dcd D.1.1.1.1    28APR2019     
                                                                             dcd A.1.1.1.2    28APR2019     
                                                                             dcd A.1.1.1.2    28APR2019     
                                                                             dcd D.1.1.1.1    28APR2019     
                                                                             dcd D.1.1.1.1    28APR2019     
      CHN-11/220           26/F/ASIAN                       B: Placebo       dcd D.1.1.1.1    01MAR2019     
                                                                             dcd B.1.1.1.1    01MAR2019     
      CHN-11/38            25/F/WHITE                       B: Placebo       dcd A.1.1.1.2    17JUN2019     
      CHN-13/102           37/M/ASIAN                       B: Placebo       dcd B.1.1.1.1    23MAR2019     
                                                                             dcd D.1.1.1.1    23MAR2019     
                                                                             dcd B.2.2.3.1    23MAR2019     
                                                                             dcd D.1.1.1.1    23MAR2019     
                                                                             dcd D.1.1.1.1    23MAR2019     
      CHN-14/1             27/F/ASIAN                       A: Drug X        dcd A.1.1.1.2    07MAY2019     
                                                                             dcd B.2.2.3.1    07MAY2019     
                                                                             dcd B.1.1.1.1    07MAY2019     
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN   C: Combination   dcd B.1.1.1.1    26FEB2019     
                                                                             dcd B.1.1.1.1    26FEB2019     
                                                                             dcd A.1.1.1.2    26FEB2019     
      CHN-17/309           36/F/ASIAN                       A: Drug X        dcd B.2.2.3.1    27APR2019     
                                                                             dcd D.1.1.1.1    27APR2019     
      CHN-17/48            32/F/ASIAN                       B: Placebo       dcd D.1.1.1.1    03MAY2019     
      CHN-17/84            40/F/ASIAN                       C: Combination   dcd B.1.1.1.1    24MAR2019     
                                                                             dcd A.1.1.1.2    24MAR2019     
                                                                             dcd B.1.1.1.1    24MAR2019     
                                                                             dcd A.1.1.1.2    24MAR2019     
      CHN-2/286            30/F/ASIAN                       A: Drug X        dcd D.1.1.1.1    16MAY2019     
                                                                             dcd B.2.2.3.1    16MAY2019     
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN   A: Drug X        dcd D.1.1.1.1    27APR2019     
      CHN-4/115            38/M/ASIAN                       C: Combination   dcd B.2.2.3.1    28MAR2019     
                                                                             dcd D.1.1.1.1    28MAR2019     
                                                                             dcd B.2.2.3.1    28MAR2019     
                                                                             dcd B.1.1.1.1    28MAR2019     
                                                                             dcd A.1.1.1.2    28MAR2019     
      CHN-4/370            45/M/ASIAN                       C: Combination   dcd A.1.1.1.2    29MAR2019     
                                                                             dcd A.1.1.1.2    29MAR2019     
                                                                             dcd B.2.2.3.1    29MAR2019     
                                                                             dcd B.2.2.3.1    29MAR2019     
      \s\n                                                                                                    
                                                                             Study       AE        Most   
                                                                             Day of   Duration    Extreme 
      Center/Patients ID            Age/Sex/Race              Treatment      Onset    in Days    Intensity
      ————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   A: Drug X         1008       68      MODERATE 
      BRA-11/9             40/M/ASIAN                       C: Combination    441        53      MILD     
                                                                              445       598      SEVERE   
                                                                              644        42      SEVERE   
                                                                              669       100      MILD     
      CAN-1/341            43/F/ASIAN                       B: Placebo         57       327      MODERATE 
                                                                              434       410      SEVERE   
                                                                              455       506      MODERATE 
                                                                              523       392      MODERATE 
                                                                              770        73      MODERATE 
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   B: Placebo        686       309      MODERATE 
                                                                              803       130      MILD     
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   C: Combination     92       254      SEVERE   
                                                                              449       517      MODERATE 
                                                                              594        51      MODERATE 
                                                                              671        32      SEVERE   
                                                                              938        36      SEVERE   
      CHN-11/220           26/F/ASIAN                       B: Placebo        876       176      SEVERE   
                                                                              911       162      SEVERE   
      CHN-11/38            25/F/WHITE                       B: Placebo        524       536      MODERATE 
      CHN-13/102           37/M/ASIAN                       B: Placebo         34       555      SEVERE   
                                                                               65       400      SEVERE   
                                                                              184       446      MILD     
                                                                              439       515      SEVERE   
                                                                              870        58      SEVERE   
      CHN-14/1             27/F/ASIAN                       A: Drug X         259       657      MODERATE 
                                                                              385        20      MILD     
                                                                              517       280      SEVERE   
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN   C: Combination    124       457      SEVERE   
                                                                              337       140      SEVERE   
                                                                              1052       21      MODERATE 
      CHN-17/309           36/F/ASIAN                       A: Drug X         344       496      MILD     
                                                                              495       486      SEVERE   
      CHN-17/48            32/F/ASIAN                       B: Placebo         20       255      SEVERE   
      CHN-17/84            40/F/ASIAN                       C: Combination     19       1021     SEVERE   
                                                                              595       414      MODERATE 
                                                                              830       133      SEVERE   
                                                                              852       209      MODERATE 
      CHN-2/286            30/F/ASIAN                       A: Drug X         157       612      SEVERE   
                                                                              489       104      MILD     
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN   A: Drug X          55       797      SEVERE   
      CHN-4/115            38/M/ASIAN                       C: Combination    298       700      MILD     
                                                                              610       130      SEVERE   
                                                                              769       104      MILD     
                                                                              807       200      SEVERE   
                                                                              991        72      MODERATE 
      CHN-4/370            45/M/ASIAN                       C: Combination    595        19      MODERATE 
                                                                              741        60      MODERATE 
                                                                              856       188      MILD     
                                                                              986        25      MILD     
      \s\n                                                                                                      
                                                                             Caused by                      
                                                                               Study     Outcome   Treatment
      Center/Patients ID            Age/Sex/Race              Treatment        Drug        (1)      for AE  
      ——————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   A: Drug X        No          3         Yes      
      BRA-11/9             40/M/ASIAN                       C: Combination   No          5         No       
                                                                             Yes         1         No       
                                                                             Yes         1         No       
                                                                             No          5         Yes      
      CAN-1/341            43/F/ASIAN                       B: Placebo       No          5         Yes      
                                                                             Yes         1         No       
                                                                             No          6         No       
                                                                             No          3         Yes      
                                                                             No          5         No       
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   B: Placebo       No          6         Yes      
                                                                             No          6         No       
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   C: Combination   Yes         1         No       
                                                                             No          5         Yes      
                                                                             No          5         Yes      
                                                                             Yes         1         No       
                                                                             Yes         1         No       
      CHN-11/220           26/F/ASIAN                       B: Placebo       Yes         1         No       
                                                                             Yes         1         No       
      CHN-11/38            25/F/WHITE                       B: Placebo       No          2         No       
      CHN-13/102           37/M/ASIAN                       B: Placebo       Yes         1         No       
                                                                             Yes         1         Yes      
                                                                             No          3         No       
                                                                             Yes         1         Yes      
                                                                             Yes         1         Yes      
      CHN-14/1             27/F/ASIAN                       A: Drug X        No          2         No       
                                                                             No          6         Yes      
                                                                             Yes         1         No       
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN   C: Combination   Yes         1         No       
                                                                             Yes         1         No       
                                                                             No          3         Yes      
      CHN-17/309           36/F/ASIAN                       A: Drug X        No          5         Yes      
                                                                             Yes         1         No       
      CHN-17/48            32/F/ASIAN                       B: Placebo       Yes         1         Yes      
      CHN-17/84            40/F/ASIAN                       C: Combination   Yes         1         No       
                                                                             No          5         No       
                                                                             Yes         1         No       
                                                                             No          3         No       
      CHN-2/286            30/F/ASIAN                       A: Drug X        Yes         1         No       
                                                                             No          5         No       
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN   A: Drug X        Yes         1         No       
      CHN-4/115            38/M/ASIAN                       C: Combination   No          3         Yes      
                                                                             Yes         1         No       
                                                                             No          3         No       
                                                                             Yes         1         No       
                                                                             No          2         No       
      CHN-4/370            45/M/ASIAN                       C: Combination   No          3         No       
                                                                             No          3         No       
                                                                             No          4         Yes      
                                                                             No          3         No       
      \s\n                                                                                  Reason  
                                                                             Action   Classified
                                                                             Taken    as Serious
      Center/Patients ID            Age/Sex/Race              Treatment       (2)        (3)    
      ——————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   A: Drug X        2        5         
      BRA-11/9             40/M/ASIAN                       C: Combination   2        3         
                                                                             6        1         
                                                                             6        1         
                                                                             2        3         
      CAN-1/341            43/F/ASIAN                       B: Placebo       2        6         
                                                                             6        1         
                                                                             1        3         
                                                                             3        6         
                                                                             2        5         
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   B: Placebo       2        3         
                                                                             6        6         
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   C: Combination   6        1         
                                                                             3        6         
                                                                             3        3         
                                                                             6        1         
                                                                             6        1         
      CHN-11/220           26/F/ASIAN                       B: Placebo       6        1         
                                                                             6        1         
      CHN-11/38            25/F/WHITE                       B: Placebo       2        5         
      CHN-13/102           37/M/ASIAN                       B: Placebo       6        1         
                                                                             6        1         
                                                                             6        6         
                                                                             6        1         
                                                                             6        1         
      CHN-14/1             27/F/ASIAN                       A: Drug X        2        4         
                                                                             2        6         
                                                                             6        1         
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN   C: Combination   6        1         
                                                                             6        1         
                                                                             1        3         
      CHN-17/309           36/F/ASIAN                       A: Drug X        1        3         
                                                                             6        1         
      CHN-17/48            32/F/ASIAN                       B: Placebo       6        1         
      CHN-17/84            40/F/ASIAN                       C: Combination   6        1         
                                                                             2        5         
                                                                             6        1         
                                                                             2        6         
      CHN-2/286            30/F/ASIAN                       A: Drug X        6        1         
                                                                             2        6         
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN   A: Drug X        6        1         
      CHN-4/115            38/M/ASIAN                       C: Combination   2        6         
                                                                             6        1         
                                                                             2        3         
                                                                             6        1         
                                                                             6        5         
      CHN-4/370            45/M/ASIAN                       C: Combination   2        3         
                                                                             6        4         
                                                                             3        5         
                                                                             2        6         

# ael03 can handle all missing values

    Code
      cat(export_as_txt(res[1:50, ], lpp = 100))
    Output
                                                                                            Date of    
                                                                           Adverse        First Study  
                                                                         Event MedDRA         Drug     
      Center/Patients ID            Age/Sex/Race            Treatment   Preferred Term   Administration
      —————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   <Missing>   <Missing>        28APR2019     
      BRA-11/9             40/M/ASIAN                       <Missing>   <Missing>        26MAR2019     
                                                                        <Missing>        26MAR2019     
                                                                        <Missing>        26MAR2019     
                                                                        <Missing>        26MAR2019     
      CAN-1/341            43/F/ASIAN                       <Missing>   <Missing>        23MAY2019     
                                                                        <Missing>        23MAY2019     
                                                                        <Missing>        23MAY2019     
                                                                        <Missing>        23MAY2019     
                                                                        <Missing>        23MAY2019     
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   <Missing>   <Missing>        10APR2019     
                                                                        <Missing>        10APR2019     
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   <Missing>   <Missing>        28APR2019     
                                                                        <Missing>        28APR2019     
                                                                        <Missing>        28APR2019     
                                                                        <Missing>        28APR2019     
                                                                        <Missing>        28APR2019     
      CHN-11/220           26/F/ASIAN                       <Missing>   <Missing>        01MAR2019     
                                                                        <Missing>        01MAR2019     
      CHN-11/38            25/F/WHITE                       <Missing>   <Missing>        17JUN2019     
      CHN-13/102           37/M/ASIAN                       <Missing>   <Missing>        23MAR2019     
                                                                        <Missing>        23MAR2019     
                                                                        <Missing>        23MAR2019     
                                                                        <Missing>        23MAR2019     
                                                                        <Missing>        23MAR2019     
      CHN-14/1             27/F/ASIAN                       <Missing>   <Missing>        07MAY2019     
                                                                        <Missing>        07MAY2019     
                                                                        <Missing>        07MAY2019     
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN   <Missing>   <Missing>        26FEB2019     
                                                                        <Missing>        26FEB2019     
                                                                        <Missing>        26FEB2019     
      CHN-17/309           36/F/ASIAN                       <Missing>   <Missing>        27APR2019     
                                                                        <Missing>        27APR2019     
      CHN-17/48            32/F/ASIAN                       <Missing>   <Missing>        03MAY2019     
      CHN-17/84            40/F/ASIAN                       <Missing>   <Missing>        24MAR2019     
                                                                        <Missing>        24MAR2019     
                                                                        <Missing>        24MAR2019     
                                                                        <Missing>        24MAR2019     
      CHN-2/286            30/F/ASIAN                       <Missing>   <Missing>        16MAY2019     
                                                                        <Missing>        16MAY2019     
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN   <Missing>   <Missing>        27APR2019     
      CHN-4/115            38/M/ASIAN                       <Missing>   <Missing>        28MAR2019     
                                                                        <Missing>        28MAR2019     
                                                                        <Missing>        28MAR2019     
                                                                        <Missing>        28MAR2019     
                                                                        <Missing>        28MAR2019     
      CHN-4/370            45/M/ASIAN                       <Missing>   <Missing>        29MAR2019     
                                                                        <Missing>        29MAR2019     
                                                                        <Missing>        29MAR2019     
                                                                        <Missing>        29MAR2019     
      \s\n                                                                                               
                                                                        Study       AE        Most   
                                                                        Day of   Duration    Extreme 
      Center/Patients ID            Age/Sex/Race            Treatment   Onset    in Days    Intensity
      ———————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   <Missing>    1008       68      <Missing>
      BRA-11/9             40/M/ASIAN                       <Missing>    441        53      <Missing>
                                                                         445       598      <Missing>
                                                                         644        42      <Missing>
                                                                         669       100      <Missing>
      CAN-1/341            43/F/ASIAN                       <Missing>     57       327      <Missing>
                                                                         434       410      <Missing>
                                                                         455       506      <Missing>
                                                                         523       392      <Missing>
                                                                         770        73      <Missing>
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   <Missing>    686       309      <Missing>
                                                                         803       130      <Missing>
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   <Missing>     92       254      <Missing>
                                                                         449       517      <Missing>
                                                                         594        51      <Missing>
                                                                         671        32      <Missing>
                                                                         938        36      <Missing>
      CHN-11/220           26/F/ASIAN                       <Missing>    876       176      <Missing>
                                                                         911       162      <Missing>
      CHN-11/38            25/F/WHITE                       <Missing>    524       536      <Missing>
      CHN-13/102           37/M/ASIAN                       <Missing>     34       555      <Missing>
                                                                          65       400      <Missing>
                                                                         184       446      <Missing>
                                                                         439       515      <Missing>
                                                                         870        58      <Missing>
      CHN-14/1             27/F/ASIAN                       <Missing>    259       657      <Missing>
                                                                         385        20      <Missing>
                                                                         517       280      <Missing>
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN   <Missing>    124       457      <Missing>
                                                                         337       140      <Missing>
                                                                         1052       21      <Missing>
      CHN-17/309           36/F/ASIAN                       <Missing>    344       496      <Missing>
                                                                         495       486      <Missing>
      CHN-17/48            32/F/ASIAN                       <Missing>     20       255      <Missing>
      CHN-17/84            40/F/ASIAN                       <Missing>     19       1021     <Missing>
                                                                         595       414      <Missing>
                                                                         830       133      <Missing>
                                                                         852       209      <Missing>
      CHN-2/286            30/F/ASIAN                       <Missing>    157       612      <Missing>
                                                                         489       104      <Missing>
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN   <Missing>     55       797      <Missing>
      CHN-4/115            38/M/ASIAN                       <Missing>    298       700      <Missing>
                                                                         610       130      <Missing>
                                                                         769       104      <Missing>
                                                                         807       200      <Missing>
                                                                         991        72      <Missing>
      CHN-4/370            45/M/ASIAN                       <Missing>    595        19      <Missing>
                                                                         741        60      <Missing>
                                                                         856       188      <Missing>
                                                                         986        25      <Missing>
      \s\n                                                                                                 
                                                                        Caused by                      
                                                                          Study     Outcome   Treatment
      Center/Patients ID            Age/Sex/Race            Treatment     Drug        (1)      for AE  
      —————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   <Missing>   No          3         Yes      
      BRA-11/9             40/M/ASIAN                       <Missing>   No          5         No       
                                                                        Yes         1         No       
                                                                        Yes         1         No       
                                                                        No          5         Yes      
      CAN-1/341            43/F/ASIAN                       <Missing>   No          5         Yes      
                                                                        Yes         1         No       
                                                                        No          6         No       
                                                                        No          3         Yes      
                                                                        No          5         No       
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   <Missing>   No          6         Yes      
                                                                        No          6         No       
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   <Missing>   Yes         1         No       
                                                                        No          5         Yes      
                                                                        No          5         Yes      
                                                                        Yes         1         No       
                                                                        Yes         1         No       
      CHN-11/220           26/F/ASIAN                       <Missing>   Yes         1         No       
                                                                        Yes         1         No       
      CHN-11/38            25/F/WHITE                       <Missing>   No          2         No       
      CHN-13/102           37/M/ASIAN                       <Missing>   Yes         1         No       
                                                                        Yes         1         Yes      
                                                                        No          3         No       
                                                                        Yes         1         Yes      
                                                                        Yes         1         Yes      
      CHN-14/1             27/F/ASIAN                       <Missing>   No          2         No       
                                                                        No          6         Yes      
                                                                        Yes         1         No       
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN   <Missing>   Yes         1         No       
                                                                        Yes         1         No       
                                                                        No          3         Yes      
      CHN-17/309           36/F/ASIAN                       <Missing>   No          5         Yes      
                                                                        Yes         1         No       
      CHN-17/48            32/F/ASIAN                       <Missing>   Yes         1         Yes      
      CHN-17/84            40/F/ASIAN                       <Missing>   Yes         1         No       
                                                                        No          5         No       
                                                                        Yes         1         No       
                                                                        No          3         No       
      CHN-2/286            30/F/ASIAN                       <Missing>   Yes         1         No       
                                                                        No          5         No       
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN   <Missing>   Yes         1         No       
      CHN-4/115            38/M/ASIAN                       <Missing>   No          3         Yes      
                                                                        Yes         1         No       
                                                                        No          3         No       
                                                                        Yes         1         No       
                                                                        No          2         No       
      CHN-4/370            45/M/ASIAN                       <Missing>   No          3         No       
                                                                        No          3         No       
                                                                        No          4         Yes      
                                                                        No          3         No       
      \s\n                                                                             Reason  
                                                                        Action   Classified
                                                                        Taken    as Serious
      Center/Patients ID            Age/Sex/Race            Treatment    (2)        (3)    
      —————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   <Missing>   2        5         
      BRA-11/9             40/M/ASIAN                       <Missing>   2        3         
                                                                        6        1         
                                                                        6        1         
                                                                        2        3         
      CAN-1/341            43/F/ASIAN                       <Missing>   2        6         
                                                                        6        1         
                                                                        1        3         
                                                                        3        6         
                                                                        2        5         
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   <Missing>   2        3         
                                                                        6        6         
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   <Missing>   6        1         
                                                                        3        6         
                                                                        3        3         
                                                                        6        1         
                                                                        6        1         
      CHN-11/220           26/F/ASIAN                       <Missing>   6        1         
                                                                        6        1         
      CHN-11/38            25/F/WHITE                       <Missing>   2        5         
      CHN-13/102           37/M/ASIAN                       <Missing>   6        1         
                                                                        6        1         
                                                                        6        6         
                                                                        6        1         
                                                                        6        1         
      CHN-14/1             27/F/ASIAN                       <Missing>   2        4         
                                                                        2        6         
                                                                        6        1         
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN   <Missing>   6        1         
                                                                        6        1         
                                                                        1        3         
      CHN-17/309           36/F/ASIAN                       <Missing>   1        3         
                                                                        6        1         
      CHN-17/48            32/F/ASIAN                       <Missing>   6        1         
      CHN-17/84            40/F/ASIAN                       <Missing>   6        1         
                                                                        2        5         
                                                                        6        1         
                                                                        2        6         
      CHN-2/286            30/F/ASIAN                       <Missing>   6        1         
                                                                        2        6         
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN   <Missing>   6        1         
      CHN-4/115            38/M/ASIAN                       <Missing>   2        6         
                                                                        6        1         
                                                                        2        3         
                                                                        6        1         
                                                                        6        5         
      CHN-4/370            45/M/ASIAN                       <Missing>   2        3         
                                                                        6        4         
                                                                        3        5         
                                                                        2        6         

# ael03 functions work as expected

    Code
      cat(export_as_txt(res[1:50, ], lpp = 100))
    Output
                                                                                                 Date of    
                                                                                Adverse        First Study  
                                                                              Event MedDRA         Drug     
      Center/Patients ID            Age/Sex/Race              Treatment      Preferred Term   Administration
      ——————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   A: Drug X        dcd A.1.1.1.2    28APR2019     
      BRA-11/9             40/M/ASIAN                       C: Combination   dcd B.2.2.3.1    26MAR2019     
                                                                             dcd D.1.1.1.1    26MAR2019     
                                                                             dcd B.1.1.1.1    26MAR2019     
                                                                             dcd B.2.2.3.1    26MAR2019     
      CAN-1/341            43/F/ASIAN                       B: Placebo       dcd A.1.1.1.2    23MAY2019     
                                                                             dcd B.1.1.1.1    23MAY2019     
                                                                             dcd A.1.1.1.2    23MAY2019     
                                                                             dcd A.1.1.1.2    23MAY2019     
                                                                             dcd A.1.1.1.2    23MAY2019     
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   B: Placebo       dcd A.1.1.1.2    10APR2019     
                                                                             dcd B.2.2.3.1    10APR2019     
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   C: Combination   dcd D.1.1.1.1    28APR2019     
                                                                             dcd A.1.1.1.2    28APR2019     
                                                                             dcd A.1.1.1.2    28APR2019     
                                                                             dcd D.1.1.1.1    28APR2019     
                                                                             dcd D.1.1.1.1    28APR2019     
      CHN-11/220           26/F/ASIAN                       B: Placebo       dcd D.1.1.1.1    01MAR2019     
                                                                             dcd B.1.1.1.1    01MAR2019     
      CHN-11/38            25/F/WHITE                       B: Placebo       dcd A.1.1.1.2    17JUN2019     
      CHN-13/102           37/M/ASIAN                       B: Placebo       dcd B.1.1.1.1    23MAR2019     
                                                                             dcd D.1.1.1.1    23MAR2019     
                                                                             dcd B.2.2.3.1    23MAR2019     
                                                                             dcd D.1.1.1.1    23MAR2019     
                                                                             dcd D.1.1.1.1    23MAR2019     
      CHN-14/1             27/F/ASIAN                       A: Drug X        dcd A.1.1.1.2    07MAY2019     
                                                                             dcd B.2.2.3.1    07MAY2019     
                                                                             dcd B.1.1.1.1    07MAY2019     
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN   C: Combination   dcd B.1.1.1.1    26FEB2019     
                                                                             dcd B.1.1.1.1    26FEB2019     
                                                                             dcd A.1.1.1.2    26FEB2019     
      CHN-17/309           36/F/ASIAN                       A: Drug X        dcd B.2.2.3.1    27APR2019     
                                                                             dcd D.1.1.1.1    27APR2019     
      CHN-17/48            32/F/ASIAN                       B: Placebo       dcd D.1.1.1.1    03MAY2019     
      CHN-17/84            40/F/ASIAN                       C: Combination   dcd B.1.1.1.1    24MAR2019     
                                                                             dcd A.1.1.1.2    24MAR2019     
                                                                             dcd B.1.1.1.1    24MAR2019     
                                                                             dcd A.1.1.1.2    24MAR2019     
      CHN-2/286            30/F/ASIAN                       A: Drug X        dcd D.1.1.1.1    16MAY2019     
                                                                             dcd B.2.2.3.1    16MAY2019     
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN   A: Drug X        dcd D.1.1.1.1    27APR2019     
      CHN-4/115            38/M/ASIAN                       C: Combination   dcd B.2.2.3.1    28MAR2019     
                                                                             dcd D.1.1.1.1    28MAR2019     
                                                                             dcd B.2.2.3.1    28MAR2019     
                                                                             dcd B.1.1.1.1    28MAR2019     
                                                                             dcd A.1.1.1.2    28MAR2019     
      CHN-4/370            45/M/ASIAN                       C: Combination   dcd A.1.1.1.2    29MAR2019     
                                                                             dcd A.1.1.1.2    29MAR2019     
                                                                             dcd B.2.2.3.1    29MAR2019     
                                                                             dcd B.2.2.3.1    29MAR2019     
      \s\n                                                                                                    
                                                                             Study       AE        Most   
                                                                             Day of   Duration    Extreme 
      Center/Patients ID            Age/Sex/Race              Treatment      Onset    in Days    Intensity
      ————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   A: Drug X         1008       68      MODERATE 
      BRA-11/9             40/M/ASIAN                       C: Combination    441        53      MILD     
                                                                              445       598      SEVERE   
                                                                              644        42      SEVERE   
                                                                              669       100      MILD     
      CAN-1/341            43/F/ASIAN                       B: Placebo         57       327      MODERATE 
                                                                              434       410      SEVERE   
                                                                              455       506      MODERATE 
                                                                              523       392      MODERATE 
                                                                              770        73      MODERATE 
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   B: Placebo        686       309      MODERATE 
                                                                              803       130      MILD     
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   C: Combination     92       254      SEVERE   
                                                                              449       517      MODERATE 
                                                                              594        51      MODERATE 
                                                                              671        32      SEVERE   
                                                                              938        36      SEVERE   
      CHN-11/220           26/F/ASIAN                       B: Placebo        876       176      SEVERE   
                                                                              911       162      SEVERE   
      CHN-11/38            25/F/WHITE                       B: Placebo        524       536      MODERATE 
      CHN-13/102           37/M/ASIAN                       B: Placebo         34       555      SEVERE   
                                                                               65       400      SEVERE   
                                                                              184       446      MILD     
                                                                              439       515      SEVERE   
                                                                              870        58      SEVERE   
      CHN-14/1             27/F/ASIAN                       A: Drug X         259       657      MODERATE 
                                                                              385        20      MILD     
                                                                              517       280      SEVERE   
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN   C: Combination    124       457      SEVERE   
                                                                              337       140      SEVERE   
                                                                              1052       21      MODERATE 
      CHN-17/309           36/F/ASIAN                       A: Drug X         344       496      MILD     
                                                                              495       486      SEVERE   
      CHN-17/48            32/F/ASIAN                       B: Placebo         20       255      SEVERE   
      CHN-17/84            40/F/ASIAN                       C: Combination     19       1021     SEVERE   
                                                                              595       414      MODERATE 
                                                                              830       133      SEVERE   
                                                                              852       209      MODERATE 
      CHN-2/286            30/F/ASIAN                       A: Drug X         157       612      SEVERE   
                                                                              489       104      MILD     
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN   A: Drug X          55       797      SEVERE   
      CHN-4/115            38/M/ASIAN                       C: Combination    298       700      MILD     
                                                                              610       130      SEVERE   
                                                                              769       104      MILD     
                                                                              807       200      SEVERE   
                                                                              991        72      MODERATE 
      CHN-4/370            45/M/ASIAN                       C: Combination    595        19      MODERATE 
                                                                              741        60      MODERATE 
                                                                              856       188      MILD     
                                                                              986        25      MILD     
      \s\n                                                                                                      
                                                                             Caused by                      
                                                                               Study     Outcome   Treatment
      Center/Patients ID            Age/Sex/Race              Treatment        Drug        (1)      for AE  
      ——————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   A: Drug X        No          3         Yes      
      BRA-11/9             40/M/ASIAN                       C: Combination   No          5         No       
                                                                             Yes         1         No       
                                                                             Yes         1         No       
                                                                             No          5         Yes      
      CAN-1/341            43/F/ASIAN                       B: Placebo       No          5         Yes      
                                                                             Yes         1         No       
                                                                             No          6         No       
                                                                             No          3         Yes      
                                                                             No          5         No       
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   B: Placebo       No          6         Yes      
                                                                             No          6         No       
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   C: Combination   Yes         1         No       
                                                                             No          5         Yes      
                                                                             No          5         Yes      
                                                                             Yes         1         No       
                                                                             Yes         1         No       
      CHN-11/220           26/F/ASIAN                       B: Placebo       Yes         1         No       
                                                                             Yes         1         No       
      CHN-11/38            25/F/WHITE                       B: Placebo       No          2         No       
      CHN-13/102           37/M/ASIAN                       B: Placebo       Yes         1         No       
                                                                             Yes         1         Yes      
                                                                             No          3         No       
                                                                             Yes         1         Yes      
                                                                             Yes         1         Yes      
      CHN-14/1             27/F/ASIAN                       A: Drug X        No          2         No       
                                                                             No          6         Yes      
                                                                             Yes         1         No       
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN   C: Combination   Yes         1         No       
                                                                             Yes         1         No       
                                                                             No          3         Yes      
      CHN-17/309           36/F/ASIAN                       A: Drug X        No          5         Yes      
                                                                             Yes         1         No       
      CHN-17/48            32/F/ASIAN                       B: Placebo       Yes         1         Yes      
      CHN-17/84            40/F/ASIAN                       C: Combination   Yes         1         No       
                                                                             No          5         No       
                                                                             Yes         1         No       
                                                                             No          3         No       
      CHN-2/286            30/F/ASIAN                       A: Drug X        Yes         1         No       
                                                                             No          5         No       
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN   A: Drug X        Yes         1         No       
      CHN-4/115            38/M/ASIAN                       C: Combination   No          3         Yes      
                                                                             Yes         1         No       
                                                                             No          3         No       
                                                                             Yes         1         No       
                                                                             No          2         No       
      CHN-4/370            45/M/ASIAN                       C: Combination   No          3         No       
                                                                             No          3         No       
                                                                             No          4         Yes      
                                                                             No          3         No       
      \s\n                                                                                  Reason  
                                                                             Action   Classified
                                                                             Taken    as Serious
      Center/Patients ID            Age/Sex/Race              Treatment       (2)        (3)    
      ——————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   A: Drug X        2        5         
      BRA-11/9             40/M/ASIAN                       C: Combination   2        3         
                                                                             6        1         
                                                                             6        1         
                                                                             2        3         
      CAN-1/341            43/F/ASIAN                       B: Placebo       2        6         
                                                                             6        1         
                                                                             1        3         
                                                                             3        6         
                                                                             2        5         
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   B: Placebo       2        3         
                                                                             6        6         
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   C: Combination   6        1         
                                                                             3        6         
                                                                             3        3         
                                                                             6        1         
                                                                             6        1         
      CHN-11/220           26/F/ASIAN                       B: Placebo       6        1         
                                                                             6        1         
      CHN-11/38            25/F/WHITE                       B: Placebo       2        5         
      CHN-13/102           37/M/ASIAN                       B: Placebo       6        1         
                                                                             6        1         
                                                                             6        6         
                                                                             6        1         
                                                                             6        1         
      CHN-14/1             27/F/ASIAN                       A: Drug X        2        4         
                                                                             2        6         
                                                                             6        1         
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN   C: Combination   6        1         
                                                                             6        1         
                                                                             1        3         
      CHN-17/309           36/F/ASIAN                       A: Drug X        1        3         
                                                                             6        1         
      CHN-17/48            32/F/ASIAN                       B: Placebo       6        1         
      CHN-17/84            40/F/ASIAN                       C: Combination   6        1         
                                                                             2        5         
                                                                             6        1         
                                                                             2        6         
      CHN-2/286            30/F/ASIAN                       A: Drug X        6        1         
                                                                             2        6         
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN   A: Drug X        6        1         
      CHN-4/115            38/M/ASIAN                       C: Combination   2        6         
                                                                             6        1         
                                                                             2        3         
                                                                             6        1         
                                                                             6        5         
      CHN-4/370            45/M/ASIAN                       C: Combination   2        3         
                                                                             6        4         
                                                                             3        5         
                                                                             2        6         

