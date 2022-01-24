
# copy pasting leads to many non ASCII characters
# find them with tools::showNonASCIIfile(file = "R/data.R")

# Version Version: February 2021
# nolint start
gds_data <- list(
  CMT02_PT = list(
    "description" = "Concomitant Medications by Preferred Name",
    "Standard titles" = "Concomitant Medications by Preferred Name: {Specify Population}",
    "Standard footnotes" = c(
      "Treatments are coded from the WHODrug Global B3 Format dictionary {version}.",
      "Multiple uses of a specific medication for a patient were counted once in the frequency for the medication. For frequency counts in \"Total number of treatments\", multiple uses of the same medication for a patient were counted separately.",
      "Standard footnote defining medications included in table (e.g., includes concomitant medications used at any time from first dose of study drug through 7 days after last dose of study drug)."
    ),
    "Analysis Population" = "Specify analysis population, typically Safety-Evaluable  Population.",
    "Column Variables" = "By treatment group.",
    "Column Totals" = "See mockup and allow for an All Patients column.",
    "Analysis Variables" = "See mockup. Data are to be summarized using the WHODrug Global B3 Format Dictionary. The statistician is to specify exactly what medications are to be included, e.g., includes concomitant medications used at any time from the first dose of study drug through 7 days after the last dose of study drug, or includes medications used at any time up to the start of study medication.  The medications included in the summary table should be defined in a table footnote.",
    "Sort Order" = "Default: Sort by decreasing total number of patients with the specific medication.",
    "Statistics and Calculation Methods" = "The percentages are the number of safety-evaluable patients, as given in the column headings.  Count multiple occurrences of the same medication once.",
    "Numeric Precision and Formatting of Statistics" = "Use standard display in the mockup.",
    "Optional Subsetting" = "None"
  ),
  DST01 = list(
    "description" = "Patient Disposition Table",
    "Standard titles" = "Patient Disposition: {Analysis Population}",
    "Standard footnotes" = NULL,
    "Analysis Population" = "Specify the patient population.  Typically, this is Randomized Patients for a randomized study or Enrolled and Treated Patients for a non-randomized study.",
    "Column Variables" = "By treatment group.  Specify if this is treatment group assigned or treatment received.",
    "Column Totals" = "See mockup and include an All Patients column.",
    "Analysis Variables" = c(
      "Typically, Completed Study addresses the main study phase.  However, align this row heading with the title of the discontinuation page of the CRF (e.g., Completed Treatment).  Allow for n optional rows.  Typical uses for these optional rows would be Completed Study, Continuing in Study in an oncology trial, or Entered Follow Up in a study with a defined follow-up period.",
      "Allow option for a grouping of the discontinuation reasons into \"safety\" and \"non-safety\" reasons. Consider default \"safety\" reasons to include \"adverse event\" and \"death\".  Otherwise, use the order of discontinuation reasons as presented on the CRF page."
    ),
    "Statistics and Calculation Methods" = "Percentages are of the total number of patients as defined in the analysis population, as given in the column headings.",
    "Numeric Precision and Formatting of Statistics" = "Use standard display in the mockup.",
    "Formatting Options" = "Allow the option for portrait or landscape output orientation.",
    "Optional Subsetting" = "None"
  ),
  DMT01 = list(
    "description" = "Demographics and Baseline Characteristics Table",
    "Standard titles" = "Demographics and Baseline Characteristics: {Specify Population}",
    "Standard footnotes" = NULL,
    "Analysis Population" = "Specify the patient population.  Typically, this is Randomized Patients or modified intent-to-treat population.",
    "Column Variables" = "By treatment group.",
    "Column Totals" = "See mockup and include an All Patients column.",
    "Analysis Variables" = c(
      "See mockup for the typical variable inclusion.  Other continuous and categorical variables can be summarized in this table or in separate tables, as appropriate, based on this format.",
      "Recommended age ranges are 6-12 yr, 13-17 yr, 18-40 yr, 41-64 yr, 65+ yr.  These can be subdivided or changed (e.g., to be consistent with EudraCT reporting requirements).  Ideally, such revised age ranges would be standardized for the drug project."
    ),
    "Statistics and Calculation Methods" = "For each variable, summary statistics are by default based on the number of patients in the corresponding \"n\" row.  Alternative option exists to have summary statistics based on the column header total (i.e. \"N=nnn\").",
    "Numeric Precision and Formatting of Statistics" = "Use standard display in the mockup.",
    "Formatting Options" = "Allow the option for portrait or landscape output orientation.",
    "Optional Subsetting" = "Indicate any subgroup analysis within the display. The percentages here are of the \"n\" row within the corresponding subgrouping.  Variables summarized can be categorical or continuous.  See mockup for display standards."
  ),
  AEL01_NOLLT = list(
    "description" = "Adverse Event Preferred Terms and Investigator-Specified Terms Glossary Programming Notes",
    "Standard titles" = "Glossary of Adverse Event Preferred Terms and Investigator-Specified Terms: {Analysis Population}",
    "Analysis Population" = "Patients with AEs. Specify patient population.  Typically, this is the safety evaluable population. Listing includes patients in specified population who have at least one AE reported.",
    "Column Variables" = "None",
    "Column Totals" = "None",
    "Analysis Variables" = "AE SOC, MedDRA PT, and investigator/Sponsor-specified AE.",
    "Statistics and Calculation Methods" = "None",
    "Numeric Precision and Formatting of Statistics" = "None",
    "Optional Subgrouping" = "None"
  ),
  AET02 = list(
    description = "Adverse Events by System Organ Class and Preferred Term Table",
    "Standard titles" = "Adverse Events: {Specify Population}",
    "Standard footnotes" = c(
      "Investigator text for AEs encoded using MedDRA version xx.x.  Percentages are based on N in the column headings.",
      "For frequency counts by preferred term, multiple occurrences of the same AE in an individual are counted only once.  For frequency counts of \"Total number of events\" rows, multiple occurrences of the same AE in an individual are counted separately. Standard footnote defining AEs included in table (e.g., includes AEs with onset from first dose of study drug through 7 days after last dose of study drug)."
    ),
    "Analysis Population" = "Specify patient population.  Typically, this is Safety Evaluable Population for summarizing safety outcomes.",
    "Column Variables" = "See mockup.  Include the capacity to have an All Active Treatment column.",
    "Analysis Variables" = "Standard table of AE summarized by MedDRA system organ class (SOC) and preferred term (PT).  Order the data by total column frequency from most to least frequently reported SOC (regardless of whether or not total column is displayed).  Within a SOC, sort by total column decreasing frequency of PT. For each SOC include a row summarizing total number of events in that SOC with option to present this row before (default) or after the summary of patients with eventsby preferred term.   There is the option for a table summarized by MedDRA SOC, high-level term (HLT), and PT which includes an overall total row as well as total rows for each SOC and HLT (HLT module highlighted in grey in mockup). The Statistician is to specify the events to be included in table (e.g., include AEs at any time from the first dose of study drug through 7 days after the last dose of study drug).  The AEs included in a summary table should be defined in the table footnote.",
    "Statistics and Calculation Methods" = "Percentages are of the number of patients in that analysis population, as given in the column headings.  For frequency counts by preferred term, multiple occurrences of the same AE in an individual are counted only once.  For frequency counts of \"Total number of events\" rows, multiple occurrences of the same AE in an individual are counted separately.",
    "Numeric Precision and Formatting of Statistics" = "Use standard display in the mockup.",
    "Optional Subsetting" = c(
      "The Statistician is to specify subsetting criteria for patients or AEs.  When a table is based on a subset of patients or AEs, the table title should be modified to clearly define the analysis population.",
      "Patient subsetting limits the analysis to a subset of patients based on baseline characteristics (e.g., patients >= 65 years of age).  Such subsetting can also be used to generate separate tables for subsets of patients with different levels of a diagnostic test or biomarker.  The column header (N = nnn) should represent the number of patients in the specified patient subset for each treatment group.",
      "AE subsetting limits the analysis to a subset of AEs based on:",
      " * event characteristics (e.g., serious AEs, drug-related AEs, Grade>=3 AEs)",
      " * AE frequency (e.g., AEs reported in >= X patients in any treatment group)",
      " * AE frequency (e.g., AEs reported in >= X patients in any treatment group)",
      " * difference in relative frequency between treatment groups (e.g., AEs with difference in relative frequency between the active and control arms >= X%)",
      "For subsetting based on AE characteristics, analysis and display are based only on AEs with the specified characteristic (e.g. only serious AEs).",
      "For subsetting based on AE relative frequency (or absolute frequency), for a user-specified threshold of X% (or X), overall totals and totals within each SOC (and HLT if applicable) are not meaningful.  In this case, create AET02 as usual based on the full AE dataset and modify the display as follows:",
      " 1) Remove the total rows at the top of the table (total no. of patients; total no. of events)",
      " 2) Apply the threshold at the PT level",
      " 3) Display SOC names but do not display total rows within each SOC; display only those SOC's with at least 1 PT meeting the specified threshold in any treatment group",
      " 4) Within each SOC, display only PT's meeting the specified threshold in any treatment group; include both counts and %'s with denominators as usual (treatment group N's)",
      " 5) If it is important to include HLT's in the display, do not display the total rows within each HLT",
      "For subsetting based on differences in relative frequencies between treatment groups, the user must specify a single control group and a difference threshold ({delta}%). PT and SOC frequencies are then tabulated as usual based on the subset of events for which the absolute value of the difference in relative frequencies between control group and at least one active treatment groups is >= {delta}%.",
      "Multiple subsetting criteria can be specified (e.g., serious AEs occurring in >= 2 patients). "
    )
  ),
  AET03 = list(
    "description" = "Adverse Events by Greatest Intensity Table",
    "Standard titles" = "Adverse Events by Greatest Intensity: {Specify Population}",
    "Standard footnotes" = c(
      "Investigator text for AEs encoded using MedDRA version xx.x.  All counts represent patients. Multiple occurrences of the same AE in one individual are counted once at the greatest intensity for this preferred term.",
      "To the SOC Overall row counts, a patient contributes only with the AE occuring with the greatest intensity within the SOC.",
      "Standard footnote defining AEs included in table (e.g., includes AEs with onset from first dose of study drug through 7 days after last dose of study drug)."
    ),
    "Analysis Population" = "Specify patient population.  Typically, this is Safety Evaluable Population for summarizing safety outcomes.",
    "Column Variables" = "By treatment received.  Include the capacity to have an All Active Patients column.",
    "Column Totals" = "See mockup. Include the capacity to have an All Active Treatments column.",
    "Analysis Variables" = c(
      "Order the data by total column from the most commonly reported SOC to the least frequent one.  Within SOC, sort by decreasing frequency of PT.  The Statistician is to specify the events to be included in the table (e.g., include AEs at any time from the first dose of study drug through 7 days after the last dose of study drug).  The AEs included in summary table should be defined in table footnote.  Grades should be displayed as in the mockup by default.  Allow the option to combine Grade 5 with Grades 3 & 4, if there is scientific rationale (the statistician will decide in consultation with the study team).  Note: rows with zero counts will be removed (default) unless overruled by the statistician.",
      "Specify the toxicity grading scale, such as NCI CTCAE (and version) or World Health Organization (WHO) Toxicity Grading Scale for Determining the Severity of Adverse Events. The text 'NCI CTCAE Grade' in the title as well as 'Grade 1-2', 'Grade 3-4', 'Grade 5', '1', '2', '3' and '4' in the body of the table can be adapted according to the AE grading system used; the mockup displays the wording for NCI CTCAE, for any other grading system used (e.g. WHO), please liaise and agree with the statistician, clinical scientist and safety scientist on the wording."
    ),
    "Statistics and Calculation Methods" = c(
      "All counts represent patients. Multiple occurrences of the same AE in one individual are counted once at the greatest intensity/highest grade for this preferred term.",
      "NOTE: AET03 table counts patients according to AEs of greatest intensity for SOC and overall rows and includes percentages based on the total number of patients in the column heading (i.e. \"N=nnn\").  Example:  If a patient reported 4 events in the Infections SOC (each with a different PT), 2 that were mild, 1 that was moderate, and 1 that was severe, they would contribute 1 to the Any Intensity row, 0 to the Mild row, 0 to the Moderate row, and 1 to the Severe row for that SOC.  At the PT level, multiple events within a patient of the same PT will be counted once using the greatest intensity reported. This table addresses questions such as, \"What percentage of patients had a moderate AE as the most intense AE, either overall or within a specific SOC?\"",
      "Assumptions:",
      " * Total (- Any Intensity -) = The number of patients who reported at least one AE overall (or within that particular SOC)",
      " * Mild = the number of patients who reported at least one event with that PT for which the greatest intensity was mild or with that SOC with mild as greatest intensity within the SOC",
      " * Moderate = The number of patients who reported at least one event with that PT for which the greatest intensity was moderate or with that SOC with moderate as greatest intensity within the SOC",
      " * Severe = The number of patients who reported at least one event for which the greatest intensity was severe or with that SOC with severe as greatest intensity within the SOC"
    ),
    "Numeric precision and formatting of statistics" = "Use standard display as in the mockup.",
    "Comments" = "See mockup. Include the source of the grading scale used (e.g. NCI-CTCAE toxicity criteria or whether WHO or any other grading system was used for reporting of AEs) and indicate the version of the toxicity criteria used in the study or project (which version of NCI CTCAE grading). Information is to be taken from protocol. For example Grades are based on NCI CTCAE v3.0.",
    "Optional Subsetting" = c(
      "The Statistician is to specify subsetting criteria for patients or AEs.  When a table is based on a subset of patients or AEs, the table title should be modified to clearly define the analysis population.",
      "Patient subsetting limits the analysis to a subset of patients based on baseline characteristics (e.g., patients >= 65 years of age).  Such subsetting can also be used to generate separate tables for subsets of patients with different levels of a diagnostic test or biomarker.  The column header (N = nnn) should represent the number of patients in the specified patient subset for each treatment group.",
      "AE subsetting limits the analysis to a subset of AEs based on event characteristics (e.g., serious AEs, drug-related AEs, Grade >= 3 AEs, specified SMQ or AE grouping terms, etc.) or AE frequency (e.g., AEs reported in >= X patients in any treatment group) or AE relative frequency (e.g., AEs reported in >= X% of patients in any treatment group) or differences in relative frequency between treatment groups (e.g., AEs with difference in relative frequency between the active and control arms >= X%). Multiple subsetting criteria can be specified (e.g., serious AEs occurring in >= 2 patients). "
    ),
    "Derivation Details" = c(
      "The item numbers in the following table refers to the superscripts in the mock-up",
      "If patient or AE subsetting is applied, additional restrictions have to be added in the derivations. In case of AE subsetting the variables AOCCIFL, AOCCSIFL, and AOCCPIFL, which flags the observation with highest grade per patient, per SOC and patient, and per preferred term and patient, may need to be re-derived.",
      "Do not display rows with all counts equals zero.",
      " {item nr} -- {derivation}",
      " 1 -- Number of patients in Group 1:count patients in ASL where (ARM = 'Group 1' and SAFFL = 'Y')",
      " 2 -- Number of patients in Group 1 with at least one AE with non-missing grade: count patients in AAE where (ARM = 'Group 1' and SAFFL = 'Y' and ANLFL = 'Y' and not missing(AETOXGR))",
      " 3 -- Percentage of patients in Group 1 with at least one AE with non-missing grade out of patients in Group 1: divide item 2 by item 1 and multiply by 100",
      " 4 -- Number of patients in Group1 with highest grade of all AEs equals one: count patients in AAE where (ARM = 'GROUP 1' and SAFFL = 'Y' and ANLFL = 'Y' and AOCCIFL = 'Y' and AETOXGR = '1')",
      " 5 -- Number of patients in Group 1 with at least one AE with non-missing grade within SOC 'BLOOD AND LYMPHATIC SYSTEM DISORDERS': count patients in AAE where (ARM = 'GROUP 1' and SAFFL = 'Y' and ANLFL = 'Y' and not missing(AETOXGR) and AEBODSYS = 'BLOOD AND LYMPHATIC SYSTEM DISORDERS')",
      " 6 -- Number of patients in Group 1 with highest grade equals 1 within SOC 'BLOOD AND LYMPHATIC SYSTEM DISORDERS': count patients in AAE where (ARM = 'GROUP 1' and SAFFL = 'Y' and ANLFL = 'Y' and AEBODSYS = 'BLOOD AND LYMPHATIC SYSTEM DISORDERS' and AOCCSIFL = 'Y' and AETOXGR = '1')",
      " 7 -- Number of patients in Group 1 with at least one AE with preferred term 'NEUTROPENIAS' and non-missing grade: count patients in AAE where (ARM = 'GROUP 1' and SAFFL = 'Y' and ANLFL = 'Y' and AEDECOD = 'NEUTROPENIAS' and not missing(AETOXGR))",
      " 8 -- Number of patients in Group 1 with at least one AE with preferred term 'NEUTROPENIAS' and highest grade equals 1: count patients in AAE where (ARM = 'GROUP 1' and SAFFL = 'Y' and ANLFL = 'Y' and AEDECOD = 'NEUTROPENIAS' and AOCCPIFL = 'Y' and AETOXGR = '1')"
    )
  ),
  AET04 = list(
    "description" = "Adverse Events by Highest {Toxicity Scale} Grade Table",
    "Standard titles" = "Adverse Events by Highest NCI CTCAE Grade: {Specify Population}",
    "Standard footnotes" = c(
      "Investigator text for AEs encoded using MedDRA version xx.x.  All counts represent patients. Multiple occurrences of the same AE in one individual are counted once at the highest grade for this patient.",
      "To the SOC Overall row counts, a patient contributes only with the AE occuring with the highest grade within the SOC.",
      "Percentages are based on N in the column headings.",
      " Standard footnote defining AEs included in table (e.g., includes AEs with onset from first dose of study drug through 7 days after last dose of study drug)."
    ),
    "Analysis Population" = "Specify patient population.  Typically, this is Safety Evaluable Population for summarizing safety outcomes.",
    "Column Variables" = "By treatment received.  Include the capacity to have an All Active Patients column.",
    "Column Totals" = "See mockup. Include the capacity to have an All Active Treatments column.",
    "Analysis Variables" = c(
      "Order the data by total column from the most commonly reported SOC to the least frequent one.  Within SOC, sort by decreasing frequency of PT.  The Statistician is to specify the events to be included in the table (e.g., include AEs at any time from the first dose of study drug through 7 days after the last dose of study drug).  The AEs included in summary table should be defined in table footnote.  Grades should be displayed as in the mockup by default.  Allow the option to combine Grade 5 with Grades 3 & 4, if there is scientific rationale (the statistician will decide in consultation with the study team).  Note: rows with zero counts will be removed (default) unless overruled by the statistician.",
      "Specify the toxicity grading scale, such as NCI CTCAE (and version) or World Health Organization (WHO) Toxicity Grading Scale for Determining the Severity of Adverse Events. The text 'NCI CTCAE Grade' in the title as well as 'Grade 1-2', 'Grade 3-4', 'Grade 5', '1', '2', '3' and '4' in the body of the table can be adapted according to the AE grading system used; the mockup displays the wording for NCI CTCAE, for any other grading system used (e.g. WHO), please liaise and agree with the statistician, clinical scientist and safety scientist on the wording."
    ),
    "Statistics and Calculation Methods" = c(
      "All counts represent patients. Multiple occurrences of the same AE in one individual are counted once at the greatest intensity/highest grade for this preferred term.",
      "NOTE: AET03 table counts patients according to AEs of greatest intensity for SOC and overall rows and includes percentages based on the total number of patients in the column heading (i.e. \"N=nnn\").  Example:  If a patient reported 4 events in the Infections SOC (each with a different PT), 2 that were mild, 1 that was moderate, and 1 that was severe, they would contribute 1 to the Any Intensity row, 0 to the Mild row, 0 to the Moderate row, and 1 to the Severe row for that SOC.  At the PT level, multiple events within a patient of the same PT will be counted once using the greatest intensity reported. This table addresses questions such as, \"What percentage of patients had a moderate AE as the most intense AE, either overall or within a specific SOC?\"",
      "Assumptions:",
      " * Total (- Any Intensity -) = The number of patients who reported at least one AE overall (or within that particular SOC)",
      " * Mild = the number of patients who reported at least one event with that PT for which the greatest intensity was mild or with that SOC with mild as greatest intensity within the SOC",
      " * Moderate = The number of patients who reported at least one event with that PT for which the greatest intensity was moderate or with that SOC with moderate as greatest intensity within the SOC",
      " * Severe = The number of patients who reported at least one event for which the greatest intensity was severe or with that SOC with severe as greatest intensity within the SOC"
    ),
    "Numeric precision and formatting of statistics" = "Use standard display as in the mockup.",
    "Comments" = "See mockup. Include the source of the grading scale used (e.g. NCI-CTCAE toxicity criteria or whether WHO or any other grading system was used for reporting of AEs) and indicate the version of the toxicity criteria used in the study or project (which version of NCI CTCAE grading). Information is to be taken from protocol. For example Grades are based on NCI CTCAE v3.0.",
    "Optional Subsetting" = c(
      "The Statistician is to specify subsetting criteria for patients or AEs.  When a table is based on a subset of patients or AEs, the table title should be modified to clearly define the analysis population.",
      "Patient subsetting limits the analysis to a subset of patients based on baseline characteristics (e.g., patients >= 65 years of age).  Such subsetting can also be used to generate separate tables for subsets of patients with different levels of a diagnostic test or biomarker.  The column header (N = nnn) should represent the number of patients in the specified patient subset for each treatment group.",
      "AE subsetting limits the analysis to a subset of AEs based on event characteristics (e.g., serious AEs, drug-related AEs, Grade >= 3 AEs, specified SMQ or AE grouping terms, etc.) or AE frequency (e.g., AEs reported in >= X patients in any treatment group) or AE relative frequency (e.g., AEs reported in >= X% of patients in any treatment group) or differences in relative frequency between treatment groups (e.g., AEs with difference in relative frequency between the active and control arms >= X%). Multiple subsetting criteria can be specified (e.g., serious AEs occurring in >= 2 patients). "
    ),
    "Derivation Details" = c(
      "The item numbers in the following table refers to the superscripts in the mock-up",
      "If patient or AE subsetting is applied, additional restrictions have to be added in the derivations. In case of AE subsetting the variables AOCCIFL, AOCCSIFL, and AOCCPIFL, which flags the observation with highest grade per patient, per SOC and patient, and per preferred term and patient, may need to be re-derived.",
      "Do not display rows with all counts equals zero.",
      " <item nr> -- <derivation>",
      " 1 -- Number of patients in Group 1:count patients in ASL where (ARM = 'Group 1' and SAFFL = 'Y')",
      " 2 -- Number of patients in Group 1 with at least one AE with non-missing grade: count patients in AAE where (ARM = 'Group 1' and SAFFL = 'Y' and ANLFL = 'Y' and not missing(AETOXGR))",
      " 3 -- Percentage of patients in Group 1 with at least one AE with non-missing grade out of patients in Group 1: divide item 2 by item 1 and multiply by 100",
      " 4 -- Number of patients in Group1 with highest grade of all AEs equals one: count patients in AAE where (ARM = 'GROUP 1' and SAFFL = 'Y' and ANLFL = 'Y' and AOCCIFL = 'Y' and AETOXGR = '1')",
      " 5 -- Number of patients in Group 1 with at least one AE with non-missing grade within SOC 'BLOOD AND LYMPHATIC SYSTEM DISORDERS': count patients in AAE where (ARM = 'GROUP 1' and SAFFL = 'Y' and ANLFL = 'Y' and not missing(AETOXGR) and AEBODSYS = 'BLOOD AND LYMPHATIC SYSTEM DISORDERS')",
      " 6 -- Number of patients in Group 1 with highest grade equals 1 within SOC 'BLOOD AND LYMPHATIC SYSTEM DISORDERS': count patients in AAE where (ARM = 'GROUP 1' and SAFFL = 'Y' and ANLFL = 'Y' and AEBODSYS = 'BLOOD AND LYMPHATIC SYSTEM DISORDERS' and AOCCSIFL = 'Y' and AETOXGR = '1')",
      " 7 -- Number of patients in Group 1 with at least one AE with preferred term 'NEUTROPENIAS' and non-missing grade: count patients in AAE where (ARM = 'GROUP 1' and SAFFL = 'Y' and ANLFL = 'Y' and AEDECOD = 'NEUTROPENIAS' and not missing(AETOXGR))",
      " 8 -- Number of patients in Group 1 with at least one AE with preferred term 'NEUTROPENIAS' and highest grade equals 1: count patients in AAE where (ARM = 'GROUP 1' and SAFFL = 'Y' and ANLFL = 'Y' and AEDECOD = 'NEUTROPENIAS' and AOCCPIFL = 'Y' and AETOXGR = '1')"
    )
  ),
  AET06 = list(),
  AET05VAD = list(),
  EXT01 = list(
    "description" = "Study Drug Exposure Table",
    "Standard titles" = "Study Drug Exposure:  {Specify Population}",
    "Standard footnotes" = "Treatment duration is the date of the last study drug administration minus the date of the first study drug administration plus one day.  Dose intensity is {definition}. <Percentages for reasons for dose modification are based on total number of patients with at least one dose modification.>",
    "Analysis Population" = "Specify analysis population, typically Safety-Evaluable Population.",
    "Column Variables" = "By treatment group",
    "Column Totals" = "See mockup and allow for an All Patients column.",
    "Analysis Variables" = "One summary table will be prepared for each study drug.  The statistician must specify which variables to summarize.  The following variables must be included by default:
1.	Treatment duration = date of the last study drug administration minus the date of the first study drug administration +1
2.	Total cumulative dose
The following variables are optional:
3.	Dose intensity - the statistician must specify which definition to use:
a)	Dose intensity = number of doses actually received / expected number of doses during the protocol-specified treatment period (to be displayed as a percentage)
b)	Dose intensity = total dose actually received / planned total dose during the protocol-specified treatment period (to be displayed as a percentage)
4.	Number of doses/cycles = number of doses/cycles actually administered
5.	Missed doses = number of doses missed during the protocol-specified treatment period (e.g., 1 missed dose over 6 cycles planned)
6.	Dose modification - The complete block (shaded in grey) is optional as is each reason for dose modification individually.
In cases where treatment period (expected number of cycles) is variable (e.g., treatment should continue until disease progression), the statistician must specify the expected number of doses and the duration of the treatment period.
",
    "Statistics and Calculation Methods" = c(
      "The \"n\" row provides the number of non missing values.  For a categorical variable, each percentage is based on the number of patients in the \"n\" row.",
      "Percentages for \"Total number of patients with at least one dose modification\" are based on the number of patients in the analysis population as given in the column heading. Percentages for the individual reasons for dose modification are based on \"nnn\", where \"nnn\" equals the \"Total number of patients with at least one dose modification\"."
    ),
    "Numeric Precision and Formatting of Statistics" = "Use standard display in the mockup.",
    "Formatting Options" = "Allow the option for portrait or landscape output orientation.",
    "Optional Subsetting" = "None"
  ),
  TTET01 = list(),
  KMG01 = list(),
  LBL02A = list(),
  LBT01 = list(
    "description" = "Laboratory Tests Table",
    "Standard titles" = "Laboratory Test Results and Change from Baseline by Visit, {Specific Lab Test}:  {Specify Population}",
    "Standard footnotes" = "Baseline is the patient\'s last observation prior to initiation of study drug.  Any values collected more than {specify time interval} after
the last dose of study drug are not included.  The minimum and maximum values are, respectively, the smallest and largest values obtained
after baseline through {specify time interval} after the last dose of study drug, including repeat and unscheduled tests.
",
    "Analysis Population" = "Specify the analysis population.  Typically this is All Patients.",
    "Column Variables" = "See mockup",
    "Column Totals" = "None",
    "Analysis Variables" = "This table will be used to fulfill EudraCT disclosure requirements.  On the first row, provide the number of patients with at least 1 serious adverse event (SAE).  This row will be populated in the first column only-- \"Patients (All)\".
In addition, summarize, by treatment group, by SOC and by preferred term the following counts, in order from left to right in the table:
1.	Number of patients with serious adverse events (SAEs)
2.	Number of SAEs
3.	Number of SAEs related to study medication
4.	Number of SAEs resulting in death (fatal)
5.	Number of SAEs related to study medication and resulting in death
Number of patients and number of events at the SOC level are not displayed.",
    "Statistics and Calculation Methods" = "For each preferred term, multiple occurrences of the same AE (that meet the relevant filter) in an individual are counted only once for the number of patients, and counted separately for the number of events.",
    "Numeric Precision and Formatting of Statistics" = "Use standard display in the mockup.",
    "Optional Subsetting" = "None"
  ),
  LBT06 = list(),
  MHT01 = list(
    "description" = "Medical History Table",
    "Standard titles" = "Medical History: {Specify Population}",
    "Standard footnotes" = "Investigator text for medical history conditions coded using MedDRA version xx.x.  Percentages are based on N in the column headings.
Provide study specific footnote that describes exactly what the diseases and conditions are included (e.g., includes diseases and conditions present within 6 months of screening, as reported by the patient).
",
    "Analysis Population" = "Specify the analysis population, typically Safety-Evaluable Population",
    "Column Variables" = "By treatment group",
    "Column Totals" = "See mockup and allow for an All Patients column.",
    "Analysis Variables" = "Body system and disease.  This is a summary of medical history-diseases and conditions patients had prior to or on entering trial.  Provide an option to summarize all medical conditions prior to or on entering the study or only those conditions that were ongoing at entry into the study.  Sort by body system alphabetically and within body system and medical condition by decreasing total number of patients with the specific condition. For each SOC include a row summarizing total number of conditions in that SOC with option to present this row before (default) or after the summary of patients with conditions by MedDRA preferred term.",
    "Statistics and Calculation Methods" = "The percentages are of the number of safety-evaluable patients, as given in the column headings.  The Total Number of Conditions row is optional.",
    "Numeric Precision and Formatting of Statistics" = "Use standard display in the mockup.",
    "Formatting Options" = NULL,
    "Optional Subsetting" = "None"
  ),
  ONCT01 = list(),
  ONCT04 = list(),
  KMT01 = list(),
  IRCT01 = list(),
  IRCT02 = list(),
  RSPT01 = list(),
  FSTG02 = list(),
  COXT02 = list(),
  COXT01 = list(),
  CFBT01 = list(),
  Empty_table = list(
    "description" = NULL,
    "Standard titles" = NULL,
    "Standard footnotes" = NULL,
    "Analysis Population" = NULL,
    "Column Variables" = NULL,
    "Column Totals" = NULL,
    "Analysis Variables" = NULL,
    "Statistics and Calculation Methods" = NULL,
    "Numeric Precision and Formatting of Statistics" = NULL,
    "Formatting Options" = NULL,
    "Optional Subsetting" = NULL
  )
)
# nolint end
