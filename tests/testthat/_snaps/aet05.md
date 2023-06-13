# aet05 can handle NA values

    Code
      cat(formatters::export_as_txt(res, lpp = 100))
    Output
                                            A: Drug X   B: Placebo   C: Combination
                                             (N=134)     (N=134)        (N=132)    
        ———————————————————————————————————————————————————————————————————————————
        Total patient-years at risk            0.0         0.0            0.0      
        Number of adverse events observed       0           0              0       
        AE rate per 100 patient-years          NA           NA             NA      
        95% CI                                 NA           NA             NA      

# aet05 can handle some NA values

    Code
      cat(formatters::export_as_txt(res1, lpp = 100))
    Output
                                             A: Drug X      B: Placebo    C: Combination
                                              (N=134)        (N=134)         (N=132)    
        ————————————————————————————————————————————————————————————————————————————————
        Total patient-years at risk           13068.2        13038.6         12739.2    
        Number of adverse events observed       439            511             414      
        AE rate per 100 patient-years           3.36           3.92            3.25     
        95% CI                              (3.05, 3.67)   (3.58, 4.26)    (2.94, 3.56) 

---

    Code
      cat(formatters::export_as_txt(res2, lpp = 100))
    Output
                                             A: Drug X      B: Placebo    C: Combination
                                              (N=134)        (N=134)         (N=132)    
        ————————————————————————————————————————————————————————————————————————————————
        Total patient-years at risk           13068.2        13038.6         12739.2    
        Number of adverse events observed       439            511             414      
        AE rate per 100 patient-years           3.36           3.92            3.25     
        90% CI                              (3.10, 3.63)   (3.64, 4.21)    (3.00, 3.52) 

