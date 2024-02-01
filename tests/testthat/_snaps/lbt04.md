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
          Low                                    1/7 (14.3%)   1/3 (33.3%)        0/8      
          High                                   2/7 (28.6%)       0/2        1/9 (11.1%)  
        C-Reactive Protein Measurement                                                     
          Low                                        0/8           0/2        2/7 (28.6%)  
          High                                       0/8           0/3            0/7      
        Immunoglobulin A Measurement                                                       
          Low                                    2/5 (40.0%)   1/8 (12.5%)    1/6 (16.7%)  
          High                                   2/5 (40.0%)   1/9 (11.1%)        0/6      
      \s\n
      PARCAT1: COAGULATION
      
        ———————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                           A: Drug X    B: Placebo    C: Combination
            Direction of Abnormality               (N=15)        (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                               
          Low                                        0/5       1/5 (20.0%)        0/5      
          High                                       0/6       1/6 (16.7%)    1/5 (20.0%)  
        C-Reactive Protein Measurement                                                     
          Low                                    1/6 (16.7%)       0/5        1/4 (25.0%)  
          High                                   1/5 (20.0%)   1/6 (16.7%)        0/3      
        Immunoglobulin A Measurement                                                       
          Low                                        0/7           0/9            0/7      
          High                                   1/7 (14.3%)      0/10            0/6      
      \s\n
      PARCAT1: HEMATOLOGY
      
        ———————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                           A: Drug X    B: Placebo    C: Combination
            Direction of Abnormality               (N=15)        (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                               
          Low                                    1/5 (20.0%)   1/5 (20.0%)        0/4      
          High                                       0/5           0/4            0/4      
        C-Reactive Protein Measurement                                                     
          Low                                    1/4 (25.0%)       0/2        3/9 (33.3%)  
          High                                       0/4           0/5            0/9      
        Immunoglobulin A Measurement                                                       
          Low                                        0/2           0/3        2/8 (25.0%)  
          High                                       0/4       1/4 (25.0%)        0/7      

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
          Low                                       0/7         0/3            0/8      
          High                                      0/7         0/2            0/9      
        C-Reactive Protein Measurement                                                  
          Low                                       0/8         0/2            0/7      
          High                                      0/8         0/3            0/7      
        Immunoglobulin A Measurement                                                    
          Low                                       0/5         0/8            0/6      
          High                                      0/5         0/9            0/6      
      \s\n
      PARCAT1: COAGULATION
      
        ————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                          A: Drug X   B: Placebo   C: Combination
            Direction of Abnormality              (N=15)       (N=15)         (N=15)    
        ————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                            
          Low                                       0/5         0/5            0/5      
          High                                      0/6         0/6            0/5      
        C-Reactive Protein Measurement                                                  
          Low                                       0/6         0/5            0/4      
          High                                      0/5         0/6            0/3      
        Immunoglobulin A Measurement                                                    
          Low                                       0/7         0/9            0/7      
          High                                      0/7         0/10           0/6      
      \s\n
      PARCAT1: HEMATOLOGY
      
        ————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                          A: Drug X   B: Placebo   C: Combination
            Direction of Abnormality              (N=15)       (N=15)         (N=15)    
        ————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                            
          Low                                       0/5         0/5            0/4      
          High                                      0/5         0/4            0/4      
        C-Reactive Protein Measurement                                                  
          Low                                       0/4         0/2            0/9      
          High                                      0/4         0/5            0/9      
        Immunoglobulin A Measurement                                                    
          Low                                       0/2         0/3            0/8      
          High                                      0/4         0/4            0/7      

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
          Low                                    1/7 (14.3%)   1/3 (33.3%)        0/8      
          High                                   2/7 (28.6%)       0/2        1/9 (11.1%)  
        C-Reactive Protein Measurement                                                     
          Low                                        0/8           0/2        2/7 (28.6%)  
          High                                       0/8           0/3            0/7      
        Immunoglobulin A Measurement                                                       
          Low                                    2/5 (40.0%)   1/8 (12.5%)    1/6 (16.7%)  
          High                                   2/5 (40.0%)   1/9 (11.1%)        0/6      
      \s\n
      PARCAT1: COAGULATION
      
        ———————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                           A: Drug X    B: Placebo    C: Combination
            Direction of Abnormality               (N=15)        (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                               
          Low                                        0/5       1/5 (20.0%)        0/5      
          High                                       0/6       1/6 (16.7%)    1/5 (20.0%)  
        C-Reactive Protein Measurement                                                     
          Low                                    1/6 (16.7%)       0/5        1/4 (25.0%)  
          High                                   1/5 (20.0%)   1/6 (16.7%)        0/3      
        Immunoglobulin A Measurement                                                       
          Low                                        0/7           0/9            0/7      
          High                                   1/7 (14.3%)      0/10            0/6      
      \s\n
      PARCAT1: HEMATOLOGY
      
        ———————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                           A: Drug X    B: Placebo    C: Combination
            Direction of Abnormality               (N=15)        (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                               
          Low                                    1/5 (20.0%)   1/5 (20.0%)        0/4      
          High                                       0/5           0/4            0/4      
        C-Reactive Protein Measurement                                                     
          Low                                    1/4 (25.0%)       0/2        3/9 (33.3%)  
          High                                       0/4           0/5            0/9      
        Immunoglobulin A Measurement                                                       
          Low                                        0/2           0/3        2/8 (25.0%)  
          High                                       0/4       1/4 (25.0%)        0/7      

