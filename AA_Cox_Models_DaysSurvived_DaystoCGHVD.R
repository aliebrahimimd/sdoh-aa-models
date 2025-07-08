
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

> colnames(my_data)
[1] "Age"                      "Gender"                   "Donation_Type"           
[4] "Treatment_Date"           "Last_Visit_Date"          "Death_Date"              
[7] "Days_Survived"            "Death"                    "Acute_GVHD_Stage"        
[10] "Days_to_Acute_GVHD"       "Chronic_GVHD"             "Chronic_GVHD_Date"       
[13] "Days_to_Chronic_GVHD"     "Graft_Failure"            "Percent_SSI"             
[16] "Percent_Below_Poverty"    "Median_Income"            "Percent_Food_Stamps"     
[19] "Income_Housing_Ratio"     "Percent_Below_HighSchool" "Percent_No_Telephone"    
[22] "Percent_No_Vehicle"      
> install.packages("survival")
WARNING: Rtools is required to build R packages but is not currently installed. Please download and install the appropriate version of Rtools before proceeding:
  
  https://cran.rstudio.com/bin/windows/Rtools/
  trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/survival_3.8-3.zip'
Content type 'application/zip' length 8694837 bytes (8.3 MB)
downloaded 8.3 MB

package ‘survival’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\aebrahim\AppData\Local\Temp\RtmpWCHLAN\downloaded_packages
> View(plot_data)
> View(plot_data)
> View(my_data)
> write_xlsx(my_data, "Cleaned_SDOH_Data_7825")
Error in write_xlsx(my_data, "Cleaned_SDOH_Data_7825") : 
  could not find function "write_xlsx"
> install.packages("writexl")
WARNING: Rtools is required to build R packages but is not currently installed. Please download and install the appropriate version of Rtools before proceeding:
  
  https://cran.rstudio.com/bin/windows/Rtools/
  trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/writexl_1.5.4.zip'
Content type 'application/zip' length 204257 bytes (199 KB)
downloaded 199 KB

package ‘writexl’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\aebrahim\AppData\Local\Temp\RtmpWCHLAN\downloaded_packages
> write_xlsx(my_data, "Cleaned_SDOH_Data7825")
Error in write_xlsx(my_data, "Cleaned_SDOH_Data7825") : 
  could not find function "write_xlsx"
> library(writexl)
> write_xlsx(my_data, "Cleaned_SDOH_AA_7825")
> write_xlsx(my_data, "Cleaned_SDOH_AA_7825.xlsx")
> library (survival)
> library (survminer)
Error in library(survminer) : there is no package called ‘survminer’
> install.packages("survminer")
WARNING: Rtools is required to build R packages but is not currently installed. Please download and install the appropriate version of Rtools before proceeding:
  
  https://cran.rstudio.com/bin/windows/Rtools/
  also installing the dependencies ‘rbibutils’, ‘Deriv’, ‘modelr’, ‘microbenchmark’, ‘Rdpack’, ‘numDeriv’, ‘doBy’, ‘SparseM’, ‘MatrixModels’, ‘minqa’, ‘nloptr’, ‘reformulas’, ‘RcppEigen’, ‘carData’, ‘abind’, ‘Formula’, ‘pbkrtest’, ‘quantreg’, ‘lme4’, ‘corrplot’, ‘car’, ‘png’, ‘jpeg’, ‘ggrepel’, ‘ggsci’, ‘cowplot’, ‘ggsignif’, ‘polynom’, ‘rstatix’, ‘exactRankTests’, ‘mvtnorm’, ‘KMsurv’, ‘data.table’, ‘zoo’, ‘km.ci’, ‘xtable’, ‘gridtext’, ‘ggpubr’, ‘gridExtra’, ‘maxstat’, ‘survMisc’, ‘ggtext’


There is a binary version available but the source version is later:
  binary source needs_compilation
cowplot  1.1.3  1.2.0             FALSE

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/rbibutils_2.3.zip'
Content type 'application/zip' length 1032460 bytes (1008 KB)
downloaded 1008 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/Deriv_4.2.0.zip'
Content type 'application/zip' length 154592 bytes (150 KB)
downloaded 150 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/modelr_0.1.11.zip'
Content type 'application/zip' length 203787 bytes (199 KB)
downloaded 199 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/microbenchmark_1.5.0.zip'
Content type 'application/zip' length 73582 bytes (71 KB)
downloaded 71 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/Rdpack_2.6.4.zip'
Content type 'application/zip' length 639903 bytes (624 KB)
downloaded 624 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/numDeriv_2016.8-1.1.zip'
Content type 'application/zip' length 117304 bytes (114 KB)
downloaded 114 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/doBy_4.7.0.zip'
Content type 'application/zip' length 4911184 bytes (4.7 MB)
downloaded 4.7 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/SparseM_1.84-2.zip'
Content type 'application/zip' length 886907 bytes (866 KB)
downloaded 866 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/MatrixModels_0.5-4.zip'
Content type 'application/zip' length 408004 bytes (398 KB)
downloaded 398 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/minqa_1.2.8.zip'
Content type 'application/zip' length 441870 bytes (431 KB)
downloaded 431 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/nloptr_2.2.1.zip'
Content type 'application/zip' length 886622 bytes (865 KB)
downloaded 865 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/reformulas_0.4.1.zip'
Content type 'application/zip' length 135761 bytes (132 KB)
downloaded 132 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/RcppEigen_0.3.4.0.2.zip'
Content type 'application/zip' length 2592413 bytes (2.5 MB)
downloaded 2.5 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/carData_3.0-5.zip'
Content type 'application/zip' length 1707924 bytes (1.6 MB)
downloaded 1.6 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/abind_1.4-8.zip'
Content type 'application/zip' length 67211 bytes (65 KB)
downloaded 65 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/Formula_1.2-5.zip'
Content type 'application/zip' length 161370 bytes (157 KB)
downloaded 157 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/pbkrtest_0.5.4.zip'
Content type 'application/zip' length 229148 bytes (223 KB)
downloaded 223 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/quantreg_6.1.zip'
Content type 'application/zip' length 1473568 bytes (1.4 MB)
downloaded 1.4 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/lme4_1.1-37.zip'
Content type 'application/zip' length 4566089 bytes (4.4 MB)
downloaded 4.4 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/corrplot_0.95.zip'
Content type 'application/zip' length 3826182 bytes (3.6 MB)
downloaded 3.6 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/car_3.1-3.zip'
Content type 'application/zip' length 1541232 bytes (1.5 MB)
downloaded 1.5 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/png_0.1-8.zip'
Content type 'application/zip' length 194231 bytes (189 KB)
downloaded 189 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/jpeg_0.1-11.zip'
Content type 'application/zip' length 158793 bytes (155 KB)
downloaded 155 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/ggrepel_0.9.6.zip'
Content type 'application/zip' length 603889 bytes (589 KB)
downloaded 589 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/ggsci_3.2.0.zip'
Content type 'application/zip' length 2404298 bytes (2.3 MB)
downloaded 2.3 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/ggsignif_0.6.4.zip'
Content type 'application/zip' length 602245 bytes (588 KB)
downloaded 588 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/polynom_1.4-1.zip'
Content type 'application/zip' length 406976 bytes (397 KB)
downloaded 397 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/rstatix_0.7.2.zip'
Content type 'application/zip' length 620693 bytes (606 KB)
downloaded 606 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/exactRankTests_0.8-35.zip'
Content type 'application/zip' length 157416 bytes (153 KB)
downloaded 153 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/mvtnorm_1.3-3.zip'
Content type 'application/zip' length 956914 bytes (934 KB)
downloaded 934 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/KMsurv_0.1-6.zip'
Content type 'application/zip' length 132540 bytes (129 KB)
downloaded 129 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/data.table_1.17.6.zip'
Content type 'application/zip' length 2918480 bytes (2.8 MB)
downloaded 2.8 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/zoo_1.8-14.zip'
Content type 'application/zip' length 1035484 bytes (1011 KB)
downloaded 1011 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/km.ci_0.5-6.zip'
Content type 'application/zip' length 70034 bytes (68 KB)
downloaded 68 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/xtable_1.8-4.zip'
Content type 'application/zip' length 712304 bytes (695 KB)
downloaded 695 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/gridtext_0.1.5.zip'
Content type 'application/zip' length 674318 bytes (658 KB)
downloaded 658 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/ggpubr_0.6.1.zip'
Content type 'application/zip' length 2121780 bytes (2.0 MB)
downloaded 2.0 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/gridExtra_2.3.zip'
Content type 'application/zip' length 1109632 bytes (1.1 MB)
downloaded 1.1 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/maxstat_0.7-26.zip'
Content type 'application/zip' length 180013 bytes (175 KB)
downloaded 175 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/survMisc_0.5.6.zip'
Content type 'application/zip' length 345725 bytes (337 KB)
downloaded 337 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/ggtext_0.1.2.zip'
Content type 'application/zip' length 1265161 bytes (1.2 MB)
downloaded 1.2 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/survminer_0.5.0.zip'
Content type 'application/zip' length 2653355 bytes (2.5 MB)
downloaded 2.5 MB

package ‘rbibutils’ successfully unpacked and MD5 sums checked
package ‘Deriv’ successfully unpacked and MD5 sums checked
package ‘modelr’ successfully unpacked and MD5 sums checked
package ‘microbenchmark’ successfully unpacked and MD5 sums checked
package ‘Rdpack’ successfully unpacked and MD5 sums checked
package ‘numDeriv’ successfully unpacked and MD5 sums checked
package ‘doBy’ successfully unpacked and MD5 sums checked
package ‘SparseM’ successfully unpacked and MD5 sums checked
package ‘MatrixModels’ successfully unpacked and MD5 sums checked
package ‘minqa’ successfully unpacked and MD5 sums checked
package ‘nloptr’ successfully unpacked and MD5 sums checked
package ‘reformulas’ successfully unpacked and MD5 sums checked
package ‘RcppEigen’ successfully unpacked and MD5 sums checked
package ‘carData’ successfully unpacked and MD5 sums checked
package ‘abind’ successfully unpacked and MD5 sums checked
package ‘Formula’ successfully unpacked and MD5 sums checked
package ‘pbkrtest’ successfully unpacked and MD5 sums checked
package ‘quantreg’ successfully unpacked and MD5 sums checked
package ‘lme4’ successfully unpacked and MD5 sums checked
package ‘corrplot’ successfully unpacked and MD5 sums checked
package ‘car’ successfully unpacked and MD5 sums checked
package ‘png’ successfully unpacked and MD5 sums checked
package ‘jpeg’ successfully unpacked and MD5 sums checked
package ‘ggrepel’ successfully unpacked and MD5 sums checked
package ‘ggsci’ successfully unpacked and MD5 sums checked
package ‘ggsignif’ successfully unpacked and MD5 sums checked
package ‘polynom’ successfully unpacked and MD5 sums checked
package ‘rstatix’ successfully unpacked and MD5 sums checked
package ‘exactRankTests’ successfully unpacked and MD5 sums checked
package ‘mvtnorm’ successfully unpacked and MD5 sums checked
package ‘KMsurv’ successfully unpacked and MD5 sums checked
package ‘data.table’ successfully unpacked and MD5 sums checked
package ‘zoo’ successfully unpacked and MD5 sums checked
package ‘km.ci’ successfully unpacked and MD5 sums checked
package ‘xtable’ successfully unpacked and MD5 sums checked
package ‘gridtext’ successfully unpacked and MD5 sums checked
package ‘ggpubr’ successfully unpacked and MD5 sums checked
package ‘gridExtra’ successfully unpacked and MD5 sums checked
package ‘maxstat’ successfully unpacked and MD5 sums checked
package ‘survMisc’ successfully unpacked and MD5 sums checked
package ‘ggtext’ successfully unpacked and MD5 sums checked
package ‘survminer’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\aebrahim\AppData\Local\Temp\RtmpWCHLAN\downloaded_packages
installing the source package ‘cowplot’

trying URL 'https://cran.rstudio.com/src/contrib/cowplot_1.2.0.tar.gz'
Content type 'application/x-gzip' length 1638386 bytes (1.6 MB)
downloaded 1.6 MB

* installing *source* package 'cowplot' ...
** package 'cowplot' successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
*** copying figures
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (cowplot)

The downloaded source packages are in
‘C:\Users\aebrahim\AppData\Local\Temp\RtmpWCHLAN\downloaded_packages’
> library(survminer)
Loading required package: ggplot2
Loading required package: ggpubr

Attaching package: ‘survminer’

The following object is masked from ‘package:survival’:
  
  myeloma

> cox_model <- coxph(Surv(Days_Survived, Death)) ~ 
  + Age + Gender + Donation_Type + 
  +     Percent_SSI + Percent_Below_Poverty + 
  +     Median_Income + Percent_Food_Stamps + 
  +     Income_Housing_Ratio + Percent_Below_HighSchool + 
  +     Percent_No_Telephone + Percent_No_Vehicle, 
Error: unexpected ',' in:
  "    Income_Housing_Ratio + Percent_Below_HighSchool + 
    Percent_No_Telephone + Percent_No_Vehicle,"
> cox_model <- coxph(Surv(Days_Survived, Death) ~ 
                       +                        Age + Gender + Donation_Type +
                       +                        Percent_SSI + Percent_Below_Poverty +
                       +                        Median_Income + Percent_Food_Stamps +
                       +                        Income_Housing_Ratio + Percent_Below_HighSchool +
                       +                        Percent_No_Telephone + Percent_No_Vehicle,
                     +                    data = my_data)
Error in Surv(Days_Survived, Death) : 
  Invalid status value, must be logical or numeric
> unique(my_data$Death)
[1] "1" "0"
> my_data$Death <- as.numeric(my_data$Death)
> library(survival)
> 
  > cox_model <- coxph(Surv(Days_Survived, Death) ~ 
                         +                        Age + Gender + Donation_Type +
                         +                        Percent_SSI + Percent_Below_Poverty +
                         +                        Median_Income + Percent_Food_Stamps +
                         +                        Income_Housing_Ratio + Percent_Below_HighSchool +
                         +                        Percent_No_Telephone + Percent_No_Vehicle,
                       +                    data = my_data)
> 
  > summary(cox_model)
Call:
  coxph(formula = Surv(Days_Survived, Death) ~ Age + Gender + Donation_Type + 
          Percent_SSI + Percent_Below_Poverty + Median_Income + Percent_Food_Stamps + 
          Income_Housing_Ratio + Percent_Below_HighSchool + Percent_No_Telephone + 
          Percent_No_Vehicle, data = my_data)

n= 134, number of events= 25 
(20 observations deleted due to missingness)

coef  exp(coef)   se(coef)      z Pr(>|z|)    
Age                       4.589e-02  1.047e+00  1.149e-02  3.994 6.49e-05 ***
  GenderMale                7.262e-01  2.067e+00  4.459e-01  1.629   0.1034    
Donation_Typeunrel        6.680e-01  1.950e+00  4.971e-01  1.344   0.1791    
Percent_SSI               2.698e-01  1.310e+00  1.761e-01  1.532   0.1256    
Percent_Below_Poverty    -1.549e-02  9.846e-01  4.650e-02 -0.333   0.7390    
Median_Income             4.901e-06  1.000e+00  1.570e-05  0.312   0.7549    
Percent_Food_Stamps      -1.137e-01  8.925e-01  7.715e-02 -1.474   0.1404    
Income_Housing_Ratio      3.210e-02  1.033e+00  4.143e-02  0.775   0.4384    
Percent_Below_HighSchool  2.064e-02  1.021e+00  2.871e-02  0.719   0.4721    
Percent_No_Telephone      3.572e-01  1.429e+00  1.603e-01  2.227   0.0259 *  
  Percent_No_Vehicle        1.746e-02  1.018e+00  3.867e-02  0.452   0.6516    
---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

exp(coef) exp(-coef) lower .95 upper .95
Age                         1.0470     0.9551    1.0236     1.071
GenderMale                  2.0672     0.4837    0.8627     4.954
Donation_Typeunrel          1.9502     0.5128    0.7361     5.167
Percent_SSI                 1.3097     0.7636    0.9273     1.850
Percent_Below_Poverty       0.9846     1.0156    0.8989     1.079
Median_Income               1.0000     1.0000    1.0000     1.000
Percent_Food_Stamps         0.8925     1.1205    0.7672     1.038
Income_Housing_Ratio        1.0326     0.9684    0.9521     1.120
Percent_Below_HighSchool    1.0209     0.9796    0.9650     1.080
Percent_No_Telephone        1.4293     0.6997    1.0438     1.957
Percent_No_Vehicle          1.0176     0.9827    0.9433     1.098

Concordance= 0.806  (se = 0.039 )
Likelihood ratio test= 32.54  on 11 df,   p=6e-04
Wald test            = 28.35  on 11 df,   p=0.003
Score (logrank) test = 34.15  on 11 df,   p=3e-04

> 
  > library(broom)
> # Create tidy summary with hazard ratios
  > cox_results <- tidy(cox_model, exponentiate = TRUE, conf.int = TRUE)
> write_xlsx(cox_results, "Cox_Survival_Results.xlsx")
> my_data$Chronic_GVHD <- as.numeric(my_data$Chronic_GVHD)
> library(survival)
> 
  > cox_gvhd <- coxph(Surv(Days_to_Chronic_GVHD, Chronic_GVHD) ~ 
                        +                       Age + Gender + Donation_Type +
                        +                       Percent_SSI + Percent_Below_Poverty +
                        +                       Median_Income + Percent_Food_Stamps +
                        +                       Income_Housing_Ratio + Percent_Below_HighSchool +
                        +                       Percent_No_Telephone + Percent_No_Vehicle,
                      +                   data = my_data)
> 
  > summary(cox_gvhd)
Call:
  coxph(formula = Surv(Days_to_Chronic_GVHD, Chronic_GVHD) ~ Age + 
          Gender + Donation_Type + Percent_SSI + Percent_Below_Poverty + 
          Median_Income + Percent_Food_Stamps + Income_Housing_Ratio + 
          Percent_Below_HighSchool + Percent_No_Telephone + Percent_No_Vehicle, 
        data = my_data)

n= 26, number of events= 26 
(128 observations deleted due to missingness)

coef  exp(coef)   se(coef)      z Pr(>|z|)  
Age                      -2.804e-02  9.724e-01  1.837e-02 -1.526   0.1269  
GenderMale                1.014e+00  2.757e+00  8.930e-01  1.136   0.2561  
Donation_Typeunrel        4.358e-01  1.546e+00  6.240e-01  0.698   0.4849  
Percent_SSI               4.482e-01  1.566e+00  3.613e-01  1.240   0.2148  
Percent_Below_Poverty    -2.724e-02  9.731e-01  6.374e-02 -0.427   0.6691  
Median_Income            -1.693e-05  1.000e+00  2.053e-05 -0.825   0.4096  
Percent_Food_Stamps      -1.789e-01  8.362e-01  7.826e-02 -2.285   0.0223 *
  Income_Housing_Ratio     -8.326e-03  9.917e-01  4.792e-02 -0.174   0.8621  
Percent_Below_HighSchool  1.153e-02  1.012e+00  6.250e-02  0.185   0.8536  
Percent_No_Telephone      4.688e-01  1.598e+00  2.910e-01  1.611   0.1072  
Percent_No_Vehicle        2.480e-02  1.025e+00  1.523e-01  0.163   0.8706  
---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

exp(coef) exp(-coef) lower .95 upper .95
Age                         0.9724     1.0284    0.9380    1.0080
GenderMale                  2.7573     0.3627    0.4790   15.8723
Donation_Typeunrel          1.5463     0.6467    0.4551    5.2537
Percent_SSI                 1.5655     0.6388    0.7711    3.1786
Percent_Below_Poverty       0.9731     1.0276    0.8589    1.1026
Median_Income               1.0000     1.0000    0.9999    1.0000
Percent_Food_Stamps         0.8362     1.1959    0.7173    0.9749
Income_Housing_Ratio        0.9917     1.0084    0.9028    1.0894
Percent_Below_HighSchool    1.0116     0.9885    0.8950    1.1434
Percent_No_Telephone        1.5981     0.6257    0.9034    2.8271
Percent_No_Vehicle          1.0251     0.9755    0.7606    1.3816

Concordance= 0.783  (se = 0.037 )
Likelihood ratio test= 20.91  on 11 df,   p=0.03
Wald test            = 18.17  on 11 df,   p=0.08
Score (logrank) test = 24.21  on 11 df,   p=0.01

> 
  > # Extract, clean, and rename columns
  > gvhd_results <- tidy(cox_gvhd, exponentiate = TRUE, conf.int = TRUE) %>%
  +     mutate(across(where(is.numeric), round, 3)) %>%
  +     rename(
    +         Predictor = term,
    +         HR = estimate,
    +         `95% CI (Lower)` = conf.low,
    +         `95% CI (Upper)` = conf.high,
    +         p = p.value
    +     )
Error in rename(., Predictor = term, HR = estimate, `95% CI (Lower)` = conf.low,  : 
                  could not find function "rename"
                > library(dplyr)
                
                Attaching package: ‘dplyr’
                
                The following objects are masked from ‘package:stats’:
                  
                  filter, lag
                
                The following objects are masked from ‘package:base’:
                  
                  intersect, setdiff, setequal, union
                
                > gvhd_results <- tidy(cox_gvhd, exponentiate = TRUE, conf.int = TRUE) %>%
                  +     mutate(across(where(is.numeric), round, 3)) %>%
                  +     rename(
                    +         Predictor = term,
                    +         HR = estimate,
                    +         `95% CI (Lower)` = conf.low,
                    +         `95% CI (Upper)` = conf.high,
                    +         p = p.value
                    +     )
                Warning message:
                  There was 1 warning in `mutate()`.
                ℹ In argument: `across(where(is.numeric), round, 3)`.
                Caused by warning:
                  ! The `...` argument of `across()` is deprecated as of dplyr 1.1.0.
                Supply arguments directly to `.fns` through an anonymous function instead.
                
                # Previously
                across(a:b, mean, na.rm = TRUE)
                
                # Now
                across(a:b, \(x) mean(x, na.rm = TRUE))
                This warning is displayed once every 8 hours.
                Call `lifecycle::last_lifecycle_warnings()` to see where this warning was generated. 
                > gvhd_results <- tidy(cox_gvhd, exponentiate = TRUE, conf.int = TRUE) %>%
                  +     mutate(across(where(is.numeric), \(x) round(x, 3))) %>%
                  +     rename(
                    +         Predictor = term,
                    +         HR = estimate,
                    +         `95% CI (Lower)` = conf.low,
                    +         `95% CI (Upper)` = conf.high,
                    +         p = p.value
                    +     )
                > 
                  > write_xlsx(gvhd_results, "Cox_GVHD_Results.xlsx")
                > # Make sure event is numeric
                  > my_data$Chronic_GVHD <- as.numeric(my_data$Chronic_GVHD)
                > 
                  > # Fit the survival object
                  > surv_object <- Surv(time = my_data$Days_to_Chronic_GVHD,
                                        +                     event = my_data$Chronic_GVHD)
                > 
                  > # Fit KM model stratified by gender
                  > fit <- survfit(surv_object ~ Gender, data = my_data)
                > 
                  > # Plot with ggplot styling
                  > ggsurvplot(fit, data = my_data,
                               +            pval = TRUE, 
                               +            conf.int = TRUE,
                               +            risk.table = TRUE, 
                               +            legend.title = "Gender",
                               +            legend.labs = c("Female", "Male"),
                               +            xlab = "Days to Chronic GVHD",
                               +            ylab = "Survival Probability",
                               +            title = "Kaplan-Meier Curve: Time to Chronic GVHD by Gender",
                               +            palette = "Dark2")
                > 
                  > # Ensure Death is numeric
                  > my_data$Death <- as.numeric(my_data$Death)
                > 
                  > # Create a survival object for time to death
                  > surv_object <- Surv(time = my_data$Days_Survived, event = my_data$Death)
                > 
                  > # Fit Kaplan-Meier model stratified by gender
                  > fit <- survfit(surv_object ~ Gender, data = my_data)
                > 
                  > # Plot the KM curve
                  > ggsurvplot(fit, data = my_data,
                               +            pval = TRUE,
                               +            conf.int = TRUE,
                               +            risk.table = TRUE,
                               +            legend.title = "Gender",
                               +            legend.labs = c("Female", "Male"),
                               +            xlab = "Days Survived",
                               +            ylab = "Survival Probability",
                               +            title = "Kaplan-Meier Curve: Survival by Gender",
                               +            palette = "Dark2")
                > 
                  > library(broom)
                > library(ggplot2)
                > library(dplyr)
                > # Get tidy model results with HR and CI
                  > cox_results <- tidy(cox_model, exponentiate = TRUE, conf.int = TRUE)
                > 
                  > # Clean and round
                  > cox_results <- cox_results %>%
                  +     filter(term != "(Intercept)") %>%
                  +     mutate(
                    +         term = gsub("_", " ", term),
                    +         term = gsub("Donation Typeunrel", "Unrelated Donation", term),
                    +         term = gsub("GenderMale", "Male Gender", term),
                    +         HR = estimate,
                    +         lower = conf.low,
                    +         upper = conf.high
                    +     )
                > ggplot(cox_results, aes(x = reorder(term, HR), y = HR)) +
                  +     geom_point() +
                  +     geom_errorbar(aes(ymin = lower, ymax = upper), width = 0.2) +
                  +     geom_hline(yintercept = 1, linetype = "dashed") +
                  +     coord_flip() +
                  +     labs(title = "Forest Plot: Predictors of Mortality",
                             +          x = "Predictor",
                             +          y = "Hazard Ratio (HR)") +
                  +     theme_minimal()
                > 
                  > ggsave("forest_plot_death.png", width = 8, height = 5, dpi = 300)
                > # Get tidy model results with HR and CI
                  > cox_results <- tidy(cox_gvhd, exponentiate = TRUE, conf.int = TRUE)
                > 
                  > # Clean and round
                  > cox_results <- cox_results %>%
                  +     filter(term != "(Intercept)") %>%
                  +     mutate(
                    +         term = gsub("_", " ", term),
                    +         term = gsub("Donation Typeunrel", "Unrelated Donation", term),
                    +         term = gsub("GenderMale", "Male Gender", term),
                    +         HR = estimate,
                    +         lower = conf.low,
                    +         upper = conf.high
                    +     )
                > ggplot(cox_results, aes(x = reorder(term, HR), y = HR)) +
                  +     geom_point() +
                  +     geom_errorbar(aes(ymin = lower, ymax = upper), width = 0.2) +
                  +     geom_hline(yintercept = 1, linetype = "dashed") +
                  +     coord_flip() +
                  +     labs(title = "Forest Plot: Predictors of Mortality",
                             +          x = "Predictor",
                             +          y = "Hazard Ratio (HR)") +
                  +     theme_minimal()
                > ggplot(cox_results, aes(x = reorder(term, HR), y = HR)) +
                  +     geom_point() +
                  +     geom_errorbar(aes(ymin = lower, ymax = upper), width = 0.2) +
                  +     geom_hline(yintercept = 1, linetype = "dashed") +
                  +     coord_flip() +
                  +     labs(title = "Forest Plot: Predictors of Chronic GVHD",
                             +          x = "Predictor",
                             +          y = "Hazard Ratio (HR)") +
                  +     theme_minimal()
                > ggsave("forest_plot_death.png", width = 8, height = 5, dpi = 300)
                > 
                  > # Get tidy model results with HR and CI
                  > cox_results <- tidy(cox_model, exponentiate = TRUE, conf.int = TRUE)
                > 
                  > # Clean and round
                  > cox_results <- cox_results %>%
                  +     filter(term != "(Intercept)") %>%
                  +     mutate(
                    +         term = gsub("_", " ", term),
                    +         term = gsub("Donation Typeunrel", "Unrelated Donation", term),
                    +         term = gsub("GenderMale", "Male Gender", term),
                    +         HR = estimate,
                    +         lower = conf.low,
                    +         upper = conf.high
                    +     )
                > ggplot(cox_results, aes(x = reorder(term, HR), y = HR)) +
                  +     geom_point() +
                  +     geom_errorbar(aes(ymin = lower, ymax = upper), width = 0.2) +
                  +     geom_hline(yintercept = 1, linetype = "dashed") +
                  +     coord_flip() +
                  +     labs(title = "Forest Plot: Predictors of Mortality",
                             +          x = "Predictor",
                             +          y = "Hazard Ratio (HR)") +
                  +     theme_minimal()