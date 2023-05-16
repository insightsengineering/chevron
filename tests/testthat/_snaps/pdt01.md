# pdt01 function with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Category                                                              A: Drug X    B: Placebo
          Description                                                          (N=134)      (N=134)  
        —————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one major protocol deviation   22 (16.4%)   23 (17.2%)
        Total number of major protocol deviations                                 40           42    
        EXCLUSION CRITERIA                                                                           
          Active or untreated or other excluded cns metastases                 5 (3.7%)     3 (2.2%) 
          Pregnancy criteria                                                   2 (1.5%)     4 (3.0%) 
          History of other malignancies within the last 5 years                3 (2.2%)     2 (1.5%) 
          Uncontrolled concurrent condition                                    3 (2.2%)     1 (0.7%) 
          Other exclusion criteria                                                0            0     
          Received prior prohibited therapy or medication                         0         2 (1.5%) 
        INCLUSION CRITERIA                                                                           
          No signed ICF at study entry                                         6 (4.5%)     4 (3.0%) 
          Ineligible cancer type or current cancer stage                       6 (4.5%)     1 (0.7%) 
          Inclusion lab values outside allowed limits                             0         3 (2.2%) 
          Does not meet prior therapy requirements                             1 (0.7%)        0     
          Inclusion-related test not done/out of window                           0            0     
        MEDICATION                                                                                   
          Significant deviation from planned dose                              3 (2.2%)     1 (0.7%) 
          Received incorrect study medication                                  1 (0.7%)     2 (1.5%) 
          Discontinued study drug for unspecified reason                       1 (0.7%)     1 (0.7%) 
          Dose missed or significantly out of window                           2 (1.5%)        0     
          Received prohibited concomitant medication                              0         2 (1.5%) 
        PROCEDURAL                                                                                   
          Eligibility-related test not done/out of window                      1 (0.7%)     6 (4.5%) 
          Omission of screening tumor assessment                                  0         4 (3.0%) 
          Missed assessment affecting safety/study outcomes                    1 (0.7%)     2 (1.5%) 
          Failure to sign updated ICF within two visits                        2 (1.5%)     1 (0.7%) 
          Missed 2 or more efficacy assessments                                2 (1.5%)        0     
          Omission of complete lab panel required by protocol                     0         1 (0.7%) 
      \s\n  Category                                                              C: Combination
          Description                                                            (N=132)    
        ————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one major protocol deviation     13 (9.8%)   
        Total number of major protocol deviations                                   21      
        EXCLUSION CRITERIA                                                                  
          Active or untreated or other excluded cns metastases                      0       
          Pregnancy criteria                                                        0       
          History of other malignancies within the last 5 years                     0       
          Uncontrolled concurrent condition                                         0       
          Other exclusion criteria                                               3 (2.3%)   
          Received prior prohibited therapy or medication                        1 (0.8%)   
        INCLUSION CRITERIA                                                                  
          No signed ICF at study entry                                              0       
          Ineligible cancer type or current cancer stage                         1 (0.8%)   
          Inclusion lab values outside allowed limits                               0       
          Does not meet prior therapy requirements                                  0       
          Inclusion-related test not done/out of window                          1 (0.8%)   
        MEDICATION                                                                          
          Significant deviation from planned dose                                2 (1.5%)   
          Received incorrect study medication                                    1 (0.8%)   
          Discontinued study drug for unspecified reason                         1 (0.8%)   
          Dose missed or significantly out of window                             1 (0.8%)   
          Received prohibited concomitant medication                                0       
        PROCEDURAL                                                                          
          Eligibility-related test not done/out of window                        1 (0.8%)   
          Omission of screening tumor assessment                                 3 (2.3%)   
          Missed assessment affecting safety/study outcomes                      2 (1.5%)   
          Failure to sign updated ICF within two visits                          1 (0.8%)   
          Missed 2 or more efficacy assessments                                  1 (0.8%)   
          Omission of complete lab panel required by protocol                    1 (0.8%)   

# pdt01 can handle all NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Category                                                              A: Drug X    B: Placebo
          Description                                                          (N=134)      (N=134)  
        —————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one major protocol deviation   22 (16.4%)   23 (17.2%)
        Total number of major protocol deviations                                 40           42    
        No Coding Available                                                                          
          No Coding Available                                                 22 (16.4%)   23 (17.2%)
      \s\n  Category                                                              C: Combination
          Description                                                            (N=132)    
        ————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one major protocol deviation     13 (9.8%)   
        Total number of major protocol deviations                                   21      
        No Coding Available                                                                 
          No Coding Available                                                   13 (9.8%)   

# pdt01 can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Category                                                              A: Drug X    B: Placebo
          Description                                                          (N=134)      (N=134)  
        —————————————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one major protocol deviation   22 (16.4%)   23 (17.2%)
        Total number of major protocol deviations                                 40           42    
        EXCLUSION CRITERIA                                                                           
          Active or untreated or other excluded cns metastases                 5 (3.7%)     3 (2.2%) 
          Pregnancy criteria                                                   2 (1.5%)     4 (3.0%) 
          History of other malignancies within the last 5 years                3 (2.2%)     2 (1.5%) 
          Uncontrolled concurrent condition                                    3 (2.2%)     1 (0.7%) 
          Other exclusion criteria                                                0            0     
          Received prior prohibited therapy or medication                         0         2 (1.5%) 
        INCLUSION CRITERIA                                                                           
          No signed ICF at study entry                                         6 (4.5%)     4 (3.0%) 
          Ineligible cancer type or current cancer stage                       6 (4.5%)     1 (0.7%) 
          Inclusion lab values outside allowed limits                             0         3 (2.2%) 
          Does not meet prior therapy requirements                             1 (0.7%)        0     
          Inclusion-related test not done/out of window                           0            0     
        MEDICATION                                                                                   
          Significant deviation from planned dose                              3 (2.2%)     1 (0.7%) 
          Received incorrect study medication                                  1 (0.7%)     2 (1.5%) 
          Discontinued study drug for unspecified reason                       1 (0.7%)     1 (0.7%) 
          Dose missed or significantly out of window                           2 (1.5%)        0     
          Received prohibited concomitant medication                              0         2 (1.5%) 
        PROCEDURAL                                                                                   
          Eligibility-related test not done/out of window                      1 (0.7%)     6 (4.5%) 
          Omission of screening tumor assessment                                  0         3 (2.2%) 
          Missed assessment affecting safety/study outcomes                    1 (0.7%)     2 (1.5%) 
          Failure to sign updated ICF within two visits                        1 (0.7%)     1 (0.7%) 
          Missed 2 or more efficacy assessments                                2 (1.5%)        0     
          Omission of complete lab panel required by protocol                     0         1 (0.7%) 
        No Coding Available                                                                          
          No Coding Available                                                  1 (0.7%)     1 (0.7%) 
      \s\n  Category                                                              C: Combination
          Description                                                            (N=132)    
        ————————————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least one major protocol deviation     13 (9.8%)   
        Total number of major protocol deviations                                   21      
        EXCLUSION CRITERIA                                                                  
          Active or untreated or other excluded cns metastases                      0       
          Pregnancy criteria                                                        0       
          History of other malignancies within the last 5 years                     0       
          Uncontrolled concurrent condition                                         0       
          Other exclusion criteria                                               3 (2.3%)   
          Received prior prohibited therapy or medication                        1 (0.8%)   
        INCLUSION CRITERIA                                                                  
          No signed ICF at study entry                                              0       
          Ineligible cancer type or current cancer stage                         1 (0.8%)   
          Inclusion lab values outside allowed limits                               0       
          Does not meet prior therapy requirements                                  0       
          Inclusion-related test not done/out of window                          1 (0.8%)   
        MEDICATION                                                                          
          Significant deviation from planned dose                                2 (1.5%)   
          Received incorrect study medication                                    1 (0.8%)   
          Discontinued study drug for unspecified reason                         1 (0.8%)   
          Dose missed or significantly out of window                             1 (0.8%)   
          Received prohibited concomitant medication                                0       
        PROCEDURAL                                                                          
          Eligibility-related test not done/out of window                        1 (0.8%)   
          Omission of screening tumor assessment                                 3 (2.3%)   
          Missed assessment affecting safety/study outcomes                      2 (1.5%)   
          Failure to sign updated ICF within two visits                          1 (0.8%)   
          Missed 2 or more efficacy assessments                                  1 (0.8%)   
          Omission of complete lab panel required by protocol                    1 (0.8%)   
        No Coding Available                                                                 
          No Coding Available                                                       0       

