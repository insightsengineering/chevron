# dml02 works with adsl dataset

    Code
      cat(export_as_txt(res[1:50, ], lpp = 100))
    Output
                                                                     Date of     
                                                    Date of      First Study Drug
      Center/Patient ID   Randomized Treatment   Randomization    Administration 
      ———————————————————————————————————————————————————————————————————————————
      CHN-3/128           A: Drug X              22FEB2019       24FEB2019       
      RUS-3/378           C: Combination         24FEB2019       28FEB2019       
      CHN-15/262          C: Combination         26FEB2019       26FEB2019       
      CHN-11/220          B: Placebo             27FEB2019       01MAR2019       
      CHN-7/267           B: Placebo             01MAR2019       02MAR2019       
      USA-1/261           B: Placebo             02MAR2019       06MAR2019       
      USA-1/45            A: Drug X              04MAR2019       06MAR2019       
      CHN-15/201          C: Combination         05MAR2019       05MAR2019       
      NGA-11/173          C: Combination         08MAR2019       10MAR2019       
      CHN-1/307           B: Placebo             08MAR2019       11MAR2019       
      CHN-7/28            B: Placebo             10MAR2019       11MAR2019       
      CHN-4/73            A: Drug X              16MAR2019       17MAR2019       
      RUS-1/52            A: Drug X              17MAR2019       18MAR2019       
      PAK-11/268          A: Drug X              21MAR2019       22MAR2019       
      CHN-13/102          B: Placebo             23MAR2019       23MAR2019       
      CHN-17/84           C: Combination         23MAR2019       24MAR2019       
      BRA-11/9            C: Combination         24MAR2019       26MAR2019       
      CHN-15/245          C: Combination         25MAR2019       29MAR2019       
      CHN-4/115           C: Combination         26MAR2019       28MAR2019       
      CHN-4/370           C: Combination         28MAR2019       29MAR2019       
      RUS-4/6             C: Combination         31MAR2019       03APR2019       
      CHN-11/263          C: Combination         03APR2019       03APR2019       
      PAK-2/191           C: Combination         03APR2019       07APR2019       
      CHN-13/240          B: Placebo             06APR2019       08APR2019       
      CHN-1/227           B: Placebo             07APR2019       10APR2019       
      CHN-3/361           A: Drug X              11APR2019       11APR2019       
      RUS-13/70           A: Drug X              15APR2019       15APR2019       
      CHN-2/395           A: Drug X              25APR2019       27APR2019       
      USA-1/242           C: Combination         25APR2019       27APR2019       
      CHN-1/64            C: Combination         25APR2019       28APR2019       
      CHN-17/309          A: Drug X              27APR2019       27APR2019       
      USA-12/44           C: Combination         28APR2019       28APR2019       
      BRA-11/50           A: Drug X              28APR2019       28APR2019       
      CHN-17/48           B: Placebo             29APR2019       03MAY2019       
      PAK-1/95            C: Combination         01MAY2019       01MAY2019       
      USA-1/137           C: Combination         01MAY2019       03MAY2019       
      CHN-7/126           B: Placebo             02MAY2019       02MAY2019       
      CHN-11/184          C: Combination         04MAY2019       04MAY2019       
      CHN-14/1            A: Drug X              06MAY2019       07MAY2019       
      USA-15/127          B: Placebo             09MAY2019       12MAY2019       
      NGA-11/313          B: Placebo             09MAY2019       12MAY2019       
      USA-17/142          A: Drug X              13MAY2019       14MAY2019       
      CHN-2/286           A: Drug X              16MAY2019       16MAY2019       
      USA-1/269           B: Placebo             16MAY2019       17MAY2019       
      NGA-1/388           A: Drug X              17MAY2019       17MAY2019       
      CAN-1/341           B: Placebo             20MAY2019       23MAY2019       
      CHN-11/88           A: Drug X              22MAY2019       23MAY2019       
      CHN-14/168          A: Drug X              25MAY2019       29MAY2019       
      CHN-5/159           C: Combination         26MAY2019       27MAY2019       
      PAK-1/280           C: Combination         26MAY2019       28MAY2019       

# dml02 functions work as expected

    Code
      cat(export_as_txt(res[1:50, ], lpp = 100))
    Output
                                                                     Date of     
                                                    Date of      First Study Drug
      Center/Patient ID   Randomized Treatment   Randomization    Administration 
      ———————————————————————————————————————————————————————————————————————————
      CHN-3/128           A: Drug X              22FEB2019       24FEB2019       
      RUS-3/378           C: Combination         24FEB2019       28FEB2019       
      CHN-15/262          C: Combination         26FEB2019       26FEB2019       
      CHN-11/220          B: Placebo             27FEB2019       01MAR2019       
      CHN-7/267           B: Placebo             01MAR2019       02MAR2019       
      USA-1/261           B: Placebo             02MAR2019       06MAR2019       
      USA-1/45            A: Drug X              04MAR2019       06MAR2019       
      CHN-15/201          C: Combination         05MAR2019       05MAR2019       
      NGA-11/173          C: Combination         08MAR2019       10MAR2019       
      CHN-1/307           B: Placebo             08MAR2019       11MAR2019       
      CHN-7/28            B: Placebo             10MAR2019       11MAR2019       
      CHN-4/73            A: Drug X              16MAR2019       17MAR2019       
      RUS-1/52            A: Drug X              17MAR2019       18MAR2019       
      PAK-11/268          A: Drug X              21MAR2019       22MAR2019       
      CHN-13/102          B: Placebo             23MAR2019       23MAR2019       
      CHN-17/84           C: Combination         23MAR2019       24MAR2019       
      BRA-11/9            C: Combination         24MAR2019       26MAR2019       
      CHN-15/245          C: Combination         25MAR2019       29MAR2019       
      CHN-4/115           C: Combination         26MAR2019       28MAR2019       
      CHN-4/370           C: Combination         28MAR2019       29MAR2019       
      RUS-4/6             C: Combination         31MAR2019       03APR2019       
      CHN-11/263          C: Combination         03APR2019       03APR2019       
      PAK-2/191           C: Combination         03APR2019       07APR2019       
      CHN-13/240          B: Placebo             06APR2019       08APR2019       
      CHN-1/227           B: Placebo             07APR2019       10APR2019       
      CHN-3/361           A: Drug X              11APR2019       11APR2019       
      RUS-13/70           A: Drug X              15APR2019       15APR2019       
      CHN-2/395           A: Drug X              25APR2019       27APR2019       
      USA-1/242           C: Combination         25APR2019       27APR2019       
      CHN-1/64            C: Combination         25APR2019       28APR2019       
      CHN-17/309          A: Drug X              27APR2019       27APR2019       
      USA-12/44           C: Combination         28APR2019       28APR2019       
      BRA-11/50           A: Drug X              28APR2019       28APR2019       
      CHN-17/48           B: Placebo             29APR2019       03MAY2019       
      PAK-1/95            C: Combination         01MAY2019       01MAY2019       
      USA-1/137           C: Combination         01MAY2019       03MAY2019       
      CHN-7/126           B: Placebo             02MAY2019       02MAY2019       
      CHN-11/184          C: Combination         04MAY2019       04MAY2019       
      CHN-14/1            A: Drug X              06MAY2019       07MAY2019       
      USA-15/127          B: Placebo             09MAY2019       12MAY2019       
      NGA-11/313          B: Placebo             09MAY2019       12MAY2019       
      USA-17/142          A: Drug X              13MAY2019       14MAY2019       
      CHN-2/286           A: Drug X              16MAY2019       16MAY2019       
      USA-1/269           B: Placebo             16MAY2019       17MAY2019       
      NGA-1/388           A: Drug X              17MAY2019       17MAY2019       
      CAN-1/341           B: Placebo             20MAY2019       23MAY2019       
      CHN-11/88           A: Drug X              22MAY2019       23MAY2019       
      CHN-14/168          A: Drug X              25MAY2019       29MAY2019       
      CHN-5/159           C: Combination         26MAY2019       27MAY2019       
      PAK-1/280           C: Combination         26MAY2019       28MAY2019       

