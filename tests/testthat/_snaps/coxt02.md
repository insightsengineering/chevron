# coxt02 can handle some NA values

    Code
      res1
    Output
        Effect/Covariate Included in the Model                 Hazard Ratio      95% CI      p-value
        ————————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                                  
          Description of Planned Arm (reference = A: Drug X)                                 <0.0001
            B: Placebo                                             1.46       (1.08, 1.99)   0.0146 
            C: Combination                                         2.43       (1.79, 3.29)   <0.0001

---

    Code
      res2
    Output
        Effect/Covariate Included in the Model                 Hazard Ratio      90% CI      p-value
        ————————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                                  
          Description of Planned Arm (reference = A: Drug X)                                 <0.0001
            B: Placebo                                             1.46       (1.13, 1.89)   0.0146 
            C: Combination                                         2.43       (1.88, 3.13)   <0.0001

---

    Code
      res3
    Output
        Effect/Covariate Included in the Model                 Hazard Ratio      95% CI      p-value
        ————————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                                  
          Description of Planned Arm (reference = A: Drug X)                                 <0.0001
            B: Placebo                                             1.65       (1.21, 2.26)   0.0015 
            C: Combination                                         2.62       (1.93, 3.56)   <0.0001
        Covariate:                                                                                  
          SEX (reference = F)                                                                       
            M                                                      0.93       (0.73, 1.20)   0.5807 
          Age                                                                                       
            All                                                    0.99       (0.97, 1.00)   0.0932 

