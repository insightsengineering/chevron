# dst01 can handle all NA values in DCSREAS

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                       A: Drug X    B: Placebo   C: Combination   All Patients
                        (N=134)      (N=134)        (N=132)         (N=400)   
        ——————————————————————————————————————————————————————————————————————
        Completed      68 (50.7%)   66 (49.3%)     73 (55.3%)     207 (51.7%) 
        Ongoing        24 (17.9%)   28 (20.9%)     21 (15.9%)      73 (18.2%) 
        Discontinued   42 (31.3%)   40 (29.9%)     38 (28.8%)     120 (30.0%) 

# dst01 can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                          A: Drug X    B: Placebo   C: Combination   All Patients
                                           (N=134)      (N=134)        (N=132)         (N=400)   
        —————————————————————————————————————————————————————————————————————————————————————————
        Completed                         68 (51.1%)   66 (49.3%)     72 (55.0%)     206 (51.8%) 
        Ongoing                           24 (18.0%)   28 (20.9%)     21 (16.0%)      73 (18.3%) 
        Discontinued                      41 (30.6%)   40 (29.9%)     38 (28.8%)     119 (29.8%) 
          ADVERSE EVENT                    3 (2.2%)     6 (4.5%)       5 (3.8%)       14 (3.5%)  
          DEATH                           24 (17.9%)   23 (17.2%)     22 (16.7%)      69 (17.2%) 
          LACK OF EFFICACY                 2 (1.5%)     2 (1.5%)       3 (2.3%)        7 (1.8%)  
          PHYSICIAN DECISION               2 (1.5%)     3 (2.2%)       2 (1.5%)        7 (1.8%)  
          PROTOCOL VIOLATION               5 (3.7%)     3 (2.2%)       4 (3.0%)       12 (3.0%)  
          WITHDRAWAL BY PARENT/GUARDIAN    4 (3.0%)     2 (1.5%)       1 (0.8%)        7 (1.8%)  
          WITHDRAWAL BY SUBJECT            1 (0.7%)     1 (0.7%)       1 (0.8%)        3 (0.8%)  

# dst01 can handle missing levels in status_var

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                  A: Drug X   B: Placebo   C: Combination   All Patients
                   (N=134)     (N=134)        (N=132)         (N=400)   
        ————————————————————————————————————————————————————————————————
        Ongoing   24 (100%)   28 (100%)      21 (100%)       73 (100%)  

# dst01 can create variants

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                          A: Drug X    B: Placebo   C: Combination   All Patients
                                           (N=134)      (N=134)        (N=132)         (N=400)   
        —————————————————————————————————————————————————————————————————————————————————————————
        Completed                         68 (50.7%)   66 (49.3%)     73 (55.3%)     207 (51.7%) 
        Ongoing                           24 (17.9%)   28 (20.9%)     21 (15.9%)      73 (18.2%) 
          Alive: Ongoing                   8 (6.0%)     6 (4.5%)       8 (6.1%)       22 (5.5%)  
          Alive: In Follow-up             16 (11.9%)   22 (16.4%)     13 (9.8%)       51 (12.8%) 
        Discontinued                      42 (31.3%)   40 (29.9%)     38 (28.8%)     120 (30.0%) 
          ADVERSE EVENT                    3 (2.2%)     6 (4.5%)       5 (3.8%)       14 (3.5%)  
          DEATH                           25 (18.7%)   23 (17.2%)     22 (16.7%)      70 (17.5%) 
          LACK OF EFFICACY                 2 (1.5%)     2 (1.5%)       3 (2.3%)        7 (1.8%)  
          PHYSICIAN DECISION               2 (1.5%)     3 (2.2%)       2 (1.5%)        7 (1.8%)  
          PROTOCOL VIOLATION               5 (3.7%)     3 (2.2%)       4 (3.0%)       12 (3.0%)  
          WITHDRAWAL BY PARENT/GUARDIAN    4 (3.0%)     2 (1.5%)       1 (0.8%)        7 (1.8%)  
          WITHDRAWAL BY SUBJECT            1 (0.7%)     1 (0.7%)       1 (0.8%)        3 (0.8%)  

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                            A: Drug X    B: Placebo   C: Combination   All Patients
                                             (N=134)      (N=134)        (N=132)         (N=400)   
        ———————————————————————————————————————————————————————————————————————————————————————————
        Completed                           68 (50.7%)   66 (49.3%)     73 (55.3%)     207 (51.7%) 
        Ongoing                             24 (17.9%)   28 (20.9%)     21 (15.9%)      73 (18.2%) 
        Discontinued                        42 (31.3%)   40 (29.9%)     38 (28.8%)     120 (30.0%) 
          Safety                                                                                   
            ADVERSE EVENT                    3 (2.2%)     6 (4.5%)       5 (3.8%)       14 (3.5%)  
            DEATH                           25 (18.7%)   23 (17.2%)     22 (16.7%)      70 (17.5%) 
          Non-Safety                                                                               
            LACK OF EFFICACY                 2 (1.5%)     2 (1.5%)       3 (2.3%)        7 (1.8%)  
            PHYSICIAN DECISION               2 (1.5%)     3 (2.2%)       2 (1.5%)        7 (1.8%)  
            PROTOCOL VIOLATION               5 (3.7%)     3 (2.2%)       4 (3.0%)       12 (3.0%)  
            WITHDRAWAL BY PARENT/GUARDIAN    4 (3.0%)     2 (1.5%)       1 (0.8%)        7 (1.8%)  
            WITHDRAWAL BY SUBJECT            1 (0.7%)     1 (0.7%)       1 (0.8%)        3 (0.8%)  

---

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                            A: Drug X    B: Placebo   C: Combination   All Patients
                                             (N=134)      (N=134)        (N=132)         (N=400)   
        ———————————————————————————————————————————————————————————————————————————————————————————
        Completed                           68 (50.7%)   66 (49.3%)     73 (55.3%)     207 (51.7%) 
        Ongoing                             24 (17.9%)   28 (20.9%)     21 (15.9%)      73 (18.2%) 
        Discontinued                        42 (31.3%)   40 (29.9%)     38 (28.8%)     120 (30.0%) 
          Safety                                                                                   
            ADVERSE EVENT                    3 (2.2%)     6 (4.5%)       5 (3.8%)       14 (3.5%)  
            DEATH                           25 (18.7%)   23 (17.2%)     22 (16.7%)      70 (17.5%) 
          Non-Safety                                                                               
            LACK OF EFFICACY                 2 (1.5%)     2 (1.5%)       3 (2.3%)        7 (1.8%)  
            PHYSICIAN DECISION               2 (1.5%)     3 (2.2%)       2 (1.5%)        7 (1.8%)  
            PROTOCOL VIOLATION               5 (3.7%)     3 (2.2%)       4 (3.0%)       12 (3.0%)  
            WITHDRAWAL BY PARENT/GUARDIAN    4 (3.0%)     2 (1.5%)       1 (0.8%)        7 (1.8%)  
            WITHDRAWAL BY SUBJECT            1 (0.7%)     1 (0.7%)       1 (0.8%)        3 (0.8%)  
        Completed Treatment                 47 (35.1%)   35 (26.1%)     42 (31.8%)     124 (31.0%) 
        Ongoing Treatment                   39 (29.1%)   46 (34.3%)     46 (34.8%)     131 (32.8%) 
        Discontinued Treatment              48 (35.8%)   53 (39.6%)     44 (33.3%)     145 (36.2%) 

