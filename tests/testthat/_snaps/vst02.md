# vst02 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Assessment                   A: Drug X        B: Placebo     C: Combination
         Abnormality                  (N=134)          (N=134)          (N=132)    
        ———————————————————————————————————————————————————————————————————————————
        Diastolic Blood Pressure                                                   
          Low                      69/134 (51.5%)   73/134 (54.5%)   67/132 (50.8%)
          High                     76/134 (56.7%)    67/134 (50%)    65/132 (49.2%)
        Pulse Rate                                                                 
          Low                       75/134 (56%)     67/134 (50%)    69/132 (52.3%)
          High                      67/134 (50%)    74/134 (55.2%)   53/132 (40.2%)
        Respiratory Rate                                                           
          Low                      70/134 (52.2%)   72/134 (53.7%)   64/132 (48.5%)
          High                      75/134 (56%)    65/134 (48.5%)   71/132 (53.8%)
        Systolic Blood Pressure                                                    
          Low                       71/134 (53%)    69/134 (51.5%)    70/132 (53%) 
          High                     78/134 (58.2%)   62/134 (46.3%)   64/132 (48.5%)
        Temperature                                                                
          Low                      66/134 (49.3%)   68/134 (50.7%)   81/132 (61.4%)
          High                      67/134 (50%)    66/134 (49.3%)   69/132 (52.3%)
        Weight                                                                     
          Low                      73/134 (54.5%)    71/134 (53%)    76/132 (57.6%)
          High                     69/134 (51.5%)   74/134 (55.2%)   74/132 (56.1%)

# vst02 functions return expected result with test data when excluding subject with baseline abnormality

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Assessment                   A: Drug X        B: Placebo     C: Combination
         Abnormality                  (N=134)          (N=134)          (N=132)    
        ———————————————————————————————————————————————————————————————————————————
        Diastolic Blood Pressure                                                   
          Low                      55/120 (45.8%)   60/121 (49.6%)   53/118 (44.9%)
          High                     55/113 (48.7%)   56/123 (45.5%)   52/119 (43.7%)
        Pulse Rate                                                                 
          Low                      66/125 (52.8%)   54/121 (44.6%)   55/118 (46.6%)
          High                     52/119 (43.7%)   59/119 (49.6%)   38/117 (32.5%)
        Respiratory Rate                                                           
          Low                       59/123 (48%)    56/118 (47.5%)   50/118 (42.4%)
          High                     65/124 (52.4%)   58/127 (45.7%)   57/118 (48.3%)
        Systolic Blood Pressure                                                    
          Low                      53/116 (45.7%)   55/120 (45.8%)   58/120 (48.3%)
          High                     65/121 (53.7%)   53/125 (42.4%)   56/124 (45.2%)
        Temperature                                                                
          Low                      51/119 (42.9%)   53/119 (44.5%)   64/115 (55.7%)
          High                     61/128 (47.7%)   53/121 (43.8%)   59/122 (48.4%)
        Weight                                                                     
          Low                      59/120 (49.2%)   54/117 (46.2%)   63/119 (52.9%)
          High                     58/123 (47.2%)   61/121 (50.4%)   55/113 (48.7%)
