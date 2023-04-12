#' Generate a nested exchangeable correlation matrix
#'
#' This function generates a nested exchangeable correlation matrix R.
#'
#' @param cor_within The within-period correlation
#' @param cor_between The between-period correlation
#' @param n_periods The number of time periods
#' @param n_in_period A vector of length n_periods containing the number of  in each time period
#'
#' @return A nested exchangeable correlation matrix R
#'
#' @examples
#' # Generate a 3-block nested exchangeable correlation matrix with 2, 3, and 4 variables in each block
#' R <- nested_exchangeable(cor_within = 0.5, cor_between = 0.5, n_periods = 3, n_in_period = c(2, 3, 4))
#'
#' @export
nested_exchangeable <- function(cor_within, cor_between, n_periods, n_in_period) {

  # Check inputs
  if (!is.numeric(cor_within) || !is.numeric(cor_between) || !is.numeric(n_periods) || !is.numeric(n_in_period)) {
    stop("All inputs must be numeric.")
  }
  if (length(cor_within) != 1 || length(cor_between) != 1 || length(n_periods) != 1 || length(n_in_period) != n_periods) {
    stop("Input lengths are incorrect.")
  }
  if (cor_within < 0 || cor_within > 1 || cor_between < 0 || cor_between > 1) {
    stop("Correlation values must be between 0 and 1.")
  }
  if (cor_within + cor_between != 1){
    stop("Within and between correlations must sum to 1")
  }
  if (n_periods < 1) {
    stop("n_periods must be at least 1.")
  }
  if (any(n_in_period < 1)) {
    stop("All elements of n_in_period must be at least 1.")
  }

  # Calculate the correlation matrix R
  blockR <-  matrix(1, nrow = n_in_period[1], ncol=n_in_period[1])
  for (j1 in 1:n_periods) {
    for (j2 in j1:n_periods) {
      blockR[j1, j2] <- blockR[j2, j1] <- cor_between
    }
  }
  R <- cor_within * kronecker(diag(n_periods), blockR) + (1 - cor_within) * diag(sum(n_in_period))

  return(R)
}


.nested_exchangeable_check_inputs <- function(cor_within, cor_between, n_periods, n_in_period){

}


