# cmt01a can handle all NA values

    Code
      res
    Output
        ATC Level 2 Text                                          A: Drug X    B: Placebo    C: Combination
          Standardized Medication Name                             (N=134)       (N=134)        (N=132)    
        ———————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one treatment     122 (91.0%)   123 (91.8%)    120 (90.9%)  
        Total number of treatments                                   609           622            703      
        No Coding Available                                                                                
          Total number of patients with at least one treatment   122 (91.0%)   123 (91.8%)    120 (90.9%)  
          Total number of treatments                                 609           622            703      
          No Coding Available                                    122 (91.0%)   123 (91.8%)    120 (90.9%)  

# cmt01a can handle some NA values

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
          Total number of patients with at least one treatment   101 (75.4%)   101 (75.4%)    108 (81.8%)  
          Total number of treatments                                 263           275            306      
          medname B_1/4                                          51 (38.1%)    57 (42.5%)      59 (44.7%)  
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
          Total number of patients with at least one treatment   81 (60.4%)    84 (62.7%)      89 (67.4%)  
          Total number of treatments                                 139           140            155      
          medname C_2/2                                          52 (38.8%)    58 (43.3%)      60 (45.5%)  
          medname C_1/2                                          50 (37.3%)    50 (37.3%)      56 (42.4%)  
        ATCCLAS2 C p2                                                                                      
          Total number of patients with at least one treatment   82 (61.2%)    84 (62.7%)      89 (67.4%)  
          Total number of treatments                                 140           140            155      
          medname C_2/2                                          52 (38.8%)    58 (43.3%)      60 (45.5%)  
          medname C_1/2                                          51 (38.1%)    50 (37.3%)      56 (42.4%)  
        ATCCLAS2 C p3                                                                                      
          Total number of patients with at least one treatment   52 (38.8%)    58 (43.3%)      60 (45.5%)  
          Total number of treatments                                 69            73              80      
          medname C_2/2                                          52 (38.8%)    58 (43.3%)      60 (45.5%)  
        No Coding Available                                                                                
          Total number of patients with at least one treatment    1 (0.7%)          0              0       
          Total number of treatments                                  2             0              0       
          No Coding Available                                     1 (0.7%)          0              0       

