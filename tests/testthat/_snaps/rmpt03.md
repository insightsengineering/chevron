# rmpt03 function with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                   All Genders                       F             
        Age Group                             Patients     Person time     Patients     Person time
                                              (N=400)        (N=400)       (N=231)        (N=231)  
        ———————————————————————————————————————————————————————————————————————————————————————————
        <65                                 399 (99.8%)       49488      231 (100.0%)      27364   
        >=65                                  1 (0.2%)         212         0 (0.0%)          0     
        Total patients number/person time   400 (100.0%)      49700      231 (100.0%)      27364   
      \s\n                                                  M             
        Age Group                             Patients     Person time
                                              (N=169)        (N=169)  
        ——————————————————————————————————————————————————————————————
        <65                                 168 (99.4%)       22124   
        >=65                                  1 (0.6%)         212    
        Total patients number/person time   169 (100.0%)      22336   

# rmpt03 can handle NA values

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
                                                 All Genders                   F                 M    
        Age Group                           Patients   Person time   Patients   Person time   Patients
                                            (N=400)      (N=400)     (N=231)      (N=231)     (N=169) 
        ——————————————————————————————————————————————————————————————————————————————————————————————
        <65                                 0 (0.0%)        0        0 (0.0%)        0        0 (0.0%)
        >=65                                0 (0.0%)        0        0 (0.0%)        0        0 (0.0%)
        Total patients number/person time   0 (0.0%)        0        0 (0.0%)        0        0 (0.0%)
      \s\n                                           M     
        Age Group                           Person time
                                              (N=169)  
        ———————————————————————————————————————————————
        <65                                      0     
        >=65                                     0     
        Total patients number/person time        0     

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
                                                 All Genders                   F                 M    
        Age Group                           Patients   Person time   Patients   Person time   Patients
                                            (N=400)      (N=400)     (N=231)      (N=231)     (N=169) 
        ——————————————————————————————————————————————————————————————————————————————————————————————
        <65                                 0 (0.0%)        0        0 (0.0%)        0        0 (0.0%)
        >=65                                0 (0.0%)        0        0 (0.0%)        0        0 (0.0%)
        Total patients number/person time   0 (0.0%)        0        0 (0.0%)        0        0 (0.0%)
        Drug A                                                                                        
        <65                                 0 (0.0%)        0        0 (0.0%)        0        0 (0.0%)
        >=65                                0 (0.0%)        0        0 (0.0%)        0        0 (0.0%)
        Total patients number/person time   0 (0.0%)        0        0 (0.0%)        0        0 (0.0%)
        Drug B                                                                                        
        <65                                 0 (0.0%)        0        0 (0.0%)        0        0 (0.0%)
        >=65                                0 (0.0%)        0        0 (0.0%)        0        0 (0.0%)
        Total patients number/person time   0 (0.0%)        0        0 (0.0%)        0        0 (0.0%)
      \s\n                                           M     
        Age Group                           Person time
                                              (N=169)  
        ———————————————————————————————————————————————
        <65                                      0     
        >=65                                     0     
        Total patients number/person time        0     
        Drug A                                         
        <65                                      0     
        >=65                                     0     
        Total patients number/person time        0     
        Drug B                                         
        <65                                      0     
        >=65                                     0     
        Total patients number/person time        0     

# rmpt03 can handle some NA values

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
                                                   All Genders                      F                   M     
        Age Group                            Patients     Person time    Patients     Person time    Patients 
                                              (N=400)       (N=400)       (N=231)       (N=231)      (N=169)  
        ——————————————————————————————————————————————————————————————————————————————————————————————————————
        <65                                 204 (51.0%)      25560      124 (53.7%)      15000      80 (47.3%)
        >=65                                 0 (0.0%)          0         0 (0.0%)          0         0 (0.0%) 
        Total patients number/person time   204 (51.0%)      25560      124 (53.7%)      15000      80 (47.3%)
      \s\n                                           M     
        Age Group                           Person time
                                              (N=169)  
        ———————————————————————————————————————————————
        <65                                    10560   
        >=65                                     0     
        Total patients number/person time      10560   

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
                                                   All Genders                      F                   M     
        Age Group                            Patients     Person time    Patients     Person time    Patients 
                                              (N=400)       (N=400)       (N=231)       (N=231)      (N=169)  
        ——————————————————————————————————————————————————————————————————————————————————————————————————————
        <65                                 204 (51.0%)      25560      124 (53.7%)      15000      80 (47.3%)
        >=65                                 0 (0.0%)          0         0 (0.0%)          0         0 (0.0%) 
        Total patients number/person time   204 (51.0%)      25560      124 (53.7%)      15000      80 (47.3%)
        Drug A                                                                                                
        <65                                 111 (27.8%)      14593      73 (31.6%)       9605       38 (22.5%)
        >=65                                 0 (0.0%)          0         0 (0.0%)          0         0 (0.0%) 
        Total patients number/person time   111 (27.8%)      14593      73 (31.6%)       9605       38 (22.5%)
        Drug B                                                                                                
        <65                                 93 (23.2%)       10967      51 (22.1%)       5395       42 (24.9%)
        >=65                                 0 (0.0%)          0         0 (0.0%)          0         0 (0.0%) 
        Total patients number/person time   93 (23.2%)       10967      51 (22.1%)       5395       42 (24.9%)
      \s\n                                           M     
        Age Group                           Person time
                                              (N=169)  
        ———————————————————————————————————————————————
        <65                                    10560   
        >=65                                     0     
        Total patients number/person time      10560   
        Drug A                                         
        <65                                    4988    
        >=65                                     0     
        Total patients number/person time      4988    
        Drug B                                         
        <65                                    5572    
        >=65                                     0     
        Total patients number/person time      5572    

