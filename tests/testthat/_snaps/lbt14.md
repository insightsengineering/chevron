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
      \s\n
      Parameter: C-Reactive Protein Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not Low                                    14           11             13      
                Not Low                         9 (60.0%)   9 (60.0%)      4 (26.7%)   
                1                               2 (13.3%)    1 (6.7%)      3 (20.0%)   
                2                                   0        1 (6.7%)      2 (13.3%)   
                3                               2 (13.3%)       0          3 (20.0%)   
                4                               1 (6.7%)        0           1 (6.7%)   
        1                                           0           1              0       
                Not Low                             0        1 (6.7%)          0       
        2                                           0           1              0       
                2                                   0        1 (6.7%)          0       
        3                                           1           1              1       
                Not Low                         1 (6.7%)     1 (6.7%)          0       
                3                                   0           0           1 (6.7%)   
        4                                           0           1              1       
                Not Low                             0        1 (6.7%)       1 (6.7%)   
      \s\n
      Parameter: Immunoglobulin A Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not Low                                    13           14             13      
                Not Low                         7 (46.7%)   10 (66.7%)     7 (46.7%)   
                1                               2 (13.3%)    1 (6.7%)          0       
                2                               1 (6.7%)        0          2 (13.3%)   
                3                               2 (13.3%)    1 (6.7%)      4 (26.7%)   
                4                               1 (6.7%)    2 (13.3%)          0       
        1                                           1           1              0       
                Not Low                         1 (6.7%)        0              0       
                2                                   0        1 (6.7%)          0       
        3                                           1           0              1       
                Not Low                         1 (6.7%)        0              0       
                4                                   0           0           1 (6.7%)   
        4                                           0           0              1       
                4                                   0           0           1 (6.7%)   

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
      \s\n
      Parameter: C-Reactive Protein Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not High                                   13           13             13      
                Not High                        7 (46.7%)   12 (80.0%)     12 (80.0%)  
                1                               1 (6.7%)        0              0       
                2                               3 (20.0%)       0              0       
                3                               1 (6.7%)        0           1 (6.7%)   
                4                               1 (6.7%)     1 (6.7%)          0       
        1                                           1           1              1       
                Not High                        1 (6.7%)     1 (6.7%)       1 (6.7%)   
        2                                           1           1              1       
                Not High                        1 (6.7%)     1 (6.7%)       1 (6.7%)   
      \s\n
      Parameter: Immunoglobulin A Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not High                                   12           15             13      
                Not High                        6 (40.0%)   10 (66.7%)     11 (73.3%)  
                1                               4 (26.7%)   2 (13.3%)          0       
                2                               1 (6.7%)     1 (6.7%)       1 (6.7%)   
                3                               1 (6.7%)     1 (6.7%)          0       
                4                                   0        1 (6.7%)       1 (6.7%)   
        1                                           1           0              2       
                Not High                        1 (6.7%)        0          2 (13.3%)   
        3                                           1           0              0       
                Not High                        1 (6.7%)        0              0       
        4                                           1           0              0       
                Not High                        1 (6.7%)        0              0       

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
      \s\n
      Parameter: C-Reactive Protein Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not Low                                    14           11             13      
                Not Low                         9 (60.0%)   9 (60.0%)      4 (26.7%)   
                1                               2 (13.3%)    1 (6.7%)      3 (20.0%)   
                2                                   0        1 (6.7%)      2 (13.3%)   
                3                               2 (13.3%)       0          3 (20.0%)   
                4                               1 (6.7%)        0           1 (6.7%)   
        1                                           0           1              0       
                Not Low                             0        1 (6.7%)          0       
        2                                           0           1              0       
                2                                   0        1 (6.7%)          0       
        3                                           1           1              1       
                Not Low                         1 (6.7%)     1 (6.7%)          0       
                3                                   0           0           1 (6.7%)   
        4                                           0           1              1       
                Not Low                             0        1 (6.7%)       1 (6.7%)   
      \s\n
      Parameter: Immunoglobulin A Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not Low                                    13           14             13      
                Not Low                         7 (46.7%)   10 (66.7%)     7 (46.7%)   
                1                               2 (13.3%)    1 (6.7%)          0       
                2                               1 (6.7%)        0          2 (13.3%)   
                3                               2 (13.3%)    1 (6.7%)      4 (26.7%)   
                4                               1 (6.7%)    2 (13.3%)          0       
        1                                           1           1              0       
                Not Low                         1 (6.7%)        0              0       
                2                                   0        1 (6.7%)          0       
        3                                           1           0              1       
                Not Low                         1 (6.7%)        0              0       
                4                                   0           0           1 (6.7%)   
        4                                           0           0              1       
                4                                   0           0           1 (6.7%)   

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
      \s\n
      Parameter: C-Reactive Protein Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        1                                           0           1              0       
                1                                   0        1 (6.7%)          0       
        2                                           0           1              0       
                3                                   0        1 (6.7%)          0       
        3                                           1           1              1       
                Not Low                         1 (6.7%)     1 (6.7%)          0       
                3                                   0           0           1 (6.7%)   
        4                                           0           1              1       
                1                                   0        1 (6.7%)       1 (6.7%)   
        Not Low                                    14           11             13      
                Not Low                         9 (60.0%)   9 (60.0%)      4 (26.7%)   
                1                               2 (13.3%)    1 (6.7%)      3 (20.0%)   
                2                                   0        1 (6.7%)      2 (13.3%)   
                3                               2 (13.3%)       0          3 (20.0%)   
                4                               1 (6.7%)        0           1 (6.7%)   
      \s\n
      Parameter: Immunoglobulin A Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        1                                           1           1              0       
                Not Low                         1 (6.7%)        0              0       
                2                                   0        1 (6.7%)          0       
        3                                           1           0              1       
                Not Low                         1 (6.7%)        0              0       
                4                                   0           0           1 (6.7%)   
        4                                           0           0              1       
                Not Low                             0           0           1 (6.7%)   
        Not Low                                    13           14             13      
                Not Low                         7 (46.7%)   10 (66.7%)     7 (46.7%)   
                1                               2 (13.3%)    1 (6.7%)          0       
                2                               1 (6.7%)        0          2 (13.3%)   
                3                               2 (13.3%)    1 (6.7%)      4 (26.7%)   
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
      \s\n
      Parameter: C-Reactive Protein Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        BTOXGR                                  A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Missing                                    15           15             15      
                Missing                         15 (100%)   15 (100%)      15 (100%)   
      \s\n
      Parameter: Immunoglobulin A Measurement
      
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
        Not Low                                    13           11             14      
                Not Low                         6 (40.0%)   4 (26.7%)      9 (60.0%)   
                1                               3 (20.0%)   2 (13.3%)      2 (13.3%)   
                2                                   0        1 (6.7%)       1 (6.7%)   
                3                               3 (20.0%)   2 (13.3%)      2 (13.3%)   
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
        Missing                                     0           2              0       
                Not Low                             0        1 (6.7%)          0       
                3                                   0        1 (6.7%)          0       
      \s\n
      Parameter: C-Reactive Protein Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        BTOXGR                                  A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not Low                                    14           11             13      
                Not Low                         9 (60.0%)   9 (60.0%)      3 (20.0%)   
                1                               2 (13.3%)    1 (6.7%)      3 (20.0%)   
                2                                   0        1 (6.7%)      2 (13.3%)   
                3                               2 (13.3%)       0          3 (20.0%)   
                4                               1 (6.7%)        0           1 (6.7%)   
                Missing                             0           0           1 (6.7%)   
        1                                           0           1              0       
                Not Low                             0        1 (6.7%)          0       
        2                                           0           1              0       
                2                                   0        1 (6.7%)          0       
        3                                           1           1              1       
                Not Low                         1 (6.7%)     1 (6.7%)          0       
                3                                   0           0           1 (6.7%)   
        4                                           0           1              1       
                Not Low                             0        1 (6.7%)       1 (6.7%)   
      \s\n
      Parameter: Immunoglobulin A Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        BTOXGR                                  A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not Low                                    11           14             12      
                Not Low                         4 (26.7%)   10 (66.7%)     6 (40.0%)   
                1                               2 (13.3%)    1 (6.7%)          0       
                2                               1 (6.7%)        0          2 (13.3%)   
                3                               2 (13.3%)    1 (6.7%)      4 (26.7%)   
                4                               1 (6.7%)    2 (13.3%)          0       
                Missing                         1 (6.7%)        0              0       
        1                                           1           1              0       
                Not Low                         1 (6.7%)        0              0       
                2                                   0        1 (6.7%)          0       
        3                                           1           0              1       
                Not Low                         1 (6.7%)        0              0       
                4                                   0           0           1 (6.7%)   
        4                                           0           0              1       
                4                                   0           0           1 (6.7%)   
        Missing                                     2           0              1       
                Not Low                         1 (6.7%)        0           1 (6.7%)   
                Missing                         1 (6.7%)        0              0       

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
      \s\n
      Parameter: C-Reactive Protein Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not Low                                    14           11             13      
                Not Low                         9 (60.0%)   9 (60.0%)      4 (26.7%)   
                1                               2 (13.3%)    1 (6.7%)      3 (20.0%)   
                2                                   0        1 (6.7%)      2 (13.3%)   
                3                               2 (13.3%)       0          3 (20.0%)   
                4                               1 (6.7%)        0           1 (6.7%)   
        1                                           0           1              0       
                Not Low                             0        1 (6.7%)          0       
        2                                           0           1              0       
                2                                   0        1 (6.7%)          0       
        3                                           1           1              1       
                Not Low                         1 (6.7%)     1 (6.7%)          0       
                3                                   0           0           1 (6.7%)   
        4                                           0           1              1       
                Not Low                             0        1 (6.7%)       1 (6.7%)   
      \s\n
      Parameter: Immunoglobulin A Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not Low                                    13           14             13      
                Not Low                         7 (46.7%)   10 (66.7%)     7 (46.7%)   
                1                               2 (13.3%)    1 (6.7%)          0       
                2                               1 (6.7%)        0          2 (13.3%)   
                3                               2 (13.3%)    1 (6.7%)      4 (26.7%)   
                4                               1 (6.7%)    2 (13.3%)          0       
        1                                           1           1              0       
                Not Low                         1 (6.7%)        0              0       
                2                                   0        1 (6.7%)          0       
        3                                           1           0              1       
                Not Low                         1 (6.7%)        0              0       
                4                                   0           0           1 (6.7%)   
        4                                           0           0              1       
                4                                   0           0           1 (6.7%)   

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
      \s\n
      Parameter: C-Reactive Protein Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not Low                                    14           11             13      
                Not Low                         9 (60.0%)   9 (60.0%)      4 (26.7%)   
                1                               2 (13.3%)    1 (6.7%)      3 (20.0%)   
                2                                   0        1 (6.7%)      2 (13.3%)   
                3                               2 (13.3%)       0          3 (20.0%)   
                4                               1 (6.7%)        0           1 (6.7%)   
        1                                           0           1              0       
                Not Low                             0        1 (6.7%)          0       
        2                                           0           1              0       
                2                                   0        1 (6.7%)          0       
        3                                           1           1              1       
                Not Low                         1 (6.7%)     1 (6.7%)          0       
                3                                   0           0           1 (6.7%)   
        4                                           0           1              1       
                Not Low                             0        1 (6.7%)       1 (6.7%)   
      \s\n
      Parameter: Immunoglobulin A Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not Low                                    13           14             13      
                Not Low                         7 (46.7%)   10 (66.7%)     7 (46.7%)   
                1                               2 (13.3%)    1 (6.7%)          0       
                2                               1 (6.7%)        0          2 (13.3%)   
                3                               2 (13.3%)    1 (6.7%)      4 (26.7%)   
                4                               1 (6.7%)    2 (13.3%)          0       
        1                                           1           1              0       
                Not Low                         1 (6.7%)        0              0       
                2                                   0        1 (6.7%)          0       
        3                                           1           0              1       
                Not Low                         1 (6.7%)        0              0       
                4                                   0           0           1 (6.7%)   
        4                                           0           0              1       
                4                                   0           0           1 (6.7%)   

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
      \s\n
      Parameter: C-Reactive Protein Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        1                                           0           1              0       
                1                                   0        1 (6.7%)          0       
        2                                           0           1              0       
                3                                   0        1 (6.7%)          0       
        3                                           1           1              1       
                Not Low                         1 (6.7%)     1 (6.7%)          0       
                3                                   0           0           1 (6.7%)   
        4                                           0           1              1       
                1                                   0        1 (6.7%)       1 (6.7%)   
        Not Low                                    14           11             13      
                Not Low                         9 (60.0%)   9 (60.0%)      4 (26.7%)   
                1                               2 (13.3%)    1 (6.7%)      3 (20.0%)   
                2                                   0        1 (6.7%)      2 (13.3%)   
                3                               2 (13.3%)       0          3 (20.0%)   
                4                               1 (6.7%)        0           1 (6.7%)   
      \s\n
      Parameter: Immunoglobulin A Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        1                                           1           1              0       
                Not Low                         1 (6.7%)        0              0       
                2                                   0        1 (6.7%)          0       
        3                                           1           0              1       
                Not Low                         1 (6.7%)        0              0       
                4                                   0           0           1 (6.7%)   
        4                                           0           0              1       
                Not Low                             0           0           1 (6.7%)   
        Not Low                                    13           14             13      
                Not Low                         7 (46.7%)   10 (66.7%)     7 (46.7%)   
                1                               2 (13.3%)    1 (6.7%)          0       
                2                               1 (6.7%)        0          2 (13.3%)   
                3                               2 (13.3%)    1 (6.7%)      4 (26.7%)   
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
      \s\n
      Parameter: C-Reactive Protein Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        BTOXGR                                  A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Missing                                    15           15             15      
                Missing                         15 (100%)   15 (100%)      15 (100%)   
      \s\n
      Parameter: Immunoglobulin A Measurement
      
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
      \s\n
      Parameter: C-Reactive Protein Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        BTOXGR                                  A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not High                                   13           12             13      
                Not High                        6 (40.0%)   11 (73.3%)     12 (80.0%)  
                1                               1 (6.7%)        0              0       
                2                               3 (20.0%)       0              0       
                3                               1 (6.7%)        0           1 (6.7%)   
                4                               1 (6.7%)     1 (6.7%)          0       
                Missing                         1 (6.7%)        0              0       
        1                                           1           1              1       
                Not High                        1 (6.7%)     1 (6.7%)       1 (6.7%)   
        2                                           1           1              1       
                Not High                        1 (6.7%)     1 (6.7%)       1 (6.7%)   
        Missing                                     0           1              0       
                Not High                            0        1 (6.7%)          0       
      \s\n
      Parameter: Immunoglobulin A Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        BTOXGR                                  A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not High                                   10           15             13      
                Not High                        4 (26.7%)   10 (66.7%)     10 (66.7%)  
                1                               4 (26.7%)   2 (13.3%)          0       
                2                               1 (6.7%)     1 (6.7%)       1 (6.7%)   
                3                               1 (6.7%)     1 (6.7%)          0       
                4                                   0        1 (6.7%)       1 (6.7%)   
                Missing                             0           0           1 (6.7%)   
        1                                           1           0              2       
                Not High                        1 (6.7%)        0          2 (13.3%)   
        3                                           1           0              0       
                Not High                        1 (6.7%)        0              0       
        4                                           1           0              0       
                Not High                        1 (6.7%)        0              0       
        Missing                                     2           0              0       
                Not High                        1 (6.7%)        0              0       
                Missing                         1 (6.7%)        0              0       

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
      \s\n
      Parameter: C-Reactive Protein Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not High                                   13           13             13      
                Not High                        7 (46.7%)   12 (80.0%)     12 (80.0%)  
                1                               1 (6.7%)        0              0       
                2                               3 (20.0%)       0              0       
                3                               1 (6.7%)        0           1 (6.7%)   
                4                               1 (6.7%)     1 (6.7%)          0       
        1                                           1           1              1       
                Not High                        1 (6.7%)     1 (6.7%)       1 (6.7%)   
        2                                           1           1              1       
                Not High                        1 (6.7%)     1 (6.7%)       1 (6.7%)   
      \s\n
      Parameter: Immunoglobulin A Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not High                                   12           15             13      
                Not High                        6 (40.0%)   10 (66.7%)     11 (73.3%)  
                1                               4 (26.7%)   2 (13.3%)          0       
                2                               1 (6.7%)     1 (6.7%)       1 (6.7%)   
                3                               1 (6.7%)     1 (6.7%)          0       
                4                                   0        1 (6.7%)       1 (6.7%)   
        1                                           1           0              2       
                Not High                        1 (6.7%)        0          2 (13.3%)   
        3                                           1           0              0       
                Not High                        1 (6.7%)        0              0       
        4                                           1           0              0       
                Not High                        1 (6.7%)        0              0       

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
      \s\n
      Parameter: C-Reactive Protein Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not High                                   13           13             13      
                Not High                        7 (46.7%)   12 (80.0%)     12 (80.0%)  
                1                               1 (6.7%)        0              0       
                2                               3 (20.0%)       0              0       
                3                               1 (6.7%)        0           1 (6.7%)   
                4                               1 (6.7%)     1 (6.7%)          0       
        1                                           1           1              1       
                Not High                        1 (6.7%)     1 (6.7%)       1 (6.7%)   
        2                                           1           1              1       
                Not High                        1 (6.7%)     1 (6.7%)       1 (6.7%)   
      \s\n
      Parameter: Immunoglobulin A Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        Not High                                   12           15             13      
                Not High                        6 (40.0%)   10 (66.7%)     11 (73.3%)  
                1                               4 (26.7%)   2 (13.3%)          0       
                2                               1 (6.7%)     1 (6.7%)       1 (6.7%)   
                3                               1 (6.7%)     1 (6.7%)          0       
                4                                   0        1 (6.7%)       1 (6.7%)   
        1                                           1           0              2       
                Not High                        1 (6.7%)        0          2 (13.3%)   
        3                                           1           0              0       
                Not High                        1 (6.7%)        0              0       
        4                                           1           0              0       
                Not High                        1 (6.7%)        0              0       

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
      \s\n
      Parameter: C-Reactive Protein Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        1                                           1           1              1       
                Not High                        1 (6.7%)     1 (6.7%)       1 (6.7%)   
        2                                           1           1              1       
                Not High                        1 (6.7%)     1 (6.7%)       1 (6.7%)   
        Not High                                   13           13             13      
                Not High                        7 (46.7%)   12 (80.0%)     12 (80.0%)  
                1                               1 (6.7%)        0              0       
                2                               3 (20.0%)       0              0       
                3                               1 (6.7%)        0           1 (6.7%)   
                4                               1 (6.7%)     1 (6.7%)          0       
      \s\n
      Parameter: Immunoglobulin A Measurement
      
        ———————————————————————————————————————————————————————————————————————————————
        Baseline Toxicity Grade                 A: Drug X   B: Placebo   C: Combination
                Post-baseline NCI-CTCAE Grade    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————
        1                                           1           0              2       
                Not High                        1 (6.7%)        0          2 (13.3%)   
        3                                           1           0              0       
                Not High                        1 (6.7%)        0              0       
        4                                           1           0              0       
                Not High                        1 (6.7%)        0              0       
        Not High                                   12           15             13      
                Not High                        6 (40.0%)   10 (66.7%)     11 (73.3%)  
                1                               4 (26.7%)   2 (13.3%)          0       
                2                               1 (6.7%)     1 (6.7%)       1 (6.7%)   
                3                               1 (6.7%)     1 (6.7%)          0       
                4                                   0        1 (6.7%)       1 (6.7%)   

