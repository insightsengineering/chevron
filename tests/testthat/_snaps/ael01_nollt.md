# ael01_nollt works with admh dataset

    Code
      res
    Output
                                                          Investigator-Specified
      MedDRA System Organ Class   MedDRA Preferred Term    Medical History Term 
      ——————————————————————————————————————————————————————————————————————————
      cl A                        trm A_1/2                     trm A_1/2       
                                  trm A_2/2                     trm A_2/2       
      cl B                        trm B_1/3                     trm B_1/3       
                                  trm B_2/3                     trm B_2/3       
                                  trm B_3/3                     trm B_3/3       
      cl C                        trm C_1/2                     trm C_1/2       
                                  trm C_2/2                     trm C_2/2       
      cl D                        trm D_1/3                     trm D_1/3       
                                  trm D_2/3                     trm D_2/3       
                                  trm D_3/3                     trm D_3/3       

# ael01_nollt can handle all missing values

    Code
      res
    Output
                                                          Investigator-Specified
      MedDRA System Organ Class   MedDRA Preferred Term     Adverse Event Term  
      ——————————————————————————————————————————————————————————————————————————
      No Coding Available         No Coding Available                           

# ael01_nollt can handle some missing values

    Code
      res
    Output
                                                          Investigator-Specified
      MedDRA System Organ Class   MedDRA Preferred Term     Adverse Event Term  
      ——————————————————————————————————————————————————————————————————————————
      cl A.1                      dcd A.1.1.1.1               trm A.1.1.1.1     
                                  dcd A.1.1.1.2               trm A.1.1.1.2     
      cl B.1                      dcd B.1.1.1.1               trm B.1.1.1.1     
      cl B.2                      dcd B.2.1.2.1               trm B.2.1.2.1     
                                  dcd B.2.2.3.1               trm B.2.2.3.1     
      cl C.1                      dcd C.1.1.1.3               trm C.1.1.1.3     
      cl C.2                      dcd C.2.1.2.1               trm C.2.1.2.1     
      cl D.1                      dcd D.1.1.1.1               trm D.1.1.1.1     
                                  dcd D.1.1.4.2               trm D.1.1.4.2     
      cl D.2                      dcd D.2.1.5.3               trm D.2.1.5.3     
      No Coding Available         No Coding Available         trm B.2.1.2.1     
                                                              trm D.1.1.4.2     

