# rmpt05 function with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                      Patients     Person time
        RACE                                          (N=400)        (N=400)  
        ——————————————————————————————————————————————————————————————————————
        ASIAN                                       208 (52.0%)       25754   
        BLACK OR AFRICAN AMERICAN                    91 (22.8%)       10718   
        WHITE                                        74 (18.5%)       9612    
        AMERICAN INDIAN OR ALASKA NATIVE             25 (6.2%)        3348    
        MULTIPLE                                      1 (0.2%)         219    
        NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER     1 (0.2%)         49     
        OTHER                                         0 (0.0%)          0     
        UNKNOWN                                       0 (0.0%)          0     
        Total patients number/person time           400 (100.0%)      49700   

# rmpt05 can handle NA values

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
                                                    Patients   Person time
        RACE                                        (N=400)      (N=400)  
        ——————————————————————————————————————————————————————————————————
        ASIAN                                       0 (0.0%)        0     
        BLACK OR AFRICAN AMERICAN                   0 (0.0%)        0     
        WHITE                                       0 (0.0%)        0     
        AMERICAN INDIAN OR ALASKA NATIVE            0 (0.0%)        0     
        MULTIPLE                                    0 (0.0%)        0     
        NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER   0 (0.0%)        0     
        OTHER                                       0 (0.0%)        0     
        UNKNOWN                                     0 (0.0%)        0     
        Total patients number/person time           0 (0.0%)        0     

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
                                                    Patients   Person time
        RACE                                        (N=400)      (N=400)  
        ——————————————————————————————————————————————————————————————————
        ASIAN                                       0 (0.0%)        0     
        BLACK OR AFRICAN AMERICAN                   0 (0.0%)        0     
        WHITE                                       0 (0.0%)        0     
        AMERICAN INDIAN OR ALASKA NATIVE            0 (0.0%)        0     
        MULTIPLE                                    0 (0.0%)        0     
        NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER   0 (0.0%)        0     
        OTHER                                       0 (0.0%)        0     
        UNKNOWN                                     0 (0.0%)        0     
        Total patients number/person time           0 (0.0%)        0     

# rmpt05 can handle some NA values

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
                                                      Patients     Person time
        RACE                                          (N=400)        (N=400)  
        ——————————————————————————————————————————————————————————————————————
        ASIAN                                       208 (52.0%)       25754   
        BLACK OR AFRICAN AMERICAN                    91 (22.8%)       10718   
        WHITE                                        74 (18.5%)       9612    
        AMERICAN INDIAN OR ALASKA NATIVE             25 (6.2%)        3348    
        MULTIPLE                                      1 (0.2%)         219    
        NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER     1 (0.2%)         49     
        OTHER                                         0 (0.0%)          0     
        UNKNOWN                                       0 (0.0%)          0     
        Total patients number/person time           400 (100.0%)      49700   

