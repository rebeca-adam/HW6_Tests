
#' Create Neighborhood Data
#'
#' This function creates example neighborhood data for testing the flood, vulnerability, insurance retreat, and priority classification modules.
#' @param n number of neighborhoods to create
#' @return data frame with neighborhood risk variables


create_neighborhood_data = function(n = 26) {
  
  stopifnot(n > 0)
  
  neighborhood_data = data.frame(
    city = letters[1:n],
    elevation = runif(n, min = 0, max = 3000),
    distance_coast = runif(n, min = 0, max = 1000),
    mean_rain = runif(n, min = 0, max = 300),
    num_past_floods = runif(n, min = 0, max = 200),
    low_inc = runif(n, min = 0, max = 1),
    minority = runif(n, min = 0, max = 1),
    no_insurance = runif(n, min = 0, max = 1),
    renters = runif(n, min = 0, max = 1),
    elderly = runif(n, min = 0, max = 1),
    children = runif(n, min = 0, max = 1),
    disabled = runif(n, min = 0, max = 1),
    percent_nonrenewal = runif(n, min = 0, max = 1),
    premium_increase = runif(n, min = 0, max = 1),
    past_claims = runif(n, min = 0, max = 200)
  )
  
  stopifnot(nrow(neighborhood_data) == n)
  
  return(neighborhood_data)
}

#' Calculate Insurance Retreat Score
#' This function calculates insurance retreat risk using percent nonrenewal,
#' premium increase, and past claims. The for loop uses the previous row's
#' insurance retreat score to represent cumulative insurance retreat pressure.
#' @param neighborhood_data data frame with insurance variables
#' @return data frame with insurance_retreat_score added

calculate_insurance_retreat_score = function(neighborhood_data) {
  neighborhood_data$insurance_retreat_score = 0
  for (n in 1:nrow(neighborhood_data)) {
    neighborhood_data$insurance_retreat_score[n] =
      ((0.4) * neighborhood_data$percent_nonrenewal[n]) +
      ((0.4) * neighborhood_data$premium_increase[n]) +
      ((0.2) * (neighborhood_data$past_claims[n] / 200))
  }
  return(neighborhood_data)
}

neighborhood_data = create_neighborhood_data()

neighborhood_data = calculate_insurance_retreat_score(neighborhood_data)

head(neighborhood_data)
