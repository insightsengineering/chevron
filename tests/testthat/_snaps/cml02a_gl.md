# cml02a_gl works with adcm dataset

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                   Investigator-Specified
      ATC Class Level 2   WHODrug Preferred Name       Treatment Term    
      ———————————————————————————————————————————————————————————————————
      ATCCLAS2 A          medname A_1/3            A_1/3                 
                          medname A_2/3            A_2/3                 
                          medname A_3/3            A_3/3                 
      ATCCLAS2 A p2       medname A_3/3            A_3/3                 
      ATCCLAS2 B          medname B_1/4            B_1/4                 
                          medname B_2/4            B_2/4                 
                          medname B_3/4            B_3/4                 
                          medname B_4/4            B_4/4                 
      ATCCLAS2 B p2       medname B_1/4            B_1/4                 
                          medname B_2/4            B_2/4                 
      ATCCLAS2 B p3       medname B_1/4            B_1/4                 
                          medname B_2/4            B_2/4                 
      ATCCLAS2 C          medname C_1/2            C_1/2                 
                          medname C_2/2            C_2/2                 
      ATCCLAS2 C p2       medname C_1/2            C_1/2                 
                          medname C_2/2            C_2/2                 
      ATCCLAS2 C p3       medname C_2/2            C_2/2                 

# cml02a_gl works with missing data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                     Investigator-Specified
       ATC Class Level 2    WHODrug Preferred Name       Treatment Term    
      —————————————————————————————————————————————————————————————————————
      No Coding Available   medname A_1/3            A_1/3                 
                            medname A_2/3            A_2/3                 
                            medname A_3/3            A_3/3                 
                            medname B_1/4            B_1/4                 
                            medname B_2/4            B_2/4                 
                            medname B_3/4            B_3/4                 
                            medname B_4/4            B_4/4                 
                            medname C_1/2            C_1/2                 
                            medname C_2/2            C_2/2                 

# cml02a_gl functions work as expected

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                                   Investigator-Specified
      ATC Class Level 2   WHODrug Preferred Name       Treatment Term    
      ———————————————————————————————————————————————————————————————————
      ATCCLAS2 A          medname A_1/3            A_1/3                 
                          medname A_2/3            A_2/3                 
                          medname A_3/3            A_3/3                 
      ATCCLAS2 A p2       medname A_3/3            A_3/3                 
      ATCCLAS2 B          medname B_1/4            B_1/4                 
                          medname B_2/4            B_2/4                 
                          medname B_3/4            B_3/4                 
                          medname B_4/4            B_4/4                 
      ATCCLAS2 B p2       medname B_1/4            B_1/4                 
                          medname B_2/4            B_2/4                 
      ATCCLAS2 B p3       medname B_1/4            B_1/4                 
                          medname B_2/4            B_2/4                 
      ATCCLAS2 C          medname C_1/2            C_1/2                 
                          medname C_2/2            C_2/2                 
      ATCCLAS2 C p2       medname C_1/2            C_1/2                 
                          medname C_2/2            C_2/2                 
      ATCCLAS2 C p3       medname C_2/2            C_2/2                 

