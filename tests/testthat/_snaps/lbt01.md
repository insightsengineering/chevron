# lbt01 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 200))
    Output
      
      Parameter: Alanine Aminotransferase Measurement
      
        ———————————————————————————————————————————————————————————————————————————————————————
                                                          A: Drug X                B: Placebo  
                                                                 Change from                   
                                               Value at Visit      Baseline      Value at Visit
        Analysis Visit                             (N=15)           (N=15)           (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————————
        BASELINE                                                                               
          n                                          15                                15      
          Mean (SD)                             18.7 (12.5)                       16.8 (11.1)  
          Median                                    16.0                              17.5     
          Min - Max                                2 - 44                            1 - 32    
        WEEK 1 DAY 8                                                                           
          n                                          15               15               15      
          Mean (SD)                             16.3 (10.8)      -2.3 (17.6)       22.1 (7.5)  
          Median                                    14.7             -5.4             22.5     
          Min - Max                                0 - 36          -30 - 23         10 - 34    
        WEEK 2 DAY 15                                                                          
          n                                          15               15               15      
          Mean (SD)                             16.6 (10.5)      -2.0 (15.8)       20.8 (9.6)  
          Median                                    15.5             -6.4             18.5     
          Min - Max                                0 - 35          -30 - 33          2 - 43    
        WEEK 3 DAY 22                                                                          
          n                                          15               15               15      
          Mean (SD)                             17.5 (10.7)      -1.2 (15.8)       20.1 (8.1)  
          Median                                    14.2             1.4              21.9     
          Min - Max                                2 - 33          -40 - 19          3 - 34    
        WEEK 4 DAY 29                                                                          
          n                                          15               15               15      
          Mean (SD)                              16.8 (9.1)      -1.9 (15.5)       17.6 (9.9)  
          Median                                    12.8             3.1              17.7     
          Min - Max                                4 - 34          -33 - 19          2 - 34    
        WEEK 5 DAY 36                                                                          
          n                                          15               15               15      
          Mean (SD)                              17.9 (7.2)      -0.8 (15.5)       17.4 (7.1)  
          Median                                    18.7             1.1              17.8     
          Min - Max                                4 - 29          -40 - 17          5 - 31    
      \s\n
      Parameter: Alanine Aminotransferase Measurement
      
        ———————————————————————————————————————————————————————————————————————————————————————
                                                 B: Placebo             C: Combination         
                                                Change from                       Change from  
                                                  Baseline      Value at Visit      Baseline   
        Analysis Visit                             (N=15)           (N=15)           (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————————
        BASELINE                                                                               
          n                                                           15                       
          Mean (SD)                                               22.4 (9.5)                   
          Median                                                     25.3                      
          Min - Max                                                 1 - 37                     
        WEEK 1 DAY 8                                                                           
          n                                          15               15               15      
          Mean (SD)                              5.2 (16.4)       19.6 (9.9)      -2.8 (10.9)  
          Median                                    7.3              19.4             -1.0     
          Min - Max                               -17 - 32          1 - 36          -20 - 18   
        WEEK 2 DAY 15                                                                          
          n                                          15               15               15      
          Mean (SD)                              3.9 (14.1)       10.9 (7.7)      -11.5 (11.0) 
          Median                                    6.2              9.9              -8.7     
          Min - Max                               -25 - 30          0 - 25          -27 - 3    
        WEEK 3 DAY 22                                                                          
          n                                          15               15               15      
          Mean (SD)                              3.2 (16.3)       18.4 (9.5)      -4.0 (10.0)  
          Median                                    5.3              19.5             -7.2     
          Min - Max                               -23 - 31          3 - 32          -19 - 17   
        WEEK 4 DAY 29                                                                          
          n                                          15               15               15      
          Mean (SD)                              0.7 (13.2)      18.4 (11.6)      -4.0 (13.1)  
          Median                                    -3.1             18.5             -1.7     
          Min - Max                               -16 - 22          1 - 34          -30 - 17   
        WEEK 5 DAY 36                                                                          
          n                                          15               15               15      
          Mean (SD)                              0.6 (14.3)       15.2 (8.4)      -7.2 (10.5)  
          Median                                    2.1              16.4             -8.1     
          Min - Max                               -22 - 23          0 - 27          -27 - 16   
      \s\n
      Parameter: C-Reactive Protein Measurement
      
        ———————————————————————————————————————————————————————————————————————————————————————
                                                          A: Drug X                B: Placebo  
                                                                 Change from                   
                                               Value at Visit      Baseline      Value at Visit
        Analysis Visit                             (N=15)           (N=15)           (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————————
        BASELINE                                                                               
          n                                          15                                15      
          Mean (SD)                            9.032 (0.650)                     9.164 (0.900) 
          Median                                   8.819                             9.472     
          Min - Max                             7.81 - 9.93                       7.38 - 10.60 
        WEEK 1 DAY 8                                                                           
          n                                          15               15               15      
          Mean (SD)                            9.050 (1.222)    0.018 (1.242)    8.690 (0.990) 
          Median                                   8.960            -0.180           8.734     
          Min - Max                             6.87 - 11.33     -1.83 - 2.81     6.84 - 10.14 
        WEEK 2 DAY 15                                                                          
          n                                          15               15               15      
          Mean (SD)                            8.825 (0.990)    -0.207 (1.204)   9.371 (1.185) 
          Median                                   8.860            -0.567           9.073     
          Min - Max                             7.12 - 10.44     -2.12 - 2.05     8.06 - 12.73 
        WEEK 3 DAY 22                                                                          
          n                                          15               15               15      
          Mean (SD)                            9.134 (0.897)    0.102 (1.179)    9.288 (1.033) 
          Median                                   9.318            0.090            9.413     
          Min - Max                             7.38 - 11.00     -1.57 - 1.86     7.42 - 10.66 
        WEEK 4 DAY 29                                                                          
          n                                          15               15               15      
          Mean (SD)                            8.728 (0.959)    -0.303 (1.226)   8.971 (0.704) 
          Median                                   8.704            -0.046           8.879     
          Min - Max                             6.70 - 10.81     -3.17 - 1.99     7.88 - 10.23 
        WEEK 5 DAY 36                                                                          
          n                                          15               15               15      
          Mean (SD)                            8.545 (0.846)    -0.487 (1.060)   9.165 (1.182) 
          Median                                   8.601            -0.452           8.755     
          Min - Max                             7.10 - 10.03     -2.39 - 1.66     7.86 - 12.50 
      \s\n
      Parameter: C-Reactive Protein Measurement
      
        ———————————————————————————————————————————————————————————————————————————————————————
                                                 B: Placebo             C: Combination         
                                                Change from                       Change from  
                                                  Baseline      Value at Visit      Baseline   
        Analysis Visit                             (N=15)           (N=15)           (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————————
        BASELINE                                                                               
          n                                                           15                       
          Mean (SD)                                             8.652 (0.769)                  
          Median                                                    8.502                      
          Min - Max                                              7.73 - 10.86                  
        WEEK 1 DAY 8                                                                           
          n                                          15               15               15      
          Mean (SD)                            -0.474 (1.418)   9.507 (1.279)    0.854 (1.080) 
          Median                                   -0.074           9.830            1.107     
          Min - Max                             -3.14 - 1.55     7.27 - 11.09     -1.14 - 2.05 
        WEEK 2 DAY 15                                                                          
          n                                          15               15               15      
          Mean (SD)                            0.207 (1.572)    8.890 (1.021)    0.238 (1.263) 
          Median                                   0.293            8.994            0.462     
          Min - Max                             -2.35 - 3.19     6.68 - 10.84     -2.50 - 2.89 
        WEEK 3 DAY 22                                                                          
          n                                          15               15               15      
          Mean (SD)                            0.124 (1.135)    9.176 (0.919)    0.523 (1.209) 
          Median                                   -0.022           8.963            0.564     
          Min - Max                             -1.41 - 3.27     7.72 - 11.20     -2.25 - 3.26 
        WEEK 4 DAY 29                                                                          
          n                                          15               15               15      
          Mean (SD)                            -0.194 (1.077)   8.662 (0.712)    0.010 (1.039) 
          Median                                   -0.375           8.718            0.143     
          Min - Max                             -1.59 - 1.54     7.21 - 9.60      -2.63 - 1.68 
        WEEK 5 DAY 36                                                                          
          n                                          15               15               15      
          Mean (SD)                            0.000 (0.929)    8.654 (0.790)    0.002 (1.102) 
          Median                                   0.153            8.766            0.008     
          Min - Max                             -1.58 - 1.90     7.37 - 9.92      -3.14 - 1.67 
      \s\n
      Parameter: Immunoglobulin A Measurement
      
        ———————————————————————————————————————————————————————————————————————————————————————
                                                          A: Drug X                B: Placebo  
                                                                 Change from                   
                                               Value at Visit      Baseline      Value at Visit
        Analysis Visit                             (N=15)           (N=15)           (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————————
        BASELINE                                                                               
          n                                          15                                15      
          Mean (SD)                            2.923 (0.059)                     2.866 (0.083) 
          Median                                   2.911                             2.862     
          Min - Max                             2.80 - 3.01                       2.76 - 3.01  
        WEEK 1 DAY 8                                                                           
          n                                          15               15               15      
          Mean (SD)                            2.885 (0.060)    -0.038 (0.082)   2.938 (0.137) 
          Median                                   2.886            -0.010           2.972     
          Min - Max                             2.76 - 2.96      -0.18 - 0.06     2.69 - 3.16  
        WEEK 2 DAY 15                                                                          
          n                                          15               15               15      
          Mean (SD)                            2.889 (0.141)    -0.034 (0.171)   2.928 (0.075) 
          Median                                   2.871            -0.024           2.936     
          Min - Max                             2.67 - 3.16      -0.34 - 0.27     2.79 - 3.03  
        WEEK 3 DAY 22                                                                          
          n                                          15               15               15      
          Mean (SD)                            2.875 (0.105)    -0.048 (0.120)   2.919 (0.114) 
          Median                                   2.861            -0.046           2.938     
          Min - Max                             2.67 - 3.07      -0.25 - 0.16     2.73 - 3.18  
        WEEK 4 DAY 29                                                                          
          n                                          15               15               15      
          Mean (SD)                            2.912 (0.134)    -0.010 (0.140)   2.886 (0.097) 
          Median                                   2.942            0.023            2.924     
          Min - Max                             2.63 - 3.16      -0.39 - 0.19     2.58 - 2.96  
        WEEK 5 DAY 36                                                                          
          n                                          15               15               15      
          Mean (SD)                            2.933 (0.089)    0.010 (0.136)    2.899 (0.094) 
          Median                                   2.938            0.031            2.936     
          Min - Max                             2.78 - 3.08      -0.23 - 0.26     2.68 - 3.04  
      \s\n
      Parameter: Immunoglobulin A Measurement
      
        ———————————————————————————————————————————————————————————————————————————————————————
                                                 B: Placebo             C: Combination         
                                                Change from                       Change from  
                                                  Baseline      Value at Visit      Baseline   
        Analysis Visit                             (N=15)           (N=15)           (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————————
        BASELINE                                                                               
          n                                                           15                       
          Mean (SD)                                             2.887 (0.120)                  
          Median                                                    2.896                      
          Min - Max                                              2.65 - 3.14                   
        WEEK 1 DAY 8                                                                           
          n                                          15               15               15      
          Mean (SD)                            0.073 (0.152)    2.925 (0.091)    0.038 (0.128) 
          Median                                   0.109            2.931            0.021     
          Min - Max                             -0.27 - 0.27     2.78 - 3.10      -0.12 - 0.28 
        WEEK 2 DAY 15                                                                          
          n                                          15               15               15      
          Mean (SD)                            0.063 (0.124)    2.913 (0.080)    0.026 (0.156) 
          Median                                   0.084            2.910            0.067     
          Min - Max                             -0.12 - 0.26     2.78 - 3.09      -0.28 - 0.26 
        WEEK 3 DAY 22                                                                          
          n                                          15               15               15      
          Mean (SD)                            0.053 (0.151)    2.889 (0.082)    0.002 (0.128) 
          Median                                   0.045            2.899            0.020     
          Min - Max                             -0.19 - 0.33     2.75 - 3.02      -0.24 - 0.14 
        WEEK 4 DAY 29                                                                          
          n                                          15               15               15      
          Mean (SD)                            0.020 (0.136)    2.869 (0.104)    -0.019 (0.141)
          Median                                   -0.012           2.840            -0.055    
          Min - Max                             -0.28 - 0.20     2.74 - 3.08      -0.31 - 0.22 
        WEEK 5 DAY 36                                                                          
          n                                          15               15               15      
          Mean (SD)                            0.034 (0.131)    2.902 (0.091)    0.015 (0.168) 
          Median                                   0.059            2.921            0.026     
          Min - Max                             -0.25 - 0.19     2.78 - 3.13      -0.27 - 0.32 

# lbt01 functions with row_split_var return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 200))
    Output
      
      Category for Lab Test: CHEMISTRY
      Parameter: Alanine Aminotransferase Measurement
      
        —————————————————————————————————————————————————————————————————————————————————————————
                                                            A: Drug X                B: Placebo  
                                                                   Change from                   
                                                 Value at Visit      Baseline      Value at Visit
        Analysis Visit                               (N=15)           (N=15)           (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————
        BASELINE                                                                                 
          n                                            15                                15      
          Mean (SD)                               18.7 (12.5)                       16.8 (11.1)  
          Median                                      16.0                              17.5     
          Min - Max                                  2 - 44                            1 - 32    
        WEEK 1 DAY 8                                                                             
          n                                            15               15               15      
          Mean (SD)                               16.3 (10.8)      -2.3 (17.6)       22.1 (7.5)  
          Median                                      14.7             -5.4             22.5     
          Min - Max                                  0 - 36          -30 - 23         10 - 34    
        WEEK 2 DAY 15                                                                            
          n                                            15               15               15      
          Mean (SD)                               16.6 (10.5)      -2.0 (15.8)       20.8 (9.6)  
          Median                                      15.5             -6.4             18.5     
          Min - Max                                  0 - 35          -30 - 33          2 - 43    
        WEEK 3 DAY 22                                                                            
          n                                            15               15               15      
          Mean (SD)                               17.5 (10.7)      -1.2 (15.8)       20.1 (8.1)  
          Median                                      14.2             1.4              21.9     
          Min - Max                                  2 - 33          -40 - 19          3 - 34    
        WEEK 4 DAY 29                                                                            
          n                                            15               15               15      
          Mean (SD)                                16.8 (9.1)      -1.9 (15.5)       17.6 (9.9)  
          Median                                      12.8             3.1              17.7     
          Min - Max                                  4 - 34          -33 - 19          2 - 34    
        WEEK 5 DAY 36                                                                            
          n                                            15               15               15      
          Mean (SD)                                17.9 (7.2)      -0.8 (15.5)       17.4 (7.1)  
          Median                                      18.7             1.1              17.8     
          Min - Max                                  4 - 29          -40 - 17          5 - 31    
      \s\n
      Category for Lab Test: CHEMISTRY
      Parameter: Alanine Aminotransferase Measurement
      
        —————————————————————————————————————————————————————————————————————————————————————————
                                                   B: Placebo             C: Combination         
                                                  Change from                       Change from  
                                                    Baseline      Value at Visit      Baseline   
        Analysis Visit                               (N=15)           (N=15)           (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————
        BASELINE                                                                                 
          n                                                             15                       
          Mean (SD)                                                 22.4 (9.5)                   
          Median                                                       25.3                      
          Min - Max                                                   1 - 37                     
        WEEK 1 DAY 8                                                                             
          n                                            15               15               15      
          Mean (SD)                                5.2 (16.4)       19.6 (9.9)      -2.8 (10.9)  
          Median                                      7.3              19.4             -1.0     
          Min - Max                                 -17 - 32          1 - 36          -20 - 18   
        WEEK 2 DAY 15                                                                            
          n                                            15               15               15      
          Mean (SD)                                3.9 (14.1)       10.9 (7.7)      -11.5 (11.0) 
          Median                                      6.2              9.9              -8.7     
          Min - Max                                 -25 - 30          0 - 25          -27 - 3    
        WEEK 3 DAY 22                                                                            
          n                                            15               15               15      
          Mean (SD)                                3.2 (16.3)       18.4 (9.5)      -4.0 (10.0)  
          Median                                      5.3              19.5             -7.2     
          Min - Max                                 -23 - 31          3 - 32          -19 - 17   
        WEEK 4 DAY 29                                                                            
          n                                            15               15               15      
          Mean (SD)                                0.7 (13.2)      18.4 (11.6)      -4.0 (13.1)  
          Median                                      -3.1             18.5             -1.7     
          Min - Max                                 -16 - 22          1 - 34          -30 - 17   
        WEEK 5 DAY 36                                                                            
          n                                            15               15               15      
          Mean (SD)                                0.6 (14.3)       15.2 (8.4)      -7.2 (10.5)  
          Median                                      2.1              16.4             -8.1     
          Min - Max                                 -22 - 23          0 - 27          -27 - 16   
      \s\n
      Category for Lab Test: CHEMISTRY
      Parameter: C-Reactive Protein Measurement
      
        —————————————————————————————————————————————————————————————————————————————————————————
                                                            A: Drug X                B: Placebo  
                                                                   Change from                   
                                                 Value at Visit      Baseline      Value at Visit
        Analysis Visit                               (N=15)           (N=15)           (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————
        BASELINE                                                                                 
          n                                            15                                15      
          Mean (SD)                              9.032 (0.650)                     9.164 (0.900) 
          Median                                     8.819                             9.472     
          Min - Max                               7.81 - 9.93                       7.38 - 10.60 
        WEEK 1 DAY 8                                                                             
          n                                            15               15               15      
          Mean (SD)                              9.050 (1.222)    0.018 (1.242)    8.690 (0.990) 
          Median                                     8.960            -0.180           8.734     
          Min - Max                               6.87 - 11.33     -1.83 - 2.81     6.84 - 10.14 
        WEEK 2 DAY 15                                                                            
          n                                            15               15               15      
          Mean (SD)                              8.825 (0.990)    -0.207 (1.204)   9.371 (1.185) 
          Median                                     8.860            -0.567           9.073     
          Min - Max                               7.12 - 10.44     -2.12 - 2.05     8.06 - 12.73 
        WEEK 3 DAY 22                                                                            
          n                                            15               15               15      
          Mean (SD)                              9.134 (0.897)    0.102 (1.179)    9.288 (1.033) 
          Median                                     9.318            0.090            9.413     
          Min - Max                               7.38 - 11.00     -1.57 - 1.86     7.42 - 10.66 
        WEEK 4 DAY 29                                                                            
          n                                            15               15               15      
          Mean (SD)                              8.728 (0.959)    -0.303 (1.226)   8.971 (0.704) 
          Median                                     8.704            -0.046           8.879     
          Min - Max                               6.70 - 10.81     -3.17 - 1.99     7.88 - 10.23 
        WEEK 5 DAY 36                                                                            
          n                                            15               15               15      
          Mean (SD)                              8.545 (0.846)    -0.487 (1.060)   9.165 (1.182) 
          Median                                     8.601            -0.452           8.755     
          Min - Max                               7.10 - 10.03     -2.39 - 1.66     7.86 - 12.50 
      \s\n
      Category for Lab Test: CHEMISTRY
      Parameter: C-Reactive Protein Measurement
      
        —————————————————————————————————————————————————————————————————————————————————————————
                                                   B: Placebo             C: Combination         
                                                  Change from                       Change from  
                                                    Baseline      Value at Visit      Baseline   
        Analysis Visit                               (N=15)           (N=15)           (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————
        BASELINE                                                                                 
          n                                                             15                       
          Mean (SD)                                               8.652 (0.769)                  
          Median                                                      8.502                      
          Min - Max                                                7.73 - 10.86                  
        WEEK 1 DAY 8                                                                             
          n                                            15               15               15      
          Mean (SD)                              -0.474 (1.418)   9.507 (1.279)    0.854 (1.080) 
          Median                                     -0.074           9.830            1.107     
          Min - Max                               -3.14 - 1.55     7.27 - 11.09     -1.14 - 2.05 
        WEEK 2 DAY 15                                                                            
          n                                            15               15               15      
          Mean (SD)                              0.207 (1.572)    8.890 (1.021)    0.238 (1.263) 
          Median                                     0.293            8.994            0.462     
          Min - Max                               -2.35 - 3.19     6.68 - 10.84     -2.50 - 2.89 
        WEEK 3 DAY 22                                                                            
          n                                            15               15               15      
          Mean (SD)                              0.124 (1.135)    9.176 (0.919)    0.523 (1.209) 
          Median                                     -0.022           8.963            0.564     
          Min - Max                               -1.41 - 3.27     7.72 - 11.20     -2.25 - 3.26 
        WEEK 4 DAY 29                                                                            
          n                                            15               15               15      
          Mean (SD)                              -0.194 (1.077)   8.662 (0.712)    0.010 (1.039) 
          Median                                     -0.375           8.718            0.143     
          Min - Max                               -1.59 - 1.54     7.21 - 9.60      -2.63 - 1.68 
        WEEK 5 DAY 36                                                                            
          n                                            15               15               15      
          Mean (SD)                              0.000 (0.929)    8.654 (0.790)    0.002 (1.102) 
          Median                                     0.153            8.766            0.008     
          Min - Max                               -1.58 - 1.90     7.37 - 9.92      -3.14 - 1.67 
      \s\n
      Category for Lab Test: IMMUNOLOGY
      Parameter: Immunoglobulin A Measurement
      
        —————————————————————————————————————————————————————————————————————————————————————————
                                                            A: Drug X                B: Placebo  
                                                                   Change from                   
                                                 Value at Visit      Baseline      Value at Visit
        Analysis Visit                               (N=15)           (N=15)           (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————
        BASELINE                                                                                 
          n                                            15                                15      
          Mean (SD)                              2.923 (0.059)                     2.866 (0.083) 
          Median                                     2.911                             2.862     
          Min - Max                               2.80 - 3.01                       2.76 - 3.01  
        WEEK 1 DAY 8                                                                             
          n                                            15               15               15      
          Mean (SD)                              2.885 (0.060)    -0.038 (0.082)   2.938 (0.137) 
          Median                                     2.886            -0.010           2.972     
          Min - Max                               2.76 - 2.96      -0.18 - 0.06     2.69 - 3.16  
        WEEK 2 DAY 15                                                                            
          n                                            15               15               15      
          Mean (SD)                              2.889 (0.141)    -0.034 (0.171)   2.928 (0.075) 
          Median                                     2.871            -0.024           2.936     
          Min - Max                               2.67 - 3.16      -0.34 - 0.27     2.79 - 3.03  
        WEEK 3 DAY 22                                                                            
          n                                            15               15               15      
          Mean (SD)                              2.875 (0.105)    -0.048 (0.120)   2.919 (0.114) 
          Median                                     2.861            -0.046           2.938     
          Min - Max                               2.67 - 3.07      -0.25 - 0.16     2.73 - 3.18  
        WEEK 4 DAY 29                                                                            
          n                                            15               15               15      
          Mean (SD)                              2.912 (0.134)    -0.010 (0.140)   2.886 (0.097) 
          Median                                     2.942            0.023            2.924     
          Min - Max                               2.63 - 3.16      -0.39 - 0.19     2.58 - 2.96  
        WEEK 5 DAY 36                                                                            
          n                                            15               15               15      
          Mean (SD)                              2.933 (0.089)    0.010 (0.136)    2.899 (0.094) 
          Median                                     2.938            0.031            2.936     
          Min - Max                               2.78 - 3.08      -0.23 - 0.26     2.68 - 3.04  
      \s\n
      Category for Lab Test: IMMUNOLOGY
      Parameter: Immunoglobulin A Measurement
      
        —————————————————————————————————————————————————————————————————————————————————————————
                                                   B: Placebo             C: Combination         
                                                  Change from                       Change from  
                                                    Baseline      Value at Visit      Baseline   
        Analysis Visit                               (N=15)           (N=15)           (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————
        BASELINE                                                                                 
          n                                                             15                       
          Mean (SD)                                               2.887 (0.120)                  
          Median                                                      2.896                      
          Min - Max                                                2.65 - 3.14                   
        WEEK 1 DAY 8                                                                             
          n                                            15               15               15      
          Mean (SD)                              0.073 (0.152)    2.925 (0.091)    0.038 (0.128) 
          Median                                     0.109            2.931            0.021     
          Min - Max                               -0.27 - 0.27     2.78 - 3.10      -0.12 - 0.28 
        WEEK 2 DAY 15                                                                            
          n                                            15               15               15      
          Mean (SD)                              0.063 (0.124)    2.913 (0.080)    0.026 (0.156) 
          Median                                     0.084            2.910            0.067     
          Min - Max                               -0.12 - 0.26     2.78 - 3.09      -0.28 - 0.26 
        WEEK 3 DAY 22                                                                            
          n                                            15               15               15      
          Mean (SD)                              0.053 (0.151)    2.889 (0.082)    0.002 (0.128) 
          Median                                     0.045            2.899            0.020     
          Min - Max                               -0.19 - 0.33     2.75 - 3.02      -0.24 - 0.14 
        WEEK 4 DAY 29                                                                            
          n                                            15               15               15      
          Mean (SD)                              0.020 (0.136)    2.869 (0.104)    -0.019 (0.141)
          Median                                     -0.012           2.840            -0.055    
          Min - Max                               -0.28 - 0.20     2.74 - 3.08      -0.31 - 0.22 
        WEEK 5 DAY 36                                                                            
          n                                            15               15               15      
          Mean (SD)                              0.034 (0.131)    2.902 (0.091)    0.015 (0.168) 
          Median                                     0.059            2.921            0.026     
          Min - Max                               -0.25 - 0.19     2.78 - 3.13      -0.27 - 0.32 

# lbt01 can handle n = 0 and outputs NE instead of infs and NAs

    Code
      cat(export_as_txt(res, lpp = 200))
    Output
      
      Parameter: Alanine Aminotransferase Measurement
      
        —————————————————————————————————————————————————————————————————————————————————————————————————————
                                                         A: Drug X                       B: Placebo          
                                                                Change from                      Change from 
                                               Value at Visit     Baseline     Value at Visit     Baseline   
        Analysis Visit                             (N=15)          (N=15)          (N=15)          (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————————————————
        BASELINE                                                                                             
          n                                          0                               15                      
          Mean (SD)                               NE (NE)                       16.8 (11.1)                  
          Median                                     NE                             17.5                     
          Min - Max                               NE - NE                          1 - 32                    
        WEEK 1 DAY 8                                                                                         
          n                                          0               0               15              15      
          Mean (SD)                               NE (NE)         NE (NE)        22.1 (7.5)      5.2 (16.4)  
          Median                                     NE              NE             22.5             7.3     
          Min - Max                               NE - NE         NE - NE         10 - 34         -17 - 32   
        WEEK 2 DAY 15                                                                                        
          n                                          0               0               15              15      
          Mean (SD)                               NE (NE)         NE (NE)        20.8 (9.6)      3.9 (14.1)  
          Median                                     NE              NE             18.5             6.2     
          Min - Max                               NE - NE         NE - NE          2 - 43         -25 - 30   
        WEEK 3 DAY 22                                                                                        
          n                                          0               0               15              15      
          Mean (SD)                               NE (NE)         NE (NE)        20.1 (8.1)      3.2 (16.3)  
          Median                                     NE              NE             21.9             5.3     
          Min - Max                               NE - NE         NE - NE          3 - 34         -23 - 31   
        WEEK 4 DAY 29                                                                                        
          n                                          0               0               15              15      
          Mean (SD)                               NE (NE)         NE (NE)        17.6 (9.9)      0.7 (13.2)  
          Median                                     NE              NE             17.7            -3.1     
          Min - Max                               NE - NE         NE - NE          2 - 34         -16 - 22   
        WEEK 5 DAY 36                                                                                        
          n                                          0               0               15              15      
          Mean (SD)                               NE (NE)         NE (NE)        17.4 (7.1)      0.6 (14.3)  
          Median                                     NE              NE             17.8             2.1     
          Min - Max                               NE - NE         NE - NE          5 - 31         -22 - 23   
      \s\n
      Parameter: Alanine Aminotransferase Measurement
      
        ——————————————————————————————————————————————————————————————————————
                                                       C: Combination         
                                                                 Change from  
                                               Value at Visit      Baseline   
        Analysis Visit                             (N=15)           (N=15)    
        ——————————————————————————————————————————————————————————————————————
        BASELINE                                                              
          n                                          15                       
          Mean (SD)                              22.4 (9.5)                   
          Median                                    25.3                      
          Min - Max                                1 - 37                     
        WEEK 1 DAY 8                                                          
          n                                          15               15      
          Mean (SD)                              19.6 (9.9)      -2.8 (10.9)  
          Median                                    19.4             -1.0     
          Min - Max                                1 - 36          -20 - 18   
        WEEK 2 DAY 15                                                         
          n                                          15               15      
          Mean (SD)                              10.9 (7.7)      -11.5 (11.0) 
          Median                                    9.9              -8.7     
          Min - Max                                0 - 25          -27 - 3    
        WEEK 3 DAY 22                                                         
          n                                          15               15      
          Mean (SD)                              18.4 (9.5)      -4.0 (10.0)  
          Median                                    19.5             -7.2     
          Min - Max                                3 - 32          -19 - 17   
        WEEK 4 DAY 29                                                         
          n                                          15               15      
          Mean (SD)                             18.4 (11.6)      -4.0 (13.1)  
          Median                                    18.5             -1.7     
          Min - Max                                1 - 34          -30 - 17   
        WEEK 5 DAY 36                                                         
          n                                          15               15      
          Mean (SD)                              15.2 (8.4)      -7.2 (10.5)  
          Median                                    16.4             -8.1     
          Min - Max                                0 - 27          -27 - 16   
      \s\n
      Parameter: C-Reactive Protein Measurement
      
        —————————————————————————————————————————————————————————————————————————————————————————————————————
                                                         A: Drug X                       B: Placebo          
                                                                Change from                      Change from 
                                               Value at Visit     Baseline     Value at Visit     Baseline   
        Analysis Visit                             (N=15)          (N=15)          (N=15)          (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————————————————
        BASELINE                                                                                             
          n                                          0                               15                      
          Mean (SD)                               NE (NE)                       9.16 (0.90)                  
          Median                                     NE                             9.47                     
          Min - Max                               NE - NE                        7.4 - 10.6                  
        WEEK 1 DAY 8                                                                                         
          n                                          0               0               15              15      
          Mean (SD)                               NE (NE)         NE (NE)       8.69 (0.99)     -0.47 (1.42) 
          Median                                     NE              NE             8.73            -0.07    
          Min - Max                               NE - NE         NE - NE        6.8 - 10.1      -3.1 - 1.6  
        WEEK 2 DAY 15                                                                                        
          n                                          0               0               15              15      
          Mean (SD)                               NE (NE)         NE (NE)       9.37 (1.18)      0.21 (1.57) 
          Median                                     NE              NE             9.07            0.29     
          Min - Max                               NE - NE         NE - NE        8.1 - 12.7      -2.3 - 3.2  
        WEEK 3 DAY 22                                                                                        
          n                                          0               0               15              15      
          Mean (SD)                               NE (NE)         NE (NE)       9.29 (1.03)      0.12 (1.13) 
          Median                                     NE              NE             9.41            -0.02    
          Min - Max                               NE - NE         NE - NE        7.4 - 10.7      -1.4 - 3.3  
        WEEK 4 DAY 29                                                                                        
          n                                          0               0               15              15      
          Mean (SD)                               NE (NE)         NE (NE)       8.97 (0.70)     -0.19 (1.08) 
          Median                                     NE              NE             8.88            -0.37    
          Min - Max                               NE - NE         NE - NE        7.9 - 10.2      -1.6 - 1.5  
        WEEK 5 DAY 36                                                                                        
          n                                          0               0               15              15      
          Mean (SD)                               NE (NE)         NE (NE)       9.16 (1.18)      0.00 (0.93) 
          Median                                     NE              NE             8.75            0.15     
          Min - Max                               NE - NE         NE - NE        7.9 - 12.5      -1.6 - 1.9  
      \s\n
      Parameter: C-Reactive Protein Measurement
      
        ——————————————————————————————————————————————————————————————————————
                                                       C: Combination         
                                                                 Change from  
                                               Value at Visit      Baseline   
        Analysis Visit                             (N=15)           (N=15)    
        ——————————————————————————————————————————————————————————————————————
        BASELINE                                                              
          n                                          15                       
          Mean (SD)                             8.65 (0.77)                   
          Median                                    8.50                      
          Min - Max                              7.7 - 10.9                   
        WEEK 1 DAY 8                                                          
          n                                          15               15      
          Mean (SD)                             9.51 (1.28)      0.85 (1.08)  
          Median                                    9.83             1.11     
          Min - Max                              7.3 - 11.1       -1.1 - 2.1  
        WEEK 2 DAY 15                                                         
          n                                          15               15      
          Mean (SD)                             8.89 (1.02)      0.24 (1.26)  
          Median                                    8.99             0.46     
          Min - Max                              6.7 - 10.8       -2.5 - 2.9  
        WEEK 3 DAY 22                                                         
          n                                          15               15      
          Mean (SD)                             9.18 (0.92)      0.52 (1.21)  
          Median                                    8.96             0.56     
          Min - Max                              7.7 - 11.2       -2.3 - 3.3  
        WEEK 4 DAY 29                                                         
          n                                          15               15      
          Mean (SD)                             8.66 (0.71)      0.01 (1.04)  
          Median                                    8.72             0.14     
          Min - Max                              7.2 - 9.6        -2.6 - 1.7  
        WEEK 5 DAY 36                                                         
          n                                          15               15      
          Mean (SD)                             8.65 (0.79)      0.00 (1.10)  
          Median                                    8.77             0.01     
          Min - Max                              7.4 - 9.9        -3.1 - 1.7  
      \s\n
      Parameter: Immunoglobulin A Measurement
      
        —————————————————————————————————————————————————————————————————————————————————————————————————————
                                                         A: Drug X                       B: Placebo          
                                                                Change from                      Change from 
                                               Value at Visit     Baseline     Value at Visit     Baseline   
        Analysis Visit                             (N=15)          (N=15)          (N=15)          (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————————————————
        BASELINE                                                                                             
          n                                          0                               15                      
          Mean (SD)                               NE (NE)                      2.866 (0.083)                 
          Median                                     NE                            2.862                     
          Min - Max                               NE - NE                       2.76 - 3.01                  
        WEEK 1 DAY 8                                                                                         
          n                                          0               0               15              15      
          Mean (SD)                               NE (NE)         NE (NE)      2.938 (0.137)    0.073 (0.152)
          Median                                     NE              NE            2.972            0.109    
          Min - Max                               NE - NE         NE - NE       2.69 - 3.16     -0.27 - 0.27 
        WEEK 2 DAY 15                                                                                        
          n                                          0               0               15              15      
          Mean (SD)                               NE (NE)         NE (NE)      2.928 (0.075)    0.063 (0.124)
          Median                                     NE              NE            2.936            0.084    
          Min - Max                               NE - NE         NE - NE       2.79 - 3.03     -0.12 - 0.26 
        WEEK 3 DAY 22                                                                                        
          n                                          0               0               15              15      
          Mean (SD)                               NE (NE)         NE (NE)      2.919 (0.114)    0.053 (0.151)
          Median                                     NE              NE            2.938            0.045    
          Min - Max                               NE - NE         NE - NE       2.73 - 3.18     -0.19 - 0.33 
        WEEK 4 DAY 29                                                                                        
          n                                          0               0               15              15      
          Mean (SD)                               NE (NE)         NE (NE)      2.886 (0.097)    0.020 (0.136)
          Median                                     NE              NE            2.924           -0.012    
          Min - Max                               NE - NE         NE - NE       2.58 - 2.96     -0.28 - 0.20 
        WEEK 5 DAY 36                                                                                        
          n                                          0               0               15              15      
          Mean (SD)                               NE (NE)         NE (NE)      2.899 (0.094)    0.034 (0.131)
          Median                                     NE              NE            2.936            0.059    
          Min - Max                               NE - NE         NE - NE       2.68 - 3.04     -0.25 - 0.19 
      \s\n
      Parameter: Immunoglobulin A Measurement
      
        ——————————————————————————————————————————————————————————————————————
                                                       C: Combination         
                                                                 Change from  
                                               Value at Visit      Baseline   
        Analysis Visit                             (N=15)           (N=15)    
        ——————————————————————————————————————————————————————————————————————
        BASELINE                                                              
          n                                          15                       
          Mean (SD)                            2.887 (0.120)                  
          Median                                   2.896                      
          Min - Max                             2.65 - 3.14                   
        WEEK 1 DAY 8                                                          
          n                                          15               15      
          Mean (SD)                            2.925 (0.091)    0.038 (0.128) 
          Median                                   2.931            0.021     
          Min - Max                             2.78 - 3.10      -0.12 - 0.28 
        WEEK 2 DAY 15                                                         
          n                                          15               15      
          Mean (SD)                            2.913 (0.080)    0.026 (0.156) 
          Median                                   2.910            0.067     
          Min - Max                             2.78 - 3.09      -0.28 - 0.26 
        WEEK 3 DAY 22                                                         
          n                                          15               15      
          Mean (SD)                            2.889 (0.082)    0.002 (0.128) 
          Median                                   2.899            0.020     
          Min - Max                             2.75 - 3.02      -0.24 - 0.14 
        WEEK 4 DAY 29                                                         
          n                                          15               15      
          Mean (SD)                            2.869 (0.104)    -0.019 (0.141)
          Median                                   2.840            -0.055    
          Min - Max                             2.74 - 3.08      -0.31 - 0.22 
        WEEK 5 DAY 36                                                         
          n                                          15               15      
          Mean (SD)                            2.902 (0.091)    0.015 (0.168) 
          Median                                   2.921            0.026     
          Min - Max                             2.78 - 3.13      -0.27 - 0.32 

