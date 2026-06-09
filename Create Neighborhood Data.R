
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

