# coxt01 can handle some NA values

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
                                                     Treatment Effect Adjusted for Covariate     
        Effect/Covariate Included in the Model    n      Hazard Ratio       95% CI       p-value 
        —————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                               
          B: Placebo vs control (A: Drug X)       26         0.92        (0.31, 2.67)     0.8708 
        Covariate:                                                                               
          Sex                                     26         0.67        (0.20, 2.28)     0.5229 
          RACE                                    26         1.48        (0.46, 4.69)     0.5094 
          Age (yr)                                26         0.96        (0.32, 2.85)     0.9422 

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
                                                     Treatment Effect Adjusted for Covariate     
        Effect/Covariate Included in the Model    n      Hazard Ratio       90% CI       p-value 
        —————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                               
          B: Placebo vs control (A: Drug X)       26         0.92        (0.37, 2.25)     0.8708 
        Covariate:                                                                               
          Sex                                     26         0.67        (0.24, 1.87)     0.5229 
          RACE                                    26         1.48        (0.56, 3.90)     0.5094 
          Age (yr)                                26         0.96        (0.39, 2.40)     0.9422 

---

    Code
      cat(export_as_txt(res3, lpp = 100))
    Output
                                                     Treatment Effect Adjusted for Covariate     
        Effect/Covariate Included in the Model    n      Hazard Ratio       95% CI       p-value 
        —————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                               
          B: Placebo vs control (A: Drug X)       26         0.92        (0.31, 2.67)     0.8708 
        Covariate:                                                                               
          Sex                                     26         0.67        (0.20, 2.28)     0.5229 
          Age (yr)                                26         0.96        (0.32, 2.85)     0.9422 

---

    Code
      cat(export_as_txt(res4, lpp = 100))
    Output
                                                     Treatment Effect Adjusted for Covariate     
        Effect/Covariate Included in the Model    n      Hazard Ratio       95% CI       p-value 
        —————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                               
          B: Placebo vs control (A: Drug X)       26         1.61        (0.50, 5.15)     0.4227 
        Covariate:                                                                               
          Sex                                     26         1.18        (0.30, 4.67)     0.8121 
          Age (yr)                                26         1.62        (0.50, 5.24)     0.4220 

