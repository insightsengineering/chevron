# coxt02 can handle some NA values

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
        Effect/Covariate Included in the Model                  Hazard Ratio      95% CI       p-value
        ——————————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                                    
          Description of Planned Arm (reference = A: Drug X)                                   0.0671 
            B: Placebo                                              4.22       (1.18, 15.01)   0.0263 
            C: Combination                                          2.57       (0.89, 7.43)    0.0821 
        Covariate:                                                                                    
          Sex (reference = F)                                                                         
            M                                                       0.54       (0.17, 1.73)    0.2982 
          RACE (reference = AMERICAN INDIAN OR ALASKA NATIVE)                                  0.8351 
            ASIAN                                                   0.96       (0.19, 4.74)    0.9611 
            BLACK OR AFRICAN AMERICAN                               1.75       (0.24, 12.74)   0.5785 
            WHITE                                                   1.21       (0.19, 7.50)    0.8393 
          Age (yr)                                                                                    
            All                                                     1.03       (0.94, 1.13)    0.5459 

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
        Effect/Covariate Included in the Model                  Hazard Ratio      90% CI       p-value
        ——————————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                                    
          Description of Planned Arm (reference = A: Drug X)                                   0.0671 
            B: Placebo                                              4.22       (1.45, 12.24)   0.0263 
            C: Combination                                          2.57       (1.05, 6.27)    0.0821 
        Covariate:                                                                                    
          Sex (reference = F)                                                                         
            M                                                       0.54       (0.20, 1.43)    0.2982 
          RACE (reference = AMERICAN INDIAN OR ALASKA NATIVE)                                  0.8351 
            ASIAN                                                   0.96       (0.25, 3.67)    0.9611 
            BLACK OR AFRICAN AMERICAN                               1.75       (0.33, 9.26)    0.5785 
            WHITE                                                   1.21       (0.26, 5.59)    0.8393 
          Age (yr)                                                                                    
            All                                                     1.03       (0.95, 1.11)    0.5459 

---

    Code
      cat(export_as_txt(res3, lpp = 100))
    Output
        Effect/Covariate Included in the Model                 Hazard Ratio      95% CI       p-value
        —————————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                                   
          Description of Planned Arm (reference = A: Drug X)                                  0.0846 
            B: Placebo                                             3.55       (1.11, 11.41)   0.0333 
            C: Combination                                         2.66       (0.92, 7.69)    0.0709 
        Covariate:                                                                                   
          Sex (reference = F)                                                                        
            M                                                      0.58       (0.19, 1.74)    0.3283 
          Age (yr)                                                                                   
            All                                                    1.01       (0.93, 1.11)    0.7688 

---

    Code
      cat(export_as_txt(res4, lpp = 100))
    Output
        Effect/Covariate Included in the Model                 Hazard Ratio      95% CI       p-value
        —————————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                                   
          Description of Planned Arm (reference = A: Drug X)                                  0.1642 
            B: Placebo                                             3.25       (0.90, 11.76)   0.0729 
            C: Combination                                         2.35       (0.77, 7.15)    0.1312 
        Covariate:                                                                                   
          Sex (reference = F)                                                                        
            M                                                      0.74       (0.23, 2.33)    0.6014 
          Age (yr)                                                                                   
            All                                                    1.01       (0.92, 1.12)    0.7589 

