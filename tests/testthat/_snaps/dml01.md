# dml01 works with adsl dataset

    Code
      cat(export_as_txt(res[1:50, ], lpp = 100))
    Output
      Study Identifier   Center/Patients ID               Age/Sex/Race                Age Group
      —————————————————————————————————————————————————————————————————————————————————————————
      AB12345            CHN-3/128            32/M/ASIAN                              <65      
                         CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN          <65      
                         RUS-3/378            30/F/ASIAN                              <65      
                         CHN-11/220           26/F/ASIAN                              <65      
                         CHN-7/267            40/M/ASIAN                              <65      
                         CHN-15/201           49/M/ASIAN                              <65      
                         USA-1/45             34/F/ASIAN                              <65      
                         USA-1/261            32/F/ASIAN                              <65      
                         NGA-11/173           24/F/BLACK OR AFRICAN AMERICAN          <65      
                         CHN-1/307            24/M/ASIAN                              <65      
                         CHN-7/28             40/M/AMERICAN INDIAN OR ALASKA NATIVE   <65      
                         CHN-4/73             24/F/ASIAN                              <65      
                         RUS-1/52             40/F/ASIAN                              <65      
                         PAK-11/268           28/F/BLACK OR AFRICAN AMERICAN          <65      
                         CHN-13/102           37/M/ASIAN                              <65      
                         CHN-17/84            40/F/ASIAN                              <65      
                         BRA-11/9             40/M/ASIAN                              <65      
                         CHN-4/115            38/M/ASIAN                              <65      
                         CHN-15/245           34/F/WHITE                              <65      
                         CHN-4/370            45/M/ASIAN                              <65      
                         RUS-4/6              44/F/ASIAN                              <65      
                         CHN-11/263           34/F/ASIAN                              <65      
                         PAK-2/191            38/F/AMERICAN INDIAN OR ALASKA NATIVE   <65      
                         CHN-13/240           42/M/ASIAN                              <65      
                         CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN          <65      
                         CHN-3/361            31/F/BLACK OR AFRICAN AMERICAN          <65      
                         RUS-13/70            39/F/WHITE                              <65      
                         CHN-17/309           36/F/ASIAN                              <65      
                         CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN          <65      
                         USA-1/242            30/F/WHITE                              <65      
                         USA-12/44            34/F/BLACK OR AFRICAN AMERICAN          <65      
                         CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN          <65      
                         BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN          <65      
                         PAK-1/95             28/F/ASIAN                              <65      
                         CHN-7/126            27/M/WHITE                              <65      
                         CHN-17/48            32/F/ASIAN                              <65      
                         USA-1/137            29/M/AMERICAN INDIAN OR ALASKA NATIVE   <65      
                         CHN-11/184           38/F/ASIAN                              <65      
                         CHN-14/1             27/F/ASIAN                              <65      
                         USA-15/127           57/F/ASIAN                              <65      
                         NGA-11/313           40/M/ASIAN                              <65      
                         USA-17/142           31/F/WHITE                              <65      
                         CHN-2/286            30/F/ASIAN                              <65      
                         USA-1/269            35/F/AMERICAN INDIAN OR ALASKA NATIVE   <65      
                         NGA-1/388            39/F/WHITE                              <65      
                         CHN-11/88            25/F/ASIAN                              <65      
                         CAN-1/341            43/F/ASIAN                              <65      
                         CHN-5/159            38/M/ASIAN                              <65      
                         PAK-1/280            30/M/ASIAN                              <65      
                         CHN-14/168           39/M/ASIAN                              <65      
      \s\nStudy Identifier         Ethnicity          Description of Planned Arm
      ——————————————————————————————————————————————————————————————————————
      AB12345            HISPANIC OR LATINO       A: Drug X                 
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   B: Placebo                
                         NOT HISPANIC OR LATINO   B: Placebo                
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   A: Drug X                 
                         NOT HISPANIC OR LATINO   B: Placebo                
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   B: Placebo                
                         NOT HISPANIC OR LATINO   B: Placebo                
                         NOT HISPANIC OR LATINO   A: Drug X                 
                         NOT HISPANIC OR LATINO   A: Drug X                 
                         NOT HISPANIC OR LATINO   A: Drug X                 
                         NOT HISPANIC OR LATINO   B: Placebo                
                         NOT REPORTED             C: Combination            
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   B: Placebo                
                         NOT HISPANIC OR LATINO   B: Placebo                
                         NOT HISPANIC OR LATINO   A: Drug X                 
                         NOT HISPANIC OR LATINO   A: Drug X                 
                         NOT HISPANIC OR LATINO   A: Drug X                 
                         NOT HISPANIC OR LATINO   A: Drug X                 
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT REPORTED             C: Combination            
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   A: Drug X                 
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   B: Placebo                
                         NOT HISPANIC OR LATINO   B: Placebo                
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   A: Drug X                 
                         NOT HISPANIC OR LATINO   B: Placebo                
                         NOT HISPANIC OR LATINO   B: Placebo                
                         NOT HISPANIC OR LATINO   A: Drug X                 
                         NOT HISPANIC OR LATINO   A: Drug X                 
                         NOT HISPANIC OR LATINO   B: Placebo                
                         HISPANIC OR LATINO       A: Drug X                 
                         NOT HISPANIC OR LATINO   A: Drug X                 
                         NOT HISPANIC OR LATINO   B: Placebo                
                         HISPANIC OR LATINO       C: Combination            
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   A: Drug X                 

# dml01 functions work as expected

    Code
      cat(export_as_txt(res[1:50, ], lpp = 100))
    Output
      Study Identifier   Center/Patients ID               Age/Sex/Race                Age Group
      —————————————————————————————————————————————————————————————————————————————————————————
      AB12345            CHN-3/128            32/M/ASIAN                              <65      
                         CHN-15/262           35/M/BLACK OR AFRICAN AMERICAN          <65      
                         RUS-3/378            30/F/ASIAN                              <65      
                         CHN-11/220           26/F/ASIAN                              <65      
                         CHN-7/267            40/M/ASIAN                              <65      
                         CHN-15/201           49/M/ASIAN                              <65      
                         USA-1/45             34/F/ASIAN                              <65      
                         USA-1/261            32/F/ASIAN                              <65      
                         NGA-11/173           24/F/BLACK OR AFRICAN AMERICAN          <65      
                         CHN-1/307            24/M/ASIAN                              <65      
                         CHN-7/28             40/M/AMERICAN INDIAN OR ALASKA NATIVE   <65      
                         CHN-4/73             24/F/ASIAN                              <65      
                         RUS-1/52             40/F/ASIAN                              <65      
                         PAK-11/268           28/F/BLACK OR AFRICAN AMERICAN          <65      
                         CHN-13/102           37/M/ASIAN                              <65      
                         CHN-17/84            40/F/ASIAN                              <65      
                         BRA-11/9             40/M/ASIAN                              <65      
                         CHN-4/115            38/M/ASIAN                              <65      
                         CHN-15/245           34/F/WHITE                              <65      
                         CHN-4/370            45/M/ASIAN                              <65      
                         RUS-4/6              44/F/ASIAN                              <65      
                         CHN-11/263           34/F/ASIAN                              <65      
                         PAK-2/191            38/F/AMERICAN INDIAN OR ALASKA NATIVE   <65      
                         CHN-13/240           42/M/ASIAN                              <65      
                         CHN-1/227            26/F/BLACK OR AFRICAN AMERICAN          <65      
                         CHN-3/361            31/F/BLACK OR AFRICAN AMERICAN          <65      
                         RUS-13/70            39/F/WHITE                              <65      
                         CHN-17/309           36/F/ASIAN                              <65      
                         CHN-2/395            28/M/BLACK OR AFRICAN AMERICAN          <65      
                         USA-1/242            30/F/WHITE                              <65      
                         USA-12/44            34/F/BLACK OR AFRICAN AMERICAN          <65      
                         CHN-1/64             34/F/BLACK OR AFRICAN AMERICAN          <65      
                         BRA-11/50            26/M/BLACK OR AFRICAN AMERICAN          <65      
                         PAK-1/95             28/F/ASIAN                              <65      
                         CHN-7/126            27/M/WHITE                              <65      
                         CHN-17/48            32/F/ASIAN                              <65      
                         USA-1/137            29/M/AMERICAN INDIAN OR ALASKA NATIVE   <65      
                         CHN-11/184           38/F/ASIAN                              <65      
                         CHN-14/1             27/F/ASIAN                              <65      
                         USA-15/127           57/F/ASIAN                              <65      
                         NGA-11/313           40/M/ASIAN                              <65      
                         USA-17/142           31/F/WHITE                              <65      
                         CHN-2/286            30/F/ASIAN                              <65      
                         USA-1/269            35/F/AMERICAN INDIAN OR ALASKA NATIVE   <65      
                         NGA-1/388            39/F/WHITE                              <65      
                         CHN-11/88            25/F/ASIAN                              <65      
                         CAN-1/341            43/F/ASIAN                              <65      
                         CHN-5/159            38/M/ASIAN                              <65      
                         PAK-1/280            30/M/ASIAN                              <65      
                         CHN-14/168           39/M/ASIAN                              <65      
      \s\nStudy Identifier         Ethnicity          Description of Planned Arm
      ——————————————————————————————————————————————————————————————————————
      AB12345            HISPANIC OR LATINO       A: Drug X                 
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   B: Placebo                
                         NOT HISPANIC OR LATINO   B: Placebo                
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   A: Drug X                 
                         NOT HISPANIC OR LATINO   B: Placebo                
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   B: Placebo                
                         NOT HISPANIC OR LATINO   B: Placebo                
                         NOT HISPANIC OR LATINO   A: Drug X                 
                         NOT HISPANIC OR LATINO   A: Drug X                 
                         NOT HISPANIC OR LATINO   A: Drug X                 
                         NOT HISPANIC OR LATINO   B: Placebo                
                         NOT REPORTED             C: Combination            
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   B: Placebo                
                         NOT HISPANIC OR LATINO   B: Placebo                
                         NOT HISPANIC OR LATINO   A: Drug X                 
                         NOT HISPANIC OR LATINO   A: Drug X                 
                         NOT HISPANIC OR LATINO   A: Drug X                 
                         NOT HISPANIC OR LATINO   A: Drug X                 
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT REPORTED             C: Combination            
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   A: Drug X                 
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   B: Placebo                
                         NOT HISPANIC OR LATINO   B: Placebo                
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   A: Drug X                 
                         NOT HISPANIC OR LATINO   B: Placebo                
                         NOT HISPANIC OR LATINO   B: Placebo                
                         NOT HISPANIC OR LATINO   A: Drug X                 
                         NOT HISPANIC OR LATINO   A: Drug X                 
                         NOT HISPANIC OR LATINO   B: Placebo                
                         HISPANIC OR LATINO       A: Drug X                 
                         NOT HISPANIC OR LATINO   A: Drug X                 
                         NOT HISPANIC OR LATINO   B: Placebo                
                         HISPANIC OR LATINO       C: Combination            
                         NOT HISPANIC OR LATINO   C: Combination            
                         NOT HISPANIC OR LATINO   A: Drug X                 

