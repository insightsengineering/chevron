# lbt05 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Laboratory Test                            A: Drug X   B: Placebo   C: Combination
            Direction of Abnormality                (N=15)       (N=15)         (N=15)    
        ——————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement (n)      15           14             14      
          Low                                                                             
            Single, not last                       1 (6.7%)        0          4 (28.6%)   
            Last or replicated                     5 (33.3%)   4 (28.6%)      4 (28.6%)   
            Any Abnormality                        6 (40.0%)   4 (28.6%)      8 (57.1%)   
          High                                                                            
            Single, not last                           0           0              0       
            Last or replicated                         0           0              0       
            Any Abnormality                            0           0              0       
        C-Reactive Protein Measurement (n)            15           15             15      
          Low                                                                             
            Single, not last                       4 (26.7%)       0          3 (20.0%)   
            Last or replicated                     3 (20.0%)   5 (33.3%)      6 (40.0%)   
            Any Abnormality                        7 (46.7%)   5 (33.3%)      9 (60.0%)   
          High                                                                            
            Single, not last                       1 (6.7%)    3 (20.0%)          0       
            Last or replicated                     4 (26.7%)   3 (20.0%)      6 (40.0%)   
            Any Abnormality                        5 (33.3%)   6 (40.0%)      6 (40.0%)   
        Immunoglobulin A Measurement (n)              13           14             14      
          Low                                                                             
            Single, not last                           0           0              0       
            Last or replicated                         0           0              0       
            Any Abnormality                            0           0              0       
          High                                                                            
            Single, not last                       6 (46.2%)    1 (7.1%)      2 (14.3%)   
            Last or replicated                     3 (23.1%)   4 (28.6%)      3 (21.4%)   
            Any Abnormality                        9 (69.2%)   5 (35.7%)      5 (35.7%)   

# lbt05 can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Laboratory Test                            A: Drug X   B: Placebo   C: Combination
            Direction of Abnormality                (N=15)       (N=15)         (N=15)    
        ——————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement (n)      15           14             14      
          Low                                                                             
            Single, not last                       1 (6.7%)        0          4 (28.6%)   
            Last or replicated                     5 (33.3%)   4 (28.6%)      4 (28.6%)   
            Any Abnormality                        6 (40.0%)   4 (28.6%)      8 (57.1%)   
          High                                                                            
            Single, not last                           0           0              0       
            Last or replicated                         0           0              0       
            Any Abnormality                            0           0              0       
        C-Reactive Protein Measurement (n)            15           15             15      
          Low                                                                             
            Single, not last                       4 (26.7%)       0          3 (20.0%)   
            Last or replicated                     3 (20.0%)   5 (33.3%)      6 (40.0%)   
            Any Abnormality                        7 (46.7%)   5 (33.3%)      9 (60.0%)   
          High                                                                            
            Single, not last                       1 (6.7%)    3 (20.0%)          0       
            Last or replicated                     4 (26.7%)   3 (20.0%)      6 (40.0%)   
            Any Abnormality                        5 (33.3%)   6 (40.0%)      6 (40.0%)   
        Immunoglobulin A Measurement (n)              13           14             14      
          Low                                                                             
            Single, not last                           0           0              0       
            Last or replicated                         0           0              0       
            Any Abnormality                            0           0              0       
          High                                                                            
            Single, not last                       6 (46.2%)    1 (7.1%)      2 (14.3%)   
            Last or replicated                     3 (23.1%)   4 (28.6%)      3 (21.4%)   
            Any Abnormality                        9 (69.2%)   5 (35.7%)      5 (35.7%)   

# lbt05 works with missing levels

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Laboratory Test                            A: Drug X   B: Placebo   C: Combination
            Direction of Abnormality                (N=15)       (N=15)         (N=15)    
        ——————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement (n)       0           0              0       
          Low                                                                             
            Single, not last                           0           0              0       
            Last or replicated                         0           0              0       
            Any Abnormality                            0           0              0       
          High                                                                            
            Single, not last                           0           0              0       
            Last or replicated                         0           0              0       
            Any Abnormality                            0           0              0       
        C-Reactive Protein Measurement (n)             0           0              0       
          Low                                                                             
            Single, not last                           0           0              0       
            Last or replicated                         0           0              0       
            Any Abnormality                            0           0              0       
          High                                                                            
            Single, not last                           0           0              0       
            Last or replicated                         0           0              0       
            Any Abnormality                            0           0              0       
        Immunoglobulin A Measurement (n)              13           14             14      
          Low                                                                             
            Single, not last                           0           0              0       
            Last or replicated                         0           0              0       
            Any Abnormality                            0           0              0       
          High                                                                            
            Single, not last                       6 (46.2%)    1 (7.1%)      2 (14.3%)   
            Last or replicated                     3 (23.1%)   4 (28.6%)      3 (21.4%)   
            Any Abnormality                        9 (69.2%)   5 (35.7%)      5 (35.7%)   

# map argument works as expected

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Laboratory Test                            A: Drug X   B: Placebo   C: Combination
            Direction of Abnormality                (N=15)       (N=15)         (N=15)    
        ——————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement (n)      15           14             14      
          Low                                                                             
            Single, not last                       1 (6.7%)        0          4 (28.6%)   
            Last or replicated                     5 (33.3%)   4 (28.6%)      4 (28.6%)   
            Any Abnormality                        6 (40.0%)   4 (28.6%)      8 (57.1%)   
          High                                                                            
            Single, not last                           0           0              0       
            Last or replicated                         0           0              0       
            Any Abnormality                            0           0              0       
        C-Reactive Protein Measurement (n)            15           15             15      
          High                                                                            
            Single, not last                       1 (6.7%)    3 (20.0%)          0       
            Last or replicated                     4 (26.7%)   3 (20.0%)      6 (40.0%)   
            Any Abnormality                        5 (33.3%)   6 (40.0%)      6 (40.0%)   
        Immunoglobulin A Measurement (n)              13           14             14      
          Low                                                                             
            Single, not last                           0           0              0       
            Last or replicated                         0           0              0       
            Any Abnormality                            0           0              0       

# incomplete map argument works as expected

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Laboratory Test                            A: Drug X   B: Placebo   C: Combination
            Direction of Abnormality                (N=15)       (N=15)         (N=15)    
        ——————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement (n)      15           14             14      
          Low                                                                             
            Single, not last                       1 (6.7%)        0          4 (28.6%)   
            Last or replicated                     5 (33.3%)   4 (28.6%)      4 (28.6%)   
            Any Abnormality                        6 (40.0%)   4 (28.6%)      8 (57.1%)   
        C-Reactive Protein Measurement (n)            15           15             15      
          Low                                                                             
            Single, not last                       4 (26.7%)       0          3 (20.0%)   
            Last or replicated                     3 (20.0%)   5 (33.3%)      6 (40.0%)   
            Any Abnormality                        7 (46.7%)   5 (33.3%)      9 (60.0%)   
          High                                                                            
            Single, not last                       1 (6.7%)    3 (20.0%)          0       
            Last or replicated                     4 (26.7%)   3 (20.0%)      6 (40.0%)   
            Any Abnormality                        5 (33.3%)   6 (40.0%)      6 (40.0%)   
        Immunoglobulin A Measurement (n)              13           14             14      
          Low                                                                             
            Single, not last                           0           0              0       
            Last or replicated                         0           0              0       
            Any Abnormality                            0           0              0       
          High                                                                            
            Single, not last                       6 (46.2%)    1 (7.1%)      2 (14.3%)   
            Last or replicated                     3 (23.1%)   4 (28.6%)      3 (21.4%)   
            Any Abnormality                        9 (69.2%)   5 (35.7%)      5 (35.7%)   

