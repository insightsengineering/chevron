# egt02_1 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Assessment      A: Drug X      B: Placebo    C: Combination
         Abnormality      (N=15)         (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————
        Heart Rate                                                 
          Low          4/15 (26.7%)   4/15 (26.7%)    4/15 (26.7%) 
          High         4/15 (26.7%)    3/15 (20%)      3/15 (20%)  
        QT Duration                                                
          Low          2/15 (13.3%)   5/15 (33.3%)     3/15 (20%)  
          High          3/15 (20%)     6/15 (40%)     2/15 (13.3%) 
        RR Duration                                                
          Low           6/15 (40%)    2/15 (13.3%)    4/15 (26.7%) 
          High         4/15 (26.7%)   5/15 (33.3%)    2/15 (13.3%) 

# egt02_2 functions with default value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Assessment      A: Drug X      B: Placebo    C: Combination
         Abnormality      (N=15)         (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————
        Heart Rate                                                 
          Low          4/15 (26.7%)   4/14 (28.6%)    4/15 (26.7%) 
          High         3/13 (23.1%)    3/15 (20%)     2/14 (14.3%) 
        QT Duration                                                
          Low          2/12 (16.7%)   5/15 (33.3%)    3/14 (21.4%) 
          High         3/14 (21.4%)    6/15 (40%)     2/14 (14.3%) 
        RR Duration                                                
          Low           6/15 (40%)    2/13 (15.4%)    4/14 (28.6%) 
          High         4/13 (30.8%)   5/13 (38.5%)    2/15 (13.3%) 

