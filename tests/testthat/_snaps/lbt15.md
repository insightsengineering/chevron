# lbt15 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      
      PARCAT1: CHEMISTRY
      
        ———————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                           A: Drug X    B: Placebo    C: Combination
            Analysis Toxicity Grade                (N=15)        (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                               
          Low                                    1/8 (12.5%)       0/3            0/9      
          High                                       0/8           0/2            0/9      
        C-Reactive Protein Measurement                                                     
          Low                                        0/8           0/3        2/7 (28.6%)  
          High                                       0/9           0/3            0/8      
        Immunoglobulin A Measurement                                                       
          Low                                    2/6 (33.3%)   1/9 (11.1%)        0/6      
          High                                       0/6           0/9            0/7      
      \s\n
      PARCAT1: COAGULATION
      
        ———————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                           A: Drug X    B: Placebo    C: Combination
            Analysis Toxicity Grade                (N=15)        (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                               
          Low                                        0/5       1/6 (16.7%)        0/5      
          High                                       0/6       1/7 (14.3%)        0/5      
        C-Reactive Protein Measurement                                                     
          Low                                        0/6           0/6            0/4      
          High                                   1/6 (16.7%)   1/7 (14.3%)        0/4      
        Immunoglobulin A Measurement                                                       
          Low                                        0/8          0/10            0/7      
          High                                   1/7 (14.3%)      0/10            0/7      
      \s\n
      PARCAT1: HEMATOLOGY
      
        ———————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                           A: Drug X    B: Placebo    C: Combination
            Analysis Toxicity Grade                (N=15)        (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                               
          Low                                        0/5           0/5            0/4      
          High                                       0/6           0/4            0/4      
        C-Reactive Protein Measurement                                                     
          Low                                        0/4           0/4        1/9 (11.1%)  
          High                                       0/5           0/5            0/10     
        Immunoglobulin A Measurement                                                       
          Low                                        0/3           0/4        2/8 (25.0%)  
          High                                       0/4       1/4 (25.0%)        0/8      

# lbt15 can handle all NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      
      PARCAT1: CHEMISTRY
      
        ————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                          A: Drug X   B: Placebo   C: Combination
            ANRIND                                (N=15)       (N=15)         (N=15)    
        ————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                            
          Low                                       0/0         0/0            0/0      
          High                                      0/0         0/0            0/0      
        C-Reactive Protein Measurement                                                  
          Low                                       0/0         0/0            0/0      
          High                                      0/0         0/0            0/0      
        Immunoglobulin A Measurement                                                    
          Low                                       0/0         0/0            0/0      
          High                                      0/0         0/0            0/0      
      \s\n
      PARCAT1: COAGULATION
      
        ————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                          A: Drug X   B: Placebo   C: Combination
            ANRIND                                (N=15)       (N=15)         (N=15)    
        ————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                            
          Low                                       0/0         0/0            0/0      
          High                                      0/0         0/0            0/0      
        C-Reactive Protein Measurement                                                  
          Low                                       0/0         0/0            0/0      
          High                                      0/0         0/0            0/0      
        Immunoglobulin A Measurement                                                    
          Low                                       0/0         0/0            0/0      
          High                                      0/0         0/0            0/0      
      \s\n
      PARCAT1: HEMATOLOGY
      
        ————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                          A: Drug X   B: Placebo   C: Combination
            ANRIND                                (N=15)       (N=15)         (N=15)    
        ————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                            
          Low                                       0/0         0/0            0/0      
          High                                      0/0         0/0            0/0      
        C-Reactive Protein Measurement                                                  
          Low                                       0/0         0/0            0/0      
          High                                      0/0         0/0            0/0      
        Immunoglobulin A Measurement                                                    
          Low                                       0/0         0/0            0/0      
          High                                      0/0         0/0            0/0      

# lbt15 can handle missing levels

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      
      PARCAT1: CHEMISTRY
      
        ————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                          A: Drug X   B: Placebo   C: Combination
            ANRIND                                (N=15)       (N=15)         (N=15)    
        ————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                            
          Low                                       0/8         0/3            0/9      
          High                                      0/8         0/2            0/9      
        C-Reactive Protein Measurement                                                  
          Low                                       0/8         0/3            0/7      
          High                                      0/9         0/3            0/8      
        Immunoglobulin A Measurement                                                    
          Low                                       0/6         0/9            0/6      
          High                                      0/6         0/9            0/7      
      \s\n
      PARCAT1: COAGULATION
      
        ————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                          A: Drug X   B: Placebo   C: Combination
            ANRIND                                (N=15)       (N=15)         (N=15)    
        ————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                            
          Low                                       0/5         0/6            0/5      
          High                                      0/6         0/7            0/5      
        C-Reactive Protein Measurement                                                  
          Low                                       0/6         0/6            0/4      
          High                                      0/6         0/7            0/4      
        Immunoglobulin A Measurement                                                    
          Low                                       0/8         0/10           0/7      
          High                                      0/7         0/10           0/7      
      \s\n
      PARCAT1: HEMATOLOGY
      
        ————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                          A: Drug X   B: Placebo   C: Combination
            ANRIND                                (N=15)       (N=15)         (N=15)    
        ————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                            
          Low                                       0/5         0/5            0/4      
          High                                      0/6         0/4            0/4      
        C-Reactive Protein Measurement                                                  
          Low                                       0/4         0/4            0/9      
          High                                      0/5         0/5            0/10     
        Immunoglobulin A Measurement                                                    
          Low                                       0/3         0/4            0/8      
          High                                      0/4         0/4            0/8      

# lbt15 can handle missing levels in baseline

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      
      PARCAT1: CHEMISTRY
      
        ———————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                           A: Drug X    B: Placebo    C: Combination
            Analysis Toxicity Grade                (N=15)        (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                               
          Low                                    1/8 (12.5%)       0/3            0/9      
          High                                       0/8           0/3            0/9      
        C-Reactive Protein Measurement                                                     
          Low                                        0/9           0/3        2/8 (25.0%)  
          High                                       0/9           0/3            0/8      
        Immunoglobulin A Measurement                                                       
          Low                                    2/6 (33.3%)   1/9 (11.1%)    1/7 (14.3%)  
          High                                       0/6           0/9            0/7      
      \s\n
      PARCAT1: COAGULATION
      
        ———————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                           A: Drug X    B: Placebo    C: Combination
            Analysis Toxicity Grade                (N=15)        (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                               
          Low                                        0/6       1/7 (14.3%)        0/5      
          High                                       0/6       1/7 (14.3%)        0/5      
        C-Reactive Protein Measurement                                                     
          Low                                        0/6           0/7            0/4      
          High                                   1/6 (16.7%)   1/7 (14.3%)        0/4      
        Immunoglobulin A Measurement                                                       
          Low                                        0/8          0/10            0/7      
          High                                   1/8 (12.5%)      0/10            0/7      
      \s\n
      PARCAT1: HEMATOLOGY
      
        ———————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                           A: Drug X    B: Placebo    C: Combination
            Analysis Toxicity Grade                (N=15)        (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                               
          Low                                        0/6           0/5            0/4      
          High                                       0/6           0/5            0/4      
        C-Reactive Protein Measurement                                                     
          Low                                        0/5           0/5        1/10 (10.0%) 
          High                                       0/5           0/5            0/10     
        Immunoglobulin A Measurement                                                       
          Low                                        0/4           0/4        2/8 (25.0%)  
          High                                       0/4       1/4 (25.0%)        0/8      

# lbt15 can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      
      PARCAT1: CHEMISTRY
      
        ———————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                           A: Drug X    B: Placebo    C: Combination
            Analysis Toxicity Grade                (N=15)        (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                               
          Low                                    1/8 (12.5%)       0/3            0/9      
          High                                       0/8           0/2            0/9      
        C-Reactive Protein Measurement                                                     
          Low                                        0/8           0/3        2/7 (28.6%)  
          High                                       0/9           0/3            0/8      
        Immunoglobulin A Measurement                                                       
          Low                                    2/6 (33.3%)   1/9 (11.1%)        0/6      
          High                                       0/6           0/9            0/7      
      \s\n
      PARCAT1: COAGULATION
      
        ———————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                           A: Drug X    B: Placebo    C: Combination
            Analysis Toxicity Grade                (N=15)        (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                               
          Low                                        0/5       1/6 (16.7%)        0/5      
          High                                       0/6       1/7 (14.3%)        0/5      
        C-Reactive Protein Measurement                                                     
          Low                                        0/6           0/6            0/4      
          High                                   1/6 (16.7%)   1/7 (14.3%)        0/4      
        Immunoglobulin A Measurement                                                       
          Low                                        0/8          0/10            0/7      
          High                                   1/7 (14.3%)      0/10            0/7      
      \s\n
      PARCAT1: HEMATOLOGY
      
        ———————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                           A: Drug X    B: Placebo    C: Combination
            Analysis Toxicity Grade                (N=15)        (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                               
          Low                                        0/5           0/5            0/4      
          High                                       0/6           0/4            0/4      
        C-Reactive Protein Measurement                                                     
          Low                                        0/4           0/4        1/9 (11.1%)  
          High                                       0/5           0/5            0/10     
        Immunoglobulin A Measurement                                                       
          Low                                        0/3           0/4        2/8 (25.0%)  
          High                                       0/4       1/4 (25.0%)        0/8      

# lbt15 can handle some NA values in baseline

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      
      PARCAT1: CHEMISTRY
      
        ———————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                           A: Drug X    B: Placebo    C: Combination
            Analysis Toxicity Grade                (N=15)        (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                               
          Low                                    1/8 (12.5%)       0/3            0/9      
          High                                       0/8           0/2            0/9      
        C-Reactive Protein Measurement                                                     
          Low                                        0/8           0/3        2/7 (28.6%)  
          High                                       0/9           0/3            0/8      
        Immunoglobulin A Measurement                                                       
          Low                                    2/6 (33.3%)   1/9 (11.1%)        0/6      
          High                                       0/6           0/9            0/7      
      \s\n
      PARCAT1: COAGULATION
      
        ———————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                           A: Drug X    B: Placebo    C: Combination
            Analysis Toxicity Grade                (N=15)        (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                               
          Low                                        0/5       1/6 (16.7%)        0/5      
          High                                       0/6       1/7 (14.3%)        0/5      
        C-Reactive Protein Measurement                                                     
          Low                                        0/6           0/6            0/4      
          High                                   1/6 (16.7%)   1/7 (14.3%)        0/4      
        Immunoglobulin A Measurement                                                       
          Low                                        0/8          0/10            0/7      
          High                                   1/7 (14.3%)      0/10            0/7      
      \s\n
      PARCAT1: HEMATOLOGY
      
        ———————————————————————————————————————————————————————————————————————————————————
        Laboratory Test                           A: Drug X    B: Placebo    C: Combination
            Analysis Toxicity Grade                (N=15)        (N=15)          (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                                               
          Low                                        0/5           0/5            0/4      
          High                                       0/6           0/4            0/4      
        C-Reactive Protein Measurement                                                     
          Low                                        0/4           0/4        1/9 (11.1%)  
          High                                       0/5           0/5            0/10     
        Immunoglobulin A Measurement                                                       
          Low                                        0/3           0/4        2/8 (25.0%)  
          High                                       0/4       1/4 (25.0%)        0/8      

