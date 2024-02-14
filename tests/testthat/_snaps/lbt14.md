# lbt14 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      
      Parameter: Alanine Aminotransferase Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not Low                                    13           13             14      
                Not Low                         6 (40.0%)   5 (33.3%)      9 (60.0%)   
                1                               3 (20.0%)   2 (13.3%)      2 (13.3%)   
                2                                   0        1 (6.7%)       1 (6.7%)   
                3                               3 (20.0%)   3 (20.0%)      2 (13.3%)   
                4                               1 (6.7%)    2 (13.3%)          0       
        1                                           1           1              0       
                Not Low                             0        1 (6.7%)          0       
                3                               1 (6.7%)        0              0       
        2                                           0           0              1       
                Not Low                             0           0           1 (6.7%)   
        3                                           0           1              0       
                Not Low                             0        1 (6.7%)          0       
        4                                           1           0              0       
                3                               1 (6.7%)        0              0       

# lbt14 functions with default argument value return expected result with test data when direction = high

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      
      Parameter: Alanine Aminotransferase Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not High                                   14           13             15      
                Not High                        9 (60.0%)   9 (60.0%)      7 (46.7%)   
                1                               2 (13.3%)   2 (13.3%)      3 (20.0%)   
                2                               2 (13.3%)       0          4 (26.7%)   
                3                               1 (6.7%)     1 (6.7%)       1 (6.7%)   
                4                                   0        1 (6.7%)          0       
        1                                           1           0              0       
                1                               1 (6.7%)        0              0       
        2                                           0           1              0       
                Not High                            0        1 (6.7%)          0       
        3                                           0           1              0       
                Not High                            0        1 (6.7%)          0       

# lbt14 functions with `gr_missing = excl` return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      
      Parameter: Alanine Aminotransferase Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not Low                                    13           13             14      
                Not Low                         6 (40.0%)   5 (33.3%)      9 (60.0%)   
                1                               3 (20.0%)   2 (13.3%)      2 (13.3%)   
                2                                   0        1 (6.7%)       1 (6.7%)   
                3                               3 (20.0%)   3 (20.0%)      2 (13.3%)   
                4                               1 (6.7%)    2 (13.3%)          0       
        1                                           1           1              0       
                Not Low                             0        1 (6.7%)          0       
                3                               1 (6.7%)        0              0       
        2                                           0           0              1       
                Not Low                             0           0           1 (6.7%)   
        3                                           0           1              0       
                Not Low                             0        1 (6.7%)          0       
        4                                           1           0              0       
                3                               1 (6.7%)        0              0       

# lbt14 functions with `gr_missing = gr_0` return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      
      Parameter: Alanine Aminotransferase Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        1                                           1           1              0       
                Not Low                             0        1 (6.7%)          0       
                3                               1 (6.7%)        0              0       
        2                                           0           0              1       
                1                                   0           0           1 (6.7%)   
        3                                           0           1              0       
                1                                   0        1 (6.7%)          0       
        4                                           1           0              0       
                3                               1 (6.7%)        0              0       
        Not Low                                    13           13             14      
                Not Low                         6 (40.0%)   5 (33.3%)      9 (60.0%)   
                1                               3 (20.0%)   2 (13.3%)      2 (13.3%)   
                2                                   0        1 (6.7%)       1 (6.7%)   
                3                               3 (20.0%)   3 (20.0%)      2 (13.3%)   
                4                               1 (6.7%)    2 (13.3%)          0       

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
        Not Low                                    12           11             14      
                Not Low                         4 (26.7%)   4 (26.7%)      9 (60.0%)   
                1                               3 (20.0%)   2 (13.3%)       1 (6.7%)   
                2                                   0        1 (6.7%)       1 (6.7%)   
                3                               3 (20.0%)   2 (13.3%)      2 (13.3%)   
                4                               1 (6.7%)    2 (13.3%)          0       
                Missing                         1 (6.7%)        0           1 (6.7%)   
        1                                           1           1              0       
                Not Low                             0        1 (6.7%)          0       
                3                               1 (6.7%)        0              0       
        2                                           0           0              1       
                Not Low                             0           0           1 (6.7%)   
        3                                           0           1              0       
                Not Low                             0        1 (6.7%)          0       
        4                                           1           0              0       
                3                               1 (6.7%)        0              0       
        Missing                                     1           2              0       
                Not Low                         1 (6.7%)     1 (6.7%)          0       
                3                                   0        1 (6.7%)          0       

# lbt14 can accept different gr_missing

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
      
      Parameter: Alanine Aminotransferase Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not Low                                    13           13             14      
                Not Low                         6 (40.0%)   5 (33.3%)      9 (60.0%)   
                1                               3 (20.0%)   2 (13.3%)      2 (13.3%)   
                2                                   0        1 (6.7%)       1 (6.7%)   
                3                               3 (20.0%)   3 (20.0%)      2 (13.3%)   
                4                               1 (6.7%)    2 (13.3%)          0       
        1                                           1           1              0       
                Not Low                             0        1 (6.7%)          0       
                3                               1 (6.7%)        0              0       
        2                                           0           0              1       
                Not Low                             0           0           1 (6.7%)   
        3                                           0           1              0       
                Not Low                             0        1 (6.7%)          0       
        4                                           1           0              0       
                3                               1 (6.7%)        0              0       

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
      
      Parameter: Alanine Aminotransferase Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not Low                                    13           13             14      
                Not Low                         6 (40.0%)   5 (33.3%)      9 (60.0%)   
                1                               3 (20.0%)   2 (13.3%)      2 (13.3%)   
                2                                   0        1 (6.7%)       1 (6.7%)   
                3                               3 (20.0%)   3 (20.0%)      2 (13.3%)   
                4                               1 (6.7%)    2 (13.3%)          0       
        1                                           1           1              0       
                Not Low                             0        1 (6.7%)          0       
                3                               1 (6.7%)        0              0       
        2                                           0           0              1       
                Not Low                             0           0           1 (6.7%)   
        3                                           0           1              0       
                Not Low                             0        1 (6.7%)          0       
        4                                           1           0              0       
                3                               1 (6.7%)        0              0       

---

    Code
      cat(export_as_txt(res3, lpp = 100))
    Output
      
      Parameter: Alanine Aminotransferase Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        1                                           1           1              0       
                Not Low                             0        1 (6.7%)          0       
                3                               1 (6.7%)        0              0       
        2                                           0           0              1       
                1                                   0           0           1 (6.7%)   
        3                                           0           1              0       
                1                                   0        1 (6.7%)          0       
        4                                           1           0              0       
                3                               1 (6.7%)        0              0       
        Not Low                                    13           13             14      
                Not Low                         6 (40.0%)   5 (33.3%)      9 (60.0%)   
                1                               3 (20.0%)   2 (13.3%)      2 (13.3%)   
                2                                   0        1 (6.7%)       1 (6.7%)   
                3                               3 (20.0%)   3 (20.0%)      2 (13.3%)   
                4                               1 (6.7%)    2 (13.3%)          0       

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
      
        ———————————————————————————————————————————————————————————————————————————————
        BTOXGR                                  A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not High                                   13           13             14      
                Not High                        8 (53.3%)   9 (60.0%)      6 (40.0%)   
                1                               2 (13.3%)   2 (13.3%)      3 (20.0%)   
                2                               2 (13.3%)       0          3 (20.0%)   
                3                                   0        1 (6.7%)       1 (6.7%)   
                4                                   0        1 (6.7%)          0       
                Missing                         1 (6.7%)        0           1 (6.7%)   
        1                                           1           0              0       
                1                               1 (6.7%)        0              0       
        2                                           0           1              0       
                Not High                            0        1 (6.7%)          0       
        3                                           0           1              0       
                Not High                            0        1 (6.7%)          0       
        Missing                                     1           0              1       
                Not High                        1 (6.7%)        0           1 (6.7%)   

# lbt14 can accept different gr_missing with direction = high

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
      
      Parameter: Alanine Aminotransferase Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not High                                   14           13             15      
                Not High                        9 (60.0%)   9 (60.0%)      7 (46.7%)   
                1                               2 (13.3%)   2 (13.3%)      3 (20.0%)   
                2                               2 (13.3%)       0          4 (26.7%)   
                3                               1 (6.7%)     1 (6.7%)       1 (6.7%)   
                4                                   0        1 (6.7%)          0       
        1                                           1           0              0       
                1                               1 (6.7%)        0              0       
        2                                           0           1              0       
                Not High                            0        1 (6.7%)          0       
        3                                           0           1              0       
                Not High                            0        1 (6.7%)          0       

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
      
      Parameter: Alanine Aminotransferase Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not High                                   14           13             15      
                Not High                        9 (60.0%)   9 (60.0%)      7 (46.7%)   
                1                               2 (13.3%)   2 (13.3%)      3 (20.0%)   
                2                               2 (13.3%)       0          4 (26.7%)   
                3                               1 (6.7%)     1 (6.7%)       1 (6.7%)   
                4                                   0        1 (6.7%)          0       
        1                                           1           0              0       
                1                               1 (6.7%)        0              0       
        2                                           0           1              0       
                Not High                            0        1 (6.7%)          0       
        3                                           0           1              0       
                Not High                            0        1 (6.7%)          0       

---

    Code
      cat(export_as_txt(res3, lpp = 100))
    Output
      
      Parameter: Alanine Aminotransferase Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        1                                           1           0              0       
                1                               1 (6.7%)        0              0       
        2                                           0           1              0       
                1                                   0        1 (6.7%)          0       
        3                                           0           1              0       
                1                                   0        1 (6.7%)          0       
        Not High                                   14           13             15      
                Not High                        9 (60.0%)   9 (60.0%)      7 (46.7%)   
                1                               2 (13.3%)   2 (13.3%)      3 (20.0%)   
                2                               2 (13.3%)       0          4 (26.7%)   
                3                               1 (6.7%)     1 (6.7%)       1 (6.7%)   
                4                                   0        1 (6.7%)          0       

