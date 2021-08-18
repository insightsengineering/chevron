
## New Table Request

### Table Name
Standard name of the table. [see TLG catalog]  
_ex. AET02_

### Description
Details on the generic purpose of the table  
_ex. This is an adverse event table_

### Analysis dataset
Name of the standard dataset input  
_ex. ADAE_

### Analysis filtering
Filtering criteria of the input  
_ex. ANL01FL = Y_

### Analysis population
The selected population, typically SE, AP or IT  
_ex. SE_

### Column Variable
Names of the columns in the input dataset used to split the table  
_ex. ACTARM_

### Analysis variables
The name of the splitting variables in hierarchical order  
_ex. AEBODSYS, AEDECOD, ASEV_  
_ex._  
    _1. AEBODSYS_  
    _2. AEDECOD_  
    _3. ASEV_  

### Analysis concept
An alternative description for summary tables similar to AET01  
_ex._  
- _Serious AE_  
- _Related AE_  
- _Total number of AEs_  

### Statistics
A Description of the statistical procedure  
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


