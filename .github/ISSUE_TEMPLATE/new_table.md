
## New Table Request

----

### Table Name
Standard name of the table. [see TLG catalog]  
_ex. AET02_

### URL
Link to an external file describing the table  
_ex. https://docs.google.com/spreadsheets/d/1jk8AnYLNXdqiJ1YF42316R9yVaGIDfJKX0BCsBjz6fg/edit#gid=1910060856 _

### Description
Details on the generic purpose of the table  
_ex. This is an adverse event table_

### Analysis dataset
Name of the standard dataset input  
_ex. ADAE_

### Analysis filtering
Filtering criteria of the input  
_ex. ANL01FL = "Y"_

### Analysis population
The selected population, typically SE, AP or IT  
_ex. SE_

### Column Variable
Names of the columns splitting variables in hierarchical order  
_ex. ACTARM_

### Analysis variables
Names of the rows splitting variables in hierarchical order  
_ex. AEBODSYS, AEDECOD, ASEV_  
_ex._  
    _1. AEBODSYS_  
    _2. AEDECOD_  
    _3. ASEV_  

### Analysis concept
Alternative table description for summary tables similar to AET01  
_ex._  
- _Serious AE_  
- _Related AE_  
- _Total number of AEs_  

### Statistics
Description of the statistical procedure  
_ex. Frequency count and % (based on N)_

### Default treatment of zero count rows
Choose one option:  
- [ ] "Remove zero count rows by default"  
- [ ] "Keep zero count rows by default"  
- [x] "Always ask for user input"  
- [ ] "Not applicable / Other"  


### Comments
_ex. Some additional details_


----

[see TLG catalog]: https://docs.nest.roche.com/


