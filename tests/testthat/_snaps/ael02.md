# ael02 works with adae dataset

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
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   dcd D.1.1.4.2    28APR2019         108  
                                                            dcd C.1.1.1.3    28APR2019         437  
                                                            dcd A.1.1.1.2    28APR2019         1008 
      CHN-14/1             27/F/ASIAN                       dcd D.1.1.4.2    07MAY2019         193  
                                                            dcd A.1.1.1.1    07MAY2019         194  
                                                            dcd A.1.1.1.2    07MAY2019         259  
                                                            dcd C.1.1.1.3    07MAY2019         367  
                                                            dcd C.2.1.2.1    07MAY2019         372  
                                                            dcd B.2.2.3.1    07MAY2019         385  
                                                            dcd B.1.1.1.1    07MAY2019         517  
      \s\nACTARM: A: Drug X
      
      ————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                      
                                                               AE                  Most      Caused by
                                                            Duration              Extreme      Study  
      Center/Patients ID            Age/Sex/Race            in Days    Serious   Intensity     Drug   
      ————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN      67      No        MODERATE    No       
                                                               39      No        SEVERE      Yes      
                                                               68      Yes       MODERATE    No       
      CHN-14/1             27/F/ASIAN                         526      No        MODERATE    No       
                                                              414      No        MILD        No       
                                                              657      Yes       MODERATE    No       
                                                              646      No        SEVERE      Yes      
                                                              214      No        MODERATE    Yes      
                                                               20      Yes       MILD        No       
                                                              280      Yes       SEVERE      Yes      
      \s\nACTARM: A: Drug X
      
      ——————————————————————————————————————————————————————————————————————————————————
                                                                                        
                                                                                  Action
                                                            Outcome   Treatment   Taken 
      Center/Patients ID            Age/Sex/Race              (1)      for AE      (2)  
      ——————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   5         No          5     
                                                            3         No          7     
                                                            3         Yes         2     
      CHN-14/1             27/F/ASIAN                       3         Yes         3     
                                                            5         Yes         7     
                                                            2         No          2     
                                                            3         Yes         2     
                                                            6         Yes         6     
                                                            6         Yes         2     
                                                            1         No          6     
      \s\nACTARM: C: Combination
      
      ——————————————————————————————————————————————————————————————————————————————————————————————
                                                                                Date of             
                                                               Adverse        First Study     Study 
                                                             Event MedDRA         Drug        Day of
      Center/Patients ID            Age/Sex/Race            Preferred Term   Administration   Onset 
      ——————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/9             40/M/ASIAN                       dcd D.1.1.4.2    26MAR2019         342  
                                                            dcd B.2.2.3.1    26MAR2019         441  
                                                            dcd D.1.1.1.1    26MAR2019         445  
                                                            dcd B.1.1.1.1    26MAR2019         644  
                                                            dcd B.2.2.3.1    26MAR2019         669  
                                                            dcd C.2.1.2.1    26MAR2019         744  
                                                            dcd C.2.1.2.1    26MAR2019         808  
                                                            dcd B.2.1.2.1    26MAR2019         970  
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   dcd B.2.1.2.1    28APR2019          31  
                                                            dcd D.1.1.1.1    28APR2019          92  
      \s\nACTARM: C: Combination
      
      ————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                      
                                                               AE                  Most      Caused by
                                                            Duration              Extreme      Study  
      Center/Patients ID            Age/Sex/Race            in Days    Serious   Intensity     Drug   
      ————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/9             40/M/ASIAN                         700      No        MODERATE    No       
                                                               53      Yes       MILD        No       
                                                              598      Yes       SEVERE      Yes      
                                                               42      Yes       SEVERE      Yes      
                                                              100      Yes       MILD        No       
                                                              185      No        MODERATE    Yes      
                                                              166      No        MODERATE    Yes      
                                                               15      No        MODERATE    No       
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN     679      No        MODERATE    No       
                                                              254      Yes       SEVERE      Yes      
      \s\nACTARM: C: Combination
      
      ——————————————————————————————————————————————————————————————————————————————————
                                                                                        
                                                                                  Action
                                                            Outcome   Treatment   Taken 
      Center/Patients ID            Age/Sex/Race              (1)      for AE      (2)  
      ——————————————————————————————————————————————————————————————————————————————————
      BRA-11/9             40/M/ASIAN                       2         No          3     
                                                            5         No          2     
                                                            1         No          6     
                                                            1         No          6     
                                                            5         Yes         2     
                                                            4         No          3     
                                                            3         No          6     
                                                            3         No          2     
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   6         No          1     
                                                            1         No          6     
      \s\nACTARM: B: Placebo
      
      ——————————————————————————————————————————————————————————————————————————————————————————————
                                                                                Date of             
                                                               Adverse        First Study     Study 
                                                             Event MedDRA         Drug        Day of
      Center/Patients ID            Age/Sex/Race            Preferred Term   Administration   Onset 
      ——————————————————————————————————————————————————————————————————————————————————————————————
      CAN-1/341            43/F/ASIAN                       dcd A.1.1.1.2    23MAY2019          57  
                                                            dcd B.2.1.2.1    23MAY2019         253  
                                                            dcd B.1.1.1.1    23MAY2019         434  
                                                            dcd A.1.1.1.2    23MAY2019         455  
                                                            dcd A.1.1.1.2    23MAY2019         523  
                                                            dcd A.1.1.1.1    23MAY2019         629  
                                                            dcd C.2.1.2.1    23MAY2019         750  
                                                            dcd A.1.1.1.2    23MAY2019         770  
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   dcd C.1.1.1.3    10APR2019         253  
                                                            dcd B.2.1.2.1    10APR2019         311  
      \s\nACTARM: B: Placebo
      
      ————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                      
                                                               AE                  Most      Caused by
                                                            Duration              Extreme      Study  
      Center/Patients ID            Age/Sex/Race            in Days    Serious   Intensity     Drug   
      ————————————————————————————————————————————————————————————————————————————————————————————————
      CAN-1/341            43/F/ASIAN                         327      Yes       MODERATE    No       
                                                               72      No        MODERATE    No       
                                                              410      Yes       SEVERE      Yes      
                                                              506      Yes       MODERATE    No       
                                                              392      Yes       MODERATE    No       
                                                              265      No        MILD        No       
                                                              128      No        MODERATE    Yes      
                                                               73      Yes       MODERATE    No       
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN     202      No        SEVERE      Yes      
                                                              298      No        MODERATE    No       
      \s\nACTARM: B: Placebo
      
      ——————————————————————————————————————————————————————————————————————————————————
                                                                                        
                                                                                  Action
                                                            Outcome   Treatment   Taken 
      Center/Patients ID            Age/Sex/Race              (1)      for AE      (2)  
      ——————————————————————————————————————————————————————————————————————————————————
      CAN-1/341            43/F/ASIAN                       5         Yes         2     
                                                            5         Yes         2     
                                                            1         No          6     
                                                            6         No          1     
                                                            3         Yes         3     
                                                            2         Yes         2     
                                                            2         No          2     
                                                            5         No          2     
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   3         No          7     
                                                            2         No          2     

# ael02 can handle all missing values

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
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   <Missing>        28APR2019         108  
                                                            <Missing>        28APR2019         437  
                                                            <Missing>        28APR2019         1008 
      BRA-11/9             40/M/ASIAN                       <Missing>        26MAR2019         342  
                                                            <Missing>        26MAR2019         441  
                                                            <Missing>        26MAR2019         445  
                                                            <Missing>        26MAR2019         644  
                                                            <Missing>        26MAR2019         669  
                                                            <Missing>        26MAR2019         744  
                                                            <Missing>        26MAR2019         808  
                                                            <Missing>        26MAR2019         970  
      CAN-1/341            43/F/ASIAN                       <Missing>        23MAY2019          57  
                                                            <Missing>        23MAY2019         253  
                                                            <Missing>        23MAY2019         434  
                                                            <Missing>        23MAY2019         455  
                                                            <Missing>        23MAY2019         523  
                                                            <Missing>        23MAY2019         629  
                                                            <Missing>        23MAY2019         750  
                                                            <Missing>        23MAY2019         770  
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   <Missing>        10APR2019         253  
                                                            <Missing>        10APR2019         311  
                                                            <Missing>        10APR2019         401  
                                                            <Missing>        10APR2019         449  
                                                            <Missing>        10APR2019         686  
                                                            <Missing>        10APR2019         803  
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   <Missing>        28APR2019          31  
                                                            <Missing>        28APR2019          92  
                                                            <Missing>        28APR2019         239  
                                                            <Missing>        28APR2019         366  
                                                            <Missing>        28APR2019         449  
                                                            <Missing>        28APR2019         594  
                                                            <Missing>        28APR2019         671  
                                                            <Missing>        28APR2019         938  
                                                            <Missing>        28APR2019         997  
      CHN-11/220           26/F/ASIAN                       <Missing>        01MAR2019         406  
                                                            <Missing>        01MAR2019         876  
                                                            <Missing>        01MAR2019         911  
                                                            <Missing>        01MAR2019         980  
      CHN-11/263           34/F/ASIAN                       <Missing>        03APR2019         140  
                                                            <Missing>        03APR2019         263  
                                                            <Missing>        03APR2019         524  
                                                            <Missing>        03APR2019         714  
                                                            <Missing>        03APR2019         769  
                                                            <Missing>        03APR2019         877  
                                                            <Missing>        03APR2019         956  
      CHN-11/38            25/F/WHITE                       <Missing>        17JUN2019         524  
      CHN-13/102           37/M/ASIAN                       <Missing>        23MAR2019          34  
                                                            <Missing>        23MAR2019          55  
                                                            <Missing>        23MAR2019          57  
                                                            <Missing>        23MAR2019          65  
      \s\nACTARM: <Missing>
      
      ————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                      
                                                               AE                  Most      Caused by
                                                            Duration              Extreme      Study  
      Center/Patients ID            Age/Sex/Race            in Days    Serious   Intensity     Drug   
      ————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN      67      No        <Missing>   No       
                                                               39      No        <Missing>   Yes      
                                                               68      Yes       <Missing>   No       
      BRA-11/9             40/M/ASIAN                         700      No        <Missing>   No       
                                                               53      Yes       <Missing>   No       
                                                              598      Yes       <Missing>   Yes      
                                                               42      Yes       <Missing>   Yes      
                                                              100      Yes       <Missing>   No       
                                                              185      No        <Missing>   Yes      
                                                              166      No        <Missing>   Yes      
                                                               15      No        <Missing>   No       
      CAN-1/341            43/F/ASIAN                         327      Yes       <Missing>   No       
                                                               72      No        <Missing>   No       
                                                              410      Yes       <Missing>   Yes      
                                                              506      Yes       <Missing>   No       
                                                              392      Yes       <Missing>   No       
                                                              265      No        <Missing>   No       
                                                              128      No        <Missing>   Yes      
                                                               73      Yes       <Missing>   No       
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN     202      No        <Missing>   Yes      
                                                              298      No        <Missing>   No       
                                                              424      No        <Missing>   Yes      
                                                              301      No        <Missing>   Yes      
                                                              309      Yes       <Missing>   No       
                                                              130      Yes       <Missing>   No       
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN     679      No        <Missing>   No       
                                                              254      Yes       <Missing>   Yes      
                                                              213      No        <Missing>   Yes      
                                                              353      No        <Missing>   Yes      
                                                              517      Yes       <Missing>   No       
                                                               51      Yes       <Missing>   No       
                                                               32      Yes       <Missing>   Yes      
                                                               36      Yes       <Missing>   Yes      
                                                               9       No        <Missing>   Yes      
      CHN-11/220           26/F/ASIAN                         422      No        <Missing>   Yes      
                                                              176      Yes       <Missing>   Yes      
                                                              162      Yes       <Missing>   Yes      
                                                              118      No        <Missing>   Yes      
      CHN-11/263           34/F/ASIAN                          43      No        <Missing>   Yes      
                                                              147      No        <Missing>   Yes      
                                                              520      No        <Missing>   Yes      
                                                              163      No        <Missing>   Yes      
                                                              277      No        <Missing>   Yes      
                                                              194      No        <Missing>   Yes      
                                                              106      No        <Missing>   Yes      
      CHN-11/38            25/F/WHITE                         536      Yes       <Missing>   No       
      CHN-13/102           37/M/ASIAN                         555      Yes       <Missing>   Yes      
                                                               73      No        <Missing>   No       
                                                               57      No        <Missing>   No       
                                                              400      Yes       <Missing>   Yes      
      \s\nACTARM: <Missing>
      
      ——————————————————————————————————————————————————————————————————————————————————
                                                                                        
                                                                                  Action
                                                            Outcome   Treatment   Taken 
      Center/Patients ID            Age/Sex/Race              (1)      for AE      (2)  
      ——————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   5         No          5     
                                                            3         No          7     
                                                            3         Yes         2     
      BRA-11/9             40/M/ASIAN                       2         No          3     
                                                            5         No          2     
                                                            1         No          6     
                                                            1         No          6     
                                                            5         Yes         2     
                                                            4         No          3     
                                                            3         No          6     
                                                            3         No          2     
      CAN-1/341            43/F/ASIAN                       5         Yes         2     
                                                            5         Yes         2     
                                                            1         No          6     
                                                            6         No          1     
                                                            3         Yes         3     
                                                            2         Yes         2     
                                                            2         No          2     
                                                            5         No          2     
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   3         No          7     
                                                            2         No          2     
                                                            3         No          1     
                                                            5         No          3     
                                                            6         Yes         2     
                                                            6         No          6     
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   6         No          1     
                                                            1         No          6     
                                                            5         No          2     
                                                            3         No          2     
                                                            5         Yes         3     
                                                            5         Yes         3     
                                                            1         No          6     
                                                            1         No          6     
                                                            2         No          3     
      CHN-11/220           26/F/ASIAN                       3         No          3     
                                                            1         No          6     
                                                            1         No          6     
                                                            4         No          3     
      CHN-11/263           34/F/ASIAN                       5         Yes         1     
                                                            6         Yes         6     
                                                            3         No          2     
                                                            6         No          2     
                                                            2         Yes         6     
                                                            3         Yes         2     
                                                            2         Yes         2     
      CHN-11/38            25/F/WHITE                       2         No          2     
      CHN-13/102           37/M/ASIAN                       1         No          6     
                                                            2         No          2     
                                                            3         No          3     
                                                            1         Yes         6     

# ael02 functions work as expected

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
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   dcd D.1.1.4.2    28APR2019         108  
                                                            dcd C.1.1.1.3    28APR2019         437  
                                                            dcd A.1.1.1.2    28APR2019         1008 
      CHN-14/1             27/F/ASIAN                       dcd D.1.1.4.2    07MAY2019         193  
                                                            dcd A.1.1.1.1    07MAY2019         194  
                                                            dcd A.1.1.1.2    07MAY2019         259  
                                                            dcd C.1.1.1.3    07MAY2019         367  
                                                            dcd C.2.1.2.1    07MAY2019         372  
                                                            dcd B.2.2.3.1    07MAY2019         385  
                                                            dcd B.1.1.1.1    07MAY2019         517  
      \s\nACTARM: A: Drug X
      
      ————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                      
                                                               AE                  Most      Caused by
                                                            Duration              Extreme      Study  
      Center/Patients ID            Age/Sex/Race            in Days    Serious   Intensity     Drug   
      ————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN      67      No        MODERATE    No       
                                                               39      No        SEVERE      Yes      
                                                               68      Yes       MODERATE    No       
      CHN-14/1             27/F/ASIAN                         526      No        MODERATE    No       
                                                              414      No        MILD        No       
                                                              657      Yes       MODERATE    No       
                                                              646      No        SEVERE      Yes      
                                                              214      No        MODERATE    Yes      
                                                               20      Yes       MILD        No       
                                                              280      Yes       SEVERE      Yes      
      \s\nACTARM: A: Drug X
      
      ——————————————————————————————————————————————————————————————————————————————————
                                                                                        
                                                                                  Action
                                                            Outcome   Treatment   Taken 
      Center/Patients ID            Age/Sex/Race              (1)      for AE      (2)  
      ——————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   5         No          5     
                                                            3         No          7     
                                                            3         Yes         2     
      CHN-14/1             27/F/ASIAN                       3         Yes         3     
                                                            5         Yes         7     
                                                            2         No          2     
                                                            3         Yes         2     
                                                            6         Yes         6     
                                                            6         Yes         2     
                                                            1         No          6     
      \s\nACTARM: C: Combination
      
      ——————————————————————————————————————————————————————————————————————————————————————————————
                                                                                Date of             
                                                               Adverse        First Study     Study 
                                                             Event MedDRA         Drug        Day of
      Center/Patients ID            Age/Sex/Race            Preferred Term   Administration   Onset 
      ——————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/9             40/M/ASIAN                       dcd D.1.1.4.2    26MAR2019         342  
                                                            dcd B.2.2.3.1    26MAR2019         441  
                                                            dcd D.1.1.1.1    26MAR2019         445  
                                                            dcd B.1.1.1.1    26MAR2019         644  
                                                            dcd B.2.2.3.1    26MAR2019         669  
                                                            dcd C.2.1.2.1    26MAR2019         744  
                                                            dcd C.2.1.2.1    26MAR2019         808  
                                                            dcd B.2.1.2.1    26MAR2019         970  
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   dcd B.2.1.2.1    28APR2019          31  
                                                            dcd D.1.1.1.1    28APR2019          92  
      \s\nACTARM: C: Combination
      
      ————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                      
                                                               AE                  Most      Caused by
                                                            Duration              Extreme      Study  
      Center/Patients ID            Age/Sex/Race            in Days    Serious   Intensity     Drug   
      ————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/9             40/M/ASIAN                         700      No        MODERATE    No       
                                                               53      Yes       MILD        No       
                                                              598      Yes       SEVERE      Yes      
                                                               42      Yes       SEVERE      Yes      
                                                              100      Yes       MILD        No       
                                                              185      No        MODERATE    Yes      
                                                              166      No        MODERATE    Yes      
                                                               15      No        MODERATE    No       
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN     679      No        MODERATE    No       
                                                              254      Yes       SEVERE      Yes      
      \s\nACTARM: C: Combination
      
      ——————————————————————————————————————————————————————————————————————————————————
                                                                                        
                                                                                  Action
                                                            Outcome   Treatment   Taken 
      Center/Patients ID            Age/Sex/Race              (1)      for AE      (2)  
      ——————————————————————————————————————————————————————————————————————————————————
      BRA-11/9             40/M/ASIAN                       2         No          3     
                                                            5         No          2     
                                                            1         No          6     
                                                            1         No          6     
                                                            5         Yes         2     
                                                            4         No          3     
                                                            3         No          6     
                                                            3         No          2     
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   6         No          1     
                                                            1         No          6     
      \s\nACTARM: B: Placebo
      
      ——————————————————————————————————————————————————————————————————————————————————————————————
                                                                                Date of             
                                                               Adverse        First Study     Study 
                                                             Event MedDRA         Drug        Day of
      Center/Patients ID            Age/Sex/Race            Preferred Term   Administration   Onset 
      ——————————————————————————————————————————————————————————————————————————————————————————————
      CAN-1/341            43/F/ASIAN                       dcd A.1.1.1.2    23MAY2019          57  
                                                            dcd B.2.1.2.1    23MAY2019         253  
                                                            dcd B.1.1.1.1    23MAY2019         434  
                                                            dcd A.1.1.1.2    23MAY2019         455  
                                                            dcd A.1.1.1.2    23MAY2019         523  
                                                            dcd A.1.1.1.1    23MAY2019         629  
                                                            dcd C.2.1.2.1    23MAY2019         750  
                                                            dcd A.1.1.1.2    23MAY2019         770  
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   dcd C.1.1.1.3    10APR2019         253  
                                                            dcd B.2.1.2.1    10APR2019         311  
      \s\nACTARM: B: Placebo
      
      ————————————————————————————————————————————————————————————————————————————————————————————————
                                                                                                      
                                                               AE                  Most      Caused by
                                                            Duration              Extreme      Study  
      Center/Patients ID            Age/Sex/Race            in Days    Serious   Intensity     Drug   
      ————————————————————————————————————————————————————————————————————————————————————————————————
      CAN-1/341            43/F/ASIAN                         327      Yes       MODERATE    No       
                                                               72      No        MODERATE    No       
                                                              410      Yes       SEVERE      Yes      
                                                              506      Yes       MODERATE    No       
                                                              392      Yes       MODERATE    No       
                                                              265      No        MILD        No       
                                                              128      No        MODERATE    Yes      
                                                               73      Yes       MODERATE    No       
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN     202      No        SEVERE      Yes      
                                                              298      No        MODERATE    No       
      \s\nACTARM: B: Placebo
      
      ——————————————————————————————————————————————————————————————————————————————————
                                                                                        
                                                                                  Action
                                                            Outcome   Treatment   Taken 
      Center/Patients ID            Age/Sex/Race              (1)      for AE      (2)  
      ——————————————————————————————————————————————————————————————————————————————————
      CAN-1/341            43/F/ASIAN                       5         Yes         2     
                                                            5         Yes         2     
                                                            1         No          6     
                                                            6         No          1     
                                                            3         Yes         3     
                                                            2         Yes         2     
                                                            2         No          2     
                                                            5         No          2     
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   3         No          7     
                                                            2         No          2     

