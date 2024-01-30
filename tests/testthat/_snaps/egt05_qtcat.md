# egt05_qtcat functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Parameter                                                          
          Analysis Visit           A: Drug X    B: Placebo   C: Combination
            Category                 (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————
        QT Duration                                                        
          BASELINE                                                         
            Value at Visit                                                 
              n                        15           15             15      
              <=450 msec           13 (86.7%)   15 (100%)      13 (86.7%)  
              >450 to <=480 msec    1 (6.7%)        0              0       
              >480 to <=500 msec       0            0           1 (6.7%)   
              >500 msec             1 (6.7%)        0           1 (6.7%)   
          WEEK 1 DAY 8                                                     
            Value at Visit                                                 
              n                        15           15             15      
              <=450 msec           12 (80.0%)   9 (60.0%)      13 (86.7%)  
              >450 to <=480 msec    1 (6.7%)     1 (6.7%)       1 (6.7%)   
              >480 to <=500 msec    1 (6.7%)    3 (20.0%)       1 (6.7%)   
              >500 msec             1 (6.7%)    2 (13.3%)          0       
            Change from Baseline                                           
              n                        15           15             15      
              <=30 msec            7 (46.7%)    6 (40.0%)      9 (60.0%)   
              >30 to <=60 msec     2 (13.3%)     1 (6.7%)       1 (6.7%)   
              >60 msec             6 (40.0%)    8 (53.3%)      5 (33.3%)   
          WEEK 2 DAY 15                                                    
            Value at Visit                                                 
              n                        15           15             15      
              <=450 msec           11 (73.3%)   14 (93.3%)     12 (80.0%)  
              >450 to <=480 msec   2 (13.3%)        0          2 (13.3%)   
              >480 to <=500 msec    1 (6.7%)        0           1 (6.7%)   
              >500 msec             1 (6.7%)     1 (6.7%)          0       
            Change from Baseline                                           
              n                        15           15             15      
              <=30 msec            9 (60.0%)    12 (80.0%)     7 (46.7%)   
              >30 to <=60 msec     2 (13.3%)        0          3 (20.0%)   
              >60 msec             4 (26.7%)    3 (20.0%)      5 (33.3%)   
          WEEK 3 DAY 22                                                    
            Value at Visit                                                 
              n                        15           15             15      
              <=450 msec           12 (80.0%)   12 (80.0%)     12 (80.0%)  
              >450 to <=480 msec   3 (20.0%)     1 (6.7%)       1 (6.7%)   
              >500 msec                0        2 (13.3%)      2 (13.3%)   
            Change from Baseline                                           
              n                        15           15             15      
              <=30 msec            9 (60.0%)    11 (73.3%)     9 (60.0%)   
              >30 to <=60 msec      1 (6.7%)     1 (6.7%)          0       
              >60 msec             5 (33.3%)    3 (20.0%)      6 (40.0%)   
          WEEK 4 DAY 29                                                    
            Value at Visit                                                 
              n                        15           15             15      
              <=450 msec           14 (93.3%)   12 (80.0%)     13 (86.7%)  
              >450 to <=480 msec    1 (6.7%)     1 (6.7%)       1 (6.7%)   
              >480 to <=500 msec       0            0           1 (6.7%)   
              >500 msec                0        2 (13.3%)          0       
            Change from Baseline                                           
              n                        15           15             15      
              <=30 msec            6 (40.0%)    9 (60.0%)      9 (60.0%)   
              >30 to <=60 msec     2 (13.3%)     1 (6.7%)      2 (13.3%)   
              >60 msec             7 (46.7%)    5 (33.3%)      4 (26.7%)   
          WEEK 5 DAY 36                                                    
            Value at Visit                                                 
              n                        15           15             15      
              <=450 msec           12 (80.0%)   15 (100%)      15 (100%)   
              >450 to <=480 msec   2 (13.3%)        0              0       
              >500 msec             1 (6.7%)        0              0       
            Change from Baseline                                           
              n                        15           15             15      
              <=30 msec            9 (60.0%)    11 (73.3%)     9 (60.0%)   
              >30 to <=60 msec         0        3 (20.0%)      2 (13.3%)   
              >60 msec             6 (40.0%)     1 (6.7%)      4 (26.7%)   

# egt05_qtcat can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Parameter                                                          
          Analysis Visit           A: Drug X    B: Placebo   C: Combination
            Category                 (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————
        QT Duration                                                        
          BASELINE                                                         
            Value at Visit                                                 
              n                        14           15             15      
              <=450 msec           13 (92.9%)   15 (100%)      13 (86.7%)  
              >450 to <=480 msec    1 (7.1%)        0              0       
              >480 to <=500 msec       0            0           1 (6.7%)   
              >500 msec                0            0           1 (6.7%)   
          WEEK 1 DAY 8                                                     
            Value at Visit                                                 
              n                        15           15             15      
              <=450 msec           12 (80.0%)   9 (60.0%)      13 (86.7%)  
              >450 to <=480 msec    1 (6.7%)     1 (6.7%)       1 (6.7%)   
              >480 to <=500 msec    1 (6.7%)    3 (20.0%)       1 (6.7%)   
              >500 msec             1 (6.7%)    2 (13.3%)          0       
            Change from Baseline                                           
              n                        15           15             15      
              <=30 msec            7 (46.7%)    6 (40.0%)      9 (60.0%)   
              >30 to <=60 msec     2 (13.3%)     1 (6.7%)       1 (6.7%)   
              >60 msec             6 (40.0%)    8 (53.3%)      5 (33.3%)   
          WEEK 2 DAY 15                                                    
            Value at Visit                                                 
              n                        15           15             15      
              <=450 msec           11 (73.3%)   14 (93.3%)     12 (80.0%)  
              >450 to <=480 msec   2 (13.3%)        0          2 (13.3%)   
              >480 to <=500 msec    1 (6.7%)        0           1 (6.7%)   
              >500 msec             1 (6.7%)     1 (6.7%)          0       
            Change from Baseline                                           
              n                        15           15             15      
              <=30 msec            9 (60.0%)    12 (80.0%)     7 (46.7%)   
              >30 to <=60 msec     2 (13.3%)        0          3 (20.0%)   
              >60 msec             4 (26.7%)    3 (20.0%)      5 (33.3%)   
          WEEK 3 DAY 22                                                    
            Value at Visit                                                 
              n                        15           15             15      
              <=450 msec           12 (80.0%)   12 (80.0%)     12 (80.0%)  
              >450 to <=480 msec   3 (20.0%)     1 (6.7%)       1 (6.7%)   
              >500 msec                0        2 (13.3%)      2 (13.3%)   
            Change from Baseline                                           
              n                        15           15             15      
              <=30 msec            9 (60.0%)    11 (73.3%)     9 (60.0%)   
              >30 to <=60 msec      1 (6.7%)     1 (6.7%)          0       
              >60 msec             5 (33.3%)    3 (20.0%)      6 (40.0%)   
          WEEK 4 DAY 29                                                    
            Value at Visit                                                 
              n                        15           15             15      
              <=450 msec           14 (93.3%)   12 (80.0%)     13 (86.7%)  
              >450 to <=480 msec    1 (6.7%)     1 (6.7%)       1 (6.7%)   
              >480 to <=500 msec       0            0           1 (6.7%)   
              >500 msec                0        2 (13.3%)          0       
            Change from Baseline                                           
              n                        15           15             15      
              <=30 msec            6 (40.0%)    9 (60.0%)      9 (60.0%)   
              >30 to <=60 msec     2 (13.3%)     1 (6.7%)      2 (13.3%)   
              >60 msec             7 (46.7%)    5 (33.3%)      4 (26.7%)   
          WEEK 5 DAY 36                                                    
            Value at Visit                                                 
              n                        15           15             15      
              <=450 msec           12 (80.0%)   15 (100%)      15 (100%)   
              >450 to <=480 msec   2 (13.3%)        0              0       
              >500 msec             1 (6.7%)        0              0       
            Change from Baseline                                           
              n                        15           15             15      
              <=30 msec            9 (60.0%)    11 (73.3%)     9 (60.0%)   
              >30 to <=60 msec         0        3 (20.0%)      2 (13.3%)   
              >60 msec             6 (40.0%)     1 (6.7%)      4 (26.7%)   

