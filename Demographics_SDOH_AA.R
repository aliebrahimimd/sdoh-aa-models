
R version 4.4.3 (2025-02-28 ucrt) -- "Trophy Case"
Copyright (C) 2025 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[Workspace loaded from ~/.RData]

> library(readxl)
> library(dplyr)

Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:
  
  filter, lag

The following objects are masked from ‘package:base’:
  
  intersect, setdiff, setequal, union

> library(gtsummary)
> library(gt)
> library(writexl)
> my_data <- read_excel(file.choose())
> my_data <- my_data %>%
  +     mutate(Death = factor(Death, levels = c(0, 1), labels = c("Survived", "Deceased")))
> my_data_clean <- my_data %>%
  +     select(-any_of(c("Treatment_Date", "Last_Visit_Date", "Death_Date", 
                         +                      "Chronic_GVHD_Date", "Acute_GVHD_Date")))
> table1 <- my_data_clean %>%
  +     tbl_summary(
    +         by = Death,
    +         statistic = list(
      +             all_continuous() ~ "{mean} ({sd})",
      +             all_categorical() ~ "{n} ({p}%)"
      +         ),
    +         missing = "no"
    +     ) %>%
  +     add_p() %>%
  +     bold_labels()
The following warnings were returned during `add_p()`:
  ! For variable `Days_to_Chronic_GVHD` (`Death`) and "estimate", "statistic", "p.value", "conf.low", and
"conf.high" statistics: cannot compute exact p-value with ties
! For variable `Days_to_Chronic_GVHD` (`Death`) and "estimate", "statistic", "p.value", "conf.low", and
"conf.high" statistics: cannot compute exact confidence intervals with ties
> table_df <- as_tibble(table1)
> write_xlsx(table_df, "Table1_SDOH_by_Death.xlsx")
> > table1 <- my_data_clean %>%
  Error: unexpected '>' in ">"
> table1 %>% as_gt()
> save.image("~/Projects/Aplastic Anemia SDOH/Rdata_AA_Demographics_7-9.RData")