# coxt01 can handle some NA values

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
                                                     Treatment Effect Adjusted for Covariate     
        Effect/Covariate Included in the Model    n     Hazard Ratio        95% CI       p-value 
        —————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                               
          B: Placebo vs control (A: Drug X)       26        2.52         (0.88, 7.20)     0.0842 
        Covariate:                                                                               
          Sex                                     26        3.77        (1.09, 13.09)     0.0365 
          RACE                                    26        2.69         (0.80, 9.00)     0.1093 
          Age (yr)                                26        2.43         (0.74, 7.92)     0.1415 

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
                                                     Treatment Effect Adjusted for Covariate     
        Effect/Covariate Included in the Model    n     Hazard Ratio        90% CI       p-value 
        —————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                               
          B: Placebo vs control (A: Drug X)       26        2.52         (1.04, 6.08)     0.0842 
        Covariate:                                                                               
          Sex                                     26        3.77        (1.33, 10.71)     0.0365 
          RACE                                    26        2.69         (0.97, 7.41)     0.1093 
          Age (yr)                                26        2.43         (0.90, 6.55)     0.1415 

---

    Code
      cat(export_as_txt(res3, lpp = 100))
    Output
                                                     Treatment Effect Adjusted for Covariate     
        Effect/Covariate Included in the Model    n     Hazard Ratio        95% CI       p-value 
        —————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                               
          B: Placebo vs control (A: Drug X)       26        2.52         (0.88, 7.20)     0.0842 
        Covariate:                                                                               
          Sex                                     26        3.77        (1.09, 13.09)     0.0365 
          Age (yr)                                26        2.43         (0.74, 7.92)     0.1415 

---

    Code
      cat(export_as_txt(res4, lpp = 100))
    Output
                                                     Treatment Effect Adjusted for Covariate     
        Effect/Covariate Included in the Model    n     Hazard Ratio        95% CI       p-value 
        —————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                               
          B: Placebo vs control (A: Drug X)       26        2.14         (0.63, 7.21)     0.2202 
        Covariate:                                                                               
          Sex                                     26        2.65        (0.63, 11.21)     0.1846 
          Age (yr)                                26        2.02         (0.58, 7.03)     0.2669 

