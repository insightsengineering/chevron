# dsl01 works with adsl dataset

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                                    Date of First 
                                                                                      Study Drug  
      Center/Patients ID               Age/Sex/Race                  Treatment      Administration
      ————————————————————————————————————————————————————————————————————————————————————————————
      BRA-1/id-42          36/M/BLACK OR AFRICAN AMERICAN          A: Drug X        01JAN2020     
      BRA-11/id-237        64/F/ASIAN                              C: Combination   10MAR2020     
      CHN-1/id-26          29/M/WHITE                              A: Drug X        16JUL2020     
      CHN-1/id-62          36/F/WHITE                              A: Drug X        22NOV2020     
      CHN-11/id-256        23/M/ASIAN                              A: Drug X        17MAR2020     
      CHN-11/id-257        32/F/ASIAN                              C: Combination   15NOV2020     
      CHN-11/id-263        34/F/ASIAN                              C: Combination   03APR2019     
      CHN-11/id-349        40/M/ASIAN                              C: Combination   13NOV2020     
      CHN-11/id-91         44/M/BLACK OR AFRICAN AMERICAN          C: Combination   29MAY2020     
      CHN-13/id-102        37/M/ASIAN                              B: Placebo       23MAR2019     
      CHN-15/id-262        35/M/BLACK OR AFRICAN AMERICAN          C: Combination   26FEB2019     
      CHN-17/id-31         35/F/ASIAN                              C: Combination   17NOV2019     
      CHN-3/id-333         30/F/BLACK OR AFRICAN AMERICAN          B: Placebo       13JAN2020     
      CHN-7/id-28          40/M/AMERICAN INDIAN OR ALASKA NATIVE   B: Placebo       11MAR2019     
      CHN-9/id-11          28/F/ASIAN                              B: Placebo       27JAN2021     
      CHN-9/id-147         26/F/ASIAN                              B: Placebo       06FEB2020     
      NGA-11/id-173        24/F/BLACK OR AFRICAN AMERICAN          C: Combination   10MAR2019     
      PAK-2/id-191         38/F/AMERICAN INDIAN OR ALASKA NATIVE   C: Combination   07APR2019     
      RUS-18/id-359        47/F/BLACK OR AFRICAN AMERICAN          A: Drug X        08JUN2019     
      USA-11/id-100        40/F/ASIAN                              C: Combination   10MAR2020     
      USA-11/id-136        38/F/ASIAN                              C: Combination   02OCT2019     
      USA-11/id-157        50/M/WHITE                              B: Placebo       14JUN2020     
      USA-12/id-226        30/M/WHITE                              B: Placebo       29JAN2020     
      \s\n                                                      
                             Study Day       Discontinued   
      Center/Patients ID   of Withdrawal   Early from Study?
      ——————————————————————————————————————————————————————
      BRA-1/id-42               NA         No               
      BRA-11/id-237            1096        No               
      CHN-1/id-26              1096        No               
      CHN-1/id-62               455        Yes              
      CHN-11/id-256            1096        No               
      CHN-11/id-257            1096        No               
      CHN-11/id-263            1096        No               
      CHN-11/id-349            1096        No               
      CHN-11/id-91              625        Yes              
      CHN-13/id-102            1096        No               
      CHN-15/id-262            1096        No               
      CHN-17/id-31              NA         No               
      CHN-3/id-333              NA         No               
      CHN-7/id-28              1096        No               
      CHN-9/id-11               388        Yes              
      CHN-9/id-147              NA         No               
      NGA-11/id-173            1096        No               
      PAK-2/id-191             1096        No               
      RUS-18/id-359            1096        No               
      USA-11/id-100             705        Yes              
      USA-11/id-136             865        Yes              
      USA-11/id-157            1096        No               
      USA-12/id-226             NA         No               

# dsl01 functions work as expected

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                                                    Date of First 
                                                                                      Study Drug  
      Center/Patients ID               Age/Sex/Race                  Treatment      Administration
      ————————————————————————————————————————————————————————————————————————————————————————————
      BRA-1/id-42          36/M/BLACK OR AFRICAN AMERICAN          A: Drug X        01JAN2020     
      BRA-11/id-237        64/F/ASIAN                              C: Combination   10MAR2020     
      CHN-1/id-26          29/M/WHITE                              A: Drug X        16JUL2020     
      CHN-1/id-62          36/F/WHITE                              A: Drug X        22NOV2020     
      CHN-11/id-256        23/M/ASIAN                              A: Drug X        17MAR2020     
      CHN-11/id-257        32/F/ASIAN                              C: Combination   15NOV2020     
      CHN-11/id-263        34/F/ASIAN                              C: Combination   03APR2019     
      CHN-11/id-349        40/M/ASIAN                              C: Combination   13NOV2020     
      CHN-11/id-91         44/M/BLACK OR AFRICAN AMERICAN          C: Combination   29MAY2020     
      CHN-13/id-102        37/M/ASIAN                              B: Placebo       23MAR2019     
      CHN-15/id-262        35/M/BLACK OR AFRICAN AMERICAN          C: Combination   26FEB2019     
      CHN-17/id-31         35/F/ASIAN                              C: Combination   17NOV2019     
      CHN-3/id-333         30/F/BLACK OR AFRICAN AMERICAN          B: Placebo       13JAN2020     
      CHN-7/id-28          40/M/AMERICAN INDIAN OR ALASKA NATIVE   B: Placebo       11MAR2019     
      CHN-9/id-11          28/F/ASIAN                              B: Placebo       27JAN2021     
      CHN-9/id-147         26/F/ASIAN                              B: Placebo       06FEB2020     
      NGA-11/id-173        24/F/BLACK OR AFRICAN AMERICAN          C: Combination   10MAR2019     
      PAK-2/id-191         38/F/AMERICAN INDIAN OR ALASKA NATIVE   C: Combination   07APR2019     
      RUS-18/id-359        47/F/BLACK OR AFRICAN AMERICAN          A: Drug X        08JUN2019     
      USA-11/id-100        40/F/ASIAN                              C: Combination   10MAR2020     
      USA-11/id-136        38/F/ASIAN                              C: Combination   02OCT2019     
      USA-11/id-157        50/M/WHITE                              B: Placebo       14JUN2020     
      USA-12/id-226        30/M/WHITE                              B: Placebo       29JAN2020     
      \s\n                                                      
                             Study Day       Discontinued   
      Center/Patients ID   of Withdrawal   Early from Study?
      ——————————————————————————————————————————————————————
      BRA-1/id-42               NA         No               
      BRA-11/id-237            1096        No               
      CHN-1/id-26              1096        No               
      CHN-1/id-62               455        Yes              
      CHN-11/id-256            1096        No               
      CHN-11/id-257            1096        No               
      CHN-11/id-263            1096        No               
      CHN-11/id-349            1096        No               
      CHN-11/id-91              625        Yes              
      CHN-13/id-102            1096        No               
      CHN-15/id-262            1096        No               
      CHN-17/id-31              NA         No               
      CHN-3/id-333              NA         No               
      CHN-7/id-28              1096        No               
      CHN-9/id-11               388        Yes              
      CHN-9/id-147              NA         No               
      NGA-11/id-173            1096        No               
      PAK-2/id-191             1096        No               
      RUS-18/id-359            1096        No               
      USA-11/id-100             705        Yes              
      USA-11/id-136             865        Yes              
      USA-11/id-157            1096        No               
      USA-12/id-226             NA         No               

