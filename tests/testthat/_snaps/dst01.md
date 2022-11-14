# dst01 can handle all NA values

    Code
      res
    Output
                        A: Drug X   B: Placebo   C: Combination   All Patients
                         (N=134)     (N=134)        (N=132)         (N=400)   
      ————————————————————————————————————————————————————————————————————————
      Completed Study   0 (0.0%)     0 (0.0%)       0 (0.0%)        0 (0.0%)  

# dst01_1 can handle all NA values in disc_reason_var

    Code
      res
    Output
                           A: Drug X    B: Placebo   C: Combination   All Patients
                            (N=134)      (N=134)        (N=132)         (N=400)   
      ————————————————————————————————————————————————————————————————————————————
      Completed Study      68 (50.7%)   66 (49.3%)     73 (55.3%)     207 (51.7%) 
      Ongoing              24 (17.9%)   28 (20.9%)     21 (15.9%)      73 (18.2%) 
      Discontinued Study   42 (31.3%)   40 (29.9%)     38 (28.8%)     120 (30.0%) 

# dst01_1 can handle some NA values

    Code
      res
    Output
                                        A: Drug X    B: Placebo   C: Combination   All Patients
                                         (N=134)      (N=134)        (N=132)         (N=400)   
      —————————————————————————————————————————————————————————————————————————————————————————
      Completed Study                   68 (50.7%)   66 (49.3%)     72 (54.5%)     206 (51.5%) 
      Ongoing                           24 (17.9%)   28 (20.9%)     21 (15.9%)      73 (18.2%) 
      Discontinued Study                41 (30.6%)   40 (29.9%)     38 (28.8%)     119 (29.8%) 
        ADVERSE EVENT                    3 (2.2%)     6 (4.5%)       5 (3.8%)       14 (3.5%)  
        DEATH                           24 (17.9%)   23 (17.2%)     22 (16.7%)      69 (17.2%) 
        LACK OF EFFICACY                 2 (1.5%)     2 (1.5%)       3 (2.3%)        7 (1.8%)  
        PHYSICIAN DECISION               2 (1.5%)     3 (2.2%)       2 (1.5%)        7 (1.8%)  
        PROTOCOL VIOLATION               5 (3.7%)     3 (2.2%)       4 (3.0%)       12 (3.0%)  
        WITHDRAWAL BY PARENT/GUARDIAN    4 (3.0%)     2 (1.5%)       1 (0.8%)        7 (1.8%)  
        WITHDRAWAL BY SUBJECT            1 (0.7%)     1 (0.7%)       1 (0.8%)        3 (0.8%)  

# dst01_1 can handle missing levels in status_var

    Code
      res
    Output
                        A: Drug X    B: Placebo   C: Combination   All Patients
                         (N=134)      (N=134)        (N=132)         (N=400)   
      —————————————————————————————————————————————————————————————————————————
      Completed Study    0 (0.0%)     0 (0.0%)       0 (0.0%)        0 (0.0%)  
      Ongoing           24 (17.9%)   28 (20.9%)     21 (15.9%)      73 (18.2%) 

# dst01_1 can handle missing levels in disc_reason_var

    Code
      res
    Output
                           A: Drug X    B: Placebo   C: Combination   All Patients
                            (N=134)      (N=134)        (N=132)         (N=400)   
      ————————————————————————————————————————————————————————————————————————————
      Completed Study      68 (50.7%)   66 (49.3%)     73 (55.3%)     207 (51.7%) 
      Ongoing              24 (17.9%)   28 (20.9%)     21 (15.9%)      73 (18.2%) 
      Discontinued Study   42 (31.3%)   40 (29.9%)     38 (28.8%)     120 (30.0%) 
        DEATH              25 (18.7%)   23 (17.2%)     22 (16.7%)      70 (17.5%) 

# dst01_2 can handle all NA values

    Code
      res
    Output
                        A: Drug X   B: Placebo   C: Combination   All Patients
                         (N=134)     (N=134)        (N=132)         (N=400)   
      ————————————————————————————————————————————————————————————————————————
      Completed Study   0 (0.0%)     0 (0.0%)       0 (0.0%)        0 (0.0%)  

# dst01_2 can handle all NA values in disc_reason_var

    Code
      res
    Output
                           A: Drug X    B: Placebo   C: Combination   All Patients
                            (N=134)      (N=134)        (N=132)         (N=400)   
      ————————————————————————————————————————————————————————————————————————————
      Completed Study      68 (50.7%)   66 (49.3%)     73 (55.3%)     207 (51.7%) 
      Ongoing              24 (17.9%)   28 (20.9%)     21 (15.9%)      73 (18.2%) 
      Discontinued Study   42 (31.3%)   40 (29.9%)     38 (28.8%)     120 (30.0%) 

# dst01_2 can handle some NA values

    Code
      res
    Output
                                          A: Drug X    B: Placebo   C: Combination   All Patients
                                           (N=134)      (N=134)        (N=132)         (N=400)   
      ———————————————————————————————————————————————————————————————————————————————————————————
      Completed Study                     68 (50.7%)   66 (49.3%)     72 (54.5%)     206 (51.5%) 
      Ongoing                             24 (17.9%)   28 (20.9%)     21 (15.9%)      73 (18.2%) 
      Discontinued Study                  41 (30.6%)   40 (29.9%)     38 (28.8%)     119 (29.8%) 
        Safety                            27 (20.1%)   29 (21.6%)     27 (20.5%)      83 (20.8%) 
          ADVERSE EVENT                    3 (2.2%)     6 (4.5%)       5 (3.8%)       14 (3.5%)  
          DEATH                           24 (17.9%)   23 (17.2%)     22 (16.7%)      69 (17.2%) 
        Non-Safety                        14 (10.4%)   11 (8.2%)      11 (8.3%)       36 (9.0%)  
          LACK OF EFFICACY                 2 (1.5%)     2 (1.5%)       3 (2.3%)        7 (1.8%)  
          PHYSICIAN DECISION               2 (1.5%)     3 (2.2%)       2 (1.5%)        7 (1.8%)  
          PROTOCOL VIOLATION               5 (3.7%)     3 (2.2%)       4 (3.0%)       12 (3.0%)  
          WITHDRAWAL BY PARENT/GUARDIAN    4 (3.0%)     2 (1.5%)       1 (0.8%)        7 (1.8%)  
          WITHDRAWAL BY SUBJECT            1 (0.7%)     1 (0.7%)       1 (0.8%)        3 (0.8%)  

# dst01_2 can handle missing levels in disc_reason_var

    Code
      res
    Output
                           A: Drug X    B: Placebo   C: Combination   All Patients
                            (N=134)      (N=134)        (N=132)         (N=400)   
      ————————————————————————————————————————————————————————————————————————————
      Completed Study      68 (50.7%)   66 (49.3%)     73 (55.3%)     207 (51.7%) 
      Ongoing              24 (17.9%)   28 (20.9%)     21 (15.9%)      73 (18.2%) 
      Discontinued Study   42 (31.3%)   40 (29.9%)     38 (28.8%)     120 (30.0%) 
        Safety             25 (18.7%)   23 (17.2%)     22 (16.7%)      70 (17.5%) 
          DEATH            25 (18.7%)   23 (17.2%)     22 (16.7%)      70 (17.5%) 

# dst01_3 can handle all NA values

    Code
      res
    Output
                        A: Drug X   B: Placebo   C: Combination   All Patients
                         (N=134)     (N=134)        (N=132)         (N=400)   
      ————————————————————————————————————————————————————————————————————————
      Completed Study   0 (0.0%)     0 (0.0%)       0 (0.0%)        0 (0.0%)  

# dst01_3 can handle all NA values in status_treatment_var

    Code
      res
    Output
                           A: Drug X    B: Placebo   C: Combination   All Patients
                            (N=134)      (N=134)        (N=132)         (N=400)   
      ————————————————————————————————————————————————————————————————————————————
      Completed Study      68 (50.7%)   66 (49.3%)     73 (55.3%)     207 (51.7%) 
      Ongoing              24 (17.9%)   28 (20.9%)     21 (15.9%)      73 (18.2%) 
      Discontinued Study   42 (31.3%)   40 (29.9%)     38 (28.8%)     120 (30.0%) 
        Safety             28 (20.9%)   29 (21.6%)     27 (20.5%)      84 (21.0%) 
          ADVERSE EVENT     3 (2.2%)     6 (4.5%)       5 (3.8%)       14 (3.5%)  
          DEATH            25 (18.7%)   23 (17.2%)     22 (16.7%)      70 (17.5%) 

# dst01_3 can handle some NA values in status_treatment_var

    Code
      res
    Output
                               A: Drug X    B: Placebo   C: Combination   All Patients
                                (N=134)      (N=134)        (N=132)         (N=400)   
      ————————————————————————————————————————————————————————————————————————————————
      Completed Study          68 (50.7%)   66 (49.3%)     73 (55.3%)     207 (51.7%) 
      Ongoing                  24 (17.9%)   28 (20.9%)     21 (15.9%)      73 (18.2%) 
      Discontinued Study       42 (31.3%)   40 (29.9%)     38 (28.8%)     120 (30.0%) 
        Safety                 28 (20.9%)   29 (21.6%)     27 (20.5%)      84 (21.0%) 
          ADVERSE EVENT         3 (2.2%)     6 (4.5%)       5 (3.8%)       14 (3.5%)  
          DEATH                25 (18.7%)   23 (17.2%)     22 (16.7%)      70 (17.5%) 
      Completed Treatment      46 (34.3%)   35 (26.1%)     41 (31.1%)     122 (30.5%) 
      Ongoing Treatment        39 (29.1%)   46 (34.3%)     46 (34.8%)     131 (32.8%) 
      Discontinued Treatment   48 (35.8%)   53 (39.6%)     44 (33.3%)     145 (36.2%) 

# dst01_3 can handle missing levels in status_treatment_var

    Code
      res
    Output
                           A: Drug X    B: Placebo   C: Combination   All Patients
                            (N=134)      (N=134)        (N=132)         (N=400)   
      ————————————————————————————————————————————————————————————————————————————
      Completed Study      68 (50.7%)   66 (49.3%)     73 (55.3%)     207 (51.7%) 
      Ongoing              24 (17.9%)   28 (20.9%)     21 (15.9%)      73 (18.2%) 
      Discontinued Study   42 (31.3%)   40 (29.9%)     38 (28.8%)     120 (30.0%) 
        Safety             28 (20.9%)   29 (21.6%)     27 (20.5%)      84 (21.0%) 
          ADVERSE EVENT     3 (2.2%)     6 (4.5%)       5 (3.8%)       14 (3.5%)  
          DEATH            25 (18.7%)   23 (17.2%)     22 (16.7%)      70 (17.5%) 
      Ongoing Treatment    39 (29.1%)   46 (34.3%)     46 (34.8%)     131 (32.8%) 

