# dtht01 can handle all NA values

    Code
      res
    Output
                                             A: Drug X    B: Placebo   C: Combination
                                              (N=134)      (N=134)        (N=132)    
        —————————————————————————————————————————————————————————————————————————————
        Total number of deaths               25 (18.7%)   23 (17.2%)     22 (16.7%)  
        Days from last drug administration                                           
          n                                      25           23             22      
          <=30                               14 (56.0%)   11 (47.8%)     14 (63.6%)  
          >30                                11 (44.0%)   12 (52.2%)     8 (36.4%)   

# dtht01 can handle some NA values

    Code
      res
    Output
                                                                    A: Drug X    B: Placebo   C: Combination
                                                                     (N=134)      (N=134)        (N=132)    
        ————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of deaths                                      25 (18.7%)   23 (17.2%)     22 (16.7%)  
        Primary cause of death                                                                              
          n                                                             24           23             22      
          ADVERSE EVENT                                             8 (33.3%)    7 (30.4%)      10 (45.5%)  
          PROGRESSIVE DISEASE                                       8 (33.3%)    6 (26.1%)      6 (27.3%)   
          OTHER                                                     8 (33.3%)    10 (43.5%)     6 (27.3%)   
                LOST TO FOLLOW UP                                    2 (8.0%)     2 (8.7%)       2 (9.1%)   
                MISSING                                              2 (8.0%)    3 (13.0%)       2 (9.1%)   
                Post-study reporting of death                        1 (4.0%)     2 (8.7%)       1 (4.5%)   
                SUICIDE                                              2 (8.0%)     2 (8.7%)       1 (4.5%)   
                UNKNOWN                                              1 (4.0%)     1 (4.3%)          0       
        Days from last drug administration                                                                  
          n                                                             25           23             22      
          <=30                                                      14 (56.0%)   11 (47.8%)     14 (63.6%)  
          >30                                                       11 (44.0%)   12 (52.2%)     8 (36.4%)   
        Primary cause by days from last study drug administration                                           
          <=30                                                                                              
            n                                                           13           11             14      
            ADVERSE EVENT                                           3 (23.1%)    2 (18.2%)      6 (42.9%)   
            PROGRESSIVE DISEASE                                     6 (46.2%)    3 (27.3%)      4 (28.6%)   
            OTHER                                                   4 (30.8%)    6 (54.5%)      4 (28.6%)   
          >30                                                                                               
            n                                                           11           12             8       
            ADVERSE EVENT                                           5 (45.5%)    5 (41.7%)      4 (50.0%)   
            PROGRESSIVE DISEASE                                     2 (18.2%)    3 (25.0%)      2 (25.0%)   
            OTHER                                                   4 (36.4%)    4 (33.3%)      2 (25.0%)   

# dtht01 can be parametrize as expected

    Code
      res
    Output
                                                                    A: Drug X    B: Placebo   C: Combination
                                                                     (N=134)      (N=134)        (N=132)    
        ————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of deaths                                      25 (18.7%)   23 (17.2%)     22 (16.7%)  
        Primary cause of death                                                                              
          n                                                             25           23             22      
          ADVERSE EVENT                                             9 (36.0%)    7 (30.4%)      10 (45.5%)  
          PROGRESSIVE DISEASE                                       8 (32.0%)    6 (26.1%)      6 (27.3%)   
          OTHER                                                     8 (32.0%)    10 (43.5%)     6 (27.3%)   
                LOST TO FOLLOW UP                                    2 (8.0%)     2 (8.7%)       2 (9.1%)   
                MISSING                                              2 (8.0%)    3 (13.0%)       2 (9.1%)   
                Post-study reporting of death                        1 (4.0%)     2 (8.7%)       1 (4.5%)   
                SUICIDE                                              2 (8.0%)     2 (8.7%)       1 (4.5%)   
                UNKNOWN                                              1 (4.0%)     1 (4.3%)          0       
        Days from last drug administration                                                                  
          n                                                             25           23             22      
          <=30                                                      14 (56.0%)   11 (47.8%)     14 (63.6%)  
          >30                                                       11 (44.0%)   12 (52.2%)     8 (36.4%)   
        Primary cause by days from last study drug administration                                           
          <=30                                                                                              
            n                                                           14           11             14      
            ADVERSE EVENT                                           4 (28.6%)    2 (18.2%)      6 (42.9%)   
            PROGRESSIVE DISEASE                                     6 (42.9%)    3 (27.3%)      4 (28.6%)   
            OTHER                                                   4 (28.6%)    6 (54.5%)      4 (28.6%)   
          >30                                                                                               
            n                                                           11           12             8       
            ADVERSE EVENT                                           5 (45.5%)    5 (41.7%)      4 (50.0%)   
            PROGRESSIVE DISEASE                                     2 (18.2%)    3 (25.0%)      2 (25.0%)   
            OTHER                                                   4 (36.4%)    4 (33.3%)      2 (25.0%)   

