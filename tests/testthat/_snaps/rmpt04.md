# rmpt04 function with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                              Patients     Person time
        ETHNIC                                (N=400)        (N=400)  
        ——————————————————————————————————————————————————————————————
        NOT REPORTED                         27 (6.8%)        3315    
        HISPANIC OR LATINO                   48 (12.0%)       4636    
        NOT HISPANIC OR LATINO              308 (77.0%)       39229   
        UNKNOWN                              17 (4.2%)        2520    
        Total patients number/person time   400 (100.0%)      49700   

# rmpt04 can handle NA values

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
                                            Patients   Person time
        ETHNIC                              (N=400)      (N=400)  
        ——————————————————————————————————————————————————————————
        NOT REPORTED                        0 (0.0%)        0     
        HISPANIC OR LATINO                  0 (0.0%)        0     
        NOT HISPANIC OR LATINO              0 (0.0%)        0     
        UNKNOWN                             0 (0.0%)        0     
        Total patients number/person time   0 (0.0%)        0     

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
                                            Patients   Person time
        ETHNIC                              (N=400)      (N=400)  
        ——————————————————————————————————————————————————————————
        NOT REPORTED                        0 (0.0%)        0     
        HISPANIC OR LATINO                  0 (0.0%)        0     
        NOT HISPANIC OR LATINO              0 (0.0%)        0     
        UNKNOWN                             0 (0.0%)        0     
        Total patients number/person time   0 (0.0%)        0     

# rmpt04 can handle some NA values

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
                                             Patients     Person time
        ETHNIC                                (N=400)       (N=400)  
        —————————————————————————————————————————————————————————————
        NOT REPORTED                         27 (6.8%)       3315    
        HISPANIC OR LATINO                   0 (0.0%)          0     
        NOT HISPANIC OR LATINO              308 (77.0%)      39229   
        UNKNOWN                              17 (4.2%)       2520    
        Total patients number/person time   352 (88.0%)      45064   

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
                                              Patients     Person time
        ETHNIC                                (N=400)        (N=400)  
        ——————————————————————————————————————————————————————————————
        NOT REPORTED                         27 (6.8%)        3315    
        HISPANIC OR LATINO                   47 (11.8%)       4387    
        NOT HISPANIC OR LATINO              307 (76.8%)       39161   
        UNKNOWN                              17 (4.2%)        2520    
        <Missing>                             2 (0.5%)         317    
        Total patients number/person time   400 (100.0%)      49700   

