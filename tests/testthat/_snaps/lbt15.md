# lbt15 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Laboratory Test                           A: Drug X     B: Placebo    C: Combination
            Analysis Toxicity Grade                (N=134)        (N=134)        (N=132)    
        ————————————————————————————————————————————————————————————————————————————————————
        CHEMISTRY                                                                           
          Alanine Aminotransferase Measurement                                              
            Low                                  5/48 (10.4%)   1/53 (1.9%)    1/68 (1.5%)  
            High                                 1/49 (2.0%)    2/49 (4.1%)        0/66     
          C-Reactive Protein Measurement                                                    
            Low                                  1/58 (1.7%)    1/64 (1.6%)    3/53 (5.7%)  
            High                                 3/57 (5.3%)    3/60 (5.0%)    1/51 (2.0%)  
          Immunoglobulin A Measurement                                                      
            Low                                  3/47 (6.4%)    3/53 (5.7%)    4/54 (7.4%)  
            High                                 1/46 (2.2%)    1/55 (1.8%)    4/56 (7.1%)  
        COAGULATION                                                                         
          Alanine Aminotransferase Measurement                                              
            Low                                  1/55 (1.8%)    2/59 (3.4%)    2/51 (3.9%)  
            High                                 4/56 (7.1%)    3/56 (5.4%)        0/51     
          C-Reactive Protein Measurement                                                    
            Low                                  4/60 (6.7%)       0/51        3/53 (5.7%)  
            High                                 7/58 (12.1%)   2/49 (4.1%)        0/52     
          Immunoglobulin A Measurement                                                      
            Low                                  2/55 (3.6%)    5/64 (7.8%)        0/57     
            High                                 3/51 (5.9%)    4/68 (5.9%)    2/58 (3.4%)  
        HEMATOLOGY                                                                          
          Alanine Aminotransferase Measurement                                              
            Low                                  1/50 (2.0%)    1/49 (2.0%)    4/62 (6.5%)  
            High                                 2/50 (4.0%)    3/47 (6.4%)    2/59 (3.4%)  
          C-Reactive Protein Measurement                                                    
            Low                                      0/51       3/49 (6.1%)    3/59 (5.1%)  
            High                                 1/50 (2.0%)    2/47 (4.3%)    4/61 (6.6%)  
          Immunoglobulin A Measurement                                                      
            Low                                  2/60 (3.3%)    4/58 (6.9%)    4/54 (7.4%)  
            High                                 3/60 (5.0%)    3/59 (5.1%)    5/53 (9.4%)  

# lbt15 can handle missing levels

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Laboratory Test                          A: Drug X   B: Placebo   C: Combination
            ANRIND                                (N=134)     (N=134)        (N=132)    
        ————————————————————————————————————————————————————————————————————————————————
        CHEMISTRY                                                                       
          Alanine Aminotransferase Measurement                                          
            Low                                    0/48         0/53           0/68     
            High                                   0/49         0/49           0/66     
          C-Reactive Protein Measurement                                                
            Low                                    0/58         0/64           0/53     
            High                                   0/57         0/60           0/51     
          Immunoglobulin A Measurement                                                  
            Low                                    0/47         0/53           0/54     
            High                                   0/46         0/55           0/56     
        COAGULATION                                                                     
          Alanine Aminotransferase Measurement                                          
            Low                                    0/55         0/59           0/51     
            High                                   0/56         0/56           0/51     
          C-Reactive Protein Measurement                                                
            Low                                    0/60         0/51           0/53     
            High                                   0/58         0/49           0/52     
          Immunoglobulin A Measurement                                                  
            Low                                    0/55         0/64           0/57     
            High                                   0/51         0/68           0/58     
        HEMATOLOGY                                                                      
          Alanine Aminotransferase Measurement                                          
            Low                                    0/50         0/49           0/62     
            High                                   0/50         0/47           0/59     
          C-Reactive Protein Measurement                                                
            Low                                    0/51         0/49           0/59     
            High                                   0/50         0/47           0/61     
          Immunoglobulin A Measurement                                                  
            Low                                    0/60         0/58           0/54     
            High                                   0/60         0/59           0/53     

# lbt15 can handle missing levels in baseline

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Laboratory Test                           A: Drug X     B: Placebo    C: Combination
            Analysis Toxicity Grade                (N=134)        (N=134)        (N=132)    
        ————————————————————————————————————————————————————————————————————————————————————
        CHEMISTRY                                                                           
          Alanine Aminotransferase Measurement                                              
            Low                                  5/50 (10.0%)   1/53 (1.9%)    1/69 (1.4%)  
            High                                 1/50 (2.0%)    2/53 (3.8%)        0/69     
          C-Reactive Protein Measurement                                                    
            Low                                  2/61 (3.3%)    1/65 (1.5%)    3/57 (5.3%)  
            High                                 3/61 (4.9%)    3/65 (4.6%)    1/57 (1.8%)  
          Immunoglobulin A Measurement                                                      
            Low                                  4/49 (8.2%)    3/56 (5.4%)    5/58 (8.6%)  
            High                                 2/49 (4.1%)    1/56 (1.8%)    4/58 (6.9%)  
        COAGULATION                                                                         
          Alanine Aminotransferase Measurement                                              
            Low                                  1/59 (1.7%)    2/60 (3.3%)    2/54 (3.7%)  
            High                                 5/59 (8.5%)    3/60 (5.0%)        0/54     
          C-Reactive Protein Measurement                                                    
            Low                                  4/61 (6.6%)       0/53        3/54 (5.6%)  
            High                                 7/61 (11.5%)   3/53 (5.7%)        0/54     
          Immunoglobulin A Measurement                                                      
            Low                                  2/55 (3.6%)    5/68 (7.4%)    1/59 (1.7%)  
            High                                 3/55 (5.5%)    4/68 (5.9%)    2/59 (3.4%)  
        HEMATOLOGY                                                                          
          Alanine Aminotransferase Measurement                                              
            Low                                  1/51 (2.0%)    2/52 (3.8%)    4/64 (6.2%)  
            High                                 2/51 (3.9%)    3/52 (5.8%)    2/64 (3.1%)  
          C-Reactive Protein Measurement                                                    
            Low                                      0/54       3/50 (6.0%)    3/63 (4.8%)  
            High                                 1/54 (1.9%)    2/50 (4.0%)    5/63 (7.9%)  
          Immunoglobulin A Measurement                                                      
            Low                                  2/64 (3.1%)    4/61 (6.6%)    4/55 (7.3%)  
            High                                 3/64 (4.7%)    4/61 (6.6%)    5/55 (9.1%)  

# lbt15 can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Laboratory Test                           A: Drug X     B: Placebo    C: Combination
            Analysis Toxicity Grade                (N=134)        (N=134)        (N=132)    
        ————————————————————————————————————————————————————————————————————————————————————
        CHEMISTRY                                                                           
          Alanine Aminotransferase Measurement                                              
            Low                                  5/48 (10.4%)   1/53 (1.9%)    1/68 (1.5%)  
            High                                 1/49 (2.0%)    2/49 (4.1%)        0/66     
          C-Reactive Protein Measurement                                                    
            Low                                  1/58 (1.7%)    1/64 (1.6%)    3/53 (5.7%)  
            High                                 3/57 (5.3%)    3/60 (5.0%)    1/51 (2.0%)  
          Immunoglobulin A Measurement                                                      
            Low                                  3/47 (6.4%)    3/53 (5.7%)    4/54 (7.4%)  
            High                                 1/46 (2.2%)    1/55 (1.8%)    4/56 (7.1%)  
        COAGULATION                                                                         
          Alanine Aminotransferase Measurement                                              
            Low                                  1/55 (1.8%)    2/59 (3.4%)    2/51 (3.9%)  
            High                                 4/56 (7.1%)    3/56 (5.4%)        0/51     
          C-Reactive Protein Measurement                                                    
            Low                                  4/60 (6.7%)       0/51        3/53 (5.7%)  
            High                                 7/58 (12.1%)   2/49 (4.1%)        0/52     
          Immunoglobulin A Measurement                                                      
            Low                                  2/55 (3.6%)    5/64 (7.8%)        0/57     
            High                                 3/51 (5.9%)    4/68 (5.9%)    2/58 (3.4%)  
        HEMATOLOGY                                                                          
          Alanine Aminotransferase Measurement                                              
            Low                                  1/50 (2.0%)    1/49 (2.0%)    4/62 (6.5%)  
            High                                 2/50 (4.0%)    3/47 (6.4%)    2/59 (3.4%)  
          C-Reactive Protein Measurement                                                    
            Low                                      0/51       3/49 (6.1%)    3/59 (5.1%)  
            High                                 1/50 (2.0%)    2/47 (4.3%)    4/61 (6.6%)  
          Immunoglobulin A Measurement                                                      
            Low                                  2/60 (3.3%)    4/58 (6.9%)    4/54 (7.4%)  
            High                                 3/60 (5.0%)    3/59 (5.1%)    5/53 (9.4%)  

# lbt15 can handle some NA values in baseline

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Laboratory Test                           A: Drug X     B: Placebo    C: Combination
            Analysis Toxicity Grade                (N=134)        (N=134)        (N=132)    
        ————————————————————————————————————————————————————————————————————————————————————
        CHEMISTRY                                                                           
          Alanine Aminotransferase Measurement                                              
            Low                                  5/48 (10.4%)   1/53 (1.9%)    1/68 (1.5%)  
            High                                 1/49 (2.0%)    2/49 (4.1%)        0/66     
          C-Reactive Protein Measurement                                                    
            Low                                  1/58 (1.7%)    1/64 (1.6%)    3/53 (5.7%)  
            High                                 3/57 (5.3%)    3/60 (5.0%)    1/51 (2.0%)  
          Immunoglobulin A Measurement                                                      
            Low                                  3/47 (6.4%)    3/53 (5.7%)    4/54 (7.4%)  
            High                                 1/46 (2.2%)    1/55 (1.8%)    4/56 (7.1%)  
        COAGULATION                                                                         
          Alanine Aminotransferase Measurement                                              
            Low                                  1/55 (1.8%)    2/59 (3.4%)    2/51 (3.9%)  
            High                                 4/56 (7.1%)    3/56 (5.4%)        0/51     
          C-Reactive Protein Measurement                                                    
            Low                                  4/60 (6.7%)       0/51        3/53 (5.7%)  
            High                                 7/58 (12.1%)   2/49 (4.1%)        0/52     
          Immunoglobulin A Measurement                                                      
            Low                                  2/55 (3.6%)    5/64 (7.8%)        0/57     
            High                                 3/51 (5.9%)    4/68 (5.9%)    2/58 (3.4%)  
        HEMATOLOGY                                                                          
          Alanine Aminotransferase Measurement                                              
            Low                                  1/50 (2.0%)    1/49 (2.0%)    4/62 (6.5%)  
            High                                 2/50 (4.0%)    3/47 (6.4%)    2/59 (3.4%)  
          C-Reactive Protein Measurement                                                    
            Low                                      0/51       3/49 (6.1%)    3/59 (5.1%)  
            High                                 1/50 (2.0%)    2/47 (4.3%)    4/61 (6.6%)  
          Immunoglobulin A Measurement                                                      
            Low                                  2/60 (3.3%)    4/58 (6.9%)    4/54 (7.4%)  
            High                                 3/60 (5.0%)    3/59 (5.1%)    5/53 (9.4%)  

