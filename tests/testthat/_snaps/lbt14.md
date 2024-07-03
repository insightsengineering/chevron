# lbt14 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      
      Parameter: Alanine Aminotransferase Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not Low                                    12           12             14      
                Not Low                         5 (33.3%)   8 (53.3%)      5 (33.3%)   
                1                               3 (20.0%)       0              0       
                2                               2 (13.3%)    1 (6.7%)       1 (6.7%)   
                3                                   0        1 (6.7%)      5 (33.3%)   
                4                               2 (13.3%)   2 (13.3%)      3 (20.0%)   
        1                                           1           2              0       
                Not Low                         1 (6.7%)    2 (13.3%)          0       
        2                                           1           1              0       
                Not Low                             0        1 (6.7%)          0       
                4                               1 (6.7%)        0              0       
        3                                           1           0              1       
                3                               1 (6.7%)        0           1 (6.7%)   

# lbt14 functions with default argument value return expected result with test data when direction = high

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      
      Parameter: Alanine Aminotransferase Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not High                                   15           15             15      
                Not High                        15 (100%)   15 (100%)      15 (100%)   

# lbt14 functions with `gr_missing = excl` return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      
      Parameter: Alanine Aminotransferase Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not Low                                    12           12             14      
                Not Low                         5 (33.3%)   8 (53.3%)      5 (33.3%)   
                1                               3 (20.0%)       0              0       
                2                               2 (13.3%)    1 (6.7%)       1 (6.7%)   
                3                                   0        1 (6.7%)      5 (33.3%)   
                4                               2 (13.3%)   2 (13.3%)      3 (20.0%)   
        1                                           1           2              0       
                Not Low                         1 (6.7%)    2 (13.3%)          0       
        2                                           1           1              0       
                Not Low                             0        1 (6.7%)          0       
                4                               1 (6.7%)        0              0       
        3                                           1           0              1       
                3                               1 (6.7%)        0           1 (6.7%)   

# lbt14 functions with `gr_missing = gr_0` return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      
      Parameter: Alanine Aminotransferase Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        1                                           1           2              0       
                Not Low                         1 (6.7%)    2 (13.3%)          0       
        2                                           1           1              0       
                Not Low                             0        1 (6.7%)          0       
                4                               1 (6.7%)        0              0       
        3                                           1           0              1       
                3                               1 (6.7%)        0           1 (6.7%)   
        Not Low                                    12           12             14      
                Not Low                         5 (33.3%)   8 (53.3%)      5 (33.3%)   
                1                               3 (20.0%)       0              0       
                2                               2 (13.3%)    1 (6.7%)       1 (6.7%)   
                3                                   0        1 (6.7%)      5 (33.3%)   
                4                               2 (13.3%)   2 (13.3%)      3 (20.0%)   

# lbt14 can handle all NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      
      Parameter: Alanine Aminotransferase Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        BTOXGR                                  A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Missing                                    15           15             15      
                Missing                         15 (100%)   15 (100%)      15 (100%)   

# lbt14 can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      
      Parameter: Alanine Aminotransferase Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        BTOXGR                                  A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not Low                                    12           12             12      
                Not Low                         5 (33.3%)   8 (53.3%)      4 (26.7%)   
                1                               3 (20.0%)       0              0       
                2                               2 (13.3%)    1 (6.7%)          0       
                3                                   0        1 (6.7%)      4 (26.7%)   
                4                               2 (13.3%)   2 (13.3%)      2 (13.3%)   
                Missing                             0           0          2 (13.3%)   
        1                                           1           2              0       
                Not Low                             0        1 (6.7%)          0       
                Missing                         1 (6.7%)     1 (6.7%)          0       
        2                                           1           1              0       
                Not Low                             0        1 (6.7%)          0       
                4                               1 (6.7%)        0              0       
        3                                           1           0              1       
                3                               1 (6.7%)        0           1 (6.7%)   
        Missing                                     0           0              2       
                Not Low                             0           0           1 (6.7%)   
                3                                   0           0           1 (6.7%)   

# lbt14 can accept different gr_missing

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
      
      Parameter: Alanine Aminotransferase Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not Low                                    12           12             14      
                Not Low                         5 (33.3%)   8 (53.3%)      5 (33.3%)   
                1                               3 (20.0%)       0              0       
                2                               2 (13.3%)    1 (6.7%)       1 (6.7%)   
                3                                   0        1 (6.7%)      5 (33.3%)   
                4                               2 (13.3%)   2 (13.3%)      3 (20.0%)   
        1                                           1           2              0       
                Not Low                         1 (6.7%)    2 (13.3%)          0       
        2                                           1           1              0       
                Not Low                             0        1 (6.7%)          0       
                4                               1 (6.7%)        0              0       
        3                                           1           0              1       
                3                               1 (6.7%)        0           1 (6.7%)   

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
      
      Parameter: Alanine Aminotransferase Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not Low                                    12           12             14      
                Not Low                         5 (33.3%)   8 (53.3%)      5 (33.3%)   
                1                               3 (20.0%)       0              0       
                2                               2 (13.3%)    1 (6.7%)       1 (6.7%)   
                3                                   0        1 (6.7%)      5 (33.3%)   
                4                               2 (13.3%)   2 (13.3%)      3 (20.0%)   
        1                                           1           2              0       
                Not Low                         1 (6.7%)    2 (13.3%)          0       
        2                                           1           1              0       
                Not Low                             0        1 (6.7%)          0       
                4                               1 (6.7%)        0              0       
        3                                           1           0              1       
                3                               1 (6.7%)        0           1 (6.7%)   

---

    Code
      cat(export_as_txt(res3, lpp = 100))
    Output
      
      Parameter: Alanine Aminotransferase Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        1                                           1           2              0       
                Not Low                         1 (6.7%)    2 (13.3%)          0       
        2                                           1           1              0       
                Not Low                             0        1 (6.7%)          0       
                4                               1 (6.7%)        0              0       
        3                                           1           0              1       
                3                               1 (6.7%)        0           1 (6.7%)   
        Not Low                                    12           12             14      
                Not Low                         5 (33.3%)   8 (53.3%)      5 (33.3%)   
                1                               3 (20.0%)       0              0       
                2                               2 (13.3%)    1 (6.7%)       1 (6.7%)   
                3                                   0        1 (6.7%)      5 (33.3%)   
                4                               2 (13.3%)   2 (13.3%)      3 (20.0%)   

# lbt14 can handle all NA values with direction = high

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      
      Parameter: Alanine Aminotransferase Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        BTOXGR                                  A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Missing                                    15           15             15      
                Missing                         15 (100%)   15 (100%)      15 (100%)   

# lbt14 can handle some NA values with direction = high

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      
      Parameter: Alanine Aminotransferase Measurement
      
        ————————————————————————————————————————————————————————————————————————————————
        BTOXGR                                  A: Drug X    B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade     (N=15)       (N=15)         (N=15)    
        ————————————————————————————————————————————————————————————————————————————————
        Not High                                    14           15             13      
                Not High                        13 (86.7%)   14 (93.3%)     12 (80.0%)  
                Missing                          1 (6.7%)     1 (6.7%)       1 (6.7%)   
        Missing                                     1            0              2       
                Not High                         1 (6.7%)        0          2 (13.3%)   

# lbt14 can accept different gr_missing with direction = high

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
      
      Parameter: Alanine Aminotransferase Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not High                                   15           15             15      
                Not High                        15 (100%)   15 (100%)      15 (100%)   

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
      
      Parameter: Alanine Aminotransferase Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not High                                   15           15             15      
                Not High                        15 (100%)   15 (100%)      15 (100%)   

---

    Code
      cat(export_as_txt(res3, lpp = 100))
    Output
      
      Parameter: Alanine Aminotransferase Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not High                                   15           15             15      
                Not High                        15 (100%)   15 (100%)      15 (100%)   

