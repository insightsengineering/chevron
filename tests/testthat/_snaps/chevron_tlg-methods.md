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
          HISPANIC OR LATINO                 2 (13.3%)        0              0            2 (4.4%)  
          NOT HISPANIC OR LATINO             13 (86.7%)   15 (100%)      13 (86.7%)      41 (91.1%) 
          NOT REPORTED                           0            0          2 (13.3%)        2 (4.4%)  
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
        Body System                                                  A: Drug X    B: Placebo   C: Combination
          Dictionary-Derived Term                                      (N=15)       (N=15)         (N=15)    
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
          Dictionary-Derived Term                                      (N=15)       (N=15)         (N=15)    
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
          Dictionary-Derived Term                                       (N=45)   
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
          Dictionary-Derived Term                                      (N=15)       (N=15)         (N=15)    
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
          Dictionary-Derived Term                                       (N=45)   
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
        Body System                                                  A: Drug X    B: Placebo   C: Combination
          Dictionary-Derived Term                                      (N=15)       (N=15)         (N=15)    
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
          Dictionary-Derived Term                                      (N=15)       (N=15)         (N=15)    
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
          Dictionary-Derived Term                                       (N=45)   
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

# run print internal functions when unwrap is TRUE

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
      
      
      Preprocessing function:
      function (adam_db, row_split_var = "AEBODSYS", ...) 
      {
          adam_db$adae <- adam_db$adae %>% filter(.data$ANL01FL == 
              "Y") %>% mutate(AEDECOD = with_label(reformat(.data$AEDECOD, 
              nocoding), "Dictionary-Derived Term")) %>% mutate(across(all_of(row_split_var), 
              ~reformat(.x, nocoding))) %>% mutate(AEBODSYS = with_label(.data$AEBODSYS, 
              "Body System"))
          adam_db
      } 
      
      Main function:
      function (adam_db, arm_var = "ACTARM", row_split_var = "AEBODSYS", 
          lbl_overall = NULL, summary_labels = list(all = aet02_label, 
              TOTAL = c(nonunique = "Overall total number of events")), 
          ...) 
      {
          assert_all_tablenames(adam_db, "adsl", "adae")
          assert_string(arm_var)
          assert_character(row_split_var, null.ok = TRUE)
          assert_string(lbl_overall, null.ok = TRUE)
          assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var), 
              types = list(c("character", "factor")))
          assert_valid_variable(adam_db$adae, c(arm_var, row_split_var, 
              "AEDECOD"), types = list(c("character", "factor")))
          assert_valid_variable(adam_db$adae, "USUBJID", empty_ok = TRUE, 
              types = list(c("character", "factor")))
          assert_valid_var_pair(adam_db$adsl, adam_db$adae, arm_var)
          assert_list(summary_labels, null.ok = TRUE)
          assert_subset(names(summary_labels), c("all", "TOTAL", row_split_var))
          assert_subset(unique(unlist(lapply(summary_labels, names))), 
              c("unique", "nonunique", "unique_count"))
          summary_labels <- expand_list(summary_labels, c("TOTAL", 
              row_split_var))
          lbl_overall <- render_safe(lbl_overall)
          lbl_row_split <- var_labels_for(adam_db$adae, row_split_var)
          lbl_aedecod <- var_labels_for(adam_db$adae, "AEDECOD")
          lyt <- occurrence_lyt(arm_var = arm_var, lbl_overall = lbl_overall, 
              row_split_var = row_split_var, lbl_row_split = lbl_row_split, 
              medname_var = "AEDECOD", lbl_medname_var = lbl_aedecod, 
              summary_labels = summary_labels, count_by = NULL)
          tbl <- build_table(lyt, adam_db$adae, alt_counts_df = adam_db$adsl)
          tbl
      } 
      
      Layout function:
        occurrence_lyt:
      function (arm_var, lbl_overall, row_split_var, lbl_row_split, 
          medname_var, lbl_medname_var, summary_labels, count_by) 
      {
          split_indent <- vapply(c("TOTAL", row_split_var), function(x) {
              if (length(summary_labels[[x]]) > 0L) 
                  -1L
              else 0L
          }, FUN.VALUE = 0L)
          split_indent[1L] <- 0L
          lyt <- basic_table(show_colcounts = TRUE) %>% split_cols_by_with_overall(arm_var, 
              lbl_overall)
          if (length(summary_labels$TOTAL) > 0) {
              lyt <- lyt %>% analyze_num_patients(vars = "USUBJID", 
                  count_by = count_by, .stats = names(summary_labels$TOTAL), 
                  show_labels = "hidden", .labels = render_safe(summary_labels$TOTAL))
          }
          section_divs <- get_section_div()
          for (k in seq_len(length(row_split_var))) {
              lyt <- split_and_summ_num_patients(lyt = lyt, count_by = count_by, 
                  var = row_split_var[k], label = lbl_row_split[k], 
                  split_indent = split_indent[k], stats = names(summary_labels[[row_split_var[k]]]), 
                  summarize_labels = render_safe(summary_labels[[row_split_var[k]]]), 
                  section_div = section_divs[k])
          }
          lyt %>% count_occurrences(vars = medname_var, drop = length(row_split_var) > 
              0, .indent_mods = unname(tail(split_indent, 1L))) %>% 
              append_topleft(paste0(stringr::str_dup(" ", 2 * length(row_split_var)), 
                  lbl_medname_var))
      }
      Postprocessing function:
      function (tlg, row_split_var = "AEBODSYS", prune_0 = TRUE, ...) 
      {
          tlg <- tlg %>% tlg_sort_by_vars(row_split_var, cont_n_allcols) %>% 
              valid_sort_at_path(path = c(get_sort_path(c(row_split_var, 
                  "AEDECOD"))), scorefun = score_occurrences)
          if (prune_0) {
              tlg <- smart_prune(tlg)
          }
          std_postprocessing(tlg)
      } 

# run print internal functions when unwrap is TRUE and standard chevron_tlg has no layout

    Code
      cat(res)
    Output
      Using template:  mng01 
      Using data:      syn_data 
      
      Pre args:
        dataset  : "adlb"
        x_var    : "AVISIT"
      
      Main args:
        dataset       : "adlb"
        x_var         : "AVISIT"
        y_var         : "AVAL"
        y_name        : "PARAM"
        y_unit        : NULL
        arm_var       : "ACTARM"
        center_fun    : "mean"
        interval_fun  : "mean_ci"
        jitter        : 0.3
        line_col      : nestcolor::color_palette()
        line_type     : NULL
        ggtheme       : gg_theme_chevron()
        table         : c("n", center_fun, interval_fun)
      
      Post args:
        No mapped argument.
      
      
      Preprocessing function:
      function (adam_db, dataset, x_var = "AVISIT", ...) 
      {
          assert_character(dataset)
          dunlin::assert_all_tablenames(adam_db, dataset)
          adam_db[[dataset]] <- adam_db[[dataset]] %>% filter(.data$ANL01FL == 
              "Y") %>% mutate(AVISIT = reorder(.data$AVISIT, .data$AVISITN), 
              AVISIT = with_label(.data$AVISIT, "Visit"))
          if (length(x_var) == 1 && is.numeric(adam_db[[dataset]][[x_var]])) {
              adam_db
          }
          else {
              dunlin::ls_unite(adam_db, dataset, cols = x_var, sep = "_")
          }
      } 
      
      Main function:
      function (adam_db, dataset = "adlb", x_var = "AVISIT", y_var = "AVAL", 
          y_name = "PARAM", y_unit = NULL, arm_var = "ACTARM", center_fun = "mean", 
          interval_fun = "mean_ci", jitter = 0.3, line_col = nestcolor::color_palette(), 
          line_type = NULL, ggtheme = gg_theme_chevron(), table = c("n", 
              center_fun, interval_fun), ...) 
      {
          center_fun_choice <- c("mean", "median")
          interval_fun_choice <- c("mean_ci", "mean_sei", "mean_sdi", 
              "median_ci", "quantiles", "range")
          assert_all_tablenames(adam_db, c(dataset, "adsl"))
          assert_character(x_var)
          assert_string(y_var)
          assert_string(y_name)
          assert_string(y_unit, null.ok = TRUE)
          assert_string(arm_var)
          assert_string(center_fun)
          assert_string(interval_fun, null.ok = TRUE)
          assert_names(center_fun, subset.of = center_fun_choice)
          assert_choice(interval_fun, interval_fun_choice, null.ok = TRUE)
          assert_number(jitter, lower = 0, upper = 1)
          assert_class(ggtheme, "theme")
          assert_character(line_col, null.ok = TRUE)
          assert_character(line_type, null.ok = TRUE)
          assert_valid_variable(adam_db[[dataset]], x_var)
          assert_valid_variable(adam_db[[dataset]], y_var, types = list(c("numeric")))
          assert_valid_variable(adam_db[[dataset]], y_unit, types = list(c("character", 
              "factor")))
          assert_valid_variable(adam_db[[dataset]], arm_var, types = list(c("character", 
              "factor")), na_ok = FALSE)
          assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var), 
              types = list(c("character", "factor")))
          assert_valid_variable(adam_db[[dataset]], "USUBJID", types = list(c("character", 
              "factor")), empty_ok = TRUE)
          assert_valid_var_pair(adam_db$adsl, adam_db[[dataset]], arm_var)
          assert_subset(table, c("n", center_fun_choice, interval_fun_choice))
          df <- adam_db[[dataset]]
          data_ls <- split(df, df$PARAM, drop = TRUE)
          x_var <- paste(x_var, collapse = "_")
          whiskers_fun <- if (is.null(interval_fun)) {
              NULL
          }
          else {
              switch(interval_fun, mean_ci = c("mean_ci_lwr", "mean_ci_upr"), 
                  mean_sei = c("mean_sei_lwr", "mean_sei_upr"), mean_sdi = c("mean_sdi_lwr", 
                      "mean_sdi_upr"), median_ci = c("median_ci_lwr", 
                      "median_ci_upr"), quantiles = c("quantiles_0.25", 
                      "quantile_0.75"), range = c("min", "max"))
          }
          y_unit <- if (is.null(y_unit)) 
              NA
          else y_unit
          variables <- tern::control_lineplot_vars(x = x_var, y = y_var, 
              group_var = arm_var, paramcd = y_name, y_unit = y_unit, 
              subject_var = "USUBJID")
          arm_lvl <- sort(unique(df[[arm_var]]))
          col <- if (!is.null(names(line_col))) {
              col_sel <- line_col[as.character(arm_lvl)]
              if (anyNA(col_sel)) {
                  missing_col <- setdiff(arm_lvl, names(col_sel))
                  stop(paste("Missing color matching for", toString(missing_col)))
              }
              unname(col_sel)
          }
          else {
              line_col
          }
          line_type <- if (!is.null(names(line_type))) {
              tp <- line_type[as.character(arm_lvl)]
              if (anyNA(tp)) {
                  missing_tp <- setdiff(arm_lvl, names(tp))
                  stop(paste("Missing line type matching for", toString(missing_tp)))
              }
              unname(tp)
          }
          else {
              line_type
          }
          lapply(data_ls, tern::g_lineplot, alt_counts_df = adam_db[["adsl"]], 
              variables = variables, mid = center_fun, interval = interval_fun, 
              whiskers = whiskers_fun, position = ggplot2::position_dodge(width = jitter), 
              title = NULL, table = table, ggtheme = ggtheme, col = col, 
              linetype = line_type, subtitle_add_unit = !is.na(y_unit), 
              ...)
      } 
      
      
      Postprocessing function:
      function (tlg, ...) 
      {
          tlg <- report_null(tlg, ...)
          tlg
      } 

# run print internal functions when unwrap is TRUE and the chevron_tlg object is customized

    Code
      cat(res)
    Output
      Using template:  custom_chevron 
      Using data:      object of class call 
      
      Pre args:
        No mapped argument.
      
      Main args:
        No mapped argument.
      
      Post args:
        No mapped argument.
      
      
      Preprocessing function:
      function (adam_db, ...) 
      adam_db 
      
      Main function:
      function (adam_db, ...) 
      {
          ggplot2::ggplot(adam_db$iris, ggplot2::aes(x = Sepal.Length, 
              y = Sepal.Width)) + ggplot2::geom_point()
      } 
      
      
      Postprocessing function:
      function (tlg, ...) 
      {
          tlg <- report_null(tlg, ...)
          tlg
      } 

# run print main and postprocessing functions when unwrap is TRUE and auto_pre is FALSE

    Code
      cat(res)
    Output
      Main function:
      function (adam_db, ...) 
      {
          ggplot2::ggplot(adam_db$iris, ggplot2::aes(x = Sepal.Length, 
              y = Sepal.Width)) + ggplot2::geom_point()
      } 
      
      
      Postprocessing function:
      function (tlg, ...) 
      {
          tlg <- report_null(tlg, ...)
          tlg
      } 

# script_funs generates a valid script

    Code
      cat(paste(res, collapse = "\n"))
    Output
      Using template:  aet04 
      Using data:      syn_adv 
      
      Pre args:
        No mapped argument.
      
      Main args:
        arm_var       : "ARM"
        lbl_overall   : NULL
        grade_groups  : NULL
      
      Post args:
        prune_0  : TRUE
      
      
      Preprocessing function:
      function (adam_db, ...) 
      {
          atoxgr_lvls <- c("1", "2", "3", "4", "5")
          adam_db$adae <- adam_db$adae %>% filter(.data$ANL01FL == 
              "Y") %>% mutate(AEBODSYS = reformat(.data$AEBODSYS, nocoding), 
              AEDECOD = reformat(.data$AEDECOD, nocoding), ATOXGR = factor(.data$ATOXGR, 
                  levels = atoxgr_lvls))
          adam_db
      } 
      
      Main function:
      function (adam_db, arm_var = "ACTARM", lbl_overall = NULL, grade_groups = NULL, 
          ...) 
      {
          assert_all_tablenames(adam_db, "adsl", "adae")
          assert_string(arm_var)
          assert_string(lbl_overall, null.ok = TRUE)
          assert_list(grade_groups, types = "character", null.ok = TRUE)
          assert_valid_variable(adam_db$adsl, c("USUBJID", arm_var), 
              types = list(c("character", "factor")))
          assert_valid_variable(adam_db$adae, c(arm_var, "AEBODSYS", 
              "AEDECOD"), types = list(c("character", "factor")))
          assert_valid_variable(adam_db$adae, "USUBJID", empty_ok = TRUE, 
              types = list(c("character", "factor")))
          assert_valid_variable(adam_db$adae, "ATOXGR", na_ok = TRUE, 
              types = list("factor"))
          assert_valid_var_pair(adam_db$adsl, adam_db$adae, arm_var)
          lbl_overall <- render_safe(lbl_overall)
          lbl_aebodsys <- var_labels_for(adam_db$adae, "AEBODSYS")
          lbl_aedecod <- var_labels_for(adam_db$adae, "AEDECOD")
          if (is.null(grade_groups)) {
              grade_groups <- list(`Grade 1-2` = c("1", "2"), `Grade 3-4` = c("3", 
                  "4"), `Grade 5` = c("5"))
          }
          lyt <- aet04_lyt(arm_var = arm_var, total_var = "TOTAL_VAR", 
              lbl_overall = lbl_overall, lbl_aebodsys = lbl_aebodsys, 
              lbl_aedecod = lbl_aedecod, grade_groups = grade_groups)
          adam_db$adae$TOTAL_VAR <- "- Any adverse events - "
          tbl <- build_table(lyt, df = adam_db$adae, alt_counts_df = adam_db$adsl)
          tbl
      } 
      
      Layout function:
        aet04_lyt:
      function (arm_var, total_var, lbl_overall, lbl_aebodsys, lbl_aedecod, 
          grade_groups) 
      {
          basic_table(show_colcounts = TRUE) %>% split_cols_by_with_overall(arm_var, 
              lbl_overall) %>% split_rows_by(var = total_var, label_pos = "hidden", 
              child_labels = "visible", indent_mod = -1L) %>% summarize_num_patients(var = "USUBJID", 
              .stats = "unique", .labels = "- Any Grade -", .indent_mods = 7L) %>% 
              count_occurrences_by_grade(var = "ATOXGR", grade_groups = grade_groups, 
                  .indent_mods = 6L) %>% split_rows_by("AEBODSYS", 
              child_labels = "visible", nested = FALSE, split_fun = drop_split_levels, 
              label_pos = "topleft", split_label = lbl_aebodsys) %>% 
              split_rows_by("AEDECOD", child_labels = "visible", split_fun = add_overall_level("- Overall -", 
                  trim = TRUE), label_pos = "topleft", split_label = lbl_aedecod) %>% 
              summarize_num_patients(var = "USUBJID", .stats = "unique", 
                  .labels = "- Any Grade -", .indent_mods = 6L) %>% 
              count_occurrences_by_grade(var = "ATOXGR", grade_groups = grade_groups, 
                  .indent_mods = 5L) %>% append_topleft("                            Grade")
      }
      Postprocessing function:
      function (tlg, prune_0 = TRUE, ...) 
      {
          tlg <- tlg %>% tlg_sort_by_vars(c("AEBODSYS", "AEDECOD"), 
              score_all_sum, decreasing = TRUE)
          if (prune_0) 
              tlg <- trim_rows(tlg)
          std_postprocessing(tlg)
      } 

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

