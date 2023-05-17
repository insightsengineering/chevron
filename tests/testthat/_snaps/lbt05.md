# lbt05 functions with default argument value return expected result with test data

    Code
      cat(formatters::export_as_txt(res, lpp = 100))
    Output
        Laboratory Test                            A: Drug X   B: Placebo   C: Combination
            Direction of Abnormality                (N=134)     (N=134)        (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement (n)      129         128            127      
          Low                                                                             
            Single, not last                       1 (0.8%)     2 (1.6%)       2 (1.6%)   
            Last or replicated                     4 (3.1%)    11 (8.6%)       3 (2.4%)   
            Any Abnormality                        5 (3.9%)    13 (10.2%)      5 (3.9%)   
          High                                                                            
            Single, not last                       4 (3.1%)     4 (3.1%)       1 (0.8%)   
            Last or replicated                     5 (3.9%)     8 (6.2%)       6 (4.7%)   
            Any Abnormality                        9 (7.0%)    12 (9.4%)       7 (5.5%)   
        C-Reactive Protein Measurement (n)            128         123            123      
          Low                                                                             
            Single, not last                       1 (0.8%)        0           3 (2.4%)   
            Last or replicated                     11 (8.6%)    7 (5.7%)       4 (3.3%)   
            Any Abnormality                        12 (9.4%)    7 (5.7%)       7 (5.7%)   
          High                                                                            
            Single, not last                       2 (1.6%)     1 (0.8%)       2 (1.6%)   
            Last or replicated                     9 (7.0%)    10 (8.1%)      11 (8.9%)   
            Any Abnormality                        11 (8.6%)   11 (8.9%)      13 (10.6%)  
        Immunoglobulin A Measurement (n)              126         125            119      
          Low                                                                             
            Single, not last                       1 (0.8%)     3 (2.4%)       4 (3.4%)   
            Last or replicated                     6 (4.8%)     6 (4.8%)       7 (5.9%)   
            Any Abnormality                        7 (5.6%)     9 (7.2%)      11 (9.2%)   
          High                                                                            
            Single, not last                       1 (0.8%)     1 (0.8%)       2 (1.7%)   
            Last or replicated                     3 (2.4%)     8 (6.4%)       4 (3.4%)   
            Any Abnormality                        4 (3.2%)     9 (7.2%)       6 (5.0%)   

---

    Code
      cat(formatters::export_as_txt(res_prune, lpp = 100))
    Output
        Laboratory Test                            A: Drug X   B: Placebo   C: Combination
            Direction of Abnormality                (N=134)     (N=134)        (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement (n)      129         128            127      
          Low                                                                             
            Any Abnormality                        5 (3.9%)    13 (10.2%)      5 (3.9%)   
          High                                                                            
            Any Abnormality                        9 (7.0%)    12 (9.4%)       7 (5.5%)   
        C-Reactive Protein Measurement (n)            128         123            123      
          Low                                                                             
            Any Abnormality                        12 (9.4%)    7 (5.7%)       7 (5.7%)   
          High                                                                            
            Any Abnormality                        11 (8.6%)   11 (8.9%)      13 (10.6%)  
        Immunoglobulin A Measurement (n)              126         125            119      
          Low                                                                             
            Any Abnormality                        7 (5.6%)     9 (7.2%)      11 (9.2%)   
          High                                                                            
            Any Abnormality                        4 (3.2%)     9 (7.2%)       6 (5.0%)   

# lbt05 can handle some NA values

    Code
      cat(formatters::export_as_txt(res, lpp = 100))
    Output
        Laboratory Test                            A: Drug X   B: Placebo   C: Combination
            Direction of Abnormality                (N=134)     (N=134)        (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement (n)      129         128            127      
          Low                                                                             
            Single, not last                       1 (0.8%)     2 (1.6%)       2 (1.6%)   
            Last or replicated                     4 (3.1%)    11 (8.6%)       3 (2.4%)   
            Any Abnormality                        5 (3.9%)    13 (10.2%)      5 (3.9%)   
          High                                                                            
            Single, not last                       4 (3.1%)     4 (3.1%)       1 (0.8%)   
            Last or replicated                     5 (3.9%)     8 (6.2%)       6 (4.7%)   
            Any Abnormality                        9 (7.0%)    12 (9.4%)       7 (5.5%)   
        C-Reactive Protein Measurement (n)            128         123            123      
          Low                                                                             
            Single, not last                       1 (0.8%)        0           3 (2.4%)   
            Last or replicated                     11 (8.6%)    7 (5.7%)       4 (3.3%)   
            Any Abnormality                        12 (9.4%)    7 (5.7%)       7 (5.7%)   
          High                                                                            
            Single, not last                       2 (1.6%)     1 (0.8%)       2 (1.6%)   
            Last or replicated                     9 (7.0%)    10 (8.1%)      11 (8.9%)   
            Any Abnormality                        11 (8.6%)   11 (8.9%)      13 (10.6%)  
        Immunoglobulin A Measurement (n)              126         125            119      
          Low                                                                             
            Single, not last                       1 (0.8%)     3 (2.4%)       4 (3.4%)   
            Last or replicated                     6 (4.8%)     6 (4.8%)       7 (5.9%)   
            Any Abnormality                        7 (5.6%)     9 (7.2%)      11 (9.2%)   
          High                                                                            
            Single, not last                       1 (0.8%)     1 (0.8%)       2 (1.7%)   
            Last or replicated                     3 (2.4%)     8 (6.4%)       4 (3.4%)   
            Any Abnormality                        4 (3.2%)     9 (7.2%)       6 (5.0%)   

