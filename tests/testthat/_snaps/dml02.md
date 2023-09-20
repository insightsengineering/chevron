# dml02 works with adsl dataset

    Code
      cat(export_as_txt(res[1:50, ], lpp = 100))
    Output
                                                                      Date of     
                                                     Date of      First Study Drug
      Center/Patients ID   Randomized Treatment   Randomization    Administration 
      ————————————————————————————————————————————————————————————————————————————
      BRA-1/105            A: Drug X              08MAR2020       08MAR2020       
      BRA-1/134            A: Drug X              03NOV2020       04NOV2020       
      BRA-1/141            C: Combination         22JUL2020       25JUL2020       
      BRA-1/236            B: Placebo             11JAN2021       15JAN2021       
      BRA-1/265            C: Combination         03OCT2019       07OCT2019       
      BRA-1/42             A: Drug X              31DEC2019       01JAN2020       
      BRA-1/65             B: Placebo             15JUL2019       15JUL2019       
      BRA-1/93             A: Drug X              17JUN2020       20JUN2020       
      BRA-11/171           C: Combination         01DEC2019       03DEC2019       
      BRA-11/217           A: Drug X              25SEP2019       28SEP2019       
      BRA-11/237           C: Combination         10MAR2020       10MAR2020       
      BRA-11/321           C: Combination         06OCT2020       06OCT2020       
      BRA-11/345           A: Drug X              15AUG2020       18AUG2020       
      BRA-11/397           A: Drug X              23JUN2020       27JUN2020       
      BRA-11/50            A: Drug X              28APR2019       28APR2019       
      BRA-11/9             C: Combination         24MAR2019       26MAR2019       
      BRA-12/59            B: Placebo             23NOV2019       26NOV2019       
      BRA-13/177           A: Drug X              27AUG2020       30AUG2020       
      BRA-14/120           C: Combination         17SEP2020       19SEP2020       
      BRA-14/23            A: Drug X              03NOV2019       06NOV2019       
      BRA-15/36            A: Drug X              07JAN2020       08JAN2020       
      BRA-2/101            B: Placebo             24JUN2020       26JUN2020       
      BRA-2/296            A: Drug X              19JAN2021       22JAN2021       
      BRA-3/13             B: Placebo             20APR2020       25APR2020       
      BRA-3/8              B: Placebo             08MAR2020       13MAR2020       
      BRA-4/368            C: Combination         25FEB2020       25FEB2020       
      BRA-4/383            B: Placebo             15JAN2020       18JAN2020       
      BRA-5/234            C: Combination         21JUN2019       22JUN2019       
      BRA-6/369            A: Drug X              09AUG2020       13AUG2020       
      BRA-7/301            C: Combination         21JUL2019       25JUL2019       
      CAN-1/18             A: Drug X              30DEC2020       02JAN2021       
      CAN-1/341            B: Placebo             20MAY2019       23MAY2019       
      CAN-11/139           A: Drug X              14SEP2020       15SEP2020       
      CAN-11/306           C: Combination         04JUN2020       09JUN2020       
      CAN-14/104           A: Drug X              26JUN2019       28JUN2019       
      CAN-4/324            C: Combination         15NOV2020       17NOV2020       
      CAN-4/331            B: Placebo             30APR2020       03MAY2020       
      CAN-5/121            C: Combination         11OCT2019       15OCT2019       
      CHN-1/107            B: Placebo             28JUL2020       31JUL2020       
      CHN-1/119            A: Drug X              13JAN2020       14JAN2020       
      CHN-1/12             B: Placebo             17DEC2020       20DEC2020       
      CHN-1/123            A: Drug X              24JAN2020       28JAN2020       
      CHN-1/133            A: Drug X              06AUG2020       08AUG2020       
      CHN-1/144            C: Combination         16FEB2020       19FEB2020       
      CHN-1/156            B: Placebo             05SEP2020       06SEP2020       
      CHN-1/16             C: Combination         02JAN2021       03JAN2021       
      CHN-1/163            B: Placebo             27MAY2020       27MAY2020       
      CHN-1/181            C: Combination         03MAY2020       05MAY2020       
      CHN-1/186            B: Placebo             30JAN2021       02FEB2021       
      CHN-1/197            B: Placebo             29MAY2020       01JUN2020       

# dml02 functions work as expected

    Code
      cat(export_as_txt(res[1:50, ], lpp = 100))
    Output
                                                                      Date of     
                                                     Date of      First Study Drug
      Center/Patients ID   Randomized Treatment   Randomization    Administration 
      ————————————————————————————————————————————————————————————————————————————
      BRA-1/105            A: Drug X              08MAR2020       08MAR2020       
      BRA-1/134            A: Drug X              03NOV2020       04NOV2020       
      BRA-1/141            C: Combination         22JUL2020       25JUL2020       
      BRA-1/236            B: Placebo             11JAN2021       15JAN2021       
      BRA-1/265            C: Combination         03OCT2019       07OCT2019       
      BRA-1/42             A: Drug X              31DEC2019       01JAN2020       
      BRA-1/65             B: Placebo             15JUL2019       15JUL2019       
      BRA-1/93             A: Drug X              17JUN2020       20JUN2020       
      BRA-11/171           C: Combination         01DEC2019       03DEC2019       
      BRA-11/217           A: Drug X              25SEP2019       28SEP2019       
      BRA-11/237           C: Combination         10MAR2020       10MAR2020       
      BRA-11/321           C: Combination         06OCT2020       06OCT2020       
      BRA-11/345           A: Drug X              15AUG2020       18AUG2020       
      BRA-11/397           A: Drug X              23JUN2020       27JUN2020       
      BRA-11/50            A: Drug X              28APR2019       28APR2019       
      BRA-11/9             C: Combination         24MAR2019       26MAR2019       
      BRA-12/59            B: Placebo             23NOV2019       26NOV2019       
      BRA-13/177           A: Drug X              27AUG2020       30AUG2020       
      BRA-14/120           C: Combination         17SEP2020       19SEP2020       
      BRA-14/23            A: Drug X              03NOV2019       06NOV2019       
      BRA-15/36            A: Drug X              07JAN2020       08JAN2020       
      BRA-2/101            B: Placebo             24JUN2020       26JUN2020       
      BRA-2/296            A: Drug X              19JAN2021       22JAN2021       
      BRA-3/13             B: Placebo             20APR2020       25APR2020       
      BRA-3/8              B: Placebo             08MAR2020       13MAR2020       
      BRA-4/368            C: Combination         25FEB2020       25FEB2020       
      BRA-4/383            B: Placebo             15JAN2020       18JAN2020       
      BRA-5/234            C: Combination         21JUN2019       22JUN2019       
      BRA-6/369            A: Drug X              09AUG2020       13AUG2020       
      BRA-7/301            C: Combination         21JUL2019       25JUL2019       
      CAN-1/18             A: Drug X              30DEC2020       02JAN2021       
      CAN-1/341            B: Placebo             20MAY2019       23MAY2019       
      CAN-11/139           A: Drug X              14SEP2020       15SEP2020       
      CAN-11/306           C: Combination         04JUN2020       09JUN2020       
      CAN-14/104           A: Drug X              26JUN2019       28JUN2019       
      CAN-4/324            C: Combination         15NOV2020       17NOV2020       
      CAN-4/331            B: Placebo             30APR2020       03MAY2020       
      CAN-5/121            C: Combination         11OCT2019       15OCT2019       
      CHN-1/107            B: Placebo             28JUL2020       31JUL2020       
      CHN-1/119            A: Drug X              13JAN2020       14JAN2020       
      CHN-1/12             B: Placebo             17DEC2020       20DEC2020       
      CHN-1/123            A: Drug X              24JAN2020       28JAN2020       
      CHN-1/133            A: Drug X              06AUG2020       08AUG2020       
      CHN-1/144            C: Combination         16FEB2020       19FEB2020       
      CHN-1/156            B: Placebo             05SEP2020       06SEP2020       
      CHN-1/16             C: Combination         02JAN2021       03JAN2021       
      CHN-1/163            B: Placebo             27MAY2020       27MAY2020       
      CHN-1/181            C: Combination         03MAY2020       05MAY2020       
      CHN-1/186            B: Placebo             30JAN2021       02FEB2021       
      CHN-1/197            B: Placebo             29MAY2020       01JUN2020       

