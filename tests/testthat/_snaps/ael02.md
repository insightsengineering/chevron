# ael02 works with adae dataset

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
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   dcd D.1.1.4.2    28APR2019         108        67   
                                                            dcd C.1.1.1.3    28APR2019         437        39   
                                                            dcd A.1.1.1.2    28APR2019         1007       68   
      CHN-14/1             27/F/ASIAN                       dcd D.1.1.4.2    07MAY2019         193       525   
                                                            dcd A.1.1.1.1    07MAY2019         194       414   
                                                            dcd A.1.1.1.2    07MAY2019         258       657   
                                                            dcd C.1.1.1.3    07MAY2019         367       645   
                                                            dcd C.2.1.2.1    07MAY2019         371       214   
                                                            dcd B.2.2.3.1    07MAY2019         385        20   
                                                            dcd B.1.1.1.1    07MAY2019         517       280   
      \s\nACTARM: A: Drug X
      
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                                 
                                                                        Most      Caused by                      
                                                                       Extreme      Study     Outcome   Treatment
      Center/Patients ID            Age/Sex/Race            Serious   Intensity     Drug        (1)      for AE  
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   No        MODERATE    No          5         No       
                                                            No        SEVERE      Yes         3         No       
                                                            Yes       MODERATE    No          3         Yes      
      CHN-14/1             27/F/ASIAN                       No        MODERATE    No          3         Yes      
                                                            No        MILD        No          5         Yes      
                                                            Yes       MODERATE    No          2         No       
                                                            No        SEVERE      Yes         3         Yes      
                                                            No        MODERATE    Yes         6         Yes      
                                                            Yes       MILD        No          6         Yes      
                                                            Yes       SEVERE      Yes         1         No       
      \s\nACTARM: A: Drug X
      
      ————————————————————————————————————————————————————————————
                                                                  
                                                            Action
                                                            Taken 
      Center/Patients ID            Age/Sex/Race             (2)  
      ————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   5     
                                                            7     
                                                            2     
      CHN-14/1             27/F/ASIAN                       3     
                                                            7     
                                                            2     
                                                            2     
                                                            6     
                                                            2     
                                                            6     
      \s\nACTARM: C: Combination
      
      —————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                Date of                        
                                                               Adverse        First Study     Study       AE   
                                                             Event MedDRA         Drug        Day of   Duration
      Center/Patients ID            Age/Sex/Race            Preferred Term   Administration   Onset    in Days 
      —————————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/9             40/M/ASIAN                       dcd D.1.1.4.2    25MAR2019         342       700   
                                                            dcd B.2.2.3.1    25MAR2019         441        53   
                                                            dcd D.1.1.1.1    25MAR2019         445       598   
                                                            dcd B.1.1.1.1    25MAR2019         644        42   
                                                            dcd B.2.2.3.1    25MAR2019         669       100   
                                                            dcd C.2.1.2.1    25MAR2019         744       185   
                                                            dcd C.2.1.2.1    25MAR2019         808       166   
                                                            dcd B.2.1.2.1    25MAR2019         970        15   
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   dcd B.2.1.2.1    28APR2019          31       678   
                                                            dcd D.1.1.1.1    28APR2019          92       254   
      \s\nACTARM: C: Combination
      
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                                 
                                                                        Most      Caused by                      
                                                                       Extreme      Study     Outcome   Treatment
      Center/Patients ID            Age/Sex/Race            Serious   Intensity     Drug        (1)      for AE  
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/9             40/M/ASIAN                       No        MODERATE    No          2         No       
                                                            Yes       MILD        No          5         No       
                                                            Yes       SEVERE      Yes         1         No       
                                                            Yes       SEVERE      Yes         1         No       
                                                            Yes       MILD        No          5         Yes      
                                                            No        MODERATE    Yes         4         No       
                                                            No        MODERATE    Yes         3         No       
                                                            No        MODERATE    No          3         No       
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   No        MODERATE    No          6         No       
                                                            Yes       SEVERE      Yes         1         No       
      \s\nACTARM: C: Combination
      
      ————————————————————————————————————————————————————————————
                                                                  
                                                            Action
                                                            Taken 
      Center/Patients ID            Age/Sex/Race             (2)  
      ————————————————————————————————————————————————————————————
      BRA-11/9             40/M/ASIAN                       3     
                                                            2     
                                                            6     
                                                            6     
                                                            2     
                                                            3     
                                                            6     
                                                            2     
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   1     
                                                            6     
      \s\nACTARM: B: Placebo
      
      —————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                Date of                        
                                                               Adverse        First Study     Study       AE   
                                                             Event MedDRA         Drug        Day of   Duration
      Center/Patients ID            Age/Sex/Race            Preferred Term   Administration   Onset    in Days 
      —————————————————————————————————————————————————————————————————————————————————————————————————————————
      CAN-1/341            43/F/ASIAN                       dcd A.1.1.1.2    23MAY2019          57       326   
                                                            dcd B.2.1.2.1    23MAY2019         253        72   
                                                            dcd B.1.1.1.1    23MAY2019         434       409   
                                                            dcd A.1.1.1.2    23MAY2019         454       506   
                                                            dcd A.1.1.1.2    23MAY2019         523       391   
                                                            dcd A.1.1.1.1    23MAY2019         628       265   
                                                            dcd C.2.1.2.1    23MAY2019         750       128   
                                                            dcd A.1.1.1.2    23MAY2019         769        73   
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   dcd C.1.1.1.3    09APR2019         253       202   
                                                            dcd B.2.1.2.1    09APR2019         311       297   
      \s\nACTARM: B: Placebo
      
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                                 
                                                                        Most      Caused by                      
                                                                       Extreme      Study     Outcome   Treatment
      Center/Patients ID            Age/Sex/Race            Serious   Intensity     Drug        (1)      for AE  
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————
      CAN-1/341            43/F/ASIAN                       Yes       MODERATE    No          5         Yes      
                                                            No        MODERATE    No          5         Yes      
                                                            Yes       SEVERE      Yes         1         No       
                                                            Yes       MODERATE    No          6         No       
                                                            Yes       MODERATE    No          3         Yes      
                                                            No        MILD        No          2         Yes      
                                                            No        MODERATE    Yes         2         No       
                                                            Yes       MODERATE    No          5         No       
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   No        SEVERE      Yes         3         No       
                                                            No        MODERATE    No          2         No       
      \s\nACTARM: B: Placebo
      
      ————————————————————————————————————————————————————————————
                                                                  
                                                            Action
                                                            Taken 
      Center/Patients ID            Age/Sex/Race             (2)  
      ————————————————————————————————————————————————————————————
      CAN-1/341            43/F/ASIAN                       2     
                                                            2     
                                                            6     
                                                            1     
                                                            3     
                                                            2     
                                                            2     
                                                            2     
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   7     
                                                            2     

# ael02 can handle all missing values

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
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   <Missing>        28APR2019         108        67   
                                                            <Missing>        28APR2019         437        39   
                                                            <Missing>        28APR2019         1007       68   
      BRA-11/9             40/M/ASIAN                       <Missing>        25MAR2019         342       700   
                                                            <Missing>        25MAR2019         441        53   
                                                            <Missing>        25MAR2019         445       598   
                                                            <Missing>        25MAR2019         644        42   
                                                            <Missing>        25MAR2019         669       100   
                                                            <Missing>        25MAR2019         744       185   
                                                            <Missing>        25MAR2019         808       166   
                                                            <Missing>        25MAR2019         970        15   
      CAN-1/341            43/F/ASIAN                       <Missing>        23MAY2019          57       326   
                                                            <Missing>        23MAY2019         253        72   
                                                            <Missing>        23MAY2019         434       409   
                                                            <Missing>        23MAY2019         454       506   
                                                            <Missing>        23MAY2019         523       391   
                                                            <Missing>        23MAY2019         628       265   
                                                            <Missing>        23MAY2019         750       128   
                                                            <Missing>        23MAY2019         769        73   
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   <Missing>        09APR2019         253       202   
                                                            <Missing>        09APR2019         311       297   
                                                            <Missing>        09APR2019         400       424   
                                                            <Missing>        09APR2019         449       300   
                                                            <Missing>        09APR2019         685       309   
                                                            <Missing>        09APR2019         803       129   
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   <Missing>        28APR2019          31       678   
                                                            <Missing>        28APR2019          92       254   
                                                            <Missing>        28APR2019         239       213   
                                                            <Missing>        28APR2019         365       353   
                                                            <Missing>        28APR2019         449       516   
                                                            <Missing>        28APR2019         593        51   
                                                            <Missing>        28APR2019         671        32   
                                                            <Missing>        28APR2019         937        36   
                                                            <Missing>        28APR2019         996        9    
      CHN-11/220           26/F/ASIAN                       <Missing>        01MAR2019         406       422   
                                                            <Missing>        01MAR2019         876       175   
                                                            <Missing>        01MAR2019         910       162   
                                                            <Missing>        01MAR2019         979       118   
      CHN-11/263           34/F/ASIAN                       <Missing>        03APR2019         140        43   
                                                            <Missing>        03APR2019         263       147   
                                                            <Missing>        03APR2019         524       519   
                                                            <Missing>        03APR2019         714       163   
                                                            <Missing>        03APR2019         768       277   
                                                            <Missing>        03APR2019         876       194   
                                                            <Missing>        03APR2019         955       106   
      CHN-11/38            25/F/WHITE                       <Missing>        17JUN2019         523       536   
      CHN-13/102           37/M/ASIAN                       <Missing>        23MAR2019          34       555   
                                                            <Missing>        23MAR2019          55        73   
                                                            <Missing>        23MAR2019          57        57   
                                                            <Missing>        23MAR2019          65       400   
      \s\nACTARM: <Missing>
      
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                                 
                                                                        Most      Caused by                      
                                                                       Extreme      Study     Outcome   Treatment
      Center/Patients ID            Age/Sex/Race            Serious   Intensity     Drug        (1)      for AE  
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   No        <Missing>   No          5         No       
                                                            No        <Missing>   Yes         3         No       
                                                            Yes       <Missing>   No          3         Yes      
      BRA-11/9             40/M/ASIAN                       No        <Missing>   No          2         No       
                                                            Yes       <Missing>   No          5         No       
                                                            Yes       <Missing>   Yes         1         No       
                                                            Yes       <Missing>   Yes         1         No       
                                                            Yes       <Missing>   No          5         Yes      
                                                            No        <Missing>   Yes         4         No       
                                                            No        <Missing>   Yes         3         No       
                                                            No        <Missing>   No          3         No       
      CAN-1/341            43/F/ASIAN                       Yes       <Missing>   No          5         Yes      
                                                            No        <Missing>   No          5         Yes      
                                                            Yes       <Missing>   Yes         1         No       
                                                            Yes       <Missing>   No          6         No       
                                                            Yes       <Missing>   No          3         Yes      
                                                            No        <Missing>   No          2         Yes      
                                                            No        <Missing>   Yes         2         No       
                                                            Yes       <Missing>   No          5         No       
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   No        <Missing>   Yes         3         No       
                                                            No        <Missing>   No          2         No       
                                                            No        <Missing>   Yes         3         No       
                                                            No        <Missing>   Yes         5         No       
                                                            Yes       <Missing>   No          6         Yes      
                                                            Yes       <Missing>   No          6         No       
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   No        <Missing>   No          6         No       
                                                            Yes       <Missing>   Yes         1         No       
                                                            No        <Missing>   Yes         5         No       
                                                            No        <Missing>   Yes         3         No       
                                                            Yes       <Missing>   No          5         Yes      
                                                            Yes       <Missing>   No          5         Yes      
                                                            Yes       <Missing>   Yes         1         No       
                                                            Yes       <Missing>   Yes         1         No       
                                                            No        <Missing>   Yes         2         No       
      CHN-11/220           26/F/ASIAN                       No        <Missing>   Yes         3         No       
                                                            Yes       <Missing>   Yes         1         No       
                                                            Yes       <Missing>   Yes         1         No       
                                                            No        <Missing>   Yes         4         No       
      CHN-11/263           34/F/ASIAN                       No        <Missing>   Yes         5         Yes      
                                                            No        <Missing>   Yes         6         Yes      
                                                            No        <Missing>   Yes         3         No       
                                                            No        <Missing>   Yes         6         No       
                                                            No        <Missing>   Yes         2         Yes      
                                                            No        <Missing>   Yes         3         Yes      
                                                            No        <Missing>   Yes         2         Yes      
      CHN-11/38            25/F/WHITE                       Yes       <Missing>   No          2         No       
      CHN-13/102           37/M/ASIAN                       Yes       <Missing>   Yes         1         No       
                                                            No        <Missing>   No          2         No       
                                                            No        <Missing>   No          3         No       
                                                            Yes       <Missing>   Yes         1         Yes      
      \s\nACTARM: <Missing>
      
      ————————————————————————————————————————————————————————————
                                                                  
                                                            Action
                                                            Taken 
      Center/Patients ID            Age/Sex/Race             (2)  
      ————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   5     
                                                            7     
                                                            2     
      BRA-11/9             40/M/ASIAN                       3     
                                                            2     
                                                            6     
                                                            6     
                                                            2     
                                                            3     
                                                            6     
                                                            2     
      CAN-1/341            43/F/ASIAN                       2     
                                                            2     
                                                            6     
                                                            1     
                                                            3     
                                                            2     
                                                            2     
                                                            2     
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   7     
                                                            2     
                                                            1     
                                                            3     
                                                            2     
                                                            6     
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   1     
                                                            6     
                                                            2     
                                                            2     
                                                            3     
                                                            3     
                                                            6     
                                                            6     
                                                            3     
      CHN-11/220           26/F/ASIAN                       3     
                                                            6     
                                                            6     
                                                            3     
      CHN-11/263           34/F/ASIAN                       1     
                                                            6     
                                                            2     
                                                            2     
                                                            6     
                                                            2     
                                                            2     
      CHN-11/38            25/F/WHITE                       2     
      CHN-13/102           37/M/ASIAN                       6     
                                                            2     
                                                            3     
                                                            6     

# ael02 functions work as expected

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
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   dcd D.1.1.4.2    28APR2019         108        67   
                                                            dcd C.1.1.1.3    28APR2019         437        39   
                                                            dcd A.1.1.1.2    28APR2019         1007       68   
      CHN-14/1             27/F/ASIAN                       dcd D.1.1.4.2    07MAY2019         193       525   
                                                            dcd A.1.1.1.1    07MAY2019         194       414   
                                                            dcd A.1.1.1.2    07MAY2019         258       657   
                                                            dcd C.1.1.1.3    07MAY2019         367       645   
                                                            dcd C.2.1.2.1    07MAY2019         371       214   
                                                            dcd B.2.2.3.1    07MAY2019         385        20   
                                                            dcd B.1.1.1.1    07MAY2019         517       280   
      \s\nACTARM: A: Drug X
      
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                                 
                                                                        Most      Caused by                      
                                                                       Extreme      Study     Outcome   Treatment
      Center/Patients ID            Age/Sex/Race            Serious   Intensity     Drug        (1)      for AE  
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   No        MODERATE    No          5         No       
                                                            No        SEVERE      Yes         3         No       
                                                            Yes       MODERATE    No          3         Yes      
      CHN-14/1             27/F/ASIAN                       No        MODERATE    No          3         Yes      
                                                            No        MILD        No          5         Yes      
                                                            Yes       MODERATE    No          2         No       
                                                            No        SEVERE      Yes         3         Yes      
                                                            No        MODERATE    Yes         6         Yes      
                                                            Yes       MILD        No          6         Yes      
                                                            Yes       SEVERE      Yes         1         No       
      \s\nACTARM: A: Drug X
      
      ————————————————————————————————————————————————————————————
                                                                  
                                                            Action
                                                            Taken 
      Center/Patients ID            Age/Sex/Race             (2)  
      ————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   5     
                                                            7     
                                                            2     
      CHN-14/1             27/F/ASIAN                       3     
                                                            7     
                                                            2     
                                                            2     
                                                            6     
                                                            2     
                                                            6     
      \s\nACTARM: C: Combination
      
      —————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                Date of                        
                                                               Adverse        First Study     Study       AE   
                                                             Event MedDRA         Drug        Day of   Duration
      Center/Patients ID            Age/Sex/Race            Preferred Term   Administration   Onset    in Days 
      —————————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/9             40/M/ASIAN                       dcd D.1.1.4.2    25MAR2019         342       700   
                                                            dcd B.2.2.3.1    25MAR2019         441        53   
                                                            dcd D.1.1.1.1    25MAR2019         445       598   
                                                            dcd B.1.1.1.1    25MAR2019         644        42   
                                                            dcd B.2.2.3.1    25MAR2019         669       100   
                                                            dcd C.2.1.2.1    25MAR2019         744       185   
                                                            dcd C.2.1.2.1    25MAR2019         808       166   
                                                            dcd B.2.1.2.1    25MAR2019         970        15   
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   dcd B.2.1.2.1    28APR2019          31       678   
                                                            dcd D.1.1.1.1    28APR2019          92       254   
      \s\nACTARM: C: Combination
      
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                                 
                                                                        Most      Caused by                      
                                                                       Extreme      Study     Outcome   Treatment
      Center/Patients ID            Age/Sex/Race            Serious   Intensity     Drug        (1)      for AE  
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/9             40/M/ASIAN                       No        MODERATE    No          2         No       
                                                            Yes       MILD        No          5         No       
                                                            Yes       SEVERE      Yes         1         No       
                                                            Yes       SEVERE      Yes         1         No       
                                                            Yes       MILD        No          5         Yes      
                                                            No        MODERATE    Yes         4         No       
                                                            No        MODERATE    Yes         3         No       
                                                            No        MODERATE    No          3         No       
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   No        MODERATE    No          6         No       
                                                            Yes       SEVERE      Yes         1         No       
      \s\nACTARM: C: Combination
      
      ————————————————————————————————————————————————————————————
                                                                  
                                                            Action
                                                            Taken 
      Center/Patients ID            Age/Sex/Race             (2)  
      ————————————————————————————————————————————————————————————
      BRA-11/9             40/M/ASIAN                       3     
                                                            2     
                                                            6     
                                                            6     
                                                            2     
                                                            3     
                                                            6     
                                                            2     
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   1     
                                                            6     
      \s\nACTARM: B: Placebo
      
      —————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                Date of                        
                                                               Adverse        First Study     Study       AE   
                                                             Event MedDRA         Drug        Day of   Duration
      Center/Patients ID            Age/Sex/Race            Preferred Term   Administration   Onset    in Days 
      —————————————————————————————————————————————————————————————————————————————————————————————————————————
      CAN-1/341            43/F/ASIAN                       dcd A.1.1.1.2    23MAY2019          57       326   
                                                            dcd B.2.1.2.1    23MAY2019         253        72   
                                                            dcd B.1.1.1.1    23MAY2019         434       409   
                                                            dcd A.1.1.1.2    23MAY2019         454       506   
                                                            dcd A.1.1.1.2    23MAY2019         523       391   
                                                            dcd A.1.1.1.1    23MAY2019         628       265   
                                                            dcd C.2.1.2.1    23MAY2019         750       128   
                                                            dcd A.1.1.1.2    23MAY2019         769        73   
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   dcd C.1.1.1.3    09APR2019         253       202   
                                                            dcd B.2.1.2.1    09APR2019         311       297   
      \s\nACTARM: B: Placebo
      
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                                 
                                                                        Most      Caused by                      
                                                                       Extreme      Study     Outcome   Treatment
      Center/Patients ID            Age/Sex/Race            Serious   Intensity     Drug        (1)      for AE  
      ———————————————————————————————————————————————————————————————————————————————————————————————————————————
      CAN-1/341            43/F/ASIAN                       Yes       MODERATE    No          5         Yes      
                                                            No        MODERATE    No          5         Yes      
                                                            Yes       SEVERE      Yes         1         No       
                                                            Yes       MODERATE    No          6         No       
                                                            Yes       MODERATE    No          3         Yes      
                                                            No        MILD        No          2         Yes      
                                                            No        MODERATE    Yes         2         No       
                                                            Yes       MODERATE    No          5         No       
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   No        SEVERE      Yes         3         No       
                                                            No        MODERATE    No          2         No       
      \s\nACTARM: B: Placebo
      
      ————————————————————————————————————————————————————————————
                                                                  
                                                            Action
                                                            Taken 
      Center/Patients ID            Age/Sex/Race             (2)  
      ————————————————————————————————————————————————————————————
      CAN-1/341            43/F/ASIAN                       2     
                                                            2     
                                                            6     
                                                            1     
                                                            3     
                                                            2     
                                                            2     
                                                            2     
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   7     
                                                            2     

