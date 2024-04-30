#' Find the sample size
#'
#' This function takes either one or two samples of preliminary data (\code{x1}
#'  or \code{x2}) and return the minimum sample size needed for a t-test under
#'  conditions:
#'  (1) The function should calculate the minimum sample size required
#'  for a t-test under the null hypothesis
#'  (2) It should determine the sample size needed to achieve 80% power at a
#'  significance level of alpha = 0.05
#'
#' @details Returns minimum sample size needed for a t-test
#'
#'
#' @param x1 one sample of data
#' @param x2 two samples of data (optional)
#' @return The minimum sample size needed for a t-test
#' @examples
#' x1 <- rnorm(20)  # Example data for the first sample
#' x2 <- rnorm(30)  # Example data for the second sample

#' # Calculate the minimum sample size needed for a t-test
#' minimumN(x1 = x1, x2 = x2)
#' minimumN(x1 = x1)
#' @export
minimumN <- function(x1, x2 = NULL) {
  if (!is.null(x2)) {
    # Calculating minimum sample size for a two-sample t-test
    result <- pwr::pwr.t2n.test(n1 = length(x1), n2 = length(x2), sig.level = 0.05, power = 0.8)
    return(result$n1 + result$n2)  # Total sample size for two-sample t-test
  } else {
    # Calculating minimum sample size for a one-sample t-test
    result <- pwr::pwr.t.test(n = length(x1), sig.level = 0.05, power = 0.8)
    return(result$n)  # Sample size for one-sample t-test
  }
}

