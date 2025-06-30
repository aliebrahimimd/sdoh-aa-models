library(dplyr)
library(gt)
library(readr)

# Load your dataset
results <- read_csv(file.choose())  # Or use a specific path

# Format and display the logistic regression results
results %>%
  mutate(across(c(estimate, conf.low, conf.high, p.value), exp)) %>%  # Convert log-odds to OR
  mutate(across(c(estimate, conf.low, conf.high, p.value), ~ round(., 3))) %>%  # Round values
  rename(
    Predictor = term,
    OR = estimate,
    `95% CI (Lower)` = conf.low,
    `95% CI (Upper)` = conf.high,
    p = p.value
  ) %>%
  gt() %>%
  tab_header(
    title = md("**Logistic Regression (Odds Ratios): Predictors of Chronic GVHD**")
  ) %>%
  cols_label(
    Predictor = "Predictor",
    OR = "OR",
    `95% CI (Lower)` = "95% CI (Lower)",
    `95% CI (Upper)` = "95% CI (Upper)",
    p = "p-value"
  ) %>%
  fmt_number(
    columns = c("OR", "95% CI (Lower)", "95% CI (Upper)", "p"),
    decimals = 3
  )