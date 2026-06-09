library(testthat)
library(here)

source(here("Create Neighborhood Data.R"))

test_that(
  "create_neighborhood_data_errors_work",{
  expect_error(create_neighborhood_data(-1))
})

test_that(
  'create_neighborhood_data_works', {
    expect_true(create_neighborhood_data()$renters[5] > 0)
  }
)
