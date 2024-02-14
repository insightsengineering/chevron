# rmpt05 function with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                             Patients     Person time
        RACE                                  (N=45)        (N=45)   
        —————————————————————————————————————————————————————————————
        ASIAN                               26 (57.8%)       3309    
        BLACK OR AFRICAN AMERICAN            9 (20.0%)       1139    
        WHITE                                7 (15.6%)       1231    
        AMERICAN INDIAN OR ALASKA NATIVE     3 (6.7%)         234    
        Total patients number/person time   45 (100.0%)      5913    

# rmpt05 can handle NA values

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
                                            Patients   Person time
        RACE                                 (N=45)      (N=45)   
        ——————————————————————————————————————————————————————————
        ASIAN                               0 (0.0%)        0     
        BLACK OR AFRICAN AMERICAN           0 (0.0%)        0     
        WHITE                               0 (0.0%)        0     
        AMERICAN INDIAN OR ALASKA NATIVE    0 (0.0%)        0     
        Total patients number/person time   0 (0.0%)        0     

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
                                            Patients   Person time
        RACE                                 (N=45)      (N=45)   
        ——————————————————————————————————————————————————————————
        ASIAN                               0 (0.0%)        0     
        BLACK OR AFRICAN AMERICAN           0 (0.0%)        0     
        WHITE                               0 (0.0%)        0     
        AMERICAN INDIAN OR ALASKA NATIVE    0 (0.0%)        0     
        Total patients number/person time   0 (0.0%)        0     

# rmpt05 can handle some NA values

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
                                             Patients     Person time
        RACE                                  (N=45)        (N=45)   
        —————————————————————————————————————————————————————————————
        ASIAN                               26 (57.8%)       3309    
        BLACK OR AFRICAN AMERICAN            9 (20.0%)       1139    
        WHITE                                7 (15.6%)       1231    
        AMERICAN INDIAN OR ALASKA NATIVE     3 (6.7%)         234    
        Total patients number/person time   45 (100.0%)      5913    

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
                                             Patients     Person time
        RACE                                  (N=45)        (N=45)   
        —————————————————————————————————————————————————————————————
        AMERICAN INDIAN OR ALASKA NATIVE     3 (6.7%)         234    
        ASIAN                               25 (55.6%)       3127    
        BLACK OR AFRICAN AMERICAN            8 (17.8%)       1033    
        WHITE                                7 (15.6%)       1231    
        <Missing>                            2 (4.4%)         288    
        Total patients number/person time   45 (100.0%)      5913    

