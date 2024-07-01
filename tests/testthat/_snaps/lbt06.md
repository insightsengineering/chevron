# lbt06 can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      
      Parameter: Alanine Aminotransferase Measurement
      
        —————————————————————————————————————————————————————————————————————————————————
        Visit                                                                            
          Abnormality at Visit                  A: Drug X    B: Placebo    C: Combination
                    Baseline Status              (N=15)        (N=15)          (N=15)    
        —————————————————————————————————————————————————————————————————————————————————
        WEEK 1 DAY 8                                                                     
          Low                                                                            
                    Not low                        0/1           0/6            0/1      
                    Low                            0/1           0/1            0/1      
                    Total                          0/2           0/7            0/2      
          High                                                                           
                    Not high                       0/2           0/7            0/2      
                    Total                          0/2           0/7            0/2      
        WEEK 2 DAY 15                                                                    
          Low                                                                            
                    Not low                        0/3           0/2            0/2      
                    Total                          0/3           0/2            0/2      
          High                                                                           
                    Not high                       0/3           0/2            0/2      
                    Total                          0/3           0/2            0/2      
        WEEK 3 DAY 22                                                                    
          Low                                                                            
                    Not low                        0/5           0/3        1/6 (16.7%)  
                    Total                          0/5           0/3        1/6 (16.7%)  
          High                                                                           
                    Not high                       0/5           0/3            0/6      
                    Total                          0/5           0/3            0/6      
        WEEK 4 DAY 29                                                                    
          Low                                                                            
                    Not low                        0/3           0/1            0/1      
                    Low                            0/3           0/2            0/0      
                    Total                          0/6           0/3            0/1      
          High                                                                           
                    Not high                       0/6           0/3            0/1      
                    Total                          0/6           0/3            0/1      
        WEEK 5 DAY 36                                                                    
          Low                                                                            
                    Not low                        0/2           0/2            0/5      
                    Low                            0/1           0/1            0/0      
                    Total                          0/3           0/3            0/5      
          High                                                                           
                    Not high                       0/3           0/3            0/5      
                    Total                          0/3           0/3            0/5      
      \s\n
      Parameter: C-Reactive Protein Measurement
      
        —————————————————————————————————————————————————————————————————————————————————
        Visit                                                                            
          Abnormality at Visit                  A: Drug X    B: Placebo    C: Combination
                    Baseline Status              (N=15)        (N=15)          (N=15)    
        —————————————————————————————————————————————————————————————————————————————————
        WEEK 1 DAY 8                                                                     
          Low                                                                            
                    Not low                        0/5           0/3            0/3      
                    Low                            0/0           0/1            0/0      
                    Total                          0/5           0/4            0/3      
          High                                                                           
                    Not high                       0/5           0/3        1/3 (33.3%)  
                    High                           0/0           0/1            0/0      
                    Total                          0/5           0/4        1/3 (33.3%)  
        WEEK 2 DAY 15                                                                    
          Low                                                                            
                    Not low                        0/8           0/2            0/0      
                    Low                            0/0           0/0            0/1      
                    Total                          0/8           0/2            0/1      
          High                                                                           
                    Not high                   1/8 (12.5%)       0/1            0/1      
                    High                           0/0           0/1            0/0      
                    Total                      1/8 (12.5%)       0/2            0/1      
        WEEK 3 DAY 22                                                                    
          Low                                                                            
                    Not low                        0/5           0/4            0/4      
                    Low                            0/0       1/1 (100%)         0/2      
                    Total                          0/5        1/5 (20%)         0/6      
          High                                                                           
                    Not high                    1/5 (20%)     1/5 (20%)         0/6      
                    Total                       1/5 (20%)     1/5 (20%)         0/6      
        WEEK 4 DAY 29                                                                    
          Low                                                                            
                    Not low                        0/2        1/2 (50%)     1/3 (33.3%)  
                    Total                          0/2        1/2 (50%)     1/3 (33.3%)  
          High                                                                           
                    Not high                       0/2           0/2            0/3      
                    Total                          0/2           0/2            0/3      
        WEEK 5 DAY 36                                                                    
          Low                                                                            
                    Not low                        0/2           0/2            0/5      
                    Low                            0/0       1/1 (100%)         0/1      
                    Total                          0/2       1/3 (33.3%)        0/6      
          High                                                                           
                    Not high                    1/2 (50%)        0/3            0/6      
                    Total                       1/2 (50%)        0/3            0/6      
      \s\n
      Parameter: Immunoglobulin A Measurement
      
        —————————————————————————————————————————————————————————————————————————————————
        Visit                                                                            
          Abnormality at Visit                  A: Drug X    B: Placebo    C: Combination
                    Baseline Status              (N=15)        (N=15)          (N=15)    
        —————————————————————————————————————————————————————————————————————————————————
        WEEK 1 DAY 8                                                                     
          Low                                                                            
                    Not low                        0/6           0/6            0/2      
                    Total                          0/6           0/6            0/2      
          High                                                                           
                    Not high                       0/5       1/6 (16.7%)        0/2      
                    High                           0/1           0/0            0/0      
                    Total                          0/6       1/6 (16.7%)        0/2      
        WEEK 2 DAY 15                                                                    
          Low                                                                            
                    Not low                        0/3           0/7            0/4      
                    Total                          0/3           0/7            0/4      
          High                                                                           
                    Not high                       0/3           0/7         1/4 (25%)   
                    Total                          0/3           0/7         1/4 (25%)   
        WEEK 3 DAY 22                                                                    
          Low                                                                            
                    Not low                        0/4           0/5            0/9      
                    Total                          0/4           0/5            0/9      
          High                                                                           
                    Not high                       0/3           0/5            0/8      
                    High                           0/1           0/0            0/1      
                    Total                          0/4           0/5            0/9      
        WEEK 4 DAY 29                                                                    
          Low                                                                            
                    Not low                        0/2           0/6            0/4      
                    Total                          0/2           0/6            0/4      
          High                                                                           
                    Not high                   1/1 (100%)        0/6            0/3      
                    High                           0/1           0/0            0/1      
                    Total                       1/2 (50%)        0/6            0/4      
        WEEK 5 DAY 36                                                                    
          Low                                                                            
                    Not low                        0/6           0/5            0/5      
                    Total                          0/6           0/5            0/5      
          High                                                                           
                    Not high                       0/5           0/5            0/5      
                    High                           0/1           0/0            0/0      
                    Total                          0/6           0/5            0/5      

