# egt02_1 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Assessment      A: Drug X      B: Placebo    C: Combination
         Abnormality      (N=15)         (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————
        Heart Rate                                                 
          Low          4/15 (26.7%)    6/15 (40%)     4/15 (26.7%) 
          High         5/15 (33.3%)    3/15 (20%)     4/15 (26.7%) 
        QT Duration                                                
          Low          5/15 (33.3%)    6/15 (40%)     4/15 (26.7%) 
          High         4/15 (26.7%)    6/15 (40%)      3/15 (20%)  
        RR Duration                                                
          Low           9/15 (60%)    5/15 (33.3%)     6/15 (40%)  
          High          6/15 (40%)    7/15 (46.7%)     3/15 (20%)  

# egt02_2 functions with default value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Assessment      A: Drug X      B: Placebo    C: Combination
         Abnormality      (N=15)         (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————
        Heart Rate                                                 
          Low          4/15 (26.7%)   5/14 (35.7%)    4/15 (26.7%) 
          High         3/13 (23.1%)    3/15 (20%)     3/14 (21.4%) 
        QT Duration                                                
          Low          2/12 (16.7%)    6/15 (40%)     3/14 (21.4%) 
          High         3/14 (21.4%)    6/15 (40%)     2/14 (14.3%) 
        RR Duration                                                
          Low           9/15 (60%)    3/13 (23.1%)    5/14 (35.7%) 
          High         4/13 (30.8%)   5/13 (38.5%)     3/15 (20%)  

