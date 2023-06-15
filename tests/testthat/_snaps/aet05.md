# aet05 can handle NA values

    Code
      cat(formatters::export_as_txt(res, lpp = 100))
    Output
                                              A: Drug X   B: Placebo   C: Combination
                                               (N=134)     (N=134)        (N=132)    
        —————————————————————————————————————————————————————————————————————————————
        AEREPTTE                                                                     
          Total patient-years at risk            0.0         0.0            0.0      
          Number of adverse events observed       0           0              0       
          AE rate per 100 patient-years          NA           NA             NA      
          95% CI                                 NA           NA             NA      
        AETTE1                                                                       
          Total patient-years at risk            0.0         0.0            0.0      
          Number of adverse events observed       0           0              0       
          AE rate per 100 patient-years          NA           NA             NA      
          95% CI                                 NA           NA             NA      
        AETTE2                                                                       
          Total patient-years at risk            0.0         0.0            0.0      
          Number of adverse events observed       0           0              0       
          AE rate per 100 patient-years          NA           NA             NA      
          95% CI                                 NA           NA             NA      
        AETTE3                                                                       
          Total patient-years at risk            0.0         0.0            0.0      
          Number of adverse events observed       0           0              0       
          AE rate per 100 patient-years          NA           NA             NA      
          95% CI                                 NA           NA             NA      
        HYSTTEBL                                                                     
          Total patient-years at risk            0.0         0.0            0.0      
          Number of adverse events observed       0           0              0       
          AE rate per 100 patient-years          NA           NA             NA      
          95% CI                                 NA           NA             NA      
        HYSTTEUL                                                                     
          Total patient-years at risk            0.0         0.0            0.0      
          Number of adverse events observed       0           0              0       
          AE rate per 100 patient-years          NA           NA             NA      
          95% CI                                 NA           NA             NA      

# aet05 can handle some NA values

    Code
      cat(formatters::export_as_txt(res1, lpp = 100))
    Output
                                                 A: Drug X         B: Placebo      C: Combination 
                                                  (N=134)           (N=134)            (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————————————
        AEREPTTE                                                                                  
          Total patient-years at risk              337.9             331.8              341.6     
          Number of adverse events observed         134               134                132      
          AE rate per 100 patient-years            39.66             40.38              38.64     
          95% CI                              (32.94, 46.37)     (33.54, 47.22)    (32.05, 45.24) 
        AETTE3                                                                                    
          Total patient-years at risk              89.3               59.2              91.8      
          Number of adverse events observed         106               123                103      
          AE rate per 100 patient-years           118.75             207.62            112.21     
          95% CI                              (96.14, 141.35)   (170.93, 244.31)   (90.54, 133.87)
        HYSTTEBL                                                                                  
          Total patient-years at risk             5623.1             5681.4            6769.3     
          Number of adverse events observed         14                 18                15       
          AE rate per 100 patient-years            0.25               0.32              0.22      
          95% CI                               (0.12, 0.38)       (0.17, 0.46)      (0.11, 0.33)  
        HYSTTEUL                                                                                  
          Total patient-years at risk             6720.0             6782.1            5236.1     
          Number of adverse events observed         20                 9                  9       
          AE rate per 100 patient-years            0.30               0.13              0.17      
          95% CI                               (0.17, 0.43)       (0.05, 0.22)      (0.06, 0.28)  
        AETTE1                                                                                    
          Total patient-years at risk              162.4             103.8              172.6     
          Number of adverse events observed         77                104                67       
          AE rate per 100 patient-years            47.42             100.15             38.82     
          95% CI                              (36.83, 58.01)    (80.90, 119.40)    (29.53, 48.12) 
        AETTE2                                                                                    
          Total patient-years at risk              135.5              80.1              127.8     
          Number of adverse events observed         88                123                88       
          AE rate per 100 patient-years            64.93             153.62             68.84     
          95% CI                              (51.36, 78.49)    (126.48, 180.77)   (54.46, 83.23) 

---

    Code
      cat(formatters::export_as_txt(res2, lpp = 100))
    Output
                                                 A: Drug X          B: Placebo      C: Combination 
                                                  (N=134)            (N=134)            (N=132)    
        ———————————————————————————————————————————————————————————————————————————————————————————
        AEREPTTE                                                                                   
          Total patient-years at risk              337.9              331.8              341.6     
          Number of adverse events observed         134                134                132      
          AE rate per 100 patient-years            39.66              40.38              38.64     
          90% CI                               (34.33, 45.61)     (34.96, 46.45)    (33.42, 44.49) 
        AETTE3                                                                                     
          Total patient-years at risk               89.3               59.2              91.8      
          Number of adverse events observed         106                123                103      
          AE rate per 100 patient-years            118.75             207.62            112.21     
          90% CI                              (100.95, 138.94)   (178.60, 240.25)   (95.16, 131.58)
        HYSTTEBL                                                                                   
          Total patient-years at risk              5623.1             5681.4            6769.3     
          Number of adverse events observed          14                 18                15       
          AE rate per 100 patient-years             0.25               0.32              0.22      
          90% CI                                (0.16, 0.38)       (0.21, 0.46)      (0.14, 0.33)  
        HYSTTEUL                                                                                   
          Total patient-years at risk              6720.0             6782.1            5236.1     
          Number of adverse events observed          20                 9                  9       
          AE rate per 100 patient-years             0.30               0.13              0.17      
          90% CI                                (0.20, 0.42)       (0.07, 0.22)      (0.10, 0.29)  
        AETTE1                                                                                     
          Total patient-years at risk              162.4              103.8              172.6     
          Number of adverse events observed          77                104                67       
          AE rate per 100 patient-years            47.42              100.15             38.82     
          90% CI                               (39.17, 56.98)    (85.00, 117.35)    (31.62, 47.26) 
        AETTE2                                                                                     
          Total patient-years at risk              135.5               80.1              127.8     
          Number of adverse events observed          88                123                88       
          AE rate per 100 patient-years            64.93              153.62             68.84     
          90% CI                               (54.31, 77.11)    (132.15, 177.77)   (57.59, 81.77) 

