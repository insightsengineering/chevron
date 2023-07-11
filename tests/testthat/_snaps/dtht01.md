# dtht01 can handle all NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                 A: Drug X    B: Placebo   C: Combination
                                  (N=134)      (N=134)        (N=132)    
        —————————————————————————————————————————————————————————————————
        Total number of deaths   25 (18.7%)   23 (17.2%)     22 (16.7%)  
        Primary Cause of Death                                           
          n                          0            0              0       
          Adverse Event              0            0              0       
          Progressive Disease        0            0              0       
          Other                      0            0              0       

# dtht01 can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                    A: Drug X    B: Placebo   C: Combination
                                                                     (N=134)      (N=134)        (N=132)    
        ————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of deaths                                      25 (18.7%)   23 (17.2%)     22 (16.7%)  
        Primary Cause of Death                                                                              
          n                                                             24           23             22      
          Adverse Event                                             8 (33.3%)    7 (30.4%)      10 (45.5%)  
          Progressive Disease                                       8 (33.3%)    6 (26.1%)      6 (27.3%)   
          Other                                                     8 (33.3%)    10 (43.5%)     6 (27.3%)   
            LOST TO FOLLOW UP                                        2 (8.3%)     2 (8.3%)       2 (8.3%)   
            MISSING                                                  2 (8.3%)    3 (12.5%)       2 (8.3%)   
            Post-study reporting of death                            1 (4.2%)     2 (8.3%)       1 (4.2%)   
            SUICIDE                                                  2 (8.3%)     2 (8.3%)       1 (4.2%)   
            UNKNOWN                                                  1 (4.2%)     1 (4.2%)          0       
        Days from last drug administration                                                                  
          n                                                             25           23             22      
          <=30                                                      14 (56.0%)   11 (47.8%)     14 (63.6%)  
          >30                                                       11 (44.0%)   12 (52.2%)     8 (36.4%)   
        Primary cause by days from last study drug administration                                           
          <=30                                                                                              
            n                                                           14           11             14      
            Adverse Event                                           3 (21.4%)    2 (18.2%)      6 (42.9%)   
            Progressive Disease                                     6 (42.9%)    3 (27.3%)      4 (28.6%)   
            Other                                                   4 (28.6%)    6 (54.5%)      4 (28.6%)   
          >30                                                                                               
            n                                                           11           12             8       
            Adverse Event                                           5 (45.5%)    5 (41.7%)      4 (50.0%)   
            Progressive Disease                                     2 (18.2%)    3 (25.0%)      2 (25.0%)   
            Other                                                   4 (36.4%)    4 (33.3%)      2 (25.0%)   

# dtht01 can be parametrize as expected

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                    A: Drug X    B: Placebo   C: Combination
                                                                     (N=134)      (N=134)        (N=132)    
        ————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of deaths                                      25 (18.7%)   23 (17.2%)     22 (16.7%)  
        Primary Cause of Death                                                                              
          n                                                             25           23             22      
          Adverse Event                                             9 (36.0%)    7 (30.4%)      10 (45.5%)  
          Progressive Disease                                       8 (32.0%)    6 (26.1%)      6 (27.3%)   
          Other                                                     8 (32.0%)    10 (43.5%)     6 (27.3%)   
            LOST TO FOLLOW UP                                        2 (8.3%)     2 (8.3%)       2 (8.3%)   
            MISSING                                                  2 (8.3%)    3 (12.5%)       2 (8.3%)   
            Post-study reporting of death                            1 (4.2%)     2 (8.3%)       1 (4.2%)   
            SUICIDE                                                  2 (8.3%)     2 (8.3%)       1 (4.2%)   
            UNKNOWN                                                  1 (4.2%)     1 (4.2%)          0       
        Days from last drug administration                                                                  
          n                                                             25           23             22      
          <=30                                                      14 (56.0%)   11 (47.8%)     14 (63.6%)  
          >30                                                       11 (44.0%)   12 (52.2%)     8 (36.4%)   
        Primary cause by days from last study drug administration                                           
          <=30                                                                                              
            n                                                           14           11             14      
            Adverse Event                                           4 (28.6%)    2 (18.2%)      6 (42.9%)   
            Progressive Disease                                     6 (42.9%)    3 (27.3%)      4 (28.6%)   
            Other                                                   4 (28.6%)    6 (54.5%)      4 (28.6%)   
          >30                                                                                               
            n                                                           11           12             8       
            Adverse Event                                           5 (45.5%)    5 (41.7%)      4 (50.0%)   
            Progressive Disease                                     2 (18.2%)    3 (25.0%)      2 (25.0%)   
            Other                                                   4 (36.4%)    4 (33.3%)      2 (25.0%)   

