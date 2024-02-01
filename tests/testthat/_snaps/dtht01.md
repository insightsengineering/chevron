# dtht01 can handle all NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                 A: Drug X   B: Placebo   C: Combination
                                  (N=15)       (N=15)         (N=15)    
        ————————————————————————————————————————————————————————————————
        Total number of deaths   2 (13.3%)   4 (26.7%)      3 (20.0%)   
        Primary Cause of Death                                          
          n                          0           0              0       
          Adverse Event              0           0              0       
          Progressive Disease        0           0              0       
          Other                      0           0              0       

# dtht01 can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                    A: Drug X   B: Placebo   C: Combination
                                                                     (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of deaths                                      2 (13.3%)   4 (26.7%)      3 (20.0%)   
        Primary Cause of Death                                                                             
          n                                                             1           4              3       
          Adverse Event                                                 0       2 (50.0%)      1 (33.3%)   
          Progressive Disease                                       1 (100%)        0          2 (66.7%)   
          Other                                                         0       2 (50.0%)          0       
            LOST TO FOLLOW UP                                           0        1 (50%)           0       
            SUICIDE                                                     0        1 (50%)           0       
        Days from last drug administration                                                                 
          n                                                             2           4              3       
          <=30                                                      2 (100%)    1 (25.0%)      2 (66.7%)   
          >30                                                           0       3 (75.0%)      1 (33.3%)   
        Primary cause by days from last study drug administration                                          
          <=30                                                                                             
            n                                                           2           1              2       
            Adverse Event                                               0           0          1 (50.0%)   
            Progressive Disease                                     1 (50.0%)       0          1 (50.0%)   
            Other                                                       0        1 (100%)          0       
          >30                                                                                              
            n                                                           0           3              1       
            Adverse Event                                               0       2 (66.7%)          0       
            Progressive Disease                                         0           0           1 (100%)   
            Other                                                       0       1 (33.3%)          0       

# dtht01 can be parametrize as expected

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                    A: Drug X   B: Placebo   C: Combination
                                                                     (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of deaths                                      2 (13.3%)   4 (26.7%)      3 (20.0%)   
        Primary Cause of Death                                                                             
          n                                                             2           4              3       
          Adverse Event                                             1 (50.0%)   2 (50.0%)      1 (33.3%)   
          Progressive Disease                                       1 (50.0%)       0          2 (66.7%)   
          Other                                                         0       2 (50.0%)          0       
            LOST TO FOLLOW UP                                           0        1 (50%)           0       
            SUICIDE                                                     0        1 (50%)           0       
        Days from last drug administration                                                                 
          n                                                             2           4              3       
          <=30                                                      2 (100%)    1 (25.0%)      2 (66.7%)   
          >30                                                           0       3 (75.0%)      1 (33.3%)   
        Primary cause by days from last study drug administration                                          
          <=30                                                                                             
            n                                                           2           1              2       
            Adverse Event                                           1 (50.0%)       0          1 (50.0%)   
            Progressive Disease                                     1 (50.0%)       0          1 (50.0%)   
            Other                                                       0        1 (100%)          0       
          >30                                                                                              
            n                                                           0           3              1       
            Adverse Event                                               0       2 (66.7%)          0       
            Progressive Disease                                         0           0           1 (100%)   
            Other                                                       0       1 (33.3%)          0       

