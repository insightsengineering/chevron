# aet05 can handle NA values

    Code
      cat(formatters::export_as_txt(res, lpp = 100))
    Output
                                                                A: Drug X   B: Placebo   C: Combination
                                                                 (N=134)     (N=134)        (N=132)    
        ———————————————————————————————————————————————————————————————————————————————————————————————
        Time to first occurrence of a grade 3-5 adverse event                                          
          Total patient-years at risk                              0.0         0.0            0.0      
          Number of adverse events observed                         0           0              0       
          AE rate per 100 patient-years                            NA           NA             NA      
          95% CI                                                   NA           NA             NA      
        Time to first occurrence of any adverse event                                                  
          Total patient-years at risk                              0.0         0.0            0.0      
          Number of adverse events observed                         0           0              0       
          AE rate per 100 patient-years                            NA           NA             NA      
          95% CI                                                   NA           NA             NA      
        Time to first occurrence of any serious adverse event                                          
          Total patient-years at risk                              0.0         0.0            0.0      
          Number of adverse events observed                         0           0              0       
          AE rate per 100 patient-years                            NA           NA             NA      
          95% CI                                                   NA           NA             NA      

# aet05 can handle some NA values

    Code
      cat(formatters::export_as_txt(res1, lpp = 100))
    Output
                                                                   A: Drug X         B: Placebo   
                                                                    (N=134)           (N=134)     
        ——————————————————————————————————————————————————————————————————————————————————————————
        Time to first occurrence of a grade 3-5 adverse event                                     
          Total patient-years at risk                                89.3               59.2      
          Number of adverse events observed                           106               123       
          AE rate per 100 patient-years                             118.75             207.62     
          95% CI                                                (96.14, 141.35)   (170.93, 244.31)
        Time to first occurrence of any adverse event                                             
          Total patient-years at risk                                162.4             103.8      
          Number of adverse events observed                           77                104       
          AE rate per 100 patient-years                              47.42             100.15     
          95% CI                                                (36.83, 58.01)    (80.90, 119.40) 
        Time to first occurrence of any serious adverse event                                     
          Total patient-years at risk                                135.5              80.1      
          Number of adverse events observed                           88                123       
          AE rate per 100 patient-years                              64.93             153.62     
          95% CI                                                (51.36, 78.49)    (126.48, 180.77)
      \s\n                                                          C: Combination 
                                                                    (N=132)    
        ———————————————————————————————————————————————————————————————————————
        Time to first occurrence of a grade 3-5 adverse event                  
          Total patient-years at risk                                91.8      
          Number of adverse events observed                           103      
          AE rate per 100 patient-years                             112.21     
          95% CI                                                (90.54, 133.87)
        Time to first occurrence of any adverse event                          
          Total patient-years at risk                                172.6     
          Number of adverse events observed                           67       
          AE rate per 100 patient-years                              38.82     
          95% CI                                                (29.53, 48.12) 
        Time to first occurrence of any serious adverse event                  
          Total patient-years at risk                                127.8     
          Number of adverse events observed                           88       
          AE rate per 100 patient-years                              68.84     
          95% CI                                                (54.46, 83.23) 

---

    Code
      cat(formatters::export_as_txt(res2, lpp = 100))
    Output
                                                                   A: Drug X          B: Placebo   
                                                                    (N=134)            (N=134)     
        ———————————————————————————————————————————————————————————————————————————————————————————
        Time to first occurrence of a grade 3-5 adverse event                                      
          Total patient-years at risk                                 89.3               59.2      
          Number of adverse events observed                           106                123       
          AE rate per 100 patient-years                              118.75             207.62     
          90% CI                                                (100.95, 138.94)   (178.60, 240.25)
        Time to first occurrence of any adverse event                                              
          Total patient-years at risk                                162.4              103.8      
          Number of adverse events observed                            77                104       
          AE rate per 100 patient-years                              47.42              100.15     
          90% CI                                                 (39.17, 56.98)    (85.00, 117.35) 
        Time to first occurrence of any serious adverse event                                      
          Total patient-years at risk                                135.5               80.1      
          Number of adverse events observed                            88                123       
          AE rate per 100 patient-years                              64.93              153.62     
          90% CI                                                 (54.31, 77.11)    (132.15, 177.77)
      \s\n                                                          C: Combination 
                                                                    (N=132)    
        ———————————————————————————————————————————————————————————————————————
        Time to first occurrence of a grade 3-5 adverse event                  
          Total patient-years at risk                                91.8      
          Number of adverse events observed                           103      
          AE rate per 100 patient-years                             112.21     
          90% CI                                                (95.16, 131.58)
        Time to first occurrence of any adverse event                          
          Total patient-years at risk                                172.6     
          Number of adverse events observed                           67       
          AE rate per 100 patient-years                              38.82     
          90% CI                                                (31.62, 47.26) 
        Time to first occurrence of any serious adverse event                  
          Total patient-years at risk                                127.8     
          Number of adverse events observed                           88       
          AE rate per 100 patient-years                              68.84     
          90% CI                                                (57.59, 81.77) 

