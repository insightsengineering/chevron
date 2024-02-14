# rmpt01 function with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                             Patients     Person time
        Duration of exposure                  (N=45)        (N=45)   
        —————————————————————————————————————————————————————————————
        < 1 month                            4 (8.9%)         67     
        1 to <3 months                      13 (28.9%)        837    
        3 to <6 months                      13 (28.9%)       1728    
        >=6 months                          15 (33.3%)       3281    
        Total patients number/person time   45 (100.0%)      5913    

# rmpt01 can handle NA values

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
                                            Patients   Person time
        Duration of exposure                 (N=45)      (N=45)   
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
        Duration of exposure                 (N=45)      (N=45)   
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
                                             Patients    Person time
        Duration of exposure                  (N=45)       (N=45)   
        ————————————————————————————————————————————————————————————
        < 1 month                            3 (6.7%)        45     
        1 to <3 months                      9 (20.0%)        587    
        3 to <6 months                      6 (13.3%)        784    
        >=6 months                          7 (15.6%)       1537    
        Total patients number/person time   25 (55.6%)      2953    

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
                                             Patients    Person time
        Duration of exposure                  (N=45)       (N=45)   
        ————————————————————————————————————————————————————————————
        < 1 month                            3 (6.7%)        45     
        1 to <3 months                      9 (20.0%)        587    
        3 to <6 months                      6 (13.3%)        784    
        >=6 months                          7 (15.6%)       1537    
        Total patients number/person time   25 (55.6%)      2953    
        Drug A                                                      
        < 1 month                            1 (2.2%)         1     
        1 to <3 months                      5 (11.1%)        333    
        3 to <6 months                       4 (8.9%)        510    
        >=6 months                          5 (11.1%)       1077    
        Total patients number/person time   15 (33.3%)      1921    
        Drug B                                                      
        < 1 month                            2 (4.4%)        44     
        1 to <3 months                       4 (8.9%)        254    
        3 to <6 months                       2 (4.4%)        274    
        >=6 months                           2 (4.4%)        460    
        Total patients number/person time   10 (22.2%)      1032    

