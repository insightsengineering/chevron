# dst01 works as expected when all data are NA

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                                                
        ————————————————————————————————————————————————————————————————————————————————————————
           Null Report: No observations met the reporting criteria for inclusion in this output.

# dst01 can handle all NA values in DCSREAS

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                       A: Drug X    B: Placebo   C: Combination   All Patients
                         (N=15)       (N=15)         (N=15)          (N=45)   
        ——————————————————————————————————————————————————————————————————————
        Completed      10 (66.7%)   10 (66.7%)     10 (66.7%)      30 (66.7%) 
        Discontinued   5 (33.3%)    5 (33.3%)      5 (33.3%)       15 (33.3%) 

# dst01 can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                          A: Drug X    B: Placebo   C: Combination   All Patients
                                            (N=15)       (N=15)         (N=15)          (N=45)   
        —————————————————————————————————————————————————————————————————————————————————————————
        Completed                         10 (71.4%)   10 (66.7%)     9 (64.3%)       29 (67.4%) 
        Discontinued                      4 (26.7%)    5 (33.3%)      5 (33.3%)       14 (31.1%) 
          ADVERSE EVENT                       0            0           1 (6.7%)        1 (2.2%)  
          DEATH                            1 (6.7%)    4 (26.7%)      3 (20.0%)       8 (17.8%)  
          LACK OF EFFICACY                2 (13.3%)        0              0            2 (4.4%)  
          PHYSICIAN DECISION                  0            0           1 (6.7%)        1 (2.2%)  
          PROTOCOL VIOLATION                  0         1 (6.7%)          0            1 (2.2%)  
          WITHDRAWAL BY PARENT/GUARDIAN    1 (6.7%)        0              0            1 (2.2%)  

# dst01 can handle missing levels in status_var

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                                                
        ————————————————————————————————————————————————————————————————————————————————————————
           Null Report: No observations met the reporting criteria for inclusion in this output.

# dst01 can create variants

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                          A: Drug X    B: Placebo   C: Combination   All Patients
                                            (N=15)       (N=15)         (N=15)          (N=45)   
        —————————————————————————————————————————————————————————————————————————————————————————
        Completed                         10 (66.7%)   10 (66.7%)     10 (66.7%)      30 (66.7%) 
        Discontinued                      5 (33.3%)    5 (33.3%)      5 (33.3%)       15 (33.3%) 
          ADVERSE EVENT                       0            0           1 (6.7%)        1 (2.2%)  
          DEATH                           2 (13.3%)    4 (26.7%)      3 (20.0%)       9 (20.0%)  
          LACK OF EFFICACY                2 (13.3%)        0              0            2 (4.4%)  
          PHYSICIAN DECISION                  0            0           1 (6.7%)        1 (2.2%)  
          PROTOCOL VIOLATION                  0         1 (6.7%)          0            1 (2.2%)  
          WITHDRAWAL BY PARENT/GUARDIAN    1 (6.7%)        0              0            1 (2.2%)  

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                            A: Drug X    B: Placebo   C: Combination   All Patients
                                              (N=15)       (N=15)         (N=15)          (N=45)   
        ———————————————————————————————————————————————————————————————————————————————————————————
        Completed                           10 (66.7%)   10 (66.7%)     10 (66.7%)      30 (66.7%) 
        Discontinued                        5 (33.3%)    5 (33.3%)      5 (33.3%)       15 (33.3%) 
          Safety                                                                                   
            ADVERSE EVENT                       0            0           1 (6.7%)        1 (2.2%)  
            DEATH                           2 (13.3%)    4 (26.7%)      3 (20.0%)       9 (20.0%)  
          Non-Safety                                                                               
            LACK OF EFFICACY                2 (13.3%)        0              0            2 (4.4%)  
            PHYSICIAN DECISION                  0            0           1 (6.7%)        1 (2.2%)  
            PROTOCOL VIOLATION                  0         1 (6.7%)          0            1 (2.2%)  
            WITHDRAWAL BY PARENT/GUARDIAN    1 (6.7%)        0              0            1 (2.2%)  

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                            A: Drug X    B: Placebo   C: Combination   All Patients
                                              (N=15)       (N=15)         (N=15)          (N=45)   
        ———————————————————————————————————————————————————————————————————————————————————————————
        Completed                           10 (66.7%)   10 (66.7%)     10 (66.7%)      30 (66.7%) 
        Discontinued                        5 (33.3%)    5 (33.3%)      5 (33.3%)       15 (33.3%) 
          Safety                                                                                   
            ADVERSE EVENT                       0            0           1 (6.7%)        1 (2.2%)  
            DEATH                           2 (13.3%)    4 (26.7%)      3 (20.0%)       9 (20.0%)  
          Non-Safety                                                                               
            LACK OF EFFICACY                2 (13.3%)        0              0            2 (4.4%)  
            PHYSICIAN DECISION                  0            0           1 (6.7%)        1 (2.2%)  
            PROTOCOL VIOLATION                  0         1 (6.7%)          0            1 (2.2%)  
            WITHDRAWAL BY PARENT/GUARDIAN    1 (6.7%)        0              0            1 (2.2%)  
        Completed Treatment                 8 (53.3%)    4 (26.7%)      5 (33.3%)       17 (37.8%) 
        Ongoing Treatment                   4 (26.7%)    6 (40.0%)      4 (26.7%)       14 (31.1%) 
        Discontinued Treatment              3 (20.0%)    5 (33.3%)      6 (40.0%)       14 (31.1%) 

