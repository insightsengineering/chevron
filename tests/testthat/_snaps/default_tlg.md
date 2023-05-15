# ael01_nollt function with default argument value return expected result with test data

    Code
      res
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
      res
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
      res
    Output
                                                                                         A: Drug X    B: Placebo    C: Combination
                                                                                          (N=134)       (N=134)        (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                                   122 (91.0%)   123 (91.8%)    120 (90.9%)  
        Total number of AEs                                                                 609           622            703      
        Total number of patients with at least one AE by worst grade                                                              
          Grade 1                                                                        7 (5.2%)      9 (6.7%)        4 (3.0%)   
          Grade 2                                                                        6 (4.5%)      10 (7.5%)       7 (5.3%)   
          Grade 3                                                                       18 (13.4%)    14 (10.4%)      16 (12.1%)  
          Grade 4                                                                       15 (11.2%)    20 (14.9%)      18 (13.6%)  
          Grade 5 (fatal outcome)                                                       76 (56.7%)    70 (52.2%)      75 (56.8%)  
        Total number of patients with study drug withdrawn due to AE                    27 (20.1%)    26 (19.4%)      30 (22.7%)  
        Total number of patients with dose modified/interrupted due to AE               66 (49.3%)    76 (56.7%)      74 (56.1%)  
        Total number of patients with treatment received for AE                         98 (73.1%)    102 (76.1%)    103 (78.0%)  
        Total number of patients with all non-fatal AEs resolved                        84 (62.7%)    92 (68.7%)      97 (73.5%)  
        Total number of patients with at least one unresolved or ongoing non-fatal AE   102 (76.1%)   110 (82.1%)    107 (81.1%)  
        Total number of patients with at least one serious AE                           104 (77.6%)   101 (75.4%)     99 (75.0%)  
        Total number of patients with at least one related AE                           105 (78.4%)   108 (80.6%)    109 (82.6%)  

# aet02 functions with default argument value return expected result with test data

    Code
      res
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
      res
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
      res
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

# aet10 functions with default argument value return expected result with test data

    Code
      res
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

# cmt01a_1 functions with default argument value return expected result with test data

    Code
      res
    Output
        ATC Level 2 Text                                          A: Drug X    B: Placebo    C: Combination
          Standardized Medication Name                             (N=134)       (N=134)        (N=132)    
        ———————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one treatment     122 (91.0%)   123 (91.8%)    120 (90.9%)  
        Total number of treatments                                   609           622            703      
        ATCCLAS2 A                                                                                         
          Total number of patients with at least one treatment   97 (72.4%)    98 (73.1%)     102 (77.3%)  
          Total number of treatments                                 205           207            242      
          medname A_1/3                                          54 (40.3%)    49 (36.6%)      69 (52.3%)  
          medname A_2/3                                          53 (39.6%)    50 (37.3%)      56 (42.4%)  
          medname A_3/3                                          45 (33.6%)    54 (40.3%)      48 (36.4%)  
        ATCCLAS2 A p2                                                                                      
          Total number of patients with at least one treatment   45 (33.6%)    54 (40.3%)      48 (36.4%)  
          Total number of treatments                                 58            66              64      
          medname A_3/3                                          45 (33.6%)    54 (40.3%)      48 (36.4%)  
        ATCCLAS2 B                                                                                         
          Total number of patients with at least one treatment   102 (76.1%)   101 (75.4%)    108 (81.8%)  
          Total number of treatments                                 264           275            306      
          medname B_1/4                                          52 (38.8%)    57 (42.5%)      59 (44.7%)  
          medname B_2/4                                          52 (38.8%)    55 (41.0%)      56 (42.4%)  
          medname B_4/4                                          50 (37.3%)    45 (33.6%)      55 (41.7%)  
          medname B_3/4                                          47 (35.1%)    47 (35.1%)      52 (39.4%)  
        ATCCLAS2 B p2                                                                                      
          Total number of patients with at least one treatment   78 (58.2%)    82 (61.2%)      89 (67.4%)  
          Total number of treatments                                 139           155            159      
          medname B_1/4                                          52 (38.8%)    57 (42.5%)      59 (44.7%)  
          medname B_2/4                                          52 (38.8%)    55 (41.0%)      56 (42.4%)  
        ATCCLAS2 B p3                                                                                      
          Total number of patients with at least one treatment   78 (58.2%)    82 (61.2%)      89 (67.4%)  
          Total number of treatments                                 139           155            159      
          medname B_1/4                                          52 (38.8%)    57 (42.5%)      59 (44.7%)  
          medname B_2/4                                          52 (38.8%)    55 (41.0%)      56 (42.4%)  
        ATCCLAS2 C                                                                                         
          Total number of patients with at least one treatment   82 (61.2%)    84 (62.7%)      89 (67.4%)  
          Total number of treatments                                 140           140            155      
          medname C_2/2                                          52 (38.8%)    58 (43.3%)      60 (45.5%)  
          medname C_1/2                                          51 (38.1%)    50 (37.3%)      56 (42.4%)  
        ATCCLAS2 C p2                                                                                      
          Total number of patients with at least one treatment   82 (61.2%)    84 (62.7%)      89 (67.4%)  
          Total number of treatments                                 140           140            155      
          medname C_2/2                                          52 (38.8%)    58 (43.3%)      60 (45.5%)  
          medname C_1/2                                          51 (38.1%)    50 (37.3%)      56 (42.4%)  
        ATCCLAS2 C p3                                                                                      
          Total number of patients with at least one treatment   52 (38.8%)    58 (43.3%)      60 (45.5%)  
          Total number of treatments                                 69            73              80      
          medname C_2/2                                          52 (38.8%)    58 (43.3%)      60 (45.5%)  

# cmt02_pt_1 functions with default argument value return expected result with test data

    Code
      res
    Output
        Other Treatment                                         A: Drug X    B: Placebo    C: Combination
                                                                 (N=134)       (N=134)        (N=132)    
        —————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one treatment   122 (91.0%)   123 (91.8%)    120 (90.9%)  
        Total number of treatments                                 609           622            703      
          medname A_1/3                                        54 (40.3%)    49 (36.6%)      69 (52.3%)  
          medname C_2/2                                        52 (38.8%)    58 (43.3%)      60 (45.5%)  
          medname B_1/4                                        52 (38.8%)    57 (42.5%)      59 (44.7%)  
          medname B_2/4                                        52 (38.8%)    55 (41.0%)      56 (42.4%)  
          medname A_2/3                                        53 (39.6%)    50 (37.3%)      56 (42.4%)  
          medname C_1/2                                        51 (38.1%)    50 (37.3%)      56 (42.4%)  
          medname B_4/4                                        50 (37.3%)    45 (33.6%)      55 (41.7%)  
          medname A_3/3                                        45 (33.6%)    54 (40.3%)      48 (36.4%)  
          medname B_3/4                                        47 (35.1%)    47 (35.1%)      52 (39.4%)  

# coxt02 functions with default argument value return expected result with test data

    Code
      res
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
      res
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

# dst01_1 functions with default argument value return expected result with test data

    Code
      res
    Output
                                          A: Drug X    B: Placebo   C: Combination   All Patients
                                           (N=134)      (N=134)        (N=132)         (N=400)   
        —————————————————————————————————————————————————————————————————————————————————————————
        Completed Study                   68 (50.7%)   66 (49.3%)     73 (55.3%)     207 (51.7%) 
        Ongoing                           24 (17.9%)   28 (20.9%)     21 (15.9%)      73 (18.2%) 
        Discontinued Study                42 (31.3%)   40 (29.9%)     38 (28.8%)     120 (30.0%) 
          ADVERSE EVENT                    3 (2.2%)     6 (4.5%)       5 (3.8%)       14 (3.5%)  
          DEATH                           25 (18.7%)   23 (17.2%)     22 (16.7%)      70 (17.5%) 
          LACK OF EFFICACY                 2 (1.5%)     2 (1.5%)       3 (2.3%)        7 (1.8%)  
          PHYSICIAN DECISION               2 (1.5%)     3 (2.2%)       2 (1.5%)        7 (1.8%)  
          PROTOCOL VIOLATION               5 (3.7%)     3 (2.2%)       4 (3.0%)       12 (3.0%)  
          WITHDRAWAL BY PARENT/GUARDIAN    4 (3.0%)     2 (1.5%)       1 (0.8%)        7 (1.8%)  
          WITHDRAWAL BY SUBJECT            1 (0.7%)     1 (0.7%)       1 (0.8%)        3 (0.8%)  

# dst01_2 functions with default argument value return expected result with test data

    Code
      res
    Output
                                            A: Drug X    B: Placebo   C: Combination   All Patients
                                             (N=134)      (N=134)        (N=132)         (N=400)   
        ———————————————————————————————————————————————————————————————————————————————————————————
        Completed Study                     68 (50.7%)   66 (49.3%)     73 (55.3%)     207 (51.7%) 
        Ongoing                             24 (17.9%)   28 (20.9%)     21 (15.9%)      73 (18.2%) 
        Discontinued Study                  42 (31.3%)   40 (29.9%)     38 (28.8%)     120 (30.0%) 
          Safety                            28 (20.9%)   29 (21.6%)     27 (20.5%)      84 (21.0%) 
            ADVERSE EVENT                    3 (2.2%)     6 (4.5%)       5 (3.8%)       14 (3.5%)  
            DEATH                           25 (18.7%)   23 (17.2%)     22 (16.7%)      70 (17.5%) 
          Non-Safety                        14 (10.4%)   11 (8.2%)      11 (8.3%)       36 (9.0%)  
            LACK OF EFFICACY                 2 (1.5%)     2 (1.5%)       3 (2.3%)        7 (1.8%)  
            PHYSICIAN DECISION               2 (1.5%)     3 (2.2%)       2 (1.5%)        7 (1.8%)  
            PROTOCOL VIOLATION               5 (3.7%)     3 (2.2%)       4 (3.0%)       12 (3.0%)  
            WITHDRAWAL BY PARENT/GUARDIAN    4 (3.0%)     2 (1.5%)       1 (0.8%)        7 (1.8%)  
            WITHDRAWAL BY SUBJECT            1 (0.7%)     1 (0.7%)       1 (0.8%)        3 (0.8%)  

# dst01_3 functions with default argument value return expected result with test data

    Code
      res
    Output
                                            A: Drug X    B: Placebo   C: Combination   All Patients
                                             (N=134)      (N=134)        (N=132)         (N=400)   
        ———————————————————————————————————————————————————————————————————————————————————————————
        Completed Study                     68 (50.7%)   66 (49.3%)     73 (55.3%)     207 (51.7%) 
        Ongoing                             24 (17.9%)   28 (20.9%)     21 (15.9%)      73 (18.2%) 
        Discontinued Study                  42 (31.3%)   40 (29.9%)     38 (28.8%)     120 (30.0%) 
          Safety                            28 (20.9%)   29 (21.6%)     27 (20.5%)      84 (21.0%) 
            ADVERSE EVENT                    3 (2.2%)     6 (4.5%)       5 (3.8%)       14 (3.5%)  
            DEATH                           25 (18.7%)   23 (17.2%)     22 (16.7%)      70 (17.5%) 
          Non-Safety                        14 (10.4%)   11 (8.2%)      11 (8.3%)       36 (9.0%)  
            LACK OF EFFICACY                 2 (1.5%)     2 (1.5%)       3 (2.3%)        7 (1.8%)  
            PHYSICIAN DECISION               2 (1.5%)     3 (2.2%)       2 (1.5%)        7 (1.8%)  
            PROTOCOL VIOLATION               5 (3.7%)     3 (2.2%)       4 (3.0%)       12 (3.0%)  
            WITHDRAWAL BY PARENT/GUARDIAN    4 (3.0%)     2 (1.5%)       1 (0.8%)        7 (1.8%)  
            WITHDRAWAL BY SUBJECT            1 (0.7%)     1 (0.7%)       1 (0.8%)        3 (0.8%)  
        Completed Treatment                 47 (35.1%)   35 (26.1%)     42 (31.8%)     124 (31.0%) 
        Ongoing Treatment                   39 (29.1%)   46 (34.3%)     46 (34.8%)     131 (32.8%) 
        Discontinued Treatment              48 (35.8%)   53 (39.6%)     44 (33.3%)     145 (36.2%) 

# dtht01_1 functions with default argument value return expected result with test data

    Code
      res
    Output
                                 A: Drug X    B: Placebo   C: Combination
                                  (N=134)      (N=134)        (N=132)    
        —————————————————————————————————————————————————————————————————
        Total number of deaths   25 (18.7%)   23 (17.2%)     22 (16.7%)  
        Primary cause of death                                           
          n                          25           23             22      
          ADVERSE EVENT          9 (36.0%)    7 (30.4%)      10 (45.5%)  
          PROGRESSIVE DISEASE    8 (32.0%)    6 (26.1%)      6 (27.3%)   
          OTHER                  8 (32.0%)    10 (43.5%)     6 (27.3%)   

# egt01_1 functions with default argument value return expected result with test data

    Code
      res
    Output
        Parameter                                                                                                                   
          Analysis Visit               A: Drug X                          B: Placebo                        C: Combination          
                                              Change from                         Change from                         Change from   
                           Value at Visit       Baseline       Value at Visit       Baseline       Value at Visit       Baseline    
        ————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
        Heart Rate                                                                                                                  
          BASELINE                                                                                                                  
            n                   134                0                134                0                132                0        
            Mean (SD)       71.4 (17.9)            NA           69.8 (20.7)            NA           69.3 (20.9)            NA       
            Median              72.7               NA               73.4               NA               72.0               NA       
            Min - Max       9.1 - 106.9            NA           13.5 - 115.5           NA           11.6 - 115.5           NA       
          WEEK 1 DAY 8                                                                                                              
            n                   134               134               134               134               132               132       
            Mean (SD)       70.2 (20.3)       -1.3 (26.0)       69.4 (20.8)       -0.4 (29.7)       68.7 (18.1)       -0.7 (27.8)   
            Median              70.7              -2.2              70.5              -0.5              68.6              -0.8      
            Min - Max       8.5 - 127.5       -51.0 - 89.2      16.9 - 129.1      -68.2 - 88.4      16.9 - 115.6      -68.2 - 67.2  
          WEEK 2 DAY 15                                                                                                             
            n                   134               134               134               134               132               132       
            Mean (SD)       70.3 (19.6)       -1.1 (26.3)       71.1 (20.6)        1.3 (31.4)       69.2 (18.1)       -0.1 (28.6)   
            Median              70.9              -1.1              72.5              -0.3              69.3              -1.5      
            Min - Max       17.1 - 116.3      -85.0 - 67.5      9.2 - 120.5       -73.1 - 81.4      29.6 - 120.5      -67.7 - 66.3  
          WEEK 3 DAY 22                                                                                                             
            n                   134               134               134               134               132               132       
            Mean (SD)       68.3 (20.2)       -3.2 (28.7)       68.9 (20.6)       -0.9 (30.1)       70.9 (20.3)        1.5 (27.3)   
            Median              68.8              -2.2              67.8              1.2               70.1              0.1       
            Min - Max       13.3 - 131.7      -81.2 - 72.6      24.0 - 130.4     -73.0 - 103.3      20.9 - 116.8      -64.5 - 72.5  
          WEEK 4 DAY 29                                                                                                             
            n                   134               134               134               134               132               132       
            Mean (SD)       70.1 (18.4)       -1.4 (26.6)       71.6 (20.3)        1.8 (30.3)       71.0 (20.6)        1.7 (29.6)   
            Median              69.3              -4.5              72.2              -0.9              70.5              3.8       
            Min - Max       22.3 - 116.5      -58.1 - 77.3      17.5 - 129.1      -64.3 - 85.3      10.4 - 117.3     -65.9 - 105.7  
          WEEK 5 DAY 36                                                                                                             
            n                   134               134               134               134               132               132       
            Mean (SD)       66.4 (19.7)       -5.0 (27.1)       71.3 (18.9)        1.4 (27.1)       71.3 (18.6)        1.9 (29.6)   
            Median              65.4              -6.8              70.9              0.6               73.3              1.7       
            Min - Max       23.9 - 110.4      -73.3 - 57.2      25.9 - 125.7      -71.2 - 67.4      23.9 - 117.2      -58.2 - 68.9  
        QT Duration                                                                                                                 
          BASELINE                                                                                                                  
            n                   134                0                134                0                132                0        
            Mean (SD)      336.8 (118.0)           NA           351.0 (98.4)           NA          352.6 (105.1)           NA       
            Median             344.4               NA              351.5               NA              348.0               NA       
            Min - Max       87.0 - 665.4           NA           98.9 - 641.9           NA          105.7 - 628.1           NA       
          WEEK 1 DAY 8                                                                                                              
            n                   134               134               134               134               132               132       
            Mean (SD)      342.6 (101.1)      5.7 (159.9)      363.9 (102.3)      12.9 (140.7)     359.4 (105.2)      6.8 (147.1)   
            Median             347.3              -1.8             356.5              13.7             363.8              8.7       
            Min - Max       91.6 - 591.4     -346.4 - 452.8    114.9 - 656.5     -317.5 - 416.4     51.9 - 611.9     -473.2 - 358.0 
          WEEK 2 DAY 15                                                                                                             
            n                   134               134               134               134               132               132       
            Mean (SD)       353.2 (93.9)      16.4 (162.1)      345.9 (96.8)      -5.1 (152.5)      335.7 (98.6)     -16.9 (138.4)  
            Median             351.1              16.7             346.8              -9.7             321.0             -22.3      
            Min - Max      138.0 - 587.3     -414.1 - 389.2    146.4 - 556.1     -440.3 - 364.8    104.9 - 562.3     -326.5 - 325.3 
          WEEK 3 DAY 22                                                                                                             
            n                   134               134               134               134               132               132       
            Mean (SD)      370.1 (101.6)      33.3 (152.8)     343.4 (102.6)      -7.6 (138.8)      346.9 (95.0)      -5.7 (144.7)  
            Median             378.2              39.6             335.1             -15.9             352.2              9.1       
            Min - Max      118.1 - 615.2     -391.7 - 520.1     63.4 - 566.5     -311.3 - 293.8    126.1 - 580.8     -412.1 - 410.0 
          WEEK 4 DAY 29                                                                                                             
            n                   134               134               134               134               132               132       
            Mean (SD)       345.8 (96.0)      8.9 (145.6)      354.4 (108.3)      3.4 (142.4)      341.4 (106.7)     -11.2 (145.6)  
            Median             340.1              5.6              346.7             -17.1             352.3             -11.9      
            Min - Max      110.1 - 616.6     -393.3 - 456.0     80.8 - 687.7     -439.9 - 364.8     4.9 - 570.6      -480.9 - 330.7 
          WEEK 5 DAY 36                                                                                                             
            n                   134               134               134               134               132               132       
            Mean (SD)       358.9 (97.7)      22.1 (155.7)      338.6 (99.3)     -12.4 (130.5)      349.3 (95.8)      -3.3 (136.0)  
            Median             352.0              5.9              344.2              0.4              350.3              12.7      
            Min - Max       88.4 - 661.1     -353.3 - 539.8     31.3 - 563.9     -338.9 - 352.7    119.0 - 581.8     -311.5 - 295.5 
        RR Duration                                                                                                                 
          BASELINE                                                                                                                  
            n                   134                0                134                0                132                0        
            Mean (SD)      1028.4 (286.4)          NA          1027.5 (324.0)          NA          1074.6 (277.3)          NA       
            Median             1041.9              NA              1047.3              NA              1080.9              NA       
            Min - Max      34.3 - 1783.7           NA           5.3 - 1877.2           NA          289.6 - 1617.1          NA       
          WEEK 1 DAY 8                                                                                                              
            n                   134               134               134               134               132               132       
            Mean (SD)      990.2 (318.7)     -38.3 (446.4)     1061.6 (269.1)     34.1 (401.8)     1039.6 (284.4)    -35.0 (406.0)  
            Median             963.9             -86.5             1061.5             66.9             1014.8            -97.8      
            Min - Max      110.8 - 2014.6   -1014.8 - 1389.4   276.8 - 1712.0    -942.2 - 993.8    498.2 - 1937.5    -958.6 - 908.9 
          WEEK 2 DAY 15                                                                                                             
            n                   134               134               134               134               132               132       
            Mean (SD)      1013.4 (304.1)    -15.0 (425.8)     1109.4 (318.2)     81.9 (453.1)     1045.2 (277.5)    -29.4 (380.8)  
            Median             1040.7             40.5             1117.8             69.3             1034.6            -15.3      
            Min - Max      164.2 - 1677.1   -1216.1 - 1053.2   160.7 - 2048.7   -1127.1 - 1148.6   252.8 - 1722.3    -859.3 - 871.5 
          WEEK 3 DAY 22                                                                                                             
            n                   134               134               134               134               132               132       
            Mean (SD)      1014.0 (305.0)    -14.4 (406.5)     1118.3 (296.5)     90.9 (409.6)     1036.6 (268.5)    -38.0 (421.5)  
            Median             1027.2            -50.5             1134.6             52.0             1030.7            -60.7      
            Min - Max      357.0 - 1798.7   -882.9 - 1080.3    97.1 - 1825.4    -887.1 - 1166.2    446.0 - 1713.4    -984.8 - 902.4 
          WEEK 4 DAY 29                                                                                                             
            n                   134               134               134               134               132               132       
            Mean (SD)      1033.3 (313.9)     4.9 (483.2)      1079.8 (298.9)     52.3 (429.3)     1027.5 (295.9)    -47.1 (378.2)  
            Median             1050.4             5.6              1051.6             69.6             1023.4            -49.5      
            Min - Max      54.3 - 1979.4    -1345.9 - 1195.4   347.9 - 1762.0   -826.4 - 1191.8    341.6 - 2144.9   -1002.0 - 1048.7
          WEEK 5 DAY 36                                                                                                             
            n                   134               134               134               134               132               132       
            Mean (SD)      1072.3 (282.9)     43.9 (379.0)     1058.5 (271.0)     31.0 (436.0)     1029.0 (271.2)    -45.6 (405.5)  
            Median             1067.3             55.9             1068.9             33.6             1065.3            -34.4      
            Min - Max      353.0 - 2000.6   -1028.8 - 1418.6   208.8 - 1794.7   -979.0 - 1365.1    436.3 - 1794.1   -962.2 - 1329.9 

# egt02_1 functions with default argument value return expected result with test data

    Code
      res
    Output
        Assessment       A: Drug X        B: Placebo     C: Combination
         Abnormality      (N=134)          (N=134)          (N=132)    
        ———————————————————————————————————————————————————————————————
        Heart Rate                                                     
          Low          49/134 (36.6%)   57/134 (42.5%)   55/132 (41.7%)
          High         48/134 (35.8%)   51/134 (38.1%)   48/132 (36.4%)
        QT Duration                                                    
          Low          53/134 (39.6%)   56/134 (41.8%)   54/132 (40.9%)
          High         45/134 (33.6%)   51/134 (38.1%)   45/132 (34.1%)
        RR Duration                                                    
          Low          56/134 (41.8%)   41/134 (30.6%)   50/132 (37.9%)
          High         39/134 (29.1%)   62/134 (46.3%)   41/132 (31.1%)

# egt02_2 functions with default argument value return expected result with test data

    Code
      res
    Output
        Assessment       A: Drug X        B: Placebo     C: Combination
         Abnormality      (N=134)          (N=134)          (N=132)    
        ———————————————————————————————————————————————————————————————
        Heart Rate                                                     
          Low          43/128 (33.6%)   47/124 (37.9%)   40/117 (34.2%)
          High         41/127 (32.3%)   46/129 (35.7%)   38/122 (31.1%)
        QT Duration                                                    
          Low          32/113 (28.3%)   48/126 (38.1%)   46/124 (37.1%)
          High         36/125 (28.8%)   47/130 (36.2%)   33/119 (27.7%)
        RR Duration                                                    
          Low          51/129 (39.5%)   30/123 (24.4%)   44/126 (34.9%)
          High         32/127 (25.2%)    50/122 (41%)    34/125 (27.2%)

# egt03_1 functions with default argument value return expected result with test data

    Code
      res
    Output
        Planned Arm Code                           Minimum Post-Baseline Assessment     
          Baseline Reference Range Indicator       LOW         NORMAL     HIGH   Missing
        ————————————————————————————————————————————————————————————————————————————————
        ARM A (N=134)                                                                   
          LOW                                   1 (0.7%)      5 (3.7%)     0        0   
          NORMAL                               36 (26.9%)    85 (63.4%)    0        0   
          HIGH                                  3 (2.2%)       4 (3%)      0        0   
          Missing                                   0            0         0        0   
        ARM B (N=134)                                                                   
          LOW                                   1 (0.7%)      9 (6.7%)     0        0   
          NORMAL                               41 (30.6%)    78 (58.2%)    0        0   
          HIGH                                  1 (0.7%)       4 (3%)      0        0   
          Missing                                   0            0         0        0   
        ARM C (N=132)                                                                   
          LOW                                    4 (3%)      11 (8.3%)     0        0   
          NORMAL                               32 (24.2%)    75 (56.8%)    0        0   
          HIGH                                  1 (0.8%)      9 (6.8%)     0        0   
          Missing                                   0            0         0        0   

# egt03_2 functions with default argument value return expected result with test data

    Code
      res
    Output
        Planned Arm Code                           Maximum Post-Baseline Assessment     
          Baseline Reference Range Indicator   LOW      NORMAL         HIGH      Missing
        ————————————————————————————————————————————————————————————————————————————————
        ARM A (N=134)                                                                   
          LOW                                   0      2 (1.5%)       4 (3%)        0   
          NORMAL                                0     88 (65.7%)    33 (24.6%)      0   
          HIGH                                  0      5 (3.7%)      2 (1.5%)       0   
          Missing                               0          0            0           0   
        ARM B (N=134)                                                                   
          LOW                                   0       8 (6%)       2 (1.5%)       0   
          NORMAL                                0     78 (58.2%)    41 (30.6%)      0   
          HIGH                                  0      3 (2.2%)      2 (1.5%)       0   
          Missing                               0          0            0           0   
        ARM C (N=132)                                                                   
          LOW                                   0      12 (9.1%)     3 (2.3%)       0   
          NORMAL                                0     79 (59.8%)    28 (21.2%)      0   
          HIGH                                  0      5 (3.8%)      5 (3.8%)       0   
          Missing                               0          0            0           0   

# egt05_qtcat_1 functions with default argument value return expected result with test data

    Code
      res
    Output
        Parameter                                                              
          Analysis Visit              A: Drug X    B: Placebo    C: Combination
            Category                   (N=134)       (N=134)        (N=132)    
        ———————————————————————————————————————————————————————————————————————
        QT Duration                                                            
          BASELINE                                                             
            Value at Visit                                                     
              n                          134           134            132      
              <=450 msec             115 (85.8%)   117 (87.3%)    104 (78.8%)  
              >450 to <=480 msec      6 (4.5%)      10 (7.5%)       9 (6.8%)   
              >480 to <=500 msec       4 (3%)       3 (2.2%)        6 (4.5%)   
              >500 msec               9 (6.7%)       4 (3%)        13 (9.8%)   
          WEEK 1 DAY 8                                                         
            Value at Visit                                                     
              n                          134           134            132      
              <=450 msec             113 (84.3%)   106 (79.1%)    106 (80.3%)  
              >450 to <=480 msec      10 (7.5%)     10 (7.5%)      11 (8.3%)   
              >480 to <=500 msec       4 (3%)        4 (3%)         3 (2.3%)   
              >500 msec               7 (5.2%)     14 (10.4%)      12 (9.1%)   
            Change from Baseline                                               
              n                          134           134            132      
              <=30 msec              76 (56.7%)     75 (56%)       75 (56.8%)  
              >30 to <=60 msec        7 (5.2%)      13 (9.7%)      11 (8.3%)   
              >60 msec               51 (38.1%)    46 (34.3%)      46 (34.8%)  
          WEEK 2 DAY 15                                                        
            Value at Visit                                                     
              n                          134           134            132      
              <=450 msec             111 (82.8%)   114 (85.1%)    112 (84.8%)  
              >450 to <=480 msec      10 (7.5%)     9 (6.7%)        9 (6.8%)   
              >480 to <=500 msec      7 (5.2%)      2 (1.5%)        5 (3.8%)   
              >500 msec               6 (4.5%)      9 (6.7%)        6 (4.5%)   
            Change from Baseline                                               
              n                          134           134            132      
              <=30 msec               71 (53%)     87 (64.9%)      89 (67.4%)  
              >30 to <=60 msec        11 (8.2%)     9 (6.7%)        9 (6.8%)   
              >60 msec               52 (38.8%)    38 (28.4%)      34 (25.8%)  
          WEEK 3 DAY 22                                                        
            Value at Visit                                                     
              n                          134           134            132      
              <=450 msec             106 (79.1%)   112 (83.6%)    118 (89.4%)  
              >450 to <=480 msec      13 (9.7%)     7 (5.2%)        3 (2.3%)   
              >480 to <=500 msec       4 (3%)       5 (3.7%)        2 (1.5%)   
              >500 msec               11 (8.2%)     10 (7.5%)       9 (6.8%)   
            Change from Baseline                                               
              n                          134           134            132      
              <=30 msec               63 (47%)     80 (59.7%)      81 (61.4%)  
              >30 to <=60 msec       14 (10.4%)      8 (6%)        11 (8.3%)   
              >60 msec               57 (42.5%)    46 (34.3%)      40 (30.3%)  
          WEEK 4 DAY 29                                                        
            Value at Visit                                                     
              n                          134           134            132      
              <=450 msec             117 (87.3%)   103 (76.9%)    114 (86.4%)  
              >450 to <=480 msec      7 (5.2%)     14 (10.4%)       6 (4.5%)   
              >480 to <=500 msec       4 (3%)       7 (5.2%)        3 (2.3%)   
              >500 msec               6 (4.5%)      10 (7.5%)       9 (6.8%)   
            Change from Baseline                                               
              n                          134           134            132      
              <=30 msec               79 (59%)     80 (59.7%)      79 (59.8%)  
              >30 to <=60 msec        11 (8.2%)     7 (5.2%)       10 (7.6%)   
              >60 msec               44 (32.8%)    47 (35.1%)      43 (32.6%)  
          WEEK 5 DAY 36                                                        
            Value at Visit                                                     
              n                          134           134            132      
              <=450 msec             107 (79.9%)   117 (87.3%)    112 (84.8%)  
              >450 to <=480 msec     16 (11.9%)     5 (3.7%)       13 (9.8%)   
              >480 to <=500 msec      5 (3.7%)      9 (6.7%)        3 (2.3%)   
              >500 msec               6 (4.5%)      3 (2.2%)         4 (3%)    
            Change from Baseline                                               
              n                          134           134            132      
              <=30 msec              72 (53.7%)    82 (61.2%)      73 (55.3%)  
              >30 to <=60 msec        10 (7.5%)     11 (8.2%)      11 (8.3%)   
              >60 msec               52 (38.8%)    41 (30.6%)      48 (36.4%)  

# ext01_1 functions with default argument value return expected result with test data

    Code
      res
    Output
                                                A: Drug X        B: Placebo      C: Combination 
                                                 (N=134)           (N=134)           (N=132)    
        ————————————————————————————————————————————————————————————————————————————————————————
        Total number of doses administered                                                      
          n                                        134               134               132      
          Mean (SD)                             7.0 (0.0)         7.0 (0.0)         7.0 (0.0)   
          Median                                   7.0               7.0               7.0      
          Min - Max                             7.0 - 7.0         7.0 - 7.0         7.0 - 7.0   
        Total dose administered                                                                 
          n                                        134               134               132      
          Mean (SD)                          6655.5 (1209.6)   6401.2 (1269.9)   6776.4 (1212.5)
          Median                                 6720.0            6360.0            6720.0     
          Min - Max                          4320.0 - 9360.0   4080.0 - 9360.0   4320.0 - 9360.0

# ext01_2 functions with default argument value return expected result with test data

    Code
      res
    Output
                                     A: Drug X        B: Placebo      C: Combination 
                                      (N=134)           (N=134)           (N=132)    
        —————————————————————————————————————————————————————————————————————————————
        Total dose administered                                                      
          n                             134               134               132      
          Mean (SD)               6655.5 (1209.6)   6401.2 (1269.9)   6776.4 (1212.5)
          Median                      6720.0            6360.0            6720.0     
          Min - Max               4320.0 - 9360.0   4080.0 - 9360.0   4320.0 - 9360.0
          n                             134               134               132      
          <5000                      10 (7.5%)        18 (13.4%)         7 (5.3%)    
          5000-7000                 72 (53.7%)        71 (53.0%)        71 (53.8%)   
          7000-9000                 50 (37.3%)        42 (31.3%)        51 (38.6%)   
          >9000                      2 (1.5%)          3 (2.2%)          3 (2.3%)    

