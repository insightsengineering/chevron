# rmpt01 can handle NA values

    Code
      res1
    Output
        Duration of exposure                       Patients   Person time*
                                                   (N=400)      (N=400)   
        ——————————————————————————————————————————————————————————————————
        Total Number of Patients and Person Time   0 (0.0%)        0      
          < 1 month                                0 (0.0%)        0      
          1 to <3 months                           0 (0.0%)        0      
          3 to <6 months                           0 (0.0%)        0      
          >=6 months                               0 (0.0%)        0      

---

    Code
      res2
    Output
        Parameter Category       Patients   Person time*
          Duration of exposure   (N=400)      (N=400)   
        ————————————————————————————————————————————————
        Drug A                   0 (0.0%)        0      
          < 1 month              0 (0.0%)        0      
          1 to <3 months         0 (0.0%)        0      
          3 to <6 months         0 (0.0%)        0      
          >=6 months             0 (0.0%)        0      
        Drug B                   0 (0.0%)        0      
          < 1 month              0 (0.0%)        0      
          1 to <3 months         0 (0.0%)        0      
          3 to <6 months         0 (0.0%)        0      
          >=6 months             0 (0.0%)        0      

# rmpt01 can handle some NA values

    Code
      res1
    Output
        Duration of exposure                        Patients     Person time*
                                                     (N=400)       (N=400)   
        —————————————————————————————————————————————————————————————————————
        Total Number of Patients and Person Time   204 (51.0%)      25560    
          < 1 month                                 20 (5.0%)        356     
          1 to <3 months                           56 (14.0%)        3128    
          3 to <6 months                           63 (15.8%)        8013    
          >=6 months                               65 (16.2%)       14063    

---

    Code
      res2
    Output
        Parameter Category        Patients     Person time*
          Duration of exposure     (N=400)       (N=400)   
        ———————————————————————————————————————————————————
        Drug A                   111 (27.8%)      14593    
          < 1 month               12 (3.0%)        188     
          1 to <3 months          23 (5.8%)        1267    
          3 to <6 months          37 (9.2%)        4719    
          >=6 months              39 (9.8%)        8419    
        Drug B                   93 (23.2%)       10967    
          < 1 month               8 (2.0%)         168     
          1 to <3 months          33 (8.2%)        1861    
          3 to <6 months          26 (6.5%)        3294    
          >=6 months              26 (6.5%)        5644    

