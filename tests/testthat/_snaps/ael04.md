# ael04 works with adsl dataset

    Code
      cat(export_as_txt(res, lpp = 100, cpp = 110))
    Output
      ACTARM: C: Combination
      
      ——————————————————————————————————————————————————————————————————————————————————————————————————
                                             Date of                                                    
                                           First Study      Day of Last                                 
                                               Drug          Study Drug     Day of                      
      Center/Patients ID   Age/Sex/Race   Administration   Administration   Death      Cause of Death   
      ——————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/9             40/M/ASIAN     26MAR2019             1056         1091    DISEASE PROGRESSION
      CHN-15/201           49/M/ASIAN     05MAR2019             1082         1085    ADVERSE EVENT      
      CHN-15/245           34/F/WHITE     29MAR2019             1057         1057    DISEASE PROGRESSION
      \s\nACTARM: C: Combination
      
      ———————————————————————————————
                                     
                                     
                            Autopsy  
      Center/Patients ID   Performed?
      ———————————————————————————————
      BRA-11/9             Yes       
      CHN-15/201           Yes       
      CHN-15/245           Yes       
      \s\nACTARM: B: Placebo
      
      —————————————————————————————————————————————————————————————————————————————————————————————————————————————
                                             Date of                                                               
                                           First Study      Day of Last                                            
                                               Drug          Study Drug     Day of                        Autopsy  
      Center/Patients ID   Age/Sex/Race   Administration   Administration   Death     Cause of Death     Performed?
      —————————————————————————————————————————————————————————————————————————————————————————————————————————————
      CAN-1/341            43/F/ASIAN     23MAY2019             998          1014    SUICIDE             Yes       
      CHN-1/307            24/M/ASIAN     11MAR2019             1076         1122    LOST TO FOLLOW UP   <Missing> 
      CHN-13/240           42/M/ASIAN     08APR2019             1044         1087    ADVERSE EVENT       Yes       
      CHN-7/126            27/M/WHITE     02MAY2019             1025         1066    ADVERSE EVENT       Yes       
      \s\nACTARM: A: Drug X
      
      ——————————————————————————————————————————————————————————————————————————————————————————————————
                                             Date of                                                    
                                           First Study      Day of Last                                 
                                               Drug          Study Drug     Day of                      
      Center/Patients ID   Age/Sex/Race   Administration   Administration   Death      Cause of Death   
      ——————————————————————————————————————————————————————————————————————————————————————————————————
      CHN-3/128            32/M/ASIAN     24FEB2019             1084         1106    ADVERSE EVENT      
      RUS-1/52             40/F/ASIAN     18MAR2019             1064         1070    DISEASE PROGRESSION
      \s\nACTARM: A: Drug X
      
      ———————————————————————————————
                                     
                                     
                            Autopsy  
      Center/Patients ID   Performed?
      ———————————————————————————————
      CHN-3/128            Yes       
      RUS-1/52             Yes       

# ael04 can handle all missing values

    Code
      cat(export_as_txt(res, lpp = 100, cpp = 110))
    Output
      ACTARM: <Missing>
      
      ——————————————————————————————————————————————————————————————————————————————————————————————————————————
                                             Date of                                                            
                                           First Study      Day of Last                                         
                                               Drug          Study Drug     Day of                     Autopsy  
      Center/Patients ID   Age/Sex/Race   Administration   Administration   Death    Cause of Death   Performed?
      ——————————————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/9             40/M/ASIAN     26MAR2019             1056         1091    <Missing>        Yes       
      CAN-1/341            43/F/ASIAN     23MAY2019             998          1014    <Missing>        Yes       
      CHN-1/307            24/M/ASIAN     11MAR2019             1076         1122    <Missing>        <Missing> 
      CHN-13/240           42/M/ASIAN     08APR2019             1044         1087    <Missing>        Yes       
      CHN-15/201           49/M/ASIAN     05MAR2019             1082         1085    <Missing>        Yes       
      CHN-15/245           34/F/WHITE     29MAR2019             1057         1057    <Missing>        Yes       
      CHN-3/128            32/M/ASIAN     24FEB2019             1084         1106    <Missing>        Yes       
      CHN-7/126            27/M/WHITE     02MAY2019             1025         1066    <Missing>        Yes       
      RUS-1/52             40/F/ASIAN     18MAR2019             1064         1070    <Missing>        Yes       

# ael04 functions work as expected

    Code
      cat(export_as_txt(res, lpp = 100, cpp = 110))
    Output
      ACTARM: C: Combination
      
      ——————————————————————————————————————————————————————————————————————————————————————————————————
                                             Date of                                                    
                                           First Study      Day of Last                                 
                                               Drug          Study Drug     Day of                      
      Center/Patients ID   Age/Sex/Race   Administration   Administration   Death      Cause of Death   
      ——————————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/9             40/M/ASIAN     26MAR2019             1056         1091    DISEASE PROGRESSION
      CHN-15/201           49/M/ASIAN     05MAR2019             1082         1085    ADVERSE EVENT      
      CHN-15/245           34/F/WHITE     29MAR2019             1057         1057    DISEASE PROGRESSION
      \s\nACTARM: C: Combination
      
      ———————————————————————————————
                                     
                                     
                            Autopsy  
      Center/Patients ID   Performed?
      ———————————————————————————————
      BRA-11/9             Yes       
      CHN-15/201           Yes       
      CHN-15/245           Yes       
      \s\nACTARM: B: Placebo
      
      —————————————————————————————————————————————————————————————————————————————————————————————————————————————
                                             Date of                                                               
                                           First Study      Day of Last                                            
                                               Drug          Study Drug     Day of                        Autopsy  
      Center/Patients ID   Age/Sex/Race   Administration   Administration   Death     Cause of Death     Performed?
      —————————————————————————————————————————————————————————————————————————————————————————————————————————————
      CAN-1/341            43/F/ASIAN     23MAY2019             998          1014    SUICIDE             Yes       
      CHN-1/307            24/M/ASIAN     11MAR2019             1076         1122    LOST TO FOLLOW UP   <Missing> 
      CHN-13/240           42/M/ASIAN     08APR2019             1044         1087    ADVERSE EVENT       Yes       
      CHN-7/126            27/M/WHITE     02MAY2019             1025         1066    ADVERSE EVENT       Yes       
      \s\nACTARM: A: Drug X
      
      ——————————————————————————————————————————————————————————————————————————————————————————————————
                                             Date of                                                    
                                           First Study      Day of Last                                 
                                               Drug          Study Drug     Day of                      
      Center/Patients ID   Age/Sex/Race   Administration   Administration   Death      Cause of Death   
      ——————————————————————————————————————————————————————————————————————————————————————————————————
      CHN-3/128            32/M/ASIAN     24FEB2019             1084         1106    ADVERSE EVENT      
      RUS-1/52             40/F/ASIAN     18MAR2019             1064         1070    DISEASE PROGRESSION
      \s\nACTARM: A: Drug X
      
      ———————————————————————————————
                                     
                                     
                            Autopsy  
      Center/Patients ID   Performed?
      ———————————————————————————————
      CHN-3/128            Yes       
      RUS-1/52             Yes       

