# dmt01 can handle NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                              A: Drug X    B: Placebo    C: Combination   All Patients
                                               (N=134)       (N=134)        (N=132)         (N=400)   
        ——————————————————————————————————————————————————————————————————————————————————————————————
        Age Group                                                                                     
          n                                      134           134            132             400     
          <65                                134 (100%)    134 (100%)     131 (99.2%)     399 (99.8%) 
          >=65                                    0             0           1 (0.8%)        1 (0.2%)  
        Sex                                                                                           
          n                                      134           134            132             400     
          Male                               55 (41.0%)    52 (38.8%)      62 (47.0%)     169 (42.2%) 
          Female                             79 (59.0%)    82 (61.2%)      70 (53.0%)     231 (57.8%) 
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

# dmt01 can handle numeric NA values

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
          Male                               55 (41.0%)    52 (38.8%)      62 (47.0%)     169 (42.2%) 
          Female                             79 (59.0%)    82 (61.2%)      70 (53.0%)     231 (57.8%) 
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

# dmt01 works as expected with setting default precision

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                 A: Drug X          B: Placebo        C: Combination  
                                                  (N=134)             (N=134)             (N=132)     
        ——————————————————————————————————————————————————————————————————————————————————————————————
        RACE                                                                                          
          n                                         134                 134                 132       
          AMERICAN INDIAN OR ALASKA NATIVE       8 (6.0%)            11 (8.2%)           6 (4.5%)     
          ASIAN                                 68 (50.7%)          68 (50.7%)          73 (55.3%)    
          BLACK OR AFRICAN AMERICAN             31 (23.1%)          28 (20.9%)          32 (24.2%)    
          WHITE                                 27 (20.1%)          27 (20.1%)          21 (15.9%)    
        Age (yr)                                                                                      
          n                                         134                 134                 132       
          Mean (SD)                          33.7687 (6.5533)    35.4328 (7.8954)    35.4318 (7.7225) 
          Median                                  33.0000             35.0000             35.0000     
          Min - Max                           21.000 - 50.000     21.000 - 62.000     20.000 - 69.000 
        Baseline BMI                                                                                  
          n                                         134                 134                 132       
          Mean (SD)                          29.9560 (18.3026)   32.3896 (23.2267)   30.0674 (18.4423)
          Median                                  27.1000             31.1000             30.0000     
          Min - Max                           -6.900 - 75.900    -26.600 - 117.900   -44.200 - 87.500 
      \s\n                                         All Patients   
                                                  (N=400)     
        ——————————————————————————————————————————————————————
        RACE                                                  
          n                                         400       
          AMERICAN INDIAN OR ALASKA NATIVE       25 (6.2%)    
          ASIAN                                 209 (52.2%)   
          BLACK OR AFRICAN AMERICAN             91 (22.8%)    
          WHITE                                 75 (18.8%)    
        Age (yr)                                              
          n                                         400       
          Mean (SD)                          34.8750 (7.4359) 
          Median                                  34.0000     
          Min - Max                           20.000 - 69.000 
        Baseline BMI                                          
          n                                         400       
          Mean (SD)                          30.8080 (20.1102)
          Median                                  29.2500     
          Min - Max                          -44.200 - 117.900

# dmt01 works as expected with auto precision settings

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                               A: Drug X      B: Placebo     C: Combination   All Patients 
                                                (N=134)         (N=134)         (N=132)          (N=400)   
        ———————————————————————————————————————————————————————————————————————————————————————————————————
        RACE                                                                                               
          n                                       134             134             132              400     
          AMERICAN INDIAN OR ALASKA NATIVE     8 (6.0%)        11 (8.2%)        6 (4.5%)        25 (6.2%)  
          ASIAN                               68 (50.7%)      68 (50.7%)       73 (55.3%)      209 (52.2%) 
          BLACK OR AFRICAN AMERICAN           31 (23.1%)      28 (20.9%)       32 (24.2%)      91 (22.8%)  
          WHITE                               27 (20.1%)      27 (20.1%)       21 (15.9%)      75 (18.8%)  
        Age (yr)                                                                                           
          n                                       134             134             132              400     
          Mean (SD)                           33.8 (6.6)      35.4 (7.9)       35.4 (7.7)      34.9 (7.4)  
          Median                                 33.0            35.0             35.0            34.0     
          Min - Max                             21 - 50         21 - 62         20 - 69          20 - 69   
        Baseline BMI                                                                                       
          n                                       134             134             132              400     
          Mean (SD)                          29.96 (18.30)   32.39 (23.23)   30.07 (18.44)    30.81 (20.11)
          Median                                 27.10           31.10           30.00            29.25    
          Min - Max                           -6.9 - 75.9    -26.6 - 117.9    -44.2 - 87.5    -44.2 - 117.9

# dmt01 works as expected with auto precision settings and defined precision

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                               A: Drug X        B: Placebo     C: Combination    All Patients 
                                                (N=134)          (N=134)          (N=132)          (N=400)    
        ——————————————————————————————————————————————————————————————————————————————————————————————————————
        RACE                                                                                                  
          n                                       134              134              132              400      
          AMERICAN INDIAN OR ALASKA NATIVE      8 (6.0%)        11 (8.2%)         6 (4.5%)        25 (6.2%)   
          ASIAN                                68 (50.7%)       68 (50.7%)       73 (55.3%)      209 (52.2%)  
          BLACK OR AFRICAN AMERICAN            31 (23.1%)       28 (20.9%)       32 (24.2%)       91 (22.8%)  
          WHITE                                27 (20.1%)       27 (20.1%)       21 (15.9%)       75 (18.8%)  
        Age (yr)                                                                                              
          n                                       134              134              132              400      
          Mean (SD)                          33.769 (6.553)   35.433 (7.895)   35.432 (7.722)   34.875 (7.436)
          Median                                 33.000           35.000           35.000           34.000    
          Min - Max                          21.00 - 50.00    21.00 - 62.00    20.00 - 69.00    20.00 - 69.00 
        Baseline BMI                                                                                          
          n                                       134              134              132              400      
          Mean (SD)                          29.96 (18.30)    32.39 (23.23)    30.07 (18.44)    30.81 (20.11) 
          Median                                 27.10            31.10            30.00            29.25     
          Min - Max                           -6.9 - 75.9     -26.6 - 117.9     -44.2 - 87.5    -44.2 - 117.9 

# dmt01 works as expected with auto precision settings and defined precision and default

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                   A: Drug X              B: Placebo      
                                                    (N=134)                 (N=134)       
        ——————————————————————————————————————————————————————————————————————————————————
        RACE                                                                              
          n                                           134                     134         
          AMERICAN INDIAN OR ALASKA NATIVE         8 (6.0%)                11 (8.2%)      
          ASIAN                                   68 (50.7%)              68 (50.7%)      
          BLACK OR AFRICAN AMERICAN               31 (23.1%)              28 (20.9%)      
          WHITE                                   27 (20.1%)              27 (20.1%)      
        Age (yr)                                                                          
          n                                           134                     134         
          Mean (SD)                             33.769 (6.553)          35.433 (7.895)    
          Median                                    33.000                  35.000        
          Min - Max                              21.00 - 50.00           21.00 - 62.00    
        Baseline BMI                                                                      
          n                                           134                     134         
          Mean (SD)                          29.955970 (18.302555)   32.389552 (23.226716)
          Median                                   27.100000               31.100000      
          Min - Max                           -6.90000 - 75.90000    -26.60000 - 117.90000
      \s\n                                          C: Combination           All Patients     
                                                    (N=132)                 (N=400)       
        ——————————————————————————————————————————————————————————————————————————————————
        RACE                                                                              
          n                                           132                     400         
          AMERICAN INDIAN OR ALASKA NATIVE         6 (4.5%)                25 (6.2%)      
          ASIAN                                   73 (55.3%)              209 (52.2%)     
          BLACK OR AFRICAN AMERICAN               32 (24.2%)              91 (22.8%)      
          WHITE                                   21 (15.9%)              75 (18.8%)      
        Age (yr)                                                                          
          n                                           132                     400         
          Mean (SD)                             35.432 (7.722)          34.875 (7.436)    
          Median                                    35.000                  34.000        
          Min - Max                              20.00 - 69.00           20.00 - 69.00    
        Baseline BMI                                                                      
          n                                           132                     400         
          Mean (SD)                          30.067424 (18.442349)   30.808000 (20.110241)
          Median                                   30.000000               29.250000      
          Min - Max                          -44.20000 - 87.50000    -44.20000 - 117.90000

# dmt01 works as expected with cutomized stats value

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                A: Drug X        B: Placebo      C: Combination 
                                                 (N=134)           (N=134)           (N=132)    
        ————————————————————————————————————————————————————————————————————————————————————————
        RACE                                                                                    
          n                                        134               134               132      
          AMERICAN INDIAN OR ALASKA NATIVE      8 (6.0%)          11 (8.2%)         6 (4.5%)    
          ASIAN                                68 (50.7%)        68 (50.7%)        73 (55.3%)   
          BLACK OR AFRICAN AMERICAN            31 (23.1%)        28 (20.9%)        32 (24.2%)   
          WHITE                                27 (20.1%)        27 (20.1%)        21 (15.9%)   
        Age (yr)                                                                                
          Mean                                  33.768657         35.432836         35.431818   
        Baseline BMI                                                                            
          n                                        134               134               132      
          Mean (SD)                          29.956 (18.303)   32.390 (23.227)   30.067 (18.442)
          Median                                 27.100            31.100            30.000     
          Min - Max                           -6.90 - 75.90    -26.60 - 117.90   -44.20 - 87.50 
      \s\n                                        All Patients  
                                                 (N=400)    
        ————————————————————————————————————————————————————
        RACE                                                
          n                                        400      
          AMERICAN INDIAN OR ALASKA NATIVE      25 (6.2%)   
          ASIAN                                209 (52.2%)  
          BLACK OR AFRICAN AMERICAN            91 (22.8%)   
          WHITE                                75 (18.8%)   
        Age (yr)                                            
          Mean                                  34.875000   
        Baseline BMI                                        
          n                                        400      
          Mean (SD)                          30.808 (20.110)
          Median                                 29.250     
          Min - Max                          -44.20 - 117.90

# dmt01 works as expected with empty list as stats value

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                  A: Drug X              B: Placebo           C: Combination   
                                                   (N=134)                (N=134)                (N=132)       
        ———————————————————————————————————————————————————————————————————————————————————————————————————————
        RACE                                                                                                   
          n                                          134                    134                    132         
          AMERICAN INDIAN OR ALASKA NATIVE         8 (6.0%)              11 (8.2%)               6 (4.5%)      
          ASIAN                                   68 (50.7%)             68 (50.7%)             73 (55.3%)     
          BLACK OR AFRICAN AMERICAN               31 (23.1%)             28 (20.9%)             32 (24.2%)     
          WHITE                                   27 (20.1%)             27 (20.1%)             21 (15.9%)     
        Age (yr)                                                                                               
          n                                          134                    134                    132         
          Mean (SD)                          33.768657 (6.553326)   35.432836 (7.895414)   35.431818 (7.722470)
          Median                                  33.000000              35.000000              35.000000      
          Min - Max                          21.00000 - 50.00000    21.00000 - 62.00000    20.00000 - 69.00000 
        Baseline BMI                                                                                           
          n                                          134                    134                    132         
          Mean (SD)                            29.956 (18.303)        32.390 (23.227)        30.067 (18.442)   
          Median                                    27.100                 31.100                 30.000       
          Min - Max                             -6.90 - 75.90         -26.60 - 117.90         -44.20 - 87.50   
      \s\n                                           All Patients    
                                                   (N=400)       
        —————————————————————————————————————————————————————————
        RACE                                                     
          n                                          400         
          AMERICAN INDIAN OR ALASKA NATIVE        25 (6.2%)      
          ASIAN                                  209 (52.2%)     
          BLACK OR AFRICAN AMERICAN               91 (22.8%)     
          WHITE                                   75 (18.8%)     
        Age (yr)                                                 
          n                                          400         
          Mean (SD)                          34.875000 (7.435900)
          Median                                  34.000000      
          Min - Max                          20.00000 - 69.00000 
        Baseline BMI                                             
          n                                          400         
          Mean (SD)                            30.808 (20.110)   
          Median                                    29.250       
          Min - Max                            -44.20 - 117.90   

# dmt01 works as expected with only one summaryvars

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                             A: Drug X    B: Placebo   C: Combination   All Patients
                                              (N=134)      (N=134)        (N=132)         (N=400)   
        ————————————————————————————————————————————————————————————————————————————————————————————
        RACE                                                                                        
          n                                     134          134            132             400     
          AMERICAN INDIAN OR ALASKA NATIVE    8 (6.0%)    11 (8.2%)       6 (4.5%)       25 (6.2%)  
          ASIAN                              68 (50.7%)   68 (50.7%)     73 (55.3%)     209 (52.2%) 
          BLACK OR AFRICAN AMERICAN          31 (23.1%)   28 (20.9%)     32 (24.2%)      91 (22.8%) 
          WHITE                              27 (20.1%)   27 (20.1%)     21 (15.9%)      75 (18.8%) 

