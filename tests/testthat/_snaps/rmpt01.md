# rmpt01 can handle different time units

    Code
      res
    Output
        Duration of exposure                        Number of Patients   Patient Time*
                                                         (N=400)            (N=400)   
        ——————————————————————————————————————————————————————————————————————————————
        Total Number of Patients and Patient Time      400 (100.0%)       61088.0625  
          < 1 month                                     37 (9.2%)              0      
          1 to <3 months                                69 (17.2%)         3256.8125  
          3 to <6 months                               113 (28.2%)        14031.6875  
          >=6 months                                   181 (45.2%)        43799.5625  

# rmpt01 can handle NA values

    Code
      res
    Output
        Duration of exposure                        Number of Patients   Patient Time*
                                                         (N=400)            (N=400)   
        ——————————————————————————————————————————————————————————————————————————————
        Total Number of Patients and Patient Time        0 (0.0%)              0      
          < 1 month                                      0 (0.0%)              0      
          1 to <3 months                                 0 (0.0%)              0      
          3 to <6 months                                 0 (0.0%)              0      
          >=6 months                                     0 (0.0%)              0      

# rmpt01 can handle some NA values

    Code
      res
    Output
        Duration of exposure                        Number of Patients   Patient Time*
                                                         (N=400)            (N=400)   
        ——————————————————————————————————————————————————————————————————————————————
        Total Number of Patients and Patient Time      188 (47.0%)           28381    
          < 1 month                                      0 (0.0%)              0      
          1 to <3 months                                 0 (0.0%)              0      
          3 to <6 months                               153 (38.2%)           21657    
          >=6 months                                    35 (8.8%)            6724     

