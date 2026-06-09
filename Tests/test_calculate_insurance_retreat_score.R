library(testthat)
library(here)

source(here("calculate_Insurance_Retreat.R"))

test_that("insurance retreat score is between 0 and 1", {
  
  low_risk <- data.frame(
    percent_nonrenewal = 0.10,
    premium_increase = 0.10,
    past_claims = 10
  )
  
  low_score <- calculate_insurance_retreat_score(low_risk)$insurance_retreat_score
  
  expect_true(low_score > 0)
  expect_true(low_score < 1)
  
})

test_that("higher risk create a higher insurance retreat score", {
  
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
  
  expect_true(high_score > low_score)
  
})
