# coxt02 can handle some NA values

    Code
      res1
    Output
        Effect/Covariate Included in the Model                  Hazard Ratio      95% CI      p-value
        —————————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                                   
          Description of Planned Arm (reference = A: Drug X)                                  0.6253 
            B: Placebo                                              0.80       (0.51, 1.26)   0.3382 
            C: Combination                                          0.89       (0.53, 1.47)   0.6372 
        Covariate:                                                                                   
          SEX (reference = F)                                                                        
            M                                                       1.06       (0.71, 1.58)   0.7865 
          RACE (reference = AMERICAN INDIAN OR ALASKA NATIVE)                                 0.1005 
            ASIAN                                                   0.65       (0.30, 1.39)   0.2649 
            BLACK OR AFRICAN AMERICAN                               0.62       (0.27, 1.40)   0.2457 
            WHITE                                                   0.35       (0.14, 0.85)   0.0206 
          Age (yr)                                                                                   
            All                                                     1.00       (0.97, 1.03)   0.9440 

---

    Code
      res2
    Output
        Effect/Covariate Included in the Model                  Hazard Ratio      90% CI      p-value
        —————————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                                   
          Description of Planned Arm (reference = A: Drug X)                                  0.6253 
            B: Placebo                                              0.80       (0.54, 1.17)   0.3382 
            C: Combination                                          0.89       (0.58, 1.35)   0.6372 
        Covariate:                                                                                   
          SEX (reference = F)                                                                        
            M                                                       1.06       (0.76, 1.48)   0.7865 
          RACE (reference = AMERICAN INDIAN OR ALASKA NATIVE)                                 0.1005 
            ASIAN                                                   0.65       (0.34, 1.23)   0.2649 
            BLACK OR AFRICAN AMERICAN                               0.62       (0.31, 1.22)   0.2457 
            WHITE                                                   0.35       (0.17, 0.74)   0.0206 
          Age (yr)                                                                                   
            All                                                     1.00       (0.98, 1.02)   0.9440 

---

    Code
      res3
    Output
        Effect/Covariate Included in the Model                 Hazard Ratio      95% CI      p-value
        ————————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                                  
          Description of Planned Arm (reference = A: Drug X)                                 0.5532 
            B: Placebo                                             0.79       (0.51, 1.22)   0.2863 
            C: Combination                                         0.86       (0.52, 1.42)   0.5631 
        Covariate:                                                                                  
          SEX (reference = F)                                                                       
            M                                                      1.07       (0.72, 1.58)   0.7301 
          Age (yr)                                                                                  
            All                                                    1.00       (0.97, 1.02)   0.8153 

---

    Code
      res4
    Output
        Effect/Covariate Included in the Model                 Hazard Ratio      95% CI      p-value
        ————————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                                  
          Description of Planned Arm (reference = A: Drug X)                                 0.7281 
            B: Placebo                                             0.82       (0.51, 1.33)   0.4270 
            C: Combination                                         0.94       (0.56, 1.58)   0.8202 
        Covariate:                                                                                  
          SEX (reference = F)                                                                       
            M                                                      1.01       (0.67, 1.52)   0.9680 
          Age (yr)                                                                                  
            All                                                    1.00       (0.97, 1.03)   0.9736 

