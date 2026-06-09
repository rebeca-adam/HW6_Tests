# test for the compute_flood_risk fucntion


# load libraries
library(here)
library(testthat)

source(here("compute_flood_risk.R"))


# the risk should be a positive value
test_that("flood risk is between 0 and 1", {
  expect_true(
  compute_flood_risk(
    elevation = 1000,
    distance_coast = 100,
    mean_rain = 50,
    num_past_floods = 10
  ) > 0
)

# the risk should also be less than one
expect_true(
  compute_flood_risk(
    elevation = 1000,
    distance_coast = 100,
    mean_rain = 50,
    num_past_floods = 10
  ) < 1
)
})


# more floods in the past (the strongest weighted parameter) should increase the flood risk
test_that("more floods increase risk", {
  lower_risk <- compute_flood_risk(
    elevation = 1000,
    distance_coast = 100,
    mean_rain = 50,
    num_past_floods = 10
  )

higher_risk <- compute_flood_risk(
      elevation = 1000,
      distance_coast = 100,
      mean_rain = 50,
      num_past_floods = 150
  )

expect_true(higher_risk > lower_risk)
}) 


print(lower_risk)
print(higher_risk)
