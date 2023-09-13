# dsl02 works with adsl dataset

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                                                           
                                                                                                           
                                                                            Date of First     Day of Last  
                                                                              Study Drug       Study Drug  
      Center/Patient ID            Age/Sex/Race              Treatment      Administration   Administration
      —————————————————————————————————————————————————————————————————————————————————————————————————————
      CHN-1/id-62         36/F/WHITE                       A: Drug X        22NOV2020             455      
      CHN-11/id-91        44/M/BLACK OR AFRICAN AMERICAN   C: Combination   29MAY2020             625      
      CHN-9/id-11         28/F/ASIAN                       B: Placebo       27JAN2021             388      
      USA-11/id-100       40/F/ASIAN                       C: Combination   10MAR2020             705      
      USA-11/id-136       38/F/ASIAN                       C: Combination   02OCT2019             865      
      \s\n                      Day of Study                                        
                           Discontinuation     Day of Study                     
                          Relative to First   Discontinuation                   
                             Study Drug         Relative to        Reason for   
      Center/Patient ID    Administration      Randomization    Discontinuation 
      ——————————————————————————————————————————————————————————————————————————
      CHN-1/id-62                454                455         DEATH           
      CHN-11/id-91               625                626         DEATH           
      CHN-9/id-11                387                388         DEATH           
      USA-11/id-100              705                707         LACK OF EFFICACY
      USA-11/id-136              864                868         DEATH           

# dsl02 functions work as expected

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                                                           
                                                                                                           
                                                                            Date of First     Day of Last  
                                                                              Study Drug       Study Drug  
      Center/Patient ID            Age/Sex/Race              Treatment      Administration   Administration
      —————————————————————————————————————————————————————————————————————————————————————————————————————
      CHN-1/id-62         36/F/WHITE                       A: Drug X        22NOV2020             455      
      CHN-11/id-91        44/M/BLACK OR AFRICAN AMERICAN   C: Combination   29MAY2020             625      
      CHN-9/id-11         28/F/ASIAN                       B: Placebo       27JAN2021             388      
      USA-11/id-100       40/F/ASIAN                       C: Combination   10MAR2020             705      
      USA-11/id-136       38/F/ASIAN                       C: Combination   02OCT2019             865      
      \s\n                      Day of Study                                        
                           Discontinuation     Day of Study                     
                          Relative to First   Discontinuation                   
                             Study Drug         Relative to        Reason for   
      Center/Patient ID    Administration      Randomization    Discontinuation 
      ——————————————————————————————————————————————————————————————————————————
      CHN-1/id-62                454                455         DEATH           
      CHN-11/id-91               625                626         DEATH           
      CHN-9/id-11                387                388         DEATH           
      USA-11/id-100              705                707         LACK OF EFFICACY
      USA-11/id-136              864                868         DEATH           

