# lbt01 can handle n = 0 and outputs NE instead of infs and NAs

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                 A: Drug X   
                                               Value at Visit
                                                   (N=0)     
        —————————————————————————————————————————————————————
        Alanine Aminotransferase Measurement                 
          BASELINE                                           
            n                                        0       
            Mean (SD)                             NE (NE)    
            Median                                   NE      
            Min - Max                             NE - NE    
          WEEK 1 DAY 8                                       
            n                                        0       
            Mean (SD)                             NE (NE)    
            Median                                   NE      
            Min - Max                             NE - NE    

