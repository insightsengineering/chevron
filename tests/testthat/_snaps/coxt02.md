# coxt02 can handle some NA values

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
        Effect/Covariate Included in the Model                  Hazard Ratio      95% CI       p-value
        ——————————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                                    
          Description of Planned Arm (reference = A: Drug X)                                   0.8583 
            B: Placebo                                              0.98       (0.31, 3.05)    0.9721 
            C: Combination                                          0.76       (0.26, 2.25)    0.6212 
        Covariate:                                                                                    
          Sex (reference = F)                                                                         
            M                                                       1.38       (0.55, 3.47)    0.4981 
          RACE (reference = AMERICAN INDIAN OR ALASKA NATIVE)                                  0.7839 
            ASIAN                                                   2.09       (0.41, 10.57)   0.3711 
            BLACK OR AFRICAN AMERICAN                               3.11       (0.35, 27.97)   0.3110 
            WHITE                                                   2.27       (0.35, 14.55)   0.3882 
          Age (yr)                                                                                    
            All                                                     1.01       (0.94, 1.08)    0.8775 

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
        Effect/Covariate Included in the Model                  Hazard Ratio      90% CI       p-value
        ——————————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                                    
          Description of Planned Arm (reference = A: Drug X)                                   0.8583 
            B: Placebo                                              0.98       (0.38, 2.54)    0.9721 
            C: Combination                                          0.76       (0.31, 1.89)    0.6212 
        Covariate:                                                                                    
          Sex (reference = F)                                                                         
            M                                                       1.38       (0.63, 2.99)    0.4981 
          RACE (reference = AMERICAN INDIAN OR ALASKA NATIVE)                                  0.7839 
            ASIAN                                                   2.09       (0.54, 8.14)    0.3711 
            BLACK OR AFRICAN AMERICAN                               3.11       (0.49, 19.65)   0.3110 
            WHITE                                                   2.27       (0.48, 10.79)   0.3882 
          Age (yr)                                                                                    
            All                                                     1.01       (0.95, 1.07)    0.8775 

---

    Code
      cat(export_as_txt(res3, lpp = 100))
    Output
        Effect/Covariate Included in the Model                 Hazard Ratio      95% CI      p-value
        ————————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                                  
          Description of Planned Arm (reference = A: Drug X)                                 0.8806 
            B: Placebo                                             0.77       (0.26, 2.27)   0.6380 
            C: Combination                                         0.79       (0.27, 2.34)   0.6733 
        Covariate:                                                                                  
          Sex (reference = F)                                                                       
            M                                                      1.52       (0.61, 3.77)   0.3683 
          Age (yr)                                                                                  
            All                                                    0.99       (0.93, 1.06)   0.8243 

---

    Code
      cat(export_as_txt(res4, lpp = 100))
    Output
        Effect/Covariate Included in the Model                 Hazard Ratio      95% CI      p-value
        ————————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                                  
          Description of Planned Arm (reference = A: Drug X)                                 0.9558 
            B: Placebo                                             1.09       (0.33, 3.54)   0.8882 
            C: Combination                                         0.92       (0.31, 2.73)   0.8779 
        Covariate:                                                                                  
          Sex (reference = F)                                                                       
            M                                                      1.68       (0.65, 4.36)   0.2861 
          Age (yr)                                                                                  
            All                                                    1.00       (0.94, 1.07)   0.9230 

