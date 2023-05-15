# coxt02 can handle some NA values

    Code
      res1
    Output
        Effect/Covariate Included in the Model                  Hazard Ratio      95% CI      p-value
        —————————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                                   
          Description of Planned Arm (reference = A: Drug X)                                  <0.0001
            B: Placebo                                              1.43       (1.05, 1.94)   0.0249 
            C: Combination                                          2.43       (1.79, 3.29)   <0.0001
        Covariate:                                                                                   
          Sex (reference = F)                                                                        
            M                                                       1.00       (0.78, 1.29)   0.9824 
          RACE (reference = AMERICAN INDIAN OR ALASKA NATIVE)                                 0.9404 
            ASIAN                                                   0.85       (0.49, 1.46)   0.5544 
            BLACK OR AFRICAN AMERICAN                               0.86       (0.48, 1.53)   0.6029 
            WHITE                                                   0.89       (0.50, 1.59)   0.6997 
          Age (yr)                                                                                   
            All                                                     0.99       (0.97, 1.01)   0.2501 

---

    Code
      res2
    Output
        Effect/Covariate Included in the Model                  Hazard Ratio      90% CI      p-value
        —————————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                                   
          Description of Planned Arm (reference = A: Drug X)                                  <0.0001
            B: Placebo                                              1.43       (1.10, 1.85)   0.0249 
            C: Combination                                          2.43       (1.88, 3.14)   <0.0001
        Covariate:                                                                                   
          Sex (reference = F)                                                                        
            M                                                       1.00       (0.81, 1.23)   0.9824 
          RACE (reference = AMERICAN INDIAN OR ALASKA NATIVE)                                 0.9404 
            ASIAN                                                   0.85       (0.54, 1.34)   0.5544 
            BLACK OR AFRICAN AMERICAN                               0.86       (0.53, 1.39)   0.6029 
            WHITE                                                   0.89       (0.55, 1.45)   0.6997 
          Age (yr)                                                                                   
            All                                                     0.99       (0.98, 1.00)   0.2501 

---

    Code
      res3
    Output
        Effect/Covariate Included in the Model                 Hazard Ratio      95% CI      p-value
        ————————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                                  
          Description of Planned Arm (reference = A: Drug X)                                 <0.0001
            B: Placebo                                             1.44       (1.06, 1.96)   0.0195 
            C: Combination                                         2.42       (1.79, 3.28)   <0.0001
        Covariate:                                                                                  
          Sex (reference = F)                                                                       
            M                                                      1.00       (0.79, 1.29)   0.9721 
          Age (yr)                                                                                  
            All                                                    0.99       (0.97, 1.01)   0.2216 

---

    Code
      res4
    Output
        Effect/Covariate Included in the Model                 Hazard Ratio      95% CI      p-value
        ————————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                                  
          Description of Planned Arm (reference = A: Drug X)                                 <0.0001
            B: Placebo                                             1.43       (1.04, 1.95)   0.0254 
            C: Combination                                         2.45       (1.80, 3.32)   <0.0001
        Covariate:                                                                                  
          Sex (reference = F)                                                                       
            M                                                      1.00       (0.78, 1.29)   0.9899 
          Age (yr)                                                                                  
            All                                                    0.99       (0.97, 1.01)   0.1973 

