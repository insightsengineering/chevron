# pdt01 function with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100, cpp = 200))
    Output
        Category                                                              A: Drug X   B: Placebo   C: Combination
          Description                                                          (N=15)       (N=15)         (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one major protocol deviation   3 (20.0%)   3 (20.0%)          0       
        Total number of major protocol deviations                                 3           4              0       
        EXCLUSION CRITERIA                                                                                           
          Active or untreated or other excluded cns metastases                    0        1 (6.7%)          0       
          Pregnancy criteria                                                      0        1 (6.7%)          0       
        INCLUSION CRITERIA                                                                                           
          Ineligible cancer type or current cancer stage                      2 (13.3%)       0              0       
        MEDICATION                                                                                                   
          Received prohibited concomitant medication                              0        1 (6.7%)          0       
        PROCEDURAL                                                                                                   
          Eligibility-related test not done/out of window                         0        1 (6.7%)          0       
          Failure to sign updated ICF within two visits                       1 (6.7%)        0              0       

# pdt01 can handle all NA values

    Code
      cat(export_as_txt(res, lpp = 100, cpp = 200))
    Output
        Category                                                              A: Drug X   B: Placebo   C: Combination
          Description                                                          (N=15)       (N=15)         (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one major protocol deviation   3 (20.0%)   3 (20.0%)          0       
        Total number of major protocol deviations                                 3           4              0       
        No Coding Available                                                                                          
          No Coding Available                                                 3 (20.0%)   3 (20.0%)          0       

# pdt01 can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100, cpp = 200))
    Output
        Category                                                              A: Drug X   B: Placebo   C: Combination
          Description                                                          (N=15)       (N=15)         (N=15)    
        —————————————————————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one major protocol deviation   3 (20.0%)   3 (20.0%)          0       
        Total number of major protocol deviations                                 3           4              0       
        EXCLUSION CRITERIA                                                                                           
          Active or untreated or other excluded cns metastases                    0        1 (6.7%)          0       
        INCLUSION CRITERIA                                                                                           
          Ineligible cancer type or current cancer stage                      2 (13.3%)       0              0       
        MEDICATION                                                                                                   
          Received prohibited concomitant medication                              0        1 (6.7%)          0       
        PROCEDURAL                                                                                                   
          Eligibility-related test not done/out of window                         0        1 (6.7%)          0       
        No Coding Available                                                                                          
          No Coding Available                                                 1 (6.7%)     1 (6.7%)          0       

