# ael04 works with adsl dataset

    Code
      cat(export_as_txt(res, lpp = 100))
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
      
      ————————————————————————————————————————————————————————————————————————————————————————————————
                                             Date of                                                  
                                           First Study      Day of Last                               
                                               Drug          Study Drug     Day of                    
      Center/Patients ID   Age/Sex/Race   Administration   Administration   Death     Cause of Death  
      ————————————————————————————————————————————————————————————————————————————————————————————————
      CAN-1/341            43/F/ASIAN     23MAY2019             998          1014    SUICIDE          
      CHN-1/307            24/M/ASIAN     11MAR2019             1076         1122    LOST TO FOLLOW UP
      CHN-13/240           42/M/ASIAN     08APR2019             1044         1087    ADVERSE EVENT    
      CHN-7/126            27/M/WHITE     02MAY2019             1025         1066    ADVERSE EVENT    
      \s\nACTARM: B: Placebo
      
      ———————————————————————————————
                                     
                                     
                            Autopsy  
      Center/Patients ID   Performed?
      ———————————————————————————————
      CAN-1/341            Yes       
      CHN-1/307            <Missing> 
      CHN-13/240           Yes       
      CHN-7/126            Yes       
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
      cat(export_as_txt(res, lpp = 100))
    Output
      ACTARM: <Missing>
      
      —————————————————————————————————————————————————————————————————————————————————————————————
                                             Date of                                               
                                           First Study      Day of Last                            
                                               Drug          Study Drug     Day of                 
      Center/Patients ID   Age/Sex/Race   Administration   Administration   Death    Cause of Death
      —————————————————————————————————————————————————————————————————————————————————————————————
      BRA-11/9             40/M/ASIAN     26MAR2019             1056         1091    <Missing>     
      CAN-1/341            43/F/ASIAN     23MAY2019             998          1014    <Missing>     
      CHN-1/307            24/M/ASIAN     11MAR2019             1076         1122    <Missing>     
      CHN-13/240           42/M/ASIAN     08APR2019             1044         1087    <Missing>     
      CHN-15/201           49/M/ASIAN     05MAR2019             1082         1085    <Missing>     
      CHN-15/245           34/F/WHITE     29MAR2019             1057         1057    <Missing>     
      CHN-3/128            32/M/ASIAN     24FEB2019             1084         1106    <Missing>     
      CHN-7/126            27/M/WHITE     02MAY2019             1025         1066    <Missing>     
      RUS-1/52             40/F/ASIAN     18MAR2019             1064         1070    <Missing>     
      \s\nACTARM: <Missing>
      
      ———————————————————————————————
                                     
                                     
                            Autopsy  
      Center/Patients ID   Performed?
      ———————————————————————————————
      BRA-11/9             Yes       
      CAN-1/341            Yes       
      CHN-1/307            <Missing> 
      CHN-13/240           Yes       
      CHN-15/201           Yes       
      CHN-15/245           Yes       
      CHN-3/128            Yes       
      CHN-7/126            Yes       
      RUS-1/52             Yes       

# ael04 functions work as expected

    Code
      cat(export_as_txt(res, lpp = 100))
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
      
      ————————————————————————————————————————————————————————————————————————————————————————————————
                                             Date of                                                  
                                           First Study      Day of Last                               
                                               Drug          Study Drug     Day of                    
      Center/Patients ID   Age/Sex/Race   Administration   Administration   Death     Cause of Death  
      ————————————————————————————————————————————————————————————————————————————————————————————————
      CAN-1/341            43/F/ASIAN     23MAY2019             998          1014    SUICIDE          
      CHN-1/307            24/M/ASIAN     11MAR2019             1076         1122    LOST TO FOLLOW UP
      CHN-13/240           42/M/ASIAN     08APR2019             1044         1087    ADVERSE EVENT    
      CHN-7/126            27/M/WHITE     02MAY2019             1025         1066    ADVERSE EVENT    
      \s\nACTARM: B: Placebo
      
      ———————————————————————————————
                                     
                                     
                            Autopsy  
      Center/Patients ID   Performed?
      ———————————————————————————————
      CAN-1/341            Yes       
      CHN-1/307            <Missing> 
      CHN-13/240           Yes       
      CHN-7/126            Yes       
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

