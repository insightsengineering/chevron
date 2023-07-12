# lbt15 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Laboratory Test                           A: Drug X      B: Placebo    C: Combination
            Analysis Toxicity Grade                (N=134)        (N=134)         (N=132)    
        —————————————————————————————————————————————————————————————————————————————————————
        CHEMISTRY                                                                            
          Alanine Aminotransferase Measurement                                               
            Low                                  6/47 (12.8%)   3/53 (5.7%)     3/65 (4.6%)  
            High                                 2/47 (4.3%)    3/46 (6.5%)     1/63 (1.6%)  
          C-Reactive Protein Measurement                                                     
            Low                                  5/55 (9.1%)    3/63 (4.8%)     4/53 (7.5%)  
            High                                 5/56 (8.9%)    5/58 (8.6%)     1/48 (2.1%)  
          Immunoglobulin A Measurement                                                       
            Low                                  3/46 (6.5%)    7/52 (13.5%)    5/54 (9.3%)  
            High                                 3/43 (7.0%)    4/52 (7.7%)     6/55 (10.9%) 
        COAGULATION                                                                          
          Alanine Aminotransferase Measurement                                               
            Low                                  3/54 (5.6%)    4/58 (6.9%)     5/50 (10.0%) 
            High                                 7/55 (12.7%)   7/52 (13.5%)    2/50 (4.0%)  
          C-Reactive Protein Measurement                                                     
            Low                                  5/57 (8.8%)    1/50 (2.0%)     4/52 (7.7%)  
            High                                 7/54 (13.0%)   3/46 (6.5%)     2/50 (4.0%)  
          Immunoglobulin A Measurement                                                       
            Low                                  5/54 (9.3%)    8/64 (12.5%)        0/56     
            High                                 5/49 (10.2%)   7/67 (10.4%)    1/56 (1.8%)  
        HEMATOLOGY                                                                           
          Alanine Aminotransferase Measurement                                               
            Low                                  2/49 (4.1%)    3/48 (6.2%)     5/61 (8.2%)  
            High                                 3/48 (6.2%)    6/45 (13.3%)    5/57 (8.8%)  
          C-Reactive Protein Measurement                                                     
            Low                                  4/50 (8.0%)    5/48 (10.4%)    8/59 (13.6%) 
            High                                 1/47 (2.1%)    3/46 (6.5%)     5/56 (8.9%)  
          Immunoglobulin A Measurement                                                       
            Low                                  3/59 (5.1%)    6/57 (10.5%)    6/52 (11.5%) 
            High                                 4/57 (7.0%)    3/59 (5.1%)    10/53 (18.9%) 

# lbt15 can handle all NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                                                
        ————————————————————————————————————————————————————————————————————————————————————————
           Null Report: No observations met the reporting criteria for inclusion in this output.

# lbt15 can handle missing levels

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Laboratory Test                          A: Drug X   B: Placebo   C: Combination
            ANRIND                                (N=134)     (N=134)        (N=132)    
        ————————————————————————————————————————————————————————————————————————————————
        CHEMISTRY                                                                       
          Alanine Aminotransferase Measurement                                          
            Low                                     0/0         0/0            0/0      
            High                                    0/0         0/0            0/0      
          C-Reactive Protein Measurement                                                
            Low                                     0/0         0/0            0/0      
            High                                    0/0         0/0            0/0      
          Immunoglobulin A Measurement                                                  
            Low                                     0/0         0/0            0/0      
            High                                    0/0         0/0            0/0      
        COAGULATION                                                                     
          Alanine Aminotransferase Measurement                                          
            Low                                     0/0         0/0            0/0      
            High                                    0/0         0/0            0/0      
          C-Reactive Protein Measurement                                                
            Low                                     0/0         0/0            0/0      
            High                                    0/0         0/0            0/0      
          Immunoglobulin A Measurement                                                  
            Low                                     0/0         0/0            0/0      
            High                                    0/0         0/0            0/0      
        HEMATOLOGY                                                                      
          Alanine Aminotransferase Measurement                                          
            Low                                     0/0         0/0            0/0      
            High                                    0/0         0/0            0/0      
          C-Reactive Protein Measurement                                                
            Low                                     0/0         0/0            0/0      
            High                                    0/0         0/0            0/0      
          Immunoglobulin A Measurement                                                  
            Low                                     0/0         0/0            0/0      
            High                                    0/0         0/0            0/0      

# lbt15 can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Laboratory Test                           A: Drug X      B: Placebo    C: Combination
            Analysis Toxicity Grade                (N=134)        (N=134)         (N=132)    
        —————————————————————————————————————————————————————————————————————————————————————
        CHEMISTRY                                                                            
          Alanine Aminotransferase Measurement                                               
            Low                                  6/47 (12.8%)   3/53 (5.7%)     3/65 (4.6%)  
            High                                 2/47 (4.3%)    3/46 (6.5%)     1/63 (1.6%)  
          C-Reactive Protein Measurement                                                     
            Low                                  5/55 (9.1%)    3/63 (4.8%)     4/53 (7.5%)  
            High                                 5/56 (8.9%)    5/58 (8.6%)     1/48 (2.1%)  
          Immunoglobulin A Measurement                                                       
            Low                                  3/46 (6.5%)    7/52 (13.5%)    5/54 (9.3%)  
            High                                 3/43 (7.0%)    4/52 (7.7%)     6/55 (10.9%) 
        COAGULATION                                                                          
          Alanine Aminotransferase Measurement                                               
            Low                                  3/54 (5.6%)    4/58 (6.9%)     5/50 (10.0%) 
            High                                 7/55 (12.7%)   7/52 (13.5%)    2/50 (4.0%)  
          C-Reactive Protein Measurement                                                     
            Low                                  5/57 (8.8%)    1/50 (2.0%)     4/52 (7.7%)  
            High                                 7/54 (13.0%)   3/46 (6.5%)     2/50 (4.0%)  
          Immunoglobulin A Measurement                                                       
            Low                                  5/54 (9.3%)    8/64 (12.5%)        0/56     
            High                                 5/49 (10.2%)   7/67 (10.4%)    1/56 (1.8%)  
        HEMATOLOGY                                                                           
          Alanine Aminotransferase Measurement                                               
            Low                                  2/49 (4.1%)    3/48 (6.2%)     5/61 (8.2%)  
            High                                 3/48 (6.2%)    6/45 (13.3%)    5/57 (8.8%)  
          C-Reactive Protein Measurement                                                     
            Low                                  4/50 (8.0%)    5/48 (10.4%)    8/59 (13.6%) 
            High                                 1/47 (2.1%)    3/46 (6.5%)     5/56 (8.9%)  
          Immunoglobulin A Measurement                                                       
            Low                                  3/59 (5.1%)    6/57 (10.5%)    6/52 (11.5%) 
            High                                 4/57 (7.0%)    3/59 (5.1%)    10/53 (18.9%) 

