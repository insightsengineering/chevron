# coxt01 can handle some NA values

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
                                                     Treatment Effect Adjusted for Covariate     
        Effect/Covariate Included in the Model    n      Hazard Ratio       95% CI       p-value 
        —————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                               
          B: Placebo vs control (A: Drug X)       28         0.77        (0.26, 2.23)     0.6257 
        Covariate:                                                                               
          Sex                                     28         0.55        (0.16, 1.85)     0.3349 
          RACE                                    28         0.90        (0.31, 2.63)     0.8487 
          Age (yr)                                28         0.76        (0.26, 2.22)     0.6106 

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
                                                     Treatment Effect Adjusted for Covariate     
        Effect/Covariate Included in the Model    n      Hazard Ratio       90% CI       p-value 
        —————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                               
          B: Placebo vs control (A: Drug X)       28         0.77        (0.31, 1.88)     0.6257 
        Covariate:                                                                               
          Sex                                     28         0.55        (0.20, 1.52)     0.3349 
          RACE                                    28         0.90        (0.37, 2.22)     0.8487 
          Age (yr)                                28         0.76        (0.31, 1.87)     0.6106 

---

    Code
      cat(export_as_txt(res3, lpp = 100))
    Output
                                                     Treatment Effect Adjusted for Covariate     
        Effect/Covariate Included in the Model    n      Hazard Ratio       95% CI       p-value 
        —————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                               
          B: Placebo vs control (A: Drug X)       28         0.77        (0.26, 2.23)     0.6257 
        Covariate:                                                                               
          Sex                                     28         0.55        (0.16, 1.85)     0.3349 
          Age (yr)                                28         0.76        (0.26, 2.22)     0.6106 

---

    Code
      cat(export_as_txt(res4, lpp = 100))
    Output
                                                     Treatment Effect Adjusted for Covariate     
        Effect/Covariate Included in the Model    n      Hazard Ratio       95% CI       p-value 
        —————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                               
          B: Placebo vs control (A: Drug X)       28         1.17        (0.40, 3.41)     0.7785 
        Covariate:                                                                               
          Sex                                     28         0.85        (0.24, 3.02)     0.8075 
          Age (yr)                                28         1.16        (0.39, 3.40)     0.7908 

