# dsl02 works with adsl dataset

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                                                            
                                                                                                            
                                                                             Date of First     Day of Last  
                                                                               Study Drug       Study Drug  
        Treatment      Center/Patients ID            Age/Sex/Race            Administration   Administration
      ——————————————————————————————————————————————————————————————————————————————————————————————————————
      A: Drug X        CHN-1/62             36/F/WHITE                       22NOV2020             455      
      B: Placebo       CHN-9/11             28/F/ASIAN                       27JAN2021             388      
      C: Combination   USA-11/136           38/F/ASIAN                       02OCT2019             865      
                       USA-11/100           40/F/ASIAN                       10MAR2020             705      
                       CHN-11/91            44/M/BLACK OR AFRICAN AMERICAN   29MAY2020             625      
      \s\n                   Day of Study                                        
                        Discontinuation     Day of Study                     
                       Relative to First   Discontinuation                   
                          Study Drug         Relative to        Reason for   
        Treatment       Administration      Randomization    Discontinuation 
      ———————————————————————————————————————————————————————————————————————
      A: Drug X               455                455         DEATH           
      B: Placebo              388                388         DEATH           
      C: Combination          865                868         DEATH           
                              705                707         LACK OF EFFICACY
                              625                626         DEATH           

# dsl02 functions work as expected

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                                                            
                                                                                                            
                                                                             Date of First     Day of Last  
                                                                               Study Drug       Study Drug  
        Treatment      Center/Patients ID            Age/Sex/Race            Administration   Administration
      ——————————————————————————————————————————————————————————————————————————————————————————————————————
      A: Drug X        CHN-1/62             36/F/WHITE                       22NOV2020             455      
      B: Placebo       CHN-9/11             28/F/ASIAN                       27JAN2021             388      
      C: Combination   USA-11/136           38/F/ASIAN                       02OCT2019             865      
                       USA-11/100           40/F/ASIAN                       10MAR2020             705      
                       CHN-11/91            44/M/BLACK OR AFRICAN AMERICAN   29MAY2020             625      
      \s\n                   Day of Study                                        
                        Discontinuation     Day of Study                     
                       Relative to First   Discontinuation                   
                          Study Drug         Relative to        Reason for   
        Treatment       Administration      Randomization    Discontinuation 
      ———————————————————————————————————————————————————————————————————————
      A: Drug X               455                455         DEATH           
      B: Placebo              388                388         DEATH           
      C: Combination          865                868         DEATH           
                              705                707         LACK OF EFFICACY
                              625                626         DEATH           

