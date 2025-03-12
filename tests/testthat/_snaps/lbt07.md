# lbt07 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Parameter                                                                          
          Direction of Abnormality                 A: Drug X    B: Placebo   C: Combination
                    Highest NCI CTCAE Grade          (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement (n)       15           15             15      
          LOW                                                                              
                    1                              3 (20.0%)        0              0       
                    2                              2 (13.3%)     1 (6.7%)       1 (6.7%)   
                    3                               1 (6.7%)     1 (6.7%)      6 (40.0%)   
                    4                              3 (20.0%)    2 (13.3%)      3 (20.0%)   
                    Any                            9 (60.0%)    4 (26.7%)      10 (66.7%)  
          HIGH                                                                             
                    Any                                0            0              0       
        C-Reactive Protein Measurement (n)             15           15             15      
          LOW                                                                              
                    1                              2 (13.3%)     1 (6.7%)      2 (13.3%)   
                    2                              5 (33.3%)    2 (13.3%)      5 (33.3%)   
                    3                              3 (20.0%)    4 (26.7%)      3 (20.0%)   
                    4                                  0         1 (6.7%)          0       
                    Any                            10 (66.7%)   8 (53.3%)      10 (66.7%)  
          HIGH                                                                             
                    1                              3 (20.0%)     1 (6.7%)       1 (6.7%)   
                    2                              4 (26.7%)    4 (26.7%)      2 (13.3%)   
                    3                               1 (6.7%)    2 (13.3%)      4 (26.7%)   
                    4                                  0         1 (6.7%)          0       
                    Any                            8 (53.3%)    8 (53.3%)      7 (46.7%)   
        Immunoglobulin A Measurement (n)               15           15             15      
          LOW                                                                              
                    Any                                0            0              0       
          HIGH                                                                             
                    1                              3 (20.0%)     1 (6.7%)       1 (6.7%)   
                    2                              5 (33.3%)    4 (26.7%)      2 (13.3%)   
                    3                              3 (20.0%)    3 (20.0%)      2 (13.3%)   
                    4                                  0            0           1 (6.7%)   
                    Any                            11 (73.3%)   8 (53.3%)      6 (40.0%)   

# lbt07 can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Parameter                                                                          
          Direction of Abnormality                 A: Drug X    B: Placebo   C: Combination
                    Highest NCI CTCAE Grade          (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement (n)       15           15             15      
          LOW                                                                              
                    1                              3 (20.0%)        0              0       
                    2                              2 (13.3%)     1 (6.7%)       1 (6.7%)   
                    3                               1 (6.7%)     1 (6.7%)      6 (40.0%)   
                    4                              3 (20.0%)    2 (13.3%)      3 (20.0%)   
                    Any                            9 (60.0%)    4 (26.7%)      10 (66.7%)  
          HIGH                                                                             
                    Any                                0            0              0       
        C-Reactive Protein Measurement (n)             15           15             15      
          LOW                                                                              
                    1                              2 (13.3%)     1 (6.7%)      2 (13.3%)   
                    2                              5 (33.3%)    2 (13.3%)      5 (33.3%)   
                    3                              3 (20.0%)    4 (26.7%)      3 (20.0%)   
                    4                                  0         1 (6.7%)          0       
                    Any                            10 (66.7%)   8 (53.3%)      10 (66.7%)  
          HIGH                                                                             
                    1                              3 (20.0%)     1 (6.7%)       1 (6.7%)   
                    2                              4 (26.7%)    4 (26.7%)      2 (13.3%)   
                    3                               1 (6.7%)    2 (13.3%)      4 (26.7%)   
                    4                                  0         1 (6.7%)          0       
                    Any                            8 (53.3%)    8 (53.3%)      7 (46.7%)   
        Immunoglobulin A Measurement (n)               15           15             15      
          LOW                                                                              
                    Any                                0            0              0       
          HIGH                                                                             
                    1                              3 (20.0%)     1 (6.7%)       1 (6.7%)   
                    2                              5 (33.3%)    4 (26.7%)      2 (13.3%)   
                    3                              3 (20.0%)    3 (20.0%)      2 (13.3%)   
                    4                                  0            0           1 (6.7%)   
                    Any                            11 (73.3%)   8 (53.3%)      6 (40.0%)   

