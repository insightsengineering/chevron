# ext01 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                       A: Drug X        B: Placebo      C: Combination 
        PARCAT2                         (N=15)            (N=15)            (N=15)     
        ———————————————————————————————————————————————————————————————————————————————
        Drug A                                                                         
          Overall duration (days)                                                      
            n                             11                 7                 7       
            Mean (SD)                157.5 (67.4)      115.4 (62.8)       98.6 (68.8)  
            Median                       174.0             119.0             89.0      
            Min - Max                  53 - 239          22 - 219           1 - 182    
          Total dose administered                                                      
            n                             11                 7                 7       
            Mean (SD)               6567.3 (1127.1)   7028.6 (1626.1)   6377.1 (863.7) 
            Median                      6720.0            7200.0            6480.0     
            Min - Max                 4800 - 8400       5280 - 9360       5280 - 7440  
        Drug B                                                                         
          Overall duration (days)                                                      
            n                              4                 8                 8       
            Mean (SD)                142.2 (100.3)     105.9 (60.0)      158.2 (96.2)  
            Median                       160.0             95.0              203.0     
            Min - Max                  17 - 232          37 - 211          27 - 249    
          Total dose administered                                                      
            n                              4                 8                 8       
            Mean (SD)               7020.0 (1148.9)   5250.0 (864.7)    5940.0 (1187.9)
            Median                      6960.0            5160.0            5880.0     
            Min - Max                 5760 - 8400       4080 - 6480       4320 - 7680  

# ext01 functions with categorical data return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                       A: Drug X        B: Placebo      C: Combination 
        PARCAT2                         (N=15)            (N=15)            (N=15)     
        ———————————————————————————————————————————————————————————————————————————————
        Drug A                                                                         
          Total dose administered                                                      
            n                             11                 7                 7       
            Mean (SD)               6567.3 (1127.1)   7028.6 (1626.1)   6377.1 (863.7) 
            Median                      6720.0            7200.0            6480.0     
            Min - Max                 4800 - 8400       5280 - 9360       5280 - 7440  
            n                             11                 7                 7       
            <5000                      1 (9.1%)              0                 0       
            5000-7000                  6 (54.5%)         3 (42.9%)         5 (71.4%)   
            7000-9000                  4 (36.4%)         3 (42.9%)         2 (28.6%)   
            >9000                          0             1 (14.3%)             0       
        Drug B                                                                         
          Total dose administered                                                      
            n                              4                 8                 8       
            Mean (SD)               7020.0 (1148.9)   5250.0 (864.7)    5940.0 (1187.9)
            Median                      6960.0            5160.0            5880.0     
            Min - Max                 5760 - 8400       4080 - 6480       4320 - 7680  
            n                              4                 8                 8       
            <5000                          0             4 (50.0%)         2 (25.0%)   
            5000-7000                  2 (50.0%)         4 (50.0%)         4 (50.0%)   
            7000-9000                  2 (50.0%)             0             2 (25.0%)   

# ext01 works

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
                                       A: Drug X        B: Placebo      C: Combination 
        PARCAT2                         (N=15)            (N=15)            (N=15)     
        ———————————————————————————————————————————————————————————————————————————————
        Drug A                                                                         
          Overall duration (days)                                                      
            n                             11                 7                 7       
            Mean (SD)                157.5 (67.4)      115.4 (62.8)       98.6 (68.8)  
            Median                       174.0             119.0             89.0      
            Min - Max                  53 - 239          22 - 219           1 - 182    
          Total dose administered                                                      
            n                             11                 7                 7       
            Mean (SD)               6567.3 (1127.1)   7028.6 (1626.1)   6377.1 (863.7) 
            Median                      6720.0            7200.0            6480.0     
            Min - Max                 4800 - 8400       5280 - 9360       5280 - 7440  
        Drug B                                                                         
          Overall duration (days)                                                      
            n                              4                 8                 8       
            Mean (SD)                142.2 (100.3)     105.9 (60.0)      158.2 (96.2)  
            Median                       160.0             95.0              203.0     
            Min - Max                  17 - 232          37 - 211          27 - 249    
          Total dose administered                                                      
            n                              4                 8                 8       
            Mean (SD)               7020.0 (1148.9)   5250.0 (864.7)    5940.0 (1187.9)
            Median                      6960.0            5160.0            5880.0     
            Min - Max                 5760 - 8400       4080 - 6480       4320 - 7680  

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
                                       A: Drug X        B: Placebo      C: Combination 
        PARCAT2                         (N=15)            (N=15)            (N=15)     
        ———————————————————————————————————————————————————————————————————————————————
        Drug A                                                                         
          Overall duration (days)                                                      
            n                             11                 7                 7       
            Mean (SD)                157.5 (67.4)      115.4 (62.8)       98.6 (68.8)  
            Median                       174.0             119.0             89.0      
            Min - Max                  53 - 239          22 - 219           1 - 182    
          Total dose administered                                                      
            n                             11                 7                 7       
            Mean (SD)               6567.3 (1127.1)   7028.6 (1626.1)   6377.1 (863.7) 
            Median                      6720.0            7200.0            6480.0     
            Min - Max                 4800 - 8400       5280 - 9360       5280 - 7440  
        Drug B                                                                         
          Overall duration (days)                                                      
            n                              4                 8                 8       
            Mean (SD)                142.2 (100.3)     105.9 (60.0)      158.2 (96.2)  
            Median                       160.0             95.0              203.0     
            Min - Max                  17 - 232          37 - 211          27 - 249    
          Total dose administered                                                      
            n                              4                 8                 8       
            Mean (SD)               7020.0 (1148.9)   5250.0 (864.7)    5940.0 (1187.9)
            Median                      6960.0            5160.0            5880.0     
            Min - Max                 5760 - 8400       4080 - 6480       4320 - 7680  

# ext01 works for selected parameters and categorical variables

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                       A: Drug X        B: Placebo      C: Combination 
        PARCAT2                         (N=15)            (N=15)            (N=15)     
        ———————————————————————————————————————————————————————————————————————————————
        Drug A                                                                         
          Total dose administered                                                      
            n                             11                 7                 7       
            Mean (SD)               6567.3 (1127.1)   7028.6 (1626.1)   6377.1 (863.7) 
            Median                      6720.0            7200.0            6480.0     
            Min - Max                 4800 - 8400       5280 - 9360       5280 - 7440  
            n                             11                 7                 7       
            <5000                      1 (9.1%)              0                 0       
            5000-7000                  6 (54.5%)         3 (42.9%)         5 (71.4%)   
            7000-9000                  4 (36.4%)         3 (42.9%)         2 (28.6%)   
            >9000                          0             1 (14.3%)             0       
        Drug B                                                                         
          Total dose administered                                                      
            n                              4                 8                 8       
            Mean (SD)               7020.0 (1148.9)   5250.0 (864.7)    5940.0 (1187.9)
            Median                      6960.0            5160.0            5880.0     
            Min - Max                 5760 - 8400       4080 - 6480       4320 - 7680  
            n                              4                 8                 8       
            <5000                          0             4 (50.0%)         2 (25.0%)   
            5000-7000                  2 (50.0%)         4 (50.0%)         4 (50.0%)   
            7000-9000                  2 (50.0%)             0             2 (25.0%)   

# ext01 works with custom mapping order

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                       A: Drug X        B: Placebo      C: Combination 
        PARCAT2                         (N=15)            (N=15)            (N=15)     
        ———————————————————————————————————————————————————————————————————————————————
        Drug A                                                                         
          Overall duration (days)                                                      
            n                             11                 7                 7       
            Mean (SD)                157.5 (67.4)      115.4 (62.8)       98.6 (68.8)  
            Median                       174.0             119.0             89.0      
            Min - Max                  53 - 239          22 - 219           1 - 182    
            n                             11                 7                 7       
            < 1 month                      0             1 (14.3%)         1 (14.3%)   
            3 to <6 months             3 (27.3%)         4 (57.1%)         2 (28.6%)   
            1 to <3 months             3 (27.3%)         1 (14.3%)         3 (42.9%)   
            >=6 months                 5 (45.5%)         1 (14.3%)         1 (14.3%)   
          Total dose administered                                                      
            n                             11                 7                 7       
            Mean (SD)               6567.3 (1127.1)   7028.6 (1626.1)   6377.1 (863.7) 
            Median                      6720.0            7200.0            6480.0     
            Min - Max                 4800 - 8400       5280 - 9360       5280 - 7440  
            n                             11                 7                 7       
            <5000                      1 (9.1%)              0                 0       
            5000-7000                  6 (54.5%)         3 (42.9%)         5 (71.4%)   
            7000-9000                  4 (36.4%)         3 (42.9%)         2 (28.6%)   
            >9000                          0             1 (14.3%)             0       
        Drug B                                                                         
          Overall duration (days)                                                      
            n                              4                 8                 8       
            Mean (SD)                142.2 (100.3)     105.9 (60.0)      158.2 (96.2)  
            Median                       160.0             95.0              203.0     
            Min - Max                  17 - 232          37 - 211          27 - 249    
            n                              4                 8                 8       
            < 1 month                  1 (25.0%)             0             1 (12.5%)   
            3 to <6 months             1 (25.0%)         3 (37.5%)             0       
            1 to <3 months                 0             4 (50.0%)         2 (25.0%)   
            >=6 months                 2 (50.0%)         1 (12.5%)         5 (62.5%)   
          Total dose administered                                                      
            n                              4                 8                 8       
            Mean (SD)               7020.0 (1148.9)   5250.0 (864.7)    5940.0 (1187.9)
            Median                      6960.0            5160.0            5880.0     
            Min - Max                 5760 - 8400       4080 - 6480       4320 - 7680  
            n                              4                 8                 8       
            <5000                          0             4 (50.0%)         2 (25.0%)   
            5000-7000                  2 (50.0%)         4 (50.0%)         4 (50.0%)   
            7000-9000                  2 (50.0%)             0             2 (25.0%)   
            >9000                          0                 0                 0       

# ext01 works with custom mapping order for a single split

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                       A: Drug X        B: Placebo      C: Combination 
        PARCAT2                         (N=15)            (N=15)            (N=15)     
        ———————————————————————————————————————————————————————————————————————————————
        Drug A                                                                         
          Overall duration (days)                                                      
            n                             11                 7                 7       
            Mean (SD)                157.5 (67.4)      115.4 (62.8)       98.6 (68.8)  
            Median                       174.0             119.0             89.0      
            Min - Max                  53 - 239          22 - 219           1 - 182    
            n                             11                 7                 7       
            < 1 month                      0             1 (14.3%)         1 (14.3%)   
            3 to <6 months             3 (27.3%)         4 (57.1%)         2 (28.6%)   
            1 to <3 months             3 (27.3%)         1 (14.3%)         3 (42.9%)   
            >=6 months                 5 (45.5%)         1 (14.3%)         1 (14.3%)   
          Total dose administered                                                      
            n                             11                 7                 7       
            Mean (SD)               6567.3 (1127.1)   7028.6 (1626.1)   6377.1 (863.7) 
            Median                      6720.0            7200.0            6480.0     
            Min - Max                 4800 - 8400       5280 - 9360       5280 - 7440  
            n                             11                 7                 7       
            <5000                      1 (9.1%)              0                 0       
            5000-7000                  6 (54.5%)         3 (42.9%)         5 (71.4%)   
            7000-9000                  4 (36.4%)         3 (42.9%)         2 (28.6%)   
            >9000                          0             1 (14.3%)             0       
        Drug B                                                                         
          Total dose administered                                                      
            n                              4                 8                 8       
            Mean (SD)               7020.0 (1148.9)   5250.0 (864.7)    5940.0 (1187.9)
            Median                      6960.0            5160.0            5880.0     
            Min - Max                 5760 - 8400       4080 - 6480       4320 - 7680  
            n                              4                 8                 8       
            <5000                          0             4 (50.0%)         2 (25.0%)   
            5000-7000                  2 (50.0%)         4 (50.0%)         4 (50.0%)   
            7000-9000                  2 (50.0%)             0             2 (25.0%)   
          Overall duration (days)                                                      
            n                              4                 8                 8       
            Mean (SD)                142.2 (100.3)     105.9 (60.0)      158.2 (96.2)  
            Median                       160.0             95.0              203.0     
            Min - Max                  17 - 232          37 - 211          27 - 249    
            n                              4                 8                 8       
            < 1 month                  1 (25.0%)             0             1 (12.5%)   
            1 to <3 months                 0             4 (50.0%)         2 (25.0%)   
            3 to <6 months             1 (25.0%)         3 (37.5%)             0       
            >=6 months                 2 (50.0%)         1 (12.5%)         5 (62.5%)   

# ext01 works with custom mapping fill in value

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                       A: Drug X        B: Placebo      C: Combination 
        PARCAT2                         (N=15)            (N=15)            (N=15)     
        ———————————————————————————————————————————————————————————————————————————————
        Drug A                                                                         
          Overall duration (days)                                                      
            n                             11                 7                 7       
            Mean (SD)                157.5 (67.4)      115.4 (62.8)       98.6 (68.8)  
            Median                       174.0             119.0             89.0      
            Min - Max                  53 - 239          22 - 219           1 - 182    
            n                             11                 7                 7       
            < 1 month                      0             1 (14.3%)         1 (14.3%)   
            3 to <6 months             3 (27.3%)         4 (57.1%)         2 (28.6%)   
            1 to <3 months             3 (27.3%)         1 (14.3%)         3 (42.9%)   
            >=6 months                 5 (45.5%)         1 (14.3%)         1 (14.3%)   
            > 12 months                    0                 0                 0       
          Total dose administered                                                      
            n                             11                 7                 7       
            Mean (SD)               6567.3 (1127.1)   7028.6 (1626.1)   6377.1 (863.7) 
            Median                      6720.0            7200.0            6480.0     
            Min - Max                 4800 - 8400       5280 - 9360       5280 - 7440  
            n                             11                 7                 7       
            <5000                      1 (9.1%)              0                 0       
            5000-7000                  6 (54.5%)         3 (42.9%)         5 (71.4%)   
            7000-9000                  4 (36.4%)         3 (42.9%)         2 (28.6%)   
            >9000                          0             1 (14.3%)             0       
        Drug B                                                                         
          Overall duration (days)                                                      
            n                              4                 8                 8       
            Mean (SD)                142.2 (100.3)     105.9 (60.0)      158.2 (96.2)  
            Median                       160.0             95.0              203.0     
            Min - Max                  17 - 232          37 - 211          27 - 249    
            n                              4                 8                 8       
            < 1 month                  1 (25.0%)             0             1 (12.5%)   
            3 to <6 months             1 (25.0%)         3 (37.5%)             0       
            1 to <3 months                 0             4 (50.0%)         2 (25.0%)   
            >=6 months                 2 (50.0%)         1 (12.5%)         5 (62.5%)   
            > 12 months                    0                 0                 0       
          Total dose administered                                                      
            n                              4                 8                 8       
            Mean (SD)               7020.0 (1148.9)   5250.0 (864.7)    5940.0 (1187.9)
            Median                      6960.0            5160.0            5880.0     
            Min - Max                 5760 - 8400       4080 - 6480       4320 - 7680  
            n                              4                 8                 8       
            <5000                          0             4 (50.0%)         2 (25.0%)   
            5000-7000                  2 (50.0%)         4 (50.0%)         4 (50.0%)   
            7000-9000                  2 (50.0%)             0             2 (25.0%)   
            >9000                          0                 0                 0       

# ext01 precision argument works as expeted

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                           A: Drug X                B: Placebo              C: Combination     
        PARCAT2                             (N=15)                    (N=15)                    (N=15)         
        ———————————————————————————————————————————————————————————————————————————————————————————————————————
        Drug A                                                                                                 
          Overall duration (days)                                                                              
            n                                 11                         7                         7           
            Mean (SD)                    157.5 (67.4)              115.4 (62.8)               98.6 (68.8)      
            Median                           174.0                     119.0                     89.0          
            Min - Max                      53 - 239                  22 - 219                   1 - 182        
          Total dose administered                                                                              
            n                                 11                         7                         7           
            Mean (SD)               6567.27273 (1127.09441)   7028.57143 (1626.07327)   6377.14286 (863.74599) 
            Median                        6720.00000                7200.00000                6480.00000       
            Min - Max                4800.0000 - 8400.0000     5280.0000 - 9360.0000     5280.0000 - 7440.0000 
        Drug B                                                                                                 
          Overall duration (days)                                                                              
            n                                  4                         8                         8           
            Mean (SD)                    142.2 (100.3)             105.9 (60.0)              158.2 (96.2)      
            Median                           160.0                     95.0                      203.0         
            Min - Max                      17 - 232                  37 - 211                  27 - 249        
          Total dose administered                                                                              
            n                                  4                         8                         8           
            Mean (SD)               7020.00000 (1148.91253)   5250.00000 (864.73778)    5940.00000 (1187.93939)
            Median                        6960.00000                5160.00000                5880.00000       
            Min - Max                5760.0000 - 8400.0000     4080.0000 - 6480.0000     4320.0000 - 7680.0000 

