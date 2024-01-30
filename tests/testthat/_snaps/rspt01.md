# rspt01 works as expected

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                              A: Drug X         B: Placebo        C: Combination  
                                               (N=15)             (N=15)              (N=15)      
      ————————————————————————————————————————————————————————————————————————————————————————————
      Responders                             15 (100.0%)        14 (93.3%)          15 (100.0%)   
      95% CI (Wald, with correction)        (96.7, 100.0)      (77.4, 100.0)       (96.7, 100.0)  
      Unstratified Analysis                                                                       
        Difference in Response rate (%)                            -6.7                 0.0       
          95% CI (Wald, with correction)                       (-26.0, 12.6)        (-6.7, 6.7)   
        p-value (Fisher's Exact Test)                             1.0000              1.0000      
      Odds Ratio (95% CI)                                    0.00 (0.00 - Inf)   1.00 (0.00 - Inf)
      Complete Response (CR)                 15 (100.0%)        11 (73.3%)          14 (93.3%)    
        95% CI (Wald, with correction)     (96.67, 100.00)    (47.62, 99.05)      (77.38, 100.00) 
      Partial Response (PR)                   0 (0.0%)           3 (20.0%)           1 (6.7%)     
        95% CI (Wald, with correction)      (0.00, 3.33)       (0.00, 43.58)       (0.00, 22.62)  
      Stable Disease (SD)                     0 (0.0%)           1 (6.7%)            0 (0.0%)     
        95% CI (Wald, with correction)      (0.00, 3.33)       (0.00, 22.62)       (0.00, 3.33)   

# rspt01 works as expected for stratified and unstratified analysis

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                      A: Drug X        B: Placebo     C: Combination 
                                                       (N=15)            (N=15)           (N=15)     
        —————————————————————————————————————————————————————————————————————————————————————————————
        Responders                                   15 (100.0%)       14 (93.3%)       15 (100.0%)  
        95% CI (Wald, with correction)              (96.7, 100.0)    (77.4, 100.0)     (96.7, 100.0) 
        Unstratified Analysis                                                                        
          Difference in Response rate (%)                                 -6.7              0.0      
            95% CI (Wald, with correction)                           (-26.0, 12.6)      (-6.7, 6.7)  
          p-value (Fisher's Exact Test)                                  1.0000           1.0000     
        Stratified Analysis                                                                          
          Difference in Response rate (%)                                 -7.1              0.0      
            95% CI (CMH, without correction)                          (-20.1, 6.0)      (0.0, 0.0)   
          p-value (Cochran-Mantel-Haenszel Test)                         0.2918             NE       
        Complete Response (CR)                       15 (100.0%)       11 (73.3%)       14 (93.3%)   
          95% CI (Wald, with correction)           (96.67, 100.00)   (47.62, 99.05)   (77.38, 100.00)
        Partial Response (PR)                         0 (0.0%)         3 (20.0%)         1 (6.7%)    
          95% CI (Wald, with correction)            (0.00, 3.33)     (0.00, 43.58)     (0.00, 22.62) 
        Stable Disease (SD)                           0 (0.0%)          1 (6.7%)         0 (0.0%)    
          95% CI (Wald, with correction)            (0.00, 3.33)     (0.00, 22.62)     (0.00, 3.33)  

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                      A: Drug X         B: Placebo        C: Combination  
                                                       (N=15)             (N=15)              (N=15)      
        ——————————————————————————————————————————————————————————————————————————————————————————————————
        Responders                                   15 (100.0%)        14 (93.3%)          15 (100.0%)   
        95% CI (Wald, with correction)              (96.7, 100.0)      (77.4, 100.0)       (96.7, 100.0)  
        Stratified Analysis                                                                               
          Difference in Response rate (%)                                  -7.1                 0.0       
            95% CI (CMH, without correction)                           (-20.1, 6.0)         (0.0, 0.0)    
          p-value (Cochran-Mantel-Haenszel Test)                          0.2918                NE        
        Odds Ratio (95% CI)                                          0.00 (0.00 - Inf)   1.00 (0.00 - Inf)
        Unstratified Analysis                                                                             
          Difference in Response rate (%)                                  -6.7                 0.0       
            95% CI (Wald, with correction)                             (-26.0, 12.6)        (-6.7, 6.7)   
          p-value (Fisher's Exact Test)                                   1.0000              1.0000      
        Odds Ratio (95% CI)                                          0.00 (0.00 - Inf)   1.00 (0.00 - Inf)
        Complete Response (CR)                       15 (100.0%)        11 (73.3%)          14 (93.3%)    
          95% CI (Wald, with correction)           (96.67, 100.00)    (47.62, 99.05)      (77.38, 100.00) 
        Partial Response (PR)                         0 (0.0%)           3 (20.0%)           1 (6.7%)     
          95% CI (Wald, with correction)            (0.00, 3.33)       (0.00, 43.58)       (0.00, 22.62)  
        Stable Disease (SD)                           0 (0.0%)           1 (6.7%)            0 (0.0%)     
          95% CI (Wald, with correction)            (0.00, 3.33)       (0.00, 22.62)       (0.00, 3.33)   

# rspt01 works as expected for unstratified analysis only

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                A: Drug X        B: Placebo     C: Combination 
                                                 (N=15)            (N=15)           (N=15)     
        ———————————————————————————————————————————————————————————————————————————————————————
        Responders                             15 (100.0%)       14 (93.3%)       15 (100.0%)  
        95% CI (Wald, with correction)        (96.7, 100.0)    (77.4, 100.0)     (96.7, 100.0) 
        Unstratified Analysis                                                                  
          Difference in Response rate (%)                           -6.7              0.0      
            95% CI (Wald, with correction)                     (-26.0, 12.6)      (-6.7, 6.7)  
          p-value (Fisher's Exact Test)                            1.0000           1.0000     
        Complete Response (CR)                 15 (100.0%)       11 (73.3%)       14 (93.3%)   
          95% CI (Wald, with correction)     (96.67, 100.00)   (47.62, 99.05)   (77.38, 100.00)
        Partial Response (PR)                   0 (0.0%)         3 (20.0%)         1 (6.7%)    
          95% CI (Wald, with correction)      (0.00, 3.33)     (0.00, 43.58)     (0.00, 22.62) 
        Stable Disease (SD)                     0 (0.0%)          1 (6.7%)         0 (0.0%)    
          95% CI (Wald, with correction)      (0.00, 3.33)     (0.00, 22.62)     (0.00, 3.33)  

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                A: Drug X         B: Placebo        C: Combination  
                                                 (N=15)             (N=15)              (N=15)      
        ————————————————————————————————————————————————————————————————————————————————————————————
        Responders                             15 (100.0%)        14 (93.3%)          15 (100.0%)   
        95% CI (Wald, with correction)        (96.7, 100.0)      (77.4, 100.0)       (96.7, 100.0)  
        Unstratified Analysis                                                                       
          Difference in Response rate (%)                            -6.7                 0.0       
            95% CI (Wald, with correction)                       (-26.0, 12.6)        (-6.7, 6.7)   
          p-value (Fisher's Exact Test)                             1.0000              1.0000      
        Odds Ratio (95% CI)                                    0.00 (0.00 - Inf)   1.00 (0.00 - Inf)
        Complete Response (CR)                 15 (100.0%)        11 (73.3%)          14 (93.3%)    
          95% CI (Wald, with correction)     (96.67, 100.00)    (47.62, 99.05)      (77.38, 100.00) 
        Partial Response (PR)                   0 (0.0%)           3 (20.0%)           1 (6.7%)     
          95% CI (Wald, with correction)      (0.00, 3.33)       (0.00, 43.58)       (0.00, 22.62)  
        Stable Disease (SD)                     0 (0.0%)           1 (6.7%)            0 (0.0%)     
          95% CI (Wald, with correction)      (0.00, 3.33)       (0.00, 22.62)       (0.00, 3.33)   

# rspt01 works as expected for stratified analysis only

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                      A: Drug X        B: Placebo     C: Combination 
                                                       (N=15)            (N=15)           (N=15)     
        —————————————————————————————————————————————————————————————————————————————————————————————
        Responders                                   15 (100.0%)       14 (93.3%)       15 (100.0%)  
        95% CI (Wald, with correction)              (96.7, 100.0)    (77.4, 100.0)     (96.7, 100.0) 
        Stratified Analysis                                                                          
          Difference in Response rate (%)                                 -7.1              0.0      
            95% CI (CMH, without correction)                          (-20.1, 6.0)      (0.0, 0.0)   
          p-value (Cochran-Mantel-Haenszel Test)                         0.2918             NE       
        Complete Response (CR)                       15 (100.0%)       11 (73.3%)       14 (93.3%)   
          95% CI (Wald, with correction)           (96.67, 100.00)   (47.62, 99.05)   (77.38, 100.00)
        Partial Response (PR)                         0 (0.0%)         3 (20.0%)         1 (6.7%)    
          95% CI (Wald, with correction)            (0.00, 3.33)     (0.00, 43.58)     (0.00, 22.62) 
        Stable Disease (SD)                           0 (0.0%)          1 (6.7%)         0 (0.0%)    
          95% CI (Wald, with correction)            (0.00, 3.33)     (0.00, 22.62)     (0.00, 3.33)  

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                      A: Drug X         B: Placebo        C: Combination  
                                                       (N=15)             (N=15)              (N=15)      
        ——————————————————————————————————————————————————————————————————————————————————————————————————
        Responders                                   15 (100.0%)        14 (93.3%)          15 (100.0%)   
        95% CI (Wald, with correction)              (96.7, 100.0)      (77.4, 100.0)       (96.7, 100.0)  
        Stratified Analysis                                                                               
          Difference in Response rate (%)                                  -7.1                 0.0       
            95% CI (CMH, without correction)                           (-20.1, 6.0)         (0.0, 0.0)    
          p-value (Cochran-Mantel-Haenszel Test)                          0.2918                NE        
        Odds Ratio (95% CI)                                          0.00 (0.00 - Inf)   1.00 (0.00 - Inf)
        Complete Response (CR)                       15 (100.0%)        11 (73.3%)          14 (93.3%)    
          95% CI (Wald, with correction)           (96.67, 100.00)    (47.62, 99.05)      (77.38, 100.00) 
        Partial Response (PR)                         0 (0.0%)           3 (20.0%)           1 (6.7%)     
          95% CI (Wald, with correction)            (0.00, 3.33)       (0.00, 43.58)       (0.00, 22.62)  
        Stable Disease (SD)                           0 (0.0%)           1 (6.7%)            0 (0.0%)     
          95% CI (Wald, with correction)            (0.00, 3.33)       (0.00, 22.62)       (0.00, 3.33)   

# rspt01 works if change reference group

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                    A: Drug X             B: Placebo  
                                                      (N=15)                (N=15)    
        ——————————————————————————————————————————————————————————————————————————————
        Responders                                 15 (100.0%)            14 (93.3%)  
        95% CI (Wald, with correction)            (96.7, 100.0)         (77.4, 100.0) 
        Unstratified Analysis                                                         
          Difference in Response rate (%)              6.7                            
            95% CI (Wald, with correction)        (-12.6, 26.0)                       
          p-value (Fisher's Exact Test)               1.0000                          
        Odds Ratio (95% CI)                  61038244.88 (0.00 - Inf)                 
        Complete Response (CR)                     15 (100.0%)            11 (73.3%)  
          95% CI (Wald, with correction)         (96.67, 100.00)        (47.62, 99.05)
        Partial Response (PR)                        0 (0.0%)             3 (20.0%)   
          95% CI (Wald, with correction)           (0.00, 3.33)         (0.00, 43.58) 
        Stable Disease (SD)                          0 (0.0%)              1 (6.7%)   
          95% CI (Wald, with correction)           (0.00, 3.33)         (0.00, 22.62) 
      \s\n                                            C: Combination     
                                                      (N=15)         
        —————————————————————————————————————————————————————————————
        Responders                                 15 (100.0%)       
        95% CI (Wald, with correction)            (96.7, 100.0)      
        Unstratified Analysis                                        
          Difference in Response rate (%)              6.7           
            95% CI (Wald, with correction)        (-12.6, 26.0)      
          p-value (Fisher's Exact Test)               1.0000         
        Odds Ratio (95% CI)                  61038244.88 (0.00 - Inf)
        Complete Response (CR)                      14 (93.3%)       
          95% CI (Wald, with correction)         (77.38, 100.00)     
        Partial Response (PR)                        1 (6.7%)        
          95% CI (Wald, with correction)          (0.00, 22.62)      
        Stable Disease (SD)                          0 (0.0%)        
          95% CI (Wald, with correction)           (0.00, 3.33)      

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                          A: Drug X             B: Placebo  
                                                            (N=15)                (N=15)    
        ————————————————————————————————————————————————————————————————————————————————————
        Responders                                       15 (100.0%)            14 (93.3%)  
        95% CI (Wald, with correction)                  (96.7, 100.0)         (77.4, 100.0) 
        Unstratified Analysis                                                               
          Difference in Response rate (%)                    6.7                            
            95% CI (Wald, with correction)              (-12.6, 26.0)                       
          p-value (Fisher's Exact Test)                     1.0000                          
        Odds Ratio (95% CI)                        61038244.88 (0.00 - Inf)                 
        Stratified Analysis                                                                 
          Difference in Response rate (%)                    7.1                            
            95% CI (CMH, without correction)             (-6.0, 20.1)                       
          p-value (Cochran-Mantel-Haenszel Test)            0.2918                          
        Odds Ratio (95% CI)                        61038244.88 (0.00 - Inf)                 
        Complete Response (CR)                           15 (100.0%)            11 (73.3%)  
          95% CI (Wald, with correction)               (96.67, 100.00)        (47.62, 99.05)
        Partial Response (PR)                              0 (0.0%)             3 (20.0%)   
          95% CI (Wald, with correction)                 (0.00, 3.33)         (0.00, 43.58) 
        Stable Disease (SD)                                0 (0.0%)              1 (6.7%)   
          95% CI (Wald, with correction)                 (0.00, 3.33)         (0.00, 22.62) 
      \s\n                                                  C: Combination     
                                                            (N=15)         
        ———————————————————————————————————————————————————————————————————
        Responders                                       15 (100.0%)       
        95% CI (Wald, with correction)                  (96.7, 100.0)      
        Unstratified Analysis                                              
          Difference in Response rate (%)                    6.7           
            95% CI (Wald, with correction)              (-12.6, 26.0)      
          p-value (Fisher's Exact Test)                     1.0000         
        Odds Ratio (95% CI)                        61038244.88 (0.00 - Inf)
        Stratified Analysis                                                
          Difference in Response rate (%)                    4.6           
            95% CI (CMH, without correction)             (-3.9, 13.2)      
          p-value (Cochran-Mantel-Haenszel Test)            0.5050         
        Odds Ratio (95% CI)                        61038244.88 (0.00 - Inf)
        Complete Response (CR)                            14 (93.3%)       
          95% CI (Wald, with correction)               (77.38, 100.00)     
        Partial Response (PR)                              1 (6.7%)        
          95% CI (Wald, with correction)                (0.00, 22.62)      
        Stable Disease (SD)                                0 (0.0%)        
          95% CI (Wald, with correction)                 (0.00, 3.33)      

# rspt01 works if change statistic methods

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                   A: Drug X          B: Placebo        C: Combination  
                                                     (N=15)             (N=15)              (N=15)      
        ————————————————————————————————————————————————————————————————————————————————————————————————
        Responders                                15 (100.0%)         14 (93.3%)          15 (100.0%)   
        95% CI (Wald, without correction)        (100.0, 100.0)      (80.7, 100.0)      (100.0, 100.0)  
        Unstratified Analysis                                                                           
          Difference in Response rate (%)                                -6.7                 0.0       
            95% CI (Wald, without correction)                        (-19.3, 6.0)         (0.0, 0.0)    
          p-value (Fisher's Exact Test)                                 1.0000              1.0000      
        Odds Ratio (95% CI)                                        0.00 (0.00 - Inf)   1.00 (0.00 - Inf)
        Complete Response (CR)                    15 (100.0%)         11 (73.3%)          14 (93.3%)    
          95% CI (Wald, without correction)     (100.00, 100.00)    (50.95, 95.71)      (80.71, 100.00) 
        Partial Response (PR)                       0 (0.0%)           3 (20.0%)           1 (6.7%)     
          95% CI (Wald, without correction)       (0.00, 0.00)       (0.00, 40.24)       (0.00, 19.29)  
        Stable Disease (SD)                         0 (0.0%)           1 (6.7%)            0 (0.0%)     
          95% CI (Wald, without correction)       (0.00, 0.00)       (0.00, 19.29)       (0.00, 0.00)   

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                   A: Drug X          B: Placebo    
                                                                     (N=15)             (N=15)      
        ————————————————————————————————————————————————————————————————————————————————————————————
        Responders                                                15 (100.0%)         14 (93.3%)    
        95% CI (Wald, without correction)                        (100.0, 100.0)      (80.7, 100.0)  
        Unstratified Analysis                                                                       
          Difference in Response rate (%)                                                -6.7       
            95% CI (Wald, without correction)                                        (-19.3, 6.0)   
          p-value (Fisher's Exact Test)                                                 1.0000      
        Odds Ratio (95% CI)                                                        0.00 (0.00 - Inf)
        Stratified Analysis                                                                         
          Difference in Response rate (%)                                                -6.7       
            95% CI (Anderson-Hauck)                                                  (-23.1, 9.7)   
          p-value (Chi-Squared Test with Schouten Correction)                           0.6171      
        Odds Ratio (95% CI)                                                        0.00 (0.00 - Inf)
        Complete Response (CR)                                    15 (100.0%)         11 (73.3%)    
          95% CI (Wald, without correction)                     (100.00, 100.00)    (50.95, 95.71)  
        Partial Response (PR)                                       0 (0.0%)           3 (20.0%)    
          95% CI (Wald, without correction)                       (0.00, 0.00)       (0.00, 40.24)  
        Stable Disease (SD)                                         0 (0.0%)           1 (6.7%)     
          95% CI (Wald, without correction)                       (0.00, 0.00)       (0.00, 19.29)  
      \s\n                                                           C: Combination  
                                                                     (N=15)      
        —————————————————————————————————————————————————————————————————————————
        Responders                                                 15 (100.0%)   
        95% CI (Wald, without correction)                        (100.0, 100.0)  
        Unstratified Analysis                                                    
          Difference in Response rate (%)                              0.0       
            95% CI (Wald, without correction)                      (0.0, 0.0)    
          p-value (Fisher's Exact Test)                              1.0000      
        Odds Ratio (95% CI)                                     1.00 (0.00 - Inf)
        Stratified Analysis                                                      
          Difference in Response rate (%)                              0.0       
            95% CI (Anderson-Hauck)                                (-3.3, 3.3)   
          p-value (Chi-Squared Test with Schouten Correction)        1.0000      
        Odds Ratio (95% CI)                                     1.00 (0.00 - Inf)
        Complete Response (CR)                                     14 (93.3%)    
          95% CI (Wald, without correction)                      (80.71, 100.00) 
        Partial Response (PR)                                       1 (6.7%)     
          95% CI (Wald, without correction)                       (0.00, 19.29)  
        Stable Disease (SD)                                         0 (0.0%)     
          95% CI (Wald, without correction)                       (0.00, 0.00)   

# rspt01 works if change confidence interval

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                A: Drug X         B: Placebo        C: Combination  
                                                 (N=15)             (N=15)              (N=15)      
        ————————————————————————————————————————————————————————————————————————————————————————————
        Responders                             15 (100.0%)        14 (93.3%)          15 (100.0%)   
        90% CI (Wald, with correction)        (96.7, 100.0)      (79.4, 100.0)       (96.7, 100.0)  
        Unstratified Analysis                                                                       
          Difference in Response rate (%)                            -6.7                 0.0       
            90% CI (Wald, with correction)                       (-23.9, 10.6)        (-6.7, 6.7)   
          p-value (Fisher's Exact Test)                             1.0000              1.0000      
        Odds Ratio (95% CI)                                    0.00 (0.00 - Inf)   1.00 (0.00 - Inf)
        Complete Response (CR)                 15 (100.0%)        11 (73.3%)          14 (93.3%)    
          90% CI (Wald, with correction)     (96.67, 100.00)    (51.22, 95.45)      (79.41, 100.00) 
        Partial Response (PR)                   0 (0.0%)           3 (20.0%)           1 (6.7%)     
          90% CI (Wald, with correction)      (0.00, 3.33)       (0.00, 40.32)       (0.00, 20.59)  
        Stable Disease (SD)                     0 (0.0%)           1 (6.7%)            0 (0.0%)     
          90% CI (Wald, with correction)      (0.00, 3.33)       (0.00, 20.59)       (0.00, 3.33)   

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                      A: Drug X         B: Placebo        C: Combination  
                                                       (N=15)             (N=15)              (N=15)      
        ——————————————————————————————————————————————————————————————————————————————————————————————————
        Responders                                   15 (100.0%)        14 (93.3%)          15 (100.0%)   
        90% CI (Wald, with correction)              (96.7, 100.0)      (79.4, 100.0)       (96.7, 100.0)  
        Unstratified Analysis                                                                             
          Difference in Response rate (%)                                  -6.7                 0.0       
            90% CI (Wald, with correction)                             (-23.9, 10.6)        (-6.7, 6.7)   
          p-value (Fisher's Exact Test)                                   1.0000              1.0000      
        Odds Ratio (95% CI)                                          0.00 (0.00 - Inf)   1.00 (0.00 - Inf)
        Stratified Analysis                                                                               
          Difference in Response rate (%)                                  -7.1                 0.0       
            90% CI (CMH, without correction)                           (-18.0, 3.9)         (0.0, 0.0)    
          p-value (Cochran-Mantel-Haenszel Test)                          0.2918                NE        
        Odds Ratio (95% CI)                                          0.00 (0.00 - Inf)   1.00 (0.00 - Inf)
        Complete Response (CR)                       15 (100.0%)        11 (73.3%)          14 (93.3%)    
          90% CI (Wald, with correction)           (96.67, 100.00)    (51.22, 95.45)      (79.41, 100.00) 
        Partial Response (PR)                         0 (0.0%)           3 (20.0%)           1 (6.7%)     
          90% CI (Wald, with correction)            (0.00, 3.33)       (0.00, 40.32)       (0.00, 20.59)  
        Stable Disease (SD)                           0 (0.0%)           1 (6.7%)            0 (0.0%)     
          90% CI (Wald, with correction)            (0.00, 3.33)       (0.00, 20.59)       (0.00, 3.33)   

