# dml02 works with adsl dataset

    Code
      cat(export_as_txt(res[1:50, ], lpp = 100))
    Output
                                                                      Date of     
                                                     Date of      First Study Drug
      Randomized Treatment   Center/Patients ID   Randomization    Administration 
      ————————————————————————————————————————————————————————————————————————————
      A: Drug X              CHN-3/128            22FEB2019       24FEB2019       
                             USA-1/45             04MAR2019       06MAR2019       
                             CHN-4/73             16MAR2019       17MAR2019       
                             RUS-1/52             17MAR2019       18MAR2019       
                             PAK-11/268           21MAR2019       22MAR2019       
                             CHN-3/361            11APR2019       11APR2019       
                             RUS-13/70            15APR2019       15APR2019       
                             CHN-17/309           27APR2019       27APR2019       
                             CHN-2/395            25APR2019       27APR2019       
                             BRA-11/50            28APR2019       28APR2019       
                             CHN-14/1             06MAY2019       07MAY2019       
                             USA-17/142           13MAY2019       14MAY2019       
                             CHN-2/286            16MAY2019       16MAY2019       
                             NGA-1/388            17MAY2019       17MAY2019       
                             CHN-11/88            22MAY2019       23MAY2019       
                             CHN-14/168           25MAY2019       29MAY2019       
                             PAK-11/68            02JUN2019       03JUN2019       
                             RUS-18/359           06JUN2019       08JUN2019       
                             PAK-1/148            16JUN2019       17JUN2019       
                             CAN-14/104           26JUN2019       28JUN2019       
                             CHN-1/329            03JUL2019       06JUL2019       
                             CHN-1/235            11JUL2019       13JUL2019       
                             CHN-11/124           12JUL2019       14JUL2019       
                             PAK-14/117           11JUL2019       15JUL2019       
                             CHN-11/379           29JUL2019       30JUL2019       
                             CHN-3/204            06AUG2019       08AUG2019       
                             CHN-13/270           13AUG2019       17AUG2019       
                             CHN-4/114            16AUG2019       19AUG2019       
                             CHN-1/315            21AUG2019       21AUG2019       
                             NGA-1/200            30AUG2019       01SEP2019       
                             PAK-12/328           10SEP2019       10SEP2019       
                             CHN-5/108            07SEP2019       11SEP2019       
                             NGA-17/72            09SEP2019       11SEP2019       
                             CHN-14/161           09SEP2019       12SEP2019       
                             PAK-15/314           13SEP2019       18SEP2019       
                             CHN-17/182           17SEP2019       18SEP2019       
                             CHN-12/396           19SEP2019       20SEP2019       
                             CHN-11/392           24SEP2019       28SEP2019       
                             BRA-11/217           25SEP2019       28SEP2019       
                             CHN-15/14            29SEP2019       29SEP2019       
                             JPN-1/218            05OCT2019       09OCT2019       
                             CHN-12/57            10OCT2019       13OCT2019       
                             CHN-2/274            10OCT2019       14OCT2019       
                             CHN-15/399           13OCT2019       15OCT2019       
                             CHN-14/228           14OCT2019       18OCT2019       
                             USA-11/339           17OCT2019       19OCT2019       
                             CHN-2/398            16OCT2019       19OCT2019       
                             CHN-12/266           27OCT2019       29OCT2019       
                             JPN-5/326            03NOV2019       03NOV2019       
                             BRA-14/23            03NOV2019       06NOV2019       

# dml02 functions work as expected

    Code
      cat(export_as_txt(res[1:50, ], lpp = 100))
    Output
                                                                      Date of     
                                                     Date of      First Study Drug
      Randomized Treatment   Center/Patients ID   Randomization    Administration 
      ————————————————————————————————————————————————————————————————————————————
      A: Drug X              CHN-3/128            22FEB2019       24FEB2019       
                             USA-1/45             04MAR2019       06MAR2019       
                             CHN-4/73             16MAR2019       17MAR2019       
                             RUS-1/52             17MAR2019       18MAR2019       
                             PAK-11/268           21MAR2019       22MAR2019       
                             CHN-3/361            11APR2019       11APR2019       
                             RUS-13/70            15APR2019       15APR2019       
                             CHN-17/309           27APR2019       27APR2019       
                             CHN-2/395            25APR2019       27APR2019       
                             BRA-11/50            28APR2019       28APR2019       
                             CHN-14/1             06MAY2019       07MAY2019       
                             USA-17/142           13MAY2019       14MAY2019       
                             CHN-2/286            16MAY2019       16MAY2019       
                             NGA-1/388            17MAY2019       17MAY2019       
                             CHN-11/88            22MAY2019       23MAY2019       
                             CHN-14/168           25MAY2019       29MAY2019       
                             PAK-11/68            02JUN2019       03JUN2019       
                             RUS-18/359           06JUN2019       08JUN2019       
                             PAK-1/148            16JUN2019       17JUN2019       
                             CAN-14/104           26JUN2019       28JUN2019       
                             CHN-1/329            03JUL2019       06JUL2019       
                             CHN-1/235            11JUL2019       13JUL2019       
                             CHN-11/124           12JUL2019       14JUL2019       
                             PAK-14/117           11JUL2019       15JUL2019       
                             CHN-11/379           29JUL2019       30JUL2019       
                             CHN-3/204            06AUG2019       08AUG2019       
                             CHN-13/270           13AUG2019       17AUG2019       
                             CHN-4/114            16AUG2019       19AUG2019       
                             CHN-1/315            21AUG2019       21AUG2019       
                             NGA-1/200            30AUG2019       01SEP2019       
                             PAK-12/328           10SEP2019       10SEP2019       
                             CHN-5/108            07SEP2019       11SEP2019       
                             NGA-17/72            09SEP2019       11SEP2019       
                             CHN-14/161           09SEP2019       12SEP2019       
                             PAK-15/314           13SEP2019       18SEP2019       
                             CHN-17/182           17SEP2019       18SEP2019       
                             CHN-12/396           19SEP2019       20SEP2019       
                             CHN-11/392           24SEP2019       28SEP2019       
                             BRA-11/217           25SEP2019       28SEP2019       
                             CHN-15/14            29SEP2019       29SEP2019       
                             JPN-1/218            05OCT2019       09OCT2019       
                             CHN-12/57            10OCT2019       13OCT2019       
                             CHN-2/274            10OCT2019       14OCT2019       
                             CHN-15/399           13OCT2019       15OCT2019       
                             CHN-14/228           14OCT2019       18OCT2019       
                             USA-11/339           17OCT2019       19OCT2019       
                             CHN-2/398            16OCT2019       19OCT2019       
                             CHN-12/266           27OCT2019       29OCT2019       
                             JPN-5/326            03NOV2019       03NOV2019       
                             BRA-14/23            03NOV2019       06NOV2019       

