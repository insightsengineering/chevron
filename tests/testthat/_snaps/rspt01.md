# rspt01 works as expected

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                             A: Drug X          B: Placebo         C: Combination   
                                              (N=134)            (N=134)               (N=132)      
      ——————————————————————————————————————————————————————————————————————————————————————————————
      Responders                            133 (99.3%)        127 (94.8%)           131 (99.2%)    
      95% CI (Wald, with correction)       (97.4, 100.0)       (90.6, 98.9)         (97.4, 100.0)   
      Unstratified Analysis                                                                         
        Difference in Response rate (%)                            -4.5                 -0.0        
          95% CI (Wald, with correction)                       (-9.3, 0.3)           (-2.8, 2.8)    
        p-value (Fisher's Exact Test)                             0.0662               1.0000       
      Odds Ratio (95% CI)                                   0.14 (0.02 - 1.12)   0.98 (0.06 - 15.91)
      Complete Response (CR)                119 (88.8%)         97 (72.4%)           120 (90.9%)    
        95% CI (Wald, with correction)     (83.09, 94.52)     (64.45, 80.33)       (85.63, 96.19)   
      Partial Response (PR)                  14 (10.4%)         30 (22.4%)            11 (8.3%)     
        95% CI (Wald, with correction)     (4.90, 16.00)      (14.96, 29.82)        (3.24, 13.43)   
      Stable Disease (SD)                     1 (0.7%)           7 (5.2%)             1 (0.8%)      
        95% CI (Wald, with correction)      (0.00, 2.58)       (1.08, 9.36)         (0.00, 2.62)    

# rspt01 works as expected for stratified and unstratified analysis

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                     A: Drug X        B: Placebo     C: Combination
                                                      (N=134)          (N=134)          (N=132)    
        ———————————————————————————————————————————————————————————————————————————————————————————
        Responders                                  133 (99.3%)      127 (94.8%)      131 (99.2%)  
        95% CI (Wald, with correction)             (97.4, 100.0)     (90.6, 98.9)    (97.4, 100.0) 
        Unstratified Analysis                                                                      
          Difference in Response rate (%)                                -4.5             -0.0     
            95% CI (Wald, with correction)                           (-9.3, 0.3)      (-2.8, 2.8)  
          p-value (Fisher's Exact Test)                                 0.0662           1.0000    
        Stratified Analysis                                                                        
          Difference in Response rate (%)                                -4.4             0.1      
            95% CI (CMH, without correction)                         (-8.5, -0.3)     (-2.2, 2.3)  
          p-value (Cochran-Mantel-Haenszel Test)                        0.0344           0.9560    
        Complete Response (CR)                      119 (88.8%)       97 (72.4%)      120 (90.9%)  
          95% CI (Wald, with correction)           (83.09, 94.52)   (64.45, 80.33)   (85.63, 96.19)
        Partial Response (PR)                        14 (10.4%)       30 (22.4%)       11 (8.3%)   
          95% CI (Wald, with correction)           (4.90, 16.00)    (14.96, 29.82)   (3.24, 13.43) 
        Stable Disease (SD)                           1 (0.7%)         7 (5.2%)         1 (0.8%)   
          95% CI (Wald, with correction)            (0.00, 2.58)     (1.08, 9.36)     (0.00, 2.62) 

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                     A: Drug X          B: Placebo         C: Combination   
                                                      (N=134)            (N=134)               (N=132)      
        ————————————————————————————————————————————————————————————————————————————————————————————————————
        Responders                                  133 (99.3%)        127 (94.8%)           131 (99.2%)    
        95% CI (Wald, with correction)             (97.4, 100.0)       (90.6, 98.9)         (97.4, 100.0)   
        Stratified Analysis                                                                                 
          Difference in Response rate (%)                                  -4.4                  0.1        
            95% CI (CMH, without correction)                           (-8.5, -0.3)          (-2.2, 2.3)    
          p-value (Cochran-Mantel-Haenszel Test)                          0.0344               0.9560       
        Odds Ratio (95% CI)                                         0.14 (0.02 - 1.12)   0.98 (0.06 - 15.91)
        Unstratified Analysis                                                                               
          Difference in Response rate (%)                                  -4.5                 -0.0        
            95% CI (Wald, with correction)                             (-9.3, 0.3)           (-2.8, 2.8)    
          p-value (Fisher's Exact Test)                                   0.0662               1.0000       
        Odds Ratio (95% CI)                                         0.14 (0.02 - 1.12)   0.98 (0.06 - 15.91)
        Complete Response (CR)                      119 (88.8%)         97 (72.4%)           120 (90.9%)    
          95% CI (Wald, with correction)           (83.09, 94.52)     (64.45, 80.33)       (85.63, 96.19)   
        Partial Response (PR)                        14 (10.4%)         30 (22.4%)            11 (8.3%)     
          95% CI (Wald, with correction)           (4.90, 16.00)      (14.96, 29.82)        (3.24, 13.43)   
        Stable Disease (SD)                           1 (0.7%)           7 (5.2%)             1 (0.8%)      
          95% CI (Wald, with correction)            (0.00, 2.58)       (1.08, 9.36)         (0.00, 2.62)    

# rspt01 works as expected for unstratified analysis only

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                               A: Drug X        B: Placebo     C: Combination
                                                (N=134)          (N=134)          (N=132)    
        —————————————————————————————————————————————————————————————————————————————————————
        Responders                            133 (99.3%)      127 (94.8%)      131 (99.2%)  
        95% CI (Wald, with correction)       (97.4, 100.0)     (90.6, 98.9)    (97.4, 100.0) 
        Unstratified Analysis                                                                
          Difference in Response rate (%)                          -4.5             -0.0     
            95% CI (Wald, with correction)                     (-9.3, 0.3)      (-2.8, 2.8)  
          p-value (Fisher's Exact Test)                           0.0662           1.0000    
        Complete Response (CR)                119 (88.8%)       97 (72.4%)      120 (90.9%)  
          95% CI (Wald, with correction)     (83.09, 94.52)   (64.45, 80.33)   (85.63, 96.19)
        Partial Response (PR)                  14 (10.4%)       30 (22.4%)       11 (8.3%)   
          95% CI (Wald, with correction)     (4.90, 16.00)    (14.96, 29.82)   (3.24, 13.43) 
        Stable Disease (SD)                     1 (0.7%)         7 (5.2%)         1 (0.8%)   
          95% CI (Wald, with correction)      (0.00, 2.58)     (1.08, 9.36)     (0.00, 2.62) 

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                               A: Drug X          B: Placebo         C: Combination   
                                                (N=134)            (N=134)               (N=132)      
        ——————————————————————————————————————————————————————————————————————————————————————————————
        Responders                            133 (99.3%)        127 (94.8%)           131 (99.2%)    
        95% CI (Wald, with correction)       (97.4, 100.0)       (90.6, 98.9)         (97.4, 100.0)   
        Unstratified Analysis                                                                         
          Difference in Response rate (%)                            -4.5                 -0.0        
            95% CI (Wald, with correction)                       (-9.3, 0.3)           (-2.8, 2.8)    
          p-value (Fisher's Exact Test)                             0.0662               1.0000       
        Odds Ratio (95% CI)                                   0.14 (0.02 - 1.12)   0.98 (0.06 - 15.91)
        Complete Response (CR)                119 (88.8%)         97 (72.4%)           120 (90.9%)    
          95% CI (Wald, with correction)     (83.09, 94.52)     (64.45, 80.33)       (85.63, 96.19)   
        Partial Response (PR)                  14 (10.4%)         30 (22.4%)            11 (8.3%)     
          95% CI (Wald, with correction)     (4.90, 16.00)      (14.96, 29.82)        (3.24, 13.43)   
        Stable Disease (SD)                     1 (0.7%)           7 (5.2%)             1 (0.8%)      
          95% CI (Wald, with correction)      (0.00, 2.58)       (1.08, 9.36)         (0.00, 2.62)    

# rspt01 works as expected for stratified analysis only

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                     A: Drug X        B: Placebo     C: Combination
                                                      (N=134)          (N=134)          (N=132)    
        ———————————————————————————————————————————————————————————————————————————————————————————
        Responders                                  133 (99.3%)      127 (94.8%)      131 (99.2%)  
        95% CI (Wald, with correction)             (97.4, 100.0)     (90.6, 98.9)    (97.4, 100.0) 
        Stratified Analysis                                                                        
          Difference in Response rate (%)                                -4.4             0.1      
            95% CI (CMH, without correction)                         (-8.5, -0.3)     (-2.2, 2.3)  
          p-value (Cochran-Mantel-Haenszel Test)                        0.0344           0.9560    
        Complete Response (CR)                      119 (88.8%)       97 (72.4%)      120 (90.9%)  
          95% CI (Wald, with correction)           (83.09, 94.52)   (64.45, 80.33)   (85.63, 96.19)
        Partial Response (PR)                        14 (10.4%)       30 (22.4%)       11 (8.3%)   
          95% CI (Wald, with correction)           (4.90, 16.00)    (14.96, 29.82)   (3.24, 13.43) 
        Stable Disease (SD)                           1 (0.7%)         7 (5.2%)         1 (0.8%)   
          95% CI (Wald, with correction)            (0.00, 2.58)     (1.08, 9.36)     (0.00, 2.62) 

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                     A: Drug X          B: Placebo         C: Combination   
                                                      (N=134)            (N=134)               (N=132)      
        ————————————————————————————————————————————————————————————————————————————————————————————————————
        Responders                                  133 (99.3%)        127 (94.8%)           131 (99.2%)    
        95% CI (Wald, with correction)             (97.4, 100.0)       (90.6, 98.9)         (97.4, 100.0)   
        Stratified Analysis                                                                                 
          Difference in Response rate (%)                                  -4.4                  0.1        
            95% CI (CMH, without correction)                           (-8.5, -0.3)          (-2.2, 2.3)    
          p-value (Cochran-Mantel-Haenszel Test)                          0.0344               0.9560       
        Odds Ratio (95% CI)                                         0.14 (0.02 - 1.12)   0.98 (0.06 - 15.91)
        Complete Response (CR)                      119 (88.8%)         97 (72.4%)           120 (90.9%)    
          95% CI (Wald, with correction)           (83.09, 94.52)     (64.45, 80.33)       (85.63, 96.19)   
        Partial Response (PR)                        14 (10.4%)         30 (22.4%)            11 (8.3%)     
          95% CI (Wald, with correction)           (4.90, 16.00)      (14.96, 29.82)        (3.24, 13.43)   
        Stable Disease (SD)                           1 (0.7%)           7 (5.2%)             1 (0.8%)      
          95% CI (Wald, with correction)            (0.00, 2.58)       (1.08, 9.36)         (0.00, 2.62)    

# rspt01 works if change reference group

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                               B: Placebo          A: Drug X          C: Combination   
                                                (N=134)             (N=134)               (N=132)      
        ———————————————————————————————————————————————————————————————————————————————————————————————
        Responders                            127 (94.8%)         133 (99.3%)           131 (99.2%)    
        95% CI (Wald, with correction)        (90.6, 98.9)       (97.4, 100.0)         (97.4, 100.0)   
        Unstratified Analysis                                                                          
          Difference in Response rate (%)                             4.5                   4.5        
            95% CI (Wald, with correction)                        (-0.3, 9.3)           (-0.3, 9.3)    
          p-value (Fisher's Exact Test)                             0.0662                0.0663       
        Odds Ratio (95% CI)                                   7.33 (0.89 - 60.42)   7.22 (0.88 - 59.52)
        Complete Response (CR)                 97 (72.4%)         119 (88.8%)           120 (90.9%)    
          95% CI (Wald, with correction)     (64.45, 80.33)     (83.09, 94.52)        (85.63, 96.19)   
        Partial Response (PR)                  30 (22.4%)         14 (10.4%)             11 (8.3%)     
          95% CI (Wald, with correction)     (14.96, 29.82)      (4.90, 16.00)         (3.24, 13.43)   
        Stable Disease (SD)                     7 (5.2%)           1 (0.7%)              1 (0.8%)      
          95% CI (Wald, with correction)      (1.08, 9.36)       (0.00, 2.58)          (0.00, 2.62)    

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                     B: Placebo          A: Drug X          C: Combination   
                                                      (N=134)             (N=134)               (N=132)      
        —————————————————————————————————————————————————————————————————————————————————————————————————————
        Responders                                  127 (94.8%)         133 (99.3%)           131 (99.2%)    
        95% CI (Wald, with correction)              (90.6, 98.9)       (97.4, 100.0)         (97.4, 100.0)   
        Unstratified Analysis                                                                                
          Difference in Response rate (%)                                   4.5                   4.5        
            95% CI (Wald, with correction)                              (-0.3, 9.3)           (-0.3, 9.3)    
          p-value (Fisher's Exact Test)                                   0.0662                0.0663       
        Odds Ratio (95% CI)                                         7.33 (0.89 - 60.42)   7.22 (0.88 - 59.52)
        Stratified Analysis                                                                                  
          Difference in Response rate (%)                                   4.4                   4.6        
            95% CI (CMH, without correction)                            (0.3, 8.5)            (0.5, 8.6)     
          p-value (Cochran-Mantel-Haenszel Test)                          0.0344                0.0319       
        Odds Ratio (95% CI)                                         7.33 (0.89 - 60.42)   7.22 (0.88 - 59.52)
        Complete Response (CR)                       97 (72.4%)         119 (88.8%)           120 (90.9%)    
          95% CI (Wald, with correction)           (64.45, 80.33)     (83.09, 94.52)        (85.63, 96.19)   
        Partial Response (PR)                        30 (22.4%)         14 (10.4%)             11 (8.3%)     
          95% CI (Wald, with correction)           (14.96, 29.82)      (4.90, 16.00)         (3.24, 13.43)   
        Stable Disease (SD)                           7 (5.2%)           1 (0.7%)              1 (0.8%)      
          95% CI (Wald, with correction)            (1.08, 9.36)       (0.00, 2.58)          (0.00, 2.62)    

# rspt01 works if change statistic methods

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                  A: Drug X          B: Placebo         C: Combination   
                                                   (N=134)            (N=134)               (N=132)      
        —————————————————————————————————————————————————————————————————————————————————————————————————
        Responders                               133 (99.3%)        127 (94.8%)           131 (99.2%)    
        95% CI (Wald, without correction)       (97.8, 100.0)       (91.0, 98.5)         (97.8, 100.0)   
        Unstratified Analysis                                                                            
          Difference in Response rate (%)                               -4.5                 -0.0        
            95% CI (Wald, without correction)                       (-8.5, -0.4)          (-2.1, 2.1)    
          p-value (Fisher's Exact Test)                                0.0662               1.0000       
        Odds Ratio (95% CI)                                      0.14 (0.02 - 1.12)   0.98 (0.06 - 15.91)
        Complete Response (CR)                   119 (88.8%)         97 (72.4%)           120 (90.9%)    
          95% CI (Wald, without correction)     (83.47, 94.14)     (64.82, 79.96)       (86.00, 95.81)   
        Partial Response (PR)                     14 (10.4%)         30 (22.4%)            11 (8.3%)     
          95% CI (Wald, without correction)     (5.27, 15.63)      (15.33, 29.45)        (3.62, 13.05)   
        Stable Disease (SD)                        1 (0.7%)           7 (5.2%)             1 (0.8%)      
          95% CI (Wald, without correction)      (0.00, 2.20)       (1.46, 8.99)         (0.00, 2.24)    

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                  A: Drug X          B: Placebo    
                                                                   (N=134)            (N=134)      
        ———————————————————————————————————————————————————————————————————————————————————————————
        Responders                                               133 (99.3%)        127 (94.8%)    
        95% CI (Wald, without correction)                       (97.8, 100.0)       (91.0, 98.5)   
        Unstratified Analysis                                                                      
          Difference in Response rate (%)                                               -4.5       
            95% CI (Wald, without correction)                                       (-8.5, -0.4)   
          p-value (Fisher's Exact Test)                                                0.0662      
        Odds Ratio (95% CI)                                                      0.14 (0.02 - 1.12)
        Stratified Analysis                                                                        
          Difference in Response rate (%)                                               -4.5       
            95% CI (Anderson-Hauck)                                                 (-8.9, -0.0)   
          p-value (Chi-Squared Test with Schouten Correction)                          0.0488      
        Odds Ratio (95% CI)                                                      0.14 (0.02 - 1.12)
        Complete Response (CR)                                   119 (88.8%)         97 (72.4%)    
          95% CI (Wald, without correction)                     (83.47, 94.14)     (64.82, 79.96)  
        Partial Response (PR)                                     14 (10.4%)         30 (22.4%)    
          95% CI (Wald, without correction)                     (5.27, 15.63)      (15.33, 29.45)  
        Stable Disease (SD)                                        1 (0.7%)           7 (5.2%)     
          95% CI (Wald, without correction)                      (0.00, 2.20)       (1.46, 8.99)   
      \s\n                                                            C: Combination   
                                                                      (N=132)      
        ———————————————————————————————————————————————————————————————————————————
        Responders                                                  131 (99.2%)    
        95% CI (Wald, without correction)                          (97.8, 100.0)   
        Unstratified Analysis                                                      
          Difference in Response rate (%)                              -0.0        
            95% CI (Wald, without correction)                       (-2.1, 2.1)    
          p-value (Fisher's Exact Test)                               1.0000       
        Odds Ratio (95% CI)                                     0.98 (0.06 - 15.91)
        Stratified Analysis                                                        
          Difference in Response rate (%)                              -0.0        
            95% CI (Anderson-Hauck)                                 (-2.5, 2.5)    
          p-value (Chi-Squared Test with Schouten Correction)         0.7332       
        Odds Ratio (95% CI)                                     0.98 (0.06 - 15.91)
        Complete Response (CR)                                      120 (90.9%)    
          95% CI (Wald, without correction)                       (86.00, 95.81)   
        Partial Response (PR)                                        11 (8.3%)     
          95% CI (Wald, without correction)                        (3.62, 13.05)   
        Stable Disease (SD)                                          1 (0.8%)      
          95% CI (Wald, without correction)                        (0.00, 2.24)    

# rspt01 works if change confidence interval

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                               A: Drug X          B: Placebo         C: Combination   
                                                (N=134)            (N=134)               (N=132)      
        ——————————————————————————————————————————————————————————————————————————————————————————————
        Responders                            133 (99.3%)        127 (94.8%)           131 (99.2%)    
        90% CI (Wald, with correction)       (97.7, 100.0)       (91.2, 98.3)         (97.6, 100.0)   
        Unstratified Analysis                                                                         
          Difference in Response rate (%)                            -4.5                 -0.0        
            90% CI (Wald, with correction)                       (-8.6, -0.3)          (-2.5, 2.5)    
          p-value (Fisher's Exact Test)                             0.0662               1.0000       
        Odds Ratio (95% CI)                                   0.14 (0.02 - 1.12)   0.98 (0.06 - 15.91)
        Complete Response (CR)                119 (88.8%)         97 (72.4%)           120 (90.9%)    
          90% CI (Wald, with correction)     (83.95, 93.66)     (65.66, 79.11)       (86.41, 95.40)   
        Partial Response (PR)                  14 (10.4%)         30 (22.4%)            11 (8.3%)     
          90% CI (Wald, with correction)     (5.73, 15.17)      (16.09, 28.68)        (4.00, 12.67)   
        Stable Disease (SD)                     1 (0.7%)           7 (5.2%)             1 (0.8%)      
          90% CI (Wald, with correction)      (0.00, 2.34)       (1.69, 8.76)         (0.00, 2.38)    

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                     A: Drug X          B: Placebo         C: Combination   
                                                      (N=134)            (N=134)               (N=132)      
        ————————————————————————————————————————————————————————————————————————————————————————————————————
        Responders                                  133 (99.3%)        127 (94.8%)           131 (99.2%)    
        90% CI (Wald, with correction)             (97.7, 100.0)       (91.2, 98.3)         (97.6, 100.0)   
        Unstratified Analysis                                                                               
          Difference in Response rate (%)                                  -4.5                 -0.0        
            90% CI (Wald, with correction)                             (-8.6, -0.3)          (-2.5, 2.5)    
          p-value (Fisher's Exact Test)                                   0.0662               1.0000       
        Odds Ratio (95% CI)                                         0.14 (0.02 - 1.12)   0.98 (0.06 - 15.91)
        Stratified Analysis                                                                                 
          Difference in Response rate (%)                                  -4.4                  0.1        
            90% CI (CMH, without correction)                           (-7.9, -0.9)          (-1.8, 2.0)    
          p-value (Cochran-Mantel-Haenszel Test)                          0.0344               0.9560       
        Odds Ratio (95% CI)                                         0.14 (0.02 - 1.12)   0.98 (0.06 - 15.91)
        Complete Response (CR)                      119 (88.8%)         97 (72.4%)           120 (90.9%)    
          90% CI (Wald, with correction)           (83.95, 93.66)     (65.66, 79.11)       (86.41, 95.40)   
        Partial Response (PR)                        14 (10.4%)         30 (22.4%)            11 (8.3%)     
          90% CI (Wald, with correction)           (5.73, 15.17)      (16.09, 28.68)        (4.00, 12.67)   
        Stable Disease (SD)                           1 (0.7%)           7 (5.2%)             1 (0.8%)      
          90% CI (Wald, with correction)            (0.00, 2.34)       (1.69, 8.76)         (0.00, 2.38)    

