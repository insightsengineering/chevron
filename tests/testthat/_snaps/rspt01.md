# rspt01 works as expected

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                             A: Drug X          B: Placebo         C: Combination  
                                               (N=15)             (N=15)               (N=15)      
      —————————————————————————————————————————————————————————————————————————————————————————————
      Responders                             10 (66.7%)         9 (60.0%)            11 (73.3%)    
      95% CI (Wald, with correction)        (39.5, 93.9)       (31.9, 88.1)         (47.6, 99.0)   
      Unstratified Analysis                                                                        
        Difference in Response rate (%)                            -6.7                 6.7        
          95% CI (Wald, with correction)                      (-47.7, 34.4)        (-32.7, 46.0)   
        p-value (Fisher's Exact Test)                             1.0000               1.0000      
      Odds Ratio (95% CI)                                   0.75 (0.17 - 3.33)   1.37 (0.29 - 6.60)
      Complete Response (CR)                 4 (26.7%)          4 (26.7%)            7 (46.7%)     
        95% CI (Wald, with correction)     (0.95, 52.38)      (0.95, 52.38)        (18.09, 75.25)  
      Partial Response (PR)                  6 (40.0%)          5 (33.3%)            4 (26.7%)     
        95% CI (Wald, with correction)     (11.87, 68.13)     (6.14, 60.52)        (0.95, 52.38)   
      Stable Disease (SD)                    5 (33.3%)          6 (40.0%)            4 (26.7%)     
        95% CI (Wald, with correction)     (6.14, 60.52)      (11.87, 68.13)       (0.95, 52.38)   

# rspt01 works as expected for stratified and unstratified analysis

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                     A: Drug X        B: Placebo     C: Combination
                                                       (N=15)           (N=15)           (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————————————
        Responders                                   10 (66.7%)       9 (60.0%)        11 (73.3%)  
        95% CI (Wald, with correction)              (39.5, 93.9)     (31.9, 88.1)     (47.6, 99.0) 
        Unstratified Analysis                                                                      
          Difference in Response rate (%)                                -6.7             6.7      
            95% CI (Wald, with correction)                          (-47.7, 34.4)    (-32.7, 46.0) 
          p-value (Fisher's Exact Test)                                 1.0000           1.0000    
        Stratified Analysis                                                                        
          Difference in Response rate (%)                                -7.7             9.2      
            95% CI (CMH, without correction)                        (-41.6, 26.2)    (-19.0, 37.5) 
          p-value (Cochran-Mantel-Haenszel Test)                        0.6699           0.6257    
        Complete Response (CR)                       4 (26.7%)        4 (26.7%)        7 (46.7%)   
          95% CI (Wald, with correction)           (0.95, 52.38)    (0.95, 52.38)    (18.09, 75.25)
        Partial Response (PR)                        6 (40.0%)        5 (33.3%)        4 (26.7%)   
          95% CI (Wald, with correction)           (11.87, 68.13)   (6.14, 60.52)    (0.95, 52.38) 
        Stable Disease (SD)                          5 (33.3%)        6 (40.0%)        4 (26.7%)   
          95% CI (Wald, with correction)           (6.14, 60.52)    (11.87, 68.13)   (0.95, 52.38) 

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                     A: Drug X          B: Placebo         C: Combination  
                                                       (N=15)             (N=15)               (N=15)      
        ———————————————————————————————————————————————————————————————————————————————————————————————————
        Responders                                   10 (66.7%)         9 (60.0%)            11 (73.3%)    
        95% CI (Wald, with correction)              (39.5, 93.9)       (31.9, 88.1)         (47.6, 99.0)   
        Stratified Analysis                                                                                
          Difference in Response rate (%)                                  -7.7                 9.2        
            95% CI (CMH, without correction)                          (-41.6, 26.2)        (-19.0, 37.5)   
          p-value (Cochran-Mantel-Haenszel Test)                          0.6699               0.6257      
        Odds Ratio (95% CI)                                         0.75 (0.17 - 3.33)   1.37 (0.29 - 6.60)
        Unstratified Analysis                                                                              
          Difference in Response rate (%)                                  -6.7                 6.7        
            95% CI (Wald, with correction)                            (-47.7, 34.4)        (-32.7, 46.0)   
          p-value (Fisher's Exact Test)                                   1.0000               1.0000      
        Odds Ratio (95% CI)                                         0.75 (0.17 - 3.33)   1.37 (0.29 - 6.60)
        Complete Response (CR)                       4 (26.7%)          4 (26.7%)            7 (46.7%)     
          95% CI (Wald, with correction)           (0.95, 52.38)      (0.95, 52.38)        (18.09, 75.25)  
        Partial Response (PR)                        6 (40.0%)          5 (33.3%)            4 (26.7%)     
          95% CI (Wald, with correction)           (11.87, 68.13)     (6.14, 60.52)        (0.95, 52.38)   
        Stable Disease (SD)                          5 (33.3%)          6 (40.0%)            4 (26.7%)     
          95% CI (Wald, with correction)           (6.14, 60.52)      (11.87, 68.13)       (0.95, 52.38)   

# rspt01 works as expected for unstratified analysis only

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                               A: Drug X        B: Placebo     C: Combination
                                                 (N=15)           (N=15)           (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————
        Responders                             10 (66.7%)       9 (60.0%)        11 (73.3%)  
        95% CI (Wald, with correction)        (39.5, 93.9)     (31.9, 88.1)     (47.6, 99.0) 
        Unstratified Analysis                                                                
          Difference in Response rate (%)                          -6.7             6.7      
            95% CI (Wald, with correction)                    (-47.7, 34.4)    (-32.7, 46.0) 
          p-value (Fisher's Exact Test)                           1.0000           1.0000    
        Complete Response (CR)                 4 (26.7%)        4 (26.7%)        7 (46.7%)   
          95% CI (Wald, with correction)     (0.95, 52.38)    (0.95, 52.38)    (18.09, 75.25)
        Partial Response (PR)                  6 (40.0%)        5 (33.3%)        4 (26.7%)   
          95% CI (Wald, with correction)     (11.87, 68.13)   (6.14, 60.52)    (0.95, 52.38) 
        Stable Disease (SD)                    5 (33.3%)        6 (40.0%)        4 (26.7%)   
          95% CI (Wald, with correction)     (6.14, 60.52)    (11.87, 68.13)   (0.95, 52.38) 

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                               A: Drug X          B: Placebo         C: Combination  
                                                 (N=15)             (N=15)               (N=15)      
        —————————————————————————————————————————————————————————————————————————————————————————————
        Responders                             10 (66.7%)         9 (60.0%)            11 (73.3%)    
        95% CI (Wald, with correction)        (39.5, 93.9)       (31.9, 88.1)         (47.6, 99.0)   
        Unstratified Analysis                                                                        
          Difference in Response rate (%)                            -6.7                 6.7        
            95% CI (Wald, with correction)                      (-47.7, 34.4)        (-32.7, 46.0)   
          p-value (Fisher's Exact Test)                             1.0000               1.0000      
        Odds Ratio (95% CI)                                   0.75 (0.17 - 3.33)   1.37 (0.29 - 6.60)
        Complete Response (CR)                 4 (26.7%)          4 (26.7%)            7 (46.7%)     
          95% CI (Wald, with correction)     (0.95, 52.38)      (0.95, 52.38)        (18.09, 75.25)  
        Partial Response (PR)                  6 (40.0%)          5 (33.3%)            4 (26.7%)     
          95% CI (Wald, with correction)     (11.87, 68.13)     (6.14, 60.52)        (0.95, 52.38)   
        Stable Disease (SD)                    5 (33.3%)          6 (40.0%)            4 (26.7%)     
          95% CI (Wald, with correction)     (6.14, 60.52)      (11.87, 68.13)       (0.95, 52.38)   

# rspt01 works as expected for stratified analysis only

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                     A: Drug X        B: Placebo     C: Combination
                                                       (N=15)           (N=15)           (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————————————
        Responders                                   10 (66.7%)       9 (60.0%)        11 (73.3%)  
        95% CI (Wald, with correction)              (39.5, 93.9)     (31.9, 88.1)     (47.6, 99.0) 
        Stratified Analysis                                                                        
          Difference in Response rate (%)                                -7.7             9.2      
            95% CI (CMH, without correction)                        (-41.6, 26.2)    (-19.0, 37.5) 
          p-value (Cochran-Mantel-Haenszel Test)                        0.6699           0.6257    
        Complete Response (CR)                       4 (26.7%)        4 (26.7%)        7 (46.7%)   
          95% CI (Wald, with correction)           (0.95, 52.38)    (0.95, 52.38)    (18.09, 75.25)
        Partial Response (PR)                        6 (40.0%)        5 (33.3%)        4 (26.7%)   
          95% CI (Wald, with correction)           (11.87, 68.13)   (6.14, 60.52)    (0.95, 52.38) 
        Stable Disease (SD)                          5 (33.3%)        6 (40.0%)        4 (26.7%)   
          95% CI (Wald, with correction)           (6.14, 60.52)    (11.87, 68.13)   (0.95, 52.38) 

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                     A: Drug X          B: Placebo         C: Combination  
                                                       (N=15)             (N=15)               (N=15)      
        ———————————————————————————————————————————————————————————————————————————————————————————————————
        Responders                                   10 (66.7%)         9 (60.0%)            11 (73.3%)    
        95% CI (Wald, with correction)              (39.5, 93.9)       (31.9, 88.1)         (47.6, 99.0)   
        Stratified Analysis                                                                                
          Difference in Response rate (%)                                  -7.7                 9.2        
            95% CI (CMH, without correction)                          (-41.6, 26.2)        (-19.0, 37.5)   
          p-value (Cochran-Mantel-Haenszel Test)                          0.6699               0.6257      
        Odds Ratio (95% CI)                                         0.75 (0.17 - 3.33)   1.37 (0.29 - 6.60)
        Complete Response (CR)                       4 (26.7%)          4 (26.7%)            7 (46.7%)     
          95% CI (Wald, with correction)           (0.95, 52.38)      (0.95, 52.38)        (18.09, 75.25)  
        Partial Response (PR)                        6 (40.0%)          5 (33.3%)            4 (26.7%)     
          95% CI (Wald, with correction)           (11.87, 68.13)     (6.14, 60.52)        (0.95, 52.38)   
        Stable Disease (SD)                          5 (33.3%)          6 (40.0%)            4 (26.7%)     
          95% CI (Wald, with correction)           (6.14, 60.52)      (11.87, 68.13)       (0.95, 52.38)   

# rspt01 works if change reference group

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                 A: Drug X          B: Placebo       C: Combination  
                                                   (N=15)             (N=15)             (N=15)      
        —————————————————————————————————————————————————————————————————————————————————————————————
        Responders                               10 (66.7%)         9 (60.0%)          11 (73.3%)    
        95% CI (Wald, with correction)          (39.5, 93.9)       (31.9, 88.1)       (47.6, 99.0)   
        Unstratified Analysis                                                                        
          Difference in Response rate (%)           6.7                                   13.3       
            95% CI (Wald, with correction)     (-34.4, 47.7)                         (-26.7, 53.4)   
          p-value (Fisher's Exact Test)            1.0000                                0.6999      
        Odds Ratio (95% CI)                  1.33 (0.30 - 5.91)                    1.83 (0.39 - 8.57)
        Complete Response (CR)                   4 (26.7%)          4 (26.7%)          7 (46.7%)     
          95% CI (Wald, with correction)       (0.95, 52.38)      (0.95, 52.38)      (18.09, 75.25)  
        Partial Response (PR)                    6 (40.0%)          5 (33.3%)          4 (26.7%)     
          95% CI (Wald, with correction)       (11.87, 68.13)     (6.14, 60.52)      (0.95, 52.38)   
        Stable Disease (SD)                      5 (33.3%)          6 (40.0%)          4 (26.7%)     
          95% CI (Wald, with correction)       (6.14, 60.52)      (11.87, 68.13)     (0.95, 52.38)   

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                       A: Drug X          B: Placebo       C: Combination  
                                                         (N=15)             (N=15)             (N=15)      
        ———————————————————————————————————————————————————————————————————————————————————————————————————
        Responders                                     10 (66.7%)         9 (60.0%)          11 (73.3%)    
        95% CI (Wald, with correction)                (39.5, 93.9)       (31.9, 88.1)       (47.6, 99.0)   
        Unstratified Analysis                                                                              
          Difference in Response rate (%)                 6.7                                   13.3       
            95% CI (Wald, with correction)           (-34.4, 47.7)                         (-26.7, 53.4)   
          p-value (Fisher's Exact Test)                  1.0000                                0.6999      
        Odds Ratio (95% CI)                        1.33 (0.30 - 5.91)                    1.83 (0.39 - 8.57)
        Stratified Analysis                                                                                
          Difference in Response rate (%)                 7.7                                   16.7       
            95% CI (CMH, without correction)         (-26.2, 41.6)                         (-14.0, 47.4)   
          p-value (Cochran-Mantel-Haenszel Test)         0.6699                                0.3760      
        Odds Ratio (95% CI)                        1.33 (0.30 - 5.91)                    1.83 (0.39 - 8.57)
        Complete Response (CR)                         4 (26.7%)          4 (26.7%)          7 (46.7%)     
          95% CI (Wald, with correction)             (0.95, 52.38)      (0.95, 52.38)      (18.09, 75.25)  
        Partial Response (PR)                          6 (40.0%)          5 (33.3%)          4 (26.7%)     
          95% CI (Wald, with correction)             (11.87, 68.13)     (6.14, 60.52)      (0.95, 52.38)   
        Stable Disease (SD)                            5 (33.3%)          6 (40.0%)          4 (26.7%)     
          95% CI (Wald, with correction)             (6.14, 60.52)      (11.87, 68.13)     (0.95, 52.38)   

# rspt01 works if change statistic methods

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                  A: Drug X          B: Placebo         C: Combination  
                                                    (N=15)             (N=15)               (N=15)      
        ————————————————————————————————————————————————————————————————————————————————————————————————
        Responders                                10 (66.7%)         9 (60.0%)            11 (73.3%)    
        95% CI (Wald, without correction)        (42.8, 90.5)       (35.2, 84.8)         (51.0, 95.7)   
        Unstratified Analysis                                                                           
          Difference in Response rate (%)                               -6.7                 6.7        
            95% CI (Wald, without correction)                      (-41.1, 27.7)        (-26.0, 39.4)   
          p-value (Fisher's Exact Test)                                1.0000               1.0000      
        Odds Ratio (95% CI)                                      0.75 (0.17 - 3.33)   1.37 (0.29 - 6.60)
        Complete Response (CR)                    4 (26.7%)          4 (26.7%)            7 (46.7%)     
          95% CI (Wald, without correction)     (4.29, 49.05)      (4.29, 49.05)        (21.42, 71.91)  
        Partial Response (PR)                     6 (40.0%)          5 (33.3%)            4 (26.7%)     
          95% CI (Wald, without correction)     (15.21, 64.79)     (9.48, 57.19)        (4.29, 49.05)   
        Stable Disease (SD)                       5 (33.3%)          6 (40.0%)            4 (26.7%)     
          95% CI (Wald, without correction)     (9.48, 57.19)      (15.21, 64.79)       (4.29, 49.05)   

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                  A: Drug X          B: Placebo    
                                                                    (N=15)             (N=15)      
        ———————————————————————————————————————————————————————————————————————————————————————————
        Responders                                                10 (66.7%)         9 (60.0%)     
        95% CI (Wald, without correction)                        (42.8, 90.5)       (35.2, 84.8)   
        Unstratified Analysis                                                                      
          Difference in Response rate (%)                                               -6.7       
            95% CI (Wald, without correction)                                      (-41.1, 27.7)   
          p-value (Fisher's Exact Test)                                                1.0000      
        Odds Ratio (95% CI)                                                      0.75 (0.17 - 3.33)
        Stratified Analysis                                                                        
          Difference in Response rate (%)                                               -6.7       
            95% CI (Anderson-Hauck)                                                (-45.6, 32.3)   
          p-value (Chi-Squared Test with Schouten Correction)                          0.8522      
        Odds Ratio (95% CI)                                                      0.75 (0.17 - 3.33)
        Complete Response (CR)                                    4 (26.7%)          4 (26.7%)     
          95% CI (Wald, without correction)                     (4.29, 49.05)      (4.29, 49.05)   
        Partial Response (PR)                                     6 (40.0%)          5 (33.3%)     
          95% CI (Wald, without correction)                     (15.21, 64.79)     (9.48, 57.19)   
        Stable Disease (SD)                                       5 (33.3%)          6 (40.0%)     
          95% CI (Wald, without correction)                     (9.48, 57.19)      (15.21, 64.79)  
      \s\n                                                            C: Combination  
                                                                      (N=15)      
        ——————————————————————————————————————————————————————————————————————————
        Responders                                                  11 (73.3%)    
        95% CI (Wald, without correction)                          (51.0, 95.7)   
        Unstratified Analysis                                                     
          Difference in Response rate (%)                              6.7        
            95% CI (Wald, without correction)                     (-26.0, 39.4)   
          p-value (Fisher's Exact Test)                               1.0000      
        Odds Ratio (95% CI)                                     1.37 (0.29 - 6.60)
        Stratified Analysis                                                       
          Difference in Response rate (%)                              6.7        
            95% CI (Anderson-Hauck)                               (-30.5, 43.9)   
          p-value (Chi-Squared Test with Schouten Correction)         0.8447      
        Odds Ratio (95% CI)                                     1.37 (0.29 - 6.60)
        Complete Response (CR)                                      7 (46.7%)     
          95% CI (Wald, without correction)                       (21.42, 71.91)  
        Partial Response (PR)                                       4 (26.7%)     
          95% CI (Wald, without correction)                       (4.29, 49.05)   
        Stable Disease (SD)                                         4 (26.7%)     
          95% CI (Wald, without correction)                       (4.29, 49.05)   

# rspt01 works if change confidence interval

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                               A: Drug X          B: Placebo         C: Combination  
                                                 (N=15)             (N=15)               (N=15)      
        —————————————————————————————————————————————————————————————————————————————————————————————
        Responders                             10 (66.7%)         9 (60.0%)            11 (73.3%)    
        90% CI (Wald, with correction)        (43.3, 90.0)       (35.9, 84.1)         (51.2, 95.4)   
        Unstratified Analysis                                                                        
          Difference in Response rate (%)                            -6.7                 6.7        
            90% CI (Wald, with correction)                      (-42.2, 28.9)        (-27.5, 40.8)   
          p-value (Fisher's Exact Test)                             1.0000               1.0000      
        Odds Ratio (95% CI)                                   0.75 (0.17 - 3.33)   1.37 (0.29 - 6.60)
        Complete Response (CR)                 4 (26.7%)          4 (26.7%)            7 (46.7%)     
          90% CI (Wald, with correction)     (4.55, 48.78)      (4.55, 48.78)        (22.15, 71.19)  
        Partial Response (PR)                  6 (40.0%)          5 (33.3%)            4 (26.7%)     
          90% CI (Wald, with correction)     (15.86, 64.14)     (9.98, 56.69)        (4.55, 48.78)   
        Stable Disease (SD)                    5 (33.3%)          6 (40.0%)            4 (26.7%)     
          90% CI (Wald, with correction)     (9.98, 56.69)      (15.86, 64.14)       (4.55, 48.78)   

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                     A: Drug X          B: Placebo         C: Combination  
                                                       (N=15)             (N=15)               (N=15)      
        ———————————————————————————————————————————————————————————————————————————————————————————————————
        Responders                                   10 (66.7%)         9 (60.0%)            11 (73.3%)    
        90% CI (Wald, with correction)              (43.3, 90.0)       (35.9, 84.1)         (51.2, 95.4)   
        Unstratified Analysis                                                                              
          Difference in Response rate (%)                                  -6.7                 6.7        
            90% CI (Wald, with correction)                            (-42.2, 28.9)        (-27.5, 40.8)   
          p-value (Fisher's Exact Test)                                   1.0000               1.0000      
        Odds Ratio (95% CI)                                         0.75 (0.17 - 3.33)   1.37 (0.29 - 6.60)
        Stratified Analysis                                                                                
          Difference in Response rate (%)                                  -7.7                 9.2        
            90% CI (CMH, without correction)                          (-36.1, 20.8)        (-14.5, 32.9)   
          p-value (Cochran-Mantel-Haenszel Test)                          0.6699               0.6257      
        Odds Ratio (95% CI)                                         0.75 (0.17 - 3.33)   1.37 (0.29 - 6.60)
        Complete Response (CR)                       4 (26.7%)          4 (26.7%)            7 (46.7%)     
          90% CI (Wald, with correction)           (4.55, 48.78)      (4.55, 48.78)        (22.15, 71.19)  
        Partial Response (PR)                        6 (40.0%)          5 (33.3%)            4 (26.7%)     
          90% CI (Wald, with correction)           (15.86, 64.14)     (9.98, 56.69)        (4.55, 48.78)   
        Stable Disease (SD)                          5 (33.3%)          6 (40.0%)            4 (26.7%)     
          90% CI (Wald, with correction)           (9.98, 56.69)      (15.86, 64.14)       (4.55, 48.78)   

