> library(dplyr)
> death_results <- tidy(death_model, conf.int = TRUE, exponentiate = TRUE) %>%
  +     filter(term != "(Intercept)") %>%
  +     mutate(across(where(is.numeric), ~ round(., 3))) %>%
  +     rename(
    +         Predictor = term,
    +         OR = estimate,
    +         `95% CI (Lower)` = conf.low,
    +         `95% CI (Upper)` = conf.high,
    +         p = p.value
    +     )
> write_xlsx(death_results, "Logistic_Regression_Death.xlsx")
> gvhd_results <- tidy(gvhd_model, conf.int = TRUE, exponentiate = TRUE) %>%
  +     filter(term != "(Intercept)") %>%
  +     mutate(across(where(is.numeric), ~ round(., 3))) %>%
  +     rename(
    +         Predictor = term,
    +         OR = estimate,
    +         `95% CI (Lower)` = conf.low,
    +         `95% CI (Upper)` = conf.high,
    +         p = p.value
    +     )
> write_xlsx(gvhd_results, "Logistic_Regression_GVHD.xlsx")
> #check fittness
  > install.packages("pROC")
WARNING: Rtools is required to build R packages but is not currently installed. Please download and install the appropriate version of Rtools before proceeding:
  
  https://cran.rstudio.com/bin/windows/Rtools/
  also installing the dependency ‘plyr’

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/plyr_1.8.9.zip'
Content type 'application/zip' length 1111914 bytes (1.1 MB)
downloaded 1.1 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/pROC_1.18.5.zip'
Content type 'application/zip' length 1168350 bytes (1.1 MB)
downloaded 1.1 MB

package ‘plyr’ successfully unpacked and MD5 sums checked
package ‘pROC’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\aebrahim\AppData\Local\Temp\Rtmp2bNxwM\downloaded_packages
> # For death
  > roc_death <- roc(my_data$Death, fitted(death_model))
Error in roc(my_data$Death, fitted(death_model)) : 
  could not find function "roc"
> library(pROC)
Type 'citation("pROC")' for a citation.

Attaching package: ‘pROC’

The following objects are masked from ‘package:stats’:
  
  cov, smooth, var

> roc_death <- roc(my_data$Death, fitted(death_model))
Setting levels: control = 0, case = 1
Error in roc.default(my_data$Death, fitted(death_model)) : 
  Response and predictor must be vectors of the same length.
> my_data$Death <- as.numeric(my_data$Death)
> roc_data <- my_data %>%
  +     mutate(predicted = fitted(death_model)) %>%
  +     filter(!is.na(Death), !is.na(predicted))
Error in `mutate()`:
  ℹ In argument: `predicted = fitted(death_model)`.
Caused by error:
  ! `predicted` must be size 154 or 1, not 134.
Run `rlang::last_trace()` to see where the error occurred.
> roc_death <- roc(roc_data$Death, roc_data$predicted)
Error: object 'roc_data' not found
> #cox_models 
  > #death_model
  > library(survival)
> my_data$Death <- as.numeric(my_data$Death)
> cox_death <- coxph(Surv(Days_Survived, Death) ~ Age + Gender + Donation_Type +
                       +                        Percent_SSI + Percent_Below_Poverty + Median_Income +
                       +                        Percent_Food_Stamps + Income_Housing_Ratio +
                       +                        Percent_Below_HighSchool + Percent_No_Telephone + Percent_No_Vehicle,
                     +                    data = my_data)
> summary(cox_death)
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

> my_data$Chronic_GVHD <- as.numeric(my_data$Chronic_GVHD)
> cox_gvhd <- coxph(Surv(Days_to_Chronic_GVHD, Chronic_GVHD) ~ Age + Gender + Donation_Type +
                      +                       Percent_SSI + Percent_Below_Poverty + Median_Income +
                      +                       Percent_Food_Stamps + Income_Housing_Ratio +
                      +                       Percent_Below_HighSchool + Percent_No_Telephone + Percent_No_Vehicle,
                    +                   data = my_data)
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

> library(ggplot2)
> library(broom)
> library(dplyr)
> #Figures
  > Death
Error: object 'Death' not found
> death_forest <- tidy(cox_death, exponentiate = TRUE, conf.int = TRUE) %>%
  +     filter(term != "(Intercept)")
> ggplot(death_forest, aes(x = term, y = estimate, ymin = conf.low, ymax = conf.high)) +
  +     geom_pointrange() +
  +     geom_hline(yintercept = 1, linetype = "dashed", color = "red") +
  +     coord_flip() +
  +     labs(title = "Forest Plot: Hazard Ratios for Death (Overall Survival)",
             +          x = "Predictor",
             +          y = "Hazard Ratio (95% CI)") +
  +     theme_minimal()
> gvhd_forest <- tidy(cox_gvhd, exponentiate = TRUE, conf.int = TRUE) %>%
  +     filter(term != "(Intercept)")
> ggplot(gvhd_forest, aes(x = term, y = estimate, ymin = conf.low, ymax = conf.high)) +
  +     geom_pointrange() +
  +     geom_hline(yintercept = 1, linetype = "dashed", color = "red") +
  +     coord_flip() +
  +     labs(title = "Forest Plot: Hazard Ratios for Chronic GVHD",
             +          x = "Predictor",
             +          y = "Hazard Ratio (95% CI)") +
  +     theme_minimal()
> library(writexl)
> death_hr <- tidy(cox_death, conf.int = TRUE, exponentiate = TRUE) %>%
  +     filter(term != "(Intercept)") %>%
  +     mutate(across(where(is.numeric), ~ round(., 3))) %>%
  +     rename(
    +         Predictor = term,
    +         HR = estimate,
    +         `95% CI (Lower)` = conf.low,
    +         `95% CI (Upper)` = conf.high,
    +         p = p.value
    +     )
> write_xlsx(death_hr, "Cox_HR_Death_Model.xlsx")
> gvhd_hr <- tidy(cox_gvhd, conf.int = TRUE, exponentiate = TRUE) %>%
  +     filter(term != "(Intercept)") %>%
  +     mutate(across(where(is.numeric), ~ round(., 3))) %>%
  +     rename(
    +         Predictor = term,
    +         HR = estimate,
    +         `95% CI (Lower)` = conf.low,
    +         `95% CI (Upper)` = conf.high,
    +         p = p.value
    +     )
> write_xlsx(gvhd_hr, "Cox_HR_Chronic_GVHD_Model.xlsx")
> cox.zph(cox_death)
chisq df     p
Age                      0.96982  1 0.325
Gender                   0.01519  1 0.902
Donation_Type            0.00390  1 0.950
Percent_SSI              0.03760  1 0.846
Percent_Below_Poverty    0.33236  1 0.564
Median_Income            1.85900  1 0.173
Percent_Food_Stamps      0.01707  1 0.896
Income_Housing_Ratio     4.19081  1 0.041
Percent_Below_HighSchool 2.22532  1 0.136
Percent_No_Telephone     0.00701  1 0.933
Percent_No_Vehicle       0.30852  1 0.579
GLOBAL                   6.70717 11 0.822
> cox.zph(cox_gvhd)
chisq df     p
Age                       0.3502  1 0.554
Gender                    0.0955  1 0.757
Donation_Type             2.1694  1 0.141
Percent_SSI               1.4903  1 0.222
Percent_Below_Poverty     2.5179  1 0.113
Median_Income             0.0335  1 0.855
Percent_Food_Stamps       0.1704  1 0.680
Income_Housing_Ratio      3.4664  1 0.063
Percent_Below_HighSchool  0.8785  1 0.349
Percent_No_Telephone      3.6505  1 0.056
Percent_No_Vehicle        3.0454  1 0.081
GLOBAL                   23.8076 11 0.014
> plot(cox.zph(cox_death)) 
> cox_snell <- -log(survfit(cox_death)$surv)
> plot(cox_snell, type = "s", ylab = "Cumulative Hazard", xlab = "Cox-Snell Residuals")
> abline(0, 1, col = "red")
> ph_test_death <- cox.zph(cox_death)
> par(mfrow = c(3, 4))
> plot(ph_test_death)
> ph_test_gvhd <- cox.zph(cox_gvhd)
> 
  > par(mfrow = c(3, 4))
> plot(ph_test_gvhd)
> #Acute GVHD
  > install.packages("MASS")
WARNING: Rtools is required to build R packages but is not currently installed. Please download and install the appropriate version of Rtools before proceeding:
  
  https://cran.rstudio.com/bin/windows/Rtools/
  trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/MASS_7.3-65.zip'
Content type 'application/zip' length 1172414 bytes (1.1 MB)
downloaded 1.1 MB

package ‘MASS’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\aebrahim\AppData\Local\Temp\Rtmp2bNxwM\downloaded_packages
> library(MASS)

Attaching package: ‘MASS’

The following object is masked from ‘package:dplyr’:
  
  select

> my_data$Acute_GVHD_Stage <- factor(my_data$Acute_GVHD_Stage,
                                     +                                    levels = c("0", "I", "II", "III", "IV"),
                                     +                                    ordered = TRUE)
> 
  > acute_ord_model <- polr(Acute_GVHD_Stage ~ Age + Gender + Donation_Type + 
                              +                             Percent_SSI + Percent_Below_Poverty + Median_Income +
                              +                             Percent_Food_Stamps + Income_Housing_Ratio +
                              +                             Percent_Below_HighSchool + Percent_No_Telephone + Percent_No_Vehicle,
                            +                         data = my_data, Hess = TRUE)
> summary(acute_ord_model)
Call:
  polr(formula = Acute_GVHD_Stage ~ Age + Gender + Donation_Type + 
         Percent_SSI + Percent_Below_Poverty + Median_Income + Percent_Food_Stamps + 
         Income_Housing_Ratio + Percent_Below_HighSchool + Percent_No_Telephone + 
         Percent_No_Vehicle, data = my_data, Hess = TRUE)

Coefficients:
  Value Std. Error   t value
Age                      -2.421e-07        NaN       NaN
GenderMale               -3.621e-09        NaN       NaN
Donation_Typeunrel       -3.374e-09        NaN       NaN
Percent_SSI              -3.233e-08        NaN       NaN
Percent_Below_Poverty    -1.264e-07        NaN       NaN
Median_Income            -4.327e-04   1.07e-11 -40425209
Percent_Food_Stamps      -1.088e-07        NaN       NaN
Income_Housing_Ratio     -2.034e-07        NaN       NaN
Percent_Below_HighSchool -1.444e-07        NaN       NaN
Percent_No_Telephone     -2.503e-08        NaN       NaN
Percent_No_Vehicle       -7.564e-08        NaN       NaN

Intercepts:
  Value         Std. Error    t value      
0|I     2.558520e+01           NaN           NaN
I|II    2.656610e+01           NaN           NaN
II|III  2.737700e+01           NaN           NaN
III|IV  2.835780e+01           NaN           NaN

Residual Deviance: 8.881784e-16 
AIC: 30.00 
(103 observations deleted due to missingness)
Warning message:
  In sqrt(diag(vc)) : NaNs produced
> #Treat Acute GVHD as Binary
  > my_data$Acute_GVHD_Binary <- ifelse(as.character(my_data$Acute_GVHD_Stage) == "0", 0, 1)
> acute_model <- glm(Acute_GVHD_Binary ~ Age + Gender + Donation_Type + 
                       +                        Percent_SSI + Percent_Below_Poverty + Median_Income +
                       +                        Percent_Food_Stamps + Income_Housing_Ratio +
                       +                        Percent_Below_HighSchool + Percent_No_Telephone + Percent_No_Vehicle,
                     +                    family = binomial(link = "logit"),
                     +                    data = my_data)
> summary(acute_model)

Call:
  glm(formula = Acute_GVHD_Binary ~ Age + Gender + Donation_Type + 
        Percent_SSI + Percent_Below_Poverty + Median_Income + Percent_Food_Stamps + 
        Income_Housing_Ratio + Percent_Below_HighSchool + Percent_No_Telephone + 
        Percent_No_Vehicle, family = binomial(link = "logit"), data = my_data)

Coefficients:
  Estimate Std. Error z value Pr(>|z|)
(Intercept)              -2.657e+01  5.705e+05       0        1
Age                       1.939e-16  2.680e+03       0        1
GenderMale                6.736e-15  1.094e+05       0        1
Donation_Typeunrel        1.779e-14  1.179e+05       0        1
Percent_SSI               3.450e-15  4.493e+04       0        1
Percent_Below_Poverty     3.497e-16  1.579e+04       0        1
Median_Income            -5.420e-19  4.341e+00       0        1
Percent_Food_Stamps      -5.011e-15  1.884e+04       0        1
Income_Housing_Ratio      2.873e-15  1.700e+04       0        1
Percent_Below_HighSchool -7.958e-16  8.138e+03       0        1
Percent_No_Telephone      4.170e-15  3.856e+04       0        1
Percent_No_Vehicle       -1.721e-16  8.205e+03       0        1

(Dispersion parameter for binomial family taken to be 1)

Null deviance: 0.0000e+00  on 50  degrees of freedom
Residual deviance: 2.9588e-10  on 39  degrees of freedom
(103 observations deleted due to missingness)
AIC: 24

Number of Fisher Scoring iterations: 25

> exp(cbind(OR = coef(acute_model), confint(acute_model)))
Waiting for profiling to be done...
Error in approx(sp$y, sp$x, xout = cutoff) : 
  need at least two non-NA values to interpolate
In addition: There were 50 or more warnings (use warnings() to see the first 50)
> exp(coef(acute_model))
(Intercept)                      Age               GenderMale       Donation_Typeunrel 
2.900701e-12             1.000000e+00             1.000000e+00             1.000000e+00 
Percent_SSI    Percent_Below_Poverty            Median_Income      Percent_Food_Stamps 
1.000000e+00             1.000000e+00             1.000000e+00             1.000000e+00 
Income_Housing_Ratio Percent_Below_HighSchool     Percent_No_Telephone       Percent_No_Vehicle 
1.000000e+00             1.000000e+00             1.000000e+00             1.000000e+00 
> exp(confint(death_model))
Waiting for profiling to be done...
2.5 %    97.5 %
  (Intercept)              4.217306e-06 0.5066562
Age                      1.031743e+00 1.0943224
GenderMale               8.733729e-01 8.2708646
Donation_Typeunrel       8.634747e-01 9.0122663
Percent_SSI              8.630959e-01 2.0955178
Percent_Below_Poverty    8.104299e-01 1.1246224
Median_Income            9.999461e-01 1.0000276
Percent_Food_Stamps      6.886018e-01 1.0188841
Income_Housing_Ratio     9.431573e-01 1.2788074
Percent_Below_HighSchool 9.549003e-01 1.1038037
Percent_No_Telephone     1.059406e+00 2.3138158
Percent_No_Vehicle       8.971621e-01 1.1134838
> summary(acute_model)

Call:
  glm(formula = Acute_GVHD_Binary ~ Age + Gender + Donation_Type + 
        Percent_SSI + Percent_Below_Poverty + Median_Income + Percent_Food_Stamps + 
        Income_Housing_Ratio + Percent_Below_HighSchool + Percent_No_Telephone + 
        Percent_No_Vehicle, family = binomial(link = "logit"), data = my_data)

Coefficients:
  Estimate Std. Error z value Pr(>|z|)
(Intercept)              -2.657e+01  5.705e+05       0        1
Age                       1.939e-16  2.680e+03       0        1
GenderMale                6.736e-15  1.094e+05       0        1
Donation_Typeunrel        1.779e-14  1.179e+05       0        1
Percent_SSI               3.450e-15  4.493e+04       0        1
Percent_Below_Poverty     3.497e-16  1.579e+04       0        1
Median_Income            -5.420e-19  4.341e+00       0        1
Percent_Food_Stamps      -5.011e-15  1.884e+04       0        1
Income_Housing_Ratio      2.873e-15  1.700e+04       0        1
Percent_Below_HighSchool -7.958e-16  8.138e+03       0        1
Percent_No_Telephone      4.170e-15  3.856e+04       0        1
Percent_No_Vehicle       -1.721e-16  8.205e+03       0        1

(Dispersion parameter for binomial family taken to be 1)

Null deviance: 0.0000e+00  on 50  degrees of freedom
Residual deviance: 2.9588e-10  on 39  degrees of freedom
(103 observations deleted due to missingness)
AIC: 24

Number of Fisher Scoring iterations: 25

> exp(coef(acute_model))
(Intercept)                      Age               GenderMale       Donation_Typeunrel 
2.900701e-12             1.000000e+00             1.000000e+00             1.000000e+00 
Percent_SSI    Percent_Below_Poverty            Median_Income      Percent_Food_Stamps 
1.000000e+00             1.000000e+00             1.000000e+00             1.000000e+00 
Income_Housing_Ratio Percent_Below_HighSchool     Percent_No_Telephone       Percent_No_Vehicle 
1.000000e+00             1.000000e+00             1.000000e+00             1.000000e+00 
> exp(confint(acute_model))
Waiting for profiling to be done...
Error in approx(sp$y, sp$x, xout = cutoff) : 
  need at least two non-NA values to interpolate
In addition: There were 50 or more warnings (use warnings() to see the first 50)
> table(my_data$Acute_GVHD_Binary)

0 
57 
> confint.default(acute_model)
2.5 %       97.5 %
  (Intercept)              -1.118242e+06 1.118189e+06
Age                      -5.253028e+03 5.253028e+03
GenderMale               -2.145081e+05 2.145081e+05
Donation_Typeunrel       -2.311217e+05 2.311217e+05
Percent_SSI              -8.805145e+04 8.805145e+04
Percent_Below_Poverty    -3.094686e+04 3.094686e+04
Median_Income            -8.507515e+00 8.507515e+00
Percent_Food_Stamps      -3.693132e+04 3.693132e+04
Income_Housing_Ratio     -3.332766e+04 3.332766e+04
Percent_Below_HighSchool -1.595089e+04 1.595089e+04
Percent_No_Telephone     -7.556964e+04 7.556964e+04
Percent_No_Vehicle       -1.608144e+04 1.608144e+04
> exp(cbind(OR = coef(acute_model), confint.default(acute_model)))
OR        2.5 %   97.5 %
  (Intercept)              2.900701e-12 0.0000000000      Inf
Age                      1.000000e+00 0.0000000000      Inf
GenderMale               1.000000e+00 0.0000000000      Inf
Donation_Typeunrel       1.000000e+00 0.0000000000      Inf
Percent_SSI              1.000000e+00 0.0000000000      Inf
Percent_Below_Poverty    1.000000e+00 0.0000000000      Inf
Median_Income            1.000000e+00 0.0002019451 4951.841
Percent_Food_Stamps      1.000000e+00 0.0000000000      Inf
Income_Housing_Ratio     1.000000e+00 0.0000000000      Inf
Percent_Below_HighSchool 1.000000e+00 0.0000000000      Inf
Percent_No_Telephone     1.000000e+00 0.0000000000      Inf
Percent_No_Vehicle       1.000000e+00 0.0000000000      Inf
> summary(acute_model)

Call:
  glm(formula = Acute_GVHD_Binary ~ Age + Gender + Donation_Type + 
        Percent_SSI + Percent_Below_Poverty + Median_Income + Percent_Food_Stamps + 
        Income_Housing_Ratio + Percent_Below_HighSchool + Percent_No_Telephone + 
        Percent_No_Vehicle, family = binomial(link = "logit"), data = my_data)

Coefficients:
  Estimate Std. Error z value Pr(>|z|)
(Intercept)              -2.657e+01  5.705e+05       0        1
Age                       1.939e-16  2.680e+03       0        1
GenderMale                6.736e-15  1.094e+05       0        1
Donation_Typeunrel        1.779e-14  1.179e+05       0        1
Percent_SSI               3.450e-15  4.493e+04       0        1
Percent_Below_Poverty     3.497e-16  1.579e+04       0        1
Median_Income            -5.420e-19  4.341e+00       0        1
Percent_Food_Stamps      -5.011e-15  1.884e+04       0        1
Income_Housing_Ratio      2.873e-15  1.700e+04       0        1
Percent_Below_HighSchool -7.958e-16  8.138e+03       0        1
Percent_No_Telephone      4.170e-15  3.856e+04       0        1
Percent_No_Vehicle       -1.721e-16  8.205e+03       0        1

(Dispersion parameter for binomial family taken to be 1)

Null deviance: 0.0000e+00  on 50  degrees of freedom
Residual deviance: 2.9588e-10  on 39  degrees of freedom
(103 observations deleted due to missingness)
AIC: 24

Number of Fisher Scoring iterations: 25

> tidy_model <- tidy(acute_model, conf.int = TRUE, conf.level = 0.95, exponentiate = TRUE)
Error in approx(sp$y, sp$x, xout = cutoff) : 
  need at least two non-NA values to interpolate
In addition: There were 50 or more warnings (use warnings() to see the first 50)
> ggplot(tidy_model[-1, ], aes(x = term, y = estimate)) +  # exclude intercept
  +     geom_point(size = 3) +
  +     geom_errorbar(aes(ymin = conf.low, ymax = conf.high), width = 0.2) +
  +     geom_hline(yintercept = 1, linetype = "dashed") +
  +     coord_flip() +  # flip axes for readability
  +     labs(title = "Odds Ratios for Acute GVHD (Binary)",
             +          x = "",
             +          y = "Odds Ratio (log scale)") +
  +     scale_y_log10() +
  +     theme_minimal()
Error: object 'tidy_model' not found
> tidy_model <- tidy(acute_model, conf.int = TRUE, conf.level = 0.95, exponentiate = TRUE)
Error in approx(sp$y, sp$x, xout = cutoff) : 
  need at least two non-NA values to interpolate
In addition: There were 50 or more warnings (use warnings() to see the first 50)
> coefs <- summary(acute_model)$coefficients
> 
  > or_table <- data.frame(
    +     term = rownames(coefs),
    +     estimate = exp(coefs[, "Estimate"]),
    +     conf.low = exp(coefs[, "Estimate"] - 1.96 * coefs[, "Std. Error"]),
    +     conf.high = exp(coefs[, "Estimate"] + 1.96 * coefs[, "Std. Error"]),
    +     p.value = coefs[, "Pr(>|z|)"]
    + )
> or_table <- or_table %>% filter(term != "(Intercept)")
> or_table$term <- gsub("_", " ", or_table$term)
> or_table$term <- gsub("GenderMale", "Male (vs Female)", or_table$term)
> or_table$term <- gsub("Donation Typeunrel", "Unrelated Donation (vs Related)", or_table$term)
> ggplot(or_table, aes(x = reorder(term, estimate), y = estimate)) +
  +     geom_point(size = 3) +
  +     geom_errorbar(aes(ymin = conf.low, ymax = conf.high), width = 0.2) +
  +     geom_hline(yintercept = 1, linetype = "dashed") +
  +     coord_flip() +
  +     scale_y_log10() +
  +     labs(title = "Odds Ratios for Acute GVHD (Binary)",
             +          x = "", y = "Odds Ratio (log scale)") +
  +     theme_minimal()
Warning message:
  In scale_y_log10() :
  log-10 transformation introduced infinite values.
> my_data$Acute_GVHD_Binary <- ifelse(as.character(my_data$Acute_GVHD_Stage) == "0", 0, 1)
> cox_acute <- coxph(Surv(Days_to_Acute_GVHD, Acute_GVHD_Binary) ~
                       +                        Age + Gender + Donation_Type +
                       +                        Percent_SSI + Percent_Below_Poverty + Median_Income +
                       +                        Percent_Food_Stamps + Income_Housing_Ratio +
                       +                        Percent_Below_HighSchool + Percent_No_Telephone + Percent_No_Vehicle,
                     +                    data = my_data)
Error in coxph(Surv(Days_to_Acute_GVHD, Acute_GVHD_Binary) ~ Age + Gender +  : 
                 No (non-missing) observations
               > colSums(is.na(my_data[, c("Days_to_Acute_GVHD", "Acute_GVHD_Stage")]))
               Days_to_Acute_GVHD   Acute_GVHD_Stage 
               57                 97 
               > my_data <- my_data %>%
                 +     mutate(Acute_GVHD_Binary = ifelse(is.na(Acute_GVHD_Stage), NA,
                                                         +                                       ifelse(Acute_GVHD_Stage == 0, 0, 1)))
               > model_data <- my_data %>%
                 +     filter(!is.na(Days_to_Acute_GVHD), !is.na(Acute_GVHD_Binary)) %>%
                 +     select(Days_to_Acute_GVHD, Acute_GVHD_Binary, Age, Gender, Donation_Type,
                              +            Percent_SSI, Percent_Below_Poverty, Median_Income, Percent_Food_Stamps,
                              +            Income_Housing_Ratio, Percent_Below_HighSchool, Percent_No_Telephone,
                              +            Percent_No_Vehicle) %>%
                 +     na.omit()
               Error in select(., Days_to_Acute_GVHD, Acute_GVHD_Binary, Age, Gender,  : 
                                 unused arguments (Days_to_Acute_GVHD, Acute_GVHD_Binary, Age, Gender, Donation_Type, Percent_SSI, Percent_Below_Poverty, Median_Income, Percent_Food_Stamps, Income_Housing_Ratio, Percent_Below_HighSchool, Percent_No_Telephone, Percent_No_Vehicle)
                               > library(dplyr)
                               > library(survival)
                               > my_data <- my_data %>%
                                 +     mutate(Acute_GVHD_Binary = ifelse(is.na(Acute_GVHD_Stage), NA,
                                                                         +                                       ifelse(Acute_GVHD_Stage == 0, 0, 1)))
                               > model_data <- my_data %>%
                                 +     filter(!is.na(Days_to_Acute_GVHD), !is.na(Acute_GVHD_Binary)) %>%
                                 +     dplyr::select(Days_to_Acute_GVHD, Acute_GVHD_Binary, Age, Gender, Donation_Type,
                                                     +                   Percent_SSI, Percent_Below_Poverty, Median_Income, Percent_Food_Stamps,
                                                     +                   Income_Housing_Ratio, Percent_Below_HighSchool, Percent_No_Telephone,
                                                     +                   Percent_No_Vehicle) %>%
                                 +     na.omit()
                               > cox_acute <- coxph(Surv(Days_to_Acute_GVHD, Acute_GVHD_Binary) ~
                                                      +                        Age + Gender + Donation_Type +
                                                      +                        Percent_SSI + Percent_Below_Poverty + Median_Income +
                                                      +                        Percent_Food_Stamps + Income_Housing_Ratio +
                                                      +                        Percent_Below_HighSchool + Percent_No_Telephone + Percent_No_Vehicle,
                                                    +                    data = model_data)
                               Error in coxph(Surv(Days_to_Acute_GVHD, Acute_GVHD_Binary) ~ Age + Gender +  : 
                                                No (non-missing) observations
                                              In addition: Warning message:
                                                In max(event[who2]) : no non-missing arguments to max; returning -Inf
                                              > colSums(is.na(my_data[, c("Days_to_Acute_GVHD", "Acute_GVHD_Stage")]))
                                              Days_to_Acute_GVHD   Acute_GVHD_Stage 
                                              57                 97 
                                              > my_data %>%
                                                +     filter(!is.na(Days_to_Acute_GVHD), !is.na(Acute_GVHD_Stage)) %>%
                                                +     nrow()
                                              [1] 0
                                              > table(my_data$graft_failure, useNA = "ifany")
                                              < table of extent 0 >
                                                Warning message:
                                                Unknown or uninitialised column: `graft_failure`. 
                                              > str(my_data)
                                              tibble [154 × 23] (S3: tbl_df/tbl/data.frame)
                                              $ Age                     : num [1:154] 47.3 29 36.3 37.1 48.1 ...
                                              $ Gender                  : chr [1:154] "Female" "Male" "Female" "Male" ...
                                              $ Donation_Type           : chr [1:154] "unrel" "allo" "allo" "allo" ...
                                              $ Treatment_Date          : POSIXct[1:154], format: "2000-10-13" "2000-03-14" "2000-09-13" ...
                                              $ Last_Visit_Date         : POSIXct[1:154], format: "2001-02-06" "2024-02-28" "2000-12-12" ...
                                              $ Death_Date              : POSIXct[1:154], format: "2001-02-06" NA "2000-12-12" ...
                                              $ Days_Survived           : num [1:154] 116 8751 90 3964 287 ...
                                              $ Death                   : num [1:154] 1 0 1 1 1 0 0 0 0 0 ...
                                              $ Acute_GVHD_Stage        : Ord.factor w/ 5 levels "0"<"I"<"II"<"III"<..: NA NA NA NA NA 1 NA 1 1 1 ...
                                              $ Days_to_Acute_GVHD      : num [1:154] 52 52 20 28 18 NA 8 NA NA NA ...
                                              $ Chronic_GVHD            : num [1:154] 1 0 0 0 1 0 0 0 0 0 ...
                                              $ Chronic_GVHD_Date       : POSIXct[1:154], format: "2001-01-09" NA NA ...
                                              $ Days_to_Chronic_GVHD    : num [1:154] 88 NA NA NA 126 NA NA NA NA NA ...
                                              $ Graft_Failure           : num [1:154] 0 0 0 0 0 0 0 0 0 0 ...
                                              $ Percent_SSI             : num [1:154] 3.87 3.72 7.97 4.48 1.72 3.78 5.4 3.97 1.04 1.27 ...
                                              $ Percent_Below_Poverty   : num [1:154] 7.5 8.9 19.8 10.1 5.6 14.1 15.5 16 3.4 3.1 ...
                                              $ Median_Income           : num [1:154] 83949 64670 39380 54714 69854 ...
                                              $ Percent_Food_Stamps     : num [1:154] 3.83 10.65 20.44 11.45 4.45 ...
                                              $ Income_Housing_Ratio    : num [1:154] 29.1 22 25.8 23.9 21.7 ...
                                              $ Percent_Below_HighSchool: num [1:154] 16.8 22.6 15 15.5 11.8 26.8 36.2 11.4 17.5 8.3 ...
                                              $ Percent_No_Telephone    : num [1:154] 1.3 2.2 7.9 1.6 2.1 2.3 4.1 5.2 2.6 1.2 ...
                                              $ Percent_No_Vehicle      : num [1:154] 3.4 3.1 9.3 4.1 2.9 6.6 6.9 9 5.1 1.1 ...
                                              $ Acute_GVHD_Binary       : num [1:154] NA NA NA NA NA 0 NA 0 0 0 ...
                                              > table(my_data$Graft_Failure, useNA = "ifany")
                                              
                                              0   1 
                                              146   8 
                                              > vars <- c("Age", "Gender", "Donation_Type", "Percent_SSI", "Percent_Below_Poverty",
                                                          +           "Median_Income", "Percent_Food_Stamps", "Income_Housing_Ratio",
                                                          +           "Percent_Below_HighSchool", "Percent_No_Telephone", "Percent_No_Vehicle")
                                              > results <- lapply(vars, function(var) {
                                                +     formula <- as.formula(paste("graft_failure ~", var))
                                                +     model <- glm(formula, family = binomial, data = my_data)
                                                +     tidy(model, conf.int = TRUE, exponentiate = TRUE)
                                                + })
                                              Error in eval(predvars, data, env) : object 'graft_failure' not found
                                              > results <- lapply(vars, function(var) {
                                                +     formula <- as.formula(paste("Graft_Failure ~", var))
                                                +     model <- glm(formula, family = binomial, data = my_data)
                                                +     tidy(model, conf.int = TRUE, exponentiate = TRUE)
                                                + })
                                              > univariate_results <- do.call(rbind, results)
                                              > summary(univariate_results)
                                              term              estimate         std.error           statistic          p.value         
                                              Length:22          Min.   :0.01164   Min.   :0.0000152   Min.   :-4.9220   Min.   :0.0000009  
                                              Class :character   1st Qu.:0.04945   1st Qu.:0.0975529   1st Qu.:-3.7958   1st Qu.:0.0001481  
                                              Mode  :character   Median :0.37338   Median :0.7179040   Median :-1.1939   Median :0.1101139  
                                              Mean   :0.63702   Mean   :0.5972029   Mean   :-1.6700   Mean   :0.2495831  
                                              3rd Qu.:0.99897   3rd Qu.:0.8050819   3rd Qu.: 0.1448   3rd Qu.:0.4532738  
                                              Max.   :2.47500   Max.   :2.3325124   Max.   : 1.7265   Max.   :0.9445960  
                                              conf.low           conf.high       
                                              Min.   :0.0009034   Min.   : 0.07499  
                                              1st Qu.:0.0059313   1st Qu.: 0.20435  
                                              Median :0.1290997   Median : 1.03332  
                                              Mean   :0.3742965   Mean   : 2.76189  
                                              3rd Qu.:0.7702927   3rd Qu.: 1.11717  
                                              Max.   :0.9999914   Max.   :17.27679  
                                              > model_simple <- glm(Graft_Failure ~ Age + Gender, family = binomial, data = my_data)
                                              > summary(model_simple)
                                              
                                              Call:
                                                glm(formula = Graft_Failure ~ Age + Gender, family = binomial, 
                                                    data = my_data)
                                              
                                              Coefficients:
                                                Estimate Std. Error z value Pr(>|z|)    
                                              (Intercept) -4.70614    1.06159  -4.433 9.29e-06 ***
                                                Age          0.03280    0.01795   1.828   0.0676 .  
                                              GenderMale   1.02682    0.84520   1.215   0.2244    
                                              ---
                                                Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                              
                                              (Dispersion parameter for binomial family taken to be 1)
                                              
                                              Null deviance: 62.897  on 153  degrees of freedom
                                              Residual deviance: 58.176  on 151  degrees of freedom
                                              AIC: 64.176
                                              
                                              Number of Fisher Scoring iterations: 6
                                              
                                              > install.packages(tableone)
                                              Error in install.packages : object 'tableone' not found
                                              > install.packages(gtsummary)
                                              Error in install.packages : object 'gtsummary' not found
                                              > install.packages("tableone")
                                              WARNING: Rtools is required to build R packages but is not currently installed. Please download and install the appropriate version of Rtools before proceeding:
                                                
                                                https://cran.rstudio.com/bin/windows/Rtools/
                                                also installing the dependencies ‘DBI’, ‘gtools’, ‘forcats’, ‘mitools’, ‘RcppArmadillo’, ‘proxy’, ‘gdata’, ‘haven’, ‘survey’, ‘e1071’, ‘gmodels’, ‘labelled’
                                              
                                              trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/DBI_1.2.3.zip'
                                              Content type 'application/zip' length 940348 bytes (918 KB)
                                              downloaded 918 KB
                                              
                                              trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/gtools_3.9.5.zip'
                                              Content type 'application/zip' length 368447 bytes (359 KB)
                                              downloaded 359 KB
                                              
                                              trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/forcats_1.0.0.zip'
                                              Content type 'application/zip' length 429128 bytes (419 KB)
                                              downloaded 419 KB
                                              
                                              trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/mitools_2.4.zip'
                                              Content type 'application/zip' length 299954 bytes (292 KB)
                                              downloaded 292 KB
                                              
                                              trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/RcppArmadillo_14.6.0-1.zip'
                                              Content type 'application/zip' length 2079153 bytes (2.0 MB)
                                              downloaded 2.0 MB
                                              
                                              trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/proxy_0.4-27.zip'
                                              Content type 'application/zip' length 181298 bytes (177 KB)
                                              downloaded 177 KB
                                              
                                              trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/gdata_3.0.1.zip'
                                              Content type 'application/zip' length 504620 bytes (492 KB)
                                              downloaded 492 KB
                                              
                                              trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/haven_2.5.5.zip'
                                              Content type 'application/zip' length 786628 bytes (768 KB)
                                              downloaded 768 KB
                                              
                                              trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/survey_4.4-2.zip'
                                              Content type 'application/zip' length 3790450 bytes (3.6 MB)
                                              downloaded 3.6 MB
                                              
                                              trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/e1071_1.7-16.zip'
                                              Content type 'application/zip' length 673388 bytes (657 KB)
                                              downloaded 657 KB
                                              
                                              trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/gmodels_2.19.1.zip'
                                              Content type 'application/zip' length 119163 bytes (116 KB)
                                              downloaded 116 KB
                                              
                                              trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/labelled_2.14.1.zip'
                                              Content type 'application/zip' length 358797 bytes (350 KB)
                                              downloaded 350 KB
                                              
                                              trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/tableone_0.13.2.zip'
                                              Content type 'application/zip' length 392467 bytes (383 KB)
                                              downloaded 383 KB
                                              
                                              package ‘DBI’ successfully unpacked and MD5 sums checked
                                              package ‘gtools’ successfully unpacked and MD5 sums checked
                                              package ‘forcats’ successfully unpacked and MD5 sums checked
                                              package ‘mitools’ successfully unpacked and MD5 sums checked
                                              package ‘RcppArmadillo’ successfully unpacked and MD5 sums checked
                                              package ‘proxy’ successfully unpacked and MD5 sums checked
                                              package ‘gdata’ successfully unpacked and MD5 sums checked
                                              package ‘haven’ successfully unpacked and MD5 sums checked
                                              package ‘survey’ successfully unpacked and MD5 sums checked
                                              package ‘e1071’ successfully unpacked and MD5 sums checked
                                              package ‘gmodels’ successfully unpacked and MD5 sums checked
                                              package ‘labelled’ successfully unpacked and MD5 sums checked
                                              package ‘tableone’ successfully unpacked and MD5 sums checked
                                              
                                              The downloaded binary packages are in
                                              C:\Users\aebrahim\AppData\Local\Temp\Rtmp2bNxwM\downloaded_packages
                                              > install.packages("gtsummary")
                                              WARNING: Rtools is required to build R packages but is not currently installed. Please download and install the appropriate version of Rtools before proceeding:
                                                
                                                https://cran.rstudio.com/bin/windows/Rtools/
                                                also installing the dependency ‘cards’
                                              
                                              trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/cards_0.6.1.zip'
                                              Content type 'application/zip' length 599629 bytes (585 KB)
                                              downloaded 585 KB
                                              
                                              trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/gtsummary_2.3.0.zip'
                                              Content type 'application/zip' length 1757494 bytes (1.7 MB)
                                              downloaded 1.7 MB
                                              
                                              package ‘cards’ successfully unpacked and MD5 sums checked
                                              package ‘gtsummary’ successfully unpacked and MD5 sums checked
                                              
                                              The downloaded binary packages are in
                                              C:\Users\aebrahim\AppData\Local\Temp\Rtmp2bNxwM\downloaded_packages
                                              > library(tableone)
                                              > library(gtsummary)
                                              
                                              Attaching package: ‘gtsummary’
                                              
                                              The following object is masked from ‘package:MASS’:
                                                
                                                select
                                              
                                              > vars <- c("Age", "Gender", "Donation_Type", "Percent_SSI", "Percent_Below_Poverty",
                                                          +           "Median_Income", "Percent_Food_Stamps", "Income_Housing_Ratio",
                                                          +           "Percent_Below_HighSchool", "Percent_No_Telephone", "Percent_No_Vehicle")
                                              > cat_vars <- c("Gender", "Donation_Type")
                                              > vars <- names(my_data)
                                              > cat_vars <- names(my_data)[sapply(my_data, is.character) | sapply(my_data, is.factor)]
                                              > table1 <- CreateTableOne(vars = vars, data = my_data, factorVars = cat_vars)
                                              Warning message:
                                                In CreateTableOne(vars = vars, data = my_data, factorVars = cat_vars) :
                                                Dropping variable(s) Treatment_Date Last_Visit_Date Death_Date Chronic_GVHD_Date  due to unsupported class.
                                              
                                              > my_data %>%
                                                +     tbl_summary(
                                                  +         statistic = list(all_continuous() ~ "{mean} ({sd})",
                                                                             +                          all_categorical() ~ "{n} ({p}%)"),
                                                  +         missing = "no"
                                                  +     ) %>%
                                                +     bold_labels()
                                              > my_data$Death <- factor(my_data$Death, labels = c("Alive", "Dead"))
                                              > my_data %>%
                                                +     select(Death, Age, Gender, Donation_Type, Percent_SSI, Percent_Below_Poverty,
                                                             +            Median_Income, Percent_Food_Stamps, Income_Housing_Ratio,
                                                             +            Percent_Below_HighSchool, Percent_No_Telephone, Percent_No_Vehicle) %>%
                                                +     tbl_summary(by = Death, missing = "no") %>%
                                                +     add_p() %>%
                                                +     modify_header(label = "**Variable**") %>%
                                                +     bold_labels()
                                              ℹ The package "cardx" (>= 0.2.5) is required.
                                              ✖ Would you like to install it?
                                                
                                                1: Yes
                                              2: No
                                              
                                              Selection: 1
                                              trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/cardx_0.2.5.zip'
                                              Content type 'application/zip' length 567241 bytes (553 KB)
                                              downloaded 553 KB
                                              
                                              package ‘cardx’ successfully unpacked and MD5 sums checked
                                              
                                              The downloaded binary packages are in
                                              C:\Users\aebrahim\AppData\Local\Temp\Rtmp2bNxwM\downloaded_packages
                                              > my_data$Death <- factor(my_data$Death, levels = c(0, 1), labels = c("Survived", "Deceased"))
                                              > my_data %>%
                                                +     tbl_summary(
                                                  +         by = Death,
                                                  +         statistic = list(all_continuous() ~ "{mean} ({sd})",
                                                                             +                          all_categorical() ~ "{n} ({p}%)"),
                                                  +         missing = "no"
                                                  +     ) %>%
                                                +     add_p() %>%
                                                +     bold_labels()
                                              154 missing rows in the "Death" column have been removed.
                                              The following warnings were returned during `tbl_summary()`:
                                                ! For variable `Donation_Type` (`Death = "Survived"`) and "mean" statistic: argument is not numeric or
                                              logical: returning NA
                                              ! For variable `Gender` (`Death = "Survived"`) and "mean" statistic: argument is not numeric or
                                              logical: returning NA
                                              ! For variable `Donation_Type` (`Death = "Deceased"`) and "mean" statistic: argument is not numeric or
                                              logical: returning NA
                                              ! For variable `Gender` (`Death = "Deceased"`) and "mean" statistic: argument is not numeric or
                                              logical: returning NA
                                              Error in `dplyr::mutate()`:
                                                ℹ In argument: `stat_fmt = pmap(...)`.
                                              Caused by error in `tbl_summary()`:
                                                ! There was an error applying the formatting function to statistic "mean" for variable
                                              "Treatment_Date".
                                              ℹ Perhaps try formmatting function `as.character()`? See error message below:
                                                ✖ '*' not defined for "POSIXt" objects
                                              Run `rlang::last_trace()` to see where the error occurred.
                                              > my_data <- my_data %>%
                                                +     mutate(Death = factor(Death, levels = c(0, 1), labels = c("Survived", "Deceased")))
                                              > excluded_cols <- c("Treatment_Date", "Last_Visit_Date", "Death_Date", 
                                                                   +                    "Chronic_GVHD_Date", "Acute_GVHD_Date")
                                              > clean_data <- my_data %>% select(-any_of(excluded_cols))
                                              > clean_data %>%
                                                +     tbl_summary(
                                                  +         by = Death,
                                                  +         statistic = list(
                                                    +             all_continuous() ~ "{mean} ({sd})",
                                                    +             all_categorical() ~ "{n} ({p}%)"
                                                    +         ),
                                                  +         missing = "no"
                                                  +     ) %>%
                                                +     add_p() %>%
                                                +     modify_header(label = "**Variable**") %>%
                                                +     bold_labels()
                                              154 missing rows in the "Death" column have been removed.
                                              The following warnings were returned during `modify_header()`:
                                                ! For variable `Donation_Type` (`Death = "Survived"`) and "mean" statistic: argument is not numeric or
                                              logical: returning NA
                                              ! For variable `Gender` (`Death = "Survived"`) and "mean" statistic: argument is not numeric or
                                              logical: returning NA
                                              ! For variable `Donation_Type` (`Death = "Deceased"`) and "mean" statistic: argument is not numeric or
                                              logical: returning NA
                                              ! For variable `Gender` (`Death = "Deceased"`) and "mean" statistic: argument is not numeric or
                                              logical: returning NA
                                              The following errors were returned during `modify_header()`:
                                                ✖ For variable `Acute_GVHD_Binary` (`Death`) and "statistic", "p.value", and "parameter" statistics:
                                                all observations are in the same group
                                              ✖ For variable `Acute_GVHD_Stage` (`Death`) and "statistic", "p.value", and "parameter" statistics: 'x'
                                              and 'y' must have at least 2 levels
                                              ✖ For variable `Age` (`Death`) and "statistic", "p.value", and "parameter" statistics: all observations
                                              are in the same group
                                              ✖ For variable `Chronic_GVHD` (`Death`) and "statistic", "p.value", and "parameter" statistics: all
                                              observations are in the same group
                                              ✖ For variable `Days_Survived` (`Death`) and "statistic", "p.value", and "parameter" statistics: all
                                              observations are in the same group
                                              ✖ For variable `Days_to_Acute_GVHD` (`Death`) and "statistic", "p.value", and "parameter" statistics:
                                                all observations are in the same group
                                              ✖ For variable `Days_to_Chronic_GVHD` (`Death`) and "statistic", "p.value", and "parameter" statistics:
                                                all observations are in the same group
                                              ✖ For variable `Donation_Type` (`Death`) and "statistic", "p.value", and "parameter" statistics: all
                                              observations are in the same group
                                              ✖ For variable `Gender` (`Death`) and "statistic", "p.value", and "parameter" statistics: all
                                              observations are in the same group
                                              ✖ For variable `Graft_Failure` (`Death`) and "statistic", "p.value", and "parameter" statistics: all
                                              observations are in the same group
                                              ✖ For variable `Income_Housing_Ratio` (`Death`) and "statistic", "p.value", and "parameter" statistics:
                                                all observations are in the same group
                                              ✖ For variable `Median_Income` (`Death`) and "statistic", "p.value", and "parameter" statistics: all
                                              observations are in the same group
                                              ✖ For variable `Percent_Below_HighSchool` (`Death`) and "statistic", "p.value", and "parameter"
                                              statistics: all observations are in the same group
                                              ✖ For variable `Percent_Below_Poverty` (`Death`) and "statistic", "p.value", and "parameter"
                                              statistics: all observations are in the same group
                                              ✖ For variable `Percent_Food_Stamps` (`Death`) and "statistic", "p.value", and "parameter" statistics:
                                                all observations are in the same group
                                              ✖ For variable `Percent_No_Telephone` (`Death`) and "statistic", "p.value", and "parameter" statistics:
                                                all observations are in the same group
                                              ✖ For variable `Percent_No_Vehicle` (`Death`) and "statistic", "p.value", and "parameter" statistics:
                                                all observations are in the same group
                                              ✖ For variable `Percent_SSI` (`Death`) and "statistic", "p.value", and "parameter" statistics: all
                                              observations are in the same group
                                              > > my_data %>%
                                                Error: unexpected '>' in ">"
                                              > > clean_data %>%
                                                Error: unexpected '>' in ">"
                                              > > clean_data %>%
                                                Error: unexpected '>' in ">"
                                              > View(table1)
                                              > library(dplyr)
                                              > library(gtsummary)
                                              > library(gt)
                                              > library(writexl)
                                              > my_data <- my_data %>%
                                                +     mutate(Death = factor(Death, levels = c(0, 1), labels = c("Survived", "Deceased")))
                                              > excluded_cols <- c("Treatment_Date", "Last_Visit_Date", "Death_Date", 
                                                                   +                    "Chronic_GVHD_Date", "Acute_GVHD_Date")
                                              > clean_data <- my_data %>% select(-any_of(excluded_cols))
                                              > table1 <- clean_data %>%
                                                +     tbl_summary(
                                                  +         by = Death,
                                                  +         statistic = list(
                                                    +             all_continuous() ~ "{mean} ({sd})",
                                                    +             all_categorical() ~ "{n} ({p}%)"
                                                    +         ),
                                                  +         missing = "no"
                                                  +     ) %>%
                                                +     add_p() %>%
                                                +     modify_header(label = "**Variable**") %>%
                                                +     bold_labels()
                                              154 missing rows in the "Death" column have been removed.
                                              The following warnings were returned during `modify_header()`:
                                                ! For variable `Donation_Type` (`Death = "Survived"`) and "mean" statistic: argument is not numeric or
                                              logical: returning NA
                                              ! For variable `Gender` (`Death = "Survived"`) and "mean" statistic: argument is not numeric or
                                              logical: returning NA
                                              ! For variable `Donation_Type` (`Death = "Deceased"`) and "mean" statistic: argument is not numeric or
                                              logical: returning NA
                                              ! For variable `Gender` (`Death = "Deceased"`) and "mean" statistic: argument is not numeric or
                                              logical: returning NA
                                              The following errors were returned during `modify_header()`:
                                                ✖ For variable `Acute_GVHD_Binary` (`Death`) and "statistic", "p.value", and "parameter" statistics:
                                                all observations are in the same group
                                              ✖ For variable `Acute_GVHD_Stage` (`Death`) and "statistic", "p.value", and "parameter" statistics: 'x'
                                              and 'y' must have at least 2 levels
                                              ✖ For variable `Age` (`Death`) and "statistic", "p.value", and "parameter" statistics: all observations
                                              are in the same group
                                              ✖ For variable `Chronic_GVHD` (`Death`) and "statistic", "p.value", and "parameter" statistics: all
                                              observations are in the same group
                                              ✖ For variable `Days_Survived` (`Death`) and "statistic", "p.value", and "parameter" statistics: all
                                              observations are in the same group
                                              ✖ For variable `Days_to_Acute_GVHD` (`Death`) and "statistic", "p.value", and "parameter" statistics:
                                                all observations are in the same group
                                              ✖ For variable `Days_to_Chronic_GVHD` (`Death`) and "statistic", "p.value", and "parameter" statistics:
                                                all observations are in the same group
                                              ✖ For variable `Donation_Type` (`Death`) and "statistic", "p.value", and "parameter" statistics: all
                                              observations are in the same group
                                              ✖ For variable `Gender` (`Death`) and "statistic", "p.value", and "parameter" statistics: all
                                              observations are in the same group
                                              ✖ For variable `Graft_Failure` (`Death`) and "statistic", "p.value", and "parameter" statistics: all
                                              observations are in the same group
                                              ✖ For variable `Income_Housing_Ratio` (`Death`) and "statistic", "p.value", and "parameter" statistics:
                                                all observations are in the same group
                                              ✖ For variable `Median_Income` (`Death`) and "statistic", "p.value", and "parameter" statistics: all
                                              observations are in the same group
                                              ✖ For variable `Percent_Below_HighSchool` (`Death`) and "statistic", "p.value", and "parameter"
                                              statistics: all observations are in the same group
                                              ✖ For variable `Percent_Below_Poverty` (`Death`) and "statistic", "p.value", and "parameter"
                                              statistics: all observations are in the same group
                                              ✖ For variable `Percent_Food_Stamps` (`Death`) and "statistic", "p.value", and "parameter" statistics:
                                                all observations are in the same group
                                              ✖ For variable `Percent_No_Telephone` (`Death`) and "statistic", "p.value", and "parameter" statistics:
                                                all observations are in the same group
                                              ✖ For variable `Percent_No_Vehicle` (`Death`) and "statistic", "p.value", and "parameter" statistics:
                                                all observations are in the same group
                                              ✖ For variable `Percent_SSI` (`Death`) and "statistic", "p.value", and "parameter" statistics: all
                                              observations are in the same group
                                              > table_df <- as_tibble(as.data.frame(table1))
                                              > write_xlsx(table_df, "Table1_SDOH_by_Death.xlsx")
                                              > View(model_simple)