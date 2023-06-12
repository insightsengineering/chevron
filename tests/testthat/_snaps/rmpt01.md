# rmpt01 function with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                              Patients     Person time
        Duration of exposure                  (N=400)        (N=400)  
        ——————————————————————————————————————————————————————————————
        < 1 month                            39 (9.8%)         728    
        1 to <3 months                      111 (27.8%)       6418    
        3 to <6 months                      136 (34.0%)       17645   
        >=6 months                          114 (28.5%)       24909   
        Total patients number/person time   400 (100.0%)      49700   

# rmpt01 can handle NA values

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
                                            Patients   Person time
        Duration of exposure                (N=400)      (N=400)  
        ——————————————————————————————————————————————————————————
        < 1 month                           0 (0.0%)        0     
        1 to <3 months                      0 (0.0%)        0     
        3 to <6 months                      0 (0.0%)        0     
        >=6 months                          0 (0.0%)        0     
        Total patients number/person time   0 (0.0%)        0     

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
                                            Patients   Person time
        Duration of exposure                (N=400)      (N=400)  
        ——————————————————————————————————————————————————————————
        < 1 month                           0 (0.0%)        0     
        1 to <3 months                      0 (0.0%)        0     
        3 to <6 months                      0 (0.0%)        0     
        >=6 months                          0 (0.0%)        0     
        Total patients number/person time   0 (0.0%)        0     
        Drug A                                                    
        < 1 month                           0 (0.0%)        0     
        1 to <3 months                      0 (0.0%)        0     
        3 to <6 months                      0 (0.0%)        0     
        >=6 months                          0 (0.0%)        0     
        Total patients number/person time   0 (0.0%)        0     
        Drug B                                                    
        < 1 month                           0 (0.0%)        0     
        1 to <3 months                      0 (0.0%)        0     
        3 to <6 months                      0 (0.0%)        0     
        >=6 months                          0 (0.0%)        0     
        Total patients number/person time   0 (0.0%)        0     

# rmpt01 can handle some NA values

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
                                             Patients     Person time
        Duration of exposure                  (N=400)       (N=400)  
        —————————————————————————————————————————————————————————————
        < 1 month                            20 (5.0%)        356    
        1 to <3 months                      56 (14.0%)       3128    
        3 to <6 months                      63 (15.8%)       8013    
        >=6 months                          65 (16.2%)       14063   
        Total patients number/person time   204 (51.0%)      25560   

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
                                             Patients     Person time
        Duration of exposure                  (N=400)       (N=400)  
        —————————————————————————————————————————————————————————————
        < 1 month                            20 (5.0%)        356    
        1 to <3 months                      56 (14.0%)       3128    
        3 to <6 months                      63 (15.8%)       8013    
        >=6 months                          65 (16.2%)       14063   
        Total patients number/person time   204 (51.0%)      25560   
        Drug A                                                       
        < 1 month                            12 (3.0%)        188    
        1 to <3 months                       23 (5.8%)       1267    
        3 to <6 months                       37 (9.2%)       4719    
        >=6 months                           39 (9.8%)       8419    
        Total patients number/person time   111 (27.8%)      14593   
        Drug B                                                       
        < 1 month                            8 (2.0%)         168    
        1 to <3 months                       33 (8.2%)       1861    
        3 to <6 months                       26 (6.5%)       3294    
        >=6 months                           26 (6.5%)       5644    
        Total patients number/person time   93 (23.2%)       10967   

