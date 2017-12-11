scrap paper:
  
  
  Select variables of interest
```{r}
#mutate mews column:   0, 1 to "1", 2,3,to "2", 4,5 to "3", 6 to "4"
# note: there are NAs in variable mews.
visit_data = remove_id %>% 
  dplyr::select(-visit_num, -dayofweek, -facilityname, -postalcode, -facilityzip) %>%
  mutate(mews, mews = ifelse( mews>5, 6, mews)) %>% 
  mutate(mews = as.character(mews)) %>% 
  mutate(mews = recode(mews, `0` = "normal", `1` = "normal", `2` = "increase_caution", `3` = "increase_caution", `4` = "further_deterioration", `5` = "further_deterioration", `6` = "immediate_action_required")) %>% 
  mutate(mews = recode(mews, `normal` = "1", `increase_caution` = "2", `further_deterioration` = "3", `immediate_action_required` = "4" )) %>% 
  mutate(mews = as.numeric(mews))

#mutate gender column: female:0, male:1
#note : there is no "NA" in gender variable
visit_data  = visit_data %>% 
  mutate(gender = recode(gender, `Female` = "0", `Male` = "1")) %>% 
  mutate(gender = as.numeric(gender))

#mutate race column: "White":1 "Other/Multiracial":2    "African Amer/Black":3   "Asian":4  "Native Amer/Alaskan":5  "Natv Hawaii/Pacf Isl":6
#Note: There is no NA in race variable
visit_data = visit_data %>% 
  mutate(race = recode(race, `White` = "1", `Other/Multiracial` = "2", `African Amer/Black` = "3", `Native Amer/Alaskan` = "4", `Asian` = "5", `Natv Hawaii/Pacf Isl` = "6")) %>% 
  mutate(race = as.numeric(race))

#mutate religion: "Jewish"--1 "Catholic"--2 "Christian" ---3  "No Affiliation"---4 "Other"---5  "Islam"----6    "Hindu"----7  "Mormon"----8 "Angelican"---9  "Hebrew" ----10  "Non Denominational"----11
#Note: There is no NA in race variable
visit_data = visit_data %>% 
  mutate(religion = recode(religion, `Jewish` = "1", `Catholic` = "2", `Christian` = "3", `No Affiliation` = "4", `Other` = "5", `Islam` = "6", `Hindu` = "7", `Mormon` = "8", `Angelican` = "9", `Hebrew` = "10" , `Non Denominational` = "11")) %>% 
  mutate(religion = as.numeric(religion))


#mutate maritalstatus:"Single"---1 "Married"---2 "Widowed"---3 "Divorced"---4 "Separated"---5   NA            "Civil Union"---6
#Note, there is NA in the variable
visit_data = visit_data %>%
  mutate(maritalstatus = recode(maritalstatus, `Single` = "1", `Married` = "2", `Widowed` = "3", `Divorced` = "4", `Separated` = "5", `Civil Union` = "6")) %>% mutate(maritalstatus = as.numeric(maritalstatus))


##mutate insurancetype: "Private"---1 "Medicare"---2, "Medicaid"----3 
#note:There is Na in the variable
visit_data = visit_data %>%
  mutate(insurancetype = recode(insurancetype, `Private` = "1", `Medicare` = "2", `Medicaid` = "3")) %>% 
  mutate(insurancetype = as.numeric(insurancetype))


```
