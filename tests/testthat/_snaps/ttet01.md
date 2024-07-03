# ttet01 works as expected

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                          A: Drug X       B: Placebo    C: Combination
                                            (N=15)          (N=15)          (N=15)    
      ————————————————————————————————————————————————————————————————————————————————
      Patients with event (%)             7 (46.7%)        12 (80%)       8 (53.3%)   
        Earliest contributing event                                                   
          Adverse Event                       0               0               0       
          Death                               5               11              7       
          Disease Progression                 2               1               1       
          Last Tumor Assessment               0               0               0       
      Patients without event (%)          8 (53.3%)        3 (20%)        7 (46.7%)   
      Time to Event (MONTHS)                                                          
        Median                               8.6             6.2             8.4      
          95% CI                          (2.6, NE)       (2.2, 7.6)      (3.8, NE)   
        25% and 75%-ile                    3.8, NE         4.7, 8.4        5.8, NE    
        Range                           1.2 to 9.5 {1}    0.9 to 9.1    0.9 to 9.5 {1}
      Unstratified Analysis                                                           
        p-value (log-rank)                                  0.0973          0.9111    
        Hazard Ratio                                         2.18            1.06     
        95% CI                                           (0.85, 5.60)    (0.38, 2.94) 
      180 MONTHS                                                                      
        Patients remaining at risk            NE              NE              NE      
        Event Free Rate (%)                   NE              NE              NE      
        95% CI                                NE              NE              NE      
        Difference in Event Free Rate                         NE              NE      
          95% CI                                              NE              NE      
          p-value (Z-test)                                    NE              NE      
      360 MONTHS                                                                      
        Patients remaining at risk            NE              NE              NE      
        Event Free Rate (%)                   NE              NE              NE      
        95% CI                                NE              NE              NE      
        Difference in Event Free Rate                         NE              NE      
          95% CI                                              NE              NE      
          p-value (Z-test)                                    NE              NE      
      ————————————————————————————————————————————————————————————————————————————————
      
      {1} - Censored observation: range maximum
      ————————————————————————————————————————————————————————————————————————————————
      

# ttet01 works as expected for stratified and unstratified analysis

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                            A: Drug X        B: Placebo      C: Combination 
                                              (N=15)           (N=15)            (N=15)     
        ————————————————————————————————————————————————————————————————————————————————————
        Patients with event (%)             7 (46.7%)         12 (80%)          8 (53.3%)   
        Patients without event (%)          8 (53.3%)          3 (20%)          7 (46.7%)   
        Time to Event (MONTHS)                                                              
          Median                               8.6               6.2               8.4      
            95% CI                          (2.6, NE)        (2.2, 7.6)         (3.8, NE)   
          25% and 75%-ile                    3.8, NE          4.7, 8.4           5.8, NE    
          Range                           1.2 to 9.5 {1}     0.9 to 9.1      0.9 to 9.5 {1} 
        Unstratified Analysis                                                               
          p-value (log-rank)                                   0.0973            0.9111     
          Hazard Ratio                                          2.18              1.06      
          95% CI                                            (0.85, 5.60)      (0.38, 2.94)  
        6 MONTHS                                                                            
          Patients remaining at risk            11                8                11       
          Event Free Rate (%)                 73.33             53.33             73.33     
          95% CI                          (43.62, 89.05)   (26.32, 74.38)    (43.62, 89.05) 
          Difference in Event Free Rate                        -20.00             0.00      
            95% CI                                         (-53.74, 13.74)   (-31.65, 31.65)
            p-value (Z-test)                                   0.2453            1.0000     
        ————————————————————————————————————————————————————————————————————————————————————
      
        {1} - Censored observation: range maximum
        ————————————————————————————————————————————————————————————————————————————————————
      

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                            A: Drug X        B: Placebo      C: Combination 
                                              (N=15)           (N=15)            (N=15)     
        ————————————————————————————————————————————————————————————————————————————————————
        Patients with event (%)             7 (46.7%)         12 (80%)          8 (53.3%)   
          Earliest contributing event                                                       
            Death                               5                11                 7       
            Disease Progression                 2                 1                 1       
        Patients without event (%)          8 (53.3%)          3 (20%)          7 (46.7%)   
        Time to Event (MONTHS)                                                              
          Median                               8.6               6.2               8.4      
            95% CI                          (2.6, NE)        (2.2, 7.6)         (3.8, NE)   
          25% and 75%-ile                    3.8, NE          4.7, 8.4           5.8, NE    
          Range                           1.2 to 9.5 {1}     0.9 to 9.1      0.9 to 9.5 {1} 
        Stratified Analysis                                                                 
          p-value (log-rank)                                   0.1505            0.8372     
          Hazard Ratio                                          2.11              0.86      
          95% CI                                            (0.75, 5.96)      (0.21, 3.49)  
        Unstratified Analysis                                                               
          p-value (log-rank)                                   0.0973            0.9111     
          Hazard Ratio                                          2.18              1.06      
          95% CI                                            (0.85, 5.60)      (0.38, 2.94)  
        6 MONTHS                                                                            
          Patients remaining at risk            11                8                11       
          Event Free Rate (%)                 73.33             53.33             73.33     
          95% CI                          (43.62, 89.05)   (26.32, 74.38)    (43.62, 89.05) 
          Difference in Event Free Rate                        -20.00             0.00      
            95% CI                                         (-53.74, 13.74)   (-31.65, 31.65)
            p-value (Z-test)                                   0.2453            1.0000     
        ————————————————————————————————————————————————————————————————————————————————————
      
        {1} - Censored observation: range maximum
        ————————————————————————————————————————————————————————————————————————————————————
      

# ttet01 works as expected for stratified analysis only

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                            A: Drug X        B: Placebo      C: Combination 
                                              (N=15)           (N=15)            (N=15)     
        ————————————————————————————————————————————————————————————————————————————————————
        Patients with event (%)             7 (46.7%)         12 (80%)          8 (53.3%)   
        Patients without event (%)          8 (53.3%)          3 (20%)          7 (46.7%)   
        Time to Event (MONTHS)                                                              
          Median                               8.6               6.2               8.4      
            95% CI                          (2.6, NE)        (2.2, 7.6)         (3.8, NE)   
          25% and 75%-ile                    3.8, NE          4.7, 8.4           5.8, NE    
          Range                           1.2 to 9.5 {1}     0.9 to 9.1      0.9 to 9.5 {1} 
        Stratified Analysis                                                                 
          p-value (log-rank)                                   0.1505            0.8372     
          Hazard Ratio                                          2.11              0.86      
          95% CI                                            (0.75, 5.96)      (0.21, 3.49)  
        6 MONTHS                                                                            
          Patients remaining at risk            11                8                11       
          Event Free Rate (%)                 73.33             53.33             73.33     
          95% CI                          (43.62, 89.05)   (26.32, 74.38)    (43.62, 89.05) 
          Difference in Event Free Rate                        -20.00             0.00      
            95% CI                                         (-53.74, 13.74)   (-31.65, 31.65)
            p-value (Z-test)                                   0.2453            1.0000     
        ————————————————————————————————————————————————————————————————————————————————————
      
        {1} - Censored observation: range maximum
        ————————————————————————————————————————————————————————————————————————————————————
      

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                            A: Drug X        B: Placebo      C: Combination 
                                              (N=15)           (N=15)            (N=15)     
        ————————————————————————————————————————————————————————————————————————————————————
        Patients with event (%)             7 (46.7%)         12 (80%)          8 (53.3%)   
          Earliest contributing event                                                       
            Death                               5                11                 7       
            Disease Progression                 2                 1                 1       
        Patients without event (%)          8 (53.3%)          3 (20%)          7 (46.7%)   
        Time to Event (MONTHS)                                                              
          Median                               8.6               6.2               8.4      
            95% CI                          (2.6, NE)        (2.2, 7.6)         (3.8, NE)   
          25% and 75%-ile                    3.8, NE          4.7, 8.4           5.8, NE    
          Range                           1.2 to 9.5 {1}     0.9 to 9.1      0.9 to 9.5 {1} 
        Stratified Analysis                                                                 
          p-value (log-rank)                                   0.1505            0.8372     
          Hazard Ratio                                          2.11              0.86      
          95% CI                                            (0.75, 5.96)      (0.21, 3.49)  
        6 MONTHS                                                                            
          Patients remaining at risk            11                8                11       
          Event Free Rate (%)                 73.33             53.33             73.33     
          95% CI                          (43.62, 89.05)   (26.32, 74.38)    (43.62, 89.05) 
          Difference in Event Free Rate                        -20.00             0.00      
            95% CI                                         (-53.74, 13.74)   (-31.65, 31.65)
            p-value (Z-test)                                   0.2453            1.0000     
        ————————————————————————————————————————————————————————————————————————————————————
      
        {1} - Censored observation: range maximum
        ————————————————————————————————————————————————————————————————————————————————————
      

# ttet01 works if change reference group

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                             A: Drug X        B: Placebo     C: Combination 
                                              (N=15)            (N=15)           (N=15)     
        ————————————————————————————————————————————————————————————————————————————————————
        Patients with event (%)              7 (46.7%)         12 (80%)         8 (53.3%)   
        Patients without event (%)           8 (53.3%)         3 (20%)          7 (46.7%)   
        Time to Event (MONTHS)                                                              
          Median                                8.6              6.2               8.4      
            95% CI                           (2.6, NE)        (2.2, 7.6)        (3.8, NE)   
          25% and 75%-ile                     3.8, NE          4.7, 8.4          5.8, NE    
          Range                           1.2 to 9.5 {1}      0.9 to 9.1     0.9 to 9.5 {1} 
        Unstratified Analysis                                                               
          p-value (log-rank)                  0.0973                             0.0795     
          Hazard Ratio                         0.46                               0.45      
          95% CI                           (0.18, 1.18)                       (0.18, 1.12)  
        6 MONTHS                                                                            
          Patients remaining at risk            11                8                11       
          Event Free Rate (%)                  73.33            53.33             73.33     
          95% CI                          (43.62, 89.05)    (26.32, 74.38)   (43.62, 89.05) 
          Difference in Event Free Rate        20.00                              20.00     
            95% CI                        (-13.74, 53.74)                    (-13.74, 53.74)
            p-value (Z-test)                  0.2453                             0.2453     
        ————————————————————————————————————————————————————————————————————————————————————
      
        {1} - Censored observation: range maximum
        ————————————————————————————————————————————————————————————————————————————————————
      

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                             A: Drug X        B: Placebo     C: Combination 
                                              (N=15)            (N=15)           (N=15)     
        ————————————————————————————————————————————————————————————————————————————————————
        Patients with event (%)              7 (46.7%)         12 (80%)         8 (53.3%)   
          Earliest contributing event                                                       
            Death                                5                11                7       
            Disease Progression                  2                1                 1       
        Patients without event (%)           8 (53.3%)         3 (20%)          7 (46.7%)   
        Time to Event (MONTHS)                                                              
          Median                                8.6              6.2               8.4      
            95% CI                           (2.6, NE)        (2.2, 7.6)        (3.8, NE)   
          25% and 75%-ile                     3.8, NE          4.7, 8.4          5.8, NE    
          Range                           1.2 to 9.5 {1}      0.9 to 9.1     0.9 to 9.5 {1} 
        Stratified Analysis                                                                 
          p-value (log-rank)                  0.1505                             0.1587     
          Hazard Ratio                         0.47                               0.40      
          95% CI                           (0.17, 1.34)                       (0.11, 1.49)  
        Unstratified Analysis                                                               
          p-value (log-rank)                  0.0973                             0.0795     
          Hazard Ratio                         0.46                               0.45      
          95% CI                           (0.18, 1.18)                       (0.18, 1.12)  
        6 MONTHS                                                                            
          Patients remaining at risk            11                8                11       
          Event Free Rate (%)                  73.33            53.33             73.33     
          95% CI                          (43.62, 89.05)    (26.32, 74.38)   (43.62, 89.05) 
          Difference in Event Free Rate        20.00                              20.00     
            95% CI                        (-13.74, 53.74)                    (-13.74, 53.74)
            p-value (Z-test)                  0.2453                             0.2453     
        ————————————————————————————————————————————————————————————————————————————————————
      
        {1} - Censored observation: range maximum
        ————————————————————————————————————————————————————————————————————————————————————
      

