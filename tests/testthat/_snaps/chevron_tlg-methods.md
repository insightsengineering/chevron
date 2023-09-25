# run works as expected for chevron_t object

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        MedDRA System Organ Class                                                             
          MedDRA Preferred Term                      A: Drug X    B: Placebo    C: Combination
                                    Grade             (N=134)       (N=134)        (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————————
        - Any adverse events -                                                                
                                    - Any Grade -   122 (91.0%)   123 (91.8%)    120 (90.9%)  
                                    Grade 1-2        13 (9.7%)    19 (14.2%)      11 (8.3%)   
                                    1                7 (5.2%)      9 (6.7%)        4 (3.0%)   
                                    2                6 (4.5%)      10 (7.5%)       7 (5.3%)   
                                    Grade 3-4       33 (24.6%)    34 (25.4%)      34 (25.8%)  
                                    3               18 (13.4%)    14 (10.4%)      16 (12.1%)  
                                    4               15 (11.2%)    20 (14.9%)      18 (13.6%)  
                                    Grade 5         76 (56.7%)    70 (52.2%)      75 (56.8%)  
        cl A.1                                                                                
          - Overall -                                                                         
                                    - Any Grade -   78 (58.2%)    75 (56.0%)      89 (67.4%)  
                                    Grade 1-2       78 (58.2%)    75 (56.0%)      89 (67.4%)  
                                    1               30 (22.4%)    27 (20.1%)      39 (29.5%)  
                                    2               48 (35.8%)    48 (35.8%)      50 (37.9%)  
          dcd A.1.1.1.1                                                                       
                                    - Any Grade -   50 (37.3%)    45 (33.6%)      63 (47.7%)  
                                    Grade 1-2       50 (37.3%)    45 (33.6%)      63 (47.7%)  
                                    1               50 (37.3%)    45 (33.6%)      63 (47.7%)  
          dcd A.1.1.1.2                                                                       
                                    - Any Grade -   48 (35.8%)    48 (35.8%)      50 (37.9%)  
                                    Grade 1-2       48 (35.8%)    48 (35.8%)      50 (37.9%)  
                                    2               48 (35.8%)    48 (35.8%)      50 (37.9%)  
        cl B.2                                                                                
          - Overall -                                                                         
                                    - Any Grade -   79 (59.0%)    74 (55.2%)      85 (64.4%)  
                                    Grade 1-2       30 (22.4%)    30 (22.4%)      33 (25.0%)  
                                    1               30 (22.4%)    30 (22.4%)      33 (25.0%)  
                                    Grade 3-4       49 (36.6%)    44 (32.8%)      52 (39.4%)  
                                    3               49 (36.6%)    44 (32.8%)      52 (39.4%)  
          dcd B.2.2.3.1                                                                       
                                    - Any Grade -   48 (35.8%)    54 (40.3%)      51 (38.6%)  
                                    Grade 1-2       48 (35.8%)    54 (40.3%)      51 (38.6%)  
                                    1               48 (35.8%)    54 (40.3%)      51 (38.6%)  
          dcd B.2.1.2.1                                                                       
                                    - Any Grade -   49 (36.6%)    44 (32.8%)      52 (39.4%)  
                                    Grade 3-4       49 (36.6%)    44 (32.8%)      52 (39.4%)  
                                    3               49 (36.6%)    44 (32.8%)      52 (39.4%)  
        cl D.1                                                                                
          - Overall -                                                                         
                                    - Any Grade -   79 (59.0%)    67 (50.0%)      80 (60.6%)  
                                    Grade 3-4       29 (21.6%)    25 (18.7%)      29 (22.0%)  
                                    3               29 (21.6%)    25 (18.7%)      29 (22.0%)  
                                    Grade 5         50 (37.3%)    42 (31.3%)      51 (38.6%)  
          dcd D.1.1.1.1                                                                       
                                    - Any Grade -   50 (37.3%)    42 (31.3%)      51 (38.6%)  
                                    Grade 5         50 (37.3%)    42 (31.3%)      51 (38.6%)  
          dcd D.1.1.4.2                                                                       
                                    - Any Grade -   48 (35.8%)    42 (31.3%)      50 (37.9%)  
                                    Grade 3-4       48 (35.8%)    42 (31.3%)      50 (37.9%)  
                                    3               48 (35.8%)    42 (31.3%)      50 (37.9%)  
        cl D.2                                                                                
          - Overall -                                                                         
                                    - Any Grade -   47 (35.1%)    58 (43.3%)      57 (43.2%)  
                                    Grade 1-2       47 (35.1%)    58 (43.3%)      57 (43.2%)  
                                    1               47 (35.1%)    58 (43.3%)      57 (43.2%)  
          dcd D.2.1.5.3                                                                       
                                    - Any Grade -   47 (35.1%)    58 (43.3%)      57 (43.2%)  
                                    Grade 1-2       47 (35.1%)    58 (43.3%)      57 (43.2%)  
                                    1               47 (35.1%)    58 (43.3%)      57 (43.2%)  
        cl B.1                                                                                
          - Overall -                                                                         
                                    - Any Grade -   47 (35.1%)    49 (36.6%)      43 (32.6%)  
                                    Grade 5         47 (35.1%)    49 (36.6%)      43 (32.6%)  
          dcd B.1.1.1.1                                                                       
                                    - Any Grade -   47 (35.1%)    49 (36.6%)      43 (32.6%)  
                                    Grade 5         47 (35.1%)    49 (36.6%)      43 (32.6%)  
        cl C.2                                                                                
          - Overall -                                                                         
                                    - Any Grade -   35 (26.1%)    48 (35.8%)      55 (41.7%)  
                                    Grade 1-2       35 (26.1%)    48 (35.8%)      55 (41.7%)  
                                    2               35 (26.1%)    48 (35.8%)      55 (41.7%)  
          dcd C.2.1.2.1                                                                       
                                    - Any Grade -   35 (26.1%)    48 (35.8%)      55 (41.7%)  
                                    Grade 1-2       35 (26.1%)    48 (35.8%)      55 (41.7%)  
                                    2               35 (26.1%)    48 (35.8%)      55 (41.7%)  
        cl C.1                                                                                
          - Overall -                                                                         
                                    - Any Grade -   43 (32.1%)    46 (34.3%)      43 (32.6%)  
                                    Grade 3-4       43 (32.1%)    46 (34.3%)      43 (32.6%)  
                                    4               43 (32.1%)    46 (34.3%)      43 (32.6%)  
          dcd C.1.1.1.3                                                                       
                                    - Any Grade -   43 (32.1%)    46 (34.3%)      43 (32.6%)  
                                    Grade 3-4       43 (32.1%)    46 (34.3%)      43 (32.6%)  
                                    4               43 (32.1%)    46 (34.3%)      43 (32.6%)  

# run works as expected for chevron_t object when auto_pre = FALSE

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                              A: Drug X    B: Placebo    C: Combination   All Patients
                                               (N=134)       (N=134)        (N=132)         (N=400)   
        ——————————————————————————————————————————————————————————————————————————————————————————————
        Age (yr)                                                                                      
          n                                      134           134            132             400     
          Mean (SD)                          33.8 (6.6)    35.4 (7.9)      35.4 (7.7)      34.9 (7.4) 
          Median                                33.0          35.0            35.0            34.0    
          Min - Max                            21 - 50       21 - 62        20 - 69         20 - 69   
        Age Group                                                                                     
          n                                      134           134            132             400     
          <65                                134 (100%)    134 (100%)     131 (99.2%)     399 (99.8%) 
          >=65                                    0             0           1 (0.8%)        1 (0.2%)  
        Sex                                                                                           
          n                                      134           134            132             400     
          F                                  79 (59.0%)    82 (61.2%)      70 (53.0%)     231 (57.8%) 
          M                                  55 (41.0%)    52 (38.8%)      62 (47.0%)     169 (42.2%) 
        Ethnicity                                                                                     
          n                                      134           134            132             400     
          NOT REPORTED                        6 (4.5%)      10 (7.5%)      11 (8.3%)       27 (6.8%)  
          HISPANIC OR LATINO                 15 (11.2%)    18 (13.4%)      15 (11.4%)      48 (12.0%) 
          NOT HISPANIC OR LATINO             104 (77.6%)   103 (76.9%)    101 (76.5%)     308 (77.0%) 
          UNKNOWN                             9 (6.7%)      3 (2.2%)        5 (3.8%)       17 (4.2%)  
        RACE                                                                                          
          n                                      134           134            132             400     
          AMERICAN INDIAN OR ALASKA NATIVE    8 (6.0%)      11 (8.2%)       6 (4.5%)       25 (6.2%)  
          ASIAN                              68 (50.7%)    68 (50.7%)      73 (55.3%)     209 (52.2%) 
          BLACK OR AFRICAN AMERICAN          31 (23.1%)    28 (20.9%)      32 (24.2%)      91 (22.8%) 
          WHITE                              27 (20.1%)    27 (20.1%)      21 (15.9%)      75 (18.8%) 

# run works as expected with argument printed

    Code
      cat(res)
    Output
      Using template:  aet02 
      Using data:      syn_data 
      
      Pre args:
        row_split_var  : "AEBODSYS"
      
      Main args:
        arm_var         : "ACTARM"
        row_split_var   : "AEBODSYS"
        lbl_overall     : NULL
        summary_labels  : list(all = aet02_label, TOTAL = c(nonunique = "Overall total number of events"))
      
      Post args:
        row_split_var  : "AEBODSYS"
        prune_0        : TRUE
      

---

    Code
      cat(export_as_txt(tbl, lpp = 100))
    Output
        MedDRA System Organ Class                                     A: Drug X    B: Placebo    C: Combination
          MedDRA Preferred Term                                        (N=134)       (N=134)        (N=132)    
        ———————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one adverse event     122 (91.0%)   123 (91.8%)    120 (90.9%)  
        Overall total number of events                                   609           622            703      
        cl A.1                                                                                                 
          Total number of patients with at least one adverse event   78 (58.2%)    75 (56.0%)      89 (67.4%)  
          Total number of events                                         132           130            160      
          dcd A.1.1.1.1                                              50 (37.3%)    45 (33.6%)      63 (47.7%)  
          dcd A.1.1.1.2                                              48 (35.8%)    48 (35.8%)      50 (37.9%)  
        cl B.2                                                                                                 
          Total number of patients with at least one adverse event   79 (59.0%)    74 (55.2%)      85 (64.4%)  
          Total number of events                                         129           138            143      
          dcd B.2.2.3.1                                              48 (35.8%)    54 (40.3%)      51 (38.6%)  
          dcd B.2.1.2.1                                              49 (36.6%)    44 (32.8%)      52 (39.4%)  
        cl D.1                                                                                                 
          Total number of patients with at least one adverse event   79 (59.0%)    67 (50.0%)      80 (60.6%)  
          Total number of events                                         127           106            135      
          dcd D.1.1.1.1                                              50 (37.3%)    42 (31.3%)      51 (38.6%)  
          dcd D.1.1.4.2                                              48 (35.8%)    42 (31.3%)      50 (37.9%)  
        cl D.2                                                                                                 
          Total number of patients with at least one adverse event   47 (35.1%)    58 (43.3%)      57 (43.2%)  
          Total number of events                                         62            72              74      
          dcd D.2.1.5.3                                              47 (35.1%)    58 (43.3%)      57 (43.2%)  
        cl B.1                                                                                                 
          Total number of patients with at least one adverse event   47 (35.1%)    49 (36.6%)      43 (32.6%)  
          Total number of events                                         56            60              62      
          dcd B.1.1.1.1                                              47 (35.1%)    49 (36.6%)      43 (32.6%)  
        cl C.2                                                                                                 
          Total number of patients with at least one adverse event   35 (26.1%)    48 (35.8%)      55 (41.7%)  
          Total number of events                                         48            53              65      
          dcd C.2.1.2.1                                              35 (26.1%)    48 (35.8%)      55 (41.7%)  
        cl C.1                                                                                                 
          Total number of patients with at least one adverse event   43 (32.1%)    46 (34.3%)      43 (32.6%)  
          Total number of events                                         55            63              64      
          dcd C.1.1.1.3                                              43 (32.1%)    46 (34.3%)      43 (32.6%)  

# run works as expected with argument printed if the user argument is complicated

    Code
      cat(res)
    Output
      Using template:  aet02 
      Using data:      syn_data 
      
      Pre args:
        row_split_var  : "AEHLT"
      
      Main args:
        arm_var         : "ACTARM"
        row_split_var   : "AEHLT"
        lbl_overall     : "All Patients"
        summary_labels  : list(all = aet02_label, TOTAL = c(nonunique = "Overall total number of events"))
      
      Post args:
        row_split_var  : "AEHLT"
        prune_0        : TRUE
      
      Additional args:
        not_used  : structure(list(Sepal.Length = c(5.1, 4.9, 4.7, 4.6, 5, 5.4, 4.6, 
                  5, 4.4, 4.9, 5.4, 4.8, 4.8, 4.3, 5.8, 5.7, 5.4, 5.1, 5.7, 5.1, 
                  5.4, 5.1, 4.6, 5.1, 4.8, 5, 5, 5.2, 5.2, 4.7, 4.8, 5.4, 5.2, 
                  5.5, 4.9, 5, 5.5, 4.9, 4.4, 5.1, 5, 4.5, 4.4, 5, 5.1, 4.8, 5.1, 
                  ... (print of class <data.frame> truncated)
      

---

    Code
      cat(export_as_txt(tbl, lpp = 100))
    Output
        High Level Term                                               A: Drug X    B: Placebo    C: Combination
          MedDRA Preferred Term                                        (N=134)       (N=134)        (N=132)    
        ———————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one adverse event     122 (91.0%)   123 (91.8%)    120 (90.9%)  
        Overall total number of events                                   609           622            703      
        hlt A.1.1.1                                                                                            
          Total number of patients with at least one adverse event   78 (58.2%)    75 (56.0%)      89 (67.4%)  
          Total number of events                                         132           130            160      
          dcd A.1.1.1.1                                              50 (37.3%)    45 (33.6%)      63 (47.7%)  
          dcd A.1.1.1.2                                              48 (35.8%)    48 (35.8%)      50 (37.9%)  
        hlt D.2.1.5                                                                                            
          Total number of patients with at least one adverse event   47 (35.1%)    58 (43.3%)      57 (43.2%)  
          Total number of events                                         62            72              74      
          dcd D.2.1.5.3                                              47 (35.1%)    58 (43.3%)      57 (43.2%)  
        hlt B.2.2.3                                                                                            
          Total number of patients with at least one adverse event   48 (35.8%)    54 (40.3%)      51 (38.6%)  
          Total number of events                                         64            76              77      
          dcd B.2.2.3.1                                              48 (35.8%)    54 (40.3%)      51 (38.6%)  
        hlt B.2.1.2                                                                                            
          Total number of patients with at least one adverse event   49 (36.6%)    44 (32.8%)      52 (39.4%)  
          Total number of events                                         65            62              66      
          dcd B.2.1.2.1                                              49 (36.6%)    44 (32.8%)      52 (39.4%)  
        hlt D.1.1.1                                                                                            
          Total number of patients with at least one adverse event   50 (37.3%)    42 (31.3%)      51 (38.6%)  
          Total number of events                                         61            51              71      
          dcd D.1.1.1.1                                              50 (37.3%)    42 (31.3%)      51 (38.6%)  
        hlt D.1.1.4                                                                                            
          Total number of patients with at least one adverse event   48 (35.8%)    42 (31.3%)      50 (37.9%)  
          Total number of events                                         66            55              64      
          dcd D.1.1.4.2                                              48 (35.8%)    42 (31.3%)      50 (37.9%)  
        hlt B.1.1.1                                                                                            
          Total number of patients with at least one adverse event   47 (35.1%)    49 (36.6%)      43 (32.6%)  
          Total number of events                                         56            60              62      
          dcd B.1.1.1.1                                              47 (35.1%)    49 (36.6%)      43 (32.6%)  
        hlt C.2.1.2                                                                                            
          Total number of patients with at least one adverse event   35 (26.1%)    48 (35.8%)      55 (41.7%)  
          Total number of events                                         48            53              65      
          dcd C.2.1.2.1                                              35 (26.1%)    48 (35.8%)      55 (41.7%)  
        hlt C.1.1.1                                                                                            
          Total number of patients with at least one adverse event   43 (32.1%)    46 (34.3%)      43 (32.6%)  
          Total number of events                                         55            63              64      
          dcd C.1.1.1.3                                              43 (32.1%)    46 (34.3%)      43 (32.6%)  
      \s\n  High Level Term                                              All Patients
          MedDRA Preferred Term                                        (N=400)   
        —————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one adverse event     365 (91.2%) 
        Overall total number of events                                   1934    
        hlt A.1.1.1                                                              
          Total number of patients with at least one adverse event   242 (60.5%) 
          Total number of events                                         422     
          dcd A.1.1.1.1                                              158 (39.5%) 
          dcd A.1.1.1.2                                              146 (36.5%) 
        hlt D.2.1.5                                                              
          Total number of patients with at least one adverse event   162 (40.5%) 
          Total number of events                                         208     
          dcd D.2.1.5.3                                              162 (40.5%) 
        hlt B.2.2.3                                                              
          Total number of patients with at least one adverse event   153 (38.2%) 
          Total number of events                                         217     
          dcd B.2.2.3.1                                              153 (38.2%) 
        hlt B.2.1.2                                                              
          Total number of patients with at least one adverse event   145 (36.2%) 
          Total number of events                                         193     
          dcd B.2.1.2.1                                              145 (36.2%) 
        hlt D.1.1.1                                                              
          Total number of patients with at least one adverse event   143 (35.8%) 
          Total number of events                                         183     
          dcd D.1.1.1.1                                              143 (35.8%) 
        hlt D.1.1.4                                                              
          Total number of patients with at least one adverse event   140 (35.0%) 
          Total number of events                                         185     
          dcd D.1.1.4.2                                              140 (35.0%) 
        hlt B.1.1.1                                                              
          Total number of patients with at least one adverse event   139 (34.8%) 
          Total number of events                                         178     
          dcd B.1.1.1.1                                              139 (34.8%) 
        hlt C.2.1.2                                                              
          Total number of patients with at least one adverse event   138 (34.5%) 
          Total number of events                                         166     
          dcd C.2.1.2.1                                              138 (34.5%) 
        hlt C.1.1.1                                                              
          Total number of patients with at least one adverse event   132 (33.0%) 
          Total number of events                                         182     
          dcd C.1.1.1.3                                              132 (33.0%) 

# run works as expected with partial match argument

    Code
      cat(res)
    Output
      Using template:  aet02 
      Using data:      syn_data 
      
      Pre args:
        row_split_var  : "AEBODSYS"
      
      Main args:
        arm_var         : "ARM"
        row_split_var   : "AEBODSYS"
        lbl_overall     : NULL
        summary_labels  : list(all = aet02_label, TOTAL = c(nonunique = "Overall total number of events"))
      
      Post args:
        row_split_var  : "AEBODSYS"
        prune_0        : TRUE
      

---

    Code
      cat(export_as_txt(tbl, lpp = 100))
    Output
        MedDRA System Organ Class                                     A: Drug X    B: Placebo    C: Combination
          MedDRA Preferred Term                                        (N=134)       (N=134)        (N=132)    
        ———————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one adverse event     122 (91.0%)   123 (91.8%)    120 (90.9%)  
        Overall total number of events                                   609           622            703      
        cl A.1                                                                                                 
          Total number of patients with at least one adverse event   78 (58.2%)    75 (56.0%)      89 (67.4%)  
          Total number of events                                         132           130            160      
          dcd A.1.1.1.1                                              50 (37.3%)    45 (33.6%)      63 (47.7%)  
          dcd A.1.1.1.2                                              48 (35.8%)    48 (35.8%)      50 (37.9%)  
        cl B.2                                                                                                 
          Total number of patients with at least one adverse event   79 (59.0%)    74 (55.2%)      85 (64.4%)  
          Total number of events                                         129           138            143      
          dcd B.2.2.3.1                                              48 (35.8%)    54 (40.3%)      51 (38.6%)  
          dcd B.2.1.2.1                                              49 (36.6%)    44 (32.8%)      52 (39.4%)  
        cl D.1                                                                                                 
          Total number of patients with at least one adverse event   79 (59.0%)    67 (50.0%)      80 (60.6%)  
          Total number of events                                         127           106            135      
          dcd D.1.1.1.1                                              50 (37.3%)    42 (31.3%)      51 (38.6%)  
          dcd D.1.1.4.2                                              48 (35.8%)    42 (31.3%)      50 (37.9%)  
        cl D.2                                                                                                 
          Total number of patients with at least one adverse event   47 (35.1%)    58 (43.3%)      57 (43.2%)  
          Total number of events                                         62            72              74      
          dcd D.2.1.5.3                                              47 (35.1%)    58 (43.3%)      57 (43.2%)  
        cl B.1                                                                                                 
          Total number of patients with at least one adverse event   47 (35.1%)    49 (36.6%)      43 (32.6%)  
          Total number of events                                         56            60              62      
          dcd B.1.1.1.1                                              47 (35.1%)    49 (36.6%)      43 (32.6%)  
        cl C.2                                                                                                 
          Total number of patients with at least one adverse event   35 (26.1%)    48 (35.8%)      55 (41.7%)  
          Total number of events                                         48            53              65      
          dcd C.2.1.2.1                                              35 (26.1%)    48 (35.8%)      55 (41.7%)  
        cl C.1                                                                                                 
          Total number of patients with at least one adverse event   43 (32.1%)    46 (34.3%)      43 (32.6%)  
          Total number of events                                         55            63              64      
          dcd C.1.1.1.3                                              43 (32.1%)    46 (34.3%)      43 (32.6%)  

# script_funs generates a valid script

    Code
      res
    Output
      [1] "Using template:  aet04 \nUsing data:      syn_data \n\nPre args:\n  No mapped argument.\n\nMain args:\n  arm_var       : \"ARM\"\n  lbl_overall   : NULL\n  grade_groups  : NULL\n\nPost args:\n  prune_0  : TRUE\n\n"

# print_list works

    Code
      print_list(alist(a = 1, b = b, c = xx))
    Output
        a  : 1
        b  : b
        c  : xx

# print_list works for empty list

    Code
      print_list(alist())
    Output
        No mapped argument.
      NULL

