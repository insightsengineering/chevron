# ael03 works with adae dataset

    Code
      cat(export_as_txt(res, lpp = 100, cpp = 110))
    Output
      ACTARM: A: Drug X
      
      —————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                Date of                        
                                                               Adverse        First Study     Study       AE   
                                                             Event MedDRA         Drug        Day of   Duration
      Center/Patients ID            Age/Sex/Race            Preferred Term   Administration   Onset    in Days 
      —————————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   dcd A.1.1.1.2    28APR2019         1008       68   
      CHN-14/1             27/F/ASIAN                       dcd A.1.1.1.2    07MAY2019         259       657   
                                                            dcd B.2.2.3.1    07MAY2019         385        20   
                                                            dcd B.1.1.1.1    07MAY2019         517       280   
      CHN-17/309           36/F/ASIAN                       dcd B.2.2.3.1    27APR2019         344       496   
                                                            dcd D.1.1.1.1    27APR2019         495       486   
      CHN-2/286            30/F/ASIAN                       dcd D.1.1.1.1    16MAY2019         157       612   
                                                            dcd B.2.2.3.1    16MAY2019         489       104   
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN   dcd D.1.1.1.1    27APR2019          55       797   
      CHN-4/73             24/F/ASIAN                       dcd B.2.2.3.1    17MAR2019         163        74   
      \s\nACTARM: A: Drug X
      
      ——————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                                
                                                              Most      Caused by                         Action
                                                             Extreme      Study     Outcome   Treatment   Taken 
      Center/Patients ID            Age/Sex/Race            Intensity     Drug        (1)      for AE      (2)  
      ——————————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   MODERATE    No          3         Yes         2     
      CHN-14/1             27/F/ASIAN                       MODERATE    No          2         No          2     
                                                            MILD        No          6         Yes         2     
                                                            SEVERE      Yes         1         No          6     
      CHN-17/309           36/F/ASIAN                       MILD        No          5         Yes         1     
                                                            SEVERE      Yes         1         No          6     
      CHN-2/286            30/F/ASIAN                       SEVERE      Yes         1         No          6     
                                                            MILD        No          5         No          2     
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN   SEVERE      Yes         1         No          6     
      CHN-4/73             24/F/ASIAN                       MILD        No          6         Yes         3     
      \s\nACTARM: A: Drug X
      
      ————————————————————————————————————————————————————————————————
                                                              Reason  
                                                            Classified
                                                            as Serious
      Center/Patients ID            Age/Sex/Race               (3)    
      ————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   5         
      CHN-14/1             27/F/ASIAN                       4         
                                                            6         
                                                            1         
      CHN-17/309           36/F/ASIAN                       3         
                                                            1         
      CHN-2/286            30/F/ASIAN                       1         
                                                            6         
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN   1         
      CHN-4/73             24/F/ASIAN                       6         
      \s\nACTARM: C: Combination
      
      —————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                Date of                        
                                                               Adverse        First Study     Study       AE   
                                                             Event MedDRA         Drug        Day of   Duration
      Center/Patients ID            Age/Sex/Race            Preferred Term   Administration   Onset    in Days 
      —————————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/9             40/M/ASIAN                       dcd B.2.2.3.1    26MAR2019         441        53   
                                                            dcd D.1.1.1.1    26MAR2019         445       598   
                                                            dcd B.1.1.1.1    26MAR2019         644        42   
                                                            dcd B.2.2.3.1    26MAR2019         669       100   
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   dcd D.1.1.1.1    28APR2019          92       254   
                                                            dcd A.1.1.1.2    28APR2019         449       517   
                                                            dcd A.1.1.1.2    28APR2019         594        51   
                                                            dcd D.1.1.1.1    28APR2019         671        32   
                                                            dcd D.1.1.1.1    28APR2019         938        36   
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN   dcd B.1.1.1.1    26FEB2019         124       457   
      \s\nACTARM: C: Combination
      
      ——————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                                
                                                              Most      Caused by                         Action
                                                             Extreme      Study     Outcome   Treatment   Taken 
      Center/Patients ID            Age/Sex/Race            Intensity     Drug        (1)      for AE      (2)  
      ——————————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/9             40/M/ASIAN                       MILD        No          5         No          2     
                                                            SEVERE      Yes         1         No          6     
                                                            SEVERE      Yes         1         No          6     
                                                            MILD        No          5         Yes         2     
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   SEVERE      Yes         1         No          6     
                                                            MODERATE    No          5         Yes         3     
                                                            MODERATE    No          5         Yes         3     
                                                            SEVERE      Yes         1         No          6     
                                                            SEVERE      Yes         1         No          6     
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN   SEVERE      Yes         1         No          6     
      \s\nACTARM: C: Combination
      
      ————————————————————————————————————————————————————————————————
                                                              Reason  
                                                            Classified
                                                            as Serious
      Center/Patients ID            Age/Sex/Race               (3)    
      ————————————————————————————————————————————————————————————————
      BRA-11/9             40/M/ASIAN                       3         
                                                            1         
                                                            1         
                                                            3         
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   1         
                                                            6         
                                                            3         
                                                            1         
                                                            1         
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN   1         
      \s\nACTARM: B: Placebo
      
      —————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                Date of                        
                                                               Adverse        First Study     Study       AE   
                                                             Event MedDRA         Drug        Day of   Duration
      Center/Patients ID            Age/Sex/Race            Preferred Term   Administration   Onset    in Days 
      —————————————————————————————————————————————————————————————————————————————————————————————————————————
      CAN-1/341            43/F/ASIAN                       dcd A.1.1.1.2    23MAY2019          57       327   
                                                            dcd B.1.1.1.1    23MAY2019         434       410   
                                                            dcd A.1.1.1.2    23MAY2019         455       506   
                                                            dcd A.1.1.1.2    23MAY2019         523       392   
                                                            dcd A.1.1.1.2    23MAY2019         770        73   
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   dcd A.1.1.1.2    10APR2019         686       309   
                                                            dcd B.2.2.3.1    10APR2019         803       130   
      CHN-11/220           26/F/ASIAN                       dcd D.1.1.1.1    01MAR2019         876       176   
                                                            dcd B.1.1.1.1    01MAR2019         911       162   
      CHN-11/38            25/F/WHITE                       dcd A.1.1.1.2    17JUN2019         524       536   
      \s\nACTARM: B: Placebo
      
      ——————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                                
                                                              Most      Caused by                         Action
                                                             Extreme      Study     Outcome   Treatment   Taken 
      Center/Patients ID            Age/Sex/Race            Intensity     Drug        (1)      for AE      (2)  
      ——————————————————————————————————————————————————————————————————————————————————————————————————————————
      CAN-1/341            43/F/ASIAN                       MODERATE    No          5         Yes         2     
                                                            SEVERE      Yes         1         No          6     
                                                            MODERATE    No          6         No          1     
                                                            MODERATE    No          3         Yes         3     
                                                            MODERATE    No          5         No          2     
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   MODERATE    No          6         Yes         2     
                                                            MILD        No          6         No          6     
      CHN-11/220           26/F/ASIAN                       SEVERE      Yes         1         No          6     
                                                            SEVERE      Yes         1         No          6     
      CHN-11/38            25/F/WHITE                       MODERATE    No          2         No          2     
      \s\nACTARM: B: Placebo
      
      ————————————————————————————————————————————————————————————————
                                                              Reason  
                                                            Classified
                                                            as Serious
      Center/Patients ID            Age/Sex/Race               (3)    
      ————————————————————————————————————————————————————————————————
      CAN-1/341            43/F/ASIAN                       6         
                                                            1         
                                                            3         
                                                            6         
                                                            5         
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   3         
                                                            6         
      CHN-11/220           26/F/ASIAN                       1         
                                                            1         
      CHN-11/38            25/F/WHITE                       5         

# ael03 can handle all missing values

    Code
      cat(export_as_txt(res[[1]][1:50, ], lpp = 100, cpp = 110))
    Output
      ACTARM: <Missing>
      
      —————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                Date of                        
                                                               Adverse        First Study     Study       AE   
                                                             Event MedDRA         Drug        Day of   Duration
      Center/Patients ID            Age/Sex/Race            Preferred Term   Administration   Onset    in Days 
      —————————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   <Missing>        28APR2019         1008       68   
      BRA-11/9             40/M/ASIAN                       <Missing>        26MAR2019         441        53   
                                                            <Missing>        26MAR2019         445       598   
                                                            <Missing>        26MAR2019         644        42   
                                                            <Missing>        26MAR2019         669       100   
      CAN-1/341            43/F/ASIAN                       <Missing>        23MAY2019          57       327   
                                                            <Missing>        23MAY2019         434       410   
                                                            <Missing>        23MAY2019         455       506   
                                                            <Missing>        23MAY2019         523       392   
                                                            <Missing>        23MAY2019         770        73   
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   <Missing>        10APR2019         686       309   
                                                            <Missing>        10APR2019         803       130   
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   <Missing>        28APR2019          92       254   
                                                            <Missing>        28APR2019         449       517   
                                                            <Missing>        28APR2019         594        51   
                                                            <Missing>        28APR2019         671        32   
                                                            <Missing>        28APR2019         938        36   
      CHN-11/220           26/F/ASIAN                       <Missing>        01MAR2019         876       176   
                                                            <Missing>        01MAR2019         911       162   
      CHN-11/38            25/F/WHITE                       <Missing>        17JUN2019         524       536   
      CHN-13/102           37/M/ASIAN                       <Missing>        23MAR2019          34       555   
                                                            <Missing>        23MAR2019          65       400   
                                                            <Missing>        23MAR2019         184       446   
                                                            <Missing>        23MAR2019         439       515   
                                                            <Missing>        23MAR2019         870        58   
      CHN-14/1             27/F/ASIAN                       <Missing>        07MAY2019         259       657   
                                                            <Missing>        07MAY2019         385        20   
                                                            <Missing>        07MAY2019         517       280   
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN   <Missing>        26FEB2019         124       457   
                                                            <Missing>        26FEB2019         337       140   
                                                            <Missing>        26FEB2019         1052       21   
      CHN-17/309           36/F/ASIAN                       <Missing>        27APR2019         344       496   
                                                            <Missing>        27APR2019         495       486   
      CHN-17/48            32/F/ASIAN                       <Missing>        03MAY2019          20       255   
      CHN-17/84            40/F/ASIAN                       <Missing>        24MAR2019          19       1021  
                                                            <Missing>        24MAR2019         595       414   
                                                            <Missing>        24MAR2019         830       133   
                                                            <Missing>        24MAR2019         852       209   
      CHN-2/286            30/F/ASIAN                       <Missing>        16MAY2019         157       612   
                                                            <Missing>        16MAY2019         489       104   
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN   <Missing>        27APR2019          55       797   
      CHN-4/115            38/M/ASIAN                       <Missing>        28MAR2019         298       700   
                                                            <Missing>        28MAR2019         610       130   
                                                            <Missing>        28MAR2019         769       104   
                                                            <Missing>        28MAR2019         807       200   
                                                            <Missing>        28MAR2019         991        72   
      CHN-4/370            45/M/ASIAN                       <Missing>        29MAR2019         595        19   
                                                            <Missing>        29MAR2019         741        60   
                                                            <Missing>        29MAR2019         856       188   
                                                            <Missing>        29MAR2019         986        25   
      \s\nACTARM: <Missing>
      
      ——————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                                
                                                              Most      Caused by                         Action
                                                             Extreme      Study     Outcome   Treatment   Taken 
      Center/Patients ID            Age/Sex/Race            Intensity     Drug        (1)      for AE      (2)  
      ——————————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   <Missing>   No          3         Yes         2     
      BRA-11/9             40/M/ASIAN                       <Missing>   No          5         No          2     
                                                            <Missing>   Yes         1         No          6     
                                                            <Missing>   Yes         1         No          6     
                                                            <Missing>   No          5         Yes         2     
      CAN-1/341            43/F/ASIAN                       <Missing>   No          5         Yes         2     
                                                            <Missing>   Yes         1         No          6     
                                                            <Missing>   No          6         No          1     
                                                            <Missing>   No          3         Yes         3     
                                                            <Missing>   No          5         No          2     
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   <Missing>   No          6         Yes         2     
                                                            <Missing>   No          6         No          6     
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   <Missing>   Yes         1         No          6     
                                                            <Missing>   No          5         Yes         3     
                                                            <Missing>   No          5         Yes         3     
                                                            <Missing>   Yes         1         No          6     
                                                            <Missing>   Yes         1         No          6     
      CHN-11/220           26/F/ASIAN                       <Missing>   Yes         1         No          6     
                                                            <Missing>   Yes         1         No          6     
      CHN-11/38            25/F/WHITE                       <Missing>   No          2         No          2     
      CHN-13/102           37/M/ASIAN                       <Missing>   Yes         1         No          6     
                                                            <Missing>   Yes         1         Yes         6     
                                                            <Missing>   No          3         No          6     
                                                            <Missing>   Yes         1         Yes         6     
                                                            <Missing>   Yes         1         Yes         6     
      CHN-14/1             27/F/ASIAN                       <Missing>   No          2         No          2     
                                                            <Missing>   No          6         Yes         2     
                                                            <Missing>   Yes         1         No          6     
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN   <Missing>   Yes         1         No          6     
                                                            <Missing>   Yes         1         No          6     
                                                            <Missing>   No          3         Yes         1     
      CHN-17/309           36/F/ASIAN                       <Missing>   No          5         Yes         1     
                                                            <Missing>   Yes         1         No          6     
      CHN-17/48            32/F/ASIAN                       <Missing>   Yes         1         Yes         6     
      CHN-17/84            40/F/ASIAN                       <Missing>   Yes         1         No          6     
                                                            <Missing>   No          5         No          2     
                                                            <Missing>   Yes         1         No          6     
                                                            <Missing>   No          3         No          2     
      CHN-2/286            30/F/ASIAN                       <Missing>   Yes         1         No          6     
                                                            <Missing>   No          5         No          2     
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN   <Missing>   Yes         1         No          6     
      CHN-4/115            38/M/ASIAN                       <Missing>   No          3         Yes         2     
                                                            <Missing>   Yes         1         No          6     
                                                            <Missing>   No          3         No          2     
                                                            <Missing>   Yes         1         No          6     
                                                            <Missing>   No          2         No          6     
      CHN-4/370            45/M/ASIAN                       <Missing>   No          3         No          2     
                                                            <Missing>   No          3         No          6     
                                                            <Missing>   No          4         Yes         3     
                                                            <Missing>   No          3         No          2     
      \s\nACTARM: <Missing>
      
      ————————————————————————————————————————————————————————————————
                                                              Reason  
                                                            Classified
                                                            as Serious
      Center/Patients ID            Age/Sex/Race               (3)    
      ————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   5         
      BRA-11/9             40/M/ASIAN                       3         
                                                            1         
                                                            1         
                                                            3         
      CAN-1/341            43/F/ASIAN                       6         
                                                            1         
                                                            3         
                                                            6         
                                                            5         
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   3         
                                                            6         
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   1         
                                                            6         
                                                            3         
                                                            1         
                                                            1         
      CHN-11/220           26/F/ASIAN                       1         
                                                            1         
      CHN-11/38            25/F/WHITE                       5         
      CHN-13/102           37/M/ASIAN                       1         
                                                            1         
                                                            6         
                                                            1         
                                                            1         
      CHN-14/1             27/F/ASIAN                       4         
                                                            6         
                                                            1         
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN   1         
                                                            1         
                                                            3         
      CHN-17/309           36/F/ASIAN                       3         
                                                            1         
      CHN-17/48            32/F/ASIAN                       1         
      CHN-17/84            40/F/ASIAN                       1         
                                                            5         
                                                            1         
                                                            6         
      CHN-2/286            30/F/ASIAN                       1         
                                                            6         
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN   1         
      CHN-4/115            38/M/ASIAN                       6         
                                                            1         
                                                            3         
                                                            1         
                                                            5         
      CHN-4/370            45/M/ASIAN                       3         
                                                            4         
                                                            5         
                                                            6         

# ael03 functions work as expected

    Code
      cat(export_as_txt(res, lpp = 100, cpp = 110))
    Output
      ACTARM: A: Drug X
      
      —————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                Date of                        
                                                               Adverse        First Study     Study       AE   
                                                             Event MedDRA         Drug        Day of   Duration
      Center/Patients ID            Age/Sex/Race            Preferred Term   Administration   Onset    in Days 
      —————————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   dcd A.1.1.1.2    28APR2019         1008       68   
      CHN-14/1             27/F/ASIAN                       dcd A.1.1.1.2    07MAY2019         259       657   
                                                            dcd B.2.2.3.1    07MAY2019         385        20   
                                                            dcd B.1.1.1.1    07MAY2019         517       280   
      CHN-17/309           36/F/ASIAN                       dcd B.2.2.3.1    27APR2019         344       496   
                                                            dcd D.1.1.1.1    27APR2019         495       486   
      CHN-2/286            30/F/ASIAN                       dcd D.1.1.1.1    16MAY2019         157       612   
                                                            dcd B.2.2.3.1    16MAY2019         489       104   
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN   dcd D.1.1.1.1    27APR2019          55       797   
      CHN-4/73             24/F/ASIAN                       dcd B.2.2.3.1    17MAR2019         163        74   
      \s\nACTARM: A: Drug X
      
      ——————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                                
                                                              Most      Caused by                         Action
                                                             Extreme      Study     Outcome   Treatment   Taken 
      Center/Patients ID            Age/Sex/Race            Intensity     Drug        (1)      for AE      (2)  
      ——————————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   MODERATE    No          3         Yes         2     
      CHN-14/1             27/F/ASIAN                       MODERATE    No          2         No          2     
                                                            MILD        No          6         Yes         2     
                                                            SEVERE      Yes         1         No          6     
      CHN-17/309           36/F/ASIAN                       MILD        No          5         Yes         1     
                                                            SEVERE      Yes         1         No          6     
      CHN-2/286            30/F/ASIAN                       SEVERE      Yes         1         No          6     
                                                            MILD        No          5         No          2     
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN   SEVERE      Yes         1         No          6     
      CHN-4/73             24/F/ASIAN                       MILD        No          6         Yes         3     
      \s\nACTARM: A: Drug X
      
      ————————————————————————————————————————————————————————————————
                                                              Reason  
                                                            Classified
                                                            as Serious
      Center/Patients ID            Age/Sex/Race               (3)    
      ————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   5         
      CHN-14/1             27/F/ASIAN                       4         
                                                            6         
                                                            1         
      CHN-17/309           36/F/ASIAN                       3         
                                                            1         
      CHN-2/286            30/F/ASIAN                       1         
                                                            6         
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN   1         
      CHN-4/73             24/F/ASIAN                       6         
      \s\nACTARM: C: Combination
      
      —————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                Date of                        
                                                               Adverse        First Study     Study       AE   
                                                             Event MedDRA         Drug        Day of   Duration
      Center/Patients ID            Age/Sex/Race            Preferred Term   Administration   Onset    in Days 
      —————————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/9             40/M/ASIAN                       dcd B.2.2.3.1    26MAR2019         441        53   
                                                            dcd D.1.1.1.1    26MAR2019         445       598   
                                                            dcd B.1.1.1.1    26MAR2019         644        42   
                                                            dcd B.2.2.3.1    26MAR2019         669       100   
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   dcd D.1.1.1.1    28APR2019          92       254   
                                                            dcd A.1.1.1.2    28APR2019         449       517   
                                                            dcd A.1.1.1.2    28APR2019         594        51   
                                                            dcd D.1.1.1.1    28APR2019         671        32   
                                                            dcd D.1.1.1.1    28APR2019         938        36   
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN   dcd B.1.1.1.1    26FEB2019         124       457   
      \s\nACTARM: C: Combination
      
      ——————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                                
                                                              Most      Caused by                         Action
                                                             Extreme      Study     Outcome   Treatment   Taken 
      Center/Patients ID            Age/Sex/Race            Intensity     Drug        (1)      for AE      (2)  
      ——————————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/9             40/M/ASIAN                       MILD        No          5         No          2     
                                                            SEVERE      Yes         1         No          6     
                                                            SEVERE      Yes         1         No          6     
                                                            MILD        No          5         Yes         2     
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   SEVERE      Yes         1         No          6     
                                                            MODERATE    No          5         Yes         3     
                                                            MODERATE    No          5         Yes         3     
                                                            SEVERE      Yes         1         No          6     
                                                            SEVERE      Yes         1         No          6     
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN   SEVERE      Yes         1         No          6     
      \s\nACTARM: C: Combination
      
      ————————————————————————————————————————————————————————————————
                                                              Reason  
                                                            Classified
                                                            as Serious
      Center/Patients ID            Age/Sex/Race               (3)    
      ————————————————————————————————————————————————————————————————
      BRA-11/9             40/M/ASIAN                       3         
                                                            1         
                                                            1         
                                                            3         
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   1         
                                                            6         
                                                            3         
                                                            1         
                                                            1         
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN   1         
      \s\nACTARM: B: Placebo
      
      —————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                Date of                        
                                                               Adverse        First Study     Study       AE   
                                                             Event MedDRA         Drug        Day of   Duration
      Center/Patients ID            Age/Sex/Race            Preferred Term   Administration   Onset    in Days 
      —————————————————————————————————————————————————————————————————————————————————————————————————————————
      CAN-1/341            43/F/ASIAN                       dcd A.1.1.1.2    23MAY2019          57       327   
                                                            dcd B.1.1.1.1    23MAY2019         434       410   
                                                            dcd A.1.1.1.2    23MAY2019         455       506   
                                                            dcd A.1.1.1.2    23MAY2019         523       392   
                                                            dcd A.1.1.1.2    23MAY2019         770        73   
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   dcd A.1.1.1.2    10APR2019         686       309   
                                                            dcd B.2.2.3.1    10APR2019         803       130   
      CHN-11/220           26/F/ASIAN                       dcd D.1.1.1.1    01MAR2019         876       176   
                                                            dcd B.1.1.1.1    01MAR2019         911       162   
      CHN-11/38            25/F/WHITE                       dcd A.1.1.1.2    17JUN2019         524       536   
      \s\nACTARM: B: Placebo
      
      ——————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                                
                                                              Most      Caused by                         Action
                                                             Extreme      Study     Outcome   Treatment   Taken 
      Center/Patients ID            Age/Sex/Race            Intensity     Drug        (1)      for AE      (2)  
      ——————————————————————————————————————————————————————————————————————————————————————————————————————————
      CAN-1/341            43/F/ASIAN                       MODERATE    No          5         Yes         2     
                                                            SEVERE      Yes         1         No          6     
                                                            MODERATE    No          6         No          1     
                                                            MODERATE    No          3         Yes         3     
                                                            MODERATE    No          5         No          2     
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   MODERATE    No          6         Yes         2     
                                                            MILD        No          6         No          6     
      CHN-11/220           26/F/ASIAN                       SEVERE      Yes         1         No          6     
                                                            SEVERE      Yes         1         No          6     
      CHN-11/38            25/F/WHITE                       MODERATE    No          2         No          2     
      \s\nACTARM: B: Placebo
      
      ————————————————————————————————————————————————————————————————
                                                              Reason  
                                                            Classified
                                                            as Serious
      Center/Patients ID            Age/Sex/Race               (3)    
      ————————————————————————————————————————————————————————————————
      CAN-1/341            43/F/ASIAN                       6         
                                                            1         
                                                            3         
                                                            6         
                                                            5         
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   3         
                                                            6         
      CHN-11/220           26/F/ASIAN                       1         
                                                            1         
      CHN-11/38            25/F/WHITE                       5         

