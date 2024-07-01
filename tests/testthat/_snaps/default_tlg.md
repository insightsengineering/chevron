# ael01_nollt function with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      MedDRA System Organ Class   MedDRA Preferred Term   Reported Term for the Adverse Event
      ———————————————————————————————————————————————————————————————————————————————————————
      cl A.1                      dcd A.1.1.1.1           trm A.1.1.1.1                      
                                  dcd A.1.1.1.2           trm A.1.1.1.2                      
      cl B.1                      dcd B.1.1.1.1           trm B.1.1.1.1                      
      cl B.2                      dcd B.2.1.2.1           trm B.2.1.2.1                      
                                  dcd B.2.2.3.1           trm B.2.2.3.1                      
      cl C.1                      dcd C.1.1.1.3           trm C.1.1.1.3                      
      cl C.2                      dcd C.2.1.2.1           trm C.2.1.2.1                      
      cl D.1                      dcd D.1.1.1.1           trm D.1.1.1.1                      
                                  dcd D.1.1.4.2           trm D.1.1.4.2                      
      cl D.2                      dcd D.2.1.5.3           trm D.2.1.5.3                      

# aet01 function with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                     A: Drug X    B: Placebo   C: Combination
                                                                       (N=15)       (N=15)         (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                13 (86.7%)   14 (93.3%)     15 (100%)   
        Total number of AEs                                              58           59             99      
        Total number of deaths                                       2 (13.3%)    4 (26.7%)      3 (20.0%)   
        Total number of patients withdrawn from study due to an AE       0            0           1 (6.7%)   
        Total number of patients with at least one                                                           
          AE with fatal outcome                                      8 (53.3%)    8 (53.3%)      10 (66.7%)  
          Serious AE                                                 12 (80.0%)   12 (80.0%)     11 (73.3%)  
          Serious AE leading to withdrawal from treatment                0            0          2 (13.3%)   
          Serious AE leading to dose modification/interruption       4 (26.7%)    3 (20.0%)      4 (26.7%)   
          Related Serious AE                                         8 (53.3%)    8 (53.3%)      10 (66.7%)  
          AE leading to withdrawal from treatment                    2 (13.3%)    3 (20.0%)      3 (20.0%)   
          AE leading to dose modification/interruption               6 (40.0%)    9 (60.0%)      11 (73.3%)  
          Related AE                                                 11 (73.3%)   10 (66.7%)     13 (86.7%)  
          Related AE leading to withdrawal from treatment                0        3 (20.0%)          0       
          Related AE leading to dose modification/interruption        1 (6.7%)    4 (26.7%)      9 (60.0%)   
          Severe AE (at greatest intensity)                          11 (73.3%)   10 (66.7%)     12 (80.0%)  

# aet01_aesi function with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                                        A: Drug X    B: Placebo
                                                                                          (N=15)       (N=15)  
        ———————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                                   13 (86.7%)   14 (93.3%)
        Total number of AEs                                                                 58           59    
        Total number of patients with at least one AE by worst grade                                           
          Grade 1                                                                           0         1 (6.7%) 
          Grade 2                                                                        1 (6.7%)     1 (6.7%) 
          Grade 3                                                                        1 (6.7%)    2 (13.3%) 
          Grade 4                                                                       3 (20.0%)    2 (13.3%) 
          Grade 5 (fatal outcome)                                                       8 (53.3%)    8 (53.3%) 
        Total number of patients with study drug withdrawn due to AE                    2 (13.3%)    3 (20.0%) 
        Total number of patients with dose modified/interrupted due to AE               6 (40.0%)    9 (60.0%) 
        Total number of patients with treatment received for AE                         10 (66.7%)   10 (66.7%)
        Total number of patients with all non-fatal AEs resolved                        9 (60.0%)    10 (66.7%)
        Total number of patients with at least one unresolved or ongoing non-fatal AE   10 (66.7%)   9 (60.0%) 
        Total number of patients with at least one serious AE                           12 (80.0%)   12 (80.0%)
        Total number of patients with at least one related AE                           11 (73.3%)   10 (66.7%)
      \s\n                                                                                  C: Combination
                                                                                            (N=15)    
        ——————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one AE                                     15 (100%)   
        Total number of AEs                                                                   99      
        Total number of patients with at least one AE by worst grade                                  
          Grade 1                                                                          1 (6.7%)   
          Grade 2                                                                          1 (6.7%)   
          Grade 3                                                                          1 (6.7%)   
          Grade 4                                                                         2 (13.3%)   
          Grade 5 (fatal outcome)                                                         10 (66.7%)  
        Total number of patients with study drug withdrawn due to AE                      3 (20.0%)   
        Total number of patients with dose modified/interrupted due to AE                 11 (73.3%)  
        Total number of patients with treatment received for AE                           14 (93.3%)  
        Total number of patients with all non-fatal AEs resolved                          12 (80.0%)  
        Total number of patients with at least one unresolved or ongoing non-fatal AE     14 (93.3%)  
        Total number of patients with at least one serious AE                             11 (73.3%)  
        Total number of patients with at least one related AE                             13 (86.7%)  

# aet02 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        MedDRA System Organ Class                                    A: Drug X    B: Placebo   C: Combination
          MedDRA Preferred Term                                        (N=15)       (N=15)         (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one adverse event     13 (86.7%)   14 (93.3%)     15 (100%)   
        Overall total number of events                                   58           59             99      
        cl B.2                                                                                               
          Total number of patients with at least one adverse event   11 (73.3%)   8 (53.3%)      10 (66.7%)  
          Total number of events                                         18           15             20      
          dcd B.2.2.3.1                                              8 (53.3%)    6 (40.0%)      7 (46.7%)   
          dcd B.2.1.2.1                                              5 (33.3%)    6 (40.0%)      5 (33.3%)   
        cl D.1                                                                                               
          Total number of patients with at least one adverse event   9 (60.0%)    5 (33.3%)      11 (73.3%)  
          Total number of events                                         13           9              19      
          dcd D.1.1.1.1                                              4 (26.7%)    4 (26.7%)      7 (46.7%)   
          dcd D.1.1.4.2                                              6 (40.0%)    2 (13.3%)      7 (46.7%)   
        cl A.1                                                                                               
          Total number of patients with at least one adverse event   7 (46.7%)    6 (40.0%)      10 (66.7%)  
          Total number of events                                         8            11             16      
          dcd A.1.1.1.2                                              5 (33.3%)    6 (40.0%)      6 (40.0%)   
          dcd A.1.1.1.1                                              3 (20.0%)     1 (6.7%)      6 (40.0%)   
        cl B.1                                                                                               
          Total number of patients with at least one adverse event   5 (33.3%)    6 (40.0%)      8 (53.3%)   
          Total number of events                                         6            6              12      
          dcd B.1.1.1.1                                              5 (33.3%)    6 (40.0%)      8 (53.3%)   
        cl C.2                                                                                               
          Total number of patients with at least one adverse event   6 (40.0%)    4 (26.7%)      8 (53.3%)   
          Total number of events                                         6            4              12      
          dcd C.2.1.2.1                                              6 (40.0%)    4 (26.7%)      8 (53.3%)   
        cl D.2                                                                                               
          Total number of patients with at least one adverse event   2 (13.3%)    5 (33.3%)      7 (46.7%)   
          Total number of events                                         3            5              10      
          dcd D.2.1.5.3                                              2 (13.3%)    5 (33.3%)      7 (46.7%)   
        cl C.1                                                                                               
          Total number of patients with at least one adverse event   4 (26.7%)    4 (26.7%)      5 (33.3%)   
          Total number of events                                         4            9              10      
          dcd C.1.1.1.3                                              4 (26.7%)    4 (26.7%)      5 (33.3%)   

# aet03 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        MedDRA System Organ Class   A: Drug X    B: Placebo   C: Combination
          MedDRA Preferred Term       (N=15)       (N=15)         (N=15)    
        ————————————————————————————————————————————————————————————————————
        - Any Intensity -           13 (86.7%)   14 (93.3%)     15 (100%)   
        MILD                            0         1 (6.7%)       1 (6.7%)   
        MODERATE                    2 (13.3%)    3 (20.0%)      2 (13.3%)   
        SEVERE                      11 (73.3%)   10 (66.7%)     12 (80.0%)  
        cl B.2                                                              
          - Any Intensity -         11 (73.3%)   8 (53.3%)      10 (66.7%)  
          MILD                      6 (40.0%)    2 (13.3%)      5 (33.3%)   
          MODERATE                  5 (33.3%)    6 (40.0%)      5 (33.3%)   
          dcd B.2.2.3.1                                                     
            - Any Intensity -       8 (53.3%)    6 (40.0%)      7 (46.7%)   
            MILD                    8 (53.3%)    6 (40.0%)      7 (46.7%)   
          dcd B.2.1.2.1                                                     
            - Any Intensity -       5 (33.3%)    6 (40.0%)      5 (33.3%)   
            MODERATE                5 (33.3%)    6 (40.0%)      5 (33.3%)   
        cl D.1                                                              
          - Any Intensity -         9 (60.0%)    5 (33.3%)      11 (73.3%)  
          MODERATE                  5 (33.3%)     1 (6.7%)      4 (26.7%)   
          SEVERE                    4 (26.7%)    4 (26.7%)      7 (46.7%)   
          dcd D.1.1.1.1                                                     
            - Any Intensity -       4 (26.7%)    4 (26.7%)      7 (46.7%)   
            SEVERE                  4 (26.7%)    4 (26.7%)      7 (46.7%)   
          dcd D.1.1.4.2                                                     
            - Any Intensity -       6 (40.0%)    2 (13.3%)      7 (46.7%)   
            MODERATE                6 (40.0%)    2 (13.3%)      7 (46.7%)   
        cl A.1                                                              
          - Any Intensity -         7 (46.7%)    6 (40.0%)      10 (66.7%)  
          MILD                      2 (13.3%)        0          4 (26.7%)   
          MODERATE                  5 (33.3%)    6 (40.0%)      6 (40.0%)   
          dcd A.1.1.1.2                                                     
            - Any Intensity -       5 (33.3%)    6 (40.0%)      6 (40.0%)   
            MODERATE                5 (33.3%)    6 (40.0%)      6 (40.0%)   
          dcd A.1.1.1.1                                                     
            - Any Intensity -       3 (20.0%)     1 (6.7%)      6 (40.0%)   
            MILD                    3 (20.0%)     1 (6.7%)      6 (40.0%)   
        cl B.1                                                              
          - Any Intensity -         5 (33.3%)    6 (40.0%)      8 (53.3%)   
          SEVERE                    5 (33.3%)    6 (40.0%)      8 (53.3%)   
          dcd B.1.1.1.1                                                     
            - Any Intensity -       5 (33.3%)    6 (40.0%)      8 (53.3%)   
            SEVERE                  5 (33.3%)    6 (40.0%)      8 (53.3%)   
        cl C.2                                                              
          - Any Intensity -         6 (40.0%)    4 (26.7%)      8 (53.3%)   
          MODERATE                  6 (40.0%)    4 (26.7%)      8 (53.3%)   
          dcd C.2.1.2.1                                                     
            - Any Intensity -       6 (40.0%)    4 (26.7%)      8 (53.3%)   
            MODERATE                6 (40.0%)    4 (26.7%)      8 (53.3%)   
        cl D.2                                                              
          - Any Intensity -         2 (13.3%)    5 (33.3%)      7 (46.7%)   
          MILD                      2 (13.3%)    5 (33.3%)      7 (46.7%)   
          dcd D.2.1.5.3                                                     
            - Any Intensity -       2 (13.3%)    5 (33.3%)      7 (46.7%)   
            MILD                    2 (13.3%)    5 (33.3%)      7 (46.7%)   
        cl C.1                                                              
          - Any Intensity -         4 (26.7%)    4 (26.7%)      5 (33.3%)   
          SEVERE                    4 (26.7%)    4 (26.7%)      5 (33.3%)   
          dcd C.1.1.1.3                                                     
            - Any Intensity -       4 (26.7%)    4 (26.7%)      5 (33.3%)   
            SEVERE                  4 (26.7%)    4 (26.7%)      5 (33.3%)   

# aet04 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        MedDRA System Organ Class                                                           
          MedDRA Preferred Term                     A: Drug X    B: Placebo   C: Combination
                                    Grade             (N=15)       (N=15)         (N=15)    
        ————————————————————————————————————————————————————————————————————————————————————
        - Any adverse events -                                                              
                                    - Any Grade -   13 (86.7%)   14 (93.3%)     15 (100%)   
                                    Grade 1-2        1 (6.7%)    2 (13.3%)      2 (13.3%)   
                                    1                   0         1 (6.7%)       1 (6.7%)   
                                    2                1 (6.7%)     1 (6.7%)       1 (6.7%)   
                                    Grade 3-4       4 (26.7%)    4 (26.7%)      3 (20.0%)   
                                    3                1 (6.7%)    2 (13.3%)       1 (6.7%)   
                                    4               3 (20.0%)    2 (13.3%)      2 (13.3%)   
                                    Grade 5         8 (53.3%)    8 (53.3%)      10 (66.7%)  
        cl B.2                                                                              
          - Overall -                                                                       
                                    - Any Grade -   11 (73.3%)   8 (53.3%)      10 (66.7%)  
                                    Grade 1-2       6 (40.0%)    2 (13.3%)      5 (33.3%)   
                                    1               6 (40.0%)    2 (13.3%)      5 (33.3%)   
                                    Grade 3-4       5 (33.3%)    6 (40.0%)      5 (33.3%)   
                                    3               5 (33.3%)    6 (40.0%)      5 (33.3%)   
          dcd B.2.2.3.1                                                                     
                                    - Any Grade -   8 (53.3%)    6 (40.0%)      7 (46.7%)   
                                    Grade 1-2       8 (53.3%)    6 (40.0%)      7 (46.7%)   
                                    1               8 (53.3%)    6 (40.0%)      7 (46.7%)   
          dcd B.2.1.2.1                                                                     
                                    - Any Grade -   5 (33.3%)    6 (40.0%)      5 (33.3%)   
                                    Grade 3-4       5 (33.3%)    6 (40.0%)      5 (33.3%)   
                                    3               5 (33.3%)    6 (40.0%)      5 (33.3%)   
        cl D.1                                                                              
          - Overall -                                                                       
                                    - Any Grade -   9 (60.0%)    5 (33.3%)      11 (73.3%)  
                                    Grade 3-4       5 (33.3%)     1 (6.7%)      4 (26.7%)   
                                    3               5 (33.3%)     1 (6.7%)      4 (26.7%)   
                                    Grade 5         4 (26.7%)    4 (26.7%)      7 (46.7%)   
          dcd D.1.1.1.1                                                                     
                                    - Any Grade -   4 (26.7%)    4 (26.7%)      7 (46.7%)   
                                    Grade 5         4 (26.7%)    4 (26.7%)      7 (46.7%)   
          dcd D.1.1.4.2                                                                     
                                    - Any Grade -   6 (40.0%)    2 (13.3%)      7 (46.7%)   
                                    Grade 3-4       6 (40.0%)    2 (13.3%)      7 (46.7%)   
                                    3               6 (40.0%)    2 (13.3%)      7 (46.7%)   
        cl A.1                                                                              
          - Overall -                                                                       
                                    - Any Grade -   7 (46.7%)    6 (40.0%)      10 (66.7%)  
                                    Grade 1-2       7 (46.7%)    6 (40.0%)      10 (66.7%)  
                                    1               2 (13.3%)        0          4 (26.7%)   
                                    2               5 (33.3%)    6 (40.0%)      6 (40.0%)   
          dcd A.1.1.1.2                                                                     
                                    - Any Grade -   5 (33.3%)    6 (40.0%)      6 (40.0%)   
                                    Grade 1-2       5 (33.3%)    6 (40.0%)      6 (40.0%)   
                                    2               5 (33.3%)    6 (40.0%)      6 (40.0%)   
          dcd A.1.1.1.1                                                                     
                                    - Any Grade -   3 (20.0%)     1 (6.7%)      6 (40.0%)   
                                    Grade 1-2       3 (20.0%)     1 (6.7%)      6 (40.0%)   
                                    1               3 (20.0%)     1 (6.7%)      6 (40.0%)   
        cl B.1                                                                              
          - Overall -                                                                       
                                    - Any Grade -   5 (33.3%)    6 (40.0%)      8 (53.3%)   
                                    Grade 5         5 (33.3%)    6 (40.0%)      8 (53.3%)   
          dcd B.1.1.1.1                                                                     
                                    - Any Grade -   5 (33.3%)    6 (40.0%)      8 (53.3%)   
                                    Grade 5         5 (33.3%)    6 (40.0%)      8 (53.3%)   
        cl C.2                                                                              
          - Overall -                                                                       
                                    - Any Grade -   6 (40.0%)    4 (26.7%)      8 (53.3%)   
                                    Grade 1-2       6 (40.0%)    4 (26.7%)      8 (53.3%)   
                                    2               6 (40.0%)    4 (26.7%)      8 (53.3%)   
          dcd C.2.1.2.1                                                                     
                                    - Any Grade -   6 (40.0%)    4 (26.7%)      8 (53.3%)   
                                    Grade 1-2       6 (40.0%)    4 (26.7%)      8 (53.3%)   
                                    2               6 (40.0%)    4 (26.7%)      8 (53.3%)   
        cl D.2                                                                              
          - Overall -                                                                       
                                    - Any Grade -   2 (13.3%)    5 (33.3%)      7 (46.7%)   
                                    Grade 1-2       2 (13.3%)    5 (33.3%)      7 (46.7%)   
                                    1               2 (13.3%)    5 (33.3%)      7 (46.7%)   
          dcd D.2.1.5.3                                                                     
                                    - Any Grade -   2 (13.3%)    5 (33.3%)      7 (46.7%)   
                                    Grade 1-2       2 (13.3%)    5 (33.3%)      7 (46.7%)   
                                    1               2 (13.3%)    5 (33.3%)      7 (46.7%)   
        cl C.1                                                                              
          - Overall -                                                                       
                                    - Any Grade -   4 (26.7%)    4 (26.7%)      5 (33.3%)   
                                    Grade 3-4       4 (26.7%)    4 (26.7%)      5 (33.3%)   
                                    4               4 (26.7%)    4 (26.7%)      5 (33.3%)   
          dcd C.1.1.1.3                                                                     
                                    - Any Grade -   4 (26.7%)    4 (26.7%)      5 (33.3%)   
                                    Grade 3-4       4 (26.7%)    4 (26.7%)      5 (33.3%)   
                                    4               4 (26.7%)    4 (26.7%)      5 (33.3%)   

# aet05 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                   A: Drug X         B: Placebo   
                                                                    (N=15)             (N=15)     
        ——————————————————————————————————————————————————————————————————————————————————————————
        Time to first occurrence of a grade 3-5 adverse event                                     
          Total patient-years at risk                                10.3               6.3       
          Number of adverse events observed                           12                 14       
          AE rate per 100 patient-years                             116.36             223.74     
          95% CI                                                (50.53, 182.20)   (106.54, 340.94)
        Time to first occurrence of any adverse event                                             
          Total patient-years at risk                                31.0               9.0       
          Number of adverse events observed                            5                 13       
          AE rate per 100 patient-years                              16.13             143.75     
          95% CI                                                 (1.99, 30.27)    (65.61, 221.89) 
        Time to first occurrence of any serious adverse event                                     
          Total patient-years at risk                                32.9               7.6       
          Number of adverse events observed                            4                 14       
          AE rate per 100 patient-years                              12.15             183.83     
          95% CI                                                 (0.24, 24.05)    (87.53, 280.12) 
      \s\n                                                          C: Combination 
                                                                    (N=15)     
        ———————————————————————————————————————————————————————————————————————
        Time to first occurrence of a grade 3-5 adverse event                  
          Total patient-years at risk                                 8.3      
          Number of adverse events observed                           13       
          AE rate per 100 patient-years                             156.98     
          95% CI                                                (71.65, 242.32)
        Time to first occurrence of any adverse event                          
          Total patient-years at risk                                22.0      
          Number of adverse events observed                            8       
          AE rate per 100 patient-years                              36.30     
          95% CI                                                (11.15, 61.45) 
        Time to first occurrence of any serious adverse event                  
          Total patient-years at risk                                 9.4      
          Number of adverse events observed                           13       
          AE rate per 100 patient-years                             137.79     
          95% CI                                                (62.89, 212.68)

# aet05_all functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                A: Drug X         B: Placebo   
                                                                  (N=15)            (N=15)     
        ———————————————————————————————————————————————————————————————————————————————————————
        Number of occurrences of a grade 3-5 adverse event                                     
          Total patient-years at risk                              44.4              44.2      
          Number of adverse events observed                         65                54       
          AE rate per 100 patient-years                           146.40            122.06     
          95% CI                                             (110.81, 181.99)   (89.50, 154.61)
        Number of occurrences of any adverse event                                             
          Total patient-years at risk                              44.4              44.2      
          Number of adverse events observed                         29                49       
          AE rate per 100 patient-years                           65.32             110.76     
          95% CI                                              (41.54, 89.09)    (79.75, 141.77)
        Number of occurrences of any serious adverse event                                     
          Total patient-years at risk                              44.4              44.2      
          Number of adverse events observed                         9                 36       
          AE rate per 100 patient-years                           20.27              81.37     
          95% CI                                              (7.03, 33.51)     (54.79, 107.95)
      \s\n                                                        C: Combination 
                                                                  (N=15)     
        —————————————————————————————————————————————————————————————————————
        Number of occurrences of a grade 3-5 adverse event                   
          Total patient-years at risk                              44.4      
          Number of adverse events observed                         95       
          AE rate per 100 patient-years                           214.00     
          95% CI                                             (170.97, 257.04)
        Number of occurrences of any adverse event                           
          Total patient-years at risk                              44.4      
          Number of adverse events observed                         56       
          AE rate per 100 patient-years                           126.15     
          95% CI                                             (93.11, 159.19) 
        Number of occurrences of any serious adverse event                   
          Total patient-years at risk                              44.4      
          Number of adverse events observed                         60       
          AE rate per 100 patient-years                           135.16     
          95% CI                                             (100.96, 169.36)

# aet10 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                A: Drug X   B: Placebo   C: Combination
        MedDRA Preferred Term    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————
        dcd B.2.2.3.1           8 (53.3%)   6 (40.0%)      7 (46.7%)   
        dcd B.1.1.1.1           5 (33.3%)   6 (40.0%)      8 (53.3%)   
        dcd C.2.1.2.1           6 (40.0%)   4 (26.7%)      8 (53.3%)   
        dcd A.1.1.1.2           5 (33.3%)   6 (40.0%)      6 (40.0%)   
        dcd B.2.1.2.1           5 (33.3%)   6 (40.0%)      5 (33.3%)   
        dcd D.1.1.1.1           4 (26.7%)   4 (26.7%)      7 (46.7%)   
        dcd D.1.1.4.2           6 (40.0%)   2 (13.3%)      7 (46.7%)   
        dcd D.2.1.5.3           2 (13.3%)   5 (33.3%)      7 (46.7%)   
        dcd C.1.1.1.3           4 (26.7%)   4 (26.7%)      5 (33.3%)   
        dcd A.1.1.1.1           3 (20.0%)    1 (6.7%)      6 (40.0%)   

# cmt02_pt functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                               A: Drug X    B: Placebo   C: Combination
        Other Treatment                                          (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one treatment   13 (86.7%)   14 (93.3%)     15 (100%)   
        Total number of treatments                                 58           59             99      
        medname B_3/4                                          8 (53.3%)    6 (40.0%)      8 (53.3%)   
        medname B_2/4                                          6 (40.0%)    5 (33.3%)      10 (66.7%)  
        medname A_3/3                                          5 (33.3%)    8 (53.3%)      6 (40.0%)   
        medname B_1/4                                          7 (46.7%)    6 (40.0%)      6 (40.0%)   
        medname A_2/3                                          5 (33.3%)    6 (40.0%)      7 (46.7%)   
        medname B_4/4                                          4 (26.7%)    5 (33.3%)      8 (53.3%)   
        medname C_2/2                                          4 (26.7%)    5 (33.3%)      7 (46.7%)   
        medname A_1/3                                          4 (26.7%)    3 (20.0%)      8 (53.3%)   
        medname C_1/2                                          6 (40.0%)    2 (13.3%)      6 (40.0%)   

# coxt01 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                     Treatment Effect Adjusted for Covariate     
        Effect/Covariate Included in the Model    n      Hazard Ratio       95% CI       p-value 
        —————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                               
          B: Placebo vs control (A: Drug X)       30         0.68        (0.25, 1.89)     0.4638 
        Covariate:                                                                               
          Sex                                     30         0.53        (0.18, 1.58)     0.2553 
          RACE                                    30         0.79        (0.28, 2.17)     0.6415 
          Age (yr)                                30         0.67        (0.24, 1.89)     0.4526 

# coxt02 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Effect/Covariate Included in the Model                  Hazard Ratio      95% CI       p-value
        ——————————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                                    
          Description of Planned Arm (reference = A: Drug X)                                   0.6859 
            B: Placebo                                              0.77       (0.29, 2.08)    0.6113 
            C: Combination                                          0.62       (0.21, 1.82)    0.3853 
        Covariate:                                                                                    
          Sex (reference = F)                                                                         
            M                                                       1.41       (0.61, 3.23)    0.4194 
          RACE (reference = AMERICAN INDIAN OR ALASKA NATIVE)                                  0.8938 
            ASIAN                                                   1.69       (0.36, 7.99)    0.5055 
            BLACK OR AFRICAN AMERICAN                               1.86       (0.29, 11.72)   0.5109 
            WHITE                                                   2.03       (0.34, 12.25)   0.4414 
          Age (yr)                                                                                    
            All                                                     1.00       (0.94, 1.08)    0.8951 

# dmt01 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                             A: Drug X    B: Placebo   C: Combination   All Patients
                                               (N=15)       (N=15)         (N=15)          (N=45)   
        ————————————————————————————————————————————————————————————————————————————————————————————
        Age (yr)                                                                                    
          n                                      15           15             15              45     
          Mean (SD)                          31.3 (5.3)   35.1 (9.0)     36.6 (6.4)      34.3 (7.3) 
          Median                                31.0         35.0           35.0            34.0    
          Min - Max                           24 - 40      24 - 57        24 - 49         24 - 57   
        Age Group                                                                                   
          n                                      15           15             15              45     
          <65                                15 (100%)    15 (100%)      15 (100%)       45 (100%)  
        Sex                                                                                         
          n                                      15           15             15              45     
          Male                               3 (20.0%)    7 (46.7%)      5 (33.3%)       15 (33.3%) 
          Female                             12 (80.0%)   8 (53.3%)      10 (66.7%)      30 (66.7%) 
        Ethnicity                                                                                   
          n                                      15           15             15              45     
          HISPANIC OR LATINO                 2 (13.3%)        0              0            2 (4.4%)  
          NOT HISPANIC OR LATINO             13 (86.7%)   15 (100%)      13 (86.7%)      41 (91.1%) 
          NOT REPORTED                           0            0          2 (13.3%)        2 (4.4%)  
        RACE                                                                                        
          n                                      15           15             15              45     
          AMERICAN INDIAN OR ALASKA NATIVE       0        2 (13.3%)       1 (6.7%)        3 (6.7%)  
          ASIAN                              8 (53.3%)    10 (66.7%)     8 (53.3%)       26 (57.8%) 
          BLACK OR AFRICAN AMERICAN          4 (26.7%)     1 (6.7%)      4 (26.7%)       9 (20.0%)  
          WHITE                              3 (20.0%)    2 (13.3%)      2 (13.3%)       7 (15.6%)  

# dst01 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                          A: Drug X    B: Placebo   C: Combination   All Patients
                                            (N=15)       (N=15)         (N=15)          (N=45)   
        —————————————————————————————————————————————————————————————————————————————————————————
        Completed                         10 (66.7%)   10 (66.7%)     10 (66.7%)      30 (66.7%) 
        Discontinued                      5 (33.3%)    5 (33.3%)      5 (33.3%)       15 (33.3%) 
          ADVERSE EVENT                       0            0           1 (6.7%)        1 (2.2%)  
          DEATH                           2 (13.3%)    4 (26.7%)      3 (20.0%)       9 (20.0%)  
          LACK OF EFFICACY                2 (13.3%)        0              0            2 (4.4%)  
          PHYSICIAN DECISION                  0            0           1 (6.7%)        1 (2.2%)  
          PROTOCOL VIOLATION                  0         1 (6.7%)          0            1 (2.2%)  
          WITHDRAWAL BY PARENT/GUARDIAN    1 (6.7%)        0              0            1 (2.2%)  

# dtht01 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                 A: Drug X   B: Placebo   C: Combination
                                  (N=15)       (N=15)         (N=15)    
        ————————————————————————————————————————————————————————————————
        Total number of deaths   2 (13.3%)   4 (26.7%)      3 (20.0%)   
        Primary Cause of Death                                          
          n                          2           4              3       
          Adverse Event          1 (50.0%)   2 (50.0%)      1 (33.3%)   
          Progressive Disease    1 (50.0%)       0          2 (66.7%)   
          Other                      0       2 (50.0%)          0       

