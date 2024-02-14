# pdt02 function with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100, colwidths = c(40, 10, 10, 10)))
    Output
                                                                             C: Combina
        Primary Reason                             A: Drug X    B: Placebo      tion   
          Description                                (N=15)       (N=15)       (N=15)  
        ———————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least      1 (6.7%)        0            0     
        one major protocol deviation related to                                        
        epidemic/pandemic                                                              
        Total number of major protocol                 1            0            0     
        deviations related to epidemic/pandemic                                        
        Site action due to epidemic/pandemic        1 (6.7%)        0            0     
          Failure to sign updated ICF within two    1 (6.7%)        0            0     
          visits                                                                       

# pdt02 can handle all NA values

    Code
      cat(export_as_txt(res, lpp = 100, colwidths = c(40, 10, 10, 10)))
    Output
                                                                             C: Combina
        Primary Reason                             A: Drug X    B: Placebo      tion   
          Description                                (N=15)       (N=15)       (N=15)  
        ———————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least      1 (6.7%)        0            0     
        one major protocol deviation related to                                        
        epidemic/pandemic                                                              
        Total number of major protocol                 1            0            0     
        deviations related to epidemic/pandemic                                        
        No Coding Available                         1 (6.7%)        0            0     
          No Coding Available                       1 (6.7%)        0            0     

# pdt02 can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100, colwidths = c(40, 10, 10, 10)))
    Output
                                                                             C: Combina
        Primary Reason                             A: Drug X    B: Placebo      tion   
          Description                                (N=15)       (N=15)       (N=15)  
        ———————————————————————————————————————————————————————————————————————————————
        Total number of patients with at least      1 (6.7%)        0            0     
        one major protocol deviation related to                                        
        epidemic/pandemic                                                              
        Total number of major protocol                 1            0            0     
        deviations related to epidemic/pandemic                                        
        No Coding Available                         1 (6.7%)        0            0     
          No Coding Available                       1 (6.7%)        0            0     

