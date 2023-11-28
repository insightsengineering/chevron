# ttet01 works as expected

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                           A: Drug X        B: Placebo      C: Combination 
                                            (N=134)           (N=134)           (N=132)    
      —————————————————————————————————————————————————————————————————————————————————————
      Patients with event (%)             86 (64.2%)        90 (67.2%)        92 (69.7%)   
        Earliest contributing event                                                        
          Adverse Event                        0                 0                 0       
          Death                               38                48                41       
          Disease Progression                 48                42                51       
          Last Date Known To Be Alive          0                 0                 0       
          Last Tumor Assessment                0                 0                 0       
      Patients without event (%)          48 (35.8%)        44 (32.8%)        40 (30.3%)   
      Time to Event (MONTHS)                                                               
        Median                               16.9              19.7              12.3      
          95% CI                         (12.8, 19.0)      (13.2, 25.2)       (8.4, 14.9)  
        25% and 75%-ile                    7.7, 30.0         7.2, 34.1         4.5, 25.3   
        Range                           0.3 to 85.8 {1}   0.1 to 83.0 {2}   0.2 to 81.8 {2}
      Unstratified Analysis                                                                
        p-value (log-rank)                                    0.4808            0.0429     
        Hazard Ratio                                           0.90              1.36      
        95% CI                                             (0.67, 1.21)      (1.01, 1.82)  
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
      —————————————————————————————————————————————————————————————————————————————————————
      
      {1} - Censored observation: range minimum
      {2} - Censored observation: range maximum
      —————————————————————————————————————————————————————————————————————————————————————
      

# ttet01 works as expected for stratified and unstratified analysis

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                             A: Drug X        B: Placebo      C: Combination 
                                              (N=134)           (N=134)           (N=132)    
        —————————————————————————————————————————————————————————————————————————————————————
        Patients with event (%)             86 (64.2%)        90 (67.2%)        92 (69.7%)   
        Patients without event (%)          48 (35.8%)        44 (32.8%)        40 (30.3%)   
        Time to Event (MONTHS)                                                               
          Median                               16.9              19.7              12.3      
            95% CI                         (12.8, 19.0)      (13.2, 25.2)       (8.4, 14.9)  
          25% and 75%-ile                    7.7, 30.0         7.2, 34.1         4.5, 25.3   
          Range                           0.3 to 85.8 {1}   0.1 to 83.0 {2}   0.2 to 81.8 {2}
        Unstratified Analysis                                                                
          p-value (log-rank)                                    0.4808            0.0429     
          Hazard Ratio                                           0.90              1.36      
          95% CI                                             (0.67, 1.21)      (1.01, 1.82)  
        6 MONTHS                                                                             
          Patients remaining at risk            87                92                77       
          Event Free Rate (%)                  77.27             77.85             67.70     
          95% CI                          (68.76, 83.74)    (69.53, 84.15)    (58.64, 75.20) 
          Difference in Event Free Rate                          0.57              -9.57     
            95% CI                                          (-9.82, 10.97)    (-20.70, 1.57) 
            p-value (Z-test)                                    0.9137            0.0921     
        12 MONTHS                                                                            
          Patients remaining at risk            65                68                51       
          Event Free Rate (%)                  62.83             62.69             50.16     
          95% CI                          (53.36, 70.91)    (53.31, 70.71)    (40.69, 58.89) 
          Difference in Event Free Rate                          -0.14            -12.68     
            95% CI                                          (-12.53, 12.25)   (-25.38, 0.03) 
            p-value (Z-test)                                    0.9822            0.0505     
        —————————————————————————————————————————————————————————————————————————————————————
      
        {1} - Censored observation: range minimum
        {2} - Censored observation: range maximum
        —————————————————————————————————————————————————————————————————————————————————————
      

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                             A: Drug X        B: Placebo      C: Combination 
                                              (N=134)           (N=134)           (N=132)    
        —————————————————————————————————————————————————————————————————————————————————————
        Patients with event (%)             86 (64.2%)        90 (67.2%)        92 (69.7%)   
          Earliest contributing event                                                        
            Death                               38                48                41       
            Disease Progression                 48                42                51       
        Patients without event (%)          48 (35.8%)        44 (32.8%)        40 (30.3%)   
        Time to Event (MONTHS)                                                               
          Median                               16.9              19.7              12.3      
            95% CI                         (12.8, 19.0)      (13.2, 25.2)       (8.4, 14.9)  
          25% and 75%-ile                    7.7, 30.0         7.2, 34.1         4.5, 25.3   
          Range                           0.3 to 85.8 {1}   0.1 to 83.0 {2}   0.2 to 81.8 {2}
        Stratified Analysis                                                                  
          p-value (log-rank)                                    0.8068            0.0252     
          Hazard Ratio                                           0.96              1.42      
          95% CI                                             (0.71, 1.31)      (1.04, 1.92)  
        Unstratified Analysis                                                                
          p-value (log-rank)                                    0.4808            0.0429     
          Hazard Ratio                                           0.90              1.36      
          95% CI                                             (0.67, 1.21)      (1.01, 1.82)  
        6 MONTHS                                                                             
          Patients remaining at risk            87                92                77       
          Event Free Rate (%)                  77.27             77.85             67.70     
          95% CI                          (68.76, 83.74)    (69.53, 84.15)    (58.64, 75.20) 
          Difference in Event Free Rate                          0.57              -9.57     
            95% CI                                          (-9.82, 10.97)    (-20.70, 1.57) 
            p-value (Z-test)                                    0.9137            0.0921     
        12 MONTHS                                                                            
          Patients remaining at risk            65                68                51       
          Event Free Rate (%)                  62.83             62.69             50.16     
          95% CI                          (53.36, 70.91)    (53.31, 70.71)    (40.69, 58.89) 
          Difference in Event Free Rate                          -0.14            -12.68     
            95% CI                                          (-12.53, 12.25)   (-25.38, 0.03) 
            p-value (Z-test)                                    0.9822            0.0505     
        —————————————————————————————————————————————————————————————————————————————————————
      
        {1} - Censored observation: range minimum
        {2} - Censored observation: range maximum
        —————————————————————————————————————————————————————————————————————————————————————
      

# ttet01 works as expected for stratified analysis only

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                             A: Drug X        B: Placebo      C: Combination 
                                              (N=134)           (N=134)           (N=132)    
        —————————————————————————————————————————————————————————————————————————————————————
        Patients with event (%)             86 (64.2%)        90 (67.2%)        92 (69.7%)   
        Patients without event (%)          48 (35.8%)        44 (32.8%)        40 (30.3%)   
        Time to Event (MONTHS)                                                               
          Median                               16.9              19.7              12.3      
            95% CI                         (12.8, 19.0)      (13.2, 25.2)       (8.4, 14.9)  
          25% and 75%-ile                    7.7, 30.0         7.2, 34.1         4.5, 25.3   
          Range                           0.3 to 85.8 {1}   0.1 to 83.0 {2}   0.2 to 81.8 {2}
        Stratified Analysis                                                                  
          p-value (log-rank)                                    0.8068            0.0252     
          Hazard Ratio                                           0.96              1.42      
          95% CI                                             (0.71, 1.31)      (1.04, 1.92)  
        6 MONTHS                                                                             
          Patients remaining at risk            87                92                77       
          Event Free Rate (%)                  77.27             77.85             67.70     
          95% CI                          (68.76, 83.74)    (69.53, 84.15)    (58.64, 75.20) 
          Difference in Event Free Rate                          0.57              -9.57     
            95% CI                                          (-9.82, 10.97)    (-20.70, 1.57) 
            p-value (Z-test)                                    0.9137            0.0921     
        12 MONTHS                                                                            
          Patients remaining at risk            65                68                51       
          Event Free Rate (%)                  62.83             62.69             50.16     
          95% CI                          (53.36, 70.91)    (53.31, 70.71)    (40.69, 58.89) 
          Difference in Event Free Rate                          -0.14            -12.68     
            95% CI                                          (-12.53, 12.25)   (-25.38, 0.03) 
            p-value (Z-test)                                    0.9822            0.0505     
        —————————————————————————————————————————————————————————————————————————————————————
      
        {1} - Censored observation: range minimum
        {2} - Censored observation: range maximum
        —————————————————————————————————————————————————————————————————————————————————————
      

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                             A: Drug X        B: Placebo      C: Combination 
                                              (N=134)           (N=134)           (N=132)    
        —————————————————————————————————————————————————————————————————————————————————————
        Patients with event (%)             86 (64.2%)        90 (67.2%)        92 (69.7%)   
          Earliest contributing event                                                        
            Death                               38                48                41       
            Disease Progression                 48                42                51       
        Patients without event (%)          48 (35.8%)        44 (32.8%)        40 (30.3%)   
        Time to Event (MONTHS)                                                               
          Median                               16.9              19.7              12.3      
            95% CI                         (12.8, 19.0)      (13.2, 25.2)       (8.4, 14.9)  
          25% and 75%-ile                    7.7, 30.0         7.2, 34.1         4.5, 25.3   
          Range                           0.3 to 85.8 {1}   0.1 to 83.0 {2}   0.2 to 81.8 {2}
        Stratified Analysis                                                                  
          p-value (log-rank)                                    0.8068            0.0252     
          Hazard Ratio                                           0.96              1.42      
          95% CI                                             (0.71, 1.31)      (1.04, 1.92)  
        6 MONTHS                                                                             
          Patients remaining at risk            87                92                77       
          Event Free Rate (%)                  77.27             77.85             67.70     
          95% CI                          (68.76, 83.74)    (69.53, 84.15)    (58.64, 75.20) 
          Difference in Event Free Rate                          0.57              -9.57     
            95% CI                                          (-9.82, 10.97)    (-20.70, 1.57) 
            p-value (Z-test)                                    0.9137            0.0921     
        12 MONTHS                                                                            
          Patients remaining at risk            65                68                51       
          Event Free Rate (%)                  62.83             62.69             50.16     
          95% CI                          (53.36, 70.91)    (53.31, 70.71)    (40.69, 58.89) 
          Difference in Event Free Rate                          -0.14            -12.68     
            95% CI                                          (-12.53, 12.25)   (-25.38, 0.03) 
            p-value (Z-test)                                    0.9822            0.0505     
        —————————————————————————————————————————————————————————————————————————————————————
      
        {1} - Censored observation: range minimum
        {2} - Censored observation: range maximum
        —————————————————————————————————————————————————————————————————————————————————————
      

# ttet01 works if change reference group

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                             A: Drug X        B: Placebo      C: Combination 
                                              (N=134)           (N=134)           (N=132)    
        —————————————————————————————————————————————————————————————————————————————————————
        Patients with event (%)             86 (64.2%)        90 (67.2%)        92 (69.7%)   
        Patients without event (%)          48 (35.8%)        44 (32.8%)        40 (30.3%)   
        Time to Event (MONTHS)                                                               
          Median                               16.9              19.7              12.3      
            95% CI                         (12.8, 19.0)      (13.2, 25.2)       (8.4, 14.9)  
          25% and 75%-ile                    7.7, 30.0         7.2, 34.1         4.5, 25.3   
          Range                           0.3 to 85.8 {1}   0.1 to 83.0 {2}   0.2 to 81.8 {2}
        Unstratified Analysis                                                                
          p-value (log-rank)                  0.4808                              0.0123     
          Hazard Ratio                         1.11                                1.45      
          95% CI                           (0.83, 1.50)                        (1.08, 1.95)  
        6 MONTHS                                                                             
          Patients remaining at risk            87                92                77       
          Event Free Rate (%)                  77.27             77.85             67.70     
          95% CI                          (68.76, 83.74)    (69.53, 84.15)    (58.64, 75.20) 
          Difference in Event Free Rate        -0.57                              -10.14     
            95% CI                        (-10.97, 9.82)                      (-21.15, 0.87) 
            p-value (Z-test)                  0.9137                              0.0710     
        12 MONTHS                                                                            
          Patients remaining at risk            65                68                51       
          Event Free Rate (%)                  62.83             62.69             50.16     
          95% CI                          (53.36, 70.91)    (53.31, 70.71)    (40.69, 58.89) 
          Difference in Event Free Rate        0.14                               -12.53     
            95% CI                        (-12.25, 12.53)                     (-25.19, 0.12) 
            p-value (Z-test)                  0.9822                              0.0522     
        —————————————————————————————————————————————————————————————————————————————————————
      
        {1} - Censored observation: range minimum
        {2} - Censored observation: range maximum
        —————————————————————————————————————————————————————————————————————————————————————
      

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                             A: Drug X        B: Placebo      C: Combination 
                                              (N=134)           (N=134)           (N=132)    
        —————————————————————————————————————————————————————————————————————————————————————
        Patients with event (%)             86 (64.2%)        90 (67.2%)        92 (69.7%)   
          Earliest contributing event                                                        
            Death                               38                48                41       
            Disease Progression                 48                42                51       
        Patients without event (%)          48 (35.8%)        44 (32.8%)        40 (30.3%)   
        Time to Event (MONTHS)                                                               
          Median                               16.9              19.7              12.3      
            95% CI                         (12.8, 19.0)      (13.2, 25.2)       (8.4, 14.9)  
          25% and 75%-ile                    7.7, 30.0         7.2, 34.1         4.5, 25.3   
          Range                           0.3 to 85.8 {1}   0.1 to 83.0 {2}   0.2 to 81.8 {2}
        Stratified Analysis                                                                  
          p-value (log-rank)                  0.8068                              0.0239     
          Hazard Ratio                         1.04                                1.42      
          95% CI                           (0.77, 1.41)                        (1.05, 1.93)  
        Unstratified Analysis                                                                
          p-value (log-rank)                  0.4808                              0.0123     
          Hazard Ratio                         1.11                                1.45      
          95% CI                           (0.83, 1.50)                        (1.08, 1.95)  
        6 MONTHS                                                                             
          Patients remaining at risk            87                92                77       
          Event Free Rate (%)                  77.27             77.85             67.70     
          95% CI                          (68.76, 83.74)    (69.53, 84.15)    (58.64, 75.20) 
          Difference in Event Free Rate        -0.57                              -10.14     
            95% CI                        (-10.97, 9.82)                      (-21.15, 0.87) 
            p-value (Z-test)                  0.9137                              0.0710     
        12 MONTHS                                                                            
          Patients remaining at risk            65                68                51       
          Event Free Rate (%)                  62.83             62.69             50.16     
          95% CI                          (53.36, 70.91)    (53.31, 70.71)    (40.69, 58.89) 
          Difference in Event Free Rate        0.14                               -12.53     
            95% CI                        (-12.25, 12.53)                     (-25.19, 0.12) 
            p-value (Z-test)                  0.9822                              0.0522     
        —————————————————————————————————————————————————————————————————————————————————————
      
        {1} - Censored observation: range minimum
        {2} - Censored observation: range maximum
        —————————————————————————————————————————————————————————————————————————————————————
      

