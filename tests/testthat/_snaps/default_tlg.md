# ael01_nollt function with default argument value return expected result with test data

    Code
      cat(formatters::export_as_txt(res, lpp = 100))
    Output
      MedDRA System Organ Class   MedDRA Preferred Term   Reported Term for the Adverse Event
      ———————————————————————————————————————————————————————————————————————————————————————
      cl A.1                      dcd A.1.1.1.1                      trm A.1.1.1.1           
                                  dcd A.1.1.1.2                      trm A.1.1.1.2           
      cl B.1                      dcd B.1.1.1.1                      trm B.1.1.1.1           
      cl B.2                      dcd B.2.1.2.1                      trm B.2.1.2.1           
                                  dcd B.2.2.3.1                      trm B.2.2.3.1           
      cl C.1                      dcd C.1.1.1.3                      trm C.1.1.1.3           
      cl C.2                      dcd C.2.1.2.1                      trm C.2.1.2.1           
      cl D.1                      dcd D.1.1.1.1                      trm D.1.1.1.1           
                                  dcd D.1.1.4.2                      trm D.1.1.4.2           
      cl D.2                      dcd D.2.1.5.3                      trm D.2.1.5.3           

# aet01 function with default argument value return expected result with test data

    Code
      cat(formatters::export_as_txt(res, lpp = 100))
    Output
                                                                      A: Drug X    B: Placebo    C: Combination
                                                                       (N=134)       (N=134)        (N=132)    
        ———————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                122 (91.0%)   123 (91.8%)    120 (90.9%)  
        Total number of AEs                                              609           622            703      
        Total number of deaths                                       25 (18.7%)    23 (17.2%)      22 (16.7%)  
        Total number of patients withdrawn from study due to an AE    3 (2.2%)      6 (4.5%)        5 (3.8%)   
        Total number of patients with at least one                                                             
          AE with fatal outcome                                      76 (56.7%)    70 (52.2%)      75 (56.8%)  
          Serious AE                                                 104 (77.6%)   101 (75.4%)     99 (75.0%)  
          Serious AE leading to withdrawal from treatment             9 (6.7%)      6 (4.5%)       11 (8.3%)   
          Serious AE leading to dose modification/interruption       22 (16.4%)    26 (19.4%)      29 (22.0%)  
          Related Serious AE                                         76 (56.7%)    70 (52.2%)      75 (56.8%)  
          AE leading to withdrawal from treatment                    27 (20.1%)    26 (19.4%)      30 (22.7%)  
          AE leading to dose modification/interruption               66 (49.3%)    76 (56.7%)      74 (56.1%)  
          Related AE                                                 105 (78.4%)   108 (80.6%)    109 (82.6%)  
          Related AE leading to withdrawal from treatment             6 (4.5%)      12 (9.0%)       8 (6.1%)   
          Related AE leading to dose modification/interruption       29 (21.6%)    38 (28.4%)      38 (28.8%)  
          Severe AE (at greatest intensity)                          91 (67.9%)    90 (67.2%)      93 (70.5%)  

# aet01_aesi function with default argument value return expected result with test data

    Code
      cat(formatters::export_as_txt(res, lpp = 100))
    Output
                                                                                         A: Drug X 
                                                                                          (N=134)  
        ———————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                                   122 (91.0%)
        Total number of AEs                                                                 609    
        Total number of patients with at least one AE by worst grade                               
          Grade 1                                                                        7 (5.2%)  
          Grade 2                                                                        6 (4.5%)  
          Grade 3                                                                       18 (13.4%) 
          Grade 4                                                                       15 (11.2%) 
          Grade 5 (fatal outcome)                                                       76 (56.7%) 
        Total number of patients with study drug withdrawn due to AE                    27 (20.1%) 
        Total number of patients with dose modified/interrupted due to AE               66 (49.3%) 
        Total number of patients with treatment received for AE                         98 (73.1%) 
        Total number of patients with all non-fatal AEs resolved                        84 (62.7%) 
        Total number of patients with at least one unresolved or ongoing non-fatal AE   102 (76.1%)
        Total number of patients with at least one serious AE                           104 (77.6%)
        Total number of patients with at least one related AE                           105 (78.4%)
      \s\n                                                                                  B: Placebo 
                                                                                          (N=134)  
        ———————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                                   123 (91.8%)
        Total number of AEs                                                                 622    
        Total number of patients with at least one AE by worst grade                               
          Grade 1                                                                        9 (6.7%)  
          Grade 2                                                                        10 (7.5%) 
          Grade 3                                                                       14 (10.4%) 
          Grade 4                                                                       20 (14.9%) 
          Grade 5 (fatal outcome)                                                       70 (52.2%) 
        Total number of patients with study drug withdrawn due to AE                    26 (19.4%) 
        Total number of patients with dose modified/interrupted due to AE               76 (56.7%) 
        Total number of patients with treatment received for AE                         102 (76.1%)
        Total number of patients with all non-fatal AEs resolved                        92 (68.7%) 
        Total number of patients with at least one unresolved or ongoing non-fatal AE   110 (82.1%)
        Total number of patients with at least one serious AE                           101 (75.4%)
        Total number of patients with at least one related AE                           108 (80.6%)
      \s\n                                                                                  C: Combination
                                                                                           (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                                    120 (90.9%)  
        Total number of AEs                                                                  703      
        Total number of patients with at least one AE by worst grade                                  
          Grade 1                                                                          4 (3.0%)   
          Grade 2                                                                          7 (5.3%)   
          Grade 3                                                                         16 (12.1%)  
          Grade 4                                                                         18 (13.6%)  
          Grade 5 (fatal outcome)                                                         75 (56.8%)  
        Total number of patients with study drug withdrawn due to AE                      30 (22.7%)  
        Total number of patients with dose modified/interrupted due to AE                 74 (56.1%)  
        Total number of patients with treatment received for AE                          103 (78.0%)  
        Total number of patients with all non-fatal AEs resolved                          97 (73.5%)  
        Total number of patients with at least one unresolved or ongoing non-fatal AE    107 (81.1%)  
        Total number of patients with at least one serious AE                             99 (75.0%)  
        Total number of patients with at least one related AE                            109 (82.6%)  

# aet02 functions with default argument value return expected result with test data

    Code
      cat(formatters::export_as_txt(res, lpp = 100))
    Output
        MedDRA System Organ Class                                     A: Drug X    B: Placebo    C: Combination
          MedDRA Preferred Term                                        (N=134)       (N=134)        (N=132)    
        ———————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one adverse event     122 (91.0%)   123 (91.8%)    120 (90.9%)  
        Overall total number of events                                   609           622            703      
        cl A.1                                                                                                 
          Total number of patients with at least one adverse event   78 (58.2%)    75 (56.0%)      89 (67.4%)  
          Total number of events                                         132           130            160      
          dcd A.1.1.1.1                                              50 (37.3%)    45 (33.6%)      63 (47.7%)  
          dcd A.1.1.1.2                                              48 (35.8%)    48 (35.8%)      50 (37.9%)  
        cl B.2                                                                                                 
          Total number of patients with at least one adverse event   79 (59.0%)    74 (55.2%)      85 (64.4%)  
          Total number of events                                         129           138            143      
          dcd B.2.2.3.1                                              48 (35.8%)    54 (40.3%)      51 (38.6%)  
          dcd B.2.1.2.1                                              49 (36.6%)    44 (32.8%)      52 (39.4%)  
        cl D.1                                                                                                 
          Total number of patients with at least one adverse event   79 (59.0%)    67 (50.0%)      80 (60.6%)  
          Total number of events                                         127           106            135      
          dcd D.1.1.1.1                                              50 (37.3%)    42 (31.3%)      51 (38.6%)  
          dcd D.1.1.4.2                                              48 (35.8%)    42 (31.3%)      50 (37.9%)  
        cl D.2                                                                                                 
          Total number of patients with at least one adverse event   47 (35.1%)    58 (43.3%)      57 (43.2%)  
          Total number of events                                         62            72              74      
          dcd D.2.1.5.3                                              47 (35.1%)    58 (43.3%)      57 (43.2%)  
        cl B.1                                                                                                 
          Total number of patients with at least one adverse event   47 (35.1%)    49 (36.6%)      43 (32.6%)  
          Total number of events                                         56            60              62      
          dcd B.1.1.1.1                                              47 (35.1%)    49 (36.6%)      43 (32.6%)  
        cl C.2                                                                                                 
          Total number of patients with at least one adverse event   35 (26.1%)    48 (35.8%)      55 (41.7%)  
          Total number of events                                         48            53              65      
          dcd C.2.1.2.1                                              35 (26.1%)    48 (35.8%)      55 (41.7%)  
        cl C.1                                                                                                 
          Total number of patients with at least one adverse event   43 (32.1%)    46 (34.3%)      43 (32.6%)  
          Total number of events                                         55            63              64      
          dcd C.1.1.1.3                                              43 (32.1%)    46 (34.3%)      43 (32.6%)  

# aet03 functions with default argument value return expected result with test data

    Code
      cat(formatters::export_as_txt(res, lpp = 100))
    Output
        MedDRA System Organ Class    A: Drug X    B: Placebo    C: Combination
          MedDRA Preferred Term       (N=134)       (N=134)        (N=132)    
        ——————————————————————————————————————————————————————————————————————
        - Any Intensity -           122 (91.0%)   123 (91.8%)    120 (90.9%)  
        MILD                         7 (5.2%)      9 (6.7%)        4 (3.0%)   
        MODERATE                    24 (17.9%)    24 (17.9%)      23 (17.4%)  
        SEVERE                      91 (67.9%)    90 (67.2%)      93 (70.5%)  
        cl A.1                                                                
          - Any Intensity -         78 (58.2%)    75 (56.0%)      89 (67.4%)  
          MILD                      30 (22.4%)    27 (20.1%)      39 (29.5%)  
          MODERATE                  48 (35.8%)    48 (35.8%)      50 (37.9%)  
          dcd A.1.1.1.1                                                       
            - Any Intensity -       50 (37.3%)    45 (33.6%)      63 (47.7%)  
            MILD                    50 (37.3%)    45 (33.6%)      63 (47.7%)  
          dcd A.1.1.1.2                                                       
            - Any Intensity -       48 (35.8%)    48 (35.8%)      50 (37.9%)  
            MODERATE                48 (35.8%)    48 (35.8%)      50 (37.9%)  
        cl B.2                                                                
          - Any Intensity -         79 (59.0%)    74 (55.2%)      85 (64.4%)  
          MILD                      30 (22.4%)    30 (22.4%)      33 (25.0%)  
          MODERATE                  49 (36.6%)    44 (32.8%)      52 (39.4%)  
          dcd B.2.2.3.1                                                       
            - Any Intensity -       48 (35.8%)    54 (40.3%)      51 (38.6%)  
            MILD                    48 (35.8%)    54 (40.3%)      51 (38.6%)  
          dcd B.2.1.2.1                                                       
            - Any Intensity -       49 (36.6%)    44 (32.8%)      52 (39.4%)  
            MODERATE                49 (36.6%)    44 (32.8%)      52 (39.4%)  
        cl D.1                                                                
          - Any Intensity -         79 (59.0%)    67 (50.0%)      80 (60.6%)  
          MODERATE                  29 (21.6%)    25 (18.7%)      29 (22.0%)  
          SEVERE                    50 (37.3%)    42 (31.3%)      51 (38.6%)  
          dcd D.1.1.1.1                                                       
            - Any Intensity -       50 (37.3%)    42 (31.3%)      51 (38.6%)  
            SEVERE                  50 (37.3%)    42 (31.3%)      51 (38.6%)  
          dcd D.1.1.4.2                                                       
            - Any Intensity -       48 (35.8%)    42 (31.3%)      50 (37.9%)  
            MODERATE                48 (35.8%)    42 (31.3%)      50 (37.9%)  
        cl D.2                                                                
          - Any Intensity -         47 (35.1%)    58 (43.3%)      57 (43.2%)  
          MILD                      47 (35.1%)    58 (43.3%)      57 (43.2%)  
          dcd D.2.1.5.3                                                       
            - Any Intensity -       47 (35.1%)    58 (43.3%)      57 (43.2%)  
            MILD                    47 (35.1%)    58 (43.3%)      57 (43.2%)  
        cl B.1                                                                
          - Any Intensity -         47 (35.1%)    49 (36.6%)      43 (32.6%)  
          SEVERE                    47 (35.1%)    49 (36.6%)      43 (32.6%)  
          dcd B.1.1.1.1                                                       
            - Any Intensity -       47 (35.1%)    49 (36.6%)      43 (32.6%)  
            SEVERE                  47 (35.1%)    49 (36.6%)      43 (32.6%)  
        cl C.2                                                                
          - Any Intensity -         35 (26.1%)    48 (35.8%)      55 (41.7%)  
          MODERATE                  35 (26.1%)    48 (35.8%)      55 (41.7%)  
          dcd C.2.1.2.1                                                       
            - Any Intensity -       35 (26.1%)    48 (35.8%)      55 (41.7%)  
            MODERATE                35 (26.1%)    48 (35.8%)      55 (41.7%)  
        cl C.1                                                                
          - Any Intensity -         43 (32.1%)    46 (34.3%)      43 (32.6%)  
          SEVERE                    43 (32.1%)    46 (34.3%)      43 (32.6%)  
          dcd C.1.1.1.3                                                       
            - Any Intensity -       43 (32.1%)    46 (34.3%)      43 (32.6%)  
            SEVERE                  43 (32.1%)    46 (34.3%)      43 (32.6%)  

# aet04 functions with default argument value return expected result with test data

    Code
      cat(formatters::export_as_txt(res, lpp = 100))
    Output
        MedDRA System Organ Class                                                             
          MedDRA Preferred Term                      A: Drug X    B: Placebo    C: Combination
                                    Grade             (N=134)       (N=134)        (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————————
        - Any adverse events -                                                                
                                    - Any Grade -   122 (91.0%)   123 (91.8%)    120 (90.9%)  
                                    Grade 1-2        13 (9.7%)    19 (14.2%)      11 (8.3%)   
                                    1                7 (5.2%)      9 (6.7%)        4 (3.0%)   
                                    2                6 (4.5%)      10 (7.5%)       7 (5.3%)   
                                    Grade 3-4       33 (24.6%)    34 (25.4%)      34 (25.8%)  
                                    3               18 (13.4%)    14 (10.4%)      16 (12.1%)  
                                    4               15 (11.2%)    20 (14.9%)      18 (13.6%)  
                                    Grade 5         76 (56.7%)    70 (52.2%)      75 (56.8%)  
        cl A.1                                                                                
          - Overall -                                                                         
                                    - Any Grade -   78 (58.2%)    75 (56.0%)      89 (67.4%)  
                                    Grade 1-2       78 (58.2%)    75 (56.0%)      89 (67.4%)  
                                    1               30 (22.4%)    27 (20.1%)      39 (29.5%)  
                                    2               48 (35.8%)    48 (35.8%)      50 (37.9%)  
          dcd A.1.1.1.1                                                                       
                                    - Any Grade -   50 (37.3%)    45 (33.6%)      63 (47.7%)  
                                    Grade 1-2       50 (37.3%)    45 (33.6%)      63 (47.7%)  
                                    1               50 (37.3%)    45 (33.6%)      63 (47.7%)  
          dcd A.1.1.1.2                                                                       
                                    - Any Grade -   48 (35.8%)    48 (35.8%)      50 (37.9%)  
                                    Grade 1-2       48 (35.8%)    48 (35.8%)      50 (37.9%)  
                                    2               48 (35.8%)    48 (35.8%)      50 (37.9%)  
        cl B.2                                                                                
          - Overall -                                                                         
                                    - Any Grade -   79 (59.0%)    74 (55.2%)      85 (64.4%)  
                                    Grade 1-2       30 (22.4%)    30 (22.4%)      33 (25.0%)  
                                    1               30 (22.4%)    30 (22.4%)      33 (25.0%)  
                                    Grade 3-4       49 (36.6%)    44 (32.8%)      52 (39.4%)  
                                    3               49 (36.6%)    44 (32.8%)      52 (39.4%)  
          dcd B.2.2.3.1                                                                       
                                    - Any Grade -   48 (35.8%)    54 (40.3%)      51 (38.6%)  
                                    Grade 1-2       48 (35.8%)    54 (40.3%)      51 (38.6%)  
                                    1               48 (35.8%)    54 (40.3%)      51 (38.6%)  
          dcd B.2.1.2.1                                                                       
                                    - Any Grade -   49 (36.6%)    44 (32.8%)      52 (39.4%)  
                                    Grade 3-4       49 (36.6%)    44 (32.8%)      52 (39.4%)  
                                    3               49 (36.6%)    44 (32.8%)      52 (39.4%)  
        cl D.1                                                                                
          - Overall -                                                                         
                                    - Any Grade -   79 (59.0%)    67 (50.0%)      80 (60.6%)  
                                    Grade 3-4       29 (21.6%)    25 (18.7%)      29 (22.0%)  
                                    3               29 (21.6%)    25 (18.7%)      29 (22.0%)  
                                    Grade 5         50 (37.3%)    42 (31.3%)      51 (38.6%)  
          dcd D.1.1.1.1                                                                       
                                    - Any Grade -   50 (37.3%)    42 (31.3%)      51 (38.6%)  
                                    Grade 5         50 (37.3%)    42 (31.3%)      51 (38.6%)  
          dcd D.1.1.4.2                                                                       
                                    - Any Grade -   48 (35.8%)    42 (31.3%)      50 (37.9%)  
                                    Grade 3-4       48 (35.8%)    42 (31.3%)      50 (37.9%)  
                                    3               48 (35.8%)    42 (31.3%)      50 (37.9%)  
        cl D.2                                                                                
          - Overall -                                                                         
                                    - Any Grade -   47 (35.1%)    58 (43.3%)      57 (43.2%)  
                                    Grade 1-2       47 (35.1%)    58 (43.3%)      57 (43.2%)  
                                    1               47 (35.1%)    58 (43.3%)      57 (43.2%)  
          dcd D.2.1.5.3                                                                       
                                    - Any Grade -   47 (35.1%)    58 (43.3%)      57 (43.2%)  
                                    Grade 1-2       47 (35.1%)    58 (43.3%)      57 (43.2%)  
                                    1               47 (35.1%)    58 (43.3%)      57 (43.2%)  
        cl B.1                                                                                
          - Overall -                                                                         
                                    - Any Grade -   47 (35.1%)    49 (36.6%)      43 (32.6%)  
                                    Grade 5         47 (35.1%)    49 (36.6%)      43 (32.6%)  
          dcd B.1.1.1.1                                                                       
                                    - Any Grade -   47 (35.1%)    49 (36.6%)      43 (32.6%)  
                                    Grade 5         47 (35.1%)    49 (36.6%)      43 (32.6%)  
        cl C.2                                                                                
          - Overall -                                                                         
                                    - Any Grade -   35 (26.1%)    48 (35.8%)      55 (41.7%)  
                                    Grade 1-2       35 (26.1%)    48 (35.8%)      55 (41.7%)  
                                    2               35 (26.1%)    48 (35.8%)      55 (41.7%)  
          dcd C.2.1.2.1                                                                       
                                    - Any Grade -   35 (26.1%)    48 (35.8%)      55 (41.7%)  
                                    Grade 1-2       35 (26.1%)    48 (35.8%)      55 (41.7%)  
                                    2               35 (26.1%)    48 (35.8%)      55 (41.7%)  
        cl C.1                                                                                
          - Overall -                                                                         
                                    - Any Grade -   43 (32.1%)    46 (34.3%)      43 (32.6%)  
                                    Grade 3-4       43 (32.1%)    46 (34.3%)      43 (32.6%)  
                                    4               43 (32.1%)    46 (34.3%)      43 (32.6%)  
          dcd C.1.1.1.3                                                                       
                                    - Any Grade -   43 (32.1%)    46 (34.3%)      43 (32.6%)  
                                    Grade 3-4       43 (32.1%)    46 (34.3%)      43 (32.6%)  
                                    4               43 (32.1%)    46 (34.3%)      43 (32.6%)  

# aet05 functions with default argument value return expected result with test data

    Code
      cat(formatters::export_as_txt(res, lpp = 100))
    Output
                                             A: Drug X      B: Placebo    C: Combination
                                              (N=134)        (N=134)         (N=132)    
        ————————————————————————————————————————————————————————————————————————————————
        Total patient-years at risk           13068.4        13038.6         12739.2    
        Number of adverse events observed       441            511             414      
        AE rate per 1 patient-years             0.03           0.04            0.03     
        95% CI                              (0.03, 0.04)   (0.04, 0.04)    (0.03, 0.04) 

# aet10 functions with default argument value return expected result with test data

    Code
      cat(formatters::export_as_txt(res, lpp = 100))
    Output
                                A: Drug X    B: Placebo   C: Combination
        MedDRA Preferred Term    (N=134)      (N=134)        (N=132)    
        ————————————————————————————————————————————————————————————————
        dcd D.2.1.5.3           47 (35.1%)   58 (43.3%)     57 (43.2%)  
        dcd A.1.1.1.1           50 (37.3%)   45 (33.6%)     63 (47.7%)  
        dcd B.2.2.3.1           48 (35.8%)   54 (40.3%)     51 (38.6%)  
        dcd A.1.1.1.2           48 (35.8%)   48 (35.8%)     50 (37.9%)  
        dcd B.2.1.2.1           49 (36.6%)   44 (32.8%)     52 (39.4%)  
        dcd D.1.1.1.1           50 (37.3%)   42 (31.3%)     51 (38.6%)  
        dcd D.1.1.4.2           48 (35.8%)   42 (31.3%)     50 (37.9%)  
        dcd B.1.1.1.1           47 (35.1%)   49 (36.6%)     43 (32.6%)  
        dcd C.2.1.2.1           35 (26.1%)   48 (35.8%)     55 (41.7%)  
        dcd C.1.1.1.3           43 (32.1%)   46 (34.3%)     43 (32.6%)  

# cmt02_pt functions with default argument value return expected result with test data

    Code
      cat(formatters::export_as_txt(res, lpp = 100))
    Output
        Other Treatment                                         A: Drug X    B: Placebo    C: Combination
                                                                 (N=134)       (N=134)        (N=132)    
        —————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one treatment   122 (91.0%)   123 (91.8%)    120 (90.9%)  
        Total number of treatments                                 609           622            703      
        medname A_1/3                                          54 (40.3%)    49 (36.6%)      69 (52.3%)  
        medname C_2/2                                          52 (38.8%)    58 (43.3%)      60 (45.5%)  
        medname B_1/4                                          52 (38.8%)    57 (42.5%)      59 (44.7%)  
        medname B_2/4                                          52 (38.8%)    55 (41.0%)      56 (42.4%)  
        medname A_2/3                                          53 (39.6%)    50 (37.3%)      56 (42.4%)  
        medname C_1/2                                          51 (38.1%)    50 (37.3%)      56 (42.4%)  
        medname B_4/4                                          50 (37.3%)    45 (33.6%)      55 (41.7%)  
        medname A_3/3                                          45 (33.6%)    54 (40.3%)      48 (36.4%)  
        medname B_3/4                                          47 (35.1%)    47 (35.1%)      52 (39.4%)  

# coxt02 functions with default argument value return expected result with test data

    Code
      cat(formatters::export_as_txt(res, lpp = 100))
    Output
        Effect/Covariate Included in the Model                  Hazard Ratio      95% CI      p-value
        —————————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                                   
          Description of Planned Arm (reference = A: Drug X)                                  <0.0001
            B: Placebo                                              1.45       (1.07, 1.98)   0.0176 
            C: Combination                                          2.49       (1.84, 3.37)   <0.0001
        Covariate:                                                                                   
          Sex (reference = F)                                                                        
            M                                                       0.99       (0.78, 1.27)   0.9564 
          RACE (reference = AMERICAN INDIAN OR ALASKA NATIVE)                                 0.9134 
            ASIAN                                                   0.85       (0.49, 1.46)   0.5568 
            BLACK OR AFRICAN AMERICAN                               0.85       (0.48, 1.50)   0.5673 
            WHITE                                                   0.91       (0.51, 1.63)   0.7579 
          Age (yr)                                                                                   
            All                                                     0.99       (0.97, 1.01)   0.2501 

# dmt01 functions with default argument value return expected result with test data

    Code
      cat(formatters::export_as_txt(res, lpp = 100))
    Output
                                              A: Drug X    B: Placebo    C: Combination   All Patients
                                               (N=134)       (N=134)        (N=132)         (N=400)   
        ——————————————————————————————————————————————————————————————————————————————————————————————
        Age (yr)                                                                                      
          n                                      134           134            132             400     
          Mean (SD)                          33.8 (6.6)    35.4 (7.9)      35.4 (7.7)      34.9 (7.4) 
          Median                                33.0          35.0            35.0            34.0    
          Min - Max                          21.0 - 50.0   21.0 - 62.0    20.0 - 69.0     20.0 - 69.0 
        Age Group                                                                                     
          n                                      134           134            132             400     
          <65                                134 (100%)    134 (100%)     131 (99.2%)     399 (99.8%) 
          >=65                                    0             0           1 (0.8%)        1 (0.2%)  
        Sex                                                                                           
          n                                      134           134            132             400     
          Male                               55 (41.0%)    52 (38.8%)      62 (47.0%)     169 (42.2%) 
          Female                             79 (59.0%)    82 (61.2%)      70 (53.0%)     231 (57.8%) 
        Ethnicity                                                                                     
          n                                      134           134            132             400     
          NOT REPORTED                        6 (4.5%)      10 (7.5%)      11 (8.3%)       27 (6.8%)  
          HISPANIC OR LATINO                 15 (11.2%)    18 (13.4%)      15 (11.4%)      48 (12.0%) 
          NOT HISPANIC OR LATINO             104 (77.6%)   103 (76.9%)    101 (76.5%)     308 (77.0%) 
          UNKNOWN                             9 (6.7%)      3 (2.2%)        5 (3.8%)       17 (4.2%)  
        RACE                                                                                          
          n                                      134           134            132             400     
          AMERICAN INDIAN OR ALASKA NATIVE    8 (6.0%)      11 (8.2%)       6 (4.5%)       25 (6.2%)  
          ASIAN                              68 (50.7%)    68 (50.7%)      73 (55.3%)     209 (52.2%) 
          BLACK OR AFRICAN AMERICAN          31 (23.1%)    28 (20.9%)      32 (24.2%)      91 (22.8%) 
          WHITE                              27 (20.1%)    27 (20.1%)      21 (15.9%)      75 (18.8%) 

# dst01 functions with default argument value return expected result with test data

    Code
      cat(formatters::export_as_txt(res, lpp = 100))
    Output
                                          A: Drug X    B: Placebo   C: Combination   All Patients
                                           (N=134)      (N=134)        (N=132)         (N=400)   
        —————————————————————————————————————————————————————————————————————————————————————————
        Completed                         68 (50.7%)   66 (49.3%)     73 (55.3%)     207 (51.7%) 
        Ongoing                           24 (17.9%)   28 (20.9%)     21 (15.9%)      73 (18.2%) 
        Discontinued                      42 (31.3%)   40 (29.9%)     38 (28.8%)     120 (30.0%) 
          ADVERSE EVENT                    3 (2.2%)     6 (4.5%)       5 (3.8%)       14 (3.5%)  
          DEATH                           25 (18.7%)   23 (17.2%)     22 (16.7%)      70 (17.5%) 
          LACK OF EFFICACY                 2 (1.5%)     2 (1.5%)       3 (2.3%)        7 (1.8%)  
          PHYSICIAN DECISION               2 (1.5%)     3 (2.2%)       2 (1.5%)        7 (1.8%)  
          PROTOCOL VIOLATION               5 (3.7%)     3 (2.2%)       4 (3.0%)       12 (3.0%)  
          WITHDRAWAL BY PARENT/GUARDIAN    4 (3.0%)     2 (1.5%)       1 (0.8%)        7 (1.8%)  
          WITHDRAWAL BY SUBJECT            1 (0.7%)     1 (0.7%)       1 (0.8%)        3 (0.8%)  

# dtht01 functions with default argument value return expected result with test data

    Code
      cat(formatters::export_as_txt(res, lpp = 100))
    Output
                                 A: Drug X    B: Placebo   C: Combination
                                  (N=134)      (N=134)        (N=132)    
        —————————————————————————————————————————————————————————————————
        Total number of deaths   25 (18.7%)   23 (17.2%)     22 (16.7%)  
        Primary Cause of Death                                           
          n                          25           23             22      
          Adverse Event          9 (36.0%)    7 (30.4%)      10 (45.5%)  
          Progressive Disease    8 (32.0%)    6 (26.1%)      6 (27.3%)   
          Other                  8 (32.0%)    10 (43.5%)     6 (27.3%)   

