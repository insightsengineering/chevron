# aet10 can handle NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                 A: Drug X    B: Placebo    C: Combination
        MedDRA Preferred Term     (N=134)       (N=134)        (N=132)    
        ——————————————————————————————————————————————————————————————————
        No Coding Available     122 (91.0%)   123 (91.8%)    120 (90.9%)  

# aet10 can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                A: Drug X    B: Placebo   C: Combination
        MedDRA Preferred Term    (N=134)      (N=134)        (N=132)    
        ————————————————————————————————————————————————————————————————
        dcd D.2.1.5.3           47 (35.1%)   58 (43.3%)     57 (43.2%)  
        dcd A.1.1.1.1           50 (37.3%)   45 (33.6%)     63 (47.7%)  
        dcd B.2.2.3.1           48 (35.8%)   54 (40.3%)     51 (38.6%)  
        dcd A.1.1.1.2           48 (35.8%)   48 (35.8%)     50 (37.9%)  
        dcd B.2.1.2.1           48 (35.8%)   44 (32.8%)     52 (39.4%)  
        dcd D.1.1.1.1           50 (37.3%)   42 (31.3%)     51 (38.6%)  
        dcd B.1.1.1.1           47 (35.1%)   49 (36.6%)     43 (32.6%)  
        dcd D.1.1.4.2           47 (35.1%)   42 (31.3%)     50 (37.9%)  
        dcd C.2.1.2.1           35 (26.1%)   48 (35.8%)     55 (41.7%)  
        dcd C.1.1.1.3           43 (32.1%)   46 (34.3%)     43 (32.6%)  
