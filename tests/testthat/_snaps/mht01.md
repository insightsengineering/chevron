# mht01 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        MedDRA System Organ Class                                A: Drug X    B: Placebo   C: Combination
          MedDRA Preferred Term                                    (N=15)       (N=15)         (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one condition     13 (86.7%)   14 (93.3%)     15 (100%)   
        Total number of conditions                                   58           59             99      
        cl A                                                                                             
          Total number of patients with at least one condition   7 (46.7%)    6 (40.0%)      10 (66.7%)  
          Total number of conditions                                 8            11             16      
          trm A_2/2                                              5 (33.3%)    6 (40.0%)      6 (40.0%)   
          trm A_1/2                                              3 (20.0%)     1 (6.7%)      6 (40.0%)   
        cl B                                                                                             
          Total number of patients with at least one condition   12 (80.0%)   11 (73.3%)     12 (80.0%)  
          Total number of conditions                                 24           21             32      
          trm B_3/3                                              8 (53.3%)    6 (40.0%)      7 (46.7%)   
          trm B_1/3                                              5 (33.3%)    6 (40.0%)      8 (53.3%)   
          trm B_2/3                                              5 (33.3%)    6 (40.0%)      5 (33.3%)   
        cl C                                                                                             
          Total number of patients with at least one condition   8 (53.3%)    6 (40.0%)      11 (73.3%)  
          Total number of conditions                                 10           13             22      
          trm C_2/2                                              6 (40.0%)    4 (26.7%)      8 (53.3%)   
          trm C_1/2                                              4 (26.7%)    4 (26.7%)      5 (33.3%)   
        cl D                                                                                             
          Total number of patients with at least one condition   10 (66.7%)   7 (46.7%)      13 (86.7%)  
          Total number of conditions                                 16           14             29      
          trm D_1/3                                              4 (26.7%)    4 (26.7%)      7 (46.7%)   
          trm D_2/3                                              6 (40.0%)    2 (13.3%)      7 (46.7%)   
          trm D_3/3                                              2 (13.3%)    5 (33.3%)      7 (46.7%)   

# mht01 works

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        MedDRA System Organ Class                                A: Drug X    B: Placebo   C: Combination
          MedDRA Preferred Term                                    (N=15)       (N=15)         (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one condition     13 (86.7%)   14 (93.3%)     15 (100%)   
        Total number of conditions                                   58           59             99      
        cl A                                                                                             
          Total number of patients with at least one condition   7 (46.7%)    6 (40.0%)      10 (66.7%)  
          Total number of conditions                                 8            11             16      
          trm A_2/2                                              5 (33.3%)    6 (40.0%)      6 (40.0%)   
          trm A_1/2                                              3 (20.0%)     1 (6.7%)      6 (40.0%)   
        cl B                                                                                             
          Total number of patients with at least one condition   12 (80.0%)   11 (73.3%)     12 (80.0%)  
          Total number of conditions                                 24           21             32      
          trm B_3/3                                              8 (53.3%)    6 (40.0%)      7 (46.7%)   
          trm B_1/3                                              5 (33.3%)    6 (40.0%)      8 (53.3%)   
          trm B_2/3                                              5 (33.3%)    6 (40.0%)      5 (33.3%)   
        cl C                                                                                             
          Total number of patients with at least one condition   8 (53.3%)    6 (40.0%)      11 (73.3%)  
          Total number of conditions                                 10           13             22      
          trm C_2/2                                              6 (40.0%)    4 (26.7%)      8 (53.3%)   
          trm C_1/2                                              4 (26.7%)    4 (26.7%)      5 (33.3%)   
        cl D                                                                                             
          Total number of patients with at least one condition   10 (66.7%)   7 (46.7%)      13 (86.7%)  
          Total number of conditions                                 16           14             29      
          trm D_1/3                                              4 (26.7%)    4 (26.7%)      7 (46.7%)   
          trm D_2/3                                              6 (40.0%)    2 (13.3%)      7 (46.7%)   
          trm D_3/3                                              2 (13.3%)    5 (33.3%)      7 (46.7%)   

# mht01 works on NULL in lbl_mhbodsys or lbl_mhdecod

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        MedDRA System Organ Class                                A: Drug X    B: Placebo   C: Combination
          MedDRA Preferred Term                                    (N=15)       (N=15)         (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one condition     13 (86.7%)   14 (93.3%)     15 (100%)   
        Total number of conditions                                   58           59             99      
        cl A                                                                                             
          Total number of patients with at least one condition   7 (46.7%)    6 (40.0%)      10 (66.7%)  
          Total number of conditions                                 8            11             16      
          trm A_2/2                                              5 (33.3%)    6 (40.0%)      6 (40.0%)   
          trm A_1/2                                              3 (20.0%)     1 (6.7%)      6 (40.0%)   
        cl B                                                                                             
          Total number of patients with at least one condition   12 (80.0%)   11 (73.3%)     12 (80.0%)  
          Total number of conditions                                 24           21             32      
          trm B_3/3                                              8 (53.3%)    6 (40.0%)      7 (46.7%)   
          trm B_1/3                                              5 (33.3%)    6 (40.0%)      8 (53.3%)   
          trm B_2/3                                              5 (33.3%)    6 (40.0%)      5 (33.3%)   
        cl C                                                                                             
          Total number of patients with at least one condition   8 (53.3%)    6 (40.0%)      11 (73.3%)  
          Total number of conditions                                 10           13             22      
          trm C_2/2                                              6 (40.0%)    4 (26.7%)      8 (53.3%)   
          trm C_1/2                                              4 (26.7%)    4 (26.7%)      5 (33.3%)   
        cl D                                                                                             
          Total number of patients with at least one condition   10 (66.7%)   7 (46.7%)      13 (86.7%)  
          Total number of conditions                                 16           14             29      
          trm D_1/3                                              4 (26.7%)    4 (26.7%)      7 (46.7%)   
          trm D_2/3                                              6 (40.0%)    2 (13.3%)      7 (46.7%)   
          trm D_3/3                                              2 (13.3%)    5 (33.3%)      7 (46.7%)   

# mht01 works with other row_split_var

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Sex                                                                                                
          Ethnicity                                                A: Drug X    B: Placebo   C: Combination
            MedDRA Preferred Term                                    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one condition       13 (86.7%)   14 (93.3%)     15 (100%)   
        Total number of conditions                                     58           59             99      
        F                                                                                                  
          Total number of patients with at least one condition     10 (66.7%)   8 (53.3%)      10 (66.7%)  
          Total number of conditions                                   50           41             61      
          HISPANIC OR LATINO                                                                               
            Total number of patients with at least one condition    1 (6.7%)        0              0       
            Total number of conditions                                 5            0              0       
            trm A_2/2                                               1 (6.7%)        0              0       
            trm B_1/3                                               1 (6.7%)        0              0       
            trm B_2/3                                               1 (6.7%)        0              0       
            trm D_1/3                                               1 (6.7%)        0              0       
          NOT HISPANIC OR LATINO                                                                           
            Total number of patients with at least one condition   9 (60.0%)    8 (53.3%)      8 (53.3%)   
            Total number of conditions                                 45           41             52      
            trm B_3/3                                              8 (53.3%)    4 (26.7%)      4 (26.7%)   
            trm C_2/2                                              5 (33.3%)    4 (26.7%)      3 (20.0%)   
            trm B_1/3                                              4 (26.7%)    3 (20.0%)      4 (26.7%)   
            trm A_2/2                                              3 (20.0%)    5 (33.3%)      2 (13.3%)   
            trm D_1/3                                              2 (13.3%)    3 (20.0%)      5 (33.3%)   
            trm D_3/3                                              2 (13.3%)    4 (26.7%)      4 (26.7%)   
            trm B_2/3                                              2 (13.3%)    4 (26.7%)      2 (13.3%)   
            trm C_1/2                                              2 (13.3%)    3 (20.0%)      3 (20.0%)   
            trm D_2/3                                              5 (33.3%)     1 (6.7%)      2 (13.3%)   
            trm A_1/2                                              3 (20.0%)     1 (6.7%)      3 (20.0%)   
          NOT REPORTED                                                                                     
            Total number of patients with at least one condition       0            0          2 (13.3%)   
            Total number of conditions                                 0            0              9       
            trm D_2/3                                                  0            0          2 (13.3%)   
            trm A_1/2                                                  0            0           1 (6.7%)   
            trm A_2/2                                                  0            0           1 (6.7%)   
            trm B_1/3                                                  0            0           1 (6.7%)   
            trm C_1/2                                                  0            0           1 (6.7%)   
            trm C_2/2                                                  0            0           1 (6.7%)   
        M                                                                                                  
          Total number of patients with at least one condition     3 (20.0%)    6 (40.0%)      5 (33.3%)   
          Total number of conditions                                   8            18             38      
          HISPANIC OR LATINO                                                                               
            Total number of patients with at least one condition    1 (6.7%)        0              0       
            Total number of conditions                                 2            0              0       
            trm B_2/3                                               1 (6.7%)        0              0       
            trm C_1/2                                               1 (6.7%)        0              0       
          NOT HISPANIC OR LATINO                                                                           
            Total number of patients with at least one condition   2 (13.3%)    6 (40.0%)      5 (33.3%)   
            Total number of conditions                                 6            18             38      
            trm B_1/3                                                  0        3 (20.0%)      3 (20.0%)   
            trm B_2/3                                               1 (6.7%)    2 (13.3%)      3 (20.0%)   
            trm A_2/2                                               1 (6.7%)     1 (6.7%)      3 (20.0%)   
            trm B_3/3                                                  0        2 (13.3%)      3 (20.0%)   
            trm C_2/2                                               1 (6.7%)        0          4 (26.7%)   
            trm D_2/3                                               1 (6.7%)     1 (6.7%)      3 (20.0%)   
            trm D_1/3                                               1 (6.7%)     1 (6.7%)      2 (13.3%)   
            trm D_3/3                                                  0         1 (6.7%)      3 (20.0%)   
            trm C_1/2                                               1 (6.7%)     1 (6.7%)       1 (6.7%)   
            trm A_1/2                                                  0            0          2 (13.3%)   

