# dtht01 can handle all NA values

    Code
      res
    Output
                                           A: Drug X    B: Placebo   C: Combination
                                            (N=134)      (N=134)        (N=132)    
      -----------------------------------------------------------------------------
      Total number of deaths               22 (16.4%)   26 (19.4%)     19 (14.4%)  
      Days from last drug administration                                           
        n                                      22           26             19      
        <=30                               12 (54.5%)   16 (61.5%)     10 (52.6%)  
        >30                                10 (45.5%)   10 (38.5%)     9 (47.4%)   

# dtht01 can handle some NA values

    Code
      res
    Output
                                                                  A: Drug X    B: Placebo   C: Combination
                                                                   (N=134)      (N=134)        (N=132)    
      ----------------------------------------------------------------------------------------------------
      Total number of deaths                                      22 (16.4%)   26 (19.4%)     19 (14.4%)  
      Primary cause of death                                                                              
        n                                                             22           26             19      
        1                                                         6 (27.3%)    12 (46.2%)     7 (36.8%)   
        2                                                         9 (40.9%)    5 (19.2%)      4 (21.1%)   
        3                                                         7 (31.8%)    9 (34.6%)      8 (42.1%)   
      Days from last drug administration                                                                  
        n                                                             22           26             19      
        <=30                                                      12 (54.5%)   16 (61.5%)     10 (52.6%)  
        >30                                                       10 (45.5%)   10 (38.5%)     9 (47.4%)   
      Primary cause by days from last study drug administration                                           
        <=30                                                                                              
          n                                                           12           16             10      
          1                                                        3 (25%)     9 (56.2%)       4 (40%)    
          2                                                        6 (50%)     3 (18.8%)       3 (30%)    
          3                                                        3 (25%)      4 (25%)        3 (30%)    
        >30                                                                                               
          n                                                           10           10             9       
          1                                                        3 (30%)      3 (30%)       3 (33.3%)   
          2                                                        3 (30%)      2 (20%)       1 (11.1%)   
          3                                                        4 (40%)      5 (50%)       5 (55.6%)   

