# dsl01 works with adsl dataset

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                                    Date of First 
                                                                                      Study Drug  
        Treatment      Center/Patients ID               Age/Sex/Race                Administration
      ————————————————————————————————————————————————————————————————————————————————————————————
      A: Drug X        RUS-18/359           47/F/BLACK OR AFRICAN AMERICAN          08JUN2019     
                       BRA-1/42             36/M/BLACK OR AFRICAN AMERICAN          01JAN2020     
                       CHN-11/256           23/M/ASIAN                              17MAR2020     
                       CHN-1/26             29/M/WHITE                              16JUL2020     
                       CHN-1/62             36/F/WHITE                              22NOV2020     
      B: Placebo       CHN-7/28             40/M/AMERICAN INDIAN OR ALASKA NATIVE   11MAR2019     
                       CHN-13/102           37/M/ASIAN                              23MAR2019     
                       CHN-3/333            30/F/BLACK OR AFRICAN AMERICAN          13JAN2020     
                       USA-12/226           30/M/WHITE                              29JAN2020     
                       CHN-9/147            26/F/ASIAN                              06FEB2020     
                       USA-11/157           50/M/WHITE                              14JUN2020     
                       CHN-9/11             28/F/ASIAN                              27JAN2021     
      C: Combination   CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN          26FEB2019     
                       NGA-11/173           24/F/BLACK OR AFRICAN AMERICAN          10MAR2019     
                       CHN-11/263           34/F/ASIAN                              03APR2019     
                       PAK-2/191            38/F/AMERICAN INDIAN OR ALASKA NATIVE   07APR2019     
                       USA-11/136           38/F/ASIAN                              02OCT2019     
                       CHN-17/31            35/F/ASIAN                              17NOV2019     
                       BRA-11/237           64/F/ASIAN                              10MAR2020     
                       USA-11/100           40/F/ASIAN                              10MAR2020     
                       CHN-11/91            44/M/BLACK OR AFRICAN AMERICAN          29MAY2020     
                       CHN-11/349           40/M/ASIAN                              13NOV2020     
                       CHN-11/257           32/F/ASIAN                              15NOV2020     
      \s\n                                                  
                         Study Day       Discontinued   
        Treatment      of Withdrawal   Early from Study?
      ——————————————————————————————————————————————————
      A: Drug X            1096        No               
                            NA         No               
                           1096        No               
                           1096        No               
                            455        Yes              
      B: Placebo           1096        No               
                           1096        No               
                            NA         No               
                            NA         No               
                            NA         No               
                           1096        No               
                            388        Yes              
      C: Combination       1096        No               
                           1096        No               
                           1096        No               
                           1096        No               
                            865        Yes              
                            NA         No               
                           1096        No               
                            705        Yes              
                            625        Yes              
                           1096        No               
                           1096        No               

# dsl01 functions work as expected

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                                    Date of First 
                                                                                      Study Drug  
        Treatment      Center/Patients ID               Age/Sex/Race                Administration
      ————————————————————————————————————————————————————————————————————————————————————————————
      A: Drug X        RUS-18/359           47/F/BLACK OR AFRICAN AMERICAN          08JUN2019     
                       BRA-1/42             36/M/BLACK OR AFRICAN AMERICAN          01JAN2020     
                       CHN-11/256           23/M/ASIAN                              17MAR2020     
                       CHN-1/26             29/M/WHITE                              16JUL2020     
                       CHN-1/62             36/F/WHITE                              22NOV2020     
      B: Placebo       CHN-7/28             40/M/AMERICAN INDIAN OR ALASKA NATIVE   11MAR2019     
                       CHN-13/102           37/M/ASIAN                              23MAR2019     
                       CHN-3/333            30/F/BLACK OR AFRICAN AMERICAN          13JAN2020     
                       USA-12/226           30/M/WHITE                              29JAN2020     
                       CHN-9/147            26/F/ASIAN                              06FEB2020     
                       USA-11/157           50/M/WHITE                              14JUN2020     
                       CHN-9/11             28/F/ASIAN                              27JAN2021     
      C: Combination   CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN          26FEB2019     
                       NGA-11/173           24/F/BLACK OR AFRICAN AMERICAN          10MAR2019     
                       CHN-11/263           34/F/ASIAN                              03APR2019     
                       PAK-2/191            38/F/AMERICAN INDIAN OR ALASKA NATIVE   07APR2019     
                       USA-11/136           38/F/ASIAN                              02OCT2019     
                       CHN-17/31            35/F/ASIAN                              17NOV2019     
                       BRA-11/237           64/F/ASIAN                              10MAR2020     
                       USA-11/100           40/F/ASIAN                              10MAR2020     
                       CHN-11/91            44/M/BLACK OR AFRICAN AMERICAN          29MAY2020     
                       CHN-11/349           40/M/ASIAN                              13NOV2020     
                       CHN-11/257           32/F/ASIAN                              15NOV2020     
      \s\n                                                  
                         Study Day       Discontinued   
        Treatment      of Withdrawal   Early from Study?
      ——————————————————————————————————————————————————
      A: Drug X            1096        No               
                            NA         No               
                           1096        No               
                           1096        No               
                            455        Yes              
      B: Placebo           1096        No               
                           1096        No               
                            NA         No               
                            NA         No               
                            NA         No               
                           1096        No               
                            388        Yes              
      C: Combination       1096        No               
                           1096        No               
                           1096        No               
                           1096        No               
                            865        Yes              
                            NA         No               
                           1096        No               
                            705        Yes              
                            625        Yes              
                           1096        No               
                           1096        No               

