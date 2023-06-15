# aet05_all can handle NA values

    Code
      cat(formatters::export_as_txt(res, lpp = 100))
    Output
                                              A: Drug X   B: Placebo   C: Combination
                                               (N=134)     (N=134)        (N=132)    
        —————————————————————————————————————————————————————————————————————————————
        AETOT1                                                                       
          Total patient-years at risk            0.0         0.0            0.0      
          Number of adverse events observed       0           0              0       
          AE rate per 100 patient-years          NA           NA             NA      
          95% CI                                 NA           NA             NA      
        AETOT2                                                                       
          Total patient-years at risk            0.0         0.0            0.0      
          Number of adverse events observed       0           0              0       
          AE rate per 100 patient-years          NA           NA             NA      
          95% CI                                 NA           NA             NA      
        AETOT3                                                                       
          Total patient-years at risk            0.0         0.0            0.0      
          Number of adverse events observed       0           0              0       
          AE rate per 100 patient-years          NA           NA             NA      
          95% CI                                 NA           NA             NA      

# aet05_all can handle some NA values

    Code
      cat(formatters::export_as_txt(res1, lpp = 100))
    Output
                                                 A: Drug X          B: Placebo       C: Combination 
                                                  (N=134)            (N=134)            (N=132)     
        ————————————————————————————————————————————————————————————————————————————————————————————
        AETOT1                                                                                      
          Total patient-years at risk              335.9              331.8              341.6      
          Number of adverse events observed         334                380                397       
          AE rate per 100 patient-years            99.42              114.52             116.22     
          95% CI                              (88.76, 110.08)    (103.00, 126.03)   (104.79, 127.66)
        AETOT2                                                                                      
          Total patient-years at risk              335.9              331.8              341.6      
          Number of adverse events observed         354                331                446       
          AE rate per 100 patient-years            105.37             99.75              130.57     
          95% CI                              (94.40, 116.35)    (89.00, 110.49)    (118.45, 142.69)
        AETOT3                                                                                      
          Total patient-years at risk              335.9              331.8              341.6      
          Number of adverse events observed         528                465                652       
          AE rate per 100 patient-years            157.17             140.13             190.87     
          95% CI                              (143.76, 170.57)   (127.39, 152.87)   (176.22, 205.53)

---

    Code
      cat(formatters::export_as_txt(res2, lpp = 100))
    Output
                                                 A: Drug X          B: Placebo       C: Combination 
                                                  (N=134)            (N=134)            (N=132)     
        ————————————————————————————————————————————————————————————————————————————————————————————
        AETOT1                                                                                      
          Total patient-years at risk              335.9              331.8              341.6      
          Number of adverse events observed         334                380                397       
          AE rate per 100 patient-years            99.42              114.52             116.22     
          90% CI                              (90.79, 108.69)    (105.17, 124.50)   (106.94, 126.13)
        AETOT2                                                                                      
          Total patient-years at risk              335.9              331.8              341.6      
          Number of adverse events observed         354                331                446       
          AE rate per 100 patient-years            105.37             99.75              130.57     
          90% CI                              (96.48, 114.91)    (91.05, 109.09)    (120.71, 141.05)
        AETOT3                                                                                      
          Total patient-years at risk              335.9              331.8              341.6      
          Number of adverse events observed         528                465                652       
          AE rate per 100 patient-years            157.17             140.13             190.87     
          90% CI                              (146.23, 168.74)   (129.76, 151.14)   (178.89, 203.49)

