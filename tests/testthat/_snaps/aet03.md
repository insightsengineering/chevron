# aet03 can handle all NA values

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
        No Coding available                                                   
          - Any Intensity -         122 (91.0%)   123 (91.8%)    120 (90.9%)  
          MILD                       7 (5.2%)      9 (6.7%)        4 (3.0%)   
          MODERATE                  24 (17.9%)    24 (17.9%)      23 (17.4%)  
          SEVERE                    91 (67.9%)    90 (67.2%)      93 (70.5%)  
          No Coding available                                                 
            - Any Intensity -        122 (91%)    123 (91.8%)    120 (90.9%)  
            MILD                     7 (5.2%)      9 (6.7%)        4 (3.0%)   
            MODERATE                24 (17.9%)    24 (17.9%)      23 (17.4%)  
            SEVERE                  91 (67.9%)    90 (67.2%)      93 (70.5%)  

# aet03 can handle some NA values

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
          - Any Intensity -         78 (58.2%)    74 (55.2%)      85 (64.4%)  
          MILD                      30 (22.4%)    30 (22.4%)      33 (25.0%)  
          MODERATE                  48 (35.8%)    44 (32.8%)      52 (39.4%)  
          dcd B.2.2.3.1                                                       
            - Any Intensity -       48 (35.8%)    54 (40.3%)      51 (38.6%)  
            MILD                    48 (35.8%)    54 (40.3%)      51 (38.6%)  
          dcd B.2.1.2.1                                                       
            - Any Intensity -       48 (35.8%)    44 (32.8%)      52 (39.4%)  
            MODERATE                48 (35.8%)    44 (32.8%)      52 (39.4%)  
        cl D.1                                                                
          - Any Intensity -         78 (58.2%)    67 (50.0%)      80 (60.6%)  
          MODERATE                  28 (20.9%)    25 (18.7%)      29 (22.0%)  
          SEVERE                    50 (37.3%)    42 (31.3%)      51 (38.6%)  
          dcd D.1.1.1.1                                                       
            - Any Intensity -       50 (37.3%)    42 (31.3%)      51 (38.6%)  
            SEVERE                  50 (37.3%)    42 (31.3%)      51 (38.6%)  
          dcd D.1.1.4.2                                                       
            - Any Intensity -       47 (35.1%)    42 (31.3%)      50 (37.9%)  
            MODERATE                47 (35.1%)    42 (31.3%)      50 (37.9%)  
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

