# aet02 can have different levels of row_split

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
                                                                   A: Drug X    B: Placebo   C: Combination
        MedDRA Preferred Term                                        (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one adverse event   13 (86.7%)   14 (93.3%)     15 (100%)   
        Overall total number of events                                 58           59             99      
        dcd B.2.2.3.1                                              8 (53.3%)    6 (40.0%)      7 (46.7%)   
        dcd B.1.1.1.1                                              5 (33.3%)    6 (40.0%)      8 (53.3%)   
        dcd C.2.1.2.1                                              6 (40.0%)    4 (26.7%)      8 (53.3%)   
        dcd A.1.1.1.2                                              5 (33.3%)    6 (40.0%)      6 (40.0%)   
        dcd B.2.1.2.1                                              5 (33.3%)    6 (40.0%)      5 (33.3%)   
        dcd D.1.1.1.1                                              4 (26.7%)    4 (26.7%)      7 (46.7%)   
        dcd D.1.1.4.2                                              6 (40.0%)    2 (13.3%)      7 (46.7%)   
        dcd D.2.1.5.3                                              2 (13.3%)    5 (33.3%)      7 (46.7%)   
        dcd C.1.1.1.3                                              4 (26.7%)    4 (26.7%)      5 (33.3%)   
        dcd A.1.1.1.1                                              3 (20.0%)     1 (6.7%)      6 (40.0%)   

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
        MedDRA System Organ Class                                                                              
          MedDRA Preferred Term                                        A: Drug X    B: Placebo   C: Combination
            MedDRA Preferred Term                                        (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one adverse event       13 (86.7%)   14 (93.3%)     15 (100%)   
        Overall total number of events                                     58           59             99      
        cl B.2                                                                                                 
          Total number of patients with at least one adverse event     11 (73.3%)   8 (53.3%)      10 (66.7%)  
          Total number of events                                           18           15             20      
          dcd B.2.2.3.1                                                                                        
            Total number of patients with at least one adverse event   8 (53.3%)    6 (40.0%)      7 (46.7%)   
            Total number of events                                         9            7              13      
            dcd B.2.2.3.1                                              8 (53.3%)    6 (40.0%)      7 (46.7%)   
          dcd B.2.1.2.1                                                                                        
            Total number of patients with at least one adverse event   5 (33.3%)    6 (40.0%)      5 (33.3%)   
            Total number of events                                         9            8              7       
            dcd B.2.1.2.1                                              5 (33.3%)    6 (40.0%)      5 (33.3%)   
        cl D.1                                                                                                 
          Total number of patients with at least one adverse event     9 (60.0%)    5 (33.3%)      11 (73.3%)  
          Total number of events                                           13           9              19      
          dcd D.1.1.1.1                                                                                        
            Total number of patients with at least one adverse event   4 (26.7%)    4 (26.7%)      7 (46.7%)   
            Total number of events                                         5            7              11      
            dcd D.1.1.1.1                                              4 (26.7%)    4 (26.7%)      7 (46.7%)   
          dcd D.1.1.4.2                                                                                        
            Total number of patients with at least one adverse event   6 (40.0%)    2 (13.3%)      7 (46.7%)   
            Total number of events                                         8            2              8       
            dcd D.1.1.4.2                                              6 (40.0%)    2 (13.3%)      7 (46.7%)   
        cl A.1                                                                                                 
          Total number of patients with at least one adverse event     7 (46.7%)    6 (40.0%)      10 (66.7%)  
          Total number of events                                           8            11             16      
          dcd A.1.1.1.2                                                                                        
            Total number of patients with at least one adverse event   5 (33.3%)    6 (40.0%)      6 (40.0%)   
            Total number of events                                         5            10             9       
            dcd A.1.1.1.2                                              5 (33.3%)    6 (40.0%)      6 (40.0%)   
          dcd A.1.1.1.1                                                                                        
            Total number of patients with at least one adverse event   3 (20.0%)     1 (6.7%)      6 (40.0%)   
            Total number of events                                         3            1              7       
            dcd A.1.1.1.1                                              3 (20.0%)     1 (6.7%)      6 (40.0%)   
        cl B.1                                                                                                 
          Total number of patients with at least one adverse event     5 (33.3%)    6 (40.0%)      8 (53.3%)   
          Total number of events                                           6            6              12      
          dcd B.1.1.1.1                                                                                        
            Total number of patients with at least one adverse event   5 (33.3%)    6 (40.0%)      8 (53.3%)   
            Total number of events                                         6            6              12      
            dcd B.1.1.1.1                                              5 (33.3%)    6 (40.0%)      8 (53.3%)   
        cl C.2                                                                                                 
          Total number of patients with at least one adverse event     6 (40.0%)    4 (26.7%)      8 (53.3%)   
          Total number of events                                           6            4              12      
          dcd C.2.1.2.1                                                                                        
            Total number of patients with at least one adverse event   6 (40.0%)    4 (26.7%)      8 (53.3%)   
            Total number of events                                         6            4              12      
            dcd C.2.1.2.1                                              6 (40.0%)    4 (26.7%)      8 (53.3%)   
        cl D.2                                                                                                 
          Total number of patients with at least one adverse event     2 (13.3%)    5 (33.3%)      7 (46.7%)   
          Total number of events                                           3            5              10      
          dcd D.2.1.5.3                                                                                        
            Total number of patients with at least one adverse event   2 (13.3%)    5 (33.3%)      7 (46.7%)   
            Total number of events                                         3            5              10      
            dcd D.2.1.5.3                                              2 (13.3%)    5 (33.3%)      7 (46.7%)   
        cl C.1                                                                                                 
          Total number of patients with at least one adverse event     4 (26.7%)    4 (26.7%)      5 (33.3%)   
          Total number of events                                           4            9              10      
          dcd C.1.1.1.3                                                                                        
            Total number of patients with at least one adverse event   4 (26.7%)    4 (26.7%)      5 (33.3%)   
            Total number of events                                         4            9              10      
            dcd C.1.1.1.3                                              4 (26.7%)    4 (26.7%)      5 (33.3%)   

