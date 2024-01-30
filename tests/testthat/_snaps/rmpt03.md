# rmpt03 function with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                        F                           M               All Genders
                                             Patients     Person time    Patients     Person time    Patients  
        Age Group                             (N=30)        (N=30)        (N=15)        (N=15)        (N=45)   
        ———————————————————————————————————————————————————————————————————————————————————————————————————————
        <65                                 30 (100.0%)      4088       15 (100.0%)      1825       45 (100.0%)
        Total patients number/person time   30 (100.0%)      4088       15 (100.0%)      1825       45 (100.0%)
      \s\n                                      All Genders
                                            Person time
        Age Group                             (N=45)   
        ———————————————————————————————————————————————
        <65                                    5913    
        Total patients number/person time      5913    

# rmpt03 can handle NA values

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
                                                                                                All   
                                                      F                        M              Genders 
                                            Patients   Person time   Patients   Person time   Patients
        Age Group                            (N=30)      (N=30)       (N=15)      (N=15)       (N=45) 
        ——————————————————————————————————————————————————————————————————————————————————————————————
        <65                                 0 (0.0%)        0        0 (0.0%)        0        0 (0.0%)
        Total patients number/person time   0 (0.0%)        0        0 (0.0%)        0        0 (0.0%)
      \s\n                                      All Genders
                                            Person time
        Age Group                             (N=45)   
        ———————————————————————————————————————————————
        <65                                      0     
        Total patients number/person time        0     

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
                                                                                                All   
                                                      F                        M              Genders 
                                            Patients   Person time   Patients   Person time   Patients
        Age Group                            (N=30)      (N=30)       (N=15)      (N=15)       (N=45) 
        ——————————————————————————————————————————————————————————————————————————————————————————————
        <65                                 0 (0.0%)        0        0 (0.0%)        0        0 (0.0%)
        Total patients number/person time   0 (0.0%)        0        0 (0.0%)        0        0 (0.0%)
        Drug A                                                                                        
        <65                                 0 (0.0%)        0        0 (0.0%)        0        0 (0.0%)
        Total patients number/person time   0 (0.0%)        0        0 (0.0%)        0        0 (0.0%)
        Drug B                                                                                        
        <65                                 0 (0.0%)        0        0 (0.0%)        0        0 (0.0%)
        Total patients number/person time   0 (0.0%)        0        0 (0.0%)        0        0 (0.0%)
      \s\n                                      All Genders
                                            Person time
        Age Group                             (N=45)   
        ———————————————————————————————————————————————
        <65                                      0     
        Total patients number/person time        0     
        Drug A                                         
        <65                                      0     
        Total patients number/person time        0     
        Drug B                                         
        <65                                      0     
        Total patients number/person time        0     

# rmpt03 can handle some NA values

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
                                                                                                    All    
                                                       F                          M               Genders  
                                             Patients    Person time   Patients    Person time    Patients 
        Age Group                             (N=30)       (N=30)       (N=15)       (N=15)        (N=45)  
        ———————————————————————————————————————————————————————————————————————————————————————————————————
        <65                                 18 (60.0%)      2034       7 (46.7%)       919       25 (55.6%)
        Total patients number/person time   18 (60.0%)      2034       7 (46.7%)       919       25 (55.6%)
      \s\n                                      All Genders
                                            Person time
        Age Group                             (N=45)   
        ———————————————————————————————————————————————
        <65                                    2953    
        Total patients number/person time      2953    

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
                                                                                                    All    
                                                       F                          M               Genders  
                                             Patients    Person time   Patients    Person time    Patients 
        Age Group                             (N=30)       (N=30)       (N=15)       (N=15)        (N=45)  
        ———————————————————————————————————————————————————————————————————————————————————————————————————
        <65                                 18 (60.0%)      2034       7 (46.7%)       919       25 (55.6%)
        Total patients number/person time   18 (60.0%)      2034       7 (46.7%)       919       25 (55.6%)
        Drug A                                                                                             
        <65                                 11 (36.7%)      1329       4 (26.7%)       592       15 (33.3%)
        Total patients number/person time   11 (36.7%)      1329       4 (26.7%)       592       15 (33.3%)
        Drug B                                                                                             
        <65                                 7 (23.3%)        705       3 (20.0%)       327       10 (22.2%)
        Total patients number/person time   7 (23.3%)        705       3 (20.0%)       327       10 (22.2%)
      \s\n                                      All Genders
                                            Person time
        Age Group                             (N=45)   
        ———————————————————————————————————————————————
        <65                                    2953    
        Total patients number/person time      2953    
        Drug A                                         
        <65                                    1921    
        Total patients number/person time      1921    
        Drug B                                         
        <65                                    1032    
        Total patients number/person time      1032    

