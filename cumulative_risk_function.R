#' Cumulative risk of flooding, social vulnerability, and lack of insurance coverage
#'
#' This function determines how vulnerable a given city is to flooding and how vulnerable they are socially, which impacts their ability to mitigate/recover from flood impacts
#' @param flood_vulnerability a score between 0-1 calculated based on environmental variables
#' @param social_vulnerability a score between 0-1 calculated based on socioeconomic variables
#' @param non_coverage_risk a score between 0-1 that reflects an areas risk for not being covered by insurance (insurance retreat)
#' @return risk index
#'
# function definition
compute_risk_index = function(flood_vulnerability, social_vulnerability, non_coverage_risk){
  result = ((1/2) * flood_vulnerability) + 
    ((1/3) * social_vulnerability) + 
    ((1/6) * non_coverage_risk)
  return(result)
}
