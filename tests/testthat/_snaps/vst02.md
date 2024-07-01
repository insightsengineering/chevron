# vst02 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Assessment                   A: Drug X      B: Placebo     C: Combination
         Abnormality                  (N=15)          (N=15)           (N=15)    
        —————————————————————————————————————————————————————————————————————————
        Diastolic Blood Pressure                                                 
          Low                      8/15 (53.3%)     9/15 (60%)      8/15 (53.3%) 
          High                     10/15 (66.7%)   5/15 (33.3%)     8/15 (53.3%) 
        Pulse Rate                                                               
          Low                       9/15 (60%)      3/15 (20%)      5/15 (33.3%) 
          High                     2/15 (13.3%)     6/15 (40%)      5/15 (33.3%) 
        Respiratory Rate                                                         
          Low                      13/15 (86.7%)   10/15 (66.7%)   13/15 (86.7%) 
          High                     7/15 (46.7%)    10/15 (66.7%)   11/15 (73.3%) 
        Systolic Blood Pressure                                                  
          Low                      7/15 (46.7%)     9/15 (60%)     11/15 (73.3%) 
          High                     10/15 (66.7%)    9/15 (60%)       9/15 (60%)  
        Temperature                                                              
          Low                       12/15 (80%)    13/15 (86.7%)   11/15 (73.3%) 
          High                     14/15 (93.3%)    12/15 (80%)    14/15 (93.3%) 
        Weight                                                                   
          Low                       3/15 (20%)      3/15 (20%)      4/15 (26.7%) 
          High                     4/15 (26.7%)    4/15 (26.7%)     5/15 (33.3%) 

# vst02 functions return expected result with test data when excluding subject with baseline abnormality

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Assessment                  A: Drug X      B: Placebo    C: Combination
         Abnormality                  (N=15)         (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————————————————
        Diastolic Blood Pressure                                               
          Low                      6/11 (54.5%)    9/15 (60%)      6/12 (50%)  
          High                     8/12 (66.7%)   4/11 (36.4%)    7/13 (53.8%) 
        Pulse Rate                                                             
          Low                       9/15 (60%)     3/15 (20%)     5/13 (38.5%) 
          High                     2/14 (14.3%)   4/12 (33.3%)    5/15 (33.3%) 
        Respiratory Rate                                                       
          Low                      7/9 (77.8%)    7/11 (63.6%)   11/12 (91.7%) 
          High                     6/14 (42.9%)   7/11 (63.6%)    9/13 (69.2%) 
        Systolic Blood Pressure                                                
          Low                      5/13 (38.5%)   8/12 (66.7%)   10/14 (71.4%) 
          High                     8/13 (61.5%)   8/13 (61.5%)    8/13 (61.5%) 
        Temperature                                                            
          Low                       8/10 (80%)    7/9 (77.8%)      8/10 (80%)  
          High                      8/8 (100%)    7/8 (87.5%)    12/13 (92.3%) 
        Weight                                                                 
          Low                       3/15 (20%)     3/15 (20%)     3/14 (21.4%) 
          High                     4/14 (28.6%)   4/15 (26.7%)    5/14 (35.7%) 

