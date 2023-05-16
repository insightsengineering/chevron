# ext01 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                A: Drug X        B: Placebo      C: Combination 
                                                 (N=134)           (N=134)           (N=132)    
        ————————————————————————————————————————————————————————————————————————————————————————
        Total number of doses administered                                                      
          n                                        134               134               132      
          Mean (SD)                             7.0 (0.0)         7.0 (0.0)         7.0 (0.0)   
          Median                                   7.0               7.0               7.0      
          Min - Max                             7.0 - 7.0         7.0 - 7.0         7.0 - 7.0   
        Total dose administered                                                                 
          n                                        134               134               132      
          Mean (SD)                          6655.5 (1209.6)   6401.2 (1269.9)   6776.4 (1212.5)
          Median                                 6720.0            6360.0            6720.0     
          Min - Max                          4320.0 - 9360.0   4080.0 - 9360.0   4320.0 - 9360.0

# ext01 functions with categorical data return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                     A: Drug X        B: Placebo      C: Combination 
                                      (N=134)           (N=134)           (N=132)    
        —————————————————————————————————————————————————————————————————————————————
        Total dose administered                                                      
          n                             134               134               132      
          Mean (SD)               6655.5 (1209.6)   6401.2 (1269.9)   6776.4 (1212.5)
          Median                      6720.0            6360.0            6720.0     
          Min - Max               4320.0 - 9360.0   4080.0 - 9360.0   4320.0 - 9360.0
          n                             134               134               132      
          <5000                      10 (7.5%)        18 (13.4%)         7 (5.3%)    
          5000-7000                 72 (53.7%)        71 (53.0%)        71 (53.8%)   
          7000-9000                 50 (37.3%)        42 (31.3%)        51 (38.6%)   
          >9000                      2 (1.5%)          3 (2.2%)          3 (2.3%)    

# ext01 works

    Code
      cat(export_as_txt(res1, lpp = 100))
    Output
                                                A: Drug X        B: Placebo      C: Combination 
                                                 (N=134)           (N=134)           (N=132)    
        ————————————————————————————————————————————————————————————————————————————————————————
        Total number of doses administered                                                      
          n                                        134               134               132      
          Mean (SD)                             7.0 (0.0)         7.0 (0.0)         7.0 (0.0)   
          Median                                   7.0               7.0               7.0      
          Min - Max                             7.0 - 7.0         7.0 - 7.0         7.0 - 7.0   
        Total dose administered                                                                 
          n                                        134               134               132      
          Mean (SD)                          6655.5 (1209.6)   6401.2 (1269.9)   6776.4 (1212.5)
          Median                                 6720.0            6360.0            6720.0     
          Min - Max                          4320.0 - 9360.0   4080.0 - 9360.0   4320.0 - 9360.0

---

    Code
      cat(export_as_txt(res2, lpp = 100))
    Output
                                                A: Drug X        B: Placebo      C: Combination 
                                                 (N=134)           (N=134)           (N=132)    
        ————————————————————————————————————————————————————————————————————————————————————————
        Total number of doses administered                                                      
          n                                        134               134               132      
          Mean (SD)                             7.0 (0.0)         7.0 (0.0)         7.0 (0.0)   
          Median                                   7.0               7.0               7.0      
          Min - Max                             7.0 - 7.0         7.0 - 7.0         7.0 - 7.0   
        Total dose administered                                                                 
          n                                        134               134               132      
          Mean (SD)                          6655.5 (1209.6)   6401.2 (1269.9)   6776.4 (1212.5)
          Median                                 6720.0            6360.0            6720.0     
          Min - Max                          4320.0 - 9360.0   4080.0 - 9360.0   4320.0 - 9360.0

# ext01 works for selected parameters and categorical variables

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                     A: Drug X        B: Placebo      C: Combination 
                                      (N=134)           (N=134)           (N=132)    
        —————————————————————————————————————————————————————————————————————————————
        Total dose administered                                                      
          n                             134               134               132      
          Mean (SD)               6655.5 (1209.6)   6401.2 (1269.9)   6776.4 (1212.5)
          Median                      6720.0            6360.0            6720.0     
          Min - Max               4320.0 - 9360.0   4080.0 - 9360.0   4320.0 - 9360.0
          n                             134               134               132      
          <5000                      10 (7.5%)        18 (13.4%)         7 (5.3%)    
          5000-7000                 72 (53.7%)        71 (53.0%)        71 (53.8%)   
          7000-9000                 50 (37.3%)        42 (31.3%)        51 (38.6%)   
          >9000                      2 (1.5%)          3 (2.2%)          3 (2.3%)    

