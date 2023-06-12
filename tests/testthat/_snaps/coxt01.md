# coxt01 can handle some NA values

    Code
      cat(formatters::export_as_txt(res1, lpp = 100))
    Output
        Effect/Covariate Included in the Model       Treatment Effect Adjusted for Covariate     
                                                   n     Hazard Ratio       95% CI       p-value 
        —————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                               
          B: Placebo vs control (A: Drug X)       264        1.38        (1.02, 1.88)     0.0381 
        Covariate:                                                                               
          Sex                                     264        1.38        (1.01, 1.87)     0.0408 
          RACE                                    264        1.39        (1.02, 1.89)     0.0368 
          Age (yr)                                264        1.41        (1.04, 1.92)     0.0291 

---

    Code
      cat(formatters::export_as_txt(res2, lpp = 100))
    Output
        Effect/Covariate Included in the Model       Treatment Effect Adjusted for Covariate     
                                                   n     Hazard Ratio       90% CI       p-value 
        —————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                               
          B: Placebo vs control (A: Drug X)       264        1.38        (1.07, 1.79)     0.0381 
        Covariate:                                                                               
          Sex                                     264        1.38        (1.06, 1.78)     0.0408 
          RACE                                    264        1.39        (1.07, 1.80)     0.0368 
          Age (yr)                                264        1.41        (1.09, 1.83)     0.0291 

---

    Code
      cat(formatters::export_as_txt(res3, lpp = 100))
    Output
        Effect/Covariate Included in the Model       Treatment Effect Adjusted for Covariate     
                                                   n     Hazard Ratio       95% CI       p-value 
        —————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                               
          B: Placebo vs control (A: Drug X)       264        1.38        (1.02, 1.88)     0.0381 
        Covariate:                                                                               
          Sex                                     264        1.38        (1.01, 1.87)     0.0408 
          Age (yr)                                264        1.41        (1.04, 1.92)     0.0291 

---

    Code
      cat(formatters::export_as_txt(res4, lpp = 100))
    Output
        Effect/Covariate Included in the Model       Treatment Effect Adjusted for Covariate     
                                                   n     Hazard Ratio       95% CI       p-value 
        —————————————————————————————————————————————————————————————————————————————————————————
        Treatment:                                                                               
          B: Placebo vs control (A: Drug X)       264        1.37        (1.01, 1.87)     0.0459 
        Covariate:                                                                               
          Sex                                     264        1.37        (1.00, 1.87)     0.0469 
          Age (yr)                                264        1.40        (1.02, 1.92)     0.0352 

