# lbt04 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Laboratory Test                           A: Drug X      B: Placebo    C: Combination
            Direction of Abnormality               (N=134)        (N=134)         (N=132)    
        —————————————————————————————————————————————————————————————————————————————————————
        CHEMISTRY                                                                            
          Alanine Aminotransferase Measurement                                               
            Low                                  7/45 (15.6%)   6/51 (11.8%)    4/61 (6.6%)  
            High                                 4/45 (8.9%)    6/45 (13.3%)    4/62 (6.5%)  
          C-Reactive Protein Measurement                                                     
            Low                                  6/55 (10.9%)   5/61 (8.2%)     6/51 (11.8%) 
            High                                 6/53 (11.3%)   7/55 (12.7%)    2/48 (4.2%)  
          Immunoglobulin A Measurement                                                       
            Low                                  4/43 (9.3%)    9/51 (17.6%)    8/52 (15.4%) 
            High                                 7/42 (16.7%)   7/49 (14.3%)    5/52 (9.6%)  
        COAGULATION                                                                          
          Alanine Aminotransferase Measurement                                               
            Low                                  4/54 (7.4%)    5/53 (9.4%)     4/48 (8.3%)  
            High                                 9/53 (17.0%)   7/50 (14.0%)    6/48 (12.5%) 
          C-Reactive Protein Measurement                                                     
            Low                                  7/56 (12.5%)   5/48 (10.4%)    5/50 (10.0%) 
            High                                 8/52 (15.4%)   3/46 (6.5%)     5/46 (10.9%) 
          Immunoglobulin A Measurement                                                       
            Low                                  8/50 (16.0%)   8/57 (14.0%)    2/54 (3.7%)  
            High                                 6/48 (12.5%)   8/65 (12.3%)    2/52 (3.8%)  
        HEMATOLOGY                                                                           
          Alanine Aminotransferase Measurement                                               
            Low                                  3/48 (6.2%)    4/46 (8.7%)     6/59 (10.2%) 
            High                                 5/47 (10.6%)   7/45 (15.6%)    8/55 (14.5%) 
          C-Reactive Protein Measurement                                                     
            Low                                  6/49 (12.2%)   6/45 (13.3%)   11/57 (19.3%) 
            High                                 3/44 (6.8%)    3/46 (6.5%)     6/53 (11.3%) 
          Immunoglobulin A Measurement                                                       
            Low                                  5/56 (8.9%)    8/53 (15.1%)    9/50 (18.0%) 
            High                                 7/57 (12.3%)   4/56 (7.1%)    10/52 (19.2%) 

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
        Laboratory Test                          A: Drug X   B: Placebo   C: Combination
            Direction of Abnormality              (N=134)     (N=134)        (N=132)    
        ————————————————————————————————————————————————————————————————————————————————
        CHEMISTRY                                                                       
          Alanine Aminotransferase Measurement                                          
            Low                                    0/45         0/51           0/61     
            High                                   0/45         0/45           0/62     
          C-Reactive Protein Measurement                                                
            Low                                    0/55         0/61           0/51     
            High                                   0/53         0/55           0/48     
          Immunoglobulin A Measurement                                                  
            Low                                    0/43         0/51           0/52     
            High                                   0/42         0/49           0/52     
        COAGULATION                                                                     
          Alanine Aminotransferase Measurement                                          
            Low                                    0/54         0/53           0/48     
            High                                   0/53         0/50           0/48     
          C-Reactive Protein Measurement                                                
            Low                                    0/56         0/48           0/50     
            High                                   0/52         0/46           0/46     
          Immunoglobulin A Measurement                                                  
            Low                                    0/50         0/57           0/54     
            High                                   0/48         0/65           0/52     
        HEMATOLOGY                                                                      
          Alanine Aminotransferase Measurement                                          
            Low                                    0/48         0/46           0/59     
            High                                   0/47         0/45           0/55     
          C-Reactive Protein Measurement                                                
            Low                                    0/49         0/45           0/57     
            High                                   0/44         0/46           0/53     
          Immunoglobulin A Measurement                                                  
            Low                                    0/56         0/53           0/50     
            High                                   0/57         0/56           0/52     

# lbt04 can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Laboratory Test                           A: Drug X      B: Placebo    C: Combination
            Direction of Abnormality               (N=134)        (N=134)         (N=132)    
        —————————————————————————————————————————————————————————————————————————————————————
        CHEMISTRY                                                                            
          Alanine Aminotransferase Measurement                                               
            Low                                  7/45 (15.6%)   6/51 (11.8%)    4/61 (6.6%)  
            High                                 4/45 (8.9%)    6/45 (13.3%)    4/62 (6.5%)  
          C-Reactive Protein Measurement                                                     
            Low                                  6/55 (10.9%)   5/61 (8.2%)     6/51 (11.8%) 
            High                                 6/53 (11.3%)   7/55 (12.7%)    2/48 (4.2%)  
          Immunoglobulin A Measurement                                                       
            Low                                  4/43 (9.3%)    9/51 (17.6%)    8/52 (15.4%) 
            High                                 7/42 (16.7%)   7/49 (14.3%)    5/52 (9.6%)  
        COAGULATION                                                                          
          Alanine Aminotransferase Measurement                                               
            Low                                  4/54 (7.4%)    5/53 (9.4%)     4/48 (8.3%)  
            High                                 9/53 (17.0%)   7/50 (14.0%)    6/48 (12.5%) 
          C-Reactive Protein Measurement                                                     
            Low                                  7/56 (12.5%)   5/48 (10.4%)    5/50 (10.0%) 
            High                                 8/52 (15.4%)   3/46 (6.5%)     5/46 (10.9%) 
          Immunoglobulin A Measurement                                                       
            Low                                  8/50 (16.0%)   8/57 (14.0%)    2/54 (3.7%)  
            High                                 6/48 (12.5%)   8/65 (12.3%)    2/52 (3.8%)  
        HEMATOLOGY                                                                           
          Alanine Aminotransferase Measurement                                               
            Low                                  3/48 (6.2%)    4/46 (8.7%)     6/59 (10.2%) 
            High                                 5/47 (10.6%)   7/45 (15.6%)    8/55 (14.5%) 
          C-Reactive Protein Measurement                                                     
            Low                                  6/49 (12.2%)   6/45 (13.3%)   11/57 (19.3%) 
            High                                 3/44 (6.8%)    3/46 (6.5%)     6/53 (11.3%) 
          Immunoglobulin A Measurement                                                       
            Low                                  5/56 (8.9%)    8/53 (15.1%)    9/50 (18.0%) 
            High                                 7/57 (12.3%)   4/56 (7.1%)    10/52 (19.2%) 

