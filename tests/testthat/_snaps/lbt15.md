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
            Low                                    0/47         0/53           0/65     
            High                                   0/47         0/46           0/63     
          C-Reactive Protein Measurement                                                
            Low                                    0/55         0/63           0/53     
            High                                   0/56         0/58           0/48     
          Immunoglobulin A Measurement                                                  
            Low                                    0/46         0/52           0/54     
            High                                   0/43         0/52           0/55     
        COAGULATION                                                                     
          Alanine Aminotransferase Measurement                                          
            Low                                    0/54         0/58           0/50     
            High                                   0/55         0/52           0/50     
          C-Reactive Protein Measurement                                                
            Low                                    0/57         0/50           0/52     
            High                                   0/54         0/46           0/50     
          Immunoglobulin A Measurement                                                  
            Low                                    0/54         0/64           0/56     
            High                                   0/49         0/67           0/56     
        HEMATOLOGY                                                                      
          Alanine Aminotransferase Measurement                                          
            Low                                    0/49         0/48           0/61     
            High                                   0/48         0/45           0/57     
          C-Reactive Protein Measurement                                                
            Low                                    0/50         0/48           0/59     
            High                                   0/47         0/46           0/56     
          Immunoglobulin A Measurement                                                  
            Low                                    0/59         0/57           0/52     
            High                                   0/57         0/59           0/53     

# lbt15 can handle missing levels in baseline

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Laboratory Test                           A: Drug X      B: Placebo    C: Combination
            Analysis Toxicity Grade                (N=134)        (N=134)         (N=132)    
        —————————————————————————————————————————————————————————————————————————————————————
        CHEMISTRY                                                                            
          Alanine Aminotransferase Measurement                                               
            Low                                  6/50 (12.0%)   3/53 (5.7%)     3/69 (4.3%)  
            High                                 2/50 (4.0%)    3/53 (5.7%)     1/69 (1.4%)  
          C-Reactive Protein Measurement                                                     
            Low                                  6/61 (9.8%)    3/65 (4.6%)     4/57 (7.0%)  
            High                                 5/61 (8.2%)    5/65 (7.7%)     1/57 (1.8%)  
          Immunoglobulin A Measurement                                                       
            Low                                  4/49 (8.2%)    7/56 (12.5%)    6/58 (10.3%) 
            High                                 4/49 (8.2%)    4/56 (7.1%)     6/58 (10.3%) 
        COAGULATION                                                                          
          Alanine Aminotransferase Measurement                                               
            Low                                  3/59 (5.1%)    4/60 (6.7%)     5/54 (9.3%)  
            High                                 8/59 (13.6%)   7/60 (11.7%)    2/54 (3.7%)  
          C-Reactive Protein Measurement                                                     
            Low                                  5/61 (8.2%)    1/53 (1.9%)     4/54 (7.4%)  
            High                                 7/61 (11.5%)   4/53 (7.5%)     2/54 (3.7%)  
          Immunoglobulin A Measurement                                                       
            Low                                  5/55 (9.1%)    8/68 (11.8%)    1/59 (1.7%)  
            High                                 5/55 (9.1%)    7/68 (10.3%)    3/59 (5.1%)  
        HEMATOLOGY                                                                           
          Alanine Aminotransferase Measurement                                               
            Low                                  2/51 (3.9%)    4/52 (7.7%)     5/64 (7.8%)  
            High                                 3/51 (5.9%)    6/52 (11.5%)    5/64 (7.8%)  
          C-Reactive Protein Measurement                                                     
            Low                                  4/54 (7.4%)    5/50 (10.0%)    8/63 (12.7%) 
            High                                 1/54 (1.9%)    3/50 (6.0%)     6/63 (9.5%)  
          Immunoglobulin A Measurement                                                       
            Low                                  3/64 (4.7%)    6/61 (9.8%)     6/55 (10.9%) 
            High                                 4/64 (6.2%)    4/61 (6.6%)    10/55 (18.2%) 

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

# lbt15 can handle some NA values in baseline

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

