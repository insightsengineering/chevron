# dml01 works with adsl dataset

    Code
      cat(export_as_txt(res[1:50, ], lpp = 100))
    Output
      Treatment   Center/Patient ID               Age/Sex/Race                      Ethnicity       
      ——————————————————————————————————————————————————————————————————————————————————————————————
      A: Drug X   CHN-3/128           32/M/ASIAN                              HISPANIC OR LATINO    
                  USA-1/45            34/F/ASIAN                              NOT HISPANIC OR LATINO
                  CHN-4/73            24/F/ASIAN                              NOT HISPANIC OR LATINO
                  RUS-1/52            40/F/ASIAN                              NOT HISPANIC OR LATINO
                  PAK-11/268          28/F/BLACK OR AFRICAN AMERICAN          NOT HISPANIC OR LATINO
                  CHN-3/361           31/F/BLACK OR AFRICAN AMERICAN          NOT HISPANIC OR LATINO
                  RUS-13/70           39/F/WHITE                              NOT HISPANIC OR LATINO
                  CHN-17/309          36/F/ASIAN                              NOT HISPANIC OR LATINO
                  CHN-2/395           28/M/BLACK OR AFRICAN AMERICAN          NOT HISPANIC OR LATINO
                  BRA-11/50           26/M/BLACK OR AFRICAN AMERICAN          NOT HISPANIC OR LATINO
                  CHN-14/1            27/F/ASIAN                              NOT HISPANIC OR LATINO
                  USA-17/142          31/F/WHITE                              NOT HISPANIC OR LATINO
                  CHN-2/286           30/F/ASIAN                              NOT HISPANIC OR LATINO
                  NGA-1/388           39/F/WHITE                              HISPANIC OR LATINO    
                  CHN-11/88           25/F/ASIAN                              NOT HISPANIC OR LATINO
                  CHN-14/168          39/M/ASIAN                              NOT HISPANIC OR LATINO
                  PAK-11/68           37/F/ASIAN                              UNKNOWN               
                  RUS-18/359          47/F/BLACK OR AFRICAN AMERICAN          NOT HISPANIC OR LATINO
                  PAK-1/148           46/M/AMERICAN INDIAN OR ALASKA NATIVE   NOT HISPANIC OR LATINO
                  CAN-14/104          39/F/BLACK OR AFRICAN AMERICAN          NOT REPORTED          
                  CHN-1/329           48/M/WHITE                              NOT HISPANIC OR LATINO
                  CHN-1/235           39/M/ASIAN                              NOT HISPANIC OR LATINO
                  CHN-11/124          41/M/ASIAN                              NOT HISPANIC OR LATINO
                  PAK-14/117          25/F/ASIAN                              NOT HISPANIC OR LATINO
                  CHN-11/379          36/F/BLACK OR AFRICAN AMERICAN          NOT HISPANIC OR LATINO
                  CHN-3/204           34/M/ASIAN                              NOT HISPANIC OR LATINO
                  CHN-13/270          39/F/ASIAN                              UNKNOWN               
                  CHN-4/114           23/F/ASIAN                              NOT HISPANIC OR LATINO
                  CHN-1/315           32/M/ASIAN                              NOT HISPANIC OR LATINO
                  NGA-1/200           25/F/ASIAN                              NOT HISPANIC OR LATINO
                  PAK-12/328          21/F/WHITE                              NOT HISPANIC OR LATINO
                  CHN-5/108           28/F/BLACK OR AFRICAN AMERICAN          NOT HISPANIC OR LATINO
                  NGA-17/72           50/M/WHITE                              NOT HISPANIC OR LATINO
                  CHN-14/161          33/F/ASIAN                              NOT HISPANIC OR LATINO
                  PAK-15/314          27/F/ASIAN                              HISPANIC OR LATINO    
                  CHN-17/182          37/M/BLACK OR AFRICAN AMERICAN          NOT HISPANIC OR LATINO
                  CHN-12/396          25/F/ASIAN                              NOT HISPANIC OR LATINO
                  CHN-11/392          39/M/ASIAN                              NOT HISPANIC OR LATINO
                  BRA-11/217          43/M/ASIAN                              NOT HISPANIC OR LATINO
                  CHN-15/14           38/F/BLACK OR AFRICAN AMERICAN          NOT HISPANIC OR LATINO
                  JPN-1/218           35/F/BLACK OR AFRICAN AMERICAN          NOT HISPANIC OR LATINO
                  CHN-12/57           45/F/BLACK OR AFRICAN AMERICAN          NOT HISPANIC OR LATINO
                  CHN-2/274           40/F/ASIAN                              NOT HISPANIC OR LATINO
                  CHN-15/399          33/F/WHITE                              NOT REPORTED          
                  CHN-14/228          30/M/ASIAN                              UNKNOWN               
                  USA-11/339          39/F/WHITE                              NOT HISPANIC OR LATINO
                  CHN-2/398           46/F/AMERICAN INDIAN OR ALASKA NATIVE   NOT HISPANIC OR LATINO
                  CHN-12/266          32/F/BLACK OR AFRICAN AMERICAN          NOT HISPANIC OR LATINO
                  JPN-5/326           34/F/ASIAN                              NOT HISPANIC OR LATINO
                  BRA-14/23           37/M/ASIAN                              NOT HISPANIC OR LATINO

# dml01 functions work as expected

    Code
      cat(export_as_txt(res[1:50, ], lpp = 100))
    Output
      Treatment   Center/Patient ID               Age/Sex/Race                      Ethnicity       
      ——————————————————————————————————————————————————————————————————————————————————————————————
      A: Drug X   CHN-3/128           32/M/ASIAN                              HISPANIC OR LATINO    
                  USA-1/45            34/F/ASIAN                              NOT HISPANIC OR LATINO
                  CHN-4/73            24/F/ASIAN                              NOT HISPANIC OR LATINO
                  RUS-1/52            40/F/ASIAN                              NOT HISPANIC OR LATINO
                  PAK-11/268          28/F/BLACK OR AFRICAN AMERICAN          NOT HISPANIC OR LATINO
                  CHN-3/361           31/F/BLACK OR AFRICAN AMERICAN          NOT HISPANIC OR LATINO
                  RUS-13/70           39/F/WHITE                              NOT HISPANIC OR LATINO
                  CHN-17/309          36/F/ASIAN                              NOT HISPANIC OR LATINO
                  CHN-2/395           28/M/BLACK OR AFRICAN AMERICAN          NOT HISPANIC OR LATINO
                  BRA-11/50           26/M/BLACK OR AFRICAN AMERICAN          NOT HISPANIC OR LATINO
                  CHN-14/1            27/F/ASIAN                              NOT HISPANIC OR LATINO
                  USA-17/142          31/F/WHITE                              NOT HISPANIC OR LATINO
                  CHN-2/286           30/F/ASIAN                              NOT HISPANIC OR LATINO
                  NGA-1/388           39/F/WHITE                              HISPANIC OR LATINO    
                  CHN-11/88           25/F/ASIAN                              NOT HISPANIC OR LATINO
                  CHN-14/168          39/M/ASIAN                              NOT HISPANIC OR LATINO
                  PAK-11/68           37/F/ASIAN                              UNKNOWN               
                  RUS-18/359          47/F/BLACK OR AFRICAN AMERICAN          NOT HISPANIC OR LATINO
                  PAK-1/148           46/M/AMERICAN INDIAN OR ALASKA NATIVE   NOT HISPANIC OR LATINO
                  CAN-14/104          39/F/BLACK OR AFRICAN AMERICAN          NOT REPORTED          
                  CHN-1/329           48/M/WHITE                              NOT HISPANIC OR LATINO
                  CHN-1/235           39/M/ASIAN                              NOT HISPANIC OR LATINO
                  CHN-11/124          41/M/ASIAN                              NOT HISPANIC OR LATINO
                  PAK-14/117          25/F/ASIAN                              NOT HISPANIC OR LATINO
                  CHN-11/379          36/F/BLACK OR AFRICAN AMERICAN          NOT HISPANIC OR LATINO
                  CHN-3/204           34/M/ASIAN                              NOT HISPANIC OR LATINO
                  CHN-13/270          39/F/ASIAN                              UNKNOWN               
                  CHN-4/114           23/F/ASIAN                              NOT HISPANIC OR LATINO
                  CHN-1/315           32/M/ASIAN                              NOT HISPANIC OR LATINO
                  NGA-1/200           25/F/ASIAN                              NOT HISPANIC OR LATINO
                  PAK-12/328          21/F/WHITE                              NOT HISPANIC OR LATINO
                  CHN-5/108           28/F/BLACK OR AFRICAN AMERICAN          NOT HISPANIC OR LATINO
                  NGA-17/72           50/M/WHITE                              NOT HISPANIC OR LATINO
                  CHN-14/161          33/F/ASIAN                              NOT HISPANIC OR LATINO
                  PAK-15/314          27/F/ASIAN                              HISPANIC OR LATINO    
                  CHN-17/182          37/M/BLACK OR AFRICAN AMERICAN          NOT HISPANIC OR LATINO
                  CHN-12/396          25/F/ASIAN                              NOT HISPANIC OR LATINO
                  CHN-11/392          39/M/ASIAN                              NOT HISPANIC OR LATINO
                  BRA-11/217          43/M/ASIAN                              NOT HISPANIC OR LATINO
                  CHN-15/14           38/F/BLACK OR AFRICAN AMERICAN          NOT HISPANIC OR LATINO
                  JPN-1/218           35/F/BLACK OR AFRICAN AMERICAN          NOT HISPANIC OR LATINO
                  CHN-12/57           45/F/BLACK OR AFRICAN AMERICAN          NOT HISPANIC OR LATINO
                  CHN-2/274           40/F/ASIAN                              NOT HISPANIC OR LATINO
                  CHN-15/399          33/F/WHITE                              NOT REPORTED          
                  CHN-14/228          30/M/ASIAN                              UNKNOWN               
                  USA-11/339          39/F/WHITE                              NOT HISPANIC OR LATINO
                  CHN-2/398           46/F/AMERICAN INDIAN OR ALASKA NATIVE   NOT HISPANIC OR LATINO
                  CHN-12/266          32/F/BLACK OR AFRICAN AMERICAN          NOT HISPANIC OR LATINO
                  JPN-5/326           34/F/ASIAN                              NOT HISPANIC OR LATINO
                  BRA-14/23           37/M/ASIAN                              NOT HISPANIC OR LATINO

