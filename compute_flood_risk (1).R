#' Compute flood risk
#'
#' This function determines how vulnerable a given city is to flooding
#' @param elevation a city's elevation (feet)
#' @param distance_coast a city's distance from the ocean (miles)
#' @param mean_rain mean annual rainfall (inches)
#' @param num_past_floods the amount of floods a city has experienced across recorded history
#' @return risk index
#'
# function definition
compute_flood_risk = function(elevation, distance_coast, mean_rain, num_past_floods){
  result = result = ((0.1) * (3000 - elevation)/3000) + 
    ((0.3) * (1000 - distance_coast)/1000) + 
    ((0.2) * (mean_rain/300)) + 
    ((0.4) * (num_past_floods/200))
  return(result)
}
