# aet05 can handle NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                A: Drug X   B: Placebo   C: Combination
                                                                 (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————————————————
        Time to first occurrence of a grade 3-5 adverse event                                          
          Total patient-years at risk                              0.0         0.0            0.0      
          Number of adverse events observed                         0           0              0       
          AE rate per 100 patient-years                            NE           NE             NE      
          95% CI                                                   NE           NE             NE      
        Time to first occurrence of any adverse event                                                  
          Total patient-years at risk                              0.0         0.0            0.0      
          Number of adverse events observed                         0           0              0       
          AE rate per 100 patient-years                            NE           NE             NE      
          95% CI                                                   NE           NE             NE      
        Time to first occurrence of any serious adverse event                                          
          Total patient-years at risk                              0.0         0.0            0.0      
          Number of adverse events observed                         0           0              0       
          AE rate per 100 patient-years                            NE           NE             NE      
          95% CI                                                   NE           NE             NE      

# aet05 can handle some NA values

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
                                                                   A: Drug X         B: Placebo   
                                                                    (N=15)             (N=15)     
        ——————————————————————————————————————————————————————————————————————————————————————————
        Time to first occurrence of a grade 3-5 adverse event                                     
          Total patient-years at risk                                10.3               6.3       
          Number of adverse events observed                           12                 14       
          AE rate per 100 patient-years                             116.36             223.84     
          95% CI                                                (50.53, 182.20)   (106.59, 341.09)
        Time to first occurrence of any adverse event                                             
          Total patient-years at risk                                28.0               9.0       
          Number of adverse events observed                            5                 13       
          AE rate per 100 patient-years                              17.86             143.84     
          95% CI                                                 (2.20, 33.51)    (65.65, 222.03) 
        Time to first occurrence of any serious adverse event                                     
          Total patient-years at risk                                29.9               7.6       
          Number of adverse events observed                            4                 14       
          AE rate per 100 patient-years                              13.37             183.83     
          95% CI                                                 (0.27, 26.46)    (87.53, 280.12) 
      \s\n                                                          C: Combination 
                                                                    (N=15)     
        ———————————————————————————————————————————————————————————————————————
        Time to first occurrence of a grade 3-5 adverse event                  
          Total patient-years at risk                                 8.3      
          Number of adverse events observed                           13       
          AE rate per 100 patient-years                             156.98     
          95% CI                                                (71.65, 242.32)
        Time to first occurrence of any adverse event                          
          Total patient-years at risk                                22.0      
          Number of adverse events observed                            8       
          AE rate per 100 patient-years                              36.30     
          95% CI                                                (11.15, 61.46) 
        Time to first occurrence of any serious adverse event                  
          Total patient-years at risk                                 9.4      
          Number of adverse events observed                           13       
          AE rate per 100 patient-years                             137.79     
          95% CI                                                (62.89, 212.68)

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
                                                                   A: Drug X         B: Placebo   
                                                                    (N=15)             (N=15)     
        ——————————————————————————————————————————————————————————————————————————————————————————
        Time to first occurrence of a grade 3-5 adverse event                                     
          Total patient-years at risk                                10.3               6.3       
          Number of adverse events observed                           12                 14       
          AE rate per 100 patient-years                             116.36             223.84     
          90% CI                                                (70.83, 182.52)   (141.55, 340.16)
        Time to first occurrence of any adverse event                                             
          Total patient-years at risk                                28.0               9.0       
          Number of adverse events observed                            5                 13       
          AE rate per 100 patient-years                              17.86             143.84     
          90% CI                                                 (8.16, 35.11)    (89.34, 221.88) 
        Time to first occurrence of any serious adverse event                                     
          Total patient-years at risk                                29.9               7.6       
          Number of adverse events observed                            4                 14       
          AE rate per 100 patient-years                              13.37             183.83     
          90% CI                                                 (5.54, 28.24)    (116.25, 279.36)
      \s\n                                                          C: Combination 
                                                                    (N=15)     
        ———————————————————————————————————————————————————————————————————————
        Time to first occurrence of a grade 3-5 adverse event                  
          Total patient-years at risk                                 8.3      
          Number of adverse events observed                           13       
          AE rate per 100 patient-years                             156.98     
          90% CI                                                (97.50, 242.16)
        Time to first occurrence of any adverse event                          
          Total patient-years at risk                                22.0      
          Number of adverse events observed                            8       
          AE rate per 100 patient-years                              36.30     
          90% CI                                                (19.67, 62.57) 
        Time to first occurrence of any serious adverse event                  
          Total patient-years at risk                                 9.4      
          Number of adverse events observed                           13       
          AE rate per 100 patient-years                             137.79     
          90% CI                                                (85.58, 212.54)

