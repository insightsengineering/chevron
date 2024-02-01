# run works as expected for chevron_t object

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        MedDRA System Organ Class                                                           
          MedDRA Preferred Term                     A: Drug X    B: Placebo   C: Combination
                                    Grade             (N=15)       (N=15)         (N=15)    
        ————————————————————————————————————————————————————————————————————————————————————
        - Any adverse events -                                                              
                                    - Any Grade -   13 (86.7%)   12 (80.0%)     13 (86.7%)  
                                    Grade 1-2       5 (33.3%)    3 (20.0%)      3 (20.0%)   
                                    1               2 (13.3%)     1 (6.7%)      2 (13.3%)   
                                    2               3 (20.0%)    2 (13.3%)       1 (6.7%)   
                                    Grade 3-4       3 (20.0%)    3 (20.0%)      2 (13.3%)   
                                    3               3 (20.0%)    3 (20.0%)      2 (13.3%)   
                                    Grade 5         5 (33.3%)    6 (40.0%)      8 (53.3%)   
        cl B.2                                                                              
          - Overall -                                                                       
                                    - Any Grade -   11 (73.3%)   8 (53.3%)      10 (66.7%)  
                                    Grade 1-2       6 (40.0%)    2 (13.3%)      5 (33.3%)   
                                    1               6 (40.0%)    2 (13.3%)      5 (33.3%)   
                                    Grade 3-4       5 (33.3%)    6 (40.0%)      5 (33.3%)   
                                    3               5 (33.3%)    6 (40.0%)      5 (33.3%)   
          dcd B.2.2.3.1                                                                     
                                    - Any Grade -   8 (53.3%)    6 (40.0%)      7 (46.7%)   
                                    Grade 1-2       8 (53.3%)    6 (40.0%)      7 (46.7%)   
                                    1               8 (53.3%)    6 (40.0%)      7 (46.7%)   
          dcd B.2.1.2.1                                                                     
                                    - Any Grade -   5 (33.3%)    6 (40.0%)      5 (33.3%)   
                                    Grade 3-4       5 (33.3%)    6 (40.0%)      5 (33.3%)   
                                    3               5 (33.3%)    6 (40.0%)      5 (33.3%)   
        cl A.1                                                                              
          - Overall -                                                                       
                                    - Any Grade -   7 (46.7%)    6 (40.0%)      10 (66.7%)  
                                    Grade 1-2       7 (46.7%)    6 (40.0%)      10 (66.7%)  
                                    1               2 (13.3%)        0          4 (26.7%)   
                                    2               5 (33.3%)    6 (40.0%)      6 (40.0%)   
          dcd A.1.1.1.2                                                                     
                                    - Any Grade -   5 (33.3%)    6 (40.0%)      6 (40.0%)   
                                    Grade 1-2       5 (33.3%)    6 (40.0%)      6 (40.0%)   
                                    2               5 (33.3%)    6 (40.0%)      6 (40.0%)   
          dcd A.1.1.1.1                                                                     
                                    - Any Grade -   3 (20.0%)     1 (6.7%)      6 (40.0%)   
                                    Grade 1-2       3 (20.0%)     1 (6.7%)      6 (40.0%)   
                                    1               3 (20.0%)     1 (6.7%)      6 (40.0%)   
        cl B.1                                                                              
          - Overall -                                                                       
                                    - Any Grade -   5 (33.3%)    6 (40.0%)      8 (53.3%)   
                                    Grade 5         5 (33.3%)    6 (40.0%)      8 (53.3%)   
          dcd B.1.1.1.1                                                                     
                                    - Any Grade -   5 (33.3%)    6 (40.0%)      8 (53.3%)   
                                    Grade 5         5 (33.3%)    6 (40.0%)      8 (53.3%)   

# run works as expected for chevron_t object when auto_pre = FALSE

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                             A: Drug X    B: Placebo   C: Combination   All Patients
                                               (N=15)       (N=15)         (N=15)          (N=45)   
        ————————————————————————————————————————————————————————————————————————————————————————————
        Age (yr)                                                                                    
          n                                      15           15             15              45     
          Mean (SD)                          31.3 (5.3)   35.1 (9.0)     36.6 (6.4)      34.3 (7.3) 
          Median                                31.0         35.0           35.0            34.0    
          Min - Max                           24 - 40      24 - 57        24 - 49         24 - 57   
        Age Group                                                                                   
          n                                      15           15             15              45     
          <65                                15 (100%)    15 (100%)      15 (100%)       45 (100%)  
        Sex                                                                                         
          n                                      15           15             15              45     
          F                                  12 (80.0%)   8 (53.3%)      10 (66.7%)      30 (66.7%) 
          M                                  3 (20.0%)    7 (46.7%)      5 (33.3%)       15 (33.3%) 
        Ethnicity                                                                                   
          n                                      15           15             15              45     
          NOT REPORTED                           0            0          2 (13.3%)        2 (4.4%)  
          HISPANIC OR LATINO                 2 (13.3%)        0              0            2 (4.4%)  
          NOT HISPANIC OR LATINO             13 (86.7%)   15 (100%)      13 (86.7%)      41 (91.1%) 
        RACE                                                                                        
          n                                      15           15             15              45     
          AMERICAN INDIAN OR ALASKA NATIVE       0        2 (13.3%)       1 (6.7%)        3 (6.7%)  
          ASIAN                              8 (53.3%)    10 (66.7%)     8 (53.3%)       26 (57.8%) 
          BLACK OR AFRICAN AMERICAN          4 (26.7%)     1 (6.7%)      4 (26.7%)       9 (20.0%)  
          WHITE                              3 (20.0%)    2 (13.3%)      2 (13.3%)       7 (15.6%)  

# run works as expected with argument printed

    Code
      cat(res)
    Output
      Using template:  aet02 
      Using data:      syn_adv 
      
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
        MedDRA System Organ Class                                    A: Drug X    B: Placebo   C: Combination
          MedDRA Preferred Term                                        (N=15)       (N=15)         (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one adverse event     13 (86.7%)   12 (80.0%)     13 (86.7%)  
        Overall total number of events                                   32           32             48      
        cl B.2                                                                                               
          Total number of patients with at least one adverse event   11 (73.3%)   8 (53.3%)      10 (66.7%)  
          Total number of events                                         18           15             20      
          dcd B.2.2.3.1                                              8 (53.3%)    6 (40.0%)      7 (46.7%)   
          dcd B.2.1.2.1                                              5 (33.3%)    6 (40.0%)      5 (33.3%)   
        cl A.1                                                                                               
          Total number of patients with at least one adverse event   7 (46.7%)    6 (40.0%)      10 (66.7%)  
          Total number of events                                         8            11             16      
          dcd A.1.1.1.2                                              5 (33.3%)    6 (40.0%)      6 (40.0%)   
          dcd A.1.1.1.1                                              3 (20.0%)     1 (6.7%)      6 (40.0%)   
        cl B.1                                                                                               
          Total number of patients with at least one adverse event   5 (33.3%)    6 (40.0%)      8 (53.3%)   
          Total number of events                                         6            6              12      
          dcd B.1.1.1.1                                              5 (33.3%)    6 (40.0%)      8 (53.3%)   

# run works as expected with argument printed if the user argument is complicated

    Code
      cat(res)
    Output
      Using template:  aet02 
      Using data:      syn_adv 
      
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
        High Level Term                                              A: Drug X    B: Placebo   C: Combination
          MedDRA Preferred Term                                        (N=15)       (N=15)         (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one adverse event     13 (86.7%)   12 (80.0%)     13 (86.7%)  
        Overall total number of events                                   32           32             48      
        hlt A.1.1.1                                                                                          
          Total number of patients with at least one adverse event   7 (46.7%)    6 (40.0%)      10 (66.7%)  
          Total number of events                                         8            11             16      
          dcd A.1.1.1.2                                              5 (33.3%)    6 (40.0%)      6 (40.0%)   
          dcd A.1.1.1.1                                              3 (20.0%)     1 (6.7%)      6 (40.0%)   
        hlt B.2.2.3                                                                                          
          Total number of patients with at least one adverse event   8 (53.3%)    6 (40.0%)      7 (46.7%)   
          Total number of events                                         9            7              13      
          dcd B.2.2.3.1                                              8 (53.3%)    6 (40.0%)      7 (46.7%)   
        hlt B.1.1.1                                                                                          
          Total number of patients with at least one adverse event   5 (33.3%)    6 (40.0%)      8 (53.3%)   
          Total number of events                                         6            6              12      
          dcd B.1.1.1.1                                              5 (33.3%)    6 (40.0%)      8 (53.3%)   
        hlt B.2.1.2                                                                                          
          Total number of patients with at least one adverse event   5 (33.3%)    6 (40.0%)      5 (33.3%)   
          Total number of events                                         9            8              7       
          dcd B.2.1.2.1                                              5 (33.3%)    6 (40.0%)      5 (33.3%)   
      \s\n  High Level Term                                              All Patients
          MedDRA Preferred Term                                         (N=45)   
        —————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one adverse event      38 (84.4%) 
        Overall total number of events                                   112     
        hlt A.1.1.1                                                              
          Total number of patients with at least one adverse event    23 (51.1%) 
          Total number of events                                          35     
          dcd A.1.1.1.2                                               17 (37.8%) 
          dcd A.1.1.1.1                                               10 (22.2%) 
        hlt B.2.2.3                                                              
          Total number of patients with at least one adverse event    21 (46.7%) 
          Total number of events                                          29     
          dcd B.2.2.3.1                                               21 (46.7%) 
        hlt B.1.1.1                                                              
          Total number of patients with at least one adverse event    19 (42.2%) 
          Total number of events                                          24     
          dcd B.1.1.1.1                                               19 (42.2%) 
        hlt B.2.1.2                                                              
          Total number of patients with at least one adverse event    16 (35.6%) 
          Total number of events                                          24     
          dcd B.2.1.2.1                                               16 (35.6%) 

# run uses the argument passed through the ellipsis in priority

    Code
      cat(res)
    Output
      Using template:  aet02 
      Using data:      syn_adv 
      
      Pre args:
        row_split_var  : "AEHLT"
      
      Main args:
        arm_var         : "ARM"
        row_split_var   : "AEHLT"
        lbl_overall     : "All Patients"
        summary_labels  : list(all = aet02_label, TOTAL = c(nonunique = "Overall total number of events"))
      
      Post args:
        row_split_var  : "AEHLT"
        prune_0        : FALSE
      
      Additional args:
        another_not_used  : iris
        not_used          : structure(list(Sepal.Length = c(5.1, 4.9, 4.7, 4.6, 5, 5.4, 4.6, 
                          5, 4.4, 4.9, 5.4, 4.8, 4.8, 4.3, 5.8, 5.7, 5.4, 5.1, 5.7, 5.1, 
                          5.4, 5.1, 4.6, 5.1, 4.8, 5, 5, 5.2, 5.2, 4.7, 4.8, 5.4, 5.2, 
                          5.5, 4.9, 5, 5.5, 4.9, 4.4, 5.1, 5, 4.5, 4.4, 5, 5.1, 4.8, 5.1, 
                          ... (print of class <data.frame> truncated)
      

---

    Code
      cat(export_as_txt(tbl, lpp = 100))
    Output
        High Level Term                                              A: Drug X    B: Placebo   C: Combination
          MedDRA Preferred Term                                        (N=15)       (N=15)         (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one adverse event     13 (86.7%)   12 (80.0%)     13 (86.7%)  
        Overall total number of events                                   32           32             48      
        hlt A.1.1.1                                                                                          
          Total number of patients with at least one adverse event   7 (46.7%)    6 (40.0%)      10 (66.7%)  
          Total number of events                                         8            11             16      
          dcd A.1.1.1.2                                              5 (33.3%)    6 (40.0%)      6 (40.0%)   
          dcd A.1.1.1.1                                              3 (20.0%)     1 (6.7%)      6 (40.0%)   
        hlt B.2.2.3                                                                                          
          Total number of patients with at least one adverse event   8 (53.3%)    6 (40.0%)      7 (46.7%)   
          Total number of events                                         9            7              13      
          dcd B.2.2.3.1                                              8 (53.3%)    6 (40.0%)      7 (46.7%)   
        hlt B.1.1.1                                                                                          
          Total number of patients with at least one adverse event   5 (33.3%)    6 (40.0%)      8 (53.3%)   
          Total number of events                                         6            6              12      
          dcd B.1.1.1.1                                              5 (33.3%)    6 (40.0%)      8 (53.3%)   
        hlt B.2.1.2                                                                                          
          Total number of patients with at least one adverse event   5 (33.3%)    6 (40.0%)      5 (33.3%)   
          Total number of events                                         9            8              7       
          dcd B.2.1.2.1                                              5 (33.3%)    6 (40.0%)      5 (33.3%)   
      \s\n  High Level Term                                              All Patients
          MedDRA Preferred Term                                         (N=45)   
        —————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one adverse event      38 (84.4%) 
        Overall total number of events                                   112     
        hlt A.1.1.1                                                              
          Total number of patients with at least one adverse event    23 (51.1%) 
          Total number of events                                          35     
          dcd A.1.1.1.2                                               17 (37.8%) 
          dcd A.1.1.1.1                                               10 (22.2%) 
        hlt B.2.2.3                                                              
          Total number of patients with at least one adverse event    21 (46.7%) 
          Total number of events                                          29     
          dcd B.2.2.3.1                                               21 (46.7%) 
        hlt B.1.1.1                                                              
          Total number of patients with at least one adverse event    19 (42.2%) 
          Total number of events                                          24     
          dcd B.1.1.1.1                                               19 (42.2%) 
        hlt B.2.1.2                                                              
          Total number of patients with at least one adverse event    16 (35.6%) 
          Total number of events                                          24     
          dcd B.2.1.2.1                                               16 (35.6%) 

# run works as expected with partial match argument

    Code
      cat(res)
    Output
      Using template:  aet02 
      Using data:      syn_adv 
      
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
        MedDRA System Organ Class                                    A: Drug X    B: Placebo   C: Combination
          MedDRA Preferred Term                                        (N=15)       (N=15)         (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one adverse event     13 (86.7%)   12 (80.0%)     13 (86.7%)  
        Overall total number of events                                   32           32             48      
        cl B.2                                                                                               
          Total number of patients with at least one adverse event   11 (73.3%)   8 (53.3%)      10 (66.7%)  
          Total number of events                                         18           15             20      
          dcd B.2.2.3.1                                              8 (53.3%)    6 (40.0%)      7 (46.7%)   
          dcd B.2.1.2.1                                              5 (33.3%)    6 (40.0%)      5 (33.3%)   
        cl A.1                                                                                               
          Total number of patients with at least one adverse event   7 (46.7%)    6 (40.0%)      10 (66.7%)  
          Total number of events                                         8            11             16      
          dcd A.1.1.1.2                                              5 (33.3%)    6 (40.0%)      6 (40.0%)   
          dcd A.1.1.1.1                                              3 (20.0%)     1 (6.7%)      6 (40.0%)   
        cl B.1                                                                                               
          Total number of patients with at least one adverse event   5 (33.3%)    6 (40.0%)      8 (53.3%)   
          Total number of events                                         6            6              12      
          dcd B.1.1.1.1                                              5 (33.3%)    6 (40.0%)      8 (53.3%)   

# run displays the symbols when available

    Code
      cat(res)
    Output
      Using template:  aet02 
      Using data:      syn_adv 
      
      Pre args:
        row_split_var  : "AEHLT"
      
      Main args:
        arm_var         : arm_param
        row_split_var   : "AEHLT"
        lbl_overall     : "All Patients"
        summary_labels  : list(all = aet02_label, TOTAL = c(nonunique = "Overall total number of events"))
      
      Post args:
        row_split_var  : "AEHLT"
        prune_0        : FALSE
      
      Additional args:
        not_used          : iris
        another_not_used  : "X"
      

---

    Code
      cat(export_as_txt(tbl, lpp = 100))
    Output
        High Level Term                                              A: Drug X    B: Placebo   C: Combination
          MedDRA Preferred Term                                        (N=15)       (N=15)         (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one adverse event     13 (86.7%)   12 (80.0%)     13 (86.7%)  
        Overall total number of events                                   32           32             48      
        hlt A.1.1.1                                                                                          
          Total number of patients with at least one adverse event   7 (46.7%)    6 (40.0%)      10 (66.7%)  
          Total number of events                                         8            11             16      
          dcd A.1.1.1.2                                              5 (33.3%)    6 (40.0%)      6 (40.0%)   
          dcd A.1.1.1.1                                              3 (20.0%)     1 (6.7%)      6 (40.0%)   
        hlt B.2.2.3                                                                                          
          Total number of patients with at least one adverse event   8 (53.3%)    6 (40.0%)      7 (46.7%)   
          Total number of events                                         9            7              13      
          dcd B.2.2.3.1                                              8 (53.3%)    6 (40.0%)      7 (46.7%)   
        hlt B.1.1.1                                                                                          
          Total number of patients with at least one adverse event   5 (33.3%)    6 (40.0%)      8 (53.3%)   
          Total number of events                                         6            6              12      
          dcd B.1.1.1.1                                              5 (33.3%)    6 (40.0%)      8 (53.3%)   
        hlt B.2.1.2                                                                                          
          Total number of patients with at least one adverse event   5 (33.3%)    6 (40.0%)      5 (33.3%)   
          Total number of events                                         9            8              7       
          dcd B.2.1.2.1                                              5 (33.3%)    6 (40.0%)      5 (33.3%)   
      \s\n  High Level Term                                              All Patients
          MedDRA Preferred Term                                         (N=45)   
        —————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one adverse event      38 (84.4%) 
        Overall total number of events                                   112     
        hlt A.1.1.1                                                              
          Total number of patients with at least one adverse event    23 (51.1%) 
          Total number of events                                          35     
          dcd A.1.1.1.2                                               17 (37.8%) 
          dcd A.1.1.1.1                                               10 (22.2%) 
        hlt B.2.2.3                                                              
          Total number of patients with at least one adverse event    21 (46.7%) 
          Total number of events                                          29     
          dcd B.2.2.3.1                                               21 (46.7%) 
        hlt B.1.1.1                                                              
          Total number of patients with at least one adverse event    19 (42.2%) 
          Total number of events                                          24     
          dcd B.1.1.1.1                                               19 (42.2%) 
        hlt B.2.1.2                                                              
          Total number of patients with at least one adverse event    16 (35.6%) 
          Total number of events                                          24     
          dcd B.2.1.2.1                                               16 (35.6%) 

# script_funs generates a valid script

    Code
      res
    Output
      [1] "Using template:  aet04 \nUsing data:      syn_adv \n\nPre args:\n  No mapped argument.\n\nMain args:\n  arm_var       : \"ARM\"\n  lbl_overall   : NULL\n  grade_groups  : NULL\n\nPost args:\n  prune_0  : TRUE\n\n"

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

