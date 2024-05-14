# ael02 works with adae dataset

    Code
      cat(export_as_txt(res[1:50, ], lpp = 100))
    Output
                                                                                                 Date of    
                                                                                Adverse        First Study  
                                                                              Event MedDRA         Drug     
      Center/Patients ID            Age/Sex/Race              Treatment      Preferred Term   Administration
      ——————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   A: Drug X        dcd D.1.1.4.2    28APR2019     
                                                                             dcd C.1.1.1.3    28APR2019     
                                                                             dcd A.1.1.1.2    28APR2019     
      BRA-11/9             40/M/ASIAN                       C: Combination   dcd D.1.1.4.2    26MAR2019     
                                                                             dcd B.2.2.3.1    26MAR2019     
                                                                             dcd D.1.1.1.1    26MAR2019     
                                                                             dcd B.1.1.1.1    26MAR2019     
                                                                             dcd B.2.2.3.1    26MAR2019     
                                                                             dcd C.2.1.2.1    26MAR2019     
                                                                             dcd C.2.1.2.1    26MAR2019     
                                                                             dcd B.2.1.2.1    26MAR2019     
      CAN-1/341            43/F/ASIAN                       B: Placebo       dcd A.1.1.1.2    23MAY2019     
                                                                             dcd B.2.1.2.1    23MAY2019     
                                                                             dcd B.1.1.1.1    23MAY2019     
                                                                             dcd A.1.1.1.2    23MAY2019     
                                                                             dcd A.1.1.1.2    23MAY2019     
                                                                             dcd A.1.1.1.1    23MAY2019     
                                                                             dcd C.2.1.2.1    23MAY2019     
                                                                             dcd A.1.1.1.2    23MAY2019     
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   B: Placebo       dcd C.1.1.1.3    10APR2019     
                                                                             dcd B.2.1.2.1    10APR2019     
                                                                             dcd C.1.1.1.3    10APR2019     
                                                                             dcd C.1.1.1.3    10APR2019     
                                                                             dcd A.1.1.1.2    10APR2019     
                                                                             dcd B.2.2.3.1    10APR2019     
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   C: Combination   dcd B.2.1.2.1    28APR2019     
                                                                             dcd D.1.1.1.1    28APR2019     
                                                                             dcd C.1.1.1.3    28APR2019     
                                                                             dcd D.2.1.5.3    28APR2019     
                                                                             dcd A.1.1.1.2    28APR2019     
                                                                             dcd A.1.1.1.2    28APR2019     
                                                                             dcd D.1.1.1.1    28APR2019     
                                                                             dcd D.1.1.1.1    28APR2019     
                                                                             dcd D.2.1.5.3    28APR2019     
      CHN-11/220           26/F/ASIAN                       B: Placebo       dcd C.2.1.2.1    01MAR2019     
                                                                             dcd D.1.1.1.1    01MAR2019     
                                                                             dcd B.1.1.1.1    01MAR2019     
                                                                             dcd D.2.1.5.3    01MAR2019     
      CHN-11/263           34/F/ASIAN                       C: Combination   dcd C.1.1.1.3    03APR2019     
                                                                             dcd C.2.1.2.1    03APR2019     
                                                                             dcd D.2.1.5.3    03APR2019     
                                                                             dcd D.2.1.5.3    03APR2019     
                                                                             dcd C.1.1.1.3    03APR2019     
                                                                             dcd C.1.1.1.3    03APR2019     
                                                                             dcd C.1.1.1.3    03APR2019     
      CHN-11/38            25/F/WHITE                       B: Placebo       dcd A.1.1.1.2    17JUN2019     
      CHN-13/102           37/M/ASIAN                       B: Placebo       dcd B.1.1.1.1    23MAR2019     
                                                                             dcd B.2.1.2.1    23MAR2019     
                                                                             dcd B.2.1.2.1    23MAR2019     
                                                                             dcd D.1.1.1.1    23MAR2019     
      \s\n                                                                                                  
                                                                             Study       AE             
                                                                             Day of   Duration          
      Center/Patients ID            Age/Sex/Race              Treatment      Onset    in Days    Serious
      ——————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   A: Drug X         108        67      No     
                                                                              437        39      No     
                                                                              1008       68      Yes    
      BRA-11/9             40/M/ASIAN                       C: Combination    342       700      No     
                                                                              441        53      Yes    
                                                                              445       598      Yes    
                                                                              644        42      Yes    
                                                                              669       100      Yes    
                                                                              744       185      No     
                                                                              808       166      No     
                                                                              970        15      No     
      CAN-1/341            43/F/ASIAN                       B: Placebo         57       327      Yes    
                                                                              253        72      No     
                                                                              434       410      Yes    
                                                                              455       506      Yes    
                                                                              523       392      Yes    
                                                                              629       265      No     
                                                                              750       128      No     
                                                                              770        73      Yes    
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   B: Placebo        253       202      No     
                                                                              311       298      No     
                                                                              401       424      No     
                                                                              449       301      No     
                                                                              686       309      Yes    
                                                                              803       130      Yes    
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   C: Combination     31       679      No     
                                                                               92       254      Yes    
                                                                              239       213      No     
                                                                              366       353      No     
                                                                              449       517      Yes    
                                                                              594        51      Yes    
                                                                              671        32      Yes    
                                                                              938        36      Yes    
                                                                              997        9       No     
      CHN-11/220           26/F/ASIAN                       B: Placebo        406       422      No     
                                                                              876       176      Yes    
                                                                              911       162      Yes    
                                                                              980       118      No     
      CHN-11/263           34/F/ASIAN                       C: Combination    140        43      No     
                                                                              263       147      No     
                                                                              524       520      No     
                                                                              714       163      No     
                                                                              769       277      No     
                                                                              877       194      No     
                                                                              956       106      No     
      CHN-11/38            25/F/WHITE                       B: Placebo        524       536      Yes    
      CHN-13/102           37/M/ASIAN                       B: Placebo         34       555      Yes    
                                                                               55        73      No     
                                                                               57        57      No     
                                                                               65       400      Yes    
      \s\n                                                                                                      
                                                                               Most      Caused by          
                                                                              Extreme      Study     Outcome
      Center/Patients ID            Age/Sex/Race              Treatment      Intensity     Drug        (1)  
      ——————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   A: Drug X        MODERATE    No          5      
                                                                             SEVERE      Yes         3      
                                                                             MODERATE    No          3      
      BRA-11/9             40/M/ASIAN                       C: Combination   MODERATE    No          2      
                                                                             MILD        No          5      
                                                                             SEVERE      Yes         1      
                                                                             SEVERE      Yes         1      
                                                                             MILD        No          5      
                                                                             MODERATE    Yes         4      
                                                                             MODERATE    Yes         3      
                                                                             MODERATE    No          3      
      CAN-1/341            43/F/ASIAN                       B: Placebo       MODERATE    No          5      
                                                                             MODERATE    No          5      
                                                                             SEVERE      Yes         1      
                                                                             MODERATE    No          6      
                                                                             MODERATE    No          3      
                                                                             MILD        No          2      
                                                                             MODERATE    Yes         2      
                                                                             MODERATE    No          5      
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   B: Placebo       SEVERE      Yes         3      
                                                                             MODERATE    No          2      
                                                                             SEVERE      Yes         3      
                                                                             SEVERE      Yes         5      
                                                                             MODERATE    No          6      
                                                                             MILD        No          6      
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   C: Combination   MODERATE    No          6      
                                                                             SEVERE      Yes         1      
                                                                             SEVERE      Yes         5      
                                                                             MILD        Yes         3      
                                                                             MODERATE    No          5      
                                                                             MODERATE    No          5      
                                                                             SEVERE      Yes         1      
                                                                             SEVERE      Yes         1      
                                                                             MILD        Yes         2      
      CHN-11/220           26/F/ASIAN                       B: Placebo       MODERATE    Yes         3      
                                                                             SEVERE      Yes         1      
                                                                             SEVERE      Yes         1      
                                                                             MILD        Yes         4      
      CHN-11/263           34/F/ASIAN                       C: Combination   SEVERE      Yes         5      
                                                                             MODERATE    Yes         6      
                                                                             MILD        Yes         3      
                                                                             MILD        Yes         6      
                                                                             SEVERE      Yes         2      
                                                                             SEVERE      Yes         3      
                                                                             SEVERE      Yes         2      
      CHN-11/38            25/F/WHITE                       B: Placebo       MODERATE    No          2      
      CHN-13/102           37/M/ASIAN                       B: Placebo       SEVERE      Yes         1      
                                                                             MODERATE    No          2      
                                                                             MODERATE    No          3      
                                                                             SEVERE      Yes         1      
      \s\n                                                                                         
                                                                                         Action
                                                                             Treatment   Taken 
      Center/Patients ID            Age/Sex/Race              Treatment       for AE      (2)  
      —————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   A: Drug X        No          5     
                                                                             No          7     
                                                                             Yes         2     
      BRA-11/9             40/M/ASIAN                       C: Combination   No          3     
                                                                             No          2     
                                                                             No          6     
                                                                             No          6     
                                                                             Yes         2     
                                                                             No          3     
                                                                             No          6     
                                                                             No          2     
      CAN-1/341            43/F/ASIAN                       B: Placebo       Yes         2     
                                                                             Yes         2     
                                                                             No          6     
                                                                             No          1     
                                                                             Yes         3     
                                                                             Yes         2     
                                                                             No          2     
                                                                             No          2     
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   B: Placebo       No          7     
                                                                             No          2     
                                                                             No          1     
                                                                             No          3     
                                                                             Yes         2     
                                                                             No          6     
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   C: Combination   No          1     
                                                                             No          6     
                                                                             No          2     
                                                                             No          2     
                                                                             Yes         3     
                                                                             Yes         3     
                                                                             No          6     
                                                                             No          6     
                                                                             No          3     
      CHN-11/220           26/F/ASIAN                       B: Placebo       No          3     
                                                                             No          6     
                                                                             No          6     
                                                                             No          3     
      CHN-11/263           34/F/ASIAN                       C: Combination   Yes         1     
                                                                             Yes         6     
                                                                             No          2     
                                                                             No          2     
                                                                             Yes         6     
                                                                             Yes         2     
                                                                             Yes         2     
      CHN-11/38            25/F/WHITE                       B: Placebo       No          2     
      CHN-13/102           37/M/ASIAN                       B: Placebo       No          6     
                                                                             No          2     
                                                                             No          3     
                                                                             Yes         6     

# ael02 can handle all missing values

    Code
      cat(export_as_txt(res[1:50, ], lpp = 100))
    Output
                                                                                            Date of    
                                                                           Adverse        First Study  
                                                                         Event MedDRA         Drug     
      Center/Patients ID            Age/Sex/Race            Treatment   Preferred Term   Administration
      —————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   <Missing>   <Missing>        28APR2019     
                                                                        <Missing>        28APR2019     
                                                                        <Missing>        28APR2019     
      BRA-11/9             40/M/ASIAN                       <Missing>   <Missing>        26MAR2019     
                                                                        <Missing>        26MAR2019     
                                                                        <Missing>        26MAR2019     
                                                                        <Missing>        26MAR2019     
                                                                        <Missing>        26MAR2019     
                                                                        <Missing>        26MAR2019     
                                                                        <Missing>        26MAR2019     
                                                                        <Missing>        26MAR2019     
      CAN-1/341            43/F/ASIAN                       <Missing>   <Missing>        23MAY2019     
                                                                        <Missing>        23MAY2019     
                                                                        <Missing>        23MAY2019     
                                                                        <Missing>        23MAY2019     
                                                                        <Missing>        23MAY2019     
                                                                        <Missing>        23MAY2019     
                                                                        <Missing>        23MAY2019     
                                                                        <Missing>        23MAY2019     
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   <Missing>   <Missing>        10APR2019     
                                                                        <Missing>        10APR2019     
                                                                        <Missing>        10APR2019     
                                                                        <Missing>        10APR2019     
                                                                        <Missing>        10APR2019     
                                                                        <Missing>        10APR2019     
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   <Missing>   <Missing>        28APR2019     
                                                                        <Missing>        28APR2019     
                                                                        <Missing>        28APR2019     
                                                                        <Missing>        28APR2019     
                                                                        <Missing>        28APR2019     
                                                                        <Missing>        28APR2019     
                                                                        <Missing>        28APR2019     
                                                                        <Missing>        28APR2019     
                                                                        <Missing>        28APR2019     
      CHN-11/220           26/F/ASIAN                       <Missing>   <Missing>        01MAR2019     
                                                                        <Missing>        01MAR2019     
                                                                        <Missing>        01MAR2019     
                                                                        <Missing>        01MAR2019     
      CHN-11/263           34/F/ASIAN                       <Missing>   <Missing>        03APR2019     
                                                                        <Missing>        03APR2019     
                                                                        <Missing>        03APR2019     
                                                                        <Missing>        03APR2019     
                                                                        <Missing>        03APR2019     
                                                                        <Missing>        03APR2019     
                                                                        <Missing>        03APR2019     
      CHN-11/38            25/F/WHITE                       <Missing>   <Missing>        17JUN2019     
      CHN-13/102           37/M/ASIAN                       <Missing>   <Missing>        23MAR2019     
                                                                        <Missing>        23MAR2019     
                                                                        <Missing>        23MAR2019     
                                                                        <Missing>        23MAR2019     
      \s\n                                                                                             
                                                                        Study       AE             
                                                                        Day of   Duration          
      Center/Patients ID            Age/Sex/Race            Treatment   Onset    in Days    Serious
      —————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   <Missing>    108        67      No     
                                                                         437        39      No     
                                                                         1008       68      Yes    
      BRA-11/9             40/M/ASIAN                       <Missing>    342       700      No     
                                                                         441        53      Yes    
                                                                         445       598      Yes    
                                                                         644        42      Yes    
                                                                         669       100      Yes    
                                                                         744       185      No     
                                                                         808       166      No     
                                                                         970        15      No     
      CAN-1/341            43/F/ASIAN                       <Missing>     57       327      Yes    
                                                                         253        72      No     
                                                                         434       410      Yes    
                                                                         455       506      Yes    
                                                                         523       392      Yes    
                                                                         629       265      No     
                                                                         750       128      No     
                                                                         770        73      Yes    
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   <Missing>    253       202      No     
                                                                         311       298      No     
                                                                         401       424      No     
                                                                         449       301      No     
                                                                         686       309      Yes    
                                                                         803       130      Yes    
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   <Missing>     31       679      No     
                                                                          92       254      Yes    
                                                                         239       213      No     
                                                                         366       353      No     
                                                                         449       517      Yes    
                                                                         594        51      Yes    
                                                                         671        32      Yes    
                                                                         938        36      Yes    
                                                                         997        9       No     
      CHN-11/220           26/F/ASIAN                       <Missing>    406       422      No     
                                                                         876       176      Yes    
                                                                         911       162      Yes    
                                                                         980       118      No     
      CHN-11/263           34/F/ASIAN                       <Missing>    140        43      No     
                                                                         263       147      No     
                                                                         524       520      No     
                                                                         714       163      No     
                                                                         769       277      No     
                                                                         877       194      No     
                                                                         956       106      No     
      CHN-11/38            25/F/WHITE                       <Missing>    524       536      Yes    
      CHN-13/102           37/M/ASIAN                       <Missing>     34       555      Yes    
                                                                          55        73      No     
                                                                          57        57      No     
                                                                          65       400      Yes    
      \s\n                                                                                                 
                                                                          Most      Caused by          
                                                                         Extreme      Study     Outcome
      Center/Patients ID            Age/Sex/Race            Treatment   Intensity     Drug        (1)  
      —————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   <Missing>   <Missing>   No          5      
                                                                        <Missing>   Yes         3      
                                                                        <Missing>   No          3      
      BRA-11/9             40/M/ASIAN                       <Missing>   <Missing>   No          2      
                                                                        <Missing>   No          5      
                                                                        <Missing>   Yes         1      
                                                                        <Missing>   Yes         1      
                                                                        <Missing>   No          5      
                                                                        <Missing>   Yes         4      
                                                                        <Missing>   Yes         3      
                                                                        <Missing>   No          3      
      CAN-1/341            43/F/ASIAN                       <Missing>   <Missing>   No          5      
                                                                        <Missing>   No          5      
                                                                        <Missing>   Yes         1      
                                                                        <Missing>   No          6      
                                                                        <Missing>   No          3      
                                                                        <Missing>   No          2      
                                                                        <Missing>   Yes         2      
                                                                        <Missing>   No          5      
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   <Missing>   <Missing>   Yes         3      
                                                                        <Missing>   No          2      
                                                                        <Missing>   Yes         3      
                                                                        <Missing>   Yes         5      
                                                                        <Missing>   No          6      
                                                                        <Missing>   No          6      
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   <Missing>   <Missing>   No          6      
                                                                        <Missing>   Yes         1      
                                                                        <Missing>   Yes         5      
                                                                        <Missing>   Yes         3      
                                                                        <Missing>   No          5      
                                                                        <Missing>   No          5      
                                                                        <Missing>   Yes         1      
                                                                        <Missing>   Yes         1      
                                                                        <Missing>   Yes         2      
      CHN-11/220           26/F/ASIAN                       <Missing>   <Missing>   Yes         3      
                                                                        <Missing>   Yes         1      
                                                                        <Missing>   Yes         1      
                                                                        <Missing>   Yes         4      
      CHN-11/263           34/F/ASIAN                       <Missing>   <Missing>   Yes         5      
                                                                        <Missing>   Yes         6      
                                                                        <Missing>   Yes         3      
                                                                        <Missing>   Yes         6      
                                                                        <Missing>   Yes         2      
                                                                        <Missing>   Yes         3      
                                                                        <Missing>   Yes         2      
      CHN-11/38            25/F/WHITE                       <Missing>   <Missing>   No          2      
      CHN-13/102           37/M/ASIAN                       <Missing>   <Missing>   Yes         1      
                                                                        <Missing>   No          2      
                                                                        <Missing>   No          3      
                                                                        <Missing>   Yes         1      
      \s\n                                                                                    
                                                                                    Action
                                                                        Treatment   Taken 
      Center/Patients ID            Age/Sex/Race            Treatment    for AE      (2)  
      ————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   <Missing>   No          5     
                                                                        No          7     
                                                                        Yes         2     
      BRA-11/9             40/M/ASIAN                       <Missing>   No          3     
                                                                        No          2     
                                                                        No          6     
                                                                        No          6     
                                                                        Yes         2     
                                                                        No          3     
                                                                        No          6     
                                                                        No          2     
      CAN-1/341            43/F/ASIAN                       <Missing>   Yes         2     
                                                                        Yes         2     
                                                                        No          6     
                                                                        No          1     
                                                                        Yes         3     
                                                                        Yes         2     
                                                                        No          2     
                                                                        No          2     
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   <Missing>   No          7     
                                                                        No          2     
                                                                        No          1     
                                                                        No          3     
                                                                        Yes         2     
                                                                        No          6     
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   <Missing>   No          1     
                                                                        No          6     
                                                                        No          2     
                                                                        No          2     
                                                                        Yes         3     
                                                                        Yes         3     
                                                                        No          6     
                                                                        No          6     
                                                                        No          3     
      CHN-11/220           26/F/ASIAN                       <Missing>   No          3     
                                                                        No          6     
                                                                        No          6     
                                                                        No          3     
      CHN-11/263           34/F/ASIAN                       <Missing>   Yes         1     
                                                                        Yes         6     
                                                                        No          2     
                                                                        No          2     
                                                                        Yes         6     
                                                                        Yes         2     
                                                                        Yes         2     
      CHN-11/38            25/F/WHITE                       <Missing>   No          2     
      CHN-13/102           37/M/ASIAN                       <Missing>   No          6     
                                                                        No          2     
                                                                        No          3     
                                                                        Yes         6     

# ael02 functions work as expected

    Code
      cat(export_as_txt(res[1:50, ], lpp = 100))
    Output
                                                                                                 Date of    
                                                                                Adverse        First Study  
                                                                              Event MedDRA         Drug     
      Center/Patients ID            Age/Sex/Race              Treatment      Preferred Term   Administration
      ——————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   A: Drug X        dcd D.1.1.4.2    28APR2019     
                                                                             dcd C.1.1.1.3    28APR2019     
                                                                             dcd A.1.1.1.2    28APR2019     
      BRA-11/9             40/M/ASIAN                       C: Combination   dcd D.1.1.4.2    26MAR2019     
                                                                             dcd B.2.2.3.1    26MAR2019     
                                                                             dcd D.1.1.1.1    26MAR2019     
                                                                             dcd B.1.1.1.1    26MAR2019     
                                                                             dcd B.2.2.3.1    26MAR2019     
                                                                             dcd C.2.1.2.1    26MAR2019     
                                                                             dcd C.2.1.2.1    26MAR2019     
                                                                             dcd B.2.1.2.1    26MAR2019     
      CAN-1/341            43/F/ASIAN                       B: Placebo       dcd A.1.1.1.2    23MAY2019     
                                                                             dcd B.2.1.2.1    23MAY2019     
                                                                             dcd B.1.1.1.1    23MAY2019     
                                                                             dcd A.1.1.1.2    23MAY2019     
                                                                             dcd A.1.1.1.2    23MAY2019     
                                                                             dcd A.1.1.1.1    23MAY2019     
                                                                             dcd C.2.1.2.1    23MAY2019     
                                                                             dcd A.1.1.1.2    23MAY2019     
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   B: Placebo       dcd C.1.1.1.3    10APR2019     
                                                                             dcd B.2.1.2.1    10APR2019     
                                                                             dcd C.1.1.1.3    10APR2019     
                                                                             dcd C.1.1.1.3    10APR2019     
                                                                             dcd A.1.1.1.2    10APR2019     
                                                                             dcd B.2.2.3.1    10APR2019     
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   C: Combination   dcd B.2.1.2.1    28APR2019     
                                                                             dcd D.1.1.1.1    28APR2019     
                                                                             dcd C.1.1.1.3    28APR2019     
                                                                             dcd D.2.1.5.3    28APR2019     
                                                                             dcd A.1.1.1.2    28APR2019     
                                                                             dcd A.1.1.1.2    28APR2019     
                                                                             dcd D.1.1.1.1    28APR2019     
                                                                             dcd D.1.1.1.1    28APR2019     
                                                                             dcd D.2.1.5.3    28APR2019     
      CHN-11/220           26/F/ASIAN                       B: Placebo       dcd C.2.1.2.1    01MAR2019     
                                                                             dcd D.1.1.1.1    01MAR2019     
                                                                             dcd B.1.1.1.1    01MAR2019     
                                                                             dcd D.2.1.5.3    01MAR2019     
      CHN-11/263           34/F/ASIAN                       C: Combination   dcd C.1.1.1.3    03APR2019     
                                                                             dcd C.2.1.2.1    03APR2019     
                                                                             dcd D.2.1.5.3    03APR2019     
                                                                             dcd D.2.1.5.3    03APR2019     
                                                                             dcd C.1.1.1.3    03APR2019     
                                                                             dcd C.1.1.1.3    03APR2019     
                                                                             dcd C.1.1.1.3    03APR2019     
      CHN-11/38            25/F/WHITE                       B: Placebo       dcd A.1.1.1.2    17JUN2019     
      CHN-13/102           37/M/ASIAN                       B: Placebo       dcd B.1.1.1.1    23MAR2019     
                                                                             dcd B.2.1.2.1    23MAR2019     
                                                                             dcd B.2.1.2.1    23MAR2019     
                                                                             dcd D.1.1.1.1    23MAR2019     
      \s\n                                                                                                  
                                                                             Study       AE             
                                                                             Day of   Duration          
      Center/Patients ID            Age/Sex/Race              Treatment      Onset    in Days    Serious
      ——————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   A: Drug X         108        67      No     
                                                                              437        39      No     
                                                                              1008       68      Yes    
      BRA-11/9             40/M/ASIAN                       C: Combination    342       700      No     
                                                                              441        53      Yes    
                                                                              445       598      Yes    
                                                                              644        42      Yes    
                                                                              669       100      Yes    
                                                                              744       185      No     
                                                                              808       166      No     
                                                                              970        15      No     
      CAN-1/341            43/F/ASIAN                       B: Placebo         57       327      Yes    
                                                                              253        72      No     
                                                                              434       410      Yes    
                                                                              455       506      Yes    
                                                                              523       392      Yes    
                                                                              629       265      No     
                                                                              750       128      No     
                                                                              770        73      Yes    
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   B: Placebo        253       202      No     
                                                                              311       298      No     
                                                                              401       424      No     
                                                                              449       301      No     
                                                                              686       309      Yes    
                                                                              803       130      Yes    
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   C: Combination     31       679      No     
                                                                               92       254      Yes    
                                                                              239       213      No     
                                                                              366       353      No     
                                                                              449       517      Yes    
                                                                              594        51      Yes    
                                                                              671        32      Yes    
                                                                              938        36      Yes    
                                                                              997        9       No     
      CHN-11/220           26/F/ASIAN                       B: Placebo        406       422      No     
                                                                              876       176      Yes    
                                                                              911       162      Yes    
                                                                              980       118      No     
      CHN-11/263           34/F/ASIAN                       C: Combination    140        43      No     
                                                                              263       147      No     
                                                                              524       520      No     
                                                                              714       163      No     
                                                                              769       277      No     
                                                                              877       194      No     
                                                                              956       106      No     
      CHN-11/38            25/F/WHITE                       B: Placebo        524       536      Yes    
      CHN-13/102           37/M/ASIAN                       B: Placebo         34       555      Yes    
                                                                               55        73      No     
                                                                               57        57      No     
                                                                               65       400      Yes    
      \s\n                                                                                                      
                                                                               Most      Caused by          
                                                                              Extreme      Study     Outcome
      Center/Patients ID            Age/Sex/Race              Treatment      Intensity     Drug        (1)  
      ——————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   A: Drug X        MODERATE    No          5      
                                                                             SEVERE      Yes         3      
                                                                             MODERATE    No          3      
      BRA-11/9             40/M/ASIAN                       C: Combination   MODERATE    No          2      
                                                                             MILD        No          5      
                                                                             SEVERE      Yes         1      
                                                                             SEVERE      Yes         1      
                                                                             MILD        No          5      
                                                                             MODERATE    Yes         4      
                                                                             MODERATE    Yes         3      
                                                                             MODERATE    No          3      
      CAN-1/341            43/F/ASIAN                       B: Placebo       MODERATE    No          5      
                                                                             MODERATE    No          5      
                                                                             SEVERE      Yes         1      
                                                                             MODERATE    No          6      
                                                                             MODERATE    No          3      
                                                                             MILD        No          2      
                                                                             MODERATE    Yes         2      
                                                                             MODERATE    No          5      
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   B: Placebo       SEVERE      Yes         3      
                                                                             MODERATE    No          2      
                                                                             SEVERE      Yes         3      
                                                                             SEVERE      Yes         5      
                                                                             MODERATE    No          6      
                                                                             MILD        No          6      
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   C: Combination   MODERATE    No          6      
                                                                             SEVERE      Yes         1      
                                                                             SEVERE      Yes         5      
                                                                             MILD        Yes         3      
                                                                             MODERATE    No          5      
                                                                             MODERATE    No          5      
                                                                             SEVERE      Yes         1      
                                                                             SEVERE      Yes         1      
                                                                             MILD        Yes         2      
      CHN-11/220           26/F/ASIAN                       B: Placebo       MODERATE    Yes         3      
                                                                             SEVERE      Yes         1      
                                                                             SEVERE      Yes         1      
                                                                             MILD        Yes         4      
      CHN-11/263           34/F/ASIAN                       C: Combination   SEVERE      Yes         5      
                                                                             MODERATE    Yes         6      
                                                                             MILD        Yes         3      
                                                                             MILD        Yes         6      
                                                                             SEVERE      Yes         2      
                                                                             SEVERE      Yes         3      
                                                                             SEVERE      Yes         2      
      CHN-11/38            25/F/WHITE                       B: Placebo       MODERATE    No          2      
      CHN-13/102           37/M/ASIAN                       B: Placebo       SEVERE      Yes         1      
                                                                             MODERATE    No          2      
                                                                             MODERATE    No          3      
                                                                             SEVERE      Yes         1      
      \s\n                                                                                         
                                                                                         Action
                                                                             Treatment   Taken 
      Center/Patients ID            Age/Sex/Race              Treatment       for AE      (2)  
      —————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN   A: Drug X        No          5     
                                                                             No          7     
                                                                             Yes         2     
      BRA-11/9             40/M/ASIAN                       C: Combination   No          3     
                                                                             No          2     
                                                                             No          6     
                                                                             No          6     
                                                                             Yes         2     
                                                                             No          3     
                                                                             No          6     
                                                                             No          2     
      CAN-1/341            43/F/ASIAN                       B: Placebo       Yes         2     
                                                                             Yes         2     
                                                                             No          6     
                                                                             No          1     
                                                                             Yes         3     
                                                                             Yes         2     
                                                                             No          2     
                                                                             No          2     
      CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN   B: Placebo       No          7     
                                                                             No          2     
                                                                             No          1     
                                                                             No          3     
                                                                             Yes         2     
                                                                             No          6     
      CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN   C: Combination   No          1     
                                                                             No          6     
                                                                             No          2     
                                                                             No          2     
                                                                             Yes         3     
                                                                             Yes         3     
                                                                             No          6     
                                                                             No          6     
                                                                             No          3     
      CHN-11/220           26/F/ASIAN                       B: Placebo       No          3     
                                                                             No          6     
                                                                             No          6     
                                                                             No          3     
      CHN-11/263           34/F/ASIAN                       C: Combination   Yes         1     
                                                                             Yes         6     
                                                                             No          2     
                                                                             No          2     
                                                                             Yes         6     
                                                                             Yes         2     
                                                                             Yes         2     
      CHN-11/38            25/F/WHITE                       B: Placebo       No          2     
      CHN-13/102           37/M/ASIAN                       B: Placebo       No          6     
                                                                             No          2     
                                                                             No          3     
                                                                             Yes         6     

