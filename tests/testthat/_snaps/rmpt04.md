# rmpt04 function with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                             Patients     Person time
        ETHNIC                                (N=45)        (N=45)   
        —————————————————————————————————————————————————————————————
        HISPANIC OR LATINO                   2 (4.4%)         309    
        NOT HISPANIC OR LATINO              41 (91.1%)       5555    
        NOT REPORTED                         2 (4.4%)         49     
        Total patients number/person time   45 (100.0%)      5913    

# rmpt04 can handle NA values

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
                                            Patients   Person time
        ETHNIC                               (N=45)      (N=45)   
        ——————————————————————————————————————————————————————————
        HISPANIC OR LATINO                  0 (0.0%)        0     
        NOT HISPANIC OR LATINO              0 (0.0%)        0     
        NOT REPORTED                        0 (0.0%)        0     
        Total patients number/person time   0 (0.0%)        0     

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
                                            Patients   Person time
        ETHNIC                               (N=45)      (N=45)   
        ——————————————————————————————————————————————————————————
        HISPANIC OR LATINO                  0 (0.0%)        0     
        NOT HISPANIC OR LATINO              0 (0.0%)        0     
        NOT REPORTED                        0 (0.0%)        0     
        Total patients number/person time   0 (0.0%)        0     

# rmpt04 can handle some NA values

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
                                             Patients    Person time
        ETHNIC                                (N=45)       (N=45)   
        ————————————————————————————————————————————————————————————
        HISPANIC OR LATINO                   0 (0.0%)         0     
        NOT HISPANIC OR LATINO              41 (91.1%)      5555    
        NOT REPORTED                         2 (4.4%)        49     
        Total patients number/person time   43 (95.6%)      5604    

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
                                             Patients     Person time
        ETHNIC                                (N=45)        (N=45)   
        —————————————————————————————————————————————————————————————
        HISPANIC OR LATINO                   2 (4.4%)         309    
        NOT HISPANIC OR LATINO              39 (86.7%)       5267    
        NOT REPORTED                         2 (4.4%)         49     
        <Missing>                            2 (4.4%)         288    
        Total patients number/person time   45 (100.0%)      5913    

