# ========================================================
# Project: Aplastic Anemia SDOH Analysis
# File: logistic_regression_sdoh.R
# Description: Logistic regression model to assess effect of SDOH on mortality
# Author: Your Name
# Date: 2025-06-25
# ========================================================

# ------------------------
# Load Required Packages
# ------------------------
library(readxl)
library(dplyr)
library(broom)

# ------------------------
# Load the Data
# ------------------------
my_data <- read_excel("Clean_Final_SDOH_AA.xlsx")

# ------------------------
# Logistic Regression
# ------------------------
death_model <- glm(Death ~ Gender + Age + Donation_Type +
                     Percent_SSI + Percent_Below_Poverty +
                     Median_Income + Percent_Food_Stamps +
                     Income_Housing_Ratio + Percent_Below_HighSchool +
                     Percent_No_Telephone,
                   family = binomial, data = my_data)

# ------------------------
# Summarize Results
# ------------------------
summary(death_model)
exp(coef(death_model))       # Odds ratios
exp(confint(death_model))    # 95% CI

# ------------------------
# Save Workspace (Optional)
# ------------------------
save.image("death_model_workspace.RData")

> my_data$Death <- as.factor(my_data$Death)
> my_data$Gender <- as.factor(my_data$Gender)
> my_data$Donation_Type <- as.factor(my_data$Donation_Type)
> 
  > death_model <- glm(Death ~ Gender + Age + Donation_Type +
                         +                        Percent_SSI + Percent_Below_Poverty + Median_Income +
                         +                        Percent_Food_Stamps + Income_Housing_Ratio +
                         +                        Percent_Below_HighSchool + Percent_No_Telephone,
                       +                    data = my_data,
                       +                    family = binomial)
  > 
    > summary(death_model)
  
  Call:
    glm(formula = Death ~ Gender + Age + Donation_Type + Percent_SSI + 
          Percent_Below_Poverty + Median_Income + Percent_Food_Stamps + 
          Income_Housing_Ratio + Percent_Below_HighSchool + Percent_No_Telephone, 
        family = binomial, data = my_data)
  
  Coefficients:
    Estimate Std. Error z value Pr(>|z|)    
  (Intercept)              -6.317e+00  2.946e+00  -2.144   0.0320 *  
    GenderMale                9.302e-01  5.647e-01   1.647   0.0995 .  
  Age                       5.863e-02  1.481e-02   3.959 7.52e-05 ***
    Donation_Typeunrel        9.670e-01  5.895e-01   1.640   0.1010    
  Percent_SSI               2.818e-01  2.234e-01   1.261   0.2072    
  Percent_Below_Poverty    -4.079e-02  7.827e-02  -0.521   0.6023    
  Median_Income            -1.106e-05  2.035e-05  -0.543   0.5870    
  Percent_Food_Stamps      -1.567e-01  9.893e-02  -1.584   0.1131    
  Income_Housing_Ratio      6.773e-02  7.659e-02   0.884   0.3765    
  Percent_Below_HighSchool  2.546e-02  3.638e-02   0.700   0.4841    
  Percent_No_Telephone      4.408e-01  1.934e-01   2.280   0.0226 *  
    ---
    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
  
  (Dispersion parameter for binomial family taken to be 1)
  
  Null deviance: 128.963  on 133  degrees of freedom
  Residual deviance:  93.676  on 123  degrees of freedom
  (20 observations deleted due to missingness)
  AIC: 115.68
  
  Number of Fisher Scoring iterations: 6
  
  > 
    > # Odds Ratios
    > exp(coef(death_model))
  (Intercept)               GenderMale                      Age       Donation_Typeunrel 
  0.001805281              2.535089325              1.060380717              2.629935680 
  Percent_SSI    Percent_Below_Poverty            Median_Income      Percent_Food_Stamps 
  1.325532329              0.960031597              0.999988945              0.854928841 
  Income_Housing_Ratio Percent_Below_HighSchool     Percent_No_Telephone 
  1.070078076              1.025783950              1.554011072 
  > 
    > # 95% Confidence Intervals
    > exp(confint(death_model))
  Waiting for profiling to be done...
  2.5 %    97.5 %
    (Intercept)              4.174568e-06 0.5063492
  GenderMale               8.702364e-01 8.1428399
  Age                      1.031926e+00 1.0943595
  Donation_Typeunrel       8.654107e-01 9.0285224
  Percent_SSI              8.663037e-01 2.0915919
  Percent_Below_Poverty    8.123810e-01 1.1210662
  Median_Income            9.999459e-01 1.0000275
  Percent_Food_Stamps      6.902104e-01 1.0192245
  Income_Housing_Ratio     9.440307e-01 1.2781309
  Percent_Below_HighSchool 9.546638e-01 1.1025115
  Percent_No_Telephone     1.062198e+00 2.3074133