# cmt02_pt can handle all NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Other Treatment                                         A: Drug X    B: Placebo    C: Combination
                                                                 (N=134)       (N=134)        (N=132)    
        —————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one treatment   122 (91.0%)   123 (91.8%)    120 (90.9%)  
        Total number of treatments                                 609           622            703      
        No Coding Available                                    122 (91.0%)   123 (91.8%)    120 (90.9%)  

# cmt02_pt can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100))
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
        No Coding Available                                     1 (0.7%)          0              0       

