# egt03 functions with default argument value return expected result with test data

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      
      Parameter: Heart Rate
      
        ————————————————————————————————————————————————————————————————————————————————
        Actual Arm Code                            Minimum Post-Baseline Assessment     
          Baseline Reference Range Indicator      LOW         NORMAL      HIGH   Missing
        ————————————————————————————————————————————————————————————————————————————————
        ARM A (N=15)                                                                    
          LOW                                      0             0         0        0   
          NORMAL                               4 (26.7%)     9 (60.0%)     0        0   
          HIGH                                     0         2 (13.3%)     0        0   
          Missing                                  0             0         0        0   
        ARM B (N=15)                                                                    
          LOW                                      0         1 (6.7%)      0        0   
          NORMAL                               4 (26.7%)    10 (66.7%)     0        0   
          HIGH                                     0             0         0        0   
          Missing                                  0             0         0        0   
        ARM C (N=15)                                                                    
          LOW                                      0             0         0        0   
          NORMAL                               4 (26.7%)    10 (66.7%)     0        0   
          HIGH                                     0         1 (6.7%)      0        0   
          Missing                                  0             0         0        0   
      \s\n
      Parameter: QT Duration
      
        ————————————————————————————————————————————————————————————————————————————————
        Actual Arm Code                            Minimum Post-Baseline Assessment     
          Baseline Reference Range Indicator      LOW         NORMAL      HIGH   Missing
        ————————————————————————————————————————————————————————————————————————————————
        ARM A (N=15)                                                                    
          LOW                                      0         3 (20.0%)     0        0   
          NORMAL                               2 (13.3%)     9 (60.0%)     0        0   
          HIGH                                     0         1 (6.7%)      0        0   
          Missing                                  0             0         0        0   
        ARM B (N=15)                                                                    
          LOW                                      0             0         0        0   
          NORMAL                               5 (33.3%)    10 (66.7%)     0        0   
          HIGH                                     0             0         0        0   
          Missing                                  0             0         0        0   
        ARM C (N=15)                                                                    
          LOW                                      0         1 (6.7%)      0        0   
          NORMAL                               3 (20.0%)    10 (66.7%)     0        0   
          HIGH                                     0         1 (6.7%)      0        0   
          Missing                                  0             0         0        0   
      \s\n
      Parameter: RR Duration
      
        ————————————————————————————————————————————————————————————————————————————————
        Actual Arm Code                            Minimum Post-Baseline Assessment     
          Baseline Reference Range Indicator      LOW         NORMAL      HIGH   Missing
        ————————————————————————————————————————————————————————————————————————————————
        ARM A (N=15)                                                                    
          LOW                                      0             0         0        0   
          NORMAL                               6 (40.0%)     7 (46.7%)     0        0   
          HIGH                                     0         2 (13.3%)     0        0   
          Missing                                  0             0         0        0   
        ARM B (N=15)                                                                    
          LOW                                      0         2 (13.3%)     0        0   
          NORMAL                               2 (13.3%)     9 (60.0%)     0        0   
          HIGH                                     0         2 (13.3%)     0        0   
          Missing                                  0             0         0        0   
        ARM C (N=15)                                                                    
          LOW                                      0         1 (6.7%)      0        0   
          NORMAL                               4 (26.7%)    10 (66.7%)     0        0   
          HIGH                                     0             0         0        0   
          Missing                                  0             0         0        0   

# egt03 can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
      
      Parameter: Heart Rate
      
        ————————————————————————————————————————————————————————————————————————————————
        Actual Arm Code                            Minimum Post-Baseline Assessment     
          Baseline Reference Range Indicator      LOW         NORMAL      HIGH   Missing
        ————————————————————————————————————————————————————————————————————————————————
        ARM A (N=15)                                                                    
          LOW                                      0             0         0        0   
          NORMAL                               4 (26.7%)     9 (60.0%)     0        0   
          HIGH                                     0         2 (13.3%)     0        0   
          Missing                                  0             0         0        0   
        ARM B (N=15)                                                                    
          LOW                                      0         1 (6.7%)      0        0   
          NORMAL                               4 (26.7%)    10 (66.7%)     0        0   
          HIGH                                     0             0         0        0   
          Missing                                  0             0         0        0   
        ARM C (N=15)                                                                    
          LOW                                      0             0         0        0   
          NORMAL                               4 (26.7%)    10 (66.7%)     0        0   
          HIGH                                     0         1 (6.7%)      0        0   
          Missing                                  0             0         0        0   
      \s\n
      Parameter: QT Duration
      
        ————————————————————————————————————————————————————————————————————————————————
        Actual Arm Code                            Minimum Post-Baseline Assessment     
          Baseline Reference Range Indicator      LOW         NORMAL      HIGH   Missing
        ————————————————————————————————————————————————————————————————————————————————
        ARM A (N=15)                                                                    
          LOW                                      0         3 (20.0%)     0        0   
          NORMAL                               2 (13.3%)     9 (60.0%)     0        0   
          HIGH                                     0         1 (6.7%)      0        0   
          Missing                                  0             0         0        0   
        ARM B (N=15)                                                                    
          LOW                                      0             0         0        0   
          NORMAL                               5 (33.3%)    10 (66.7%)     0        0   
          HIGH                                     0             0         0        0   
          Missing                                  0             0         0        0   
        ARM C (N=15)                                                                    
          LOW                                      0         1 (6.7%)      0        0   
          NORMAL                               3 (20.0%)    10 (66.7%)     0        0   
          HIGH                                     0         1 (6.7%)      0        0   
          Missing                                  0             0         0        0   
      \s\n
      Parameter: RR Duration
      
        ————————————————————————————————————————————————————————————————————————————————
        Actual Arm Code                            Minimum Post-Baseline Assessment     
          Baseline Reference Range Indicator      LOW         NORMAL      HIGH   Missing
        ————————————————————————————————————————————————————————————————————————————————
        ARM A (N=15)                                                                    
          LOW                                      0             0         0        0   
          NORMAL                               6 (40.0%)     7 (46.7%)     0        0   
          HIGH                                     0         2 (13.3%)     0        0   
          Missing                                  0             0         0        0   
        ARM B (N=15)                                                                    
          LOW                                      0         2 (13.3%)     0        0   
          NORMAL                               2 (13.3%)     9 (60.0%)     0        0   
          HIGH                                     0         2 (13.3%)     0        0   
          Missing                                  0             0         0        0   
        ARM C (N=15)                                                                    
          LOW                                      0         1 (6.7%)      0        0   
          NORMAL                               4 (26.7%)    10 (66.7%)     0        0   
          HIGH                                     0             0         0        0   
          Missing                                  0             0         0        0   

