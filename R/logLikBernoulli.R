#' Calculating paramter p
#'
#' This function takes in a vector of binary values to calculate parameter p
#'
#' @details calculates the parameter p that maximizes the log-likelihood log(P(p|data))
#' using a grid-based search with p in steps of 0.001
#'
#' @param data vector of binary values
#' @return The parameter p that maximizes the log-likelihood
#' @examples
#' data <- c(1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0)
#' logLikBernoulli(data)
#'
#' @export

logLikBernoulli <- function(data){
  # Calculating likelihood using formula for Bernoulli distribution
  log_likelihood <- function(p, data) {
    likelihood <- sum(data * log(p) + (1 - data) * log(1 - p))
    return(likelihood)
  }

  # Generating a sequence of probabilities ranging from 0.001 to 0.999 with a step of 0.001
  p_values <- seq(0.001, 0.999, by = 0.001)

  # Calculating the log likelihood for each probability in the sequence using the log_likelihood() function
  likelihoods <- sapply(p_values, function(p) log_likelihood(p, data))

  # Finding the maximum likelihood value and corresponding p
  best_likelihood <- max(likelihoods)
  best_p <- p_values[which(likelihoods == best_likelihood)]

  return(best_p)
}
