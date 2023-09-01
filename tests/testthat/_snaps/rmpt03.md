# rmpt03 function with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                        F                            M             
        Age Group                             Patients     Person time     Patients     Person time
                                              (N=231)        (N=231)       (N=169)        (N=169)  
        ———————————————————————————————————————————————————————————————————————————————————————————
        <65                                 231 (100.0%)      27364      168 (99.4%)       22124   
        >=65                                  0 (0.0%)          0          1 (0.6%)         212    
        Total patients number/person time   231 (100.0%)      27364      169 (100.0%)      22336   
      \s\n                                             All Genders        
        Age Group                             Patients     Person time
                                              (N=400)        (N=400)  
        ——————————————————————————————————————————————————————————————
        <65                                 399 (99.8%)       49488   
        >=65                                  1 (0.2%)         212    
        Total patients number/person time   400 (100.0%)      49700   

# rmpt03 can handle NA values

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
        Age Group                                                                               All   
                                                      F                        M              Genders 
                                            Patients   Person time   Patients   Person time   Patients
                                            (N=231)      (N=231)     (N=169)      (N=169)     (N=400) 
        ——————————————————————————————————————————————————————————————————————————————————————————————
        <65                                 0 (0.0%)        0        0 (0.0%)        0        0 (0.0%)
        >=65                                0 (0.0%)        0        0 (0.0%)        0        0 (0.0%)
        Total patients number/person time   0 (0.0%)        0        0 (0.0%)        0        0 (0.0%)
      \s\n                                      All Genders
        Age Group                           Person time
                                              (N=400)  
        ———————————————————————————————————————————————
        <65                                      0     
        >=65                                     0     
        Total patients number/person time        0     

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
        Age Group                                                                               All   
                                                      F                        M              Genders 
                                            Patients   Person time   Patients   Person time   Patients
                                            (N=231)      (N=231)     (N=169)      (N=169)     (N=400) 
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
      \s\n                                      All Genders
        Age Group                           Person time
                                              (N=400)  
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
                                                        F                          M               All Genders
        Age Group                            Patients     Person time    Patients    Person time    Patients  
                                              (N=231)       (N=231)      (N=169)       (N=169)       (N=400)  
        ——————————————————————————————————————————————————————————————————————————————————————————————————————
        <65                                 124 (53.7%)      15000      80 (47.3%)      10560      204 (51.0%)
        >=65                                 0 (0.0%)          0         0 (0.0%)         0         0 (0.0%)  
        Total patients number/person time   124 (53.7%)      15000      80 (47.3%)      10560      204 (51.0%)
      \s\n                                      All Genders
        Age Group                           Person time
                                              (N=400)  
        ———————————————————————————————————————————————
        <65                                    25560   
        >=65                                     0     
        Total patients number/person time      25560   

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
                                                        F                          M               All Genders
        Age Group                            Patients     Person time    Patients    Person time    Patients  
                                              (N=231)       (N=231)      (N=169)       (N=169)       (N=400)  
        ——————————————————————————————————————————————————————————————————————————————————————————————————————
        <65                                 124 (53.7%)      15000      80 (47.3%)      10560      204 (51.0%)
        >=65                                 0 (0.0%)          0         0 (0.0%)         0         0 (0.0%)  
        Total patients number/person time   124 (53.7%)      15000      80 (47.3%)      10560      204 (51.0%)
        Drug A                                                                                                
        <65                                 73 (31.6%)       9605       38 (22.5%)      4988       111 (27.8%)
        >=65                                 0 (0.0%)          0         0 (0.0%)         0         0 (0.0%)  
        Total patients number/person time   73 (31.6%)       9605       38 (22.5%)      4988       111 (27.8%)
        Drug B                                                                                                
        <65                                 51 (22.1%)       5395       42 (24.9%)      5572       93 (23.2%) 
        >=65                                 0 (0.0%)          0         0 (0.0%)         0         0 (0.0%)  
        Total patients number/person time   51 (22.1%)       5395       42 (24.9%)      5572       93 (23.2%) 
      \s\n                                      All Genders
        Age Group                           Person time
                                              (N=400)  
        ———————————————————————————————————————————————
        <65                                    25560   
        >=65                                     0     
        Total patients number/person time      25560   
        Drug A                                         
        <65                                    14593   
        >=65                                     0     
        Total patients number/person time      14593   
        Drug B                                         
        <65                                    10967   
        >=65                                     0     
        Total patients number/person time      10967   

