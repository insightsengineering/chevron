# pdt02 function with default argument value return expected result with test data

    Code
      res
    Output
        Primary Reason                                                                                     A: Drug X   B: Placebo   C: Combination
          Description                                                                                       (N=134)     (N=134)        (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one major protocol deviation related to epidemic/pandemic   9 (6.7%)     2 (1.5%)       5 (3.8%)   
        Total number of major protocol deviations related to epidemic/pandemic                                 9           2              6       
        Site action due to epidemic/pandemic                                                               9 (6.7%)     2 (1.5%)       5 (3.8%)   
          Significant deviation from planned dose                                                          3 (2.2%)     1 (0.7%)       2 (1.5%)   
          Failure to sign updated ICF within two visits                                                    2 (1.5%)     1 (0.7%)       1 (0.8%)   
          Dose missed or significantly out of window                                                       2 (1.5%)        0           1 (0.8%)   
          Missed 2 or more efficacy assessments                                                            2 (1.5%)        0           1 (0.8%)   

# pdt02 can handle all NA values

    Code
      res
    Output
        Primary Reason                                                                                     A: Drug X   B: Placebo   C: Combination
          Description                                                                                       (N=134)     (N=134)        (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one major protocol deviation related to epidemic/pandemic   9 (6.7%)     2 (1.5%)       5 (3.8%)   
        Total number of major protocol deviations related to epidemic/pandemic                                 9           2              6       
        No Coding available                                                                                9 (6.7%)     2 (1.5%)       5 (3.8%)   
          No Coding available                                                                              9 (6.7%)     2 (1.5%)       5 (3.8%)   

# pdt02 can handle some NA values

    Code
      res
    Output
        Primary Reason                                                                                     A: Drug X   B: Placebo   C: Combination
          Description                                                                                       (N=134)     (N=134)        (N=132)    
        ——————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one major protocol deviation related to epidemic/pandemic   9 (6.7%)     2 (1.5%)       5 (3.8%)   
        Total number of major protocol deviations related to epidemic/pandemic                                 9           2              6       
        Site action due to epidemic/pandemic                                                               8 (6.0%)     2 (1.5%)       5 (3.8%)   
          Significant deviation from planned dose                                                          3 (2.2%)     1 (0.7%)       2 (1.5%)   
          Dose missed or significantly out of window                                                       2 (1.5%)        0           1 (0.8%)   
          Failure to sign updated ICF within two visits                                                    1 (0.7%)     1 (0.7%)       1 (0.8%)   
          Missed 2 or more efficacy assessments                                                            2 (1.5%)        0           1 (0.8%)   
        No Coding available                                                                                1 (0.7%)        0              0       
          No Coding available                                                                              1 (0.7%)        0              0       

