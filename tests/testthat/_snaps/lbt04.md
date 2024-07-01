# lbt04 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      
      PARCAT1: CHEMISTRY
      
        ———————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                           A: Drug X    B: Placebo    C: Combination
            Direction of Abnormality               (N=15)        (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                               
          Low                                        0/7           0/2        1/7 (14.3%)  
          High                                       0/7           0/3            0/8      
        C-Reactive Protein Measurement                                                     
          Low                                        0/8       1/2 (50.0%)        0/6      
          High                                   3/8 (37.5%)       0/2            0/7      
        Immunoglobulin A Measurement                                                       
          Low                                        0/5           0/8            0/7      
          High                                   1/3 (33.3%)   1/8 (12.5%)        0/6      
      \s\n
      PARCAT1: COAGULATION
      
        ———————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                           A: Drug X    B: Placebo    C: Combination
            Direction of Abnormality               (N=15)        (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                               
          Low                                        0/3           0/6            0/4      
          High                                       0/5           0/7            0/4      
        C-Reactive Protein Measurement                                                     
          Low                                        0/5           0/5        1/3 (33.3%)  
          High                                       0/5       1/6 (16.7%)    1/4 (25.0%)  
        Immunoglobulin A Measurement                                                       
          Low                                        0/8           0/9            0/6      
          High                                       0/8           0/9        1/6 (16.7%)  
      \s\n
      PARCAT1: HEMATOLOGY
      
        ———————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                           A: Drug X    B: Placebo    C: Combination
            Direction of Abnormality               (N=15)        (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                               
          Low                                        0/4           0/5            0/4      
          High                                       0/6           0/5            0/4      
        C-Reactive Protein Measurement                                                     
          Low                                        0/5           0/4            0/3      
          High                                       0/5           0/4            0/5      
        Immunoglobulin A Measurement                                                       
          Low                                        0/3           0/4            0/8      
          High                                       0/3           0/4            0/7      

# lbt04 can handle all NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                                                
        ————————————————————————————————————————————————————————————————————————————————————————
           Null Report: No observations met the reporting criteria for inclusion in this output.

# lbt04 can handle missing levels

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      
      PARCAT1: CHEMISTRY
      
        ————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                          A: Drug X   B: Placebo   C: Combination
            Direction of Abnormality              (N=15)       (N=15)         (N=15)    
        ————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                            
          Low                                       0/7         0/2            0/7      
          High                                      0/7         0/3            0/8      
        C-Reactive Protein Measurement                                                  
          Low                                       0/8         0/2            0/6      
          High                                      0/8         0/2            0/7      
        Immunoglobulin A Measurement                                                    
          Low                                       0/5         0/8            0/7      
          High                                      0/3         0/8            0/6      
      \s\n
      PARCAT1: COAGULATION
      
        ————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                          A: Drug X   B: Placebo   C: Combination
            Direction of Abnormality              (N=15)       (N=15)         (N=15)    
        ————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                            
          Low                                       0/3         0/6            0/4      
          High                                      0/5         0/7            0/4      
        C-Reactive Protein Measurement                                                  
          Low                                       0/5         0/5            0/3      
          High                                      0/5         0/6            0/4      
        Immunoglobulin A Measurement                                                    
          Low                                       0/8         0/9            0/6      
          High                                      0/8         0/9            0/6      
      \s\n
      PARCAT1: HEMATOLOGY
      
        ————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                          A: Drug X   B: Placebo   C: Combination
            Direction of Abnormality              (N=15)       (N=15)         (N=15)    
        ————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                            
          Low                                       0/4         0/5            0/4      
          High                                      0/6         0/5            0/4      
        C-Reactive Protein Measurement                                                  
          Low                                       0/5         0/4            0/3      
          High                                      0/5         0/4            0/5      
        Immunoglobulin A Measurement                                                    
          Low                                       0/3         0/4            0/8      
          High                                      0/3         0/4            0/7      

# lbt04 can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      
      PARCAT1: CHEMISTRY
      
        ———————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                           A: Drug X    B: Placebo    C: Combination
            Direction of Abnormality               (N=15)        (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                               
          Low                                        0/7           0/2        1/7 (14.3%)  
          High                                       0/7           0/3            0/8      
        C-Reactive Protein Measurement                                                     
          Low                                        0/8       1/2 (50.0%)        0/6      
          High                                   3/8 (37.5%)       0/2            0/7      
        Immunoglobulin A Measurement                                                       
          Low                                        0/5           0/8            0/7      
          High                                   1/3 (33.3%)   1/8 (12.5%)        0/6      
      \s\n
      PARCAT1: COAGULATION
      
        ———————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                           A: Drug X    B: Placebo    C: Combination
            Direction of Abnormality               (N=15)        (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                               
          Low                                        0/3           0/6            0/4      
          High                                       0/5           0/7            0/4      
        C-Reactive Protein Measurement                                                     
          Low                                        0/5           0/5        1/3 (33.3%)  
          High                                       0/5       1/6 (16.7%)    1/4 (25.0%)  
        Immunoglobulin A Measurement                                                       
          Low                                        0/8           0/9            0/6      
          High                                       0/8           0/9        1/6 (16.7%)  
      \s\n
      PARCAT1: HEMATOLOGY
      
        ———————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                           A: Drug X    B: Placebo    C: Combination
            Direction of Abnormality               (N=15)        (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                               
          Low                                        0/4           0/5            0/4      
          High                                       0/6           0/5            0/4      
        C-Reactive Protein Measurement                                                     
          Low                                        0/5           0/4            0/3      
          High                                       0/5           0/4            0/5      
        Immunoglobulin A Measurement                                                       
          Low                                        0/3           0/4            0/8      
          High                                       0/3           0/4            0/7      

