# coxt02 can handle some NA values

    Code
      res1
    Output
        Effect/Covariate Included in the Model                  Hazard Ratio      95% CI      p-value
        —————————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                                   
          Description of Planned Arm (reference = A: Drug X)                                  <0.0001
            B: Placebo                                              1.52       (1.08, 2.13)   0.0161 
            C: Combination                                          2.61       (1.87, 3.64)   <0.0001
        Covariate:                                                                                   
          SEX (reference = F)                                                                        
            M                                                       0.97       (0.74, 1.28)   0.8379 
          RACE (reference = AMERICAN INDIAN OR ALASKA NATIVE)                                 0.9140 
            ASIAN                                                   0.85       (0.47, 1.55)   0.6039 
            BLACK OR AFRICAN AMERICAN                               0.87       (0.47, 1.62)   0.6607 
            WHITE                                                   0.95       (0.51, 1.77)   0.8665 
          Age (yr)                                                                                   
            All                                                     0.99       (0.97, 1.01)   0.1955 

---

    Code
      res2
    Output
        Effect/Covariate Included in the Model                  Hazard Ratio      90% CI      p-value
        —————————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                                   
          Description of Planned Arm (reference = A: Drug X)                                  <0.0001
            B: Placebo                                              1.52       (1.14, 2.01)   0.0161 
            C: Combination                                          2.61       (1.98, 3.45)   <0.0001
        Covariate:                                                                                   
          SEX (reference = F)                                                                        
            M                                                       0.97       (0.77, 1.22)   0.8379 
          RACE (reference = AMERICAN INDIAN OR ALASKA NATIVE)                                 0.9140 
            ASIAN                                                   0.85       (0.52, 1.41)   0.6039 
            BLACK OR AFRICAN AMERICAN                               0.87       (0.52, 1.47)   0.6607 
            WHITE                                                   0.95       (0.56, 1.60)   0.8665 
          Age (yr)                                                                                   
            All                                                     0.99       (0.97, 1.00)   0.1955 

---

    Code
      res3
    Output
        Effect/Covariate Included in the Model                 Hazard Ratio      95% CI      p-value
        ————————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                                  
          Description of Planned Arm (reference = A: Drug X)                                 <0.0001
            B: Placebo                                             1.56       (1.12, 2.17)   0.0080 
            C: Combination                                         2.58       (1.86, 3.58)   <0.0001
        Covariate:                                                                                  
          SEX (reference = F)                                                                       
            M                                                      0.98       (0.75, 1.27)   0.8712 
          Age (yr)                                                                                  
            All                                                    0.99       (0.97, 1.01)   0.1969 

---

    Code
      res4
    Output
        Effect/Covariate Included in the Model                 Hazard Ratio      95% CI      p-value
        ————————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                                  
          Description of Planned Arm (reference = A: Drug X)                                 <0.0001
            B: Placebo                                             1.52       (1.08, 2.13)   0.0163 
            C: Combination                                         2.64       (1.89, 3.69)   <0.0001
        Covariate:                                                                                  
          SEX (reference = F)                                                                       
            M                                                      1.00       (0.76, 1.33)   0.9933 
          Age (yr)                                                                                  
            All                                                    0.99       (0.97, 1.01)   0.1919 

