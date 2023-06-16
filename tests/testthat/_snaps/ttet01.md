# ttet01 works as expected

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                         A: Drug X      B: Placebo    C: Combination
                                          (N=134)        (N=134)         (N=132)    
      ——————————————————————————————————————————————————————————————————————————————
      Patients with event (%)            86 (64.2%)     90 (67.2%)      92 (69.7%)  
        Earliest contributing event                                                 
          Adverse Event                      0              0               0       
          Death                          38 (44.2%)     48 (53.3%)      41 (44.6%)  
          Disease Progression            48 (55.8%)     42 (46.7%)      51 (55.4%)  
          Last Date Known To Be Alive        0              0               0       
          Last Tumor Assessment              0              0               0       
      Patients without event (%)         48 (35.8%)     44 (32.8%)      40 (30.3%)  
      Time to Event (MONTHS)                                                        
        Median                              16.9           19.7            12.3     
          95% CI                        (12.8, 19.0)   (13.2, 25.2)    (8.4, 14.9)  
        25% and 75%-ile                  7.7, 30.0      7.2, 34.1       4.5, 25.3   
        Range (censored)                0.3 to 65.9    0.4 to 83.0     1.0 to 81.8  
        Range (event)                   0.5 to 85.8    0.1 to 58.7     0.2 to 77.8  
      Unstratified Analysis                                                         
        p-value (log-rank)                                0.4808          0.0429    
        Hazard Ratio                                       0.90            1.36     
        95% CI                                         (0.67, 1.21)    (1.01, 1.82) 
      180 MONTHS                                                                    
        Patients remaining at risk           NA             NA              NA      
        Event Free Rate (%)                  NA             NA              NA      
        95% CI                               NA             NA              NA      
        Difference in Event Free Rate                       NA              NA      
          95% CI                                            NA              NA      
          p-value (Z-test)                                  NA              NA      
      360 MONTHS                                                                    
        Patients remaining at risk           NA             NA              NA      
        Event Free Rate (%)                  NA             NA              NA      
        95% CI                               NA             NA              NA      
        Difference in Event Free Rate                       NA              NA      
          95% CI                                            NA              NA      
          p-value (Z-test)                                  NA              NA      

# ttet01 works as expected for stratified and unstratified analysis

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                            A: Drug X        B: Placebo      C: Combination
                                             (N=134)           (N=134)          (N=132)    
        ———————————————————————————————————————————————————————————————————————————————————
        Patients with event (%)             86 (64.2%)       90 (67.2%)        92 (69.7%)  
        Patients without event (%)          48 (35.8%)       44 (32.8%)        40 (30.3%)  
        Time to Event (MONTHS)                                                             
          Median                               16.9             19.7              12.3     
            95% CI                         (12.8, 19.0)     (13.2, 25.2)      (8.4, 14.9)  
          25% and 75%-ile                   7.7, 30.0         7.2, 34.1        4.5, 25.3   
          Range (censored)                 0.3 to 65.9       0.4 to 83.0      1.0 to 81.8  
          Range (event)                    0.5 to 85.8       0.1 to 58.7      0.2 to 77.8  
        Unstratified Analysis                                                              
          p-value (log-rank)                                   0.4808            0.0429    
          Hazard Ratio                                          0.90              1.36     
          95% CI                                            (0.67, 1.21)      (1.01, 1.82) 
        6 MONTHS                                                                           
          Patients remaining at risk            87               92                77      
          Event Free Rate (%)                 77.27             77.85            67.70     
          95% CI                          (68.76, 83.74)   (69.53, 84.15)    (58.64, 75.20)
          Difference in Event Free Rate                         0.57             -9.57     
            95% CI                                         (-9.82, 10.97)    (-20.70, 1.57)
            p-value (Z-test)                                   0.9137            0.0921    
        12 MONTHS                                                                          
          Patients remaining at risk            65               68                51      
          Event Free Rate (%)                 62.83             62.69            50.16     
          95% CI                          (53.36, 70.91)   (53.31, 70.71)    (40.69, 58.89)
          Difference in Event Free Rate                         -0.14            -12.68    
            95% CI                                         (-12.53, 12.25)   (-25.38, 0.03)
            p-value (Z-test)                                   0.9822            0.0505    

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                            A: Drug X        B: Placebo      C: Combination
                                             (N=134)           (N=134)          (N=132)    
        ———————————————————————————————————————————————————————————————————————————————————
        Patients with event (%)             86 (64.2%)       90 (67.2%)        92 (69.7%)  
          Earliest contributing event                                                      
            Death                           38 (44.2%)       48 (53.3%)        41 (44.6%)  
            Disease Progression             48 (55.8%)       42 (46.7%)        51 (55.4%)  
        Patients without event (%)          48 (35.8%)       44 (32.8%)        40 (30.3%)  
        Time to Event (MONTHS)                                                             
          Median                               16.9             19.7              12.3     
            95% CI                         (12.8, 19.0)     (13.2, 25.2)      (8.4, 14.9)  
          25% and 75%-ile                   7.7, 30.0         7.2, 34.1        4.5, 25.3   
          Range (censored)                 0.3 to 65.9       0.4 to 83.0      1.0 to 81.8  
          Range (event)                    0.5 to 85.8       0.1 to 58.7      0.2 to 77.8  
        Stratified Analysis                                                                
          p-value (log-rank)                                   0.8068            0.0252    
          Hazard Ratio                                          0.96              1.42     
          95% CI                                            (0.71, 1.31)      (1.04, 1.92) 
        Unstratified Analysis                                                              
          p-value (log-rank)                                   0.4808            0.0429    
          Hazard Ratio                                          0.90              1.36     
          95% CI                                            (0.67, 1.21)      (1.01, 1.82) 
        6 MONTHS                                                                           
          Patients remaining at risk            87               92                77      
          Event Free Rate (%)                 77.27             77.85            67.70     
          95% CI                          (68.76, 83.74)   (69.53, 84.15)    (58.64, 75.20)
          Difference in Event Free Rate                         0.57             -9.57     
            95% CI                                         (-9.82, 10.97)    (-20.70, 1.57)
            p-value (Z-test)                                   0.9137            0.0921    
        12 MONTHS                                                                          
          Patients remaining at risk            65               68                51      
          Event Free Rate (%)                 62.83             62.69            50.16     
          95% CI                          (53.36, 70.91)   (53.31, 70.71)    (40.69, 58.89)
          Difference in Event Free Rate                         -0.14            -12.68    
            95% CI                                         (-12.53, 12.25)   (-25.38, 0.03)
            p-value (Z-test)                                   0.9822            0.0505    

# ttet01 works as expected for stratified analysis only

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                            A: Drug X        B: Placebo      C: Combination
                                             (N=134)           (N=134)          (N=132)    
        ———————————————————————————————————————————————————————————————————————————————————
        Patients with event (%)             86 (64.2%)       90 (67.2%)        92 (69.7%)  
        Patients without event (%)          48 (35.8%)       44 (32.8%)        40 (30.3%)  
        Time to Event (MONTHS)                                                             
          Median                               16.9             19.7              12.3     
            95% CI                         (12.8, 19.0)     (13.2, 25.2)      (8.4, 14.9)  
          25% and 75%-ile                   7.7, 30.0         7.2, 34.1        4.5, 25.3   
          Range (censored)                 0.3 to 65.9       0.4 to 83.0      1.0 to 81.8  
          Range (event)                    0.5 to 85.8       0.1 to 58.7      0.2 to 77.8  
        Stratified Analysis                                                                
          p-value (log-rank)                                   0.8068            0.0252    
          Hazard Ratio                                          0.96              1.42     
          95% CI                                            (0.71, 1.31)      (1.04, 1.92) 
        6 MONTHS                                                                           
          Patients remaining at risk            87               92                77      
          Event Free Rate (%)                 77.27             77.85            67.70     
          95% CI                          (68.76, 83.74)   (69.53, 84.15)    (58.64, 75.20)
          Difference in Event Free Rate                         0.57             -9.57     
            95% CI                                         (-9.82, 10.97)    (-20.70, 1.57)
            p-value (Z-test)                                   0.9137            0.0921    
        12 MONTHS                                                                          
          Patients remaining at risk            65               68                51      
          Event Free Rate (%)                 62.83             62.69            50.16     
          95% CI                          (53.36, 70.91)   (53.31, 70.71)    (40.69, 58.89)
          Difference in Event Free Rate                         -0.14            -12.68    
            95% CI                                         (-12.53, 12.25)   (-25.38, 0.03)
            p-value (Z-test)                                   0.9822            0.0505    

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                            A: Drug X        B: Placebo      C: Combination
                                             (N=134)           (N=134)          (N=132)    
        ———————————————————————————————————————————————————————————————————————————————————
        Patients with event (%)             86 (64.2%)       90 (67.2%)        92 (69.7%)  
          Earliest contributing event                                                      
            Death                           38 (44.2%)       48 (53.3%)        41 (44.6%)  
            Disease Progression             48 (55.8%)       42 (46.7%)        51 (55.4%)  
        Patients without event (%)          48 (35.8%)       44 (32.8%)        40 (30.3%)  
        Time to Event (MONTHS)                                                             
          Median                               16.9             19.7              12.3     
            95% CI                         (12.8, 19.0)     (13.2, 25.2)      (8.4, 14.9)  
          25% and 75%-ile                   7.7, 30.0         7.2, 34.1        4.5, 25.3   
          Range (censored)                 0.3 to 65.9       0.4 to 83.0      1.0 to 81.8  
          Range (event)                    0.5 to 85.8       0.1 to 58.7      0.2 to 77.8  
        Stratified Analysis                                                                
          p-value (log-rank)                                   0.8068            0.0252    
          Hazard Ratio                                          0.96              1.42     
          95% CI                                            (0.71, 1.31)      (1.04, 1.92) 
        6 MONTHS                                                                           
          Patients remaining at risk            87               92                77      
          Event Free Rate (%)                 77.27             77.85            67.70     
          95% CI                          (68.76, 83.74)   (69.53, 84.15)    (58.64, 75.20)
          Difference in Event Free Rate                         0.57             -9.57     
            95% CI                                         (-9.82, 10.97)    (-20.70, 1.57)
            p-value (Z-test)                                   0.9137            0.0921    
        12 MONTHS                                                                          
          Patients remaining at risk            65               68                51      
          Event Free Rate (%)                 62.83             62.69            50.16     
          95% CI                          (53.36, 70.91)   (53.31, 70.71)    (40.69, 58.89)
          Difference in Event Free Rate                         -0.14            -12.68    
            95% CI                                         (-12.53, 12.25)   (-25.38, 0.03)
            p-value (Z-test)                                   0.9822            0.0505    

# ttet01 works if change reference group

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                            B: Placebo        A: Drug X      C: Combination
                                             (N=134)           (N=134)          (N=132)    
        ———————————————————————————————————————————————————————————————————————————————————
        Patients with event (%)             90 (67.2%)       86 (64.2%)        92 (69.7%)  
        Patients without event (%)          44 (32.8%)       48 (35.8%)        40 (30.3%)  
        Time to Event (MONTHS)                                                             
          Median                               19.7             16.9              12.3     
            95% CI                         (13.2, 25.2)     (12.8, 19.0)      (8.4, 14.9)  
          25% and 75%-ile                   7.2, 34.1         7.7, 30.0        4.5, 25.3   
          Range (censored)                 0.4 to 83.0       0.3 to 65.9      1.0 to 81.8  
          Range (event)                    0.1 to 58.7       0.5 to 85.8      0.2 to 77.8  
        Unstratified Analysis                                                              
          p-value (log-rank)                                   0.4808            0.0123    
          Hazard Ratio                                          1.11              1.45     
          95% CI                                            (0.83, 1.50)      (1.08, 1.95) 
        6 MONTHS                                                                           
          Patients remaining at risk            92               87                77      
          Event Free Rate (%)                 77.85             77.27            67.70     
          95% CI                          (69.53, 84.15)   (68.76, 83.74)    (58.64, 75.20)
          Difference in Event Free Rate                         -0.57            -10.14    
            95% CI                                         (-10.97, 9.82)    (-21.15, 0.87)
            p-value (Z-test)                                   0.9137            0.0710    
        12 MONTHS                                                                          
          Patients remaining at risk            68               65                51      
          Event Free Rate (%)                 62.69             62.83            50.16     
          95% CI                          (53.31, 70.71)   (53.36, 70.91)    (40.69, 58.89)
          Difference in Event Free Rate                         0.14             -12.53    
            95% CI                                         (-12.25, 12.53)   (-25.19, 0.12)
            p-value (Z-test)                                   0.9822            0.0522    

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                            B: Placebo        A: Drug X      C: Combination
                                             (N=134)           (N=134)          (N=132)    
        ———————————————————————————————————————————————————————————————————————————————————
        Patients with event (%)             90 (67.2%)       86 (64.2%)        92 (69.7%)  
          Earliest contributing event                                                      
            Death                           48 (53.3%)       38 (44.2%)        41 (44.6%)  
            Disease Progression             42 (46.7%)       48 (55.8%)        51 (55.4%)  
        Patients without event (%)          44 (32.8%)       48 (35.8%)        40 (30.3%)  
        Time to Event (MONTHS)                                                             
          Median                               19.7             16.9              12.3     
            95% CI                         (13.2, 25.2)     (12.8, 19.0)      (8.4, 14.9)  
          25% and 75%-ile                   7.2, 34.1         7.7, 30.0        4.5, 25.3   
          Range (censored)                 0.4 to 83.0       0.3 to 65.9      1.0 to 81.8  
          Range (event)                    0.1 to 58.7       0.5 to 85.8      0.2 to 77.8  
        Stratified Analysis                                                                
          p-value (log-rank)                                   0.8068            0.0239    
          Hazard Ratio                                          1.04              1.42     
          95% CI                                            (0.77, 1.41)      (1.05, 1.93) 
        Unstratified Analysis                                                              
          p-value (log-rank)                                   0.4808            0.0123    
          Hazard Ratio                                          1.11              1.45     
          95% CI                                            (0.83, 1.50)      (1.08, 1.95) 
        6 MONTHS                                                                           
          Patients remaining at risk            92               87                77      
          Event Free Rate (%)                 77.85             77.27            67.70     
          95% CI                          (69.53, 84.15)   (68.76, 83.74)    (58.64, 75.20)
          Difference in Event Free Rate                         -0.57            -10.14    
            95% CI                                         (-10.97, 9.82)    (-21.15, 0.87)
            p-value (Z-test)                                   0.9137            0.0710    
        12 MONTHS                                                                          
          Patients remaining at risk            68               65                51      
          Event Free Rate (%)                 62.69             62.83            50.16     
          95% CI                          (53.31, 70.71)   (53.36, 70.91)    (40.69, 58.89)
          Difference in Event Free Rate                         0.14             -12.53    
            95% CI                                         (-12.25, 12.53)   (-25.19, 0.12)
            p-value (Z-test)                                   0.9822            0.0522    

