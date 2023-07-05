# pdt02 function with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100, colwidths = c(40, 10, 10, 10)))
    Output
        Primary Reason                                                       C: Combina
        Description                                A: Drug X    B: Placebo      tion   
                                                    (N=134)      (N=134)      (N=132)  
        ———————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least      9 (6.7%)     2 (1.5%)     5 (3.8%) 
        one major protocol deviation related to                                        
        epidemic/pandemic                                                              
        Total number of major protocol                 9            2            6     
        deviations related to epidemic/pandemic                                        
        Site action due to epidemic/pandemic        9 (6.7%)     2 (1.5%)     5 (3.8%) 
          Significant deviation from planned        3 (2.2%)     1 (0.7%)     2 (1.5%) 
          dose                                                                         
          Failure to sign updated ICF within two    2 (1.5%)     1 (0.7%)     1 (0.8%) 
          visits                                                                       
          Dose missed or significantly out of       2 (1.5%)        0         1 (0.8%) 
          window                                                                       
          Missed 2 or more efficacy assessments     2 (1.5%)        0         1 (0.8%) 

# pdt02 can handle all NA values

    Code
      cat(export_as_txt(res, lpp = 100, colwidths = c(40, 10, 10, 10)))
    Output
        Primary Reason                                                       C: Combina
        Description                                A: Drug X    B: Placebo      tion   
                                                    (N=134)      (N=134)      (N=132)  
        ———————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least      9 (6.7%)     2 (1.5%)     5 (3.8%) 
        one major protocol deviation related to                                        
        epidemic/pandemic                                                              
        Total number of major protocol                 9            2            6     
        deviations related to epidemic/pandemic                                        
        No Coding Available                         9 (6.7%)     2 (1.5%)     5 (3.8%) 
          No Coding Available                       9 (6.7%)     2 (1.5%)     5 (3.8%) 

# pdt02 can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100, colwidths = c(40, 10, 10, 10)))
    Output
        Primary Reason                                                       C: Combina
        Description                                A: Drug X    B: Placebo      tion   
                                                    (N=134)      (N=134)      (N=132)  
        ———————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least      9 (6.7%)     2 (1.5%)     5 (3.8%) 
        one major protocol deviation related to                                        
        epidemic/pandemic                                                              
        Total number of major protocol                 9            2            6     
        deviations related to epidemic/pandemic                                        
        Site action due to epidemic/pandemic        8 (6.0%)     2 (1.5%)     5 (3.8%) 
          Significant deviation from planned        3 (2.2%)     1 (0.7%)     2 (1.5%) 
          dose                                                                         
          Dose missed or significantly out of       2 (1.5%)        0         1 (0.8%) 
          window                                                                       
          Failure to sign updated ICF within two    1 (0.7%)     1 (0.7%)     1 (0.8%) 
          visits                                                                       
          Missed 2 or more efficacy assessments     2 (1.5%)        0         1 (0.8%) 
        No Coding Available                         1 (0.7%)        0            0     
          No Coding Available                       1 (0.7%)        0            0     

