# aet05_all can handle NA values

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

# aet05_all can handle some NA values

    Code
      cat(formatters::export_as_txt(res1, lpp = 100))
    Output
                                               A: Drug X          B: Placebo       C: Combination 
                                                (N=134)            (N=134)            (N=132)     
        ——————————————————————————————————————————————————————————————————————————————————————————
        Total patient-years at risk              1007.8             995.5              1024.8     
        Number of adverse events observed         1216               1176               1495      
        AE rate per 100 patient-years            120.65             118.13             145.89     
        95% CI                              (113.87, 127.44)   (111.38, 124.88)   (138.49, 153.28)

---

    Code
      cat(formatters::export_as_txt(res2, lpp = 100))
    Output
                                               A: Drug X          B: Placebo       C: Combination 
                                                (N=134)            (N=134)            (N=132)     
        ——————————————————————————————————————————————————————————————————————————————————————————
        Total patient-years at risk              1007.8             995.5              1024.8     
        Number of adverse events observed         1216               1176               1495      
        AE rate per 100 patient-years            120.65             118.13             145.89     
        90% CI                              (115.07, 126.45)   (112.57, 123.91)   (139.79, 152.20)

