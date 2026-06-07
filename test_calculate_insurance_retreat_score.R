library(testthat)

source("R/Insurance Retreat.R")

low_risk <- data.frame(
  percent_nonrenewal = 0.10,
  premium_increase = 0.10,
  past_claims = 10
)

high_risk <- data.frame(
  percent_nonrenewal = 0.80,
  premium_increase = 0.80,
  past_claims = 150
)

low_score <- calculate_insurance_retreat_score(low_risk)$insurance_retreat_score
high_score <- calculate_insurance_retreat_score(high_risk)$insurance_retreat_score

expect_true(low_score > 0)
expect_true(low_score < 1)
expect_true(high_score > low_score)
