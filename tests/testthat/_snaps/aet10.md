# aet10 can handle NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                A: Drug X    B: Placebo   C: Combination
        MedDRA Preferred Term     (N=15)       (N=15)         (N=15)    
        ————————————————————————————————————————————————————————————————
        No Coding Available     13 (86.7%)   14 (93.3%)     15 (100%)   

# aet10 can handle some NA values

    Code
      cat(export_as_txt(res, lpp = 100))
    Output
                                A: Drug X   B: Placebo   C: Combination
        MedDRA Preferred Term    (N=15)       (N=15)         (N=15)    
        ———————————————————————————————————————————————————————————————
        dcd B.2.2.3.1           8 (53.3%)   6 (40.0%)      7 (46.7%)   
        dcd B.1.1.1.1           5 (33.3%)   6 (40.0%)      8 (53.3%)   
        dcd C.2.1.2.1           6 (40.0%)   4 (26.7%)      8 (53.3%)   
        dcd A.1.1.1.2           5 (33.3%)   6 (40.0%)      6 (40.0%)   
        dcd B.2.1.2.1           5 (33.3%)   6 (40.0%)      5 (33.3%)   
        dcd D.1.1.1.1           4 (26.7%)   4 (26.7%)      7 (46.7%)   
        dcd D.1.1.4.2           5 (33.3%)   2 (13.3%)      7 (46.7%)   
        dcd D.2.1.5.3           2 (13.3%)   5 (33.3%)      7 (46.7%)   
        dcd C.1.1.1.3           3 (20.0%)   4 (26.7%)      5 (33.3%)   
        dcd A.1.1.1.1           3 (20.0%)    1 (6.7%)      6 (40.0%)   
        No Coding Available     1 (6.7%)        0              0       

