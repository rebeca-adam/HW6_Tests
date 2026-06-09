# test for the compute_risk_index fucntion


library(here)
library(testthat)

source(here("cumulative_risk_function.R"))


# the risk should always be a positive value
test_that("cumulative risk index is positive", {
  expect_true(
  compute_risk_index(
    flood_vulnerability = 0.67, 
    social_vulnerability = 0.72, 
    non_coverage_risk = 0.61
  ) > 0
)
})

# more floods in the past (the strongest weighted parameter) should increase the flood risk
test_that("Higher historic risk create higher cumulative risk", {
 lower_risk <- compute_risk_index(
  flood_vulnerability = 0.42, 
  social_vulnerability = 0.58, 
  non_coverage_risk = 0.33
)

higher_risk <- compute_risk_index(
  flood_vulnerability = 0.67, 
  social_vulnerability = 0.72, 
  non_coverage_risk = 0.61
)

expect_true(higher_risk > lower_risk)
})




