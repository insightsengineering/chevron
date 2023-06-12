# egt03 functions with default argument value return expected result with test data

    Code
      cat(formatters::export_as_txt(res, lpp = 100))
    Output
        Actual Arm Code                            Minimum Post-Baseline Assessment     
          Baseline Reference Range Indicator       LOW         NORMAL     HIGH   Missing
        ————————————————————————————————————————————————————————————————————————————————
        ARM A (N=134)                                                                   
          LOW                                   1 (0.7%)      5 (3.7%)     0        0   
          NORMAL                               36 (26.9%)    85 (63.4%)    0        0   
          HIGH                                  3 (2.2%)       4 (3%)      0        0   
          Missing                                   0            0         0        0   
        ARM B (N=134)                                                                   
          LOW                                   1 (0.7%)      9 (6.7%)     0        0   
          NORMAL                               41 (30.6%)    78 (58.2%)    0        0   
          HIGH                                  1 (0.7%)       4 (3%)      0        0   
          Missing                                   0            0         0        0   
        ARM C (N=132)                                                                   
          LOW                                    4 (3%)      11 (8.3%)     0        0   
          NORMAL                               32 (24.2%)    75 (56.8%)    0        0   
          HIGH                                  1 (0.8%)      9 (6.8%)     0        0   
          Missing                                   0            0         0        0   

# egt03 can handle some NA values

    Code
      cat(formatters::export_as_txt(res, lpp = 100))
    Output
        Actual Arm Code                            Minimum Post-Baseline Assessment     
          Baseline Reference Range Indicator       LOW         NORMAL     HIGH   Missing
        ————————————————————————————————————————————————————————————————————————————————
        ARM A (N=134)                                                                   
          LOW                                   1 (0.7%)      5 (3.7%)     0        0   
          NORMAL                               36 (26.9%)    85 (63.4%)    0        0   
          HIGH                                  3 (2.2%)       4 (3%)      0        0   
          Missing                                   0            0         0        0   
        ARM B (N=134)                                                                   
          LOW                                   1 (0.7%)      9 (6.7%)     0        0   
          NORMAL                               41 (30.6%)    78 (58.2%)    0        0   
          HIGH                                  1 (0.7%)       4 (3%)      0        0   
          Missing                                   0            0         0        0   
        ARM C (N=132)                                                                   
          LOW                                    4 (3%)      11 (8.3%)     0        0   
          NORMAL                               32 (24.2%)    75 (56.8%)    0        0   
          HIGH                                  1 (0.8%)      9 (6.8%)     0        0   
          Missing                                   0            0         0        0   

