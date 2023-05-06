# aet01 function with default argument value return expected result with test data

    Code
      res
    Output
                                                                      A: Drug X    B: Placebo    C: Combination
                                                                       (N=134)       (N=134)        (N=132)    
        ———————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                122 (91.0%)   123 (91.8%)    120 (90.9%)  
        Total number of AEs                                              609           622            703      
        Total number of deaths                                       24 (17.9%)    19 (14.2%)      20 (15.2%)  
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

# aet03_1 functions with default argument value return expected result with test data

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

# aet04_1 functions with default argument value return expected result with test data

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

# aet10_1 functions with default argument value return expected result with test data

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
        ATC Class Level 2                                         A: Drug X    B: Placebo    C: Combination
          Other Treatment                                          (N=134)       (N=134)        (N=132)    
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

# cmt01a_2 functions with default argument value return expected result with test data

    Code
      res
    Output
        ATC Class Level 2                                         A: Drug X    B: Placebo    C: Combination
          Other Treatment                                          (N=134)       (N=134)        (N=132)    
        ———————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one treatment     122 (91.0%)   123 (91.8%)    120 (90.9%)  
        Total number of treatments                                   609           622            703      
        ATCCLAS2 B                                                                                         
          Total number of patients with at least one treatment   102 (76.1%)   101 (75.4%)    108 (81.8%)  
          Total number of treatments                                 264           275            306      
          medname B_1/4                                          52 (38.8%)    57 (42.5%)      59 (44.7%)  
          medname B_2/4                                          52 (38.8%)    55 (41.0%)      56 (42.4%)  
          medname B_4/4                                          50 (37.3%)    45 (33.6%)      55 (41.7%)  
          medname B_3/4                                          47 (35.1%)    47 (35.1%)      52 (39.4%)  
        ATCCLAS2 A                                                                                         
          Total number of patients with at least one treatment   97 (72.4%)    98 (73.1%)     102 (77.3%)  
          Total number of treatments                                 205           207            242      
          medname A_1/3                                          54 (40.3%)    49 (36.6%)      69 (52.3%)  
          medname A_2/3                                          53 (39.6%)    50 (37.3%)      56 (42.4%)  
          medname A_3/3                                          45 (33.6%)    54 (40.3%)      48 (36.4%)  
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
        ATCCLAS2 A p2                                                                                      
          Total number of patients with at least one treatment   45 (33.6%)    54 (40.3%)      48 (36.4%)  
          Total number of treatments                                 58            66              64      
          medname A_3/3                                          45 (33.6%)    54 (40.3%)      48 (36.4%)  

# cmt01a_3 functions with default argument value return expected result with test data

    Code
      res
    Output
        ATC Class Level 2                                         A: Drug X    B: Placebo    C: Combination
          Other Treatment                                          (N=134)       (N=134)        (N=132)    
        ———————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one treatment     122 (91.0%)   123 (91.8%)    120 (90.9%)  
        Total number of treatments                                   609           622            703      
        ATCCLAS2 A                                                                                         
          Total number of patients with at least one treatment   97 (72.4%)    98 (73.1%)     102 (77.3%)  
          medname A_1/3                                          54 (40.3%)    49 (36.6%)      69 (52.3%)  
          medname A_2/3                                          53 (39.6%)    50 (37.3%)      56 (42.4%)  
          medname A_3/3                                          45 (33.6%)    54 (40.3%)      48 (36.4%)  
        ATCCLAS2 A p2                                                                                      
          Total number of patients with at least one treatment   45 (33.6%)    54 (40.3%)      48 (36.4%)  
          medname A_3/3                                          45 (33.6%)    54 (40.3%)      48 (36.4%)  
        ATCCLAS2 B                                                                                         
          Total number of patients with at least one treatment   102 (76.1%)   101 (75.4%)    108 (81.8%)  
          medname B_1/4                                          52 (38.8%)    57 (42.5%)      59 (44.7%)  
          medname B_2/4                                          52 (38.8%)    55 (41.0%)      56 (42.4%)  
          medname B_4/4                                          50 (37.3%)    45 (33.6%)      55 (41.7%)  
          medname B_3/4                                          47 (35.1%)    47 (35.1%)      52 (39.4%)  
        ATCCLAS2 B p2                                                                                      
          Total number of patients with at least one treatment   78 (58.2%)    82 (61.2%)      89 (67.4%)  
          medname B_1/4                                          52 (38.8%)    57 (42.5%)      59 (44.7%)  
          medname B_2/4                                          52 (38.8%)    55 (41.0%)      56 (42.4%)  
        ATCCLAS2 B p3                                                                                      
          Total number of patients with at least one treatment   78 (58.2%)    82 (61.2%)      89 (67.4%)  
          medname B_1/4                                          52 (38.8%)    57 (42.5%)      59 (44.7%)  
          medname B_2/4                                          52 (38.8%)    55 (41.0%)      56 (42.4%)  
        ATCCLAS2 C                                                                                         
          Total number of patients with at least one treatment   82 (61.2%)    84 (62.7%)      89 (67.4%)  
          medname C_2/2                                          52 (38.8%)    58 (43.3%)      60 (45.5%)  
          medname C_1/2                                          51 (38.1%)    50 (37.3%)      56 (42.4%)  
        ATCCLAS2 C p2                                                                                      
          Total number of patients with at least one treatment   82 (61.2%)    84 (62.7%)      89 (67.4%)  
          medname C_2/2                                          52 (38.8%)    58 (43.3%)      60 (45.5%)  
          medname C_1/2                                          51 (38.1%)    50 (37.3%)      56 (42.4%)  
        ATCCLAS2 C p3                                                                                      
          Total number of patients with at least one treatment   52 (38.8%)    58 (43.3%)      60 (45.5%)  
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

# dmt01_1 functions with default argument value return expected result with test data

    Code
      res
    Output
                                                       A: Drug X    B: Placebo    C: Combination   All Patients
                                                        (N=134)       (N=134)        (N=132)         (N=400)   
        ———————————————————————————————————————————————————————————————————————————————————————————————————————
        Age (yr)                                                                                               
          n                                               134           134            132             400     
          Mean (SD)                                   33.8 (6.6)    35.4 (7.9)      35.4 (7.7)      34.9 (7.4) 
          Median                                         33.0          35.0            35.0            34.0    
          Min - Max                                   21.0 - 50.0   21.0 - 62.0    20.0 - 69.0     20.0 - 69.0 
        Age group (yr)                                                                                         
          n                                               134           134            132             400     
          <65                                         134 (100%)    134 (100%)     131 (99.2%)     399 (99.8%) 
          >=65                                             0             0           1 (0.8%)        1 (0.2%)  
        Sex                                                                                                    
          n                                               134           134            132             400     
          F                                           79 (59.0%)    82 (61.2%)      70 (53.0%)     231 (57.8%) 
          M                                           55 (41.0%)    52 (38.8%)      62 (47.0%)     169 (42.2%) 
        Ethnicity                                                                                              
          n                                               134           134            132             400     
          NOT REPORTED                                 6 (4.5%)      10 (7.5%)      11 (8.3%)       27 (6.8%)  
          HISPANIC OR LATINO                          15 (11.2%)    18 (13.4%)      15 (11.4%)      48 (12.0%) 
          NOT HISPANIC OR LATINO                      104 (77.6%)   103 (76.9%)    101 (76.5%)     308 (77.0%) 
          UNKNOWN                                      9 (6.7%)      3 (2.2%)        5 (3.8%)       17 (4.2%)  
        Race                                                                                                   
          n                                               134           134            132             400     
          ASIAN                                       68 (50.7%)    67 (50.0%)      73 (55.3%)     208 (52.0%) 
          BLACK OR AFRICAN AMERICAN                   31 (23.1%)    28 (20.9%)      32 (24.2%)      91 (22.8%) 
          WHITE                                       27 (20.1%)    26 (19.4%)      21 (15.9%)      74 (18.5%) 
          AMERICAN INDIAN OR ALASKA NATIVE             8 (6.0%)      11 (8.2%)       6 (4.5%)       25 (6.2%)  
          MULTIPLE                                         0         1 (0.7%)           0            1 (0.2%)  
          NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER        0         1 (0.7%)           0            1 (0.2%)  

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

# lbt01_1 functions with default argument value return expected result with test data

    Code
      res
    Output
        Parameter                                                                                                                                 
          Analysis Visit                                  A: Drug X                        B: Placebo                      C: Combination         
                                                                 Change from                       Change from                       Change from  
                                               Value at Visit      Baseline      Value at Visit      Baseline      Value at Visit      Baseline   
        ——————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                                                                                      
          BASELINE                                                                                                                                
            n                                       134                               134                               132                       
            Mean (SD)                          19.786 (4.161)                    20.153 (4.171)                    20.451 (3.911)                 
            Median                                 19.786                            20.077                            20.387                     
            Min - Max                           6.99 - 30.43                      8.11 - 34.56                      8.82 - 28.72                  
          WEEK 1 DAY 8                                                                                                                            
            n                                       134              134              134              134              132              132      
            Mean (SD)                          19.301 (3.981)   -0.485 (5.850)   20.221 (3.974)   0.068 (6.036)    20.553 (3.895)   0.102 (5.461) 
            Median                                 19.209           -0.511           20.090           -0.725           20.402           0.025     
            Min - Max                           8.86 - 27.32    -12.52 - 19.70    5.84 - 28.75    -12.29 - 17.41    9.87 - 30.70    -13.69 - 15.54
          WEEK 2 DAY 15                                                                                                                           
            n                                       134              134              134              134              132              132      
            Mean (SD)                          19.704 (4.233)   -0.082 (6.003)   20.123 (4.265)   -0.030 (6.263)   19.247 (3.592)   -1.204 (5.485)
            Median                                 19.168           0.038            19.986           -0.371           19.608           -0.482    
            Min - Max                           7.17 - 30.53    -13.15 - 17.17    7.19 - 30.54    -18.37 - 14.39    8.11 - 26.68    -14.28 - 15.65
          WEEK 3 DAY 22                                                                                                                           
            n                                       134              134              134              134              132              132      
            Mean (SD)                          20.130 (3.757)   0.344 (5.761)    19.837 (3.871)   -0.316 (5.604)   19.428 (3.944)   -1.023 (5.550)
            Median                                 20.044           0.451            19.873           -0.178           18.838           -1.065    
            Min - Max                          11.52 - 29.49    -16.04 - 16.26   11.86 - 28.24    -18.52 - 15.00   10.20 - 28.49    -12.33 - 11.10
          WEEK 4 DAY 29                                                                                                                           
            n                                       134              134              134              134              132              132      
            Mean (SD)                          20.351 (4.583)   0.565 (6.506)    19.632 (4.346)   -0.521 (6.293)   19.823 (3.995)   -0.627 (5.311)
            Median                                 19.763           0.353            19.151           -1.186           19.884           -0.646    
            Min - Max                           9.88 - 34.50    -17.00 - 18.79   11.49 - 31.98    -16.58 - 17.23    7.76 - 29.31    -12.13 - 15.30
          WEEK 5 DAY 36                                                                                                                           
            n                                       134              134              134              134              132              132      
            Mean (SD)                          20.418 (3.925)   0.632 (6.053)    19.859 (4.223)   -0.294 (6.315)   19.990 (4.169)   -0.460 (5.570)
            Median                                 20.718           0.926            20.113           0.728            20.503           -0.990    
            Min - Max                          10.95 - 30.17    -16.03 - 16.09   10.32 - 29.06    -19.04 - 12.64    7.41 - 27.78    -15.62 - 16.61
        C-Reactive Protein Measurement                                                                                                            
          BASELINE                                                                                                                                
            n                                       134                               134                               132                       
            Mean (SD)                          0.974 (0.236)                     1.002 (0.197)                     1.005 (0.210)                  
            Median                                 0.989                             1.003                             0.996                      
            Min - Max                           0.47 - 1.63                       0.50 - 1.58                       0.51 - 1.56                   
          WEEK 1 DAY 8                                                                                                                            
            n                                       134              134              134              134              132              132      
            Mean (SD)                          1.047 (0.202)    0.073 (0.312)    1.007 (0.220)    0.005 (0.289)    1.006 (0.234)    0.001 (0.327) 
            Median                                 1.031            0.074            1.031            0.015            1.017            -0.008    
            Min - Max                           0.46 - 1.57      -0.71 - 1.03     0.42 - 1.43      -0.78 - 0.93     0.44 - 1.53      -0.80 - 0.75 
          WEEK 2 DAY 15                                                                                                                           
            n                                       134              134              134              134              132              132      
            Mean (SD)                          0.994 (0.207)    0.020 (0.314)    1.022 (0.186)    0.020 (0.267)    0.978 (0.206)    -0.027 (0.278)
            Median                                 1.011            0.012            1.038            0.021            0.967            -0.035    
            Min - Max                           0.48 - 1.48      -0.85 - 0.76     0.52 - 1.44      -0.55 - 0.68     0.27 - 1.51      -0.76 - 0.50 
          WEEK 3 DAY 22                                                                                                                           
            n                                       134              134              134              134              132              132      
            Mean (SD)                          1.002 (0.208)    0.028 (0.309)    0.982 (0.188)    -0.020 (0.266)   0.995 (0.191)    -0.010 (0.301)
            Median                                 0.998            0.078            0.969            0.004            0.987            -0.029    
            Min - Max                           0.42 - 1.48      -0.92 - 0.79     0.52 - 1.44      -0.77 - 0.75     0.50 - 1.57      -0.72 - 0.86 
          WEEK 4 DAY 29                                                                                                                           
            n                                       134              134              134              134              132              132      
            Mean (SD)                          1.040 (0.203)    0.067 (0.306)    0.987 (0.205)    -0.015 (0.278)   0.994 (0.190)    -0.011 (0.289)
            Median                                 1.056            0.079            0.970            -0.032           1.004            0.018     
            Min - Max                           0.54 - 1.53      -0.78 - 1.04     0.43 - 1.43      -0.62 - 0.59     0.55 - 1.46      -0.82 - 0.82 
          WEEK 5 DAY 36                                                                                                                           
            n                                       134              134              134              134              132              132      
            Mean (SD)                          0.993 (0.219)    0.019 (0.334)    1.021 (0.190)    0.019 (0.282)    0.976 (0.191)    -0.029 (0.290)
            Median                                 0.981            -0.006           1.006            0.011            0.980            -0.037    
            Min - Max                           0.40 - 1.49      -1.00 - 0.84     0.58 - 1.51      -0.64 - 0.83     0.55 - 1.59      -0.84 - 0.79 
        Immunoglobulin A Measurement                                                                                                              
          BASELINE                                                                                                                                
            n                                       134                               134                               132                       
            Mean (SD)                          1.996 (0.372)                     1.987 (0.415)                     2.015 (0.453)                  
            Median                                 1.934                             1.964                             1.987                      
            Min - Max                           1.19 - 2.80                       0.79 - 3.07                       0.80 - 3.00                   
          WEEK 1 DAY 8                                                                                                                            
            n                                       134              134              134              134              132              132      
            Mean (SD)                          1.970 (0.404)    -0.026 (0.534)   2.056 (0.409)    0.069 (0.562)    2.038 (0.421)    0.022 (0.645) 
            Median                                 1.989            -0.007           2.026            0.077            2.055            0.023     
            Min - Max                           0.97 - 2.97      -1.42 - 1.08     1.06 - 3.23      -1.27 - 1.78     0.81 - 3.05      -1.49 - 1.55 
          WEEK 2 DAY 15                                                                                                                           
            n                                       134              134              134              134              132              132      
            Mean (SD)                          2.036 (0.393)    0.040 (0.576)    1.994 (0.417)    0.007 (0.583)    1.969 (0.374)    -0.046 (0.602)
            Median                                 1.989            0.068            2.034            0.047            1.978            -0.010    
            Min - Max                           1.17 - 3.09      -1.29 - 1.61     0.89 - 2.99      -1.48 - 1.38     0.97 - 2.75      -1.64 - 1.45 
          WEEK 3 DAY 22                                                                                                                           
            n                                       134              134              134              134              132              132      
            Mean (SD)                          1.974 (0.402)    -0.022 (0.519)   1.999 (0.396)    0.012 (0.577)    2.048 (0.391)    0.033 (0.602) 
            Median                                 1.964            0.023            1.957            0.039            2.056            0.013     
            Min - Max                           0.71 - 2.81      -1.44 - 1.21     0.75 - 2.89      -1.60 - 1.21     0.99 - 2.99      -1.81 - 1.23 
          WEEK 4 DAY 29                                                                                                                           
            n                                       134              134              134              134              132              132      
            Mean (SD)                          1.962 (0.384)    -0.035 (0.543)   1.955 (0.381)    -0.032 (0.551)   1.979 (0.420)    -0.037 (0.622)
            Median                                 2.025            -0.001           1.945            0.028            1.993            -0.068    
            Min - Max                           0.80 - 2.73      -1.53 - 1.33     1.07 - 2.81      -1.38 - 1.09     0.99 - 2.95      -1.35 - 1.59 
          WEEK 5 DAY 36                                                                                                                           
            n                                       134              134              134              134              132              132      
            Mean (SD)                          1.983 (0.384)    -0.013 (0.505)   2.018 (0.433)    0.031 (0.635)    1.965 (0.427)    -0.050 (0.609)
            Median                                 1.961            -0.012           1.987            0.071            2.009            0.034     
            Min - Max                           1.04 - 3.07      -1.69 - 1.28     0.92 - 3.35      -1.38 - 1.64     0.62 - 2.88      -1.60 - 1.32 

# lbt04_1 functions with default argument value return expected result with test data

    Code
      res
    Output
          Laboratory Test                          A: Drug X      B: Placebo     C: Combination
            Direction of Abnormality                (N=134)         (N=134)         (N=132)    
        ———————————————————————————————————————————————————————————————————————————————————————
        CHEMISTRY                                                                              
          Alanine Aminotransferase Measurement                                                 
            Low                                  10/70 (14.3%)   7/65 (10.8%)     6/67 (9.0%)  
            High                                  6/70 (8.6%)    6/59 (10.2%)     5/69 (7.2%)  
          C-Reactive Protein Measurement                                                       
            Low                                  7/70 (10.0%)     6/78 (7.7%)     9/65 (13.8%) 
            High                                 7/67 (10.4%)    7/69 (10.1%)     3/62 (4.8%)  
          Immunoglobulin A Measurement                                                         
            Low                                   5/52 (9.6%)    10/64 (15.6%)    8/67 (11.9%) 
            High                                 7/50 (14.0%)    8/63 (12.7%)     8/67 (11.9%) 
        COAGULATION                                                                            
          Alanine Aminotransferase Measurement                                                 
            Low                                   6/69 (8.7%)     5/67 (7.5%)     6/64 (9.4%)  
            High                                 12/67 (17.9%)   7/64 (10.9%)     6/62 (9.7%)  
          C-Reactive Protein Measurement                                                       
            Low                                  8/65 (12.3%)    7/68 (10.3%)     6/67 (9.0%)  
            High                                 8/63 (12.7%)     5/66 (7.6%)     6/61 (9.8%)  
          Immunoglobulin A Measurement                                                         
            Low                                  8/60 (13.3%)    8/69 (11.6%)     2/66 (3.0%)  
            High                                  6/62 (9.7%)    8/78 (10.3%)     2/64 (3.1%)  
        HEMATOLOGY                                                                             
          Alanine Aminotransferase Measurement                                                 
            Low                                   4/59 (6.8%)     5/63 (7.9%)    10/71 (14.1%) 
            High                                 6/58 (10.3%)    7/60 (11.7%)     8/68 (11.8%) 
          C-Reactive Protein Measurement                                                       
            Low                                  9/70 (12.9%)    6/57 (10.5%)    12/75 (16.0%) 
            High                                  4/63 (6.3%)     3/53 (5.7%)    11/67 (16.4%) 
          Immunoglobulin A Measurement                                                         
            Low                                   6/69 (8.7%)    8/67 (11.9%)     9/60 (15.0%) 
            High                                 9/71 (12.7%)     4/68 (5.9%)    11/63 (17.5%) 

# lbt05_1 functions with default argument value return expected result with test data

    Code
      res
    Output
        Laboratory Test                            A: Drug X   B: Placebo   C: Combination
            Direction of Abnormality                (N=134)     (N=134)        (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement (n)      129         128            127      
          Low                                                                             
            Single, not last                       1 (0.8%)     2 (1.6%)       2 (1.6%)   
            Last or replicated                     4 (3.1%)    11 (8.6%)       3 (2.4%)   
            Any Abnormality                        5 (3.9%)    13 (10.2%)      5 (3.9%)   
          High                                                                            
            Single, not last                       4 (3.1%)     4 (3.1%)       1 (0.8%)   
            Last or replicated                     5 (3.9%)     8 (6.2%)       6 (4.7%)   
            Any Abnormality                        9 (7.0%)    12 (9.4%)       7 (5.5%)   
        C-Reactive Protein Measurement (n)            128         123            123      
          Low                                                                             
            Single, not last                       1 (0.8%)        0           3 (2.4%)   
            Last or replicated                     11 (8.6%)    7 (5.7%)       4 (3.3%)   
            Any Abnormality                        12 (9.4%)    7 (5.7%)       7 (5.7%)   
          High                                                                            
            Single, not last                       2 (1.6%)     1 (0.8%)       2 (1.6%)   
            Last or replicated                     9 (7.0%)    10 (8.1%)      11 (8.9%)   
            Any Abnormality                        11 (8.6%)   11 (8.9%)      13 (10.6%)  
        Immunoglobulin A Measurement (n)              126         125            119      
          Low                                                                             
            Single, not last                       1 (0.8%)     3 (2.4%)       4 (3.4%)   
            Last or replicated                     6 (4.8%)     6 (4.8%)       7 (5.9%)   
            Any Abnormality                        7 (5.6%)     9 (7.2%)      11 (9.2%)   
          High                                                                            
            Single, not last                       1 (0.8%)     1 (0.8%)       2 (1.7%)   
            Last or replicated                     3 (2.4%)     8 (6.4%)       4 (3.4%)   
            Any Abnormality                        4 (3.2%)     9 (7.2%)       6 (5.0%)   

# lbt07_1 functions with default argument value return expected result with test data

    Code
      res
    Output
        Parameter                                                                          
          Direction of Abnormality                 A: Drug X    B: Placebo   C: Combination
                    Highest NCI CTCAE Grade         (N=134)      (N=134)        (N=132)    
        ———————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement (n)      134          133            132      
          LOW                                                                              
                    1                              14 (10.4%)   15 (11.3%)     10 (7.6%)   
                    2                              13 (9.7%)    18 (13.5%)     11 (8.3%)   
                    3                              20 (14.9%)   12 (9.0%)      10 (7.6%)   
                    4                               7 (5.2%)     8 (6.0%)      10 (7.6%)   
                    Any                            54 (40.3%)   53 (39.8%)     41 (31.1%)  
          HIGH                                                                             
                    1                              18 (13.4%)   16 (12.0%)     18 (13.6%)  
                    2                              15 (11.2%)   13 (9.8%)      17 (12.9%)  
                    3                              10 (7.5%)    16 (12.0%)     13 (9.8%)   
                    4                              12 (9.0%)    11 (8.3%)      13 (9.8%)   
                    Any                            55 (41.0%)   56 (42.1%)     61 (46.2%)  
        C-Reactive Protein Measurement (n)            134          134            132      
          LOW                                                                              
                    1                              16 (11.9%)   19 (14.2%)     15 (11.4%)  
                    2                              21 (15.7%)   13 (9.7%)      16 (12.1%)  
                    3                              12 (9.0%)     9 (6.7%)      18 (13.6%)  
                    4                              11 (8.2%)     7 (5.2%)       5 (3.8%)   
                    Any                            60 (44.8%)   48 (35.8%)     54 (40.9%)  
          HIGH                                                                             
                    1                              17 (12.7%)   15 (11.2%)      9 (6.8%)   
                    2                              15 (11.2%)   16 (11.9%)     13 (9.8%)   
                    3                              16 (11.9%)   12 (9.0%)      14 (10.6%)  
                    4                              12 (9.0%)    12 (9.0%)      10 (7.6%)   
                    Any                            60 (44.8%)   55 (41.0%)     46 (34.8%)  
        Immunoglobulin A Measurement (n)              133          133            132      
          LOW                                                                              
                    1                              17 (12.8%)   23 (17.3%)     17 (12.9%)  
                    2                              12 (9.0%)    15 (11.3%)     14 (10.6%)  
                    3                              15 (11.3%)   11 (8.3%)      14 (10.6%)  
                    4                              10 (7.5%)    16 (12.0%)     10 (7.6%)   
                    Any                            54 (40.6%)   65 (48.9%)     55 (41.7%)  
          HIGH                                                                             
                    1                              25 (18.8%)   14 (10.5%)     13 (9.8%)   
                    2                              14 (10.5%)   19 (14.3%)     16 (12.1%)  
                    3                              12 (9.0%)    12 (9.0%)      17 (12.9%)  
                    4                              11 (8.3%)    13 (9.8%)       4 (3.0%)   
                    Any                            62 (46.6%)   58 (43.6%)     50 (37.9%)  

# lbt14_1 functions with default argument value return expected result with test data

    Code
      res
    Output
      LBT14 - Low Direction
      
      
        ——————————————————————————————————————————————————————————————————————————————————————
        Parameter                                                                             
              Baseline NCI-CTCAE Grade                A: Drug X    B: Placebo   C: Combination
                      Post-baseline NCI-CTCAE Grade    (N=134)      (N=134)        (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                                  
              Not Low                                    124          122            117      
                      Not Low                         74 (59.7%)   76 (62.3%)     80 (68.4%)  
                      1                               13 (10.5%)   12 (9.8%)       9 (7.7%)   
                      2                               13 (10.5%)   16 (13.1%)     11 (9.4%)   
                      3                               17 (13.7%)   11 (9.0%)       9 (7.7%)   
                      4                                7 (5.6%)     7 (5.7%)       8 (6.8%)   
              1                                           3            6              7       
                      Not Low                             0        2 (33.3%)      5 (71.4%)   
                      1                               1 (33.3%)    2 (33.3%)          0       
                      2                                   0        1 (16.7%)          0       
                      3                               2 (66.7%)    1 (16.7%)          0       
                      4                                   0            0          2 (28.6%)   
              2                                           2            1              4       
                      Not Low                          2 (100%)        0          3 (75.0%)   
                      2                                   0         1 (100%)          0       
                      3                                   0            0          1 (25.0%)   
              3                                           2            3              4       
                      Not Low                          2 (100%)    2 (66.7%)      3 (75.0%)   
                      1                                   0        1 (33.3%)      1 (25.0%)   
              4                                           3            2              0       
                      Not Low                         2 (66.7%)    1 (50.0%)          0       
                      3                               1 (33.3%)        0              0       
                      4                                   0        1 (50.0%)          0       
        C-Reactive Protein Measurement                                                        
              Not Low                                    122          125            120      
                      Not Low                         67 (54.9%)   81 (64.8%)     70 (58.3%)  
                      1                               14 (11.5%)   17 (13.6%)     13 (10.8%)  
                      2                               20 (16.4%)   11 (8.8%)      16 (13.3%)  
                      3                               12 (9.8%)     9 (7.2%)      17 (14.2%)  
                      4                                9 (7.4%)     7 (5.6%)       4 (3.3%)   
              1                                           2            5              5       
                      Not Low                             0        3 (60.0%)      4 (80.0%)   
                      1                                   0        1 (20.0%)      1 (20.0%)   
                      2                               1 (50.0%)    1 (20.0%)          0       
                      4                               1 (50.0%)        0              0       
              2                                           5            1              1       
                      Not Low                         3 (60.0%)        0           1 (100%)   
                      1                               2 (40.0%)        0              0       
                      2                                   0         1 (100%)          0       
              3                                           2            2              1       
                      Not Low                          2 (100%)    1 (50.0%)          0       
                      1                                   0        1 (50.0%)          0       
                      3                                   0            0           1 (100%)   
              4                                           3            1              5       
                      Not Low                         2 (66.7%)     1 (100%)      3 (60.0%)   
                      1                                   0            0          1 (20.0%)   
                      4                               1 (33.3%)        0          1 (20.0%)   
        Immunoglobulin A Measurement                                                          
              Not Low                                    120          119            120      
                      Not Low                         69 (57.5%)   58 (48.7%)     70 (58.3%)  
                      1                               16 (13.3%)   20 (16.8%)     16 (13.3%)  
                      2                               12 (10.0%)   14 (11.8%)     14 (11.7%)  
                      3                               14 (11.7%)   11 (9.2%)      13 (10.8%)  
                      4                                9 (7.5%)    16 (13.4%)      7 (5.8%)   
              1                                           8            8              3       
                      Not Low                         7 (87.5%)    4 (50.0%)      2 (66.7%)   
                      1                               1 (12.5%)    3 (37.5%)          0       
                      2                                   0        1 (12.5%)          0       
                      4                                   0            0          1 (33.3%)   
              2                                           2            1              2       
                      Not Low                          2 (100%)     1 (100%)       2 (100%)   
              3                                           3            3              4       
                      Not Low                         1 (33.3%)     3 (100%)      2 (50.0%)   
                      1                                   0            0          1 (25.0%)   
                      3                               1 (33.3%)        0              0       
                      4                               1 (33.3%)        0          1 (25.0%)   
              4                                           1            3              3       
                      Not Low                          1 (100%)     3 (100%)      1 (33.3%)   
                      3                                   0            0          1 (33.3%)   
                      4                                   0            0          1 (33.3%)   

# lbt14_2 functions with default argument value return expected result with test data

    Code
      res
    Output
      LBT14 - High Direction
      
      
        ——————————————————————————————————————————————————————————————————————————————————————
        Parameter                                                                             
              Baseline NCI-CTCAE Grade                A: Drug X    B: Placebo   C: Combination
                      Post-baseline NCI-CTCAE Grade    (N=134)      (N=134)        (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                                  
              Not High                                   121          118            118      
                      Not High                        72 (59.5%)   70 (59.3%)     59 (50.0%)  
                      1                               16 (13.2%)   13 (11.0%)     17 (14.4%)  
                      2                               13 (10.7%)   12 (10.2%)     18 (15.3%)  
                      3                                9 (7.4%)    14 (11.9%)     12 (10.2%)  
                      4                               11 (9.1%)     9 (7.6%)      12 (10.2%)  
              1                                           4            4              3       
                      Not High                        1 (25.0%)    1 (25.0%)      2 (66.7%)   
                      1                               1 (25.0%)        0              0       
                      2                               1 (25.0%)        0              0       
                      3                                   0        1 (25.0%)      1 (33.3%)   
                      4                               1 (25.0%)    2 (50.0%)          0       
              2                                           4            4              4       
                      Not High                        3 (75.0%)    3 (75.0%)      3 (75.0%)   
                      1                                   0        1 (25.0%)      1 (25.0%)   
                      2                               1 (25.0%)        0              0       
              3                                           2            5              5       
                      Not High                         2 (100%)    2 (40.0%)      4 (80.0%)   
                      1                                   0        2 (40.0%)          0       
                      2                                   0        1 (20.0%)          0       
                      4                                   0            0          1 (20.0%)   
              4                                           3            3              2       
                      Not High                        1 (33.3%)    2 (66.7%)       2 (100%)   
                      1                               1 (33.3%)        0              0       
                      3                               1 (33.3%)    1 (33.3%)          0       
        C-Reactive Protein Measurement                                                        
              Not High                                   115          115            114      
                      Not High                        60 (52.2%)   68 (59.1%)     70 (61.4%)  
                      1                               17 (14.8%)   13 (11.3%)      9 (7.9%)   
                      2                               12 (10.4%)   14 (12.2%)     13 (11.4%)  
                      3                               16 (13.9%)   10 (8.7%)      13 (11.4%)  
                      4                               10 (8.7%)    10 (8.7%)       9 (7.9%)   
              1                                           5            5              5       
                      Not High                        4 (80.0%)    3 (60.0%)       5 (100%)   
                      2                                   0        2 (40.0%)          0       
                      4                               1 (20.0%)        0              0       
              2                                           6            5              5       
                      Not High                        3 (50.0%)    3 (60.0%)      4 (80.0%)   
                      1                                   0        1 (20.0%)          0       
                      2                               2 (33.3%)        0              0       
                      4                               1 (16.7%)    1 (20.0%)      1 (20.0%)   
              3                                           2            3              5       
                      Not High                         2 (100%)    1 (33.3%)      4 (80.0%)   
                      3                                   0        1 (33.3%)      1 (20.0%)   
                      4                                   0        1 (33.3%)          0       
              4                                           6            6              3       
                      Not High                        5 (83.3%)    4 (66.7%)       3 (100%)   
                      1                                   0        1 (16.7%)          0       
                      2                               1 (16.7%)        0              0       
                      3                                   0        1 (16.7%)          0       
        Immunoglobulin A Measurement                                                          
              Not High                                   119          123            119      
                      Not High                        61 (51.3%)   69 (56.1%)     74 (62.2%)  
                      1                               24 (20.2%)   12 (9.8%)      13 (10.9%)  
                      2                               13 (10.9%)   20 (16.3%)     12 (10.1%)  
                      3                               11 (9.2%)    11 (8.9%)      16 (13.4%)  
                      4                               10 (8.4%)    11 (8.9%)       4 (3.4%)   
              1                                           2            4              6       
                      Not High                         2 (100%)    2 (50.0%)      5 (83.3%)   
                      2                                   0            0          1 (16.7%)   
                      4                                   0        2 (50.0%)          0       
              2                                           4            4              3       
                      Not High                        3 (75.0%)    2 (50.0%)      1 (33.3%)   
                      1                                   0        2 (50.0%)          0       
                      2                                   0            0          1 (33.3%)   
                      3                                   0            0          1 (33.3%)   
                      4                               1 (25.0%)        0              0       
              3                                           5            2              2       
                      Not High                        3 (60.0%)        0          1 (50.0%)   
                      1                               1 (20.0%)        0              0       
                      2                                   0            0          1 (50.0%)   
                      3                               1 (20.0%)     2 (100%)          0       
              4                                           4            1              2       
                      Not High                        3 (75.0%)     1 (100%)      1 (50.0%)   
                      2                               1 (25.0%)        0          1 (50.0%)   

# mht01_1 functions with default argument value return expected result with test data

    Code
      res
    Output
        MedDRA System Organ Class                                 A: Drug X    B: Placebo    C: Combination
          MedDRA Preferred Term                                    (N=134)       (N=134)        (N=132)    
        ———————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one condition     122 (91.0%)   123 (91.8%)    120 (90.9%)  
        Total number of conditions                                   609           622            703      
        cl A                                                                                               
          Total number of patients with at least one condition   78 (58.2%)    75 (56.0%)      89 (67.4%)  
          Total number of conditions                                 132           130            160      
          trm A_1/2                                              50 (37.3%)    45 (33.6%)      63 (47.7%)  
          trm A_2/2                                              48 (35.8%)    48 (35.8%)      50 (37.9%)  
        cl B                                                                                               
          Total number of patients with at least one condition   96 (71.6%)    89 (66.4%)      97 (73.5%)  
          Total number of conditions                                 185           198            205      
          trm B_3/3                                              48 (35.8%)    54 (40.3%)      51 (38.6%)  
          trm B_2/3                                              49 (36.6%)    44 (32.8%)      52 (39.4%)  
          trm B_1/3                                              47 (35.1%)    49 (36.6%)      43 (32.6%)  
        cl C                                                                                               
          Total number of patients with at least one condition   67 (50.0%)    75 (56.0%)      79 (59.8%)  
          Total number of conditions                                 103           116            129      
          trm C_2/2                                              35 (26.1%)    48 (35.8%)      55 (41.7%)  
          trm C_1/2                                              43 (32.1%)    46 (34.3%)      43 (32.6%)  
        cl D                                                                                               
          Total number of patients with at least one condition   96 (71.6%)    90 (67.2%)      98 (74.2%)  
          Total number of conditions                                 189           178            209      
          trm D_3/3                                              47 (35.1%)    58 (43.3%)      57 (43.2%)  
          trm D_1/3                                              50 (37.3%)    42 (31.3%)      51 (38.6%)  
          trm D_2/3                                              48 (35.8%)    42 (31.3%)      50 (37.9%)  

# vst01_1 functions with default argument value return expected result with test data

    Code
      res
    Output
        Parameter                            A: Drug X                      B: Placebo                    C: Combination        
          Analysis Visit                            Change from                     Change from                     Change from 
                                   Value at Visit     Baseline     Value at Visit     Baseline     Value at Visit     Baseline  
        ————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
        Diastolic Blood Pressure                                                                                                
          SCREENING                                                                                                             
            n                           134              0              134              0              132              0      
            Mean (SD)                50.0 (7.2)          NA          50.8 (8.4)          NA          50.2 (7.6)          NA     
            Median                      49.7             NA             50.1             NA             49.6             NA     
            Min - Max               31.7 - 71.2          NA         29.3 - 69.2          NA         26.9 - 70.0          NA     
          BASELINE                                                                                                              
            n                           134             134             134             134             132             132     
            Mean (SD)                48.6 (8.0)      0.0 (0.0)       50.4 (7.9)      0.0 (0.0)       51.1 (7.8)      0.0 (0.0)  
            Median                      48.4            0.0             50.2            0.0             50.8            0.0     
            Min - Max               27.7 - 64.6      0.0 - 0.0      21.7 - 67.5      0.0 - 0.0      29.7 - 71.4      0.0 - 0.0  
          WEEK 1 DAY 8                                                                                                          
            n                           134             134             134             134             132             132     
            Mean (SD)                50.3 (7.5)      1.7 (10.8)      49.7 (7.7)     -0.8 (10.9)      48.9 (7.9)     -2.3 (10.4) 
            Median                      50.1            0.6             49.7            -1.1            47.7            -2.2    
            Min - Max               33.0 - 69.0     -20.4 - 29.9    33.7 - 66.5     -25.8 - 28.4    30.4 - 67.0     -22.1 - 22.4
          WEEK 2 DAY 15                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                50.8 (7.8)      2.2 (11.8)      49.7 (8.4)     -0.7 (12.4)      50.0 (8.3)     -1.1 (11.6) 
            Median                      51.4            3.1             50.2            -0.7            51.0            -2.3    
            Min - Max               31.9 - 70.3     -23.9 - 39.2    30.6 - 68.1     -28.4 - 37.0    24.8 - 65.6     -29.2 - 30.7
          WEEK 3 DAY 22                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                50.7 (7.8)      2.1 (10.9)      49.1 (7.9)     -1.3 (11.1)      49.9 (7.7)     -1.2 (10.9) 
            Median                      50.2            2.6             49.5            -2.3            50.0            -0.6    
            Min - Max               29.1 - 74.9     -25.8 - 30.7    24.5 - 67.1     -28.1 - 33.9    31.5 - 68.5     -29.7 - 27.0
          WEEK 4 DAY 29                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                50.1 (8.1)      1.5 (10.9)      49.6 (7.1)     -0.8 (10.6)      49.7 (8.0)     -1.4 (11.0) 
            Median                      49.3            1.2             49.2            -0.8            49.8            -0.2    
            Min - Max               29.4 - 71.4     -30.9 - 24.8    32.7 - 67.0     -33.2 - 35.9    28.7 - 68.4     -35.5 - 28.4
          WEEK 5 DAY 36                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                50.6 (7.5)      2.0 (11.2)      48.4 (8.0)     -2.1 (11.7)      49.1 (7.6)     -2.0 (10.7) 
            Median                      49.4            1.6             47.7            -2.9            49.2            -2.2    
            Min - Max               35.1 - 72.2     -25.2 - 31.5    30.4 - 70.6     -31.2 - 29.2    30.6 - 72.9     -30.5 - 34.6
        Pulse Rate                                                                                                              
          SCREENING                                                                                                             
            n                           134              0              134              0              132              0      
            Mean (SD)                49.6 (9.0)          NA          49.4 (8.4)          NA          49.3 (8.6)          NA     
            Median                      49.9             NA             48.9             NA             48.6             NA     
            Min - Max               25.9 - 68.8          NA         30.5 - 80.5          NA         26.5 - 67.5          NA     
          BASELINE                                                                                                              
            n                           134             134             134             134             132             132     
            Mean (SD)                51.9 (8.1)      0.0 (0.0)       50.3 (8.8)      0.0 (0.0)       50.3 (9.4)      0.0 (0.0)  
            Median                      51.2            0.0             51.2            0.0             50.7            0.0     
            Min - Max               28.5 - 72.9      0.0 - 0.0      26.9 - 67.3      0.0 - 0.0      27.8 - 71.2      0.0 - 0.0  
          WEEK 1 DAY 8                                                                                                          
            n                           134             134             134             134             132             132     
            Mean (SD)                50.1 (8.3)     -1.8 (11.6)      49.3 (7.5)     -1.0 (11.6)      49.8 (7.7)     -0.5 (12.6) 
            Median                      49.9            -2.7            48.8            -2.2            49.5            -1.5    
            Min - Max               26.7 - 69.4     -26.4 - 29.6    30.7 - 67.8     -29.5 - 32.1    30.1 - 72.9     -25.1 - 33.3
          WEEK 2 DAY 15                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                49.7 (8.8)     -2.2 (12.4)      50.8 (7.6)      0.6 (11.8)      49.1 (7.7)     -1.2 (11.3) 
            Median                      49.2            -3.0            50.3            0.1             49.2            -1.1    
            Min - Max               26.0 - 69.6     -37.6 - 26.4    33.3 - 70.3     -28.9 - 37.7    32.2 - 73.6     -33.7 - 26.3
          WEEK 3 DAY 22                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                50.5 (7.4)     -1.4 (11.1)      49.9 (7.8)     -0.4 (11.0)      49.8 (7.2)     -0.5 (12.1) 
            Median                      50.6            -1.1            49.4            -0.8            49.6            -2.3    
            Min - Max               27.7 - 73.0     -30.0 - 26.5    27.8 - 71.0     -26.5 - 33.4    27.9 - 67.5     -28.7 - 28.0
          WEEK 4 DAY 29                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                49.0 (8.3)     -2.9 (11.1)      50.0 (8.4)     -0.3 (12.0)      51.0 (7.7)      0.7 (11.6) 
            Median                      48.8            -3.0            49.9            -0.4            51.4            0.7     
            Min - Max               32.3 - 78.4     -28.4 - 30.4    30.4 - 79.8     -29.1 - 28.3    31.4 - 70.3     -30.6 - 25.1
          WEEK 5 DAY 36                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                48.4 (8.5)     -3.5 (11.6)      50.3 (7.2)      0.0 (11.2)      49.7 (7.6)     -0.5 (12.4) 
            Median                      47.7            -4.0            50.3            -1.5            49.1            -2.7    
            Min - Max               25.0 - 75.7     -41.3 - 31.5    29.4 - 67.7     -24.9 - 27.3    35.3 - 73.7     -24.6 - 34.0
        Respiratory Rate                                                                                                        
          SCREENING                                                                                                             
            n                           134              0              134              0              132              0      
            Mean (SD)                49.2 (8.2)          NA          50.3 (8.3)          NA          49.6 (8.4)          NA     
            Median                      49.3             NA             49.9             NA             50.1             NA     
            Min - Max               26.0 - 74.4          NA         31.4 - 69.2          NA         24.3 - 67.9          NA     
          BASELINE                                                                                                              
            n                           134             134             134             134             132             132     
            Mean (SD)                49.4 (8.1)      0.0 (0.0)       51.1 (8.2)      0.0 (0.0)       50.8 (8.4)      0.0 (0.0)  
            Median                      49.8            0.0             50.5            0.0             51.1            0.0     
            Min - Max               29.3 - 69.3      0.0 - 0.0      31.2 - 74.5      0.0 - 0.0      26.2 - 71.0      0.0 - 0.0  
          WEEK 1 DAY 8                                                                                                          
            n                           134             134             134             134             132             132     
            Mean (SD)                49.5 (8.0)      0.1 (11.6)      50.0 (7.9)     -1.1 (11.5)      51.0 (7.8)      0.2 (11.1) 
            Median                      49.3            0.2             49.1            -1.6            51.1            0.4     
            Min - Max               24.1 - 66.1     -31.6 - 32.1    25.0 - 67.7     -29.1 - 30.9    29.9 - 69.8     -23.6 - 27.7
          WEEK 2 DAY 15                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                49.7 (7.7)      0.3 (9.7)       50.4 (8.7)     -0.8 (12.1)      49.3 (8.5)     -1.4 (12.0) 
            Median                      49.2            1.4             49.7            -1.6            50.2            -1.6    
            Min - Max               30.8 - 71.3     -24.9 - 27.6    28.5 - 77.0     -29.0 - 28.9    22.4 - 67.6     -43.8 - 27.0
          WEEK 3 DAY 22                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                50.6 (8.2)      1.2 (11.7)      50.2 (6.9)     -1.0 (10.1)      49.1 (7.3)     -1.6 (11.1) 
            Median                      50.5            0.7             49.7            -0.7            49.6            -0.9    
            Min - Max               33.2 - 70.8     -33.5 - 33.3    32.3 - 67.8     -29.6 - 22.2    27.4 - 63.3     -25.4 - 33.6
          WEEK 4 DAY 29                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                49.4 (7.7)      0.0 (10.9)      49.9 (7.8)     -1.2 (11.0)      50.8 (7.8)      0.1 (11.1) 
            Median                      48.9            -1.4            48.9            -2.4            50.4            -0.6    
            Min - Max               25.9 - 69.7     -25.9 - 40.3    33.7 - 68.5     -25.0 - 29.2    31.9 - 72.0     -27.6 - 31.1
          WEEK 5 DAY 36                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                49.9 (7.7)      0.5 (11.5)      50.6 (8.2)     -0.5 (12.0)      49.9 (7.9)     -0.8 (10.6) 
            Median                      49.8            -0.2            50.3            -0.6            49.6            -1.7    
            Min - Max               34.3 - 70.7     -30.3 - 37.2    28.4 - 69.8     -29.4 - 23.8    29.8 - 68.4     -21.3 - 22.3
        Systolic Blood Pressure                                                                                                 
          SCREENING                                                                                                             
            n                           134              0              134              0              132              0      
            Mean (SD)                49.6 (8.3)          NA          50.3 (8.3)          NA          50.9 (7.8)          NA     
            Median                      49.6             NA             50.2             NA             50.8             NA     
            Min - Max               24.0 - 70.9          NA         26.2 - 79.1          NA         27.6 - 67.4          NA     
          BASELINE                                                                                                              
            n                           134             134             134             134             132             132     
            Mean (SD)                49.4 (8.5)      0.0 (0.0)       50.2 (8.5)      0.0 (0.0)       48.5 (7.2)      0.0 (0.0)  
            Median                      48.3            0.0             50.0            0.0             49.2            0.0     
            Min - Max               24.3 - 71.1      0.0 - 0.0      24.4 - 71.1      0.0 - 0.0      26.2 - 63.4      0.0 - 0.0  
          WEEK 1 DAY 8                                                                                                          
            n                           134             134             134             134             132             132     
            Mean (SD)                50.7 (9.2)      1.3 (12.8)      49.3 (8.7)     -1.0 (11.2)      49.6 (8.0)      1.2 (10.2) 
            Median                      49.5            0.1             48.3            -1.7            49.8            0.1     
            Min - Max               29.8 - 79.0     -29.5 - 37.6    33.0 - 74.0     -27.6 - 24.8    25.5 - 68.6     -22.8 - 31.3
          WEEK 2 DAY 15                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                49.4 (8.5)     -0.0 (11.9)      49.4 (7.0)     -0.9 (11.0)      49.3 (7.7)      0.8 (9.7)  
            Median                      49.5            -0.2            49.4            -0.9            48.3            -0.2    
            Min - Max               24.2 - 65.4     -39.1 - 32.7    27.6 - 69.2     -37.1 - 33.9    29.4 - 74.7     -24.9 - 29.0
          WEEK 3 DAY 22                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                49.7 (7.8)      0.3 (11.4)      49.0 (7.8)     -1.2 (12.1)      50.5 (8.3)      2.0 (11.1) 
            Median                      50.1            1.5             48.8            -1.2            51.7            2.0     
            Min - Max               31.3 - 70.3     -27.5 - 27.1    15.6 - 66.2     -35.6 - 36.4    29.6 - 69.4     -29.7 - 30.6
          WEEK 4 DAY 29                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                49.4 (7.6)      0.0 (11.5)      49.4 (8.6)     -0.8 (12.6)      50.7 (7.4)      2.2 (10.5) 
            Median                      49.8            0.6             49.9            -1.3            50.8            3.0     
            Min - Max               22.9 - 69.6     -32.3 - 28.5    22.1 - 72.1     -29.7 - 38.1    29.7 - 65.1     -28.8 - 34.1
          WEEK 5 DAY 36                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                49.4 (7.9)     -0.0 (11.9)      50.2 (8.7)     -0.0 (11.8)      50.4 (8.2)      1.9 (10.5) 
            Median                      49.6            0.7             49.9            0.2             50.8            2.4     
            Min - Max               26.1 - 69.7     -39.2 - 33.9    27.9 - 74.2     -27.7 - 36.2    34.3 - 74.5     -23.7 - 32.4
        Temperature                                                                                                             
          SCREENING                                                                                                             
            n                           134              0              134              0              132              0      
            Mean (SD)                48.9 (9.4)          NA          50.1 (7.9)          NA          50.2 (8.4)          NA     
            Median                      49.6             NA             50.1             NA             49.8             NA     
            Min - Max               29.0 - 75.2          NA         29.9 - 73.4          NA         30.5 - 72.3          NA     
          BASELINE                                                                                                              
            n                           134             134             134             134             132             132     
            Mean (SD)                49.7 (8.3)      0.0 (0.0)       50.9 (7.4)      0.0 (0.0)       49.1 (8.2)      0.0 (0.0)  
            Median                      50.4            0.0             51.5            0.0             48.7            0.0     
            Min - Max               29.0 - 69.1      0.0 - 0.0      30.7 - 67.7      0.0 - 0.0      20.6 - 70.5      0.0 - 0.0  
          WEEK 1 DAY 8                                                                                                          
            n                           134             134             134             134             132             132     
            Mean (SD)                51.6 (8.1)      1.9 (11.8)      49.5 (8.2)      -1.4 (9.9)      49.8 (7.6)      0.6 (11.2) 
            Median                      52.3            2.3             48.8            -1.1            50.2            0.9     
            Min - Max               31.5 - 71.2     -28.0 - 33.2    27.1 - 67.3     -28.1 - 26.6    32.1 - 68.5     -28.0 - 29.4
          WEEK 2 DAY 15                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                50.2 (7.5)      0.5 (11.0)      49.5 (7.0)     -1.3 (10.2)      51.8 (8.1)      2.6 (11.8) 
            Median                      50.7            -0.7            49.7            -0.7            51.6            2.8     
            Min - Max               35.1 - 67.7     -33.9 - 25.4    32.3 - 73.2     -29.7 - 29.0    30.1 - 73.3     -24.9 - 32.8
          WEEK 3 DAY 22                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                50.1 (8.2)      0.3 (11.1)      49.9 (8.0)     -1.0 (10.9)      49.7 (8.2)      0.6 (11.1) 
            Median                      49.5            1.1             49.6            -1.1            49.2            0.5     
            Min - Max               29.0 - 68.7     -29.3 - 24.1    32.7 - 70.3     -28.3 - 21.6    35.2 - 75.2     -27.3 - 32.0
          WEEK 4 DAY 29                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                50.7 (7.7)      0.9 (11.8)      49.8 (8.5)     -1.1 (11.8)      49.9 (7.5)      0.8 (11.5) 
            Median                      50.7            1.4             49.8            -1.7            49.8            0.1     
            Min - Max               29.7 - 70.8     -25.9 - 29.2    24.4 - 68.9     -28.2 - 37.3    28.4 - 68.6     -25.8 - 32.5
          WEEK 5 DAY 36                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                50.3 (8.3)      0.6 (12.3)      50.5 (8.1)     -0.4 (11.7)      50.1 (7.3)      0.9 (10.8) 
            Median                      49.8            -0.5            50.8            -0.3            49.7            0.9     
            Min - Max               33.4 - 75.0     -30.1 - 33.4    34.6 - 78.0     -23.1 - 30.9    31.1 - 73.4     -23.8 - 39.1
        Weight                                                                                                                  
          SCREENING                                                                                                             
            n                           134              0              134              0              132              0      
            Mean (SD)                49.9 (7.4)          NA          49.7 (8.3)          NA          50.3 (9.1)          NA     
            Median                      48.7             NA             49.3             NA             49.7             NA     
            Min - Max               33.7 - 65.9          NA         25.8 - 71.5          NA         26.0 - 70.0          NA     
          BASELINE                                                                                                              
            n                           134             134             134             134             132             132     
            Mean (SD)                50.7 (7.9)      0.0 (0.0)       49.9 (8.3)      0.0 (0.0)       49.4 (7.5)      0.0 (0.0)  
            Median                      49.8            0.0             50.7            0.0             49.6            0.0     
            Min - Max               33.3 - 71.9      0.0 - 0.0      27.9 - 69.8      0.0 - 0.0      29.4 - 65.1      0.0 - 0.0  
          WEEK 1 DAY 8                                                                                                          
            n                           134             134             134             134             132             132     
            Mean (SD)                49.2 (7.7)     -1.5 (11.4)      49.1 (7.6)     -0.8 (11.4)      49.6 (8.4)      0.2 (12.1) 
            Median                      50.5            -0.2            48.9            -2.7            49.9            -0.5    
            Min - Max               26.0 - 64.5     -42.9 - 21.3    31.5 - 66.1     -25.0 - 23.5    29.7 - 69.1     -31.0 - 32.6
          WEEK 2 DAY 15                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                50.9 (8.2)      0.2 (11.2)      50.0 (7.8)      0.1 (12.5)      49.7 (7.9)      0.4 (10.8) 
            Median                      50.3            2.0             50.2            -0.2            49.8            1.3     
            Min - Max               32.1 - 70.1     -30.0 - 22.8    28.7 - 72.1     -29.2 - 34.6    28.1 - 73.7     -28.0 - 26.6
          WEEK 3 DAY 22                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                49.0 (8.0)     -1.8 (11.4)      49.6 (8.3)     -0.3 (12.5)      50.4 (8.1)      1.1 (10.8) 
            Median                      48.9            -1.3            48.5            -1.0            50.8            -0.2    
            Min - Max               31.7 - 75.4     -29.7 - 24.9    32.4 - 76.0     -36.8 - 34.4    27.8 - 70.9     -28.9 - 31.7
          WEEK 4 DAY 29                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                50.1 (8.1)     -0.7 (11.2)      49.5 (8.1)     -0.4 (10.4)      49.7 (7.5)      0.3 (10.4) 
            Median                      50.9            -0.9            49.4            -0.5            49.6            -1.2    
            Min - Max               30.1 - 68.9     -29.5 - 24.3    29.0 - 69.5     -24.9 - 26.3    30.8 - 77.4     -23.4 - 29.9
          WEEK 5 DAY 36                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                49.0 (8.1)     -1.7 (11.5)      51.6 (8.5)      1.7 (11.5)      49.9 (7.4)      0.5 (10.9) 
            Median                      49.8            -0.8            51.8            1.2             49.6            -0.2    
            Min - Max               26.4 - 66.7     -34.8 - 29.7    26.3 - 76.6     -24.0 - 29.3    28.7 - 67.9     -36.1 - 31.0

---

    Code
      res
    Output
        Parameter                            A: Drug X                      B: Placebo                    C: Combination        
          Analysis Visit                            Change from                     Change from                     Change from 
                                   Value at Visit     Baseline     Value at Visit     Baseline     Value at Visit     Baseline  
        ————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
        Diastolic Blood Pressure                                                                                                
          SCREENING                                                                                                             
            n                           134              0              134              0              132              0      
            Mean (SD)                50.0 (7.2)          NA          50.8 (8.4)          NA          50.2 (7.6)          NA     
            Median                      49.7             NA             50.1             NA             49.6             NA     
            Min - Max               31.7 - 71.2          NA         29.3 - 69.2          NA         26.9 - 70.0          NA     
          BASELINE                                                                                                              
            n                           134             134             134             134             132             132     
            Mean (SD)                48.6 (8.0)      0.0 (0.0)       50.4 (7.9)      0.0 (0.0)       51.1 (7.8)      0.0 (0.0)  
            Median                      48.4            0.0             50.2            0.0             50.8            0.0     
            Min - Max               27.7 - 64.6      0.0 - 0.0      21.7 - 67.5      0.0 - 0.0      29.7 - 71.4      0.0 - 0.0  
          WEEK 1 DAY 8                                                                                                          
            n                           134             134             134             134             132             132     
            Mean (SD)                50.3 (7.5)      1.7 (10.8)      49.7 (7.7)     -0.8 (10.9)      48.9 (7.9)     -2.3 (10.4) 
            Median                      50.1            0.6             49.7            -1.1            47.7            -2.2    
            Min - Max               33.0 - 69.0     -20.4 - 29.9    33.7 - 66.5     -25.8 - 28.4    30.4 - 67.0     -22.1 - 22.4
          WEEK 2 DAY 15                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                50.8 (7.8)      2.2 (11.8)      49.7 (8.4)     -0.7 (12.4)      50.0 (8.3)     -1.1 (11.6) 
            Median                      51.4            3.1             50.2            -0.7            51.0            -2.3    
            Min - Max               31.9 - 70.3     -23.9 - 39.2    30.6 - 68.1     -28.4 - 37.0    24.8 - 65.6     -29.2 - 30.7
          WEEK 3 DAY 22                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                50.7 (7.8)      2.1 (10.9)      49.1 (7.9)     -1.3 (11.1)      49.9 (7.7)     -1.2 (10.9) 
            Median                      50.2            2.6             49.5            -2.3            50.0            -0.6    
            Min - Max               29.1 - 74.9     -25.8 - 30.7    24.5 - 67.1     -28.1 - 33.9    31.5 - 68.5     -29.7 - 27.0
          WEEK 4 DAY 29                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                50.1 (8.1)      1.5 (10.9)      49.6 (7.1)     -0.8 (10.6)      49.7 (8.0)     -1.4 (11.0) 
            Median                      49.3            1.2             49.2            -0.8            49.8            -0.2    
            Min - Max               29.4 - 71.4     -30.9 - 24.8    32.7 - 67.0     -33.2 - 35.9    28.7 - 68.4     -35.5 - 28.4
          WEEK 5 DAY 36                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                50.6 (7.5)      2.0 (11.2)      48.4 (8.0)     -2.1 (11.7)      49.1 (7.6)     -2.0 (10.7) 
            Median                      49.4            1.6             47.7            -2.9            49.2            -2.2    
            Min - Max               35.1 - 72.2     -25.2 - 31.5    30.4 - 70.6     -31.2 - 29.2    30.6 - 72.9     -30.5 - 34.6
        Pulse Rate                                                                                                              
          SCREENING                                                                                                             
            n                           134              0              134              0              132              0      
            Mean (SD)                49.6 (9.0)          NA          49.4 (8.4)          NA          49.3 (8.6)          NA     
            Median                      49.9             NA             48.9             NA             48.6             NA     
            Min - Max               25.9 - 68.8          NA         30.5 - 80.5          NA         26.5 - 67.5          NA     
          BASELINE                                                                                                              
            n                           134             134             134             134             132             132     
            Mean (SD)                51.9 (8.1)      0.0 (0.0)       50.3 (8.8)      0.0 (0.0)       50.3 (9.4)      0.0 (0.0)  
            Median                      51.2            0.0             51.2            0.0             50.7            0.0     
            Min - Max               28.5 - 72.9      0.0 - 0.0      26.9 - 67.3      0.0 - 0.0      27.8 - 71.2      0.0 - 0.0  
          WEEK 1 DAY 8                                                                                                          
            n                           134             134             134             134             132             132     
            Mean (SD)                50.1 (8.3)     -1.8 (11.6)      49.3 (7.5)     -1.0 (11.6)      49.8 (7.7)     -0.5 (12.6) 
            Median                      49.9            -2.7            48.8            -2.2            49.5            -1.5    
            Min - Max               26.7 - 69.4     -26.4 - 29.6    30.7 - 67.8     -29.5 - 32.1    30.1 - 72.9     -25.1 - 33.3
          WEEK 2 DAY 15                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                49.7 (8.8)     -2.2 (12.4)      50.8 (7.6)      0.6 (11.8)      49.1 (7.7)     -1.2 (11.3) 
            Median                      49.2            -3.0            50.3            0.1             49.2            -1.1    
            Min - Max               26.0 - 69.6     -37.6 - 26.4    33.3 - 70.3     -28.9 - 37.7    32.2 - 73.6     -33.7 - 26.3
          WEEK 3 DAY 22                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                50.5 (7.4)     -1.4 (11.1)      49.9 (7.8)     -0.4 (11.0)      49.8 (7.2)     -0.5 (12.1) 
            Median                      50.6            -1.1            49.4            -0.8            49.6            -2.3    
            Min - Max               27.7 - 73.0     -30.0 - 26.5    27.8 - 71.0     -26.5 - 33.4    27.9 - 67.5     -28.7 - 28.0
          WEEK 4 DAY 29                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                49.0 (8.3)     -2.9 (11.1)      50.0 (8.4)     -0.3 (12.0)      51.0 (7.7)      0.7 (11.6) 
            Median                      48.8            -3.0            49.9            -0.4            51.4            0.7     
            Min - Max               32.3 - 78.4     -28.4 - 30.4    30.4 - 79.8     -29.1 - 28.3    31.4 - 70.3     -30.6 - 25.1
          WEEK 5 DAY 36                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                48.4 (8.5)     -3.5 (11.6)      50.3 (7.2)      0.0 (11.2)      49.7 (7.6)     -0.5 (12.4) 
            Median                      47.7            -4.0            50.3            -1.5            49.1            -2.7    
            Min - Max               25.0 - 75.7     -41.3 - 31.5    29.4 - 67.7     -24.9 - 27.3    35.3 - 73.7     -24.6 - 34.0
        Respiratory Rate                                                                                                        
          SCREENING                                                                                                             
            n                           134              0              134              0              132              0      
            Mean (SD)                49.2 (8.2)          NA          50.3 (8.3)          NA          49.6 (8.4)          NA     
            Median                      49.3             NA             49.9             NA             50.1             NA     
            Min - Max               26.0 - 74.4          NA         31.4 - 69.2          NA         24.3 - 67.9          NA     
          BASELINE                                                                                                              
            n                           134             134             134             134             132             132     
            Mean (SD)                49.4 (8.1)      0.0 (0.0)       51.1 (8.2)      0.0 (0.0)       50.8 (8.4)      0.0 (0.0)  
            Median                      49.8            0.0             50.5            0.0             51.1            0.0     
            Min - Max               29.3 - 69.3      0.0 - 0.0      31.2 - 74.5      0.0 - 0.0      26.2 - 71.0      0.0 - 0.0  
          WEEK 1 DAY 8                                                                                                          
            n                           134             134             134             134             132             132     
            Mean (SD)                49.5 (8.0)      0.1 (11.6)      50.0 (7.9)     -1.1 (11.5)      51.0 (7.8)      0.2 (11.1) 
            Median                      49.3            0.2             49.1            -1.6            51.1            0.4     
            Min - Max               24.1 - 66.1     -31.6 - 32.1    25.0 - 67.7     -29.1 - 30.9    29.9 - 69.8     -23.6 - 27.7
          WEEK 2 DAY 15                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                49.7 (7.7)      0.3 (9.7)       50.4 (8.7)     -0.8 (12.1)      49.3 (8.5)     -1.4 (12.0) 
            Median                      49.2            1.4             49.7            -1.6            50.2            -1.6    
            Min - Max               30.8 - 71.3     -24.9 - 27.6    28.5 - 77.0     -29.0 - 28.9    22.4 - 67.6     -43.8 - 27.0
          WEEK 3 DAY 22                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                50.6 (8.2)      1.2 (11.7)      50.2 (6.9)     -1.0 (10.1)      49.1 (7.3)     -1.6 (11.1) 
            Median                      50.5            0.7             49.7            -0.7            49.6            -0.9    
            Min - Max               33.2 - 70.8     -33.5 - 33.3    32.3 - 67.8     -29.6 - 22.2    27.4 - 63.3     -25.4 - 33.6
          WEEK 4 DAY 29                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                49.4 (7.7)      0.0 (10.9)      49.9 (7.8)     -1.2 (11.0)      50.8 (7.8)      0.1 (11.1) 
            Median                      48.9            -1.4            48.9            -2.4            50.4            -0.6    
            Min - Max               25.9 - 69.7     -25.9 - 40.3    33.7 - 68.5     -25.0 - 29.2    31.9 - 72.0     -27.6 - 31.1
          WEEK 5 DAY 36                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                49.9 (7.7)      0.5 (11.5)      50.6 (8.2)     -0.5 (12.0)      49.9 (7.9)     -0.8 (10.6) 
            Median                      49.8            -0.2            50.3            -0.6            49.6            -1.7    
            Min - Max               34.3 - 70.7     -30.3 - 37.2    28.4 - 69.8     -29.4 - 23.8    29.8 - 68.4     -21.3 - 22.3
        Systolic Blood Pressure                                                                                                 
          SCREENING                                                                                                             
            n                           134              0              134              0              132              0      
            Mean (SD)                49.6 (8.3)          NA          50.3 (8.3)          NA          50.9 (7.8)          NA     
            Median                      49.6             NA             50.2             NA             50.8             NA     
            Min - Max               24.0 - 70.9          NA         26.2 - 79.1          NA         27.6 - 67.4          NA     
          BASELINE                                                                                                              
            n                           134             134             134             134             132             132     
            Mean (SD)                49.4 (8.5)      0.0 (0.0)       50.2 (8.5)      0.0 (0.0)       48.5 (7.2)      0.0 (0.0)  
            Median                      48.3            0.0             50.0            0.0             49.2            0.0     
            Min - Max               24.3 - 71.1      0.0 - 0.0      24.4 - 71.1      0.0 - 0.0      26.2 - 63.4      0.0 - 0.0  
          WEEK 1 DAY 8                                                                                                          
            n                           134             134             134             134             132             132     
            Mean (SD)                50.7 (9.2)      1.3 (12.8)      49.3 (8.7)     -1.0 (11.2)      49.6 (8.0)      1.2 (10.2) 
            Median                      49.5            0.1             48.3            -1.7            49.8            0.1     
            Min - Max               29.8 - 79.0     -29.5 - 37.6    33.0 - 74.0     -27.6 - 24.8    25.5 - 68.6     -22.8 - 31.3
          WEEK 2 DAY 15                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                49.4 (8.5)     -0.0 (11.9)      49.4 (7.0)     -0.9 (11.0)      49.3 (7.7)      0.8 (9.7)  
            Median                      49.5            -0.2            49.4            -0.9            48.3            -0.2    
            Min - Max               24.2 - 65.4     -39.1 - 32.7    27.6 - 69.2     -37.1 - 33.9    29.4 - 74.7     -24.9 - 29.0
          WEEK 3 DAY 22                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                49.7 (7.8)      0.3 (11.4)      49.0 (7.8)     -1.2 (12.1)      50.5 (8.3)      2.0 (11.1) 
            Median                      50.1            1.5             48.8            -1.2            51.7            2.0     
            Min - Max               31.3 - 70.3     -27.5 - 27.1    15.6 - 66.2     -35.6 - 36.4    29.6 - 69.4     -29.7 - 30.6
          WEEK 4 DAY 29                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                49.4 (7.6)      0.0 (11.5)      49.4 (8.6)     -0.8 (12.6)      50.7 (7.4)      2.2 (10.5) 
            Median                      49.8            0.6             49.9            -1.3            50.8            3.0     
            Min - Max               22.9 - 69.6     -32.3 - 28.5    22.1 - 72.1     -29.7 - 38.1    29.7 - 65.1     -28.8 - 34.1
          WEEK 5 DAY 36                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                49.4 (7.9)     -0.0 (11.9)      50.2 (8.7)     -0.0 (11.8)      50.4 (8.2)      1.9 (10.5) 
            Median                      49.6            0.7             49.9            0.2             50.8            2.4     
            Min - Max               26.1 - 69.7     -39.2 - 33.9    27.9 - 74.2     -27.7 - 36.2    34.3 - 74.5     -23.7 - 32.4
        Temperature                                                                                                             
          SCREENING                                                                                                             
            n                           134              0              134              0              132              0      
            Mean (SD)                48.9 (9.4)          NA          50.1 (7.9)          NA          50.2 (8.4)          NA     
            Median                      49.6             NA             50.1             NA             49.8             NA     
            Min - Max               29.0 - 75.2          NA         29.9 - 73.4          NA         30.5 - 72.3          NA     
          BASELINE                                                                                                              
            n                           134             134             134             134             132             132     
            Mean (SD)                49.7 (8.3)      0.0 (0.0)       50.9 (7.4)      0.0 (0.0)       49.1 (8.2)      0.0 (0.0)  
            Median                      50.4            0.0             51.5            0.0             48.7            0.0     
            Min - Max               29.0 - 69.1      0.0 - 0.0      30.7 - 67.7      0.0 - 0.0      20.6 - 70.5      0.0 - 0.0  
          WEEK 1 DAY 8                                                                                                          
            n                           134             134             134             134             132             132     
            Mean (SD)                51.6 (8.1)      1.9 (11.8)      49.5 (8.2)      -1.4 (9.9)      49.8 (7.6)      0.6 (11.2) 
            Median                      52.3            2.3             48.8            -1.1            50.2            0.9     
            Min - Max               31.5 - 71.2     -28.0 - 33.2    27.1 - 67.3     -28.1 - 26.6    32.1 - 68.5     -28.0 - 29.4
          WEEK 2 DAY 15                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                50.2 (7.5)      0.5 (11.0)      49.5 (7.0)     -1.3 (10.2)      51.8 (8.1)      2.6 (11.8) 
            Median                      50.7            -0.7            49.7            -0.7            51.6            2.8     
            Min - Max               35.1 - 67.7     -33.9 - 25.4    32.3 - 73.2     -29.7 - 29.0    30.1 - 73.3     -24.9 - 32.8
          WEEK 3 DAY 22                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                50.1 (8.2)      0.3 (11.1)      49.9 (8.0)     -1.0 (10.9)      49.7 (8.2)      0.6 (11.1) 
            Median                      49.5            1.1             49.6            -1.1            49.2            0.5     
            Min - Max               29.0 - 68.7     -29.3 - 24.1    32.7 - 70.3     -28.3 - 21.6    35.2 - 75.2     -27.3 - 32.0
          WEEK 4 DAY 29                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                50.7 (7.7)      0.9 (11.8)      49.8 (8.5)     -1.1 (11.8)      49.9 (7.5)      0.8 (11.5) 
            Median                      50.7            1.4             49.8            -1.7            49.8            0.1     
            Min - Max               29.7 - 70.8     -25.9 - 29.2    24.4 - 68.9     -28.2 - 37.3    28.4 - 68.6     -25.8 - 32.5
          WEEK 5 DAY 36                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                50.3 (8.3)      0.6 (12.3)      50.5 (8.1)     -0.4 (11.7)      50.1 (7.3)      0.9 (10.8) 
            Median                      49.8            -0.5            50.8            -0.3            49.7            0.9     
            Min - Max               33.4 - 75.0     -30.1 - 33.4    34.6 - 78.0     -23.1 - 30.9    31.1 - 73.4     -23.8 - 39.1
        Weight                                                                                                                  
          SCREENING                                                                                                             
            n                           134              0              134              0              132              0      
            Mean (SD)                49.9 (7.4)          NA          49.7 (8.3)          NA          50.3 (9.1)          NA     
            Median                      48.7             NA             49.3             NA             49.7             NA     
            Min - Max               33.7 - 65.9          NA         25.8 - 71.5          NA         26.0 - 70.0          NA     
          BASELINE                                                                                                              
            n                           134             134             134             134             132             132     
            Mean (SD)                50.7 (7.9)      0.0 (0.0)       49.9 (8.3)      0.0 (0.0)       49.4 (7.5)      0.0 (0.0)  
            Median                      49.8            0.0             50.7            0.0             49.6            0.0     
            Min - Max               33.3 - 71.9      0.0 - 0.0      27.9 - 69.8      0.0 - 0.0      29.4 - 65.1      0.0 - 0.0  
          WEEK 1 DAY 8                                                                                                          
            n                           134             134             134             134             132             132     
            Mean (SD)                49.2 (7.7)     -1.5 (11.4)      49.1 (7.6)     -0.8 (11.4)      49.6 (8.4)      0.2 (12.1) 
            Median                      50.5            -0.2            48.9            -2.7            49.9            -0.5    
            Min - Max               26.0 - 64.5     -42.9 - 21.3    31.5 - 66.1     -25.0 - 23.5    29.7 - 69.1     -31.0 - 32.6
          WEEK 2 DAY 15                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                50.9 (8.2)      0.2 (11.2)      50.0 (7.8)      0.1 (12.5)      49.7 (7.9)      0.4 (10.8) 
            Median                      50.3            2.0             50.2            -0.2            49.8            1.3     
            Min - Max               32.1 - 70.1     -30.0 - 22.8    28.7 - 72.1     -29.2 - 34.6    28.1 - 73.7     -28.0 - 26.6
          WEEK 3 DAY 22                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                49.0 (8.0)     -1.8 (11.4)      49.6 (8.3)     -0.3 (12.5)      50.4 (8.1)      1.1 (10.8) 
            Median                      48.9            -1.3            48.5            -1.0            50.8            -0.2    
            Min - Max               31.7 - 75.4     -29.7 - 24.9    32.4 - 76.0     -36.8 - 34.4    27.8 - 70.9     -28.9 - 31.7
          WEEK 4 DAY 29                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                50.1 (8.1)     -0.7 (11.2)      49.5 (8.1)     -0.4 (10.4)      49.7 (7.5)      0.3 (10.4) 
            Median                      50.9            -0.9            49.4            -0.5            49.6            -1.2    
            Min - Max               30.1 - 68.9     -29.5 - 24.3    29.0 - 69.5     -24.9 - 26.3    30.8 - 77.4     -23.4 - 29.9
          WEEK 5 DAY 36                                                                                                         
            n                           134             134             134             134             132             132     
            Mean (SD)                49.0 (8.1)     -1.7 (11.5)      51.6 (8.5)      1.7 (11.5)      49.9 (7.4)      0.5 (10.9) 
            Median                      49.8            -0.8            51.8            1.2             49.6            -0.2    
            Min - Max               26.4 - 66.7     -34.8 - 29.7    26.3 - 76.6     -24.0 - 29.3    28.7 - 67.9     -36.1 - 31.0

# vst02_1 functions with default argument value return expected result with test data

    Code
      res
    Output
        Assessment                   A: Drug X        B: Placebo     C: Combination
         Abnormality                  (N=134)          (N=134)          (N=132)    
        ———————————————————————————————————————————————————————————————————————————
        Diastolic Blood Pressure                                                   
          Low                      69/134 (51.5%)   73/134 (54.5%)   67/132 (50.8%)
          High                     76/134 (56.7%)    67/134 (50%)    65/132 (49.2%)
        Pulse Rate                                                                 
          Low                       75/134 (56%)     67/134 (50%)    69/132 (52.3%)
          High                      67/134 (50%)    74/134 (55.2%)   53/132 (40.2%)
        Respiratory Rate                                                           
          Low                      70/134 (52.2%)   72/134 (53.7%)   64/132 (48.5%)
          High                      75/134 (56%)    65/134 (48.5%)   71/132 (53.8%)
        Systolic Blood Pressure                                                    
          Low                       71/134 (53%)    69/134 (51.5%)    70/132 (53%) 
          High                     78/134 (58.2%)   62/134 (46.3%)   64/132 (48.5%)
        Temperature                                                                
          Low                      66/134 (49.3%)   68/134 (50.7%)   81/132 (61.4%)
          High                      67/134 (50%)    66/134 (49.3%)   69/132 (52.3%)
        Weight                                                                     
          Low                      73/134 (54.5%)    71/134 (53%)    76/132 (57.6%)
          High                     69/134 (51.5%)   74/134 (55.2%)   74/132 (56.1%)

# vst02_2 functions with default argument value return expected result with test data

    Code
      res
    Output
        Assessment                   A: Drug X        B: Placebo     C: Combination
          Abnormality                 (N=134)          (N=134)          (N=132)    
        ———————————————————————————————————————————————————————————————————————————
        Diastolic Blood Pressure                                                   
          Low                      55/120 (45.8%)   60/121 (49.6%)   53/118 (44.9%)
          High                     55/113 (48.7%)   56/123 (45.5%)   52/119 (43.7%)
        Pulse Rate                                                                 
          Low                      66/125 (52.8%)   54/121 (44.6%)   55/118 (46.6%)
          High                     52/119 (43.7%)   59/119 (49.6%)   38/117 (32.5%)
        Respiratory Rate                                                           
          Low                       59/123 (48%)    56/118 (47.5%)   50/118 (42.4%)
          High                     65/124 (52.4%)   58/127 (45.7%)   57/118 (48.3%)
        Systolic Blood Pressure                                                    
          Low                      53/116 (45.7%)   55/120 (45.8%)   58/120 (48.3%)
          High                     65/121 (53.7%)   53/125 (42.4%)   56/124 (45.2%)
        Temperature                                                                
          Low                      51/119 (42.9%)   53/119 (44.5%)   64/115 (55.7%)
          High                     61/128 (47.7%)   53/121 (43.8%)   59/122 (48.4%)
        Weight                                                                     
          Low                      59/120 (49.2%)   54/117 (46.2%)   63/119 (52.9%)
          High                     58/123 (47.2%)   61/121 (50.4%)   55/113 (48.7%)

# pdt01_1 function with default argument value return expected result with test data

    Code
      res
    Output
        Category                                                              A: Drug X    B: Placebo   C: Combination
          Description                                                          (N=134)      (N=134)        (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one major protocol deviation   22 (16.4%)   23 (17.2%)     13 (9.8%)   
        Total number of major protocol deviations                                 40           42             21      
        EXCLUSION CRITERIA                                                                                            
          Active or untreated or other excluded cns metastases                 5 (3.7%)     3 (2.2%)          0       
          Pregnancy criteria                                                   2 (1.5%)     4 (3.0%)          0       
          History of other malignancies within the last 5 years                3 (2.2%)     2 (1.5%)          0       
          Uncontrolled concurrent condition                                    3 (2.2%)     1 (0.7%)          0       
          Other exclusion criteria                                                0            0           3 (2.3%)   
          Received prior prohibited therapy or medication                         0         2 (1.5%)       1 (0.8%)   
        INCLUSION CRITERIA                                                                                            
          No signed ICF at study entry                                         6 (4.5%)     4 (3.0%)          0       
          Ineligible cancer type or current cancer stage                       6 (4.5%)     1 (0.7%)       1 (0.8%)   
          Inclusion lab values outside allowed limits                             0         3 (2.2%)          0       
          Does not meet prior therapy requirements                             1 (0.7%)        0              0       
          Inclusion-related test not done/out of window                           0            0           1 (0.8%)   
        MEDICATION                                                                                                    
          Significant deviation from planned dose                              3 (2.2%)     1 (0.7%)       2 (1.5%)   
          Received incorrect study medication                                  1 (0.7%)     2 (1.5%)       1 (0.8%)   
          Discontinued study drug for unspecified reason                       1 (0.7%)     1 (0.7%)       1 (0.8%)   
          Dose missed or significantly out of window                           2 (1.5%)        0           1 (0.8%)   
          Received prohibited concomitant medication                              0         2 (1.5%)          0       
        PROCEDURAL                                                                                                    
          Eligibility-related test not done/out of window                      1 (0.7%)     6 (4.5%)       1 (0.8%)   
          Omission of screening tumor assessment                                  0         4 (3.0%)       3 (2.3%)   
          Missed assessment affecting safety/study outcomes                    1 (0.7%)     2 (1.5%)       2 (1.5%)   
          Failure to sign updated ICF within two visits                        2 (1.5%)     1 (0.7%)       1 (0.8%)   
          Missed 2 or more efficacy assessments                                2 (1.5%)        0           1 (0.8%)   
          Omission of complete lab panel required by protocol                     0         1 (0.7%)       1 (0.8%)   

# pdt02_1 function with default argument value return expected result with test data

    Code
      res
    Output
        Primary Reason                                                                                     A: Drug X   B: Placebo   C: Combination
          Description                                                                                       (N=134)     (N=134)        (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one major protocol deviation related to epidemic/pandemic   9 (6.7%)     2 (1.5%)       5 (3.8%)   
        Total number of major protocol deviations related to epidemic/pandemic                                 9           2              6       
        Site action due to epidemic/pandemic                                                               9 (6.7%)     2 (1.5%)       5 (3.8%)   
          Significant deviation from planned dose                                                          3 (2.2%)     1 (0.7%)       2 (1.5%)   
          Failure to sign updated ICF within two visits                                                    2 (1.5%)     1 (0.7%)       1 (0.8%)   
          Dose missed or significantly out of window                                                       2 (1.5%)        0           1 (0.8%)   
          Missed 2 or more efficacy assessments                                                            2 (1.5%)        0           1 (0.8%)   

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

