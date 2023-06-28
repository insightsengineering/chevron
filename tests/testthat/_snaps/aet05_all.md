# aet05_all can handle NA values

    Code
      cat(formatters::export_as_txt(res, lpp = 100))
    Output
                                                             A: Drug X   B: Placebo   C: Combination
                                                              (N=134)     (N=134)        (N=132)    
        ————————————————————————————————————————————————————————————————————————————————————————————
        Number of occurrences of a grade 3-5 adverse event                                          
          Total patient-years at risk                           0.0         0.0            0.0      
          Number of adverse events observed                      0           0              0       
          AE rate per 100 patient-years                         NA           NA             NA      
          95% CI                                                NA           NA             NA      
        Number of occurrences of any adverse event                                                  
          Total patient-years at risk                           0.0         0.0            0.0      
          Number of adverse events observed                      0           0              0       
          AE rate per 100 patient-years                         NA           NA             NA      
          95% CI                                                NA           NA             NA      
        Number of occurrences of any serious adverse event                                          
          Total patient-years at risk                           0.0         0.0            0.0      
          Number of adverse events observed                      0           0              0       
          AE rate per 100 patient-years                         NA           NA             NA      
          95% CI                                                NA           NA             NA      

# aet05_all can handle some NA values

    Code
      cat(formatters::export_as_txt(res1, lpp = 100))
    Output
                                                                A: Drug X          B: Placebo   
                                                                 (N=134)            (N=134)     
        ————————————————————————————————————————————————————————————————————————————————————————
        Number of occurrences of a grade 3-5 adverse event                                      
          Total patient-years at risk                             335.9              331.8      
          Number of adverse events observed                        528                465       
          AE rate per 100 patient-years                           157.17             140.13     
          95% CI                                             (143.76, 170.57)   (127.39, 152.87)
        Number of occurrences of any adverse event                                              
          Total patient-years at risk                             335.9              331.8      
          Number of adverse events observed                        334                380       
          AE rate per 100 patient-years                           99.42              114.52     
          95% CI                                             (88.76, 110.08)    (103.00, 126.03)
        Number of occurrences of any serious adverse event                                      
          Total patient-years at risk                             335.9              331.8      
          Number of adverse events observed                        354                331       
          AE rate per 100 patient-years                           105.37             99.75      
          95% CI                                             (94.40, 116.35)    (89.00, 110.49) 
      \s\n                                                        C: Combination 
                                                                 (N=132)     
        —————————————————————————————————————————————————————————————————————
        Number of occurrences of a grade 3-5 adverse event                   
          Total patient-years at risk                             341.6      
          Number of adverse events observed                        652       
          AE rate per 100 patient-years                           190.87     
          95% CI                                             (176.22, 205.53)
        Number of occurrences of any adverse event                           
          Total patient-years at risk                             341.6      
          Number of adverse events observed                        397       
          AE rate per 100 patient-years                           116.22     
          95% CI                                             (104.79, 127.66)
        Number of occurrences of any serious adverse event                   
          Total patient-years at risk                             341.6      
          Number of adverse events observed                        446       
          AE rate per 100 patient-years                           130.57     
          95% CI                                             (118.45, 142.69)

---

    Code
      cat(formatters::export_as_txt(res2, lpp = 100))
    Output
                                                                A: Drug X          B: Placebo   
                                                                 (N=134)            (N=134)     
        ————————————————————————————————————————————————————————————————————————————————————————
        Number of occurrences of a grade 3-5 adverse event                                      
          Total patient-years at risk                             335.9              331.8      
          Number of adverse events observed                        528                465       
          AE rate per 100 patient-years                           157.17             140.13     
          90% CI                                             (146.23, 168.74)   (129.76, 151.14)
        Number of occurrences of any adverse event                                              
          Total patient-years at risk                             335.9              331.8      
          Number of adverse events observed                        334                380       
          AE rate per 100 patient-years                           99.42              114.52     
          90% CI                                             (90.79, 108.69)    (105.17, 124.50)
        Number of occurrences of any serious adverse event                                      
          Total patient-years at risk                             335.9              331.8      
          Number of adverse events observed                        354                331       
          AE rate per 100 patient-years                           105.37             99.75      
          90% CI                                             (96.48, 114.91)    (91.05, 109.09) 
      \s\n                                                        C: Combination 
                                                                 (N=132)     
        —————————————————————————————————————————————————————————————————————
        Number of occurrences of a grade 3-5 adverse event                   
          Total patient-years at risk                             341.6      
          Number of adverse events observed                        652       
          AE rate per 100 patient-years                           190.87     
          90% CI                                             (178.89, 203.49)
        Number of occurrences of any adverse event                           
          Total patient-years at risk                             341.6      
          Number of adverse events observed                        397       
          AE rate per 100 patient-years                           116.22     
          90% CI                                             (106.94, 126.13)
        Number of occurrences of any serious adverse event                   
          Total patient-years at risk                             341.6      
          Number of adverse events observed                        446       
          AE rate per 100 patient-years                           130.57     
          90% CI                                             (120.71, 141.05)

