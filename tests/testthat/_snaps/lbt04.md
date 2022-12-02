# lbt04 can handle all NA values

    Code
      res
    Output
          Laboratory Test              A: Drug X   B: Placebo   C: Combination
            Direction of Abnormality     (N=0)       (N=0)          (N=0)     
        ——————————————————————————————————————————————————————————————————————
        CHEMISTRY                                                             
        IMMUNOLOGY                                                            

# lbt04 can handle some NA values

    Code
      res
    Output
          Laboratory Test                          A: Drug X        B: Placebo     C: Combination
            Direction of Abnormality                (N=2809)         (N=2807)         (N=2770)   
        —————————————————————————————————————————————————————————————————————————————————————————
        CHEMISTRY                                                                                
          Alanine Aminotransferase Measurement                                                   
            Low                                  58/124 (46.8%)    50/122 (41%)    46/117 (39.3%)
            High                                 56/121 (46.3%)   54/118 (45.8%)   62/118 (52.5%)
          C-Reactive Protein Measurement                                                         
            Low                                  66/122 (54.1%)   54/125 (43.2%)   57/120 (47.5%)
            High                                 60/115 (52.2%)   52/115 (45.2%)   58/114 (50.9%)
        IMMUNOLOGY                                                                               
          Immunoglobulin A Measurement                                                           
            Low                                  59/120 (49.2%)   65/119 (54.6%)   58/120 (48.3%)
            High                                 60/119 (50.4%)   60/123 (48.8%)   51/119 (42.9%)

