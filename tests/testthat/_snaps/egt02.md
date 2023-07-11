# egt02_1 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Assessment       A: Drug X        B: Placebo     C: Combination
         Abnormality      (N=134)          (N=134)          (N=132)    
        ———————————————————————————————————————————————————————————————
        Heart Rate                                                     
          Low          49/134 (36.6%)   57/134 (42.5%)   55/132 (41.7%)
          High         48/134 (35.8%)   51/134 (38.1%)   48/132 (36.4%)
        QT Duration                                                    
          Low          53/134 (39.6%)   56/134 (41.8%)   54/132 (40.9%)
          High         45/134 (33.6%)   51/134 (38.1%)   45/132 (34.1%)
        RR Duration                                                    
          Low          56/134 (41.8%)   41/134 (30.6%)   50/132 (37.9%)
          High         39/134 (29.1%)   62/134 (46.3%)   41/132 (31.1%)

# egt02_2 functions with default value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
        Assessment       A: Drug X        B: Placebo     C: Combination
         Abnormality      (N=134)          (N=134)          (N=132)    
        ———————————————————————————————————————————————————————————————
        Heart Rate                                                     
          Low          43/128 (33.6%)   47/124 (37.9%)   40/117 (34.2%)
          High         41/127 (32.3%)   46/129 (35.7%)   38/122 (31.1%)
        QT Duration                                                    
          Low          32/113 (28.3%)   48/126 (38.1%)   46/124 (37.1%)
          High         36/125 (28.8%)   47/130 (36.2%)   33/119 (27.7%)
        RR Duration                                                    
          Low          51/129 (39.5%)   30/123 (24.4%)   44/126 (34.9%)
          High         32/127 (25.2%)    50/122 (41%)    34/125 (27.2%)

