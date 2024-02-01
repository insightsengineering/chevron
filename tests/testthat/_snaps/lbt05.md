# lbt05 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Laboratory Test                            A: Drug X   B: Placebo   C: Combination
            Direction of Abnormality                (N=15)       (N=15)         (N=15)    
        ——————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement (n)      15           12             13      
          Low                                                                             
            Single, not last                       1 (6.7%)        0           1 (7.7%)   
            Last or replicated                         0       2 (16.7%)          0       
            Any Abnormality                        1 (6.7%)    2 (16.7%)       1 (7.7%)   
          High                                                                            
            Single, not last                           0        1 (8.3%)          0       
            Last or replicated                         0           0              0       
            Any Abnormality                            0        1 (8.3%)          0       
        C-Reactive Protein Measurement (n)            12           14             15      
          Low                                                                             
            Single, not last                           0           0           1 (6.7%)   
            Last or replicated                     1 (8.3%)        0              0       
            Any Abnormality                        1 (8.3%)        0           1 (6.7%)   
          High                                                                            
            Single, not last                       1 (8.3%)        0           1 (6.7%)   
            Last or replicated                         0           0              0       
            Any Abnormality                        1 (8.3%)        0           1 (6.7%)   
        Immunoglobulin A Measurement (n)              11           14             13      
          Low                                                                             
            Single, not last                           0        1 (7.1%)       1 (7.7%)   
            Last or replicated                         0           0              0       
            Any Abnormality                            0        1 (7.1%)       1 (7.7%)   
          High                                                                            
            Single, not last                           0           0              0       
            Last or replicated                     1 (9.1%)        0              0       
            Any Abnormality                        1 (9.1%)        0              0       

---

    Code
      cat(export_as_txt(res_prune, lpp = 100))
    Output
        Laboratory Test                            A: Drug X   B: Placebo   C: Combination
            Direction of Abnormality                (N=15)       (N=15)         (N=15)    
        ——————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement (n)      15           12             13      
          Low                                                                             
            Any Abnormality                        1 (6.7%)    2 (16.7%)       1 (7.7%)   
          High                                                                            
            Any Abnormality                            0        1 (8.3%)          0       
        C-Reactive Protein Measurement (n)            12           14             15      
          Low                                                                             
            Any Abnormality                        1 (8.3%)        0           1 (6.7%)   
          High                                                                            
            Any Abnormality                        1 (8.3%)        0           1 (6.7%)   
        Immunoglobulin A Measurement (n)              11           14             13      
          Low                                                                             
            Any Abnormality                            0        1 (7.1%)       1 (7.7%)   
          High                                                                            
            Any Abnormality                        1 (9.1%)        0              0       

# lbt05 can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Laboratory Test                            A: Drug X   B: Placebo   C: Combination
            Direction of Abnormality                (N=15)       (N=15)         (N=15)    
        ——————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement (n)      15           12             13      
          Low                                                                             
            Single, not last                       1 (6.7%)        0           1 (7.7%)   
            Last or replicated                         0       2 (16.7%)          0       
            Any Abnormality                        1 (6.7%)    2 (16.7%)       1 (7.7%)   
          High                                                                            
            Single, not last                           0        1 (8.3%)          0       
            Last or replicated                         0           0              0       
            Any Abnormality                            0        1 (8.3%)          0       
        C-Reactive Protein Measurement (n)            12           14             15      
          Low                                                                             
            Single, not last                           0           0           1 (6.7%)   
            Last or replicated                     1 (8.3%)        0              0       
            Any Abnormality                        1 (8.3%)        0           1 (6.7%)   
          High                                                                            
            Single, not last                       1 (8.3%)        0           1 (6.7%)   
            Last or replicated                         0           0              0       
            Any Abnormality                        1 (8.3%)        0           1 (6.7%)   
        Immunoglobulin A Measurement (n)              11           14             13      
          Low                                                                             
            Single, not last                           0        1 (7.1%)       1 (7.7%)   
            Last or replicated                         0           0              0       
            Any Abnormality                            0        1 (7.1%)       1 (7.7%)   
          High                                                                            
            Single, not last                           0           0              0       
            Last or replicated                     1 (9.1%)        0              0       
            Any Abnormality                        1 (9.1%)        0              0       

