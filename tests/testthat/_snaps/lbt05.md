# lbt05 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Laboratory Test                            A: Drug X   B: Placebo   C: Combination
            Direction of Abnormality                (N=134)     (N=134)        (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement (n)      119         122            111      
          Low                                                                             
            Single, not last                       1 (0.8%)     2 (1.6%)       2 (1.8%)   
            Last or replicated                     2 (1.7%)     7 (5.7%)          0       
            Any Abnormality                        3 (2.5%)     9 (7.4%)       2 (1.8%)   
          High                                                                            
            Single, not last                       4 (3.4%)     4 (3.3%)       1 (0.9%)   
            Last or replicated                     2 (1.7%)     5 (4.1%)       4 (3.6%)   
            Any Abnormality                        6 (5.0%)     9 (7.4%)       5 (4.5%)   
        C-Reactive Protein Measurement (n)            124         114            114      
          Low                                                                             
            Single, not last                       1 (0.8%)        0           3 (2.6%)   
            Last or replicated                     5 (4.0%)     6 (5.3%)       2 (1.8%)   
            Any Abnormality                        6 (4.8%)     6 (5.3%)       5 (4.4%)   
          High                                                                            
            Single, not last                       2 (1.6%)     1 (0.9%)       2 (1.8%)   
            Last or replicated                     5 (4.0%)     5 (4.4%)       5 (4.4%)   
            Any Abnormality                        7 (5.6%)     6 (5.3%)       7 (6.1%)   
        Immunoglobulin A Measurement (n)              112         116            113      
          Low                                                                             
            Single, not last                       1 (0.9%)     3 (2.6%)       4 (3.5%)   
            Last or replicated                     4 (3.6%)     3 (2.6%)       2 (1.8%)   
            Any Abnormality                        5 (4.5%)     6 (5.2%)       6 (5.3%)   
          High                                                                            
            Single, not last                       1 (0.9%)     1 (0.9%)       2 (1.8%)   
            Last or replicated                     1 (0.9%)     5 (4.3%)       3 (2.7%)   
            Any Abnormality                        2 (1.8%)     6 (5.2%)       5 (4.4%)   

---

    Code
      cat(export_as_txt(res_prune, lpp = 100))
    Output
        Laboratory Test                            A: Drug X   B: Placebo   C: Combination
            Direction of Abnormality                (N=134)     (N=134)        (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement (n)      119         122            111      
          Low                                                                             
            Any Abnormality                        3 (2.5%)     9 (7.4%)       2 (1.8%)   
          High                                                                            
            Any Abnormality                        6 (5.0%)     9 (7.4%)       5 (4.5%)   
        C-Reactive Protein Measurement (n)            124         114            114      
          Low                                                                             
            Any Abnormality                        6 (4.8%)     6 (5.3%)       5 (4.4%)   
          High                                                                            
            Any Abnormality                        7 (5.6%)     6 (5.3%)       7 (6.1%)   
        Immunoglobulin A Measurement (n)              112         116            113      
          Low                                                                             
            Any Abnormality                        5 (4.5%)     6 (5.2%)       6 (5.3%)   
          High                                                                            
            Any Abnormality                        2 (1.8%)     6 (5.2%)       5 (4.4%)   

# lbt05 can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Laboratory Test                            A: Drug X   B: Placebo   C: Combination
            Direction of Abnormality                (N=134)     (N=134)        (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement (n)      119         122            111      
          Low                                                                             
            Single, not last                       1 (0.8%)     2 (1.6%)       2 (1.8%)   
            Last or replicated                     2 (1.7%)     7 (5.7%)          0       
            Any Abnormality                        3 (2.5%)     9 (7.4%)       2 (1.8%)   
          High                                                                            
            Single, not last                       4 (3.4%)     4 (3.3%)       1 (0.9%)   
            Last or replicated                     2 (1.7%)     5 (4.1%)       4 (3.6%)   
            Any Abnormality                        6 (5.0%)     9 (7.4%)       5 (4.5%)   
        C-Reactive Protein Measurement (n)            124         114            114      
          Low                                                                             
            Single, not last                       1 (0.8%)        0           3 (2.6%)   
            Last or replicated                     5 (4.0%)     6 (5.3%)       2 (1.8%)   
            Any Abnormality                        6 (4.8%)     6 (5.3%)       5 (4.4%)   
          High                                                                            
            Single, not last                       2 (1.6%)     1 (0.9%)       2 (1.8%)   
            Last or replicated                     5 (4.0%)     5 (4.4%)       5 (4.4%)   
            Any Abnormality                        7 (5.6%)     6 (5.3%)       7 (6.1%)   
        Immunoglobulin A Measurement (n)              112         116            113      
          Low                                                                             
            Single, not last                       1 (0.9%)     3 (2.6%)       4 (3.5%)   
            Last or replicated                     4 (3.6%)     3 (2.6%)       2 (1.8%)   
            Any Abnormality                        5 (4.5%)     6 (5.2%)       6 (5.3%)   
          High                                                                            
            Single, not last                       1 (0.9%)     1 (0.9%)       2 (1.8%)   
            Last or replicated                     1 (0.9%)     5 (4.3%)       3 (2.7%)   
            Any Abnormality                        2 (1.8%)     6 (5.2%)       5 (4.4%)   

