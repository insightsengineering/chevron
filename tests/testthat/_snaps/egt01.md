# egt01 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      
      Parameter: Heart Rate
      
        ———————————————————————————————————————————————————————————————————————————————————————————————————
                                     A: Drug X                        B: Placebo             C: Combination
                                            Change from                       Change from                  
                          Value at Visit      Baseline      Value at Visit     Baseline      Value at Visit
        Analysis Visit        (N=15)           (N=15)           (N=15)          (N=15)           (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————————————————————
        BASELINE                                                                                           
          n                     15                                15                               15      
          Mean (SD)        76.6 (17.9)                       69.9 (18.8)                      70.5 (18.2)  
          Median               77.5                              77.2                             74.1     
          Min - Max          46 - 107                          26 - 98                          45 - 115   
        WEEK 1 DAY 8                                                                                       
          n                     15               15               15              15               15      
          Mean (SD)        71.1 (23.4)      -5.5 (25.1)      71.0 (14.9)      1.1 (23.3)      67.4 (18.9)  
          Median               77.2             -2.2             70.0            -8.4             68.5     
          Min - Max          9 - 103          -51 - 37         45 - 94         -25 - 60         39 - 100   
        WEEK 2 DAY 15                                                                                      
          n                     15               15               15              15               15      
          Mean (SD)        69.4 (16.1)      -7.2 (29.0)      76.1 (15.0)      6.2 (29.3)      63.7 (12.9)  
          Median               65.7            -11.4             75.3             0.3             61.1     
          Min - Max          47 - 101         -50 - 43         47 - 111        -38 - 69         43 - 86    
        WEEK 3 DAY 22                                                                                      
          n                     15               15               15              15               15      
          Mean (SD)        73.9 (24.6)      -2.7 (32.1)      67.6 (19.1)      -2.3 (30.0)     72.1 (19.3)  
          Median               69.3             5.5              68.5            -2.1             68.7     
          Min - Max          44 - 132         -63 - 38         32 - 109        -52 - 67         32 - 110   
        WEEK 4 DAY 29                                                                                      
          n                     15               15               15              15               15      
          Mean (SD)        73.2 (19.3)      -3.4 (29.2)      66.5 (25.5)      -3.4 (36.0)     66.6 (22.8)  
          Median               68.7             0.2              66.4            -11.7            65.0     
          Min - Max          34 - 112         -55 - 65         20 - 111        -60 - 61         10 - 101   
        WEEK 5 DAY 36                                                                                      
          n                     15               15               15              15               15      
          Mean (SD)        61.7 (22.2)      -14.9 (30.3)     60.7 (20.0)      -9.2 (24.6)     72.7 (23.5)  
          Median               57.9            -12.7             60.5            -16.1            77.6     
          Min - Max          24 - 104         -60 - 57         33 - 102        -53 - 51         31 - 105   
      \s\n
      Parameter: Heart Rate
      
        ————————————————————————————————
                          C: Combination
                           Change from  
                             Baseline   
        Analysis Visit        (N=15)    
        ————————————————————————————————
        BASELINE                        
          n                             
          Mean (SD)                     
          Median                        
          Min - Max                     
        WEEK 1 DAY 8                    
          n                     15      
          Mean (SD)        -3.0 (23.8)  
          Median               0.2      
          Min - Max          -52 - 33   
        WEEK 2 DAY 15                   
          n                     15      
          Mean (SD)        -6.8 (23.9)  
          Median               -5.0     
          Min - Max          -53 - 41   
        WEEK 3 DAY 22                   
          n                     15      
          Mean (SD)         1.6 (27.5)  
          Median               -5.8     
          Min - Max          -50 - 35   
        WEEK 4 DAY 29                   
          n                     15      
          Mean (SD)        -3.9 (24.1)  
          Median               -6.8     
          Min - Max          -51 - 27   
        WEEK 5 DAY 36                   
          n                     15      
          Mean (SD)         2.2 (26.7)  
          Median               14.6     
          Min - Max          -43 - 35   
      \s\n
      Parameter: QT Duration
      
        ———————————————————————————————————————————————————————————————————————————————————————————————————
                                     A: Drug X                        B: Placebo             C: Combination
                                            Change from                       Change from                  
                          Value at Visit      Baseline      Value at Visit     Baseline      Value at Visit
        Analysis Visit        (N=15)           (N=15)           (N=15)          (N=15)           (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————————————————————
        BASELINE                                                                                           
          n                     15                                15                               15      
          Mean (SD)       335.3 (123.2)                      363.1 (68.2)                     347.3 (86.2) 
          Median              372.7                             386.3                            348.3     
          Min - Max         121 - 555                         215 - 446                        171 - 509   
        WEEK 1 DAY 8                                                                                       
          n                     15               15               15              15               15      
          Mean (SD)        357.4 (85.7)     22.1 (144.2)    415.2 (105.4)    52.1 (144.3)    321.1 (107.6) 
          Median              344.8             49.4            422.0            62.8            308.0     
          Min - Max         241 - 517        -207 - 245       234 - 605       -191 - 365       118 - 480   
        WEEK 2 DAY 15                                                                                      
          n                     15               15               15              15               15      
          Mean (SD)       344.9 (106.8)     9.6 (174.8)      370.5 (80.9)     7.4 (91.3)      354.1 (95.1) 
          Median              312.2             -9.3            388.5            -9.4            365.3     
          Min - Max         188 - 502        -279 - 373       205 - 514       -191 - 174       200 - 493   
        WEEK 3 DAY 22                                                                                      
          n                     15               15               15              15               15      
          Mean (SD)        342.1 (92.6)     6.8 (151.5)     326.7 (116.4)    -36.4 (145.4)    366.2 (99.1) 
          Median              352.9            -22.8            298.4            -78.4           329.7     
          Min - Max         199 - 476        -230 - 303       151 - 561       -205 - 294       249 - 581   
        WEEK 4 DAY 29                                                                                      
          n                     15               15               15              15               15      
          Mean (SD)        371.7 (44.8)     36.4 (139.3)    333.7 (110.4)    -29.4 (125.6)    333.2 (96.5) 
          Median              375.4             59.0            308.0            -41.0           330.9     
          Min - Max         302 - 452        -214 - 258       183 - 531       -242 - 134       127 - 489   
        WEEK 5 DAY 36                                                                                      
          n                     15               15               15              15               15      
          Mean (SD)       345.5 (130.5)     10.2 (198.2)     309.9 (84.6)    -53.2 (105.7)    322.9 (67.8) 
          Median              355.7            -23.2            306.2            -12.4           342.0     
          Min - Max          88 - 661        -271 - 540       189 - 449        -257 - 92       218 - 427   
      \s\n
      Parameter: QT Duration
      
        ————————————————————————————————
                          C: Combination
                           Change from  
                             Baseline   
        Analysis Visit        (N=15)    
        ————————————————————————————————
        BASELINE                        
          n                             
          Mean (SD)                     
          Median                        
          Min - Max                     
        WEEK 1 DAY 8                    
          n                     15      
          Mean (SD)       -26.2 (129.1) 
          Median              -17.0     
          Min - Max         -363 - 164  
        WEEK 2 DAY 15                   
          n                     15      
          Mean (SD)        6.8 (142.4)  
          Median               39.9     
          Min - Max         -279 - 266  
        WEEK 3 DAY 22                   
          n                     15      
          Mean (SD)        18.9 (168.4) 
          Median              -21.6     
          Min - Max         -253 - 410  
        WEEK 4 DAY 29                   
          n                     15      
          Mean (SD)       -14.1 (107.6) 
          Median              -25.8     
          Min - Max         -235 - 152  
        WEEK 5 DAY 36                   
          n                     15      
          Mean (SD)       -24.4 (117.3) 
          Median              -27.0     
          Min - Max         -291 - 171  
      \s\n
      Parameter: RR Duration
      
        ———————————————————————————————————————————————————————————————————————————————————————————————————
                                     A: Drug X                        B: Placebo             C: Combination
                                            Change from                       Change from                  
                          Value at Visit      Baseline      Value at Visit     Baseline      Value at Visit
        Analysis Visit        (N=15)           (N=15)           (N=15)          (N=15)           (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————————————————————
        BASELINE                                                                                           
          n                     15                                15                               15      
          Mean (SD)       1086.9 (363.8)                    1050.0 (390.4)                   1102.7 (310.4)
          Median              1116.8                            1089.2                           1250.0    
          Min - Max         626 - 1653                        415 - 1722                       386 - 1431  
        WEEK 1 DAY 8                                                                                       
          n                     15               15               15              15               15      
          Mean (SD)       968.5 (287.8)    -118.4 (546.8)   1041.2 (211.2)   -8.8 (435.3)    948.5 (213.7) 
          Median              961.3            -147.5           1013.8           24.8            965.4     
          Min - Max         359 - 1594      -1015 - 912       714 - 1418      -619 - 847       513 - 1229  
        WEEK 2 DAY 15                                                                                      
          n                     15               15               15              15               15      
          Mean (SD)       932.7 (259.6)    -154.2 (331.9)   1139.3 (454.2)   89.3 (582.7)    1021.3 (233.5)
          Median              950.5            -205.9           1068.0           -5.4            964.6     
          Min - Max         410 - 1269       -650 - 473       487 - 2049      -847 - 1149      667 - 1367  
        WEEK 3 DAY 22                                                                                      
          n                     15               15               15              15               15      
          Mean (SD)       1068.9 (319.5)   -18.0 (513.4)    1110.9 (259.5)   60.8 (432.7)    1105.9 (306.2)
          Median              1202.0           -65.1            1163.7           51.2            1187.1    
          Min - Max         380 - 1552       -833 - 704       621 - 1453      -887 - 822       446 - 1648  
        WEEK 4 DAY 29                                                                                      
          n                     15               15               15              15               15      
          Mean (SD)       1087.9 (205.9)    1.0 (403.0)     1161.7 (293.3)   111.6 (461.0)   992.1 (283.2) 
          Median              1084.7           146.6            1055.2           191.0           1029.0    
          Min - Max         698 - 1499       -801 - 403       722 - 1762      -528 - 1192      497 - 1382  
        WEEK 5 DAY 36                                                                                      
          n                     15               15               15              15               15      
          Mean (SD)       1016.9 (424.4)   -70.0 (505.1)    1135.1 (224.7)   85.1 (497.7)    1089.5 (238.9)
          Median              962.6            -142.9           1158.8           -9.6            1081.0    
          Min - Max         353 - 1844      -895 - 1163       714 - 1437      -843 - 992       700 - 1611  
      \s\n
      Parameter: RR Duration
      
        ————————————————————————————————
                          C: Combination
                           Change from  
                             Baseline   
        Analysis Visit        (N=15)    
        ————————————————————————————————
        BASELINE                        
          n                             
          Mean (SD)                     
          Median                        
          Min - Max                     
        WEEK 1 DAY 8                    
          n                     15      
          Mean (SD)       -154.2 (442.9)
          Median              -224.1    
          Min - Max         -737 - 844  
        WEEK 2 DAY 15                   
          n                     15      
          Mean (SD)       -81.4 (415.8) 
          Median              -142.2    
          Min - Max         -647 - 616  
        WEEK 3 DAY 22                   
          n                     15      
          Mean (SD)        3.3 (516.7)  
          Median               30.3     
          Min - Max         -985 - 816  
        WEEK 4 DAY 29                   
          n                     15      
          Mean (SD)       -110.5 (334.9)
          Median              -112.6    
          Min - Max         -598 - 758  
        WEEK 5 DAY 36                   
          n                     15      
          Mean (SD)       -13.1 (362.6) 
          Median               16.7     
          Min - Max         -696 - 562  

# egt01 can handle n = 0 and outputs NE instead of infs and NAs

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      
      Parameter: Heart Rate
      
        ———————————————————————————————————————————————————————————————————————————————————————
                                    A: Drug X                          B: Placebo              
                                           Change from                           Change from   
                          Value at Visit     Baseline      Value at Visit         Baseline     
        Analysis Visit        (N=15)          (N=15)           (N=15)              (N=15)      
        ———————————————————————————————————————————————————————————————————————————————————————
        BASELINE                                                                               
          n                     0                                15                            
          Mean (SD)          NE (NE)                        69.90 (18.79)                      
          Median                NE                              77.17                          
          Min - Max          NE - NE                         26.4 - 97.7                       
        WEEK 1 DAY 8                                                                           
          n                     0               0                15                  15        
          Mean (SD)          NE (NE)         NE (NE)        70.96 (14.88)       1.06 (23.34)   
          Median                NE              NE              70.03               -8.40      
          Min - Max          NE - NE         NE - NE         44.9 - 93.8        -25.3 - 60.5   
        WEEK 2 DAY 15                                                                          
          n                     0               0                15                  15        
          Mean (SD)          NE (NE)         NE (NE)        76.10 (14.96)       6.20 (29.32)   
          Median                NE              NE              75.32               0.26       
          Min - Max          NE - NE         NE - NE        47.5 - 111.4        -37.5 - 69.3   
        WEEK 3 DAY 22                                                                          
          n                     0               0                15                  15        
          Mean (SD)          NE (NE)         NE (NE)        67.64 (19.11)       -2.26 (29.99)  
          Median                NE              NE              68.47               -2.09      
          Min - Max          NE - NE         NE - NE        31.9 - 108.9        -52.3 - 66.8   
        WEEK 4 DAY 29                                                                          
          n                     0               0                15                  15        
          Mean (SD)          NE (NE)         NE (NE)        66.52 (25.49)       -3.37 (36.02)  
          Median                NE              NE              66.40              -11.73      
          Min - Max          NE - NE         NE - NE        19.7 - 111.3        -60.4 - 61.0   
        WEEK 5 DAY 36                                                                          
          n                     0               0                15                  15        
          Mean (SD)          NE (NE)         NE (NE)        60.71 (20.03)       -9.19 (24.59)  
          Median                NE              NE              60.45              -16.10      
          Min - Max          NE - NE         NE - NE        32.5 - 102.0        -52.6 - 51.0   
      \s\n
      Parameter: Heart Rate
      
        ———————————————————————————————————————————————————————
                                     C: Combination            
                                                 Change from   
                           Value at Visit         Baseline     
        Analysis Visit         (N=15)              (N=15)      
        ———————————————————————————————————————————————————————
        BASELINE                                               
          n                      15                            
          Mean (SD)         70.49 (18.17)                      
          Median                74.11                          
          Min - Max         45.4 - 115.5                       
        WEEK 1 DAY 8                                           
          n                      15                  15        
          Mean (SD)         67.45 (18.93)       -3.04 (23.75)  
          Median                68.47               0.18       
          Min - Max         38.9 - 100.1        -52.2 - 33.1   
        WEEK 2 DAY 15                                          
          n                      15                  15        
          Mean (SD)         63.69 (12.92)       -6.80 (23.95)  
          Median                61.08               -4.95      
          Min - Max          43.3 - 86.1        -52.7 - 40.8   
        WEEK 3 DAY 22                                          
          n                      15                  15        
          Mean (SD)         72.05 (19.31)       1.56 (27.49)   
          Median                68.69               -5.85      
          Min - Max         32.2 - 109.9        -49.6 - 35.2   
        WEEK 4 DAY 29                                          
          n                      15                  15        
          Mean (SD)         66.60 (22.84)       -3.89 (24.14)  
          Median                64.97               -6.83      
          Min - Max         10.4 - 100.9        -50.7 - 26.8   
        WEEK 5 DAY 36                                          
          n                      15                  15        
          Mean (SD)         72.68 (23.49)       2.19 (26.65)   
          Median                77.59               14.63      
          Min - Max         31.2 - 105.1        -42.9 - 34.6   
      \s\n
      Parameter: QT Duration
      
        ———————————————————————————————————————————————————————————————————————————————————————
                                    A: Drug X                          B: Placebo              
                                           Change from                           Change from   
                          Value at Visit     Baseline      Value at Visit         Baseline     
        Analysis Visit        (N=15)          (N=15)           (N=15)              (N=15)      
        ———————————————————————————————————————————————————————————————————————————————————————
        BASELINE                                                                               
          n                     0                                15                            
          Mean (SD)          NE (NE)                      363.104 (68.160)                     
          Median                NE                             386.316                         
          Min - Max          NE - NE                       214.65 - 445.53                     
        WEEK 1 DAY 8                                                                           
          n                     0               0                15                  15        
          Mean (SD)          NE (NE)         NE (NE)      415.225 (105.425)   52.121 (144.259) 
          Median                NE              NE             421.950             62.762      
          Min - Max          NE - NE         NE - NE       234.11 - 604.72    -190.70 - 364.94 
        WEEK 2 DAY 15                                                                          
          n                     0               0                15                  15        
          Mean (SD)          NE (NE)         NE (NE)      370.548 (80.862)     7.444 (91.301)  
          Median                NE              NE             388.515             -9.429      
          Min - Max          NE - NE         NE - NE       204.55 - 514.43    -190.58 - 173.87 
        WEEK 3 DAY 22                                                                          
          n                     0               0                15                  15        
          Mean (SD)          NE (NE)         NE (NE)      326.684 (116.421)   -36.420 (145.415)
          Median                NE              NE             298.353             -78.409     
          Min - Max          NE - NE         NE - NE       151.05 - 561.23    -205.30 - 293.76 
        WEEK 4 DAY 29                                                                          
          n                     0               0                15                  15        
          Mean (SD)          NE (NE)         NE (NE)      333.697 (110.377)   -29.407 (125.592)
          Median                NE              NE             308.020             -40.987     
          Min - Max          NE - NE         NE - NE       183.09 - 531.08    -241.72 - 134.12 
        WEEK 5 DAY 36                                                                          
          n                     0               0                15                  15        
          Mean (SD)          NE (NE)         NE (NE)      309.919 (84.624)    -53.185 (105.730)
          Median                NE              NE             306.219             -12.373     
          Min - Max          NE - NE         NE - NE       189.01 - 448.58     -256.52 - 91.57 
      \s\n
      Parameter: QT Duration
      
        ———————————————————————————————————————————————————————
                                     C: Combination            
                                                 Change from   
                           Value at Visit         Baseline     
        Analysis Visit         (N=15)              (N=15)      
        ———————————————————————————————————————————————————————
        BASELINE                                               
          n                      15                            
          Mean (SD)       347.311 (86.236)                     
          Median               348.254                         
          Min - Max        170.80 - 508.54                     
        WEEK 1 DAY 8                                           
          n                      15                  15        
          Mean (SD)       321.078 (107.553)   -26.233 (129.135)
          Median               307.962             -17.006     
          Min - Max        118.36 - 480.29    -363.11 - 163.67 
        WEEK 2 DAY 15                                          
          n                      15                  15        
          Mean (SD)       354.129 (95.133)     6.818 (142.397) 
          Median               365.292             39.930      
          Min - Max        200.19 - 493.40    -279.46 - 265.56 
        WEEK 3 DAY 22                                          
          n                      15                  15        
          Mean (SD)       366.245 (99.106)    18.935 (168.417) 
          Median               329.688             -21.584     
          Min - Max        249.42 - 580.81    -252.73 - 410.01 
        WEEK 4 DAY 29                                          
          n                      15                  15        
          Mean (SD)       333.181 (96.466)    -14.130 (107.622)
          Median               330.911             -25.820     
          Min - Max        126.95 - 488.57    -234.92 - 152.49 
        WEEK 5 DAY 36                                          
          n                      15                  15        
          Mean (SD)       322.931 (67.801)    -24.380 (117.331)
          Median               341.988             -26.952     
          Min - Max        217.51 - 427.16    -291.03 - 171.19 
      \s\n
      Parameter: RR Duration
      
        ———————————————————————————————————————————————————————————————————————————————————————
                                    A: Drug X                          B: Placebo              
                                           Change from                           Change from   
                          Value at Visit     Baseline      Value at Visit         Baseline     
        Analysis Visit        (N=15)          (N=15)           (N=15)              (N=15)      
        ———————————————————————————————————————————————————————————————————————————————————————
        BASELINE                                                                               
          n                     0                                15                            
          Mean (SD)          NE (NE)                       1050.0 (390.4)                      
          Median                NE                             1089.2                          
          Min - Max          NE - NE                         415 - 1722                        
        WEEK 1 DAY 8                                                                           
          n                     0               0                15                  15        
          Mean (SD)          NE (NE)         NE (NE)       1041.2 (211.2)       -8.8 (435.3)   
          Median                NE              NE             1013.8               24.8       
          Min - Max          NE - NE         NE - NE         714 - 1418          -619 - 847    
        WEEK 2 DAY 15                                                                          
          n                     0               0                15                  15        
          Mean (SD)          NE (NE)         NE (NE)       1139.3 (454.2)       89.3 (582.7)   
          Median                NE              NE             1068.0               -5.4       
          Min - Max          NE - NE         NE - NE         487 - 2049          -847 - 1149   
        WEEK 3 DAY 22                                                                          
          n                     0               0                15                  15        
          Mean (SD)          NE (NE)         NE (NE)       1110.9 (259.5)       60.8 (432.7)   
          Median                NE              NE             1163.7               51.2       
          Min - Max          NE - NE         NE - NE         621 - 1453          -887 - 822    
        WEEK 4 DAY 29                                                                          
          n                     0               0                15                  15        
          Mean (SD)          NE (NE)         NE (NE)       1161.7 (293.3)       111.6 (461.0)  
          Median                NE              NE             1055.2               191.0      
          Min - Max          NE - NE         NE - NE         722 - 1762          -528 - 1192   
        WEEK 5 DAY 36                                                                          
          n                     0               0                15                  15        
          Mean (SD)          NE (NE)         NE (NE)       1135.1 (224.7)       85.1 (497.7)   
          Median                NE              NE             1158.8               -9.6       
          Min - Max          NE - NE         NE - NE         714 - 1437          -843 - 992    
      \s\n
      Parameter: RR Duration
      
        ———————————————————————————————————————————————————————
                                     C: Combination            
                                                 Change from   
                           Value at Visit         Baseline     
        Analysis Visit         (N=15)              (N=15)      
        ———————————————————————————————————————————————————————
        BASELINE                                               
          n                      15                            
          Mean (SD)        1102.7 (310.4)                      
          Median               1250.0                          
          Min - Max          386 - 1431                        
        WEEK 1 DAY 8                                           
          n                      15                  15        
          Mean (SD)         948.5 (213.7)      -154.2 (442.9)  
          Median                965.4              -224.1      
          Min - Max          513 - 1229          -737 - 844    
        WEEK 2 DAY 15                                          
          n                      15                  15        
          Mean (SD)        1021.3 (233.5)       -81.4 (415.8)  
          Median                964.6              -142.2      
          Min - Max          667 - 1367          -647 - 616    
        WEEK 3 DAY 22                                          
          n                      15                  15        
          Mean (SD)        1105.9 (306.2)        3.3 (516.7)   
          Median               1187.1               30.3       
          Min - Max          446 - 1648          -985 - 816    
        WEEK 4 DAY 29                                          
          n                      15                  15        
          Mean (SD)         992.1 (283.2)      -110.5 (334.9)  
          Median               1029.0              -112.6      
          Min - Max          497 - 1382          -598 - 758    
        WEEK 5 DAY 36                                          
          n                      15                  15        
          Mean (SD)        1089.5 (238.9)       -13.1 (362.6)  
          Median               1081.0               16.7       
          Min - Max          700 - 1611          -696 - 562    

