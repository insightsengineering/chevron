# cmt01a functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        ATC Level 2 Text                                         A: Drug X    B: Placebo   C: Combination
          Other Treatment                                          (N=15)       (N=15)         (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one treatment     13 (86.7%)   14 (93.3%)     15 (100%)   
        Total number of treatments                                   58           59             99      
        ATCCLAS2 A                                                                                       
          Total number of patients with at least one treatment   10 (66.7%)   11 (73.3%)     12 (80.0%)  
          Total number of treatments                                 15           21             28      
          medname A_3/3                                          5 (33.3%)    8 (53.3%)      6 (40.0%)   
          medname A_2/3                                          5 (33.3%)    6 (40.0%)      7 (46.7%)   
          medname A_1/3                                          4 (26.7%)    3 (20.0%)      8 (53.3%)   
        ATCCLAS2 A p2                                                                                    
          Total number of patients with at least one treatment   5 (33.3%)    8 (53.3%)      6 (40.0%)   
          Total number of treatments                                 6            8              8       
          medname A_3/3                                          5 (33.3%)    8 (53.3%)      6 (40.0%)   
        ATCCLAS2 B                                                                                       
          Total number of patients with at least one treatment   12 (80.0%)   10 (66.7%)     14 (93.3%)  
          Total number of treatments                                 30           30             52      
          medname B_3/4                                          8 (53.3%)    6 (40.0%)      8 (53.3%)   
          medname B_2/4                                          6 (40.0%)    5 (33.3%)      10 (66.7%)  
          medname B_1/4                                          7 (46.7%)    6 (40.0%)      6 (40.0%)   
          medname B_4/4                                          4 (26.7%)    5 (33.3%)      8 (53.3%)   
        ATCCLAS2 B p2                                                                                    
          Total number of patients with at least one treatment   10 (66.7%)   8 (53.3%)      12 (80.0%)  
          Total number of treatments                                 18           17             25      
          medname B_2/4                                          6 (40.0%)    5 (33.3%)      10 (66.7%)  
          medname B_1/4                                          7 (46.7%)    6 (40.0%)      6 (40.0%)   
        ATCCLAS2 B p3                                                                                    
          Total number of patients with at least one treatment   10 (66.7%)   8 (53.3%)      12 (80.0%)  
          Total number of treatments                                 18           17             25      
          medname B_2/4                                          6 (40.0%)    5 (33.3%)      10 (66.7%)  
          medname B_1/4                                          7 (46.7%)    6 (40.0%)      6 (40.0%)   
        ATCCLAS2 C                                                                                       
          Total number of patients with at least one treatment   9 (60.0%)    7 (46.7%)      12 (80.0%)  
          Total number of treatments                                 13           8              19      
          medname C_2/2                                          4 (26.7%)    5 (33.3%)      7 (46.7%)   
          medname C_1/2                                          6 (40.0%)    2 (13.3%)      6 (40.0%)   
        ATCCLAS2 C p2                                                                                    
          Total number of patients with at least one treatment   9 (60.0%)    7 (46.7%)      12 (80.0%)  
          Total number of treatments                                 13           8              19      
          medname C_2/2                                          4 (26.7%)    5 (33.3%)      7 (46.7%)   
          medname C_1/2                                          6 (40.0%)    2 (13.3%)      6 (40.0%)   
        ATCCLAS2 C p3                                                                                    
          Total number of patients with at least one treatment   4 (26.7%)    5 (33.3%)      7 (46.7%)   
          Total number of treatments                                 5            5              12      
          medname C_2/2                                          4 (26.7%)    5 (33.3%)      7 (46.7%)   

# cmt01a functions with custom argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        ATC Level 2 Text                                         A: Drug X    B: Placebo   C: Combination
          Other Treatment                                          (N=15)       (N=15)         (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one treatment     13 (86.7%)   14 (93.3%)     15 (100%)   
        Total number of treatments                                   58           59             99      
        ATCCLAS2 B                                                                                       
          Total number of patients with at least one treatment   12 (80.0%)   10 (66.7%)     14 (93.3%)  
          medname B_3/4                                          8 (53.3%)    6 (40.0%)      8 (53.3%)   
          medname B_2/4                                          6 (40.0%)    5 (33.3%)      10 (66.7%)  
          medname B_1/4                                          7 (46.7%)    6 (40.0%)      6 (40.0%)   
          medname B_4/4                                          4 (26.7%)    5 (33.3%)      8 (53.3%)   
        ATCCLAS2 A                                                                                       
          Total number of patients with at least one treatment   10 (66.7%)   11 (73.3%)     12 (80.0%)  
          medname A_3/3                                          5 (33.3%)    8 (53.3%)      6 (40.0%)   
          medname A_2/3                                          5 (33.3%)    6 (40.0%)      7 (46.7%)   
          medname A_1/3                                          4 (26.7%)    3 (20.0%)      8 (53.3%)   
        ATCCLAS2 B p2                                                                                    
          Total number of patients with at least one treatment   10 (66.7%)   8 (53.3%)      12 (80.0%)  
          medname B_2/4                                          6 (40.0%)    5 (33.3%)      10 (66.7%)  
          medname B_1/4                                          7 (46.7%)    6 (40.0%)      6 (40.0%)   
        ATCCLAS2 B p3                                                                                    
          Total number of patients with at least one treatment   10 (66.7%)   8 (53.3%)      12 (80.0%)  
          medname B_2/4                                          6 (40.0%)    5 (33.3%)      10 (66.7%)  
          medname B_1/4                                          7 (46.7%)    6 (40.0%)      6 (40.0%)   
        ATCCLAS2 C                                                                                       
          Total number of patients with at least one treatment   9 (60.0%)    7 (46.7%)      12 (80.0%)  
          medname C_2/2                                          4 (26.7%)    5 (33.3%)      7 (46.7%)   
          medname C_1/2                                          6 (40.0%)    2 (13.3%)      6 (40.0%)   
        ATCCLAS2 C p2                                                                                    
          Total number of patients with at least one treatment   9 (60.0%)    7 (46.7%)      12 (80.0%)  
          medname C_2/2                                          4 (26.7%)    5 (33.3%)      7 (46.7%)   
          medname C_1/2                                          6 (40.0%)    2 (13.3%)      6 (40.0%)   
        ATCCLAS2 A p2                                                                                    
          Total number of patients with at least one treatment   5 (33.3%)    8 (53.3%)      6 (40.0%)   
          medname A_3/3                                          5 (33.3%)    8 (53.3%)      6 (40.0%)   
        ATCCLAS2 C p3                                                                                    
          Total number of patients with at least one treatment   4 (26.7%)    5 (33.3%)      7 (46.7%)   
          medname C_2/2                                          4 (26.7%)    5 (33.3%)      7 (46.7%)   

# cmt01a can handle all NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        ATC Level 2 Text                                         A: Drug X    B: Placebo   C: Combination
          Other Treatment                                          (N=15)       (N=15)         (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one treatment     13 (86.7%)   14 (93.3%)     15 (100%)   
        Total number of treatments                                   58           59             99      
        No Coding Available                                                                              
          Total number of patients with at least one treatment   13 (86.7%)   14 (93.3%)     15 (100%)   
          Total number of treatments                                 58           59             99      
          No Coding Available                                    13 (86.7%)   14 (93.3%)     15 (100%)   

# cmt01a can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        ATC Level 2 Text                                         A: Drug X    B: Placebo   C: Combination
          Other Treatment                                          (N=15)       (N=15)         (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one treatment     13 (86.7%)   14 (93.3%)     15 (100%)   
        Total number of treatments                                   58           59             99      
        ATCCLAS2 A                                                                                       
          Total number of patients with at least one treatment   10 (66.7%)   11 (73.3%)     12 (80.0%)  
          Total number of treatments                                 15           21             28      
          medname A_3/3                                          5 (33.3%)    8 (53.3%)      6 (40.0%)   
          medname A_2/3                                          5 (33.3%)    6 (40.0%)      7 (46.7%)   
          medname A_1/3                                          4 (26.7%)    3 (20.0%)      8 (53.3%)   
        ATCCLAS2 A p2                                                                                    
          Total number of patients with at least one treatment   5 (33.3%)    8 (53.3%)      6 (40.0%)   
          Total number of treatments                                 6            8              8       
          medname A_3/3                                          5 (33.3%)    8 (53.3%)      6 (40.0%)   
        ATCCLAS2 B                                                                                       
          Total number of patients with at least one treatment   11 (73.3%)   10 (66.7%)     14 (93.3%)  
          Total number of treatments                                 29           30             52      
          medname B_2/4                                          6 (40.0%)    5 (33.3%)      10 (66.7%)  
          medname B_3/4                                          7 (46.7%)    6 (40.0%)      8 (53.3%)   
          medname B_1/4                                          7 (46.7%)    6 (40.0%)      6 (40.0%)   
          medname B_4/4                                          4 (26.7%)    5 (33.3%)      8 (53.3%)   
        ATCCLAS2 B p2                                                                                    
          Total number of patients with at least one treatment   10 (66.7%)   8 (53.3%)      12 (80.0%)  
          Total number of treatments                                 18           17             25      
          medname B_2/4                                          6 (40.0%)    5 (33.3%)      10 (66.7%)  
          medname B_1/4                                          7 (46.7%)    6 (40.0%)      6 (40.0%)   
        ATCCLAS2 B p3                                                                                    
          Total number of patients with at least one treatment   10 (66.7%)   8 (53.3%)      12 (80.0%)  
          Total number of treatments                                 18           17             25      
          medname B_2/4                                          6 (40.0%)    5 (33.3%)      10 (66.7%)  
          medname B_1/4                                          7 (46.7%)    6 (40.0%)      6 (40.0%)   
        ATCCLAS2 C                                                                                       
          Total number of patients with at least one treatment   8 (53.3%)    7 (46.7%)      12 (80.0%)  
          Total number of treatments                                 12           8              19      
          medname C_2/2                                          4 (26.7%)    5 (33.3%)      7 (46.7%)   
          medname C_1/2                                          5 (33.3%)    2 (13.3%)      6 (40.0%)   
        ATCCLAS2 C p2                                                                                    
          Total number of patients with at least one treatment   9 (60.0%)    7 (46.7%)      12 (80.0%)  
          Total number of treatments                                 13           8              19      
          medname C_2/2                                          4 (26.7%)    5 (33.3%)      7 (46.7%)   
          medname C_1/2                                          6 (40.0%)    2 (13.3%)      6 (40.0%)   
        ATCCLAS2 C p3                                                                                    
          Total number of patients with at least one treatment   4 (26.7%)    5 (33.3%)      7 (46.7%)   
          Total number of treatments                                 5            5              12      
          medname C_2/2                                          4 (26.7%)    5 (33.3%)      7 (46.7%)   
        No Coding Available                                                                              
          Total number of patients with at least one treatment    1 (6.7%)        0              0       
          Total number of treatments                                 2            0              0       
          No Coding Available                                     1 (6.7%)        0              0       

