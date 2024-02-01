# aet03 can handle NA values

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
        MedDRA System Organ Class   A: Drug X    B: Placebo   C: Combination
          MedDRA Preferred Term       (N=15)       (N=15)         (N=15)    
        ————————————————————————————————————————————————————————————————————
        - Any Intensity -           13 (86.7%)   14 (93.3%)     15 (100%)   
        MILD                            0         1 (6.7%)       1 (6.7%)   
        MODERATE                    2 (13.3%)    3 (20.0%)      2 (13.3%)   
        SEVERE                      11 (73.3%)   10 (66.7%)     12 (80.0%)  
        No Coding Available                                                 
          - Any Intensity -         13 (86.7%)   14 (93.3%)     15 (100%)   
          MILD                          0         1 (6.7%)       1 (6.7%)   
          MODERATE                  2 (13.3%)    3 (20.0%)      2 (13.3%)   
          SEVERE                    11 (73.3%)   10 (66.7%)     12 (80.0%)  
          No Coding Available                                               
            - Any Intensity -       13 (86.7%)   14 (93.3%)     15 (100%)   
            MILD                        0         1 (6.7%)       1 (6.7%)   
            MODERATE                2 (13.3%)    3 (20.0%)      2 (13.3%)   
            SEVERE                  11 (73.3%)   10 (66.7%)     12 (80.0%)  

# aet03 can handle some NA values

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
        MedDRA System Organ Class   A: Drug X    B: Placebo   C: Combination
          MedDRA Preferred Term       (N=15)       (N=15)         (N=15)    
        ————————————————————————————————————————————————————————————————————
        - Any Intensity -           13 (86.7%)   14 (93.3%)     15 (100%)   
        MILD                            0         1 (6.7%)       1 (6.7%)   
        MODERATE                    3 (20.0%)    3 (20.0%)      2 (13.3%)   
        SEVERE                      10 (66.7%)   10 (66.7%)     12 (80.0%)  
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
          - Any Intensity -         8 (53.3%)    5 (33.3%)      11 (73.3%)  
          MODERATE                  4 (26.7%)     1 (6.7%)      4 (26.7%)   
          SEVERE                    4 (26.7%)    4 (26.7%)      7 (46.7%)   
          dcd D.1.1.1.1                                                     
            - Any Intensity -       4 (26.7%)    4 (26.7%)      7 (46.7%)   
            SEVERE                  4 (26.7%)    4 (26.7%)      7 (46.7%)   
          dcd D.1.1.4.2                                                     
            - Any Intensity -       5 (33.3%)    2 (13.3%)      7 (46.7%)   
            MODERATE                5 (33.3%)    2 (13.3%)      7 (46.7%)   
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
          - Any Intensity -         3 (20.0%)    4 (26.7%)      5 (33.3%)   
          SEVERE                    3 (20.0%)    4 (26.7%)      5 (33.3%)   
          dcd C.1.1.1.3                                                     
            - Any Intensity -       3 (20.0%)    4 (26.7%)      5 (33.3%)   
            SEVERE                  3 (20.0%)    4 (26.7%)      5 (33.3%)   

