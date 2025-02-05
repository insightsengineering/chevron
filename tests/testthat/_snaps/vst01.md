# vst01 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 200))
    Output
      
      Parameter: Diastolic Blood Pressure
      
        ————————————————————————————————————————————————————————————————————————————————————————
                                             A: Drug X                      B: Placebo          
                                                    Change from                     Change from 
                                   Value at Visit     Baseline     Value at Visit     Baseline  
        Analysis Visit                 (N=15)          (N=15)          (N=15)          (N=15)   
        ————————————————————————————————————————————————————————————————————————————————————————
        SCREENING                                                                               
          n                              15              0               15              0      
          Mean (SD)                 94.4 (17.1)       NE (NE)       106.4 (20.6)      NE (NE)   
          Median                        94.9             NE            111.1             NE     
          Min - Max                   56 - 122        NE - NE         60 - 132        NE - NE   
        BASELINE                                                                                
          n                              15                              15                     
          Mean (SD)                 96.1 (22.5)                     108.1 (15.1)                
          Median                        93.3                           109.0                    
          Min - Max                   61 - 137                        83 - 132                  
        WEEK 1 DAY 8                                                                            
          n                              15              15              15              15     
          Mean (SD)                 99.0 (21.4)      2.8 (28.1)     104.1 (16.2)    -4.0 (21.9) 
          Median                        92.4            -4.1           107.7            3.2     
          Min - Max                   68 - 130        -33 - 48        71 - 133        -53 - 29  
        WEEK 2 DAY 15                                                                           
          n                              15              15              15              15     
          Mean (SD)                 99.8 (14.5)      3.6 (21.2)     97.5 (17.3)     -10.6 (20.8)
          Median                       101.5            1.7             99.5            -9.7    
          Min - Max                   72 - 123        -40 - 48        54 - 126        -55 - 25  
        WEEK 3 DAY 22                                                                           
          n                              15              15              15              15     
          Mean (SD)                 99.1 (26.1)      3.0 (34.3)     92.0 (16.9)     -16.1 (21.9)
          Median                       101.1            -0.3            91.2           -14.4    
          Min - Max                   48 - 162        -48 - 77        68 - 120        -53 - 23  
        WEEK 4 DAY 29                                                                           
          n                              15              15              15              15     
          Mean (SD)                 103.4 (22.3)     7.3 (30.7)     96.5 (19.5)     -11.6 (25.9)
          Median                        98.2            2.5             97.4           -16.8    
          Min - Max                   63 - 148        -38 - 62        63 - 132        -57 - 48  
        WEEK 5 DAY 36                                                                           
          n                              15              15              15              15     
          Mean (SD)                 93.2 (18.5)     -2.9 (28.9)     97.9 (20.7)     -10.2 (27.6)
          Median                        90.8            -3.4            99.0           -11.3    
          Min - Max                   64 - 139        -49 - 47        69 - 138        -54 - 38  
      \s\n
      Parameter: Diastolic Blood Pressure
      
        ————————————————————————————————————————————————————————
                                          C: Combination        
                                                    Change from 
                                   Value at Visit     Baseline  
        Analysis Visit                 (N=15)          (N=15)   
        ————————————————————————————————————————————————————————
        SCREENING                                               
          n                              15              0      
          Mean (SD)                 106.5 (12.6)      NE (NE)   
          Median                       108.4             NE     
          Min - Max                   83 - 127        NE - NE   
        BASELINE                                                
          n                              15                     
          Mean (SD)                 103.1 (19.8)                
          Median                       102.8                    
          Min - Max                   66 - 137                  
        WEEK 1 DAY 8                                            
          n                              15              15     
          Mean (SD)                 100.8 (19.0)    -2.3 (25.0) 
          Median                       103.1            -2.5    
          Min - Max                   70 - 129        -55 - 42  
        WEEK 2 DAY 15                                           
          n                              15              15     
          Mean (SD)                 94.3 (17.0)     -8.9 (27.2) 
          Median                        96.8           -10.2    
          Min - Max                   63 - 117        -73 - 47  
        WEEK 3 DAY 22                                           
          n                              15              15     
          Mean (SD)                 94.6 (13.6)     -8.6 (21.7) 
          Median                        98.4           -16.1    
          Min - Max                   74 - 115        -38 - 33  
        WEEK 4 DAY 29                                           
          n                              15              15     
          Mean (SD)                 108.3 (18.4)     5.2 (21.9) 
          Median                       107.6            8.0     
          Min - Max                   69 - 133        -34 - 42  
        WEEK 5 DAY 36                                           
          n                              15              15     
          Mean (SD)                 95.3 (16.4)     -7.8 (19.8) 
          Median                        93.9            -4.7    
          Min - Max                   72 - 139        -44 - 29  
      \s\n
      Parameter: Systolic Blood Pressure
      
        ————————————————————————————————————————————————————————————————————————————————————————
                                             A: Drug X                      B: Placebo          
                                                    Change from                     Change from 
                                   Value at Visit     Baseline     Value at Visit     Baseline  
        Analysis Visit                 (N=15)          (N=15)          (N=15)          (N=15)   
        ————————————————————————————————————————————————————————————————————————————————————————
        SCREENING                                                                               
          n                              15              0               15              0      
          Mean (SD)                 154.1 (33.5)      NE (NE)       157.8 (34.4)      NE (NE)   
          Median                       156.2             NE            161.7             NE     
          Min - Max                   78 - 211        NE - NE         80 - 210        NE - NE   
        BASELINE                                                                                
          n                              15                              15                     
          Mean (SD)                 145.9 (28.2)                    152.0 (28.7)                
          Median                       142.7                           157.7                    
          Min - Max                   85 - 196                        99 - 195                  
        WEEK 1 DAY 8                                                                            
          n                              15              15              15              15     
          Mean (SD)                 156.5 (21.1)    10.6 (34.6)     147.5 (33.5)    -4.5 (48.9) 
          Median                       160.7            5.8            155.0            2.8     
          Min - Max                  127 - 186        -53 - 92        85 - 190        -77 - 91  
        WEEK 2 DAY 15                                                                           
          n                              15              15              15              15     
          Mean (SD)                 144.2 (33.7)    -1.7 (27.1)     136.9 (30.2)    -15.1 (37.8)
          Median                       144.3            5.3            142.7           -14.1    
          Min - Max                   63 - 204        -54 - 44        70 - 174        -83 - 62  
        WEEK 3 DAY 22                                                                           
          n                              15              15              15              15     
          Mean (SD)                 154.9 (35.4)     9.0 (38.5)     149.8 (28.9)    -2.2 (44.8) 
          Median                       158.9            17.2           155.0            -1.8    
          Min - Max                  112 - 219        -47 - 96        84 - 193       -110 - 94  
        WEEK 4 DAY 29                                                                           
          n                              15              15              15              15     
          Mean (SD)                 150.2 (32.2)     4.2 (33.0)     156.0 (22.9)     4.0 (42.5) 
          Median                       145.5            3.8            149.1           -10.0    
          Min - Max                   69 - 210        -89 - 54       114 - 195        -71 - 78  
        WEEK 5 DAY 36                                                                           
          n                              15              15              15              15     
          Mean (SD)                 156.0 (30.9)    10.0 (42.3)     156.4 (35.3)     4.4 (51.8) 
          Median                       158.1            1.4            164.6            7.1     
          Min - Max                  111 - 212        -54 - 90        63 - 199       -131 - 87  
      \s\n
      Parameter: Systolic Blood Pressure
      
        ————————————————————————————————————————————————————————
                                          C: Combination        
                                                    Change from 
                                   Value at Visit     Baseline  
        Analysis Visit                 (N=15)          (N=15)   
        ————————————————————————————————————————————————————————
        SCREENING                                               
          n                              15              0      
          Mean (SD)                 152.4 (22.3)      NE (NE)   
          Median                       149.6             NE     
          Min - Max                  108 - 185        NE - NE   
        BASELINE                                                
          n                              15                     
          Mean (SD)                 154.2 (26.3)                
          Median                       155.3                    
          Min - Max                   87 - 193                  
        WEEK 1 DAY 8                                            
          n                              15              15     
          Mean (SD)                 143.3 (30.8)    -10.9 (34.6)
          Median                       145.5            -5.6    
          Min - Max                   90 - 192        -66 - 49  
        WEEK 2 DAY 15                                           
          n                              15              15     
          Mean (SD)                 148.6 (27.1)    -5.6 (44.7) 
          Median                       147.1           -11.5    
          Min - Max                  109 - 200       -70 - 114  
        WEEK 3 DAY 22                                           
          n                              15              15     
          Mean (SD)                 150.5 (21.4)    -3.7 (38.0) 
          Median                       156.5            -7.6    
          Min - Max                   95 - 180        -75 - 73  
        WEEK 4 DAY 29                                           
          n                              15              15     
          Mean (SD)                 145.7 (23.0)    -8.5 (33.2) 
          Median                       150.8           -14.4    
          Min - Max                  107 - 188        -42 - 65  
        WEEK 5 DAY 36                                           
          n                              15              15     
          Mean (SD)                 143.6 (33.2)    -10.6 (44.8)
          Median                       148.5            -2.4    
          Min - Max                   92 - 191        -79 - 64  

# run vst01 works as expected

    Code
      cat(export_as_txt(res, lpp = 200))
    Output
      
      Parameter: Diastolic Blood Pressure
      
        ————————————————————————————————————————————————————————————————————————————————————————
                                             A: Drug X                      B: Placebo          
                                                    Change from                     Change from 
                                   Value at Visit     Baseline     Value at Visit     Baseline  
        Analysis Visit                 (N=15)          (N=15)          (N=15)          (N=15)   
        ————————————————————————————————————————————————————————————————————————————————————————
        SCREENING                                                                               
          n                              15              0               15              0      
          Mean (SD)                 94.4 (17.1)       NE (NE)       106.4 (20.6)      NE (NE)   
          Median                        94.9             NE            111.1             NE     
          Min - Max                   56 - 122        NE - NE         60 - 132        NE - NE   
        BASELINE                                                                                
          n                              15                              15                     
          Mean (SD)                 96.1 (22.5)                     108.1 (15.1)                
          Median                        93.3                           109.0                    
          Min - Max                   61 - 137                        83 - 132                  
        WEEK 1 DAY 8                                                                            
          n                              15              15              15              15     
          Mean (SD)                 99.0 (21.4)      2.8 (28.1)     104.1 (16.2)    -4.0 (21.9) 
          Median                        92.4            -4.1           107.7            3.2     
          Min - Max                   68 - 130        -33 - 48        71 - 133        -53 - 29  
        WEEK 2 DAY 15                                                                           
          n                              15              15              15              15     
          Mean (SD)                 99.8 (14.5)      3.6 (21.2)     97.5 (17.3)     -10.6 (20.8)
          Median                       101.5            1.7             99.5            -9.7    
          Min - Max                   72 - 123        -40 - 48        54 - 126        -55 - 25  
        WEEK 3 DAY 22                                                                           
          n                              15              15              15              15     
          Mean (SD)                 99.1 (26.1)      3.0 (34.3)     92.0 (16.9)     -16.1 (21.9)
          Median                       101.1            -0.3            91.2           -14.4    
          Min - Max                   48 - 162        -48 - 77        68 - 120        -53 - 23  
        WEEK 4 DAY 29                                                                           
          n                              15              15              15              15     
          Mean (SD)                 103.4 (22.3)     7.3 (30.7)     96.5 (19.5)     -11.6 (25.9)
          Median                        98.2            2.5             97.4           -16.8    
          Min - Max                   63 - 148        -38 - 62        63 - 132        -57 - 48  
        WEEK 5 DAY 36                                                                           
          n                              15              15              15              15     
          Mean (SD)                 93.2 (18.5)     -2.9 (28.9)     97.9 (20.7)     -10.2 (27.6)
          Median                        90.8            -3.4            99.0           -11.3    
          Min - Max                   64 - 139        -49 - 47        69 - 138        -54 - 38  
      \s\n
      Parameter: Diastolic Blood Pressure
      
        ————————————————————————————————————————————————————————
                                          C: Combination        
                                                    Change from 
                                   Value at Visit     Baseline  
        Analysis Visit                 (N=15)          (N=15)   
        ————————————————————————————————————————————————————————
        SCREENING                                               
          n                              15              0      
          Mean (SD)                 106.5 (12.6)      NE (NE)   
          Median                       108.4             NE     
          Min - Max                   83 - 127        NE - NE   
        BASELINE                                                
          n                              15                     
          Mean (SD)                 103.1 (19.8)                
          Median                       102.8                    
          Min - Max                   66 - 137                  
        WEEK 1 DAY 8                                            
          n                              15              15     
          Mean (SD)                 100.8 (19.0)    -2.3 (25.0) 
          Median                       103.1            -2.5    
          Min - Max                   70 - 129        -55 - 42  
        WEEK 2 DAY 15                                           
          n                              15              15     
          Mean (SD)                 94.3 (17.0)     -8.9 (27.2) 
          Median                        96.8           -10.2    
          Min - Max                   63 - 117        -73 - 47  
        WEEK 3 DAY 22                                           
          n                              15              15     
          Mean (SD)                 94.6 (13.6)     -8.6 (21.7) 
          Median                        98.4           -16.1    
          Min - Max                   74 - 115        -38 - 33  
        WEEK 4 DAY 29                                           
          n                              15              15     
          Mean (SD)                 108.3 (18.4)     5.2 (21.9) 
          Median                       107.6            8.0     
          Min - Max                   69 - 133        -34 - 42  
        WEEK 5 DAY 36                                           
          n                              15              15     
          Mean (SD)                 95.3 (16.4)     -7.8 (19.8) 
          Median                        93.9            -4.7    
          Min - Max                   72 - 139        -44 - 29  
      \s\n
      Parameter: Systolic Blood Pressure
      
        ————————————————————————————————————————————————————————————————————————————————————————
                                             A: Drug X                      B: Placebo          
                                                    Change from                     Change from 
                                   Value at Visit     Baseline     Value at Visit     Baseline  
        Analysis Visit                 (N=15)          (N=15)          (N=15)          (N=15)   
        ————————————————————————————————————————————————————————————————————————————————————————
        SCREENING                                                                               
          n                              15              0               15              0      
          Mean (SD)                 154.1 (33.5)      NE (NE)       157.8 (34.4)      NE (NE)   
          Median                       156.2             NE            161.7             NE     
          Min - Max                   78 - 211        NE - NE         80 - 210        NE - NE   
        BASELINE                                                                                
          n                              15                              15                     
          Mean (SD)                 145.9 (28.2)                    152.0 (28.7)                
          Median                       142.7                           157.7                    
          Min - Max                   85 - 196                        99 - 195                  
        WEEK 1 DAY 8                                                                            
          n                              15              15              15              15     
          Mean (SD)                 156.5 (21.1)    10.6 (34.6)     147.5 (33.5)    -4.5 (48.9) 
          Median                       160.7            5.8            155.0            2.8     
          Min - Max                  127 - 186        -53 - 92        85 - 190        -77 - 91  
        WEEK 2 DAY 15                                                                           
          n                              15              15              15              15     
          Mean (SD)                 144.2 (33.7)    -1.7 (27.1)     136.9 (30.2)    -15.1 (37.8)
          Median                       144.3            5.3            142.7           -14.1    
          Min - Max                   63 - 204        -54 - 44        70 - 174        -83 - 62  
        WEEK 3 DAY 22                                                                           
          n                              15              15              15              15     
          Mean (SD)                 154.9 (35.4)     9.0 (38.5)     149.8 (28.9)    -2.2 (44.8) 
          Median                       158.9            17.2           155.0            -1.8    
          Min - Max                  112 - 219        -47 - 96        84 - 193       -110 - 94  
        WEEK 4 DAY 29                                                                           
          n                              15              15              15              15     
          Mean (SD)                 150.2 (32.2)     4.2 (33.0)     156.0 (22.9)     4.0 (42.5) 
          Median                       145.5            3.8            149.1           -10.0    
          Min - Max                   69 - 210        -89 - 54       114 - 195        -71 - 78  
        WEEK 5 DAY 36                                                                           
          n                              15              15              15              15     
          Mean (SD)                 156.0 (30.9)    10.0 (42.3)     156.4 (35.3)     4.4 (51.8) 
          Median                       158.1            1.4            164.6            7.1     
          Min - Max                  111 - 212        -54 - 90        63 - 199       -131 - 87  
      \s\n
      Parameter: Systolic Blood Pressure
      
        ————————————————————————————————————————————————————————
                                          C: Combination        
                                                    Change from 
                                   Value at Visit     Baseline  
        Analysis Visit                 (N=15)          (N=15)   
        ————————————————————————————————————————————————————————
        SCREENING                                               
          n                              15              0      
          Mean (SD)                 152.4 (22.3)      NE (NE)   
          Median                       149.6             NE     
          Min - Max                  108 - 185        NE - NE   
        BASELINE                                                
          n                              15                     
          Mean (SD)                 154.2 (26.3)                
          Median                       155.3                    
          Min - Max                   87 - 193                  
        WEEK 1 DAY 8                                            
          n                              15              15     
          Mean (SD)                 143.3 (30.8)    -10.9 (34.6)
          Median                       145.5            -5.6    
          Min - Max                   90 - 192        -66 - 49  
        WEEK 2 DAY 15                                           
          n                              15              15     
          Mean (SD)                 148.6 (27.1)    -5.6 (44.7) 
          Median                       147.1           -11.5    
          Min - Max                  109 - 200       -70 - 114  
        WEEK 3 DAY 22                                           
          n                              15              15     
          Mean (SD)                 150.5 (21.4)    -3.7 (38.0) 
          Median                       156.5            -7.6    
          Min - Max                   95 - 180        -75 - 73  
        WEEK 4 DAY 29                                           
          n                              15              15     
          Mean (SD)                 145.7 (23.0)    -8.5 (33.2) 
          Median                       150.8           -14.4    
          Min - Max                  107 - 188        -42 - 65  
        WEEK 5 DAY 36                                           
          n                              15              15     
          Mean (SD)                 143.6 (33.2)    -10.6 (44.8)
          Median                       148.5            -2.4    
          Min - Max                   92 - 191        -79 - 64  

