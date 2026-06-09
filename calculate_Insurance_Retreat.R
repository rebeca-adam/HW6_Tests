#' Calculate Insurance Retreat Score
#'
#' Calculates insurance retreat risk for each neighborhood using percent
#' nonrenewal, premium increase, and past claims.
#'
#' @param neighborhood_data data frame with columns percent_nonrenewal,
#' premium_increase, and past_claims
#'
#' @return data frame with insurance_retreat_score added
#'
#' @author Rebeca Adam, Natasha Atkins, Elijah Khan
#' @examples
#' test_data <- data.frame(
#'   percent_nonrenewal = 0.2,
#'   premium_increase = 0.3,
#'   past_claims = 50
#' )
#'
#' calculate_insurance_retreat_score(test_data)

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
