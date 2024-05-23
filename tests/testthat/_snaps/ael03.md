# ael03 works with adae dataset

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      ACTARM: A: Drug X
      
      ——————————————————————————————————————————————————————————————————————————————————————————————
                                                                                Date of             
                                                               Adverse        First Study     Study 
                                                             Event MedDRA         Drug        Day of
      Center/Patients ID            Age/Sex/Race            Preferred Term   Administration   Onset 
      ——————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   dcd A.1.1.1.2    28APR2019         1008 
      CHN-14/1             27/F/ASIAN                       dcd A.1.1.1.2    07MAY2019         259  
                                                            dcd B.2.2.3.1    07MAY2019         385  
                                                            dcd B.1.1.1.1    07MAY2019         517  
      CHN-17/309           36/F/ASIAN                       dcd B.2.2.3.1    27APR2019         344  
                                                            dcd D.1.1.1.1    27APR2019         495  
      CHN-2/286            30/F/ASIAN                       dcd D.1.1.1.1    16MAY2019         157  
                                                            dcd B.2.2.3.1    16MAY2019         489  
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN   dcd D.1.1.1.1    27APR2019          55  
      CHN-4/73             24/F/ASIAN                       dcd B.2.2.3.1    17MAR2019         163  
      \s\nACTARM: A: Drug X
      
      ————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                      
                                                               AE        Most      Caused by          
                                                            Duration    Extreme      Study     Outcome
      Center/Patients ID            Age/Sex/Race            in Days    Intensity     Drug        (1)  
      ————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN      68      MODERATE    No          3      
      CHN-14/1             27/F/ASIAN                         657      MODERATE    No          2      
                                                               20      MILD        No          6      
                                                              280      SEVERE      Yes         1      
      CHN-17/309           36/F/ASIAN                         496      MILD        No          5      
                                                              486      SEVERE      Yes         1      
      CHN-2/286            30/F/ASIAN                         612      SEVERE      Yes         1      
                                                              104      MILD        No          5      
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN     797      SEVERE      Yes         1      
      CHN-4/73             24/F/ASIAN                          74      MILD        No          6      
      \s\nACTARM: A: Drug X
      
      —————————————————————————————————————————————————————————————————————————————————————
                                                                                   Reason  
                                                                        Action   Classified
                                                            Treatment   Taken    as Serious
      Center/Patients ID            Age/Sex/Race             for AE      (2)        (3)    
      —————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   Yes         2        5         
      CHN-14/1             27/F/ASIAN                       No          2        4         
                                                            Yes         2        6         
                                                            No          6        1         
      CHN-17/309           36/F/ASIAN                       Yes         1        3         
                                                            No          6        1         
      CHN-2/286            30/F/ASIAN                       No          6        1         
                                                            No          2        6         
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN   No          6        1         
      CHN-4/73             24/F/ASIAN                       Yes         3        6         
      \s\nACTARM: C: Combination
      
      ——————————————————————————————————————————————————————————————————————————————————————————————
                                                                                Date of             
                                                               Adverse        First Study     Study 
                                                             Event MedDRA         Drug        Day of
      Center/Patients ID            Age/Sex/Race            Preferred Term   Administration   Onset 
      ——————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/9             40/M/ASIAN                       dcd B.2.2.3.1    26MAR2019         441  
                                                            dcd D.1.1.1.1    26MAR2019         445  
                                                            dcd B.1.1.1.1    26MAR2019         644  
                                                            dcd B.2.2.3.1    26MAR2019         669  
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   dcd D.1.1.1.1    28APR2019          92  
                                                            dcd A.1.1.1.2    28APR2019         449  
                                                            dcd A.1.1.1.2    28APR2019         594  
                                                            dcd D.1.1.1.1    28APR2019         671  
                                                            dcd D.1.1.1.1    28APR2019         938  
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN   dcd B.1.1.1.1    26FEB2019         124  
      \s\nACTARM: C: Combination
      
      ————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                      
                                                               AE        Most      Caused by          
                                                            Duration    Extreme      Study     Outcome
      Center/Patients ID            Age/Sex/Race            in Days    Intensity     Drug        (1)  
      ————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/9             40/M/ASIAN                          53      MILD        No          5      
                                                              598      SEVERE      Yes         1      
                                                               42      SEVERE      Yes         1      
                                                              100      MILD        No          5      
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN     254      SEVERE      Yes         1      
                                                              517      MODERATE    No          5      
                                                               51      MODERATE    No          5      
                                                               32      SEVERE      Yes         1      
                                                               36      SEVERE      Yes         1      
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN     457      SEVERE      Yes         1      
      \s\nACTARM: C: Combination
      
      —————————————————————————————————————————————————————————————————————————————————————
                                                                                   Reason  
                                                                        Action   Classified
                                                            Treatment   Taken    as Serious
      Center/Patients ID            Age/Sex/Race             for AE      (2)        (3)    
      —————————————————————————————————————————————————————————————————————————————————————
      BRA-11/9             40/M/ASIAN                       No          2        3         
                                                            No          6        1         
                                                            No          6        1         
                                                            Yes         2        3         
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   No          6        1         
                                                            Yes         3        6         
                                                            Yes         3        3         
                                                            No          6        1         
                                                            No          6        1         
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN   No          6        1         
      \s\nACTARM: B: Placebo
      
      ——————————————————————————————————————————————————————————————————————————————————————————————
                                                                                Date of             
                                                               Adverse        First Study     Study 
                                                             Event MedDRA         Drug        Day of
      Center/Patients ID            Age/Sex/Race            Preferred Term   Administration   Onset 
      ——————————————————————————————————————————————————————————————————————————————————————————————
      CAN-1/341            43/F/ASIAN                       dcd A.1.1.1.2    23MAY2019          57  
                                                            dcd B.1.1.1.1    23MAY2019         434  
                                                            dcd A.1.1.1.2    23MAY2019         455  
                                                            dcd A.1.1.1.2    23MAY2019         523  
                                                            dcd A.1.1.1.2    23MAY2019         770  
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   dcd A.1.1.1.2    10APR2019         686  
                                                            dcd B.2.2.3.1    10APR2019         803  
      CHN-11/220           26/F/ASIAN                       dcd D.1.1.1.1    01MAR2019         876  
                                                            dcd B.1.1.1.1    01MAR2019         911  
      CHN-11/38            25/F/WHITE                       dcd A.1.1.1.2    17JUN2019         524  
      \s\nACTARM: B: Placebo
      
      ————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                      
                                                               AE        Most      Caused by          
                                                            Duration    Extreme      Study     Outcome
      Center/Patients ID            Age/Sex/Race            in Days    Intensity     Drug        (1)  
      ————————————————————————————————————————————————————————————————————————————————————————————————
      CAN-1/341            43/F/ASIAN                         327      MODERATE    No          5      
                                                              410      SEVERE      Yes         1      
                                                              506      MODERATE    No          6      
                                                              392      MODERATE    No          3      
                                                               73      MODERATE    No          5      
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN     309      MODERATE    No          6      
                                                              130      MILD        No          6      
      CHN-11/220           26/F/ASIAN                         176      SEVERE      Yes         1      
                                                              162      SEVERE      Yes         1      
      CHN-11/38            25/F/WHITE                         536      MODERATE    No          2      
      \s\nACTARM: B: Placebo
      
      —————————————————————————————————————————————————————————————————————————————————————
                                                                                   Reason  
                                                                        Action   Classified
                                                            Treatment   Taken    as Serious
      Center/Patients ID            Age/Sex/Race             for AE      (2)        (3)    
      —————————————————————————————————————————————————————————————————————————————————————
      CAN-1/341            43/F/ASIAN                       Yes         2        6         
                                                            No          6        1         
                                                            No          1        3         
                                                            Yes         3        6         
                                                            No          2        5         
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   Yes         2        3         
                                                            No          6        6         
      CHN-11/220           26/F/ASIAN                       No          6        1         
                                                            No          6        1         
      CHN-11/38            25/F/WHITE                       No          2        5         

# ael03 can handle all missing values

    Code
      cat(export_as_txt(res[[1]][1:50, ], lpp = 100))
    Output
      ACTARM: <Missing>
      
      ——————————————————————————————————————————————————————————————————————————————————————————————
                                                                                Date of             
                                                               Adverse        First Study     Study 
                                                             Event MedDRA         Drug        Day of
      Center/Patients ID            Age/Sex/Race            Preferred Term   Administration   Onset 
      ——————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   <Missing>        28APR2019         1008 
      BRA-11/9             40/M/ASIAN                       <Missing>        26MAR2019         441  
                                                            <Missing>        26MAR2019         445  
                                                            <Missing>        26MAR2019         644  
                                                            <Missing>        26MAR2019         669  
      CAN-1/341            43/F/ASIAN                       <Missing>        23MAY2019          57  
                                                            <Missing>        23MAY2019         434  
                                                            <Missing>        23MAY2019         455  
                                                            <Missing>        23MAY2019         523  
                                                            <Missing>        23MAY2019         770  
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   <Missing>        10APR2019         686  
                                                            <Missing>        10APR2019         803  
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   <Missing>        28APR2019          92  
                                                            <Missing>        28APR2019         449  
                                                            <Missing>        28APR2019         594  
                                                            <Missing>        28APR2019         671  
                                                            <Missing>        28APR2019         938  
      CHN-11/220           26/F/ASIAN                       <Missing>        01MAR2019         876  
                                                            <Missing>        01MAR2019         911  
      CHN-11/38            25/F/WHITE                       <Missing>        17JUN2019         524  
      CHN-13/102           37/M/ASIAN                       <Missing>        23MAR2019          34  
                                                            <Missing>        23MAR2019          65  
                                                            <Missing>        23MAR2019         184  
                                                            <Missing>        23MAR2019         439  
                                                            <Missing>        23MAR2019         870  
      CHN-14/1             27/F/ASIAN                       <Missing>        07MAY2019         259  
                                                            <Missing>        07MAY2019         385  
                                                            <Missing>        07MAY2019         517  
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN   <Missing>        26FEB2019         124  
                                                            <Missing>        26FEB2019         337  
                                                            <Missing>        26FEB2019         1052 
      CHN-17/309           36/F/ASIAN                       <Missing>        27APR2019         344  
                                                            <Missing>        27APR2019         495  
      CHN-17/48            32/F/ASIAN                       <Missing>        03MAY2019          20  
      CHN-17/84            40/F/ASIAN                       <Missing>        24MAR2019          19  
                                                            <Missing>        24MAR2019         595  
                                                            <Missing>        24MAR2019         830  
                                                            <Missing>        24MAR2019         852  
      CHN-2/286            30/F/ASIAN                       <Missing>        16MAY2019         157  
                                                            <Missing>        16MAY2019         489  
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN   <Missing>        27APR2019          55  
      CHN-4/115            38/M/ASIAN                       <Missing>        28MAR2019         298  
                                                            <Missing>        28MAR2019         610  
                                                            <Missing>        28MAR2019         769  
                                                            <Missing>        28MAR2019         807  
                                                            <Missing>        28MAR2019         991  
      CHN-4/370            45/M/ASIAN                       <Missing>        29MAR2019         595  
                                                            <Missing>        29MAR2019         741  
                                                            <Missing>        29MAR2019         856  
                                                            <Missing>        29MAR2019         986  
      \s\nACTARM: <Missing>
      
      ————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                      
                                                               AE        Most      Caused by          
                                                            Duration    Extreme      Study     Outcome
      Center/Patients ID            Age/Sex/Race            in Days    Intensity     Drug        (1)  
      ————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN      68      <Missing>   No          3      
      BRA-11/9             40/M/ASIAN                          53      <Missing>   No          5      
                                                              598      <Missing>   Yes         1      
                                                               42      <Missing>   Yes         1      
                                                              100      <Missing>   No          5      
      CAN-1/341            43/F/ASIAN                         327      <Missing>   No          5      
                                                              410      <Missing>   Yes         1      
                                                              506      <Missing>   No          6      
                                                              392      <Missing>   No          3      
                                                               73      <Missing>   No          5      
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN     309      <Missing>   No          6      
                                                              130      <Missing>   No          6      
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN     254      <Missing>   Yes         1      
                                                              517      <Missing>   No          5      
                                                               51      <Missing>   No          5      
                                                               32      <Missing>   Yes         1      
                                                               36      <Missing>   Yes         1      
      CHN-11/220           26/F/ASIAN                         176      <Missing>   Yes         1      
                                                              162      <Missing>   Yes         1      
      CHN-11/38            25/F/WHITE                         536      <Missing>   No          2      
      CHN-13/102           37/M/ASIAN                         555      <Missing>   Yes         1      
                                                              400      <Missing>   Yes         1      
                                                              446      <Missing>   No          3      
                                                              515      <Missing>   Yes         1      
                                                               58      <Missing>   Yes         1      
      CHN-14/1             27/F/ASIAN                         657      <Missing>   No          2      
                                                               20      <Missing>   No          6      
                                                              280      <Missing>   Yes         1      
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN     457      <Missing>   Yes         1      
                                                              140      <Missing>   Yes         1      
                                                               21      <Missing>   No          3      
      CHN-17/309           36/F/ASIAN                         496      <Missing>   No          5      
                                                              486      <Missing>   Yes         1      
      CHN-17/48            32/F/ASIAN                         255      <Missing>   Yes         1      
      CHN-17/84            40/F/ASIAN                         1021     <Missing>   Yes         1      
                                                              414      <Missing>   No          5      
                                                              133      <Missing>   Yes         1      
                                                              209      <Missing>   No          3      
      CHN-2/286            30/F/ASIAN                         612      <Missing>   Yes         1      
                                                              104      <Missing>   No          5      
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN     797      <Missing>   Yes         1      
      CHN-4/115            38/M/ASIAN                         700      <Missing>   No          3      
                                                              130      <Missing>   Yes         1      
                                                              104      <Missing>   No          3      
                                                              200      <Missing>   Yes         1      
                                                               72      <Missing>   No          2      
      CHN-4/370            45/M/ASIAN                          19      <Missing>   No          3      
                                                               60      <Missing>   No          3      
                                                              188      <Missing>   No          4      
                                                               25      <Missing>   No          3      
      \s\nACTARM: <Missing>
      
      —————————————————————————————————————————————————————————————————————————————————————
                                                                                   Reason  
                                                                        Action   Classified
                                                            Treatment   Taken    as Serious
      Center/Patients ID            Age/Sex/Race             for AE      (2)        (3)    
      —————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   Yes         2        5         
      BRA-11/9             40/M/ASIAN                       No          2        3         
                                                            No          6        1         
                                                            No          6        1         
                                                            Yes         2        3         
      CAN-1/341            43/F/ASIAN                       Yes         2        6         
                                                            No          6        1         
                                                            No          1        3         
                                                            Yes         3        6         
                                                            No          2        5         
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   Yes         2        3         
                                                            No          6        6         
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   No          6        1         
                                                            Yes         3        6         
                                                            Yes         3        3         
                                                            No          6        1         
                                                            No          6        1         
      CHN-11/220           26/F/ASIAN                       No          6        1         
                                                            No          6        1         
      CHN-11/38            25/F/WHITE                       No          2        5         
      CHN-13/102           37/M/ASIAN                       No          6        1         
                                                            Yes         6        1         
                                                            No          6        6         
                                                            Yes         6        1         
                                                            Yes         6        1         
      CHN-14/1             27/F/ASIAN                       No          2        4         
                                                            Yes         2        6         
                                                            No          6        1         
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN   No          6        1         
                                                            No          6        1         
                                                            Yes         1        3         
      CHN-17/309           36/F/ASIAN                       Yes         1        3         
                                                            No          6        1         
      CHN-17/48            32/F/ASIAN                       Yes         6        1         
      CHN-17/84            40/F/ASIAN                       No          6        1         
                                                            No          2        5         
                                                            No          6        1         
                                                            No          2        6         
      CHN-2/286            30/F/ASIAN                       No          6        1         
                                                            No          2        6         
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN   No          6        1         
      CHN-4/115            38/M/ASIAN                       Yes         2        6         
                                                            No          6        1         
                                                            No          2        3         
                                                            No          6        1         
                                                            No          6        5         
      CHN-4/370            45/M/ASIAN                       No          2        3         
                                                            No          6        4         
                                                            Yes         3        5         
                                                            No          2        6         

# ael03 functions work as expected

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      ACTARM: A: Drug X
      
      ——————————————————————————————————————————————————————————————————————————————————————————————
                                                                                Date of             
                                                               Adverse        First Study     Study 
                                                             Event MedDRA         Drug        Day of
      Center/Patients ID            Age/Sex/Race            Preferred Term   Administration   Onset 
      ——————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   dcd A.1.1.1.2    28APR2019         1008 
      CHN-14/1             27/F/ASIAN                       dcd A.1.1.1.2    07MAY2019         259  
                                                            dcd B.2.2.3.1    07MAY2019         385  
                                                            dcd B.1.1.1.1    07MAY2019         517  
      CHN-17/309           36/F/ASIAN                       dcd B.2.2.3.1    27APR2019         344  
                                                            dcd D.1.1.1.1    27APR2019         495  
      CHN-2/286            30/F/ASIAN                       dcd D.1.1.1.1    16MAY2019         157  
                                                            dcd B.2.2.3.1    16MAY2019         489  
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN   dcd D.1.1.1.1    27APR2019          55  
      CHN-4/73             24/F/ASIAN                       dcd B.2.2.3.1    17MAR2019         163  
      \s\nACTARM: A: Drug X
      
      ————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                      
                                                               AE        Most      Caused by          
                                                            Duration    Extreme      Study     Outcome
      Center/Patients ID            Age/Sex/Race            in Days    Intensity     Drug        (1)  
      ————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN      68      MODERATE    No          3      
      CHN-14/1             27/F/ASIAN                         657      MODERATE    No          2      
                                                               20      MILD        No          6      
                                                              280      SEVERE      Yes         1      
      CHN-17/309           36/F/ASIAN                         496      MILD        No          5      
                                                              486      SEVERE      Yes         1      
      CHN-2/286            30/F/ASIAN                         612      SEVERE      Yes         1      
                                                              104      MILD        No          5      
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN     797      SEVERE      Yes         1      
      CHN-4/73             24/F/ASIAN                          74      MILD        No          6      
      \s\nACTARM: A: Drug X
      
      —————————————————————————————————————————————————————————————————————————————————————
                                                                                   Reason  
                                                                        Action   Classified
                                                            Treatment   Taken    as Serious
      Center/Patients ID            Age/Sex/Race             for AE      (2)        (3)    
      —————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   Yes         2        5         
      CHN-14/1             27/F/ASIAN                       No          2        4         
                                                            Yes         2        6         
                                                            No          6        1         
      CHN-17/309           36/F/ASIAN                       Yes         1        3         
                                                            No          6        1         
      CHN-2/286            30/F/ASIAN                       No          6        1         
                                                            No          2        6         
      CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN   No          6        1         
      CHN-4/73             24/F/ASIAN                       Yes         3        6         
      \s\nACTARM: C: Combination
      
      ——————————————————————————————————————————————————————————————————————————————————————————————
                                                                                Date of             
                                                               Adverse        First Study     Study 
                                                             Event MedDRA         Drug        Day of
      Center/Patients ID            Age/Sex/Race            Preferred Term   Administration   Onset 
      ——————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/9             40/M/ASIAN                       dcd B.2.2.3.1    26MAR2019         441  
                                                            dcd D.1.1.1.1    26MAR2019         445  
                                                            dcd B.1.1.1.1    26MAR2019         644  
                                                            dcd B.2.2.3.1    26MAR2019         669  
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   dcd D.1.1.1.1    28APR2019          92  
                                                            dcd A.1.1.1.2    28APR2019         449  
                                                            dcd A.1.1.1.2    28APR2019         594  
                                                            dcd D.1.1.1.1    28APR2019         671  
                                                            dcd D.1.1.1.1    28APR2019         938  
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN   dcd B.1.1.1.1    26FEB2019         124  
      \s\nACTARM: C: Combination
      
      ————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                      
                                                               AE        Most      Caused by          
                                                            Duration    Extreme      Study     Outcome
      Center/Patients ID            Age/Sex/Race            in Days    Intensity     Drug        (1)  
      ————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/9             40/M/ASIAN                          53      MILD        No          5      
                                                              598      SEVERE      Yes         1      
                                                               42      SEVERE      Yes         1      
                                                              100      MILD        No          5      
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN     254      SEVERE      Yes         1      
                                                              517      MODERATE    No          5      
                                                               51      MODERATE    No          5      
                                                               32      SEVERE      Yes         1      
                                                               36      SEVERE      Yes         1      
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN     457      SEVERE      Yes         1      
      \s\nACTARM: C: Combination
      
      —————————————————————————————————————————————————————————————————————————————————————
                                                                                   Reason  
                                                                        Action   Classified
                                                            Treatment   Taken    as Serious
      Center/Patients ID            Age/Sex/Race             for AE      (2)        (3)    
      —————————————————————————————————————————————————————————————————————————————————————
      BRA-11/9             40/M/ASIAN                       No          2        3         
                                                            No          6        1         
                                                            No          6        1         
                                                            Yes         2        3         
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   No          6        1         
                                                            Yes         3        6         
                                                            Yes         3        3         
                                                            No          6        1         
                                                            No          6        1         
      CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN   No          6        1         
      \s\nACTARM: B: Placebo
      
      ——————————————————————————————————————————————————————————————————————————————————————————————
                                                                                Date of             
                                                               Adverse        First Study     Study 
                                                             Event MedDRA         Drug        Day of
      Center/Patients ID            Age/Sex/Race            Preferred Term   Administration   Onset 
      ——————————————————————————————————————————————————————————————————————————————————————————————
      CAN-1/341            43/F/ASIAN                       dcd A.1.1.1.2    23MAY2019          57  
                                                            dcd B.1.1.1.1    23MAY2019         434  
                                                            dcd A.1.1.1.2    23MAY2019         455  
                                                            dcd A.1.1.1.2    23MAY2019         523  
                                                            dcd A.1.1.1.2    23MAY2019         770  
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   dcd A.1.1.1.2    10APR2019         686  
                                                            dcd B.2.2.3.1    10APR2019         803  
      CHN-11/220           26/F/ASIAN                       dcd D.1.1.1.1    01MAR2019         876  
                                                            dcd B.1.1.1.1    01MAR2019         911  
      CHN-11/38            25/F/WHITE                       dcd A.1.1.1.2    17JUN2019         524  
      \s\nACTARM: B: Placebo
      
      ————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                      
                                                               AE        Most      Caused by          
                                                            Duration    Extreme      Study     Outcome
      Center/Patients ID            Age/Sex/Race            in Days    Intensity     Drug        (1)  
      ————————————————————————————————————————————————————————————————————————————————————————————————
      CAN-1/341            43/F/ASIAN                         327      MODERATE    No          5      
                                                              410      SEVERE      Yes         1      
                                                              506      MODERATE    No          6      
                                                              392      MODERATE    No          3      
                                                               73      MODERATE    No          5      
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN     309      MODERATE    No          6      
                                                              130      MILD        No          6      
      CHN-11/220           26/F/ASIAN                         176      SEVERE      Yes         1      
                                                              162      SEVERE      Yes         1      
      CHN-11/38            25/F/WHITE                         536      MODERATE    No          2      
      \s\nACTARM: B: Placebo
      
      —————————————————————————————————————————————————————————————————————————————————————
                                                                                   Reason  
                                                                        Action   Classified
                                                            Treatment   Taken    as Serious
      Center/Patients ID            Age/Sex/Race             for AE      (2)        (3)    
      —————————————————————————————————————————————————————————————————————————————————————
      CAN-1/341            43/F/ASIAN                       Yes         2        6         
                                                            No          6        1         
                                                            No          1        3         
                                                            Yes         3        6         
                                                            No          2        5         
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   Yes         2        3         
                                                            No          6        6         
      CHN-11/220           26/F/ASIAN                       No          6        1         
                                                            No          6        1         
      CHN-11/38            25/F/WHITE                       No          2        5         

