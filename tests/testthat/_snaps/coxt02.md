# coxt02 can handle some NA values

    Code
      res1
    Output
        Effect/Covariate Included in the Model                 Hazard Ratio      95% CI      p-value
        ————————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                                  
          Description of Planned Arm (reference = A: Drug X)                                 <0.0001
            B: Placebo                                             1.41       (1.03, 1.93)   0.0310 
            C: Combination                                         2.37       (1.74, 3.22)   <0.0001

---

    Code
      res2
    Output
        Effect/Covariate Included in the Model                 Hazard Ratio      90% CI      p-value
        ————————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                                  
          Description of Planned Arm (reference = A: Drug X)                                 <0.0001
            B: Placebo                                             1.41       (1.09, 1.84)   0.0310 
            C: Combination                                         2.37       (1.83, 3.06)   <0.0001

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
          Age                                                                                       
            All                                                    0.99       (0.97, 1.01)   0.1969 

---

    Code
      res4
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
          Age                                                                                       
            All                                                    0.99       (0.97, 1.01)   0.1969 

