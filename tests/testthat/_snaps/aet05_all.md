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
          AE rate per 100 patient-years                          135.27            122.06     
          95% CI                                             (99.84, 170.70)   (89.50, 154.61)
        Number of occurrences of any adverse event                                            
          Total patient-years at risk                             41.4              44.2      
          Number of adverse events observed                        29                49       
          AE rate per 100 patient-years                           70.05            110.76     
          95% CI                                             (44.55, 95.55)    (79.75, 141.77)
        Number of occurrences of any serious adverse event                                    
          Total patient-years at risk                             41.4              44.2      
          Number of adverse events observed                         9                36       
          AE rate per 100 patient-years                           21.74             81.37     
          95% CI                                              (7.54, 35.94)    (54.79, 107.95)
      \s\n                                                        C: Combination 
                                                                  (N=15)     
        —————————————————————————————————————————————————————————————————————
        Number of occurrences of a grade 3-5 adverse event                   
          Total patient-years at risk                              44.4      
          Number of adverse events observed                         95       
          AE rate per 100 patient-years                           214.00     
          95% CI                                             (170.97, 257.04)
        Number of occurrences of any adverse event                           
          Total patient-years at risk                              44.4      
          Number of adverse events observed                         56       
          AE rate per 100 patient-years                           126.15     
          95% CI                                             (93.11, 159.19) 
        Number of occurrences of any serious adverse event                   
          Total patient-years at risk                              44.4      
          Number of adverse events observed                         60       
          AE rate per 100 patient-years                           135.16     
          95% CI                                             (100.96, 169.36)

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
          AE rate per 100 patient-years                           135.27            122.06     
          90% CI                                             (108.05, 167.65)   (97.09, 151.86)
        Number of occurrences of any adverse event                                             
          Total patient-years at risk                              41.4              44.2      
          Number of adverse events observed                         29                49       
          AE rate per 100 patient-years                           70.05             110.76     
          90% CI                                              (51.13, 94.12)    (87.08, 139.26)
        Number of occurrences of any serious adverse event                                     
          Total patient-years at risk                              41.4              44.2      
          Number of adverse events observed                         9                 36       
          AE rate per 100 patient-years                           21.74              81.37     
          90% CI                                              (12.21, 36.40)    (61.40, 106.17)
      \s\n                                                        C: Combination 
                                                                  (N=15)     
        —————————————————————————————————————————————————————————————————————
        Number of occurrences of a grade 3-5 adverse event                   
          Total patient-years at risk                              44.4      
          Number of adverse events observed                         95       
          AE rate per 100 patient-years                           214.00     
          90% CI                                             (180.25, 252.57)
        Number of occurrences of any adverse event                           
          Total patient-years at risk                              44.4      
          Number of adverse events observed                         56       
          AE rate per 100 patient-years                           126.15     
          90% CI                                             (100.76, 156.35)
        Number of occurrences of any serious adverse event                   
          Total patient-years at risk                              44.4      
          Number of adverse events observed                         60       
          AE rate per 100 patient-years                           135.16     
          90% CI                                             (108.80, 166.33)

