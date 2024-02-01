# cmt02_pt can handle all NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                               A: Drug X    B: Placebo   C: Combination
        Other Treatment                                          (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one treatment   13 (86.7%)   14 (93.3%)     15 (100%)   
        Total number of treatments                                 58           59             99      
        No Coding Available                                    13 (86.7%)   14 (93.3%)     15 (100%)   

# cmt02_pt can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                               A: Drug X    B: Placebo   C: Combination
        Other Treatment                                          (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one treatment   13 (86.7%)   14 (93.3%)     15 (100%)   
        Total number of treatments                                 58           59             99      
        medname B_2/4                                          6 (40.0%)    5 (33.3%)      10 (66.7%)  
        medname B_3/4                                          7 (46.7%)    6 (40.0%)      8 (53.3%)   
        medname A_3/3                                          5 (33.3%)    8 (53.3%)      6 (40.0%)   
        medname B_1/4                                          7 (46.7%)    6 (40.0%)      6 (40.0%)   
        medname A_2/3                                          5 (33.3%)    6 (40.0%)      7 (46.7%)   
        medname B_4/4                                          4 (26.7%)    5 (33.3%)      8 (53.3%)   
        medname C_2/2                                          4 (26.7%)    5 (33.3%)      7 (46.7%)   
        medname A_1/3                                          4 (26.7%)    3 (20.0%)      8 (53.3%)   
        medname C_1/2                                          6 (40.0%)    2 (13.3%)      6 (40.0%)   
        No Coding Available                                     1 (6.7%)        0              0       

