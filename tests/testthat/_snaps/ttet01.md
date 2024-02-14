# ttet01 works as expected

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                           A: Drug X        B: Placebo      C: Combination
                                            (N=15)            (N=15)            (N=15)    
      ————————————————————————————————————————————————————————————————————————————————————
      Patients with event (%)             10 (66.7%)        11 (73.3%)        11 (73.3%)  
        Earliest contributing event                                                       
          Adverse Event                        0                 0                0       
          Death                                5                 6                4       
          Disease Progression                  5                 5                7       
          Last Date Known To Be Alive          0                 0                0       
          Last Tumor Assessment                0                 0                0       
      Patients without event (%)           5 (33.3%)         4 (26.7%)        4 (26.7%)   
      Time to Event (MONTHS)                                                              
        Median                               17.2              18.1              12.6     
          95% CI                          (4.3, 24.4)       (4.7, 34.1)      (2.0, 15.6)  
        25% and 75%-ile                   11.9, 24.4         6.5, 34.1        7.1, 15.5   
        Range                           1.2 to 46.9 {1}   1.0 to 50.5 {2}    1.9 to 28.9  
      Unstratified Analysis                                                               
        p-value (log-rank)                                    0.8668            0.1419    
        Hazard Ratio                                           0.93              1.95     
        95% CI                                             (0.39, 2.22)      (0.79, 4.80) 
      180 MONTHS                                                                          
        Patients remaining at risk            NE                NE                NE      
        Event Free Rate (%)                   NE                NE                NE      
        95% CI                                NE                NE                NE      
        Difference in Event Free Rate                           NE                NE      
          95% CI                                                NE                NE      
          p-value (Z-test)                                      NE                NE      
      360 MONTHS                                                                          
        Patients remaining at risk            NE                NE                NE      
        Event Free Rate (%)                   NE                NE                NE      
        95% CI                                NE                NE                NE      
        Difference in Event Free Rate                           NE                NE      
          95% CI                                                NE                NE      
          p-value (Z-test)                                      NE                NE      
      ————————————————————————————————————————————————————————————————————————————————————
      
      {1} - Censored observation: range maximum
      {2} - Censored observations: range minimum & maximum
      ————————————————————————————————————————————————————————————————————————————————————
      

# ttet01 works as expected for stratified and unstratified analysis

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                             A: Drug X        B: Placebo      C: Combination 
                                              (N=15)            (N=15)            (N=15)     
        —————————————————————————————————————————————————————————————————————————————————————
        Patients with event (%)             10 (66.7%)        11 (73.3%)        11 (73.3%)   
        Patients without event (%)           5 (33.3%)         4 (26.7%)         4 (26.7%)   
        Time to Event (MONTHS)                                                               
          Median                               17.2              18.1              12.6      
            95% CI                          (4.3, 24.4)       (4.7, 34.1)       (2.0, 15.6)  
          25% and 75%-ile                   11.9, 24.4         6.5, 34.1         7.1, 15.5   
          Range                           1.2 to 46.9 {1}   1.0 to 50.5 {2}     1.9 to 28.9  
        Unstratified Analysis                                                                
          p-value (log-rank)                                    0.8668            0.1419     
          Hazard Ratio                                           0.93              1.95      
          95% CI                                             (0.39, 2.22)      (0.79, 4.80)  
        6 MONTHS                                                                             
          Patients remaining at risk            10                11                10       
          Event Free Rate (%)                  78.32             78.57             80.00     
          95% CI                          (46.51, 92.50)    (47.25, 92.54)    (49.98, 93.07) 
          Difference in Event Free Rate                          0.25              1.68      
            95% CI                                          (-30.40, 30.90)   (-28.11, 31.47)
            p-value (Z-test)                                    0.9873            0.9121     
        12 MONTHS                                                                            
          Patients remaining at risk             8                 6                 7       
          Event Free Rate (%)                  69.62             55.10             62.22     
          95% CI                          (37.36, 87.53)    (25.54, 77.09)    (30.81, 82.60) 
          Difference in Event Free Rate                         -14.52             -7.40     
            95% CI                                          (-51.62, 22.58)   (-44.22, 29.43)
            p-value (Z-test)                                    0.4431            0.6938     
        —————————————————————————————————————————————————————————————————————————————————————
      
        {1} - Censored observation: range maximum
        {2} - Censored observations: range minimum & maximum
        —————————————————————————————————————————————————————————————————————————————————————
      

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                             A: Drug X        B: Placebo      C: Combination 
                                              (N=15)            (N=15)            (N=15)     
        —————————————————————————————————————————————————————————————————————————————————————
        Patients with event (%)             10 (66.7%)        11 (73.3%)        11 (73.3%)   
          Earliest contributing event                                                        
            Death                                5                 6                 4       
            Disease Progression                  5                 5                 7       
        Patients without event (%)           5 (33.3%)         4 (26.7%)         4 (26.7%)   
        Time to Event (MONTHS)                                                               
          Median                               17.2              18.1              12.6      
            95% CI                          (4.3, 24.4)       (4.7, 34.1)       (2.0, 15.6)  
          25% and 75%-ile                   11.9, 24.4         6.5, 34.1         7.1, 15.5   
          Range                           1.2 to 46.9 {1}   1.0 to 50.5 {2}     1.9 to 28.9  
        Stratified Analysis                                                                  
          p-value (log-rank)                                    0.7771            0.1499     
          Hazard Ratio                                           0.87              2.42      
          95% CI                                             (0.33, 2.29)      (0.71, 8.30)  
        Unstratified Analysis                                                                
          p-value (log-rank)                                    0.8668            0.1419     
          Hazard Ratio                                           0.93              1.95      
          95% CI                                             (0.39, 2.22)      (0.79, 4.80)  
        6 MONTHS                                                                             
          Patients remaining at risk            10                11                10       
          Event Free Rate (%)                  78.32             78.57             80.00     
          95% CI                          (46.51, 92.50)    (47.25, 92.54)    (49.98, 93.07) 
          Difference in Event Free Rate                          0.25              1.68      
            95% CI                                          (-30.40, 30.90)   (-28.11, 31.47)
            p-value (Z-test)                                    0.9873            0.9121     
        12 MONTHS                                                                            
          Patients remaining at risk             8                 6                 7       
          Event Free Rate (%)                  69.62             55.10             62.22     
          95% CI                          (37.36, 87.53)    (25.54, 77.09)    (30.81, 82.60) 
          Difference in Event Free Rate                         -14.52             -7.40     
            95% CI                                          (-51.62, 22.58)   (-44.22, 29.43)
            p-value (Z-test)                                    0.4431            0.6938     
        —————————————————————————————————————————————————————————————————————————————————————
      
        {1} - Censored observation: range maximum
        {2} - Censored observations: range minimum & maximum
        —————————————————————————————————————————————————————————————————————————————————————
      

# ttet01 works as expected for stratified analysis only

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                             A: Drug X        B: Placebo      C: Combination 
                                              (N=15)            (N=15)            (N=15)     
        —————————————————————————————————————————————————————————————————————————————————————
        Patients with event (%)             10 (66.7%)        11 (73.3%)        11 (73.3%)   
        Patients without event (%)           5 (33.3%)         4 (26.7%)         4 (26.7%)   
        Time to Event (MONTHS)                                                               
          Median                               17.2              18.1              12.6      
            95% CI                          (4.3, 24.4)       (4.7, 34.1)       (2.0, 15.6)  
          25% and 75%-ile                   11.9, 24.4         6.5, 34.1         7.1, 15.5   
          Range                           1.2 to 46.9 {1}   1.0 to 50.5 {2}     1.9 to 28.9  
        Stratified Analysis                                                                  
          p-value (log-rank)                                    0.7771            0.1499     
          Hazard Ratio                                           0.87              2.42      
          95% CI                                             (0.33, 2.29)      (0.71, 8.30)  
        6 MONTHS                                                                             
          Patients remaining at risk            10                11                10       
          Event Free Rate (%)                  78.32             78.57             80.00     
          95% CI                          (46.51, 92.50)    (47.25, 92.54)    (49.98, 93.07) 
          Difference in Event Free Rate                          0.25              1.68      
            95% CI                                          (-30.40, 30.90)   (-28.11, 31.47)
            p-value (Z-test)                                    0.9873            0.9121     
        12 MONTHS                                                                            
          Patients remaining at risk             8                 6                 7       
          Event Free Rate (%)                  69.62             55.10             62.22     
          95% CI                          (37.36, 87.53)    (25.54, 77.09)    (30.81, 82.60) 
          Difference in Event Free Rate                         -14.52             -7.40     
            95% CI                                          (-51.62, 22.58)   (-44.22, 29.43)
            p-value (Z-test)                                    0.4431            0.6938     
        —————————————————————————————————————————————————————————————————————————————————————
      
        {1} - Censored observation: range maximum
        {2} - Censored observations: range minimum & maximum
        —————————————————————————————————————————————————————————————————————————————————————
      

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                             A: Drug X        B: Placebo      C: Combination 
                                              (N=15)            (N=15)            (N=15)     
        —————————————————————————————————————————————————————————————————————————————————————
        Patients with event (%)             10 (66.7%)        11 (73.3%)        11 (73.3%)   
          Earliest contributing event                                                        
            Death                                5                 6                 4       
            Disease Progression                  5                 5                 7       
        Patients without event (%)           5 (33.3%)         4 (26.7%)         4 (26.7%)   
        Time to Event (MONTHS)                                                               
          Median                               17.2              18.1              12.6      
            95% CI                          (4.3, 24.4)       (4.7, 34.1)       (2.0, 15.6)  
          25% and 75%-ile                   11.9, 24.4         6.5, 34.1         7.1, 15.5   
          Range                           1.2 to 46.9 {1}   1.0 to 50.5 {2}     1.9 to 28.9  
        Stratified Analysis                                                                  
          p-value (log-rank)                                    0.7771            0.1499     
          Hazard Ratio                                           0.87              2.42      
          95% CI                                             (0.33, 2.29)      (0.71, 8.30)  
        6 MONTHS                                                                             
          Patients remaining at risk            10                11                10       
          Event Free Rate (%)                  78.32             78.57             80.00     
          95% CI                          (46.51, 92.50)    (47.25, 92.54)    (49.98, 93.07) 
          Difference in Event Free Rate                          0.25              1.68      
            95% CI                                          (-30.40, 30.90)   (-28.11, 31.47)
            p-value (Z-test)                                    0.9873            0.9121     
        12 MONTHS                                                                            
          Patients remaining at risk             8                 6                 7       
          Event Free Rate (%)                  69.62             55.10             62.22     
          95% CI                          (37.36, 87.53)    (25.54, 77.09)    (30.81, 82.60) 
          Difference in Event Free Rate                         -14.52             -7.40     
            95% CI                                          (-51.62, 22.58)   (-44.22, 29.43)
            p-value (Z-test)                                    0.4431            0.6938     
        —————————————————————————————————————————————————————————————————————————————————————
      
        {1} - Censored observation: range maximum
        {2} - Censored observations: range minimum & maximum
        —————————————————————————————————————————————————————————————————————————————————————
      

# ttet01 works if change reference group

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                             A: Drug X        B: Placebo      C: Combination 
                                              (N=15)            (N=15)            (N=15)     
        —————————————————————————————————————————————————————————————————————————————————————
        Patients with event (%)             10 (66.7%)        11 (73.3%)        11 (73.3%)   
        Patients without event (%)           5 (33.3%)         4 (26.7%)         4 (26.7%)   
        Time to Event (MONTHS)                                                               
          Median                               17.2              18.1              12.6      
            95% CI                          (4.3, 24.4)       (4.7, 34.1)       (2.0, 15.6)  
          25% and 75%-ile                   11.9, 24.4         6.5, 34.1         7.1, 15.5   
          Range                           1.2 to 46.9 {1}   1.0 to 50.5 {2}     1.9 to 28.9  
        Unstratified Analysis                                                                
          p-value (log-rank)                  0.8668                              0.1392     
          Hazard Ratio                         1.08                                2.02      
          95% CI                           (0.45, 2.58)                        (0.78, 5.24)  
        6 MONTHS                                                                             
          Patients remaining at risk            10                11                10       
          Event Free Rate (%)                  78.32             78.57             80.00     
          95% CI                          (46.51, 92.50)    (47.25, 92.54)    (49.98, 93.07) 
          Difference in Event Free Rate        -0.25                               1.43      
            95% CI                        (-30.90, 30.40)                     (-28.10, 30.95)
            p-value (Z-test)                  0.9873                              0.9244     
        12 MONTHS                                                                            
          Patients remaining at risk             8                 6                 7       
          Event Free Rate (%)                  69.62             55.10             62.22     
          95% CI                          (37.36, 87.53)    (25.54, 77.09)    (30.81, 82.60) 
          Difference in Event Free Rate        14.52                               7.12      
            95% CI                        (-22.58, 51.62)                     (-31.10, 45.34)
            p-value (Z-test)                  0.4431                              0.7150     
        —————————————————————————————————————————————————————————————————————————————————————
      
        {1} - Censored observation: range maximum
        {2} - Censored observations: range minimum & maximum
        —————————————————————————————————————————————————————————————————————————————————————
      

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                             A: Drug X        B: Placebo      C: Combination 
                                              (N=15)            (N=15)            (N=15)     
        —————————————————————————————————————————————————————————————————————————————————————
        Patients with event (%)             10 (66.7%)        11 (73.3%)        11 (73.3%)   
          Earliest contributing event                                                        
            Death                                5                 6                 4       
            Disease Progression                  5                 5                 7       
        Patients without event (%)           5 (33.3%)         4 (26.7%)         4 (26.7%)   
        Time to Event (MONTHS)                                                               
          Median                               17.2              18.1              12.6      
            95% CI                          (4.3, 24.4)       (4.7, 34.1)       (2.0, 15.6)  
          25% and 75%-ile                   11.9, 24.4         6.5, 34.1         7.1, 15.5   
          Range                           1.2 to 46.9 {1}   1.0 to 50.5 {2}     1.9 to 28.9  
        Stratified Analysis                                                                  
          p-value (log-rank)                  0.7771                              0.1834     
          Hazard Ratio                         1.15                                2.19      
          95% CI                           (0.44, 3.03)                        (0.68, 7.03)  
        Unstratified Analysis                                                                
          p-value (log-rank)                  0.8668                              0.1392     
          Hazard Ratio                         1.08                                2.02      
          95% CI                           (0.45, 2.58)                        (0.78, 5.24)  
        6 MONTHS                                                                             
          Patients remaining at risk            10                11                10       
          Event Free Rate (%)                  78.32             78.57             80.00     
          95% CI                          (46.51, 92.50)    (47.25, 92.54)    (49.98, 93.07) 
          Difference in Event Free Rate        -0.25                               1.43      
            95% CI                        (-30.90, 30.40)                     (-28.10, 30.95)
            p-value (Z-test)                  0.9873                              0.9244     
        12 MONTHS                                                                            
          Patients remaining at risk             8                 6                 7       
          Event Free Rate (%)                  69.62             55.10             62.22     
          95% CI                          (37.36, 87.53)    (25.54, 77.09)    (30.81, 82.60) 
          Difference in Event Free Rate        14.52                               7.12      
            95% CI                        (-22.58, 51.62)                     (-31.10, 45.34)
            p-value (Z-test)                  0.4431                              0.7150     
        —————————————————————————————————————————————————————————————————————————————————————
      
        {1} - Censored observation: range maximum
        {2} - Censored observations: range minimum & maximum
        —————————————————————————————————————————————————————————————————————————————————————
      

