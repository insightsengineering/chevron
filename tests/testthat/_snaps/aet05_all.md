# aet05_all can handle NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                             A: Drug X   B: Placebo   C: Combination
                                                              (N=15)       (N=15)         (N=15)    
        ————————————————————————————————————————————————————————————————————————————————————————————
        Number of occurrences of a grade 3-5 adverse event                                          
          Total patient-years at risk                           0.0         0.0            0.0      
          Number of adverse events observed                      0           0              0       
          AE rate per 100 patient-years                         NE           NE             NE      
          95% CI                                                NE           NE             NE      
        Number of occurrences of any adverse event                                                  
          Total patient-years at risk                           0.0         0.0            0.0      
          Number of adverse events observed                      0           0              0       
          AE rate per 100 patient-years                         NE           NE             NE      
          95% CI                                                NE           NE             NE      
        Number of occurrences of any serious adverse event                                          
          Total patient-years at risk                           0.0         0.0            0.0      
          Number of adverse events observed                      0           0              0       
          AE rate per 100 patient-years                         NE           NE             NE      
          95% CI                                                NE           NE             NE      

# aet05_all can handle some NA values

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
                                                                A: Drug X        B: Placebo   
                                                                 (N=15)            (N=15)     
        ——————————————————————————————————————————————————————————————————————————————————————
        Number of occurrences of a grade 3-5 adverse event                                    
          Total patient-years at risk                             41.4              44.2      
          Number of adverse events observed                        56                54       
          AE rate per 100 patient-years                          135.28            122.08     
          95% CI                                             (99.85, 170.71)   (89.52, 154.64)
        Number of occurrences of any adverse event                                            
          Total patient-years at risk                             41.4              44.2      
          Number of adverse events observed                        29                49       
          AE rate per 100 patient-years                           70.05            110.78     
          95% CI                                             (44.56, 95.55)    (79.76, 141.79)
        Number of occurrences of any serious adverse event                                    
          Total patient-years at risk                             41.4              44.2      
          Number of adverse events observed                         9                36       
          AE rate per 100 patient-years                           21.74             81.39     
          95% CI                                              (7.54, 35.94)    (54.80, 107.97)
      \s\n                                                        C: Combination 
                                                                  (N=15)     
        —————————————————————————————————————————————————————————————————————
        Number of occurrences of a grade 3-5 adverse event                   
          Total patient-years at risk                              44.4      
          Number of adverse events observed                         95       
          AE rate per 100 patient-years                           214.02     
          95% CI                                             (170.98, 257.05)
        Number of occurrences of any adverse event                           
          Total patient-years at risk                              44.4      
          Number of adverse events observed                         56       
          AE rate per 100 patient-years                           126.16     
          95% CI                                             (93.12, 159.20) 
        Number of occurrences of any serious adverse event                   
          Total patient-years at risk                              44.4      
          Number of adverse events observed                         60       
          AE rate per 100 patient-years                           135.17     
          95% CI                                             (100.97, 169.37)

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
                                                                A: Drug X         B: Placebo   
                                                                  (N=15)            (N=15)     
        ———————————————————————————————————————————————————————————————————————————————————————
        Number of occurrences of a grade 3-5 adverse event                                     
          Total patient-years at risk                              41.4              44.2      
          Number of adverse events observed                         56                54       
          AE rate per 100 patient-years                           135.28            122.08     
          90% CI                                             (108.05, 167.66)   (97.10, 151.89)
        Number of occurrences of any adverse event                                             
          Total patient-years at risk                              41.4              44.2      
          Number of adverse events observed                         29                49       
          AE rate per 100 patient-years                           70.05             110.78     
          90% CI                                              (51.14, 94.12)    (87.09, 139.29)
        Number of occurrences of any serious adverse event                                     
          Total patient-years at risk                              41.4              44.2      
          Number of adverse events observed                         9                 36       
          AE rate per 100 patient-years                           21.74              81.39     
          90% CI                                              (12.21, 36.40)    (61.41, 106.19)
      \s\n                                                        C: Combination 
                                                                  (N=15)     
        —————————————————————————————————————————————————————————————————————
        Number of occurrences of a grade 3-5 adverse event                   
          Total patient-years at risk                              44.4      
          Number of adverse events observed                         95       
          AE rate per 100 patient-years                           214.02     
          90% CI                                             (180.26, 252.59)
        Number of occurrences of any adverse event                           
          Total patient-years at risk                              44.4      
          Number of adverse events observed                         56       
          AE rate per 100 patient-years                           126.16     
          90% CI                                             (100.77, 156.36)
        Number of occurrences of any serious adverse event                   
          Total patient-years at risk                              44.4      
          Number of adverse events observed                         60       
          AE rate per 100 patient-years                           135.17     
          90% CI                                             (108.81, 166.34)

