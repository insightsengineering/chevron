# dmt01 can handle NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                             A: Drug X    B: Placebo   C: Combination   All Patients
                                               (N=15)       (N=15)         (N=15)          (N=45)   
        ————————————————————————————————————————————————————————————————————————————————————————————
        Age Group                                                                                   
          n                                      15           15             15              45     
          <65                                15 (100%)    15 (100%)      15 (100%)       45 (100%)  
        Sex                                                                                         
          n                                      15           15             15              45     
          Male                               3 (20.0%)    7 (46.7%)      5 (33.3%)       15 (33.3%) 
          Female                             12 (80.0%)   8 (53.3%)      10 (66.7%)      30 (66.7%) 
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

# dmt01 can handle numeric NA values

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
          Male                               3 (20.0%)    7 (46.7%)      5 (33.3%)       15 (33.3%) 
          Female                             12 (80.0%)   8 (53.3%)      10 (66.7%)      30 (66.7%) 
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

# dmt01 works as expected with setting default precision

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                 A: Drug X          B: Placebo        C: Combination  
                                                  (N=15)              (N=15)              (N=15)      
        ——————————————————————————————————————————————————————————————————————————————————————————————
        RACE                                                                                          
          n                                         15                  15                  15        
          AMERICAN INDIAN OR ALASKA NATIVE           0               2 (13.3%)           1 (6.7%)     
          ASIAN                                  8 (53.3%)          10 (66.7%)           8 (53.3%)    
          BLACK OR AFRICAN AMERICAN              4 (26.7%)           1 (6.7%)            4 (26.7%)    
          WHITE                                  3 (20.0%)           2 (13.3%)           2 (13.3%)    
        Age (yr)                                                                                      
          n                                         15                  15                  15        
          Mean (SD)                          31.3333 (5.2599)    35.0667 (9.0275)    36.6000 (6.4454) 
          Median                                  31.0000             35.0000             35.0000     
          Min - Max                           24.000 - 40.000     24.000 - 57.000     24.000 - 49.000 
        Baseline BMI                                                                                  
          n                                         15                  15                  15        
          Mean (SD)                          29.7467 (15.1038)   41.0800 (26.6518)   33.9000 (15.3876)
          Median                                  37.0000             33.7000             37.8000     
          Min - Max                           6.400 - 47.900      5.300 - 117.900     -3.500 - 59.000 
      \s\n                                         All Patients   
                                                  (N=45)      
        ——————————————————————————————————————————————————————
        RACE                                                  
          n                                         45        
          AMERICAN INDIAN OR ALASKA NATIVE       3 (6.7%)     
          ASIAN                                 26 (57.8%)    
          BLACK OR AFRICAN AMERICAN              9 (20.0%)    
          WHITE                                  7 (15.6%)    
        Age (yr)                                              
          n                                         45        
          Mean (SD)                          34.3333 (7.2770) 
          Median                                  34.0000     
          Min - Max                           24.000 - 57.000 
        Baseline BMI                                          
          n                                         45        
          Mean (SD)                          34.9089 (19.9085)
          Median                                  37.2000     
          Min - Max                          -3.500 - 117.900 

# dmt01 works as expected with auto precision settings

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                               A: Drug X      B: Placebo     C: Combination   All Patients 
                                                (N=15)          (N=15)           (N=15)          (N=45)    
        ———————————————————————————————————————————————————————————————————————————————————————————————————
        RACE                                                                                               
          n                                       15              15               15              45      
          AMERICAN INDIAN OR ALASKA NATIVE         0           2 (13.3%)        1 (6.7%)        3 (6.7%)   
          ASIAN                                8 (53.3%)      10 (66.7%)       8 (53.3%)       26 (57.8%)  
          BLACK OR AFRICAN AMERICAN            4 (26.7%)       1 (6.7%)        4 (26.7%)        9 (20.0%)  
          WHITE                                3 (20.0%)       2 (13.3%)       2 (13.3%)        7 (15.6%)  
        Age (yr)                                                                                           
          n                                       15              15               15              45      
          Mean (SD)                           31.3 (5.3)      35.1 (9.0)       36.6 (6.4)      34.3 (7.3)  
          Median                                 31.0            35.0             35.0            34.0     
          Min - Max                             24 - 40         24 - 57         24 - 49          24 - 57   
        Baseline BMI                                                                                       
          n                                       15              15               15              45      
          Mean (SD)                          29.75 (15.10)   41.08 (26.65)   33.90 (15.39)    34.91 (19.91)
          Median                                 37.00           33.70           37.80            37.20    
          Min - Max                           6.4 - 47.9      5.3 - 117.9     -3.5 - 59.0     -3.5 - 117.9 

# dmt01 works as expected with auto precision settings and defined precision

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                               A: Drug X        B: Placebo     C: Combination    All Patients 
                                                 (N=15)           (N=15)           (N=15)           (N=45)    
        ——————————————————————————————————————————————————————————————————————————————————————————————————————
        RACE                                                                                                  
          n                                        15               15               15               45      
          AMERICAN INDIAN OR ALASKA NATIVE         0            2 (13.3%)         1 (6.7%)         3 (6.7%)   
          ASIAN                                8 (53.3%)        10 (66.7%)       8 (53.3%)        26 (57.8%)  
          BLACK OR AFRICAN AMERICAN            4 (26.7%)         1 (6.7%)        4 (26.7%)        9 (20.0%)   
          WHITE                                3 (20.0%)        2 (13.3%)        2 (13.3%)        7 (15.6%)   
        Age (yr)                                                                                              
          n                                        15               15               15               45      
          Mean (SD)                          31.333 (5.260)   35.067 (9.027)   36.600 (6.445)   34.333 (7.277)
          Median                                 31.000           35.000           35.000           34.000    
          Min - Max                          24.00 - 40.00    24.00 - 57.00    24.00 - 49.00    24.00 - 57.00 
        Baseline BMI                                                                                          
          n                                        15               15               15               45      
          Mean (SD)                          29.75 (15.10)    41.08 (26.65)    33.90 (15.39)    34.91 (19.91) 
          Median                                 37.00            33.70            37.80            37.20     
          Min - Max                            6.4 - 47.9      5.3 - 117.9      -3.5 - 59.0      -3.5 - 117.9 

# dmt01 works as expected with auto precision settings and defined precision and default

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                   A: Drug X              B: Placebo      
                                                    (N=15)                  (N=15)        
        ——————————————————————————————————————————————————————————————————————————————————
        RACE                                                                              
          n                                           15                      15          
          AMERICAN INDIAN OR ALASKA NATIVE             0                   2 (13.3%)      
          ASIAN                                    8 (53.3%)              10 (66.7%)      
          BLACK OR AFRICAN AMERICAN                4 (26.7%)               1 (6.7%)       
          WHITE                                    3 (20.0%)               2 (13.3%)      
        Age (yr)                                                                          
          n                                           15                      15          
          Mean (SD)                             31.333 (5.260)          35.067 (9.027)    
          Median                                    31.000                  35.000        
          Min - Max                              24.00 - 40.00           24.00 - 57.00    
        Baseline BMI                                                                      
          n                                           15                      15          
          Mean (SD)                          29.746667 (15.103778)   41.080000 (26.651754)
          Median                                   37.000000               33.700000      
          Min - Max                           6.40000 - 47.90000      5.30000 - 117.90000 
      \s\n                                          C: Combination           All Patients     
                                                    (N=15)                  (N=45)        
        ——————————————————————————————————————————————————————————————————————————————————
        RACE                                                                              
          n                                           15                      45          
          AMERICAN INDIAN OR ALASKA NATIVE         1 (6.7%)                3 (6.7%)       
          ASIAN                                    8 (53.3%)              26 (57.8%)      
          BLACK OR AFRICAN AMERICAN                4 (26.7%)               9 (20.0%)      
          WHITE                                    2 (13.3%)               7 (15.6%)      
        Age (yr)                                                                          
          n                                           15                      45          
          Mean (SD)                             36.600 (6.445)          34.333 (7.277)    
          Median                                    35.000                  34.000        
          Min - Max                              24.00 - 49.00           24.00 - 57.00    
        Baseline BMI                                                                      
          n                                           15                      45          
          Mean (SD)                          33.900000 (15.387611)   34.908889 (19.908482)
          Median                                   37.800000               37.200000      
          Min - Max                           -3.50000 - 59.00000    -3.50000 - 117.90000 

# dmt01 works as expected with cutomized stats value

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                A: Drug X        B: Placebo      C: Combination 
                                                 (N=15)            (N=15)            (N=15)     
        ————————————————————————————————————————————————————————————————————————————————————————
        RACE                                                                                    
          n                                        15                15                15       
          AMERICAN INDIAN OR ALASKA NATIVE          0             2 (13.3%)         1 (6.7%)    
          ASIAN                                 8 (53.3%)        10 (66.7%)         8 (53.3%)   
          BLACK OR AFRICAN AMERICAN             4 (26.7%)         1 (6.7%)          4 (26.7%)   
          WHITE                                 3 (20.0%)         2 (13.3%)         2 (13.3%)   
        Age (yr)                                                                                
          Mean                                  31.333333         35.066667         36.600000   
        Baseline BMI                                                                            
          n                                        15                15                15       
          Mean (SD)                          29.747 (15.104)   41.080 (26.652)   33.900 (15.388)
          Median                                 37.000            33.700            37.800     
          Min - Max                           6.40 - 47.90      5.30 - 117.90     -3.50 - 59.00 
      \s\n                                        All Patients  
                                                 (N=45)     
        ————————————————————————————————————————————————————
        RACE                                                
          n                                        45       
          AMERICAN INDIAN OR ALASKA NATIVE      3 (6.7%)    
          ASIAN                                26 (57.8%)   
          BLACK OR AFRICAN AMERICAN             9 (20.0%)   
          WHITE                                 7 (15.6%)   
        Age (yr)                                            
          Mean                                  34.333333   
        Baseline BMI                                        
          n                                        45       
          Mean (SD)                          34.909 (19.908)
          Median                                 37.200     
          Min - Max                          -3.50 - 117.90 

# dmt01 works as expected with empty list as stats value

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                  A: Drug X              B: Placebo           C: Combination   
                                                    (N=15)                 (N=15)                 (N=15)       
        ———————————————————————————————————————————————————————————————————————————————————————————————————————
        RACE                                                                                                   
          n                                           15                     15                     15         
          AMERICAN INDIAN OR ALASKA NATIVE            0                  2 (13.3%)               1 (6.7%)      
          ASIAN                                   8 (53.3%)              10 (66.7%)             8 (53.3%)      
          BLACK OR AFRICAN AMERICAN               4 (26.7%)               1 (6.7%)              4 (26.7%)      
          WHITE                                   3 (20.0%)              2 (13.3%)              2 (13.3%)      
        Age (yr)                                                                                               
          n                                           15                     15                     15         
          Mean (SD)                          31.333333 (5.259911)   35.066667 (9.027471)   36.600000 (6.445375)
          Median                                  31.000000              35.000000              35.000000      
          Min - Max                          24.00000 - 40.00000    24.00000 - 57.00000    24.00000 - 49.00000 
        Baseline BMI                                                                                           
          n                                           15                     15                     15         
          Mean (SD)                            29.747 (15.104)        41.080 (26.652)        33.900 (15.388)   
          Median                                    37.000                 33.700                 37.800       
          Min - Max                              6.40 - 47.90          5.30 - 117.90          -3.50 - 59.00    
      \s\n                                           All Patients    
                                                    (N=45)       
        —————————————————————————————————————————————————————————
        RACE                                                     
          n                                           45         
          AMERICAN INDIAN OR ALASKA NATIVE         3 (6.7%)      
          ASIAN                                   26 (57.8%)     
          BLACK OR AFRICAN AMERICAN               9 (20.0%)      
          WHITE                                   7 (15.6%)      
        Age (yr)                                                 
          n                                           45         
          Mean (SD)                          34.333333 (7.276987)
          Median                                  34.000000      
          Min - Max                          24.00000 - 57.00000 
        Baseline BMI                                             
          n                                           45         
          Mean (SD)                            34.909 (19.908)   
          Median                                    37.200       
          Min - Max                             -3.50 - 117.90   

# dmt01 works as expected with only one summaryvars

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                             A: Drug X   B: Placebo   C: Combination   All Patients
                                              (N=15)       (N=15)         (N=15)          (N=45)   
        ———————————————————————————————————————————————————————————————————————————————————————————
        RACE                                                                                       
          n                                     15           15             15              45     
          AMERICAN INDIAN OR ALASKA NATIVE       0       2 (13.3%)       1 (6.7%)        3 (6.7%)  
          ASIAN                              8 (53.3%)   10 (66.7%)     8 (53.3%)       26 (57.8%) 
          BLACK OR AFRICAN AMERICAN          4 (26.7%)    1 (6.7%)      4 (26.7%)       9 (20.0%)  
          WHITE                              3 (20.0%)   2 (13.3%)      2 (13.3%)       7 (15.6%)  

